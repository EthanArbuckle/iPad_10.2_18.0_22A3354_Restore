uint64_t sub_1C8946524(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t sub_1C8946538(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  sub_1C894880C(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

double sub_1C8946578(uint64_t a1, float *a2)
{
  uint64_t v3;
  float v4;
  uint64_t v5;
  float v6;
  double result;
  uint64_t v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _DWORD v16[7];
  uint8_t buf[4];
  int v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v3 = 0;
  v31 = *MEMORY[0x1E0C80C00];
  v4 = *a2;
  v5 = *(_QWORD *)(a1 + 32);
  *(float *)(v5 + 564) = *a2;
  v6 = a2[1];
  *(_QWORD *)(v5 + 572) = *(_QWORD *)(v5 + 356);
  *(float *)(v5 + 568) = v6;
  *(float *)(v5 + 560) = v4 * v6;
  *(_DWORD *)(v5 + 580) = *(_DWORD *)(v5 + 556);
  v16[0] = *(_DWORD *)(v5 + 320);
  do
  {
    v16[v3 + 1] = *(_DWORD *)(v5 + 560 + v3 * 4);
    ++v3;
  }
  while (v3 != 6);
  sub_1C8947868(3, v16, 28);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_DWORD *)(v8 + 320);
    v10 = *(float *)(v8 + 560);
    v11 = *(float *)(v8 + 564);
    v12 = *(float *)(v8 + 568);
    v13 = *(float *)(v8 + 572);
    v14 = *(float *)(v8 + 576);
    v15 = *(float *)(v8 + 580);
    *(_DWORD *)buf = 67110656;
    v18 = v9;
    v19 = 2048;
    v20 = v10;
    v21 = 2048;
    v22 = v11;
    v23 = 2048;
    v24 = v12;
    v25 = 2048;
    v26 = v13;
    v27 = 2048;
    v28 = v14;
    v29 = 2048;
    v30 = v15;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - PostNotification: (display: %d, brightness: %f, backlight: %f, edrScaling: %f, maxLuminance: %f, ambientIlluminance: %f, brightnessScaler: %f)\n", buf, 0x44u);
  }
  return result;
}

void sub_1C89466F0(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  double *v16;
  double *v17;
  uint64_t *v18;
  double *v19;
  double *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  ++qword_1ED83AA60;
  v3 = sub_1C8947E5C();
  v7 = *(double *)(a1 + 40);
  v6 = (double *)(a1 + 40);
  v8 = v7;
  v9 = v3 - v7;
  if (v3 - v7 > 0.0)
  {
    v10 = ++qword_1ED83AA70;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "ScheduleSetBrightnessIn_block_invoke";
      v31 = 2048;
      v32 = v9;
      v33 = 2048;
      v34 = v10;
      v35 = 2048;
      v36 = qword_1ED83AA60;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: enter WaitUntil late %f millisecond (%llu / %llu)", buf, 0x2Au);
      v8 = *v6;
    }
  }
  sub_1C8948A48(v8, v4, v5);
  v11 = sub_1C8947E5C() - *v6;
  if (v11 > 1.0)
  {
    v12 = ++qword_1ED83AA68;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 136315906;
    v30 = "ScheduleSetBrightnessIn_block_invoke";
    v31 = 2048;
    v32 = v11;
    v33 = 2048;
    v34 = v12;
    v35 = 2048;
    v36 = qword_1ED83AA60;
    v13 = MEMORY[0x1E0C81028];
    v14 = "%s: exit WaitUntil late %f millisecond (%llu / %llu)";
    goto LABEL_10;
  }
  if (v11 < -0.100000001)
  {
    v15 = ++qword_1EF8FE510;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "ScheduleSetBrightnessIn_block_invoke";
      v31 = 2048;
      v32 = -v11;
      v33 = 2048;
      v34 = v15;
      v35 = 2048;
      v36 = qword_1ED83AA60;
      v13 = MEMORY[0x1E0C81028];
      v14 = "%s: exit WaitUntil early %f millisecond (%llu / %llu)";
LABEL_10:
      _os_log_impl(&dword_1C8945000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x2Au);
    }
  }
LABEL_11:
  std::mutex::lock((std::mutex *)(v2 + 136));
  v16 = sub_1C8948940((_QWORD *)(v2 + 256), v6);
  v18 = (uint64_t *)v16;
  v19 = v17;
  if (v16 != v17)
  {
    v20 = v16;
    while (!*((_BYTE *)v20 + 24))
    {
      v20 = *(double **)v20;
      if (v20 == v17)
        goto LABEL_24;
    }
    if (v20 == v17)
    {
      do
      {
LABEL_24:
        v28 = *v18;
        sub_1C8946538((_QWORD *)(v2 + 256), v18);
        v18 = (uint64_t *)v28;
      }
      while ((double *)v28 != v19);
      goto LABEL_25;
    }
    do
    {
      v21 = *v18;
      sub_1C8946538((_QWORD *)(v2 + 256), v18);
      v18 = (uint64_t *)v21;
    }
    while ((double *)v21 != v19);
    if (*(_QWORD *)(v2 + 128))
    {
      sub_1C8947DC0((_BYTE *)v2);
      v22 = sub_1C8947E5C();
      (*(void (**)(void))(*(_QWORD *)(v2 + 128) + 16))();
      v23 = sub_1C8947E5C() - v22;
      if (v23 > 1.0)
      {
        v24 = ++qword_1ED83AA78;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v30 = "ScheduleSetBrightnessIn_block_invoke";
          v31 = 2048;
          v32 = v23;
          v33 = 2048;
          v34 = v24;
          v35 = 2048;
          v36 = qword_1ED83AA60;
          _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: callback takes %f millisecond (%llu / %llu)", buf, 0x2Au);
        }
      }
    }
    sub_1C8948708(v2);
    v26 = v25;
    if (v25 > 0.0)
    {
      v27 = sub_1C8947E5C();
      sub_1C894835C(v2, v26 + v27);
    }
  }
LABEL_25:
  std::condition_variable::notify_all((std::condition_variable *)(v2 + 208));
  std::mutex::unlock((std::mutex *)(v2 + 136));
}

void sub_1C8946AC0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  std::mutex *v11;
  void *v14;
  uint64_t v15;
  _QWORD *exception;

  std::mutex::unlock(v11);
  if (a2 == 1)
  {
    v14 = __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v15 = (*(uint64_t (**)(void *))(*(_QWORD *)v14 + 16))(v14);
      LODWORD(buf) = 136315394;
      *(_QWORD *)((char *)&buf + 4) = "ScheduleSetBrightnessIn_block_invoke";
      WORD6(buf) = 2080;
      *(_QWORD *)((char *)&buf + 14) = v15;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: exception %s", (uint8_t *)&buf, 0x16u);
    }
    sub_1C8948AB8();
    exception = __cxa_allocate_exception(8uLL);
    *exception = MEMORY[0x1E0DE5060] + 16;
    __cxa_throw(exception, MEMORY[0x1E0DE4EB0], MEMORY[0x1E0DE4DD0]);
  }
  _Unwind_Resume(a1);
}

void sub_1C8946BD0(int a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  float *v7;
  char v8;
  float v9;
  BOOL v10;
  float *v11;
  float *v12;
  BOOL v13;
  float v14;
  float v15;
  float v16;
  uint64_t i;
  float v18;
  uint64_t j;
  float v20;
  float v21;
  float v22;
  double v23;
  std::mutex *v24;
  char v25;
  int v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = a1;
  v24 = (std::mutex *)qword_1ED83AAC0;
  v25 = 1;
  std::mutex::lock((std::mutex *)qword_1ED83AAC0);
  v4 = sub_1C8947738(a1);
  if (!v4)
    goto LABEL_46;
  v5 = v4;
  v6 = (_DWORD *)(v4 + 376);
  memset_pattern16((void *)(v4 + 376), &unk_1C8956EB0, 0x18uLL);
  if (*(_QWORD *)(v5 + 312))
  {
    v7 = *(float **)(v5 + 296);
    if (v7 == (float *)(v5 + 304))
      goto LABEL_14;
    v8 = 0;
    v9 = 1.0;
    do
    {
      v10 = v7[10] >= 0.000001 && v9 > v7[10];
      if (v10)
        v9 = v7[10];
      v11 = (float *)*((_QWORD *)v7 + 1);
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = *(float **)v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (float *)*((_QWORD *)v7 + 2);
          v13 = *(_QWORD *)v12 == (_QWORD)v7;
          v7 = v12;
        }
        while (!v13);
      }
      v8 |= v10;
      v7 = v12;
    }
    while (v12 != (float *)(v5 + 304));
    if ((v8 & 1) == 0)
LABEL_14:
      v9 = *(float *)(v5 + 324);
  }
  else
  {
    *(_DWORD *)(v5 + 340) = *(_DWORD *)(v5 + 324);
    v9 = 0.0;
  }
  v14 = (float)(*(float *)(v5 + 364) * *(float *)(v5 + 556)) / *(float *)(v5 + 356);
  *(float *)(v5 + 380) = v14;
  v15 = 0.000001;
  if (v14 < 0.000001 || (v15 = 1.0, v14 > 1.0))
    *(float *)(v5 + 380) = v15;
  *(float *)(v5 + 384) = v9;
  v16 = *(float *)(v5 + 324);
  *(float *)(v5 + 376) = v16;
  *(_DWORD *)(v5 + 388) = *(_DWORD *)(v5 + 444);
  if (*(_BYTE *)(v5 + 400))
    *(_DWORD *)(v5 + 392) = 1065353216;
  if (*(_BYTE *)(v5 + 368))
    *(_DWORD *)(v5 + 396) = 1065353216;
  for (i = 380; i != 400; i += 4)
  {
    if (v16 < *(float *)(v5 + i))
    {
      v16 = *(float *)(v5 + i);
      v6 = (_DWORD *)(v5 + i);
    }
  }
  *(_DWORD *)(v5 + 340) = *v6;
  *(_DWORD *)(v5 + 372) = 897988541;
  v18 = 0.000001;
  for (j = 376; j != 400; j += 4)
  {
    if (j != 388)
    {
      v20 = *(float *)(v5 + j);
      if (v20 > v18)
      {
        *(float *)(v5 + 372) = v20;
        v18 = v20;
      }
    }
  }
  v21 = sub_1C89476D4(v5);
  *(float *)(v5 + 372) = fmaxf(*(float *)(v5 + 372), v21 * v22);
  if (*(_QWORD *)(v5 + 312))
  {
    if ((sub_1C89482D4(v5) & 1) == 0)
    {
      sub_1C8948DDC(v5, 1);
      sub_1C8947F34((uint64_t)&v24);
      sub_1C8947868(1, &v26, 4);
      if (*(_BYTE *)(v5 + 552))
      {
        if (!sub_1C895024C(v26))
        {
          if (*(_BYTE *)(v5 + 440))
          {
            sub_1C895038C(v26, 1);
            if (sub_1C895024C(v26))
              sub_1C8950508(v26);
          }
        }
      }
    }
  }
  else if (sub_1C89482D4(v5))
  {
    sub_1C8948DDC(v5, 0);
    sub_1C8947F34((uint64_t)&v24);
    sub_1C8947868(2, &v26, 4);
    if (*(_BYTE *)(v5 + 552))
    {
      if (sub_1C895024C(v26))
      {
        sub_1C894AA74(v26);
        sub_1C895038C(v26, 0);
      }
    }
  }
  sub_1C894827C(v5, 1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v23 = *(float *)(v5 + 340);
    *(_DWORD *)buf = 136315394;
    v28 = "EDRServerUpdateMinScalingFactor";
    v29 = 2048;
    v30 = v23;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s min scaling factor set to: %f\n", buf, 0x16u);
  }
  sub_1C8947F74(v5, a2, *(float *)(v5 + 340));
  if (v25)
LABEL_46:
    std::mutex::unlock(v24);
}

void sub_1C8946F54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, char a11)
{
  if (a11)
    std::mutex::unlock(a10);
  _Unwind_Resume(exception_object);
}

void sub_1C8946F70(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  std::mutex *v8;
  unsigned int v9;
  _QWORD *v10;
  unsigned int *v11;
  uint64_t v12;
  _QWORD *v13;
  unsigned int v14;
  BOOL v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t **v18;
  _QWORD *v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  BOOL v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  unsigned int v32;
  BOOL v33;
  uint64_t *v34;
  const char *v35;
  NSObject *v36;
  const char *v37;
  uint32_t v38;
  uint64_t v39;
  uint64_t v40;
  float *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _QWORD v48[4];
  id v49;
  int v50;
  _BYTE buf[18];
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  double v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = *(std::mutex **)(a1 + 32);
  std::mutex::lock(v8);
  v9 = 0;
  if (a3 && a4 >= 4)
    v9 = *a3;
  v10 = *(_QWORD **)(a1 + 32);
  if ((_DWORD)a2 == 3)
  {
    v11 = a3 + 1;
    v12 = v10[12];
    if (!v12)
      goto LABEL_16;
    v13 = v10 + 12;
    do
    {
      v14 = *(_DWORD *)(v12 + 32);
      v15 = v14 >= v9;
      if (v14 >= v9)
        v16 = (uint64_t *)v12;
      else
        v16 = (uint64_t *)(v12 + 8);
      if (v15)
        v13 = (_QWORD *)v12;
      v12 = *v16;
    }
    while (*v16);
    if (v13 != v10 + 12 && v9 >= *((_DWORD *)v13 + 8))
    {
      v39 = 0;
      v40 = v13[5];
      do
      {
        *(_DWORD *)(v40 + v39 * 4) = v11[v39];
        ++v39;
      }
      while (v39 != 6);
    }
    else
    {
LABEL_16:
      v17 = operator new[]();
      *(_OWORD *)v17 = *(_OWORD *)v11;
      *(_QWORD *)(v17 + 16) = *((_QWORD *)v11 + 2);
      v18 = (uint64_t **)(*(_QWORD *)(a1 + 32) + 88);
      *(_QWORD *)buf = v9;
      *(_QWORD *)&buf[8] = v17;
      sub_1C89525B0(v18, (unsigned int *)buf, (uint64_t)buf);
      v10 = *(_QWORD **)(a1 + 32);
    }
  }
  v19 = (_QWORD *)v10[8];
  if (v19 != v10 + 9)
  {
    v20 = MEMORY[0x1E0C809B0];
    do
    {
      if (sub_1C89477C8(*((_DWORD *)v19 + 8)) == v9)
      {
        v21 = (void (**)(_QWORD, _QWORD))v19[6];
        if (v19[7])
        {
          v22 = _Block_copy(v21);
          v23 = v19[7];
          v48[0] = v20;
          v48[1] = 3221225472;
          v48[2] = sub_1C8946524;
          v48[3] = &unk_1E82014B8;
          v49 = v22;
          v50 = a2;
          v24 = v22;
          dispatch_async(v23, v48);

        }
        else
        {
          v21[2](v21, a2);
        }
      }
      v25 = (_QWORD *)v19[1];
      if (v25)
      {
        do
        {
          v26 = v25;
          v25 = (_QWORD *)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (_QWORD *)v19[2];
          v27 = *v26 == (_QWORD)v19;
          v19 = v26;
        }
        while (!v27);
      }
      v10 = *(_QWORD **)(a1 + 32);
      v19 = v26;
    }
    while (v26 != v10 + 9);
  }
  if ((_DWORD)a2 != 3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_49;
    if (a2 > 5)
      v35 = "UnknownNotification";
    else
      v35 = off_1E82038E8[(int)a2];
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    v36 = MEMORY[0x1E0C81028];
    v37 = "libEDR - NotificationCallback: (type: %s, display: %d)\n";
    v38 = 18;
LABEL_48:
    _os_log_impl(&dword_1C8945000, v36, OS_LOG_TYPE_INFO, v37, buf, v38);
    goto LABEL_49;
  }
  v30 = v10[12];
  v28 = v10 + 12;
  v29 = v30;
  if (v30)
  {
    v31 = v28;
    do
    {
      v32 = *(_DWORD *)(v29 + 32);
      v33 = v32 >= v9;
      if (v32 >= v9)
        v34 = (uint64_t *)v29;
      else
        v34 = (uint64_t *)(v29 + 8);
      if (v33)
        v31 = (_QWORD *)v29;
      v29 = *v34;
    }
    while (*v34);
    if (v31 != v28 && v9 >= *((_DWORD *)v31 + 8))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_49;
      v41 = (float *)v31[5];
      v42 = *v41;
      v43 = v41[1];
      v44 = v41[2];
      v45 = v41[3];
      v46 = v41[4];
      v47 = v41[5];
      *(_DWORD *)buf = 136316930;
      *(_QWORD *)&buf[4] = "kEDRNotifyBrightness";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v9;
      v52 = 2048;
      v53 = v42;
      v54 = 2048;
      v55 = v43;
      v56 = 2048;
      v57 = v44;
      v58 = 2048;
      v59 = v45;
      v60 = 2048;
      v61 = v46;
      v62 = 2048;
      v63 = v47;
      v36 = MEMORY[0x1E0C81028];
      v37 = "libEDR - NotificationCallback: (type: %s, display: %d, brightness: %f, backlight: %f, edrScaler: %f, maxLumi"
            "nance: %f, ambientIlluminance: %f, brightnessScaler: %f)\n";
      v38 = 78;
      goto LABEL_48;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    sub_1C89562B0(v9);
LABEL_49:
  std::mutex::unlock(v8);
}

void sub_1C8947344(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void EDRServerSetDisplayBrightnessForDisplay(int a1, float a2, float a3, float a4, float a5)
{
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  BOOL v14;
  _BOOL4 v15;
  float v16;
  float v17;
  float v18;
  int v19;
  BOOL v20;
  unsigned __int8 v21;
  float v22;
  uint64_t v23;
  float v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _DWORD v32[7];
  std::mutex *v33;
  char v34;
  uint8_t buf[4];
  _BYTE v36[14];
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v33 = (std::mutex *)qword_1ED83AAC0;
  v34 = 1;
  std::mutex::lock((std::mutex *)qword_1ED83AAC0);
  v10 = sub_1C8947738(a1);
  if (!v10)
    goto LABEL_33;
  v11 = v10;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)v36 = "EDRServerSetDisplayBrightnessForDisplay";
    *(_WORD *)&v36[8] = 1024;
    *(_DWORD *)&v36[10] = a1;
    v37 = 2048;
    v38 = a2;
    v39 = 2048;
    v40 = a3;
    v41 = 2048;
    v42 = a4;
    v43 = 2048;
    v44 = a5;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: (display: %d, targetBrightness: %f, maxLuminance: %f, ambientIlluminance: %f, brightnessScaler: %f)\n", buf, 0x3Au);
  }
  v12 = *(float *)(v11 + 364);
  v13 = vabds_f32(v12, a2);
  v14 = v13 > 0.01 && (v12 < 0.01 || a2 < 0.01);
  v15 = v13 > 0.01;
  v16 = vabds_f32(*(float *)(v11 + 556), a5);
  v17 = 0.000001;
  v18 = vabds_f32(*(float *)(v11 + 356), a3);
  if (v16 > 0.000001)
    v15 = 1;
  *(float *)(v11 + 364) = a2;
  *(float *)(v11 + 356) = a3;
  *(float *)(v11 + 360) = a4;
  *(float *)(v11 + 556) = a5;
  v19 = v18 > 0.01 || v15;
  if (v19 == 1)
  {
    v20 = v16 <= 0.000001;
    if (v18 > 0.01)
      v20 = 0;
    v21 = *(float *)(v11 + 324) < 1.0 && v20;
    if ((float)(a2 / a3) >= 0.000001)
    {
      v17 = a2 / a3;
      if ((float)(a2 / a3) > 1.0)
        v17 = 1.0;
    }
    sub_1C894807C(v11, v21, v17);
  }
  v22 = sub_1C89476D4(v11);
  v23 = 0;
  *(_DWORD *)(v11 + 320) = a1;
  *(float *)(v11 + 560) = v22 * v24;
  *(float *)(v11 + 564) = v22;
  *(float *)(v11 + 568) = v24;
  *(_QWORD *)(v11 + 572) = *(_QWORD *)(v11 + 356);
  *(_DWORD *)(v11 + 580) = *(_DWORD *)(v11 + 556);
  v32[0] = a1;
  do
  {
    v32[v23 + 1] = *(_DWORD *)(v11 + 560 + v23 * 4);
    ++v23;
  }
  while (v23 != 6);
  if (v14)
    sub_1C894B298();
  sub_1C8947F34((uint64_t)&v33);
  if (v19)
    sub_1C8946BD0(a1, 1);
  sub_1C8947868(3, v32, 28);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v25 = *(_DWORD *)(v11 + 320);
    v26 = *(float *)(v11 + 560);
    v27 = *(float *)(v11 + 564);
    v28 = *(float *)(v11 + 568);
    v29 = *(float *)(v11 + 572);
    v30 = *(float *)(v11 + 576);
    v31 = *(float *)(v11 + 580);
    *(_DWORD *)buf = 67110656;
    *(_DWORD *)v36 = v25;
    *(_WORD *)&v36[4] = 2048;
    *(double *)&v36[6] = v26;
    v37 = 2048;
    v38 = v27;
    v39 = 2048;
    v40 = v28;
    v41 = 2048;
    v42 = v29;
    v43 = 2048;
    v44 = v30;
    v45 = 2048;
    v46 = v31;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - PostNotification: (display: %d, brightness: %f, backlight: %f, edrScaling: %f, maxLuminance: %f, ambientIlluminance: %f, brightnessScaler: %f)\n", buf, 0x44u);
  }
  if (v34)
LABEL_33:
    std::mutex::unlock(v33);
}

void sub_1C89476AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13, char a14)
{
  std::mutex::unlock(a13);
  _Unwind_Resume(a1);
}

float sub_1C89476D4(uint64_t a1)
{
  std::mutex *v2;
  float v3;

  v2 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  v3 = sub_1C8947DC0((_BYTE *)a1);
  std::mutex::unlock(v2);
  return v3;
}

void sub_1C8947724(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C8947738(int a1)
{
  uint64_t result;
  uint64_t v3;

  if (a1 == -559038737)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      sub_1C8956158();
    return 0;
  }
  else
  {
    result = qword_1ED83AAB8;
    v3 = 16;
    while (*(_DWORD *)(result + 320) != a1)
    {
      result += 584;
      if (!--v3)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          sub_1C89561C8();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_1C89477C8(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  uint64_t *v6;
  _QWORD *v7;

  v1 = dword_1ED83AA58;
  if (qword_1ED83AB20)
  {
    v2 = *(_QWORD *)(qword_1ED83AB20 + 8);
    if (v2)
    {
      v3 = qword_1ED83AB20 + 8;
      do
      {
        v4 = *(_DWORD *)(v2 + 28);
        v5 = v4 >= a1;
        if (v4 >= a1)
          v6 = (uint64_t *)v2;
        else
          v6 = (uint64_t *)(v2 + 8);
        if (v5)
          v3 = v2;
        v2 = *v6;
      }
      while (*v6);
      if (v3 != qword_1ED83AB20 + 8 && *(_DWORD *)(v3 + 28) <= a1)
        return *(unsigned int *)(v3 + 32);
    }
  }
  else
  {
    v7 = (_QWORD *)operator new();
    v7[2] = 0;
    v7[1] = 0;
    *v7 = v7 + 1;
    qword_1ED83AB20 = (uint64_t)v7;
  }
  return v1;
}

uint64_t sub_1C8947868(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  char v14;
  int v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  int v20;
  int v21;
  int v22;

  v6 = sub_1C89479F4();
  v22 = a1;
  if (!v6)
    return 0xFFFFFFFFLL;
  if (a3 >= 0x21)
  {
    syslog(3, "EDR - %s: data size %d exceeds max data size %d\n", "post_notification", a3, 32);
    return 0xFFFFFFFFLL;
  }
  v9 = v6;
  sub_1C8947A7C(v6, a1, (uint64_t)a2, a3, 1);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v9 + 232));
  v21 = 0;
  v10 = sub_1C895410C((_QWORD *)(v9 + 40), &v21);
  if (v10 == v11)
  {
    v7 = 0;
    v14 = 0;
  }
  else
  {
    v12 = v10;
    v13 = v11;
    v14 = 0;
    LODWORD(v7) = 0;
    do
    {
      v15 = sub_1C8953B40(*((unsigned int *)v12 + 9), a1, a2, a3, 0);
      v14 |= v15 == 1;
      if (v15)
        v7 = 0xFFFFFFFFLL;
      else
        v7 = v7;
      v12 = (uint64_t *)*v12;
    }
    while (v12 != v13);
  }
  v16 = sub_1C895410C((_QWORD *)(v9 + 40), &v22);
  if (v16 != v17)
  {
    v18 = v16;
    v19 = v17;
    do
    {
      v20 = sub_1C8953B40(*((unsigned int *)v18 + 9), a1, a2, a3, 0);
      v14 |= v20 == 1;
      if (v20)
        v7 = 0xFFFFFFFFLL;
      else
        v7 = v7;
      v18 = (uint64_t *)*v18;
    }
    while (v18 != v19);
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)(v9 + 232));
  if ((v14 & 1) != 0)
    sub_1C8954510(v9);
  return v7;
}

uint64_t sub_1C89479F4()
{
  unsigned __int8 v0;
  uint64_t v2;
  uint64_t v3;

  v0 = atomic_load((unsigned __int8 *)&qword_1ED83AAB0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83AAB0))
  {
    v2 = operator new();
    sub_1C8954480(v2);
    qword_1ED83CB80 = v3;
    __cxa_guard_release(&qword_1ED83AAB0);
  }
  return qword_1ED83CB80;
}

void sub_1C8947A64(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1ED83AAB0);
  _Unwind_Resume(a1);
}

uint64_t sub_1C8947A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  pthread_rwlock_t *v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v25[4];
  __int128 v26[4];
  int v27;
  int v28;

  v28 = a2;
  v10 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 232));
  v11 = (_QWORD *)(a1 + 192);
  v27 = 0;
  v12 = sub_1C8954618(v11, &v27);
  if (v12 != v13)
  {
    v14 = v12;
    v15 = v13;
    do
    {
      v16 = *(_OWORD *)(v14 + 5);
      v26[0] = *(_OWORD *)(v14 + 3);
      v26[1] = v16;
      v17 = *(_OWORD *)(v14 + 9);
      v26[2] = *(_OWORD *)(v14 + 7);
      v26[3] = v17;
      sub_1C8947C48(v26, a2, a3, a4, a5);
      v14 = (uint64_t *)*v14;
    }
    while (v14 != v15);
  }
  v18 = sub_1C8954618(v11, &v28);
  if (v18 != v19)
  {
    v20 = v18;
    v21 = v19;
    do
    {
      v22 = *(_OWORD *)(v20 + 5);
      v25[0] = *(_OWORD *)(v20 + 3);
      v25[1] = v22;
      v23 = *(_OWORD *)(v20 + 9);
      v25[2] = *(_OWORD *)(v20 + 7);
      v25[3] = v23;
      sub_1C8947C48(v25, a2, a3, a4, a5);
      v20 = (uint64_t *)*v20;
    }
    while (v20 != v21);
  }
  return pthread_rwlock_unlock(v10);
}

uint64_t *sub_1C8947B94(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

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
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

void sub_1C8947C48(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, _QWORD);
  _QWORD v14[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  int v21;

  if ((a5 & 1) != 0 || !*((_BYTE *)a1 + 56))
  {
    v9 = *(NSObject **)a1;
    if (*(_QWORD *)a1)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 0x40000000;
      v14[2] = sub_1C8954660;
      v14[3] = &unk_1E82039C8;
      v10 = a1[1];
      v15 = *a1;
      v16 = v10;
      v11 = a1[3];
      v17 = a1[2];
      v18 = v11;
      v19 = a3;
      v20 = a2;
      v21 = a4;
      dispatch_sync(v9, v14);
    }
    else
    {
      v12 = *((_QWORD *)a1 + 2);
      if (v12)
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v12 + 16))(v12, a2, a3, a4, *((_QWORD *)a1 + 4));
      v13 = (void (*)(uint64_t, uint64_t, uint64_t, _QWORD))*((_QWORD *)a1 + 5);
      if (v13)
        v13(a2, a3, a4, *((_QWORD *)a1 + 6));
    }
  }
}

_BYTE *sub_1C8947D2C(_BYTE *result)
{
  _BYTE *v1;
  double v2;

  v1 = result;
  if (*result)
  {
    v2 = sub_1C8947E5C();
    return (_BYTE *)sub_1C8947EC8((uint64_t)(v1 + 80), v2);
  }
  return result;
}

float sub_1C8947DC0(_BYTE *a1)
{
  double v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;

  v2 = sub_1C8947E5C();
  sub_1C8947EC8((uint64_t)(a1 + 32), v2);
  v4 = v3;
  if (a1[1])
    sub_1C8947EC8((uint64_t)(a1 + 80), v2);
  else
    sub_1C8947D2C(a1);
  v6 = 0.000001;
  v7 = 0.000001;
  if (v4 >= 0.000001)
  {
    v7 = 1.0;
    if (v4 <= 1.0)
      v7 = v4;
  }
  if (v5 >= 0.000001)
  {
    v6 = 1.0;
    if (v5 <= 1.0)
      v6 = v5;
  }
  if (v6 < v7)
    v6 = v7;
  return v7 / v6;
}

double sub_1C8947E5C()
{
  unsigned int v0;
  unint64_t v1;

  if (qword_1ED83CB90 != -1)
    dispatch_once(&qword_1ED83CB90, &unk_1E8201408);
  v0 = qword_1ED83CB88;
  v1 = HIDWORD(qword_1ED83CB88);
  return (double)(mach_absolute_time() * v0 / v1) / 1000000.0;
}

uint64_t sub_1C8947EC8(uint64_t result, double a2)
{
  uint64_t (*v2)(float, float, float);
  double v3;
  double v4;
  float v6;
  float v7;
  float v8;

  v2 = *(uint64_t (**)(float, float, float))(result + 32);
  if (!v2)
    sub_1C89566FC();
  v3 = *(double *)(result + 8);
  v4 = *(double *)(result + 16);
  if (v3 > a2)
    a2 = *(double *)(result + 8);
  if (v4 != 0.0 && a2 <= v3 + v4)
  {
    v6 = a2 - v3;
    v7 = v4;
    if (v4 >= v6)
      v7 = v6;
    v8 = v7 / v4;
    return v2(*(float *)result, *(float *)(result + 4), v8);
  }
  return result;
}

void sub_1C8947F34(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
  {
    std::mutex::unlock(*(std::mutex **)a1);
    *(_BYTE *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    sub_1C8947F74();
  }
}

void sub_1C8947F74(uint64_t a1, char a2, float a3)
{
  std::mutex *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;

  v6 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  *(_BYTE *)(a1 + 1) = a2;
  v7 = 0.001;
  if (a3 >= 0.001)
    v7 = a3;
  *(float *)(a1 + 4) = v7;
  if (v7 >= 0.5)
  {
    v9 = 1.0;
    v10 = 1.0 - v7;
    v11 = 0.0;
    v12 = v7;
  }
  else
  {
    v8 = 0.5 - v7 + 0.5 - v7;
    v9 = (float)(v7 * -2.0) / (float)(v8 + -1.0);
    v10 = (float)(1.0 - v8) / (float)(v9 + v9);
    v11 = (float)(v9 * v8) / (float)(v8 + -1.0);
    v12 = (float)(v9 + (float)((float)(v8 * -2.0) * v9)) / (float)((float)(v8 * -2.0) + 2.0);
  }
  *(float *)(a1 + 8) = v10;
  *(float *)(a1 + 12) = v11;
  *(float *)(a1 + 16) = v12;
  *(float *)(a1 + 20) = v9;
  if (*(_BYTE *)(a1 + 26))
    sub_1C8948E3C(a1, v7);
  std::mutex::unlock(v6);
}

void sub_1C8948068(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C894807C(uint64_t a1, unsigned __int8 a2, float a3)
{
  std::mutex *v6;
  float v7;
  float v8;
  float v9;
  double v10;

  v6 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  if (vabds_f32(a3, sub_1C8948274(a1 + 32)) >= 0.000001)
  {
    v7 = sub_1C8947DC0((_BYTE *)a1);
    v9 = v8;
    nullsub_1(a1 + 32);
    v10 = 0.0;
    if (((*(_BYTE *)(a1 + 26) != 0) & a2) != 0)
      v10 = 100.0;
    sub_1C8948344(a1 + 32, v7 * v9, a3, v10);
    sub_1C894831C(a1 + 32);
    sub_1C89486B8(a1);
  }
  std::mutex::unlock(v6);
}

void sub_1C8948174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  std::mutex *v9;
  void *v12;
  uint64_t v13;
  _QWORD *exception;

  std::mutex::unlock(v9);
  if (a2 == 1)
  {
    v12 = __cxa_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v13 = (*(uint64_t (**)(void *))(*(_QWORD *)v12 + 16))(v12);
      LODWORD(a9) = 136315394;
      *(_QWORD *)((char *)&a9 + 4) = "SetBrightness";
      WORD6(a9) = 2080;
      *(_QWORD *)((char *)&a9 + 14) = v13;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: exception %s", (uint8_t *)&a9, 0x16u);
    }
    sub_1C8948AB8();
    exception = __cxa_allocate_exception(8uLL);
    *exception = MEMORY[0x1E0DE5060] + 16;
    __cxa_throw(exception, MEMORY[0x1E0DE4EB0], MEMORY[0x1E0DE4DD0]);
  }
  _Unwind_Resume(a1);
}

float sub_1C8948274(uint64_t a1)
{
  return *(float *)(a1 + 4);
}

void sub_1C894827C(uint64_t a1, char a2)
{
  std::mutex *v4;

  v4 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  *(_BYTE *)(a1 + 25) = a2;
  sub_1C89482DC(a1);
  std::mutex::unlock(v4);
}

void sub_1C89482C0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C89482D4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 26);
}

void sub_1C89482DC(uint64_t a1)
{
  int v1;
  float v2;

  if (*(_BYTE *)(a1 + 24))
  {
    v1 = *(unsigned __int8 *)(a1 + 25);
    if (*(unsigned __int8 *)(a1 + 26) == v1)
      return;
    *(_BYTE *)(a1 + 26) = v1;
    if (v1)
    {
      v2 = *(float *)(a1 + 4);
LABEL_5:
      sub_1C8948E3C(a1, v2);
      return;
    }
LABEL_8:
    v2 = 1.0;
    goto LABEL_5;
  }
  if (*(_BYTE *)(a1 + 26))
  {
    *(_BYTE *)(a1 + 26) = 0;
    goto LABEL_8;
  }
}

void sub_1C894831C(uint64_t a1)
{
  *(double *)(a1 + 8) = sub_1C8947E5C();
}

double sub_1C8948344(uint64_t a1, float a2, float a3, double a4)
{
  double result;

  *(float *)a1 = a2;
  *(float *)(a1 + 4) = a3;
  result = a4 / *(float *)(a1 + 24);
  *(double *)(a1 + 16) = result;
  return result;
}

void sub_1C894835C(uint64_t a1, double a2)
{
  NSObject *global_queue;
  _QWORD v5[6];
  _QWORD v6[2];

  if (!*(_BYTE *)(a1 + 200))
  {
    *(double *)v6 = a2;
    v6[1] = 1;
    sub_1C89483F4((_QWORD *)(a1 + 256), (uint64_t)v6);
    global_queue = dispatch_get_global_queue(2, 0);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 0x40000000;
    v5[2] = sub_1C89466F0;
    v5[3] = &unk_1E8201428;
    v5[4] = a1;
    *(double *)&v5[5] = a2;
    dispatch_async(global_queue, v5);
  }
}

_QWORD *sub_1C89483F4(_QWORD *a1, uint64_t a2)
{
  void *v4;
  _QWORD *v5;
  double v6;
  unint64_t v7;
  _QWORD *v8;

  v4 = operator new(0x20uLL);
  v5 = v4;
  v6 = *(double *)a2;
  *((_QWORD *)v4 + 2) = *(_QWORD *)a2;
  *((_BYTE *)v4 + 24) = *(_BYTE *)(a2 + 8);
  if (v6 == 0.0)
    v7 = 0;
  else
    v7 = *(_QWORD *)&v6;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = v7;
  v8 = (_QWORD *)sub_1C894847C((uint64_t)a1, v7, (double *)v4 + 2);
  sub_1C89485D0(a1, v5, v8);
  return v5;
}

void sub_1C8948468(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C894847C(uint64_t a1, unint64_t a2, double *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  _BOOL8 v10;
  size_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t result;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  int v22;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 2 * v6;
    v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    v11 = v10 | v9;
    v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    sub_1C8949218(a1, v13);
    v6 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = a2;
    if (v6 <= a2)
      v15 = a2 % v6;
  }
  else
  {
    v15 = (v6 - 1) & a2;
  }
  v16 = *(_QWORD *)(*(_QWORD *)a1 + 8 * v15);
  if (!v16)
    return 0;
  v17 = 0;
  do
  {
    result = v16;
    v16 = *(_QWORD *)v16;
    if (!v16)
      break;
    v19 = *(_QWORD *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      v20 = *(_QWORD *)(v16 + 8);
      if (v19 >= v6)
        v20 = v19 % v6;
    }
    else
    {
      v20 = v19 & (v6 - 1);
    }
    if (v20 != v15)
      break;
    v21 = v19 == a2 && *(double *)(v16 + 16) == *a3;
    v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

_QWORD *sub_1C89485D0(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

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
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_1C89486B8(uint64_t a1)
{
  uint64_t *i;
  double v3;
  double v4;

  for (i = *(uint64_t **)(a1 + 272); i; i = (uint64_t *)*i)
    *((_BYTE *)i + 24) = 0;
  sub_1C8948708(a1);
  v4 = v3 + sub_1C8947E5C();
  sub_1C894835C(a1, v4);
}

uint64_t sub_1C8948708(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = a1 + 32;
  if (sub_1C89487DC(a1 + 32))
  {
    result = sub_1C89487DC(a1 + 80);
    if ((_DWORD)result)
    {
      *(_BYTE *)(a1 + 1) = 0;
      return result;
    }
  }
  if (sub_1C89487DC(v2) || !sub_1C89487DC(a1 + 80))
  {
    if (!sub_1C89487DC(v2) || sub_1C89487DC(a1 + 80))
    {
      sub_1C8955FCC(v2);
      return sub_1C8955FCC(a1 + 80);
    }
    v4 = a1 + 80;
  }
  else
  {
    *(_BYTE *)(a1 + 1) = 0;
    v4 = v2;
  }
  return sub_1C8955FCC(v4);
}

BOOL sub_1C89487DC(uint64_t a1)
{
  return sub_1C8947E5C() >= *(double *)(a1 + 8) + *(double *)(a1 + 16);
}

_QWORD *sub_1C894880C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
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

double *sub_1C8948940(_QWORD *a1, double *a2)
{
  double *result;
  double *v4;

  result = sub_1C8948988(a1, a2);
  if (result)
  {
    v4 = result;
    do
      v4 = *(double **)v4;
    while (v4 && v4[2] == *a2);
  }
  return result;
}

double *sub_1C8948988(_QWORD *a1, double *a2)
{
  double v2;
  int8x8_t v3;
  uint8x8_t v4;
  double v5;
  double **v6;
  double *result;
  unint64_t v8;

  v2 = *a2;
  if (*a2 == 0.0)
    v2 = 0.0;
  v3 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v3)
    return 0;
  v4 = (uint8x8_t)vcnt_s8(v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = v2;
    if (*(_QWORD *)&v2 >= *(_QWORD *)&v3)
      *(_QWORD *)&v5 = *(_QWORD *)&v2 % *(_QWORD *)&v3;
  }
  else
  {
    *(_QWORD *)&v5 = (*(_QWORD *)&v3 - 1) & *(_QWORD *)&v2;
  }
  v6 = *(double ***)(*a1 + 8 * *(_QWORD *)&v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = *(double **)result)
  {
    v8 = *((_QWORD *)result + 1);
    if (v8 == *(_QWORD *)&v2)
    {
      if (result[2] == *a2)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v3)
          v8 %= *(_QWORD *)&v3;
      }
      else
      {
        v8 &= *(_QWORD *)&v3 - 1;
      }
      if (v8 != *(_QWORD *)&v5)
        return 0;
    }
  }
  return result;
}

uint64_t sub_1C8948A48(double a1, double a2, double a3)
{
  if (qword_1ED83CB90 != -1)
    dispatch_once(&qword_1ED83CB90, &unk_1E8201408);
  LODWORD(a2) = HIDWORD(qword_1ED83CB88);
  LODWORD(a3) = qword_1ED83CB88;
  return mach_wait_until((unint64_t)(a1
                                          * 1000000.0
                                          * (double)*(unint64_t *)&a2
                                          / (double)*(unint64_t *)&a3));
}

void sub_1C8948AB8()
{
  int v0;
  char **v1;
  char **v2;
  uint64_t v3;
  NSObject *v4;
  char *v5;
  uint8_t buf[4];
  char *v7;
  void *v8[2];
  __int128 v9;
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
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)v8 = 0u;
  v9 = 0u;
  v0 = backtrace(v8, 128);
  v1 = backtrace_symbols(v8, v0);
  if (v0 >= 1)
  {
    v2 = v1;
    v3 = v0;
    v4 = MEMORY[0x1E0C81028];
    do
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *v2;
        *(_DWORD *)buf = 136315138;
        v7 = v5;
        _os_log_impl(&dword_1C8945000, v4, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
      }
      ++v2;
      --v3;
    }
    while (v3);
  }
}

double sub_1C8948BF0(uint64_t a1, float a2, float a3, float a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a1;
  *(float *)(a1 + 4) = a4;
  v7 = a1 + 32;
  sub_1C8955FB4(a1 + 32, (uint64_t)sub_1C89490A0);
  sub_1C8955FBC(v7, (uint64_t)sub_1C89490D0);
  v6 += 80;
  sub_1C8955FB4(v6, (uint64_t)sub_1C8949154);
  sub_1C8955FBC(v6, (uint64_t)sub_1C8949184);
  sub_1C8948344(v7, a2 * a3, a2 * a3, 0.0);
  return sub_1C8948344(v6, a3, a3, 0.0);
}

uint64_t sub_1C8948C8C(uint64_t a1)
{
  uint8_t v3[16];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "libEDR - EDRDisplay::~EDRDisplay() - Enter\n", buf, 2u);
  }
  *(_BYTE *)(a1 + 200) = 1;
  sub_1C8948D60(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "libEDR - EDRDisplay::~EDRDisplay() - Exit\n", v3, 2u);
  }
  sub_1C89491A8(a1 + 256);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 208));
  std::mutex::~mutex((std::mutex *)(a1 + 136));
  return a1;
}

void sub_1C8948D60(uint64_t a1)
{
  std::unique_lock<std::mutex> v2;

  v2.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 136);
  v2.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 136));
  if (!*(_QWORD *)(a1 + 280))
    goto LABEL_4;
  do
    std::condition_variable::wait((std::condition_variable *)(a1 + 208), &v2);
  while (*(_QWORD *)(a1 + 280));
  if (v2.__owns_)
LABEL_4:
    std::mutex::unlock(v2.__m_);
}

void sub_1C8948DC8(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1C8948DDC(uint64_t a1, char a2)
{
  std::mutex *v4;

  v4 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  *(_BYTE *)(a1 + 24) = a2;
  sub_1C89482DC(a1);
  std::mutex::unlock(v4);
}

void sub_1C8948E20(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

_BYTE *sub_1C8948E34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void sub_1C8948E3C(uint64_t a1, float a2)
{
  uint64_t v4;
  double v5;
  float v6;
  float v7;
  float v8;
  double v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a1 + 80;
  v5 = sub_1C8947E5C();
  sub_1C8947EC8(v4, v5);
  v7 = v6;
  if (vabds_f32(v6, a2) >= 0.000001)
  {
    v8 = fabsf(log2f(v6 / a2));
    nullsub_1(v4);
    v9 = (float)(v8 * 1000.0);
    sub_1C8948344(v4, v7, a2, v9);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = "TransitionToEDRScalingFactor";
      v12 = 2048;
      v13 = v7;
      v14 = 2048;
      v15 = a2;
      v16 = 2048;
      v17 = v9;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "libEDR - %s: start = %f, stop = %f, duration = %f\n", (uint8_t *)&v10, 0x2Au);
    }
    sub_1C894831C(v4);
    sub_1C89486B8(a1);
  }
}

uint64_t sub_1C8948F88(uint64_t a1, float a2)
{
  return sub_1C8955FC4(a1 + 80, a2);
}

void sub_1C8948F90(float a1)
{
  dword_1EF8FE508 = LODWORD(a1);
}

void sub_1C8948F9C(float a1)
{
  dword_1ED83A9C8 = LODWORD(a1);
}

float sub_1C8948FA8(uint64_t a1)
{
  std::mutex *v2;
  float v3;

  v2 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  v3 = sub_1C8948274(a1 + 32);
  std::mutex::unlock(v2);
  return v3;
}

void sub_1C8948FF0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

double sub_1C8949004(uint64_t a1)
{
  std::mutex *v2;
  double v3;
  double v4;

  v2 = (std::mutex *)(a1 + 136);
  std::mutex::lock((std::mutex *)(a1 + 136));
  sub_1C8948708(a1);
  v4 = v3;
  std::mutex::unlock(v2);
  return v4;
}

void sub_1C894904C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C8949060(uint64_t a1, void *aBlock)
{
  const void *v2;

  v2 = *(const void **)(a1 + 128);
  *(_QWORD *)(a1 + 128) = _Block_copy(aBlock);
  if (v2)
    _Block_release(v2);
}

float sub_1C89490A0(float a1, float a2, float a3)
{
  float v3;
  float v4;
  float v5;
  float v6;

  if (a2 >= a1)
    v3 = a1;
  else
    v3 = a2;
  if (a2 < a1)
  {
    v4 = 1.0 - a3;
  }
  else
  {
    a1 = a2;
    v4 = a3;
  }
  v5 = sqrtf(v3);
  v6 = sqrtf(a1);
  return (float)(v5 + (float)(v4 * (float)(v6 - v5))) * (float)(v5 + (float)(v4 * (float)(v6 - v5)));
}

double sub_1C89490D0(float a1, float a2, double a3)
{
  float v4;
  float v5;
  float v6;

  if (a1 <= a2)
    v4 = a1;
  else
    v4 = a2;
  if (a1 <= a2)
    a1 = a2;
  if (v4 < 0.001)
    v4 = 0.001;
  if (a1 < 0.001)
    a1 = 0.001;
  v5 = *(float *)&dword_1EF8FE508 + *(float *)&dword_1EF8FE508;
  v6 = logf(a1 / v4);
  return a3 / ceilf(v6 / logf((float)(v5 + 100.0) / 100.0));
}

float sub_1C8949154(float a1, float a2, float a3)
{
  return powf(fabsf(a1 / a2), -a3) * a1;
}

double sub_1C8949184()
{
  return 1000.0 / (float)(*(float *)&dword_1ED83A9C8 * 30.0);
}

uint64_t sub_1C89491A8(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void sub_1C89491F0()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void sub_1C8949218(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      sub_1C89492F4(a1, prime);
  }
}

void sub_1C89492F4(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t **v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  uint64_t *i;
  unint64_t v12;
  uint64_t *v13;
  _QWORD *v14;

  if (a2)
  {
    if (a2 >> 61)
      sub_1C89491F0();
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
    v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      v8 = (unint64_t)v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      for (i = *v7; *v7; i = *v7)
      {
        v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2)
            v12 %= a2;
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          v7 = (uint64_t **)i;
        }
        else
        {
          v13 = i;
          if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
          {
            do
            {
              v14 = v13;
              v13 = (uint64_t *)*v13;
            }
            while (v13 && *((double *)i + 2) == *((double *)v13 + 2));
            *v7 = v13;
            *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
            v7 = (uint64_t **)i;
            v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void sub_1C8949464(uint64_t a1)
{
  float *v2;
  float v3;
  float v4;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  unsigned __int8 v13;
  int v14;
  int v15;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (sub_1C8949948(CFSTR("UseSimpleCurve"), 1) != 0.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "EDRServerContextInitialze";
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: UseSimpleCurve\n", buf, 0xCu);
    }
    sub_1C8948E34((_BYTE *)a1, 1);
  }
  v2 = (float *)(a1 + 324);
  v3 = sub_1C8949A58();
  v4 = sub_1C89499C8(CFSTR("MinEDRScalingFactorLimit"), v3);
  if (*(_DWORD *)(a1 + 320) != dword_1ED83AA58)
    v4 = 0.000001;
  *(float *)(a1 + 324) = v4;
  if (v4 < 0.000001 || v4 > 1.0)
    *v2 = sub_1C8949A58();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = *v2;
    *(_DWORD *)buf = 136315394;
    v18 = "EDRServerContextInitialze";
    v19 = 2048;
    v20 = v6;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: DefaultMinScalingFactor=%f\n", buf, 0x16u);
  }
  *(_DWORD *)(a1 + 372) = *(_DWORD *)(a1 + 324);
  v7 = sub_1C89499C8(CFSTR("RampingSpeedFactor"), 0.5);
  if (v7 <= 0.0)
    v7 = 0.5;
  *(float *)(a1 + 328) = v7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = *(float *)(a1 + 328);
    *(_DWORD *)buf = 136315394;
    v18 = "EDRServerContextInitialze";
    v19 = 2048;
    v20 = v8;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: DefaultRampingSpeedFactor=%f\n", buf, 0x16u);
  }
  v9 = sub_1C89499C8(CFSTR("BrightnessAnimationTimeStepFactor"), 1.0);
  if (v9 <= 0.0)
    v9 = 1.0;
  *(float *)(a1 + 332) = v9;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v10 = *(float *)(a1 + 332);
    *(_DWORD *)buf = 136315394;
    v18 = "EDRServerContextInitialze";
    v19 = 2048;
    v20 = v10;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: DefaultBrightnessAnimationTimeStepFactor=%f\n", buf, 0x16u);
  }
  v11 = sub_1C89499C8(CFSTR("TransitionAnimationTimeStepFactor"), 2.0);
  if (v11 <= 0.0)
    v11 = 2.0;
  *(float *)(a1 + 336) = v11;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v12 = *(float *)(a1 + 336);
    *(_DWORD *)buf = 136315394;
    v18 = "EDRServerContextInitialze";
    v19 = 2048;
    v20 = v12;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: DefaultTransitionAnimationTimeStepFactor=%f\n", buf, 0x16u);
  }
  *(_OWORD *)(a1 + 340) = *(_OWORD *)(a1 + 324);
  *(_DWORD *)(a1 + 356) = 1140457472;
  *(_QWORD *)(a1 + 360) = 0x43FA0000447A0000;
  *(_BYTE *)(a1 + 368) = 0;
  v13 = atomic_load((unsigned __int8 *)&qword_1ED83AA98);
  if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83AA98))
  {
    if (qword_1ED83CB58 != -1)
      dispatch_once(&qword_1ED83CB58, &unk_1E8201538);
    __cxa_guard_release(&qword_1ED83AA98);
  }
  *(_OWORD *)(a1 + 456) = xmmword_1ED83AA30;
  v14 = HIDWORD(xmmword_1ED83AA40);
  *(_OWORD *)(a1 + 472) = xmmword_1ED83AA40;
  v15 = dword_1ED83AA50;
  *(_DWORD *)(a1 + 488) = dword_1ED83AA50;
  *(_DWORD *)(a1 + 492) = v14;
  *(_DWORD *)(a1 + 496) = v15;
  *(_BYTE *)(a1 + 440) = sub_1C8949948(CFSTR("BIM"), 1) != 0.0;
  byte_1EF8FE518 = sub_1C8949948(CFSTR("BIMInfoLogging"), 0) != 0.0;
  *(float *)(a1 + 472) = sub_1C89499C8(CFSTR("DeltaFactor"), *(float *)(a1 + 472));
  *(float *)(a1 + 476) = sub_1C89499C8(CFSTR("MinutesPerStopMitigate"), *(float *)(a1 + 476));
  *(float *)(a1 + 480) = sub_1C89499C8(CFSTR("MinutesPerStopRecovery"), *(float *)(a1 + 480));
  *(float *)(a1 + 484) = sub_1C89499C8(CFSTR("FloatSbimAboveMax"), *(float *)(a1 + 484));
  *(float *)(a1 + 488) = sub_1C89499C8(CFSTR("SbimSustainMax"), *(float *)(a1 + 488));
  *(_DWORD *)(a1 + 444) = *(_DWORD *)(a1 + 324);
  *(_DWORD *)(a1 + 556) = 1065353216;
  sub_1C8948BF0(a1, 1.0, 1.0, 0.125);
  sub_1C8948F88(a1, *(float *)(a1 + 344));
  sub_1C8948F90(*(float *)(a1 + 348));
  sub_1C8948F9C(*(float *)(a1 + 352));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C8946578;
  aBlock[3] = &unk_1E8201448;
  aBlock[4] = a1;
  sub_1C8949060(a1, aBlock);
}

float sub_1C8949948(const __CFString *a1, _BOOL4 a2)
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;

  v3 = (const __CFBoolean *)CFPreferencesCopyValue(a1, CFSTR("com.apple.libEDR"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID())
      a2 = CFBooleanGetValue(v4) != 0;
    CFRelease(v4);
  }
  return (float)a2;
}

float sub_1C89499C8(const __CFString *a1, float a2)
{
  float v2;
  const __CFNumber *v3;
  const __CFNumber *v4;
  CFTypeID v5;
  float valuePtr;

  v2 = a2;
  valuePtr = a2;
  v3 = (const __CFNumber *)CFPreferencesCopyValue(a1, CFSTR("com.apple.libEDR"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID())
      CFNumberGetValue(v4, kCFNumberFloatType, &valuePtr);
    CFRelease(v4);
    return valuePtr;
  }
  return v2;
}

float sub_1C8949A58()
{
  unsigned __int8 v0;
  unsigned __int8 v1;
  int v3;
  const char *v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = atomic_load((unsigned __int8 *)&qword_1ED83AA88);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83AA88))
  {
    if (qword_1ED83CB58 != -1)
      dispatch_once(&qword_1ED83CB58, &unk_1E8201538);
    __cxa_guard_release(&qword_1ED83AA88);
  }
  v1 = atomic_load((unsigned __int8 *)&qword_1ED83AA90);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83AA90))
  {
    dword_1ED83CB40 = dword_1ED83AA18;
    __cxa_guard_release(&qword_1ED83AA90);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3 = 136315394;
    v4 = "MinScalingFactorByModel";
    v5 = 2048;
    v6 = *(float *)&dword_1ED83CB40;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: min scaling value=%f\n", (uint8_t *)&v3, 0x16u);
  }
  return *(float *)&dword_1ED83CB40;
}

void EDRServerStartService()
{
  uint64_t v0;
  dispatch_queue_t v1;
  void *v2;
  _OWORD *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  size_t v8;
  int v9[2];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "EDRServerStartService";
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s\n", buf, 0xCu);
  }
  *(_QWORD *)v9 = 0x200000006;
  v8 = 32;
  xmmword_1ED83AAC9 = 0u;
  unk_1ED83AAD9 = 0u;
  sysctl(v9, 2u, &xmmword_1ED83AAC9, &v8, 0, 0);
  *(_QWORD *)v9 = 0x4100000001;
  v8 = 32;
  xmmword_1ED83AAE9 = 0u;
  unk_1ED83AAF9 = 0u;
  sysctl(v9, 2u, &xmmword_1ED83AAE9, &v8, 0, 0);
  if (!qword_1ED83AAC0)
  {
    v0 = operator new();
    *(_QWORD *)v0 = 850045863;
    *(_OWORD *)(v0 + 8) = 0u;
    *(_OWORD *)(v0 + 24) = 0u;
    *(_OWORD *)(v0 + 40) = 0u;
    *(_QWORD *)(v0 + 56) = 0;
    qword_1ED83AAC0 = v0;
  }
  if (!qword_1ED83CBF8)
  {
    v1 = dispatch_queue_create("com.apple.libEDR", 0);
    v2 = (void *)qword_1ED83CBF8;
    qword_1ED83CBF8 = (uint64_t)v1;

    if (!qword_1ED83CBF8)
    {
      dispatch_get_global_queue(0, 0);
      qword_1ED83CBF8 = objc_claimAutoreleasedReturnValue();
    }
  }
  if (!qword_1ED83AAB8)
  {
    v3 = (_OWORD *)operator new[]();
    v4 = 0;
    *v3 = xmmword_1C8956E70;
    do
    {
      v5 = (char *)v3 + v4;
      *((_WORD *)v5 + 8) = 0;
      *(_OWORD *)(v5 + 20) = xmmword_1C8956E80;
      *((_DWORD *)v5 + 9) = 1065353216;
      *((_WORD *)v5 + 20) = 0;
      v5[42] = 0;
      sub_1C8955F9C((uint64_t)v3 + v4 + 48);
      sub_1C8955F9C((uint64_t)v3 + v4 + 96);
      *(_OWORD *)((char *)v3 + v4 + 232) = 0u;
      *(_QWORD *)((char *)v3 + v4 + 320) = 0;
      v6 = (uint64_t)v3 + v4 + 320;
      *(_QWORD *)(v6 - 176) = 0;
      *(_QWORD *)(v6 - 168) = 850045863;
      *(_OWORD *)(v6 - 160) = 0u;
      *(_OWORD *)(v6 - 144) = 0u;
      *(_OWORD *)(v6 - 128) = 0u;
      *(_OWORD *)(v6 - 119) = 0u;
      *(_QWORD *)(v6 - 96) = 1018212795;
      *(_OWORD *)(v6 - 72) = 0u;
      *(_OWORD *)(v6 - 56) = 0u;
      *(_OWORD *)(v6 - 40) = 0u;
      *(_QWORD *)(v6 - 24) = 0;
      *(_DWORD *)(v6 - 16) = 1065353216;
      *(_QWORD *)(v6 + 8) = 0;
      *(_QWORD *)(v6 - 8) = v6;
      *(_DWORD *)(v6 + 16) = -559038737;
      *(_QWORD *)(v6 + 104) = 0;
      *(_DWORD *)(v6 + 112) = 0;
      *(_OWORD *)(v6 + 49) = 0u;
      *(_OWORD *)(v6 + 36) = 0u;
      *(_OWORD *)(v6 + 20) = 0u;
      *(_QWORD *)(v6 + 84) = 0;
      *(_QWORD *)(v6 + 89) = 0;
      *(_QWORD *)(v6 + 68) = 0;
      *(_QWORD *)(v6 + 76) = 0;
      *(_QWORD *)(v6 + 120) = 0;
      *(_QWORD *)(v6 + 128) = 0;
      *(_BYTE *)(v6 + 136) = 0;
      *(_QWORD *)(v6 + 140) = 0;
      *(_BYTE *)(v6 + 148) = 0;
      *(_OWORD *)(v6 + 152) = xmmword_1C8956E90;
      *(_OWORD *)(v6 + 168) = xmmword_1C8956EA0;
      *(_QWORD *)(v6 + 184) = 0x4170000040400000;
      *(_DWORD *)(v6 + 192) = 1077936128;
      *(_QWORD *)(v6 + 200) = 0;
      *(_DWORD *)(v6 + 208) = 0;
      *(_BYTE *)(v6 + 248) = 1;
      *(_DWORD *)(v6 + 252) = 1065353216;
      *(_QWORD *)(v6 + 272) = 1148846080;
      v4 += 584;
      *(_OWORD *)(v6 + 256) = xmmword_1C89585B8;
    }
    while (v4 != 9344);
    qword_1ED83AAB8 = (uint64_t)(v3 + 1);
  }
  sub_1C89526E0();
  sub_1C8952958(qword_1ED83CBF8, 0, sub_1C894A064, 0);
  notify_register_dispatch("com.apple.system.lowpowermode", (int *)&unk_1ED83AB10, (dispatch_queue_t)qword_1ED83CBF8, &unk_1E82013C8);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "EDRServerRegisterForDumpStateToSysDiagnose";
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s\n", buf, 0xCu);
  }
  dispatch_get_global_queue(0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_state_add_handler();

  if (qword_1ED83CB50 != -1)
    dispatch_once(&qword_1ED83CB50, &unk_1E8203820);
}

void sub_1C8949FE4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_1C894A028(uint64_t a1)
{

  sub_1C894DDCC(a1 + 296, *(_QWORD **)(a1 + 304));
  return sub_1C8948DD8(a1);
}

void sub_1C894A064(uint64_t a1, int a2, unsigned int *a3, uint64_t a4, int *a5, int *a6, _DWORD *a7)
{
  unsigned int v10;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  const char *v23;
  int v24;
  uint64_t v25;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  BOOL v30;
  std::mutex *v31;
  uint64_t v32;
  uint64_t **v33;
  int v34;
  float v35;
  uint64_t v36;
  int v37;
  float v38;
  uint64_t v39;
  int v40;
  float v41;
  uint64_t v42;
  int v43;
  std::mutex *v44;
  uint64_t v45;
  float v46;
  unint64_t v47[2];
  unint64_t v48;
  _BYTE buf[12];
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[20];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 0:
      v10 = 0;
      goto LABEL_7;
    case 6:
      v12 = ++dword_1ED83CB38;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "EDRServerCreateClientID";
        v50 = 1024;
        v51 = v12;
        _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", buf, 0x12u);
        v12 = dword_1ED83CB38;
      }
      *a5 = 0;
      *a7 = 4;
      *a6 = v12;
      return;
    case 7:
      v10 = *a3;
LABEL_7:
      sub_1C894DE0C(a1, v10);
      return;
    case 8:
      *a5 = 1;
      v13 = *a3;
      v14 = a3[1];
      v15 = 1;
      goto LABEL_10;
    case 9:
      *a5 = 2;
      v13 = *a3;
      v14 = a3[1];
      v15 = 0;
LABEL_10:
      sub_1C894AFC8(a1, v13, v14, v15);
      return;
    case 10:
      v16 = a3[1];
      if (EDRServerIsEnabledForDisplay(v16))
        v17 = 1;
      else
        v17 = 2;
      goto LABEL_62;
    case 11:
      v18 = *a3;
      v19 = a3[1];
      v20 = 1;
      goto LABEL_16;
    case 12:
      v18 = *a3;
      v19 = a3[1];
      v20 = 0;
LABEL_16:
      sub_1C894E06C(a1, v18, v19, v20);
      return;
    case 13:
      v16 = a3[1];
      v21 = sub_1C8947738(v16);
      if (!v21)
        goto LABEL_61;
      v22 = *(unsigned __int8 *)(v21 + 368);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v23 = "Yes";
        *(_QWORD *)&buf[4] = "EDRServerHasAccessibilityLimit";
        *(_DWORD *)buf = 136315650;
        if (!v22)
          v23 = "No";
        v50 = 1024;
        v51 = v16;
        v52 = 2080;
        *(_QWORD *)v53 = v23;
        _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d enabled=%s\n", buf, 0x1Cu);
      }
      if (v22)
        v17 = 4;
      else
LABEL_61:
        v17 = 5;
LABEL_62:
      *a5 = v17;
      *a6 = v16;
      return;
    case 14:
      v25 = *a3;
      v24 = a3[1];
      v26 = *((float *)a3 + 2);
      v27 = 1.0;
      if (v26 >= 1.0)
        v28 = 1.0 / v26;
      else
        v28 = 1.0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "EDRServerSetDisplayEDRScalingFactorLimit";
        v50 = 1024;
        v51 = a1;
        v52 = 1024;
        *(_DWORD *)v53 = v25;
        *(_WORD *)&v53[4] = 1024;
        *(_DWORD *)&v53[6] = v24;
        *(_WORD *)&v53[10] = 2048;
        *(double *)&v53[12] = v28;
        _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d cid=%d did=%d limit=%f\n", buf, 0x28u);
      }
      v29 = v25 | (a1 << 32);
      v30 = v28 > 1.0 || v28 < 0.000001;
      v31 = (std::mutex *)qword_1ED83AAC0;
      if (!v30)
        v27 = v28;
      v48 = v29;
      *(_QWORD *)buf = qword_1ED83AAC0;
      buf[8] = 1;
      std::mutex::lock((std::mutex *)qword_1ED83AAC0);
      v32 = sub_1C8947738(v24);
      if (!v32)
        goto LABEL_57;
      v33 = (uint64_t **)(v32 + 296);
      sub_1C894E608(v32 + 296, &v48);
      if (v27 < 1.0)
      {
        v47[0] = v48;
        v47[1] = LODWORD(v27);
        sub_1C894E680(v33, v47, (uint64_t)v47);
      }
      sub_1C894B298();
      sub_1C8947F34((uint64_t)buf);
      sub_1C8946BD0(v24, 1);
      if (buf[8])
      {
        v31 = *(std::mutex **)buf;
LABEL_57:
        std::mutex::unlock(v31);
      }
      return;
    case 15:
      v34 = a3[1];
      v35 = *((float *)a3 + 2);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "EDRServerSetRampingSpeedFactor";
        v50 = 1024;
        v51 = a1;
        v52 = 1024;
        *(_DWORD *)v53 = v34;
        *(_WORD *)&v53[4] = 2048;
        *(double *)&v53[6] = v35;
        _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d did=%d factor=%f\n", buf, 0x22u);
      }
      v31 = (std::mutex *)qword_1ED83AAC0;
      std::mutex::lock((std::mutex *)qword_1ED83AAC0);
      v36 = sub_1C8947738(v34);
      if (v36)
      {
        *(float *)(v36 + 344) = v35;
        if (v35 <= 0.0)
        {
          v35 = *(float *)(v36 + 328);
          *(float *)(v36 + 344) = v35;
        }
        sub_1C8948F88(v36, v35);
      }
      goto LABEL_57;
    case 16:
      v37 = a3[1];
      v38 = *((float *)a3 + 2);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "EDRServerSetBrightnessAnimationTimeStepFactor";
        v50 = 1024;
        v51 = a1;
        v52 = 1024;
        *(_DWORD *)v53 = v37;
        *(_WORD *)&v53[4] = 2048;
        *(double *)&v53[6] = v38;
        _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d did=%d factor=%f\n", buf, 0x22u);
      }
      v31 = (std::mutex *)qword_1ED83AAC0;
      std::mutex::lock((std::mutex *)qword_1ED83AAC0);
      v39 = sub_1C8947738(v37);
      if (v39)
      {
        *(float *)(v39 + 348) = v38;
        if (v38 <= 0.0)
        {
          v38 = *(float *)(v39 + 332);
          *(float *)(v39 + 348) = v38;
        }
        sub_1C8948F90(v38);
      }
      goto LABEL_57;
    case 17:
      v40 = a3[1];
      v41 = *((float *)a3 + 2);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "EDRServerSetTransitionAnimationTimeStepFactor";
        v50 = 1024;
        v51 = a1;
        v52 = 1024;
        *(_DWORD *)v53 = v40;
        *(_WORD *)&v53[4] = 2048;
        *(double *)&v53[6] = v41;
        _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d did=%d factor=%f\n", buf, 0x22u);
      }
      v31 = (std::mutex *)qword_1ED83AAC0;
      std::mutex::lock((std::mutex *)qword_1ED83AAC0);
      v42 = sub_1C8947738(v40);
      if (v42)
      {
        *(float *)(v42 + 352) = v41;
        if (v41 <= 0.0)
        {
          v41 = *(float *)(v42 + 336);
          *(float *)(v42 + 352) = v41;
        }
        sub_1C8948F9C(v41);
      }
      goto LABEL_57;
    case 18:
      v43 = a3[1];
      *a5 = 18;
      v44 = (std::mutex *)qword_1ED83AAC0;
      std::mutex::lock((std::mutex *)qword_1ED83AAC0);
      v45 = sub_1C8947738(v43);
      if (v45)
      {
        v46 = *(float *)(v45 + 324);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "EDRServerGetDefaultMinScalingFactor";
          v50 = 1024;
          v51 = a1;
          v52 = 1024;
          *(_DWORD *)v53 = v43;
          *(_WORD *)&v53[4] = 2048;
          *(double *)&v53[6] = v46;
          _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d did=%d factor=%f\n", buf, 0x22u);
        }
      }
      else
      {
        v46 = 1.0;
      }
      std::mutex::unlock(v44);
      *(float *)a6 = v46;
      return;
    default:
      return;
  }
}

void sub_1C894A7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  std::mutex *v14;

  std::mutex::unlock(v14);
  _Unwind_Resume(a1);
}

void sub_1C894A7FC(int a1, int token)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t state64;
  _BYTE buf[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  notify_get_state(token, &state64);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (state64)
      v2 = "On";
    else
      v2 = "Off";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v2;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - LowPowerMode => %s\n", buf, 0xCu);
  }
  v3 = 400;
  v4 = 16;
  do
  {
    *(_QWORD *)buf = qword_1ED83AAC0;
    buf[8] = 1;
    std::mutex::lock((std::mutex *)qword_1ED83AAC0);
    v5 = *(_DWORD *)(qword_1ED83AAB8 + v3 - 80);
    if (v5 == -559038737)
    {
      sub_1C8947F34((uint64_t)buf);
    }
    else
    {
      *(_BYTE *)(qword_1ED83AAB8 + v3) = state64 != 0;
      sub_1C8947F34((uint64_t)buf);
      sub_1C8946BD0(v5, 1);
    }
    if (buf[8])
      std::mutex::unlock(*(std::mutex **)buf);
    v3 += 584;
    --v4;
  }
  while (v4);
}

void sub_1C894A964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(exception_object);
}

NSObject *EDRServerStopService()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "EDRServerStopService";
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s\n", (uint8_t *)&v4, 0xCu);
  }
  v0 = qword_1ED83AAB8;
  v1 = -9344;
  do
  {
    v2 = *(_DWORD *)(v0 + v1 + 9664);
    if (v2 != -559038737)
    {
      sub_1C894AA74(v2);
      v0 = qword_1ED83AAB8;
    }
    v1 += 584;
  }
  while (v1);
  sub_1C89529BC(0);
  return sub_1C89528BC();
}

void sub_1C894AA74(int a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  if (dword_1ED83AA58 == a1)
  {
    v1 = sub_1C8947738(a1);
    if (v1)
    {
      v2 = v1;
      *(_DWORD *)(v1 + 444) = *(_DWORD *)(v1 + 324);
      v3 = *(NSObject **)(v1 + 424);
      if (v3)
      {
        dispatch_source_cancel(v3);
        v4 = *(void **)(v2 + 424);
        *(_QWORD *)(v2 + 424) = 0;

      }
      v5 = *(NSObject **)(v2 + 432);
      if (v5)
      {
        dispatch_source_cancel(v5);
        v6 = *(void **)(v2 + 432);
        *(_QWORD *)(v2 + 432) = 0;

      }
    }
  }
}

void EDRServerAddDisplay(int a1)
{
  uint64_t v2;
  uint64_t i;
  std::mutex *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  std::mutex *v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1 == -559038737)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      sub_1C8955FF0();
  }
  else if (sub_1C8947738(a1))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      sub_1C89560E4();
  }
  else
  {
    v2 = 0;
    for (i = 320; ; i += 584)
    {
      v4 = (std::mutex *)qword_1ED83AAC0;
      v13 = (std::mutex *)qword_1ED83AAC0;
      v14 = 1;
      std::mutex::lock((std::mutex *)qword_1ED83AAC0);
      if (*(_DWORD *)(qword_1ED83AAB8 + i) == -559038737)
        break;
      std::mutex::unlock(v4);
      if (++v2 == 16)
      {
        v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v5)
          sub_1C8956060(v5, v6, v7, v8, v9, v10, v11, v12);
        return;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "EDRServerAddDisplay";
      v17 = 1024;
      v18 = v2;
      v19 = 1024;
      v20 = a1;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: add context %d for display %d\n", buf, 0x18u);
    }
    *(_DWORD *)(qword_1ED83AAB8 + i) = a1;
    sub_1C8947F34((uint64_t)&v13);
    sub_1C8949464(qword_1ED83AAB8 + i - 320);
    if (v14)
      std::mutex::unlock(v13);
  }
}

void sub_1C894ACA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10)
    std::mutex::unlock(a9);
  _Unwind_Resume(exception_object);
}

void EDRServerRemoveDisplay(int a1)
{
  std::mutex *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1 != -559038737)
  {
    v2 = (std::mutex *)qword_1ED83AAC0;
    std::mutex::lock((std::mutex *)qword_1ED83AAC0);
    v3 = 0;
    v4 = 320;
    while (*(_DWORD *)(qword_1ED83AAB8 + v4) != a1)
    {
      ++v3;
      v4 += 584;
      if (v3 == 16)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          sub_1C895623C();
        goto LABEL_10;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v5 = 136315650;
      v6 = "EDRServerRemoveDisplay";
      v7 = 1024;
      v8 = v3;
      v9 = 1024;
      v10 = a1;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: remove context %d for display %d\n", (uint8_t *)&v5, 0x18u);
    }
    *(_DWORD *)(qword_1ED83AAB8 + v4) = -559038737;
LABEL_10:
    std::mutex::unlock(v2);
  }
}

void EDRServerAddMainDisplay(int a1)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = 136315394;
    v3 = "EDRServerAddMainDisplay";
    v4 = 1024;
    v5 = a1;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: display = %d\n", (uint8_t *)&v2, 0x12u);
  }
  dword_1ED83AA58 = a1;
  if (!sub_1C8947738(a1))
    EDRServerAddDisplay(a1);
}

void EDRServerEnableForDisplay(int a1, int a2)
{
  const char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v4 = "No";
    v6 = "EDRServerEnableForDisplay";
    v5 = 136315650;
    if (a2)
      v4 = "Yes";
    v7 = 1024;
    v8 = a1;
    v9 = 2080;
    v10 = v4;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d enable=%s\n", (uint8_t *)&v5, 0x1Cu);
  }
  sub_1C894AFC8(0, 0, a1, a2);
}

void sub_1C894AFC8(unsigned int a1, unsigned int a2, int a3, int a4)
{
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  BOOL v17;
  unint64_t v18;
  unint64_t *v19;
  _BYTE buf[12];
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = "No";
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "EDRServerEnable";
    if (a4)
      v8 = "Yes";
    v21 = 1024;
    v22 = a1;
    v23 = 1024;
    v24 = a2;
    v25 = 1024;
    v26 = a3;
    v27 = 2080;
    v28 = v8;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d cid=%d did=%d enable=%s\n", buf, 0x28u);
  }
  if (sub_1C8949A58() <= 1.0)
  {
    *(_QWORD *)buf = qword_1ED83AAC0;
    buf[8] = 1;
    std::mutex::lock((std::mutex *)qword_1ED83AAC0);
    v9 = sub_1C8947738(a3);
    if (!v9)
      goto LABEL_27;
    v10 = (_QWORD *)v9;
    v11 = a1;
    v18 = a2 | ((unint64_t)a1 << 32);
    if (a4)
    {
      v19 = &v18;
      *((_DWORD *)sub_1C8951FAC((uint64_t **)(v9 + 296), &v18, (uint64_t)&unk_1C89585D0, &v19) + 10) = 0;
    }
    else if (a2 | a1)
    {
      v12 = (uint64_t **)(v9 + 296);
      if (!a1 || a2)
      {
        sub_1C894E608(v9 + 296, &v18);
      }
      else
      {
        v13 = *(uint64_t **)(v9 + 296);
        v14 = (uint64_t *)(v9 + 304);
        if (v13 != (uint64_t *)(v9 + 304))
        {
          do
          {
            if (*((_DWORD *)v13 + 9) == v11)
            {
              v15 = sub_1C894E214(v12, v13);
              operator delete(v13);
            }
            else
            {
              v16 = (uint64_t *)v13[1];
              if (v16)
              {
                do
                {
                  v15 = v16;
                  v16 = (uint64_t *)*v16;
                }
                while (v16);
              }
              else
              {
                do
                {
                  v15 = (uint64_t *)v13[2];
                  v17 = *v15 == (_QWORD)v13;
                  v13 = v15;
                }
                while (!v17);
              }
            }
            v13 = v15;
          }
          while (v15 != v14);
        }
      }
    }
    else
    {
      sub_1C894DDCC(v9 + 296, *(_QWORD **)(v9 + 304));
      v10[38] = 0;
      v10[39] = 0;
      v10[37] = v10 + 38;
    }
    sub_1C894B298();
    sub_1C8947F34((uint64_t)buf);
    sub_1C8946BD0(a3, 1);
    if (buf[8])
LABEL_27:
      std::mutex::unlock(*(std::mutex **)buf);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "EDRServerEnable";
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: non-EDR device\n", buf, 0xCu);
  }
}

void sub_1C894B274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13, char a14)
{
  if (a14)
    std::mutex::unlock(a13);
  _Unwind_Resume(exception_object);
}

void sub_1C894B298()
{
  uint64_t v0;
  uint64_t v1;
  float *v2;
  unint64_t v3;
  int v4;
  float *v5;
  float *v6;
  BOOL v7;
  int v8;
  const char *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  const char *v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  __int128 *v23;
  __int16 v24;
  __int128 *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  _OWORD *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  const char *v43;
  _OWORD v44[4];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v0 = qword_1ED83AAB8;
  v1 = 16;
  while (*(_DWORD *)(v0 + 320) != dword_1ED83AA58)
  {
    v0 += 584;
    if (!--v1)
      return;
  }
  memset(v44, 0, sizeof(v44));
  v2 = *(float **)(v0 + 296);
  if ((float *)(v0 + 304) != v2)
  {
    v3 = 0;
    do
    {
      if (v3 <= 0x3E)
      {
        v4 = snprintf((char *)v44 + v3, 63 - v3, "(%d, %f)", *((_QWORD *)v2 + 4), v2[10]);
        if (v4)
          v3 += v4;
      }
      v5 = (float *)*((_QWORD *)v2 + 1);
      if (v5)
      {
        do
        {
          v6 = v5;
          v5 = *(float **)v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          v6 = (float *)*((_QWORD *)v2 + 2);
          v7 = *(_QWORD *)v6 == (_QWORD)v2;
          v2 = v6;
        }
        while (!v7);
      }
      v2 = v6;
    }
    while ((float *)(v0 + 304) != v6);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = sub_1C89482D4(v0);
    v9 = "NO";
    if (v8)
      v9 = "YES";
    v10 = *(float *)(v0 + 340);
    v11 = *(float *)(v0 + 324);
    v12 = *(float *)(v0 + 364);
    v13 = *(float *)(v0 + 356);
    v14 = *(float *)(v0 + 360);
    v15 = *(float *)(v0 + 556);
    v16 = *(int *)(v0 + 448);
    if (v16 > 3)
      v17 = "UnknownMitigationStage";
    else
      v17 = off_1E8203918[v16];
    *(_DWORD *)buf = 136317954;
    v21 = "UpdateAnalytics";
    v22 = 2080;
    v23 = &xmmword_1ED83AAC9;
    v24 = 2080;
    v25 = &xmmword_1ED83AAE9;
    v26 = 2080;
    v27 = v9;
    v28 = 2048;
    v29 = v10;
    v30 = 2080;
    v31 = v44;
    v32 = 2048;
    v33 = v11;
    v34 = 2048;
    v35 = v12;
    v36 = 2048;
    v37 = v13;
    v38 = 2048;
    v39 = v14;
    v40 = 2048;
    v41 = v15;
    v42 = 2080;
    v43 = v17;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: Hardware=%s, Software=%s, IsEDREnabled=%s, MinScalingFactor=%f, ScalingFactorLimits=[%s], DefaultMinScalingFactor=%f, TargetBrightness=%f, MaxLuminance=%f, AmbientIlluminance=%f, BrightnessScaler=%f, MitigationState=%s\n", buf, 0x7Au);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v44, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v19;
  AnalyticsSendEventLazy();

}

void sub_1C894B580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

float EDRServerGetDisplayBrightnessForDisplay(int a1)
{
  std::mutex *v2;
  uint64_t v3;
  float v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (std::mutex *)qword_1ED83AAC0;
  std::mutex::lock((std::mutex *)qword_1ED83AAC0);
  v3 = sub_1C8947738(a1);
  if (v3)
  {
    v4 = sub_1C8948FA8(v3) * *(float *)(v3 + 356);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v6 = 136315650;
      v7 = "EDRServerGetDisplayBrightnessForDisplay";
      v8 = 1024;
      v9 = a1;
      v10 = 2048;
      v11 = v4;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d val=%f\n", (uint8_t *)&v6, 0x1Cu);
    }
  }
  else
  {
    v4 = 0.0;
  }
  std::mutex::unlock(v2);
  return v4;
}

void sub_1C894B6B0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t EDRServerIsEnabledForDisplay(int a1)
{
  std::mutex *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (std::mutex *)qword_1ED83AAC0;
  std::mutex::lock((std::mutex *)qword_1ED83AAC0);
  v3 = sub_1C8947738(a1);
  if (v3)
  {
    v4 = sub_1C89482D4(v3);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v5 = "No";
      v8 = "EDRServerIsEnabledForDisplay";
      v7 = 136315650;
      if ((_DWORD)v4)
        v5 = "Yes";
      v9 = 1024;
      v10 = a1;
      v11 = 2080;
      v12 = v5;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d enabled=%s\n", (uint8_t *)&v7, 0x1Cu);
    }
  }
  else
  {
    v4 = 0;
  }
  std::mutex::unlock(v2);
  return v4;
}

void sub_1C894B7D8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void EDRServerGetCurrentDisplayPropertiesForDisplay(int a1, float *a2, float *a3, float *a4, float *a5, float *a6)
{
  std::mutex *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  const char *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = (std::mutex *)qword_1ED83AAC0;
  std::mutex::lock((std::mutex *)qword_1ED83AAC0);
  v13 = sub_1C8947738(a1);
  if (v13)
  {
    v14 = v13;
    *a2 = sub_1C89476D4(v13) * *(float *)(v13 + 356);
    *(_DWORD *)a3 = v15;
    *a4 = *(float *)(v14 + 356);
    *a5 = *(float *)(v14 + 360);
    *a6 = *(float *)(v14 + 556);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v16 = sub_1C89482D4(v14);
      v17 = "disabled";
      if (v16)
        v17 = "enabled";
      v18 = *a2;
      v19 = *a3;
      v20 = *a4;
      v21 = *a5;
      v22 = *a6;
      v23 = *(float *)(v14 + 340);
      v24 = 136317186;
      v25 = "EDRServerGetCurrentDisplayPropertiesForDisplay";
      v26 = 1024;
      v27 = a1;
      v28 = 2080;
      v29 = v17;
      v30 = 2048;
      v31 = v18;
      v32 = 2048;
      v33 = v19;
      v34 = 2048;
      v35 = v20;
      v36 = 2048;
      v37 = v21;
      v38 = 2048;
      v39 = v22;
      v40 = 2048;
      v41 = v23;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: (display: %d, EDR: %s, backlight: %f, edrScaling: %f, maxLuminance: %f, ambientIlluminance: %f, brightnessScaler: %f, gMinScalingFactor: %f)\n", (uint8_t *)&v24, 0x58u);
    }
  }
  std::mutex::unlock(v12);
}

void sub_1C894B9AC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void EDRServerRegisterCallbackBlockOnQueue(void *a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "EDRServerRegisterCallbackBlockOnQueue";
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s\n", (uint8_t *)&v5, 0xCu);
  }
  EDRRegisterCallbackBlockOnQueue(0, v3, v4);

}

void sub_1C894BA98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void EDRRegisterCallbackBlockOnQueue(unsigned int a1, void *a2, void *a3)
{
  unsigned int v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  uint64_t *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  unsigned int v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BYTE v21[10];
  id v22;
  uint64_t v23;

  v4 = a1;
  v23 = *MEMORY[0x1E0C80C00];
  v17 = a1;
  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "EDRRegisterCallbackBlockOnQueue";
    v20 = 1024;
    *(_DWORD *)v21 = v4;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", buf, 0x12u);
  }
  v7 = sub_1C894CC4C();
  std::mutex::lock((std::mutex *)v7);
  if (v6)
  {
    v8 = *(_QWORD *)(v7 + 72);
    if (v8)
    {
      v9 = v7 + 72;
      do
      {
        v10 = *(_DWORD *)(v8 + 32);
        v11 = v10 >= v4;
        if (v10 >= v4)
          v12 = (uint64_t *)v8;
        else
          v12 = (uint64_t *)(v8 + 8);
        if (v11)
          v9 = v8;
        v8 = *v12;
      }
      while (*v12);
      if (v9 != v7 + 72 && *(_DWORD *)(v9 + 32) <= v4)
      {
        _Block_release(*(const void **)(v9 + 48));
        sub_1C8952440(v7 + 64, &v17);
        v4 = v17;
      }
    }
    v13 = v5;
    _Block_copy(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = v17;
    HIDWORD(v19) = v4;
    *(_QWORD *)&v21[2] = _Block_copy(v14);
    v15 = v13;
    v22 = v15;
    sub_1C89524E4((uint64_t **)(v7 + 64), (unsigned int *)buf, (uint64_t)buf);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1C894D55C;
  v16[3] = &unk_1E82014F8;
  v16[4] = v7;
  if (qword_1ED83AB18 != -1)
    dispatch_once(&qword_1ED83AB18, v16);
  std::mutex::unlock((std::mutex *)v7);

}

void sub_1C894BCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  void *v19;
  std::mutex *v20;

  std::mutex::unlock(v20);

  _Unwind_Resume(a1);
}

void EDRServerRegisterCallbackBlock(void *a1)
{
  id v1;
  void *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "EDRServerRegisterCallbackBlock";
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s\n", (uint8_t *)&v3, 0xCu);
  }
  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  EDRServerRegisterCallbackBlockOnQueue(v2, v1);

}

void sub_1C894BDF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void EDRServerUnregisterCallbackBlock()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v0 = 136315138;
    v1 = "EDRServerUnregisterCallbackBlock";
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s\n", (uint8_t *)&v0, 0xCu);
  }
  EDRUnregisterCallbackBlock(0);
}

void EDRUnregisterCallbackBlock(unsigned int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  uint64_t *v7;
  unsigned int v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "EDRUnregisterCallbackBlock";
    v11 = 1024;
    v12 = a1;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", buf, 0x12u);
  }
  v2 = sub_1C894CC4C();
  std::mutex::lock((std::mutex *)v2);
  v3 = *(_QWORD *)(v2 + 72);
  if (v3)
  {
    v4 = v2 + 72;
    do
    {
      v5 = *(_DWORD *)(v3 + 32);
      v6 = v5 >= a1;
      if (v5 >= a1)
        v7 = (uint64_t *)v3;
      else
        v7 = (uint64_t *)(v3 + 8);
      if (v6)
        v4 = v3;
      v3 = *v7;
    }
    while (*v7);
    if (v4 != v2 + 72 && *(_DWORD *)(v4 + 32) <= a1)
    {
      _Block_release(*(const void **)(v4 + 48));
      sub_1C8952440(v2 + 64, &v8);
    }
  }
  std::mutex::unlock((std::mutex *)v2);
}

void sub_1C894BFD8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t EDRCreateClientForDisplay(uint64_t a1)
{
  return sub_1C894BFFC(a1, 0x1388u);
}

uint64_t sub_1C894BFFC(uint64_t a1, mach_msg_timeout_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int v6;
  int v7;
  _BYTE buf[12];
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  memset(v13, 0, 24);
  v6 = 16;
  v7 = 0;
  sub_1C8952BDC(a2, 6, 0, 0, &v7, v13, &v6);
  v3 = LODWORD(v13[0]);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "EDRCreateClientForDisplayWithTimeout";
    v9 = 1024;
    v10 = v3;
    v11 = 1024;
    v12 = a1;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d\n", buf, 0x18u);
  }
  v4 = qword_1ED83AB20;
  if (!qword_1ED83AB20)
  {
    v4 = operator new();
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)(v4 + 8) = 0;
    *(_QWORD *)v4 = v4 + 8;
    qword_1ED83AB20 = v4;
  }
  *(_QWORD *)buf = v3 | (a1 << 32);
  sub_1C8952388((uint64_t **)v4, (unsigned int *)buf, (uint64_t *)buf);
  return v3;
}

void EDRCreateClientForDisplayWithTimeoutAndCallback(int a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int v10;
  int v11;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1C894C1E8;
  v8[3] = &unk_1E8201490;
  v10 = a1;
  v11 = a2;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t sub_1C894C1E8(uint64_t a1)
{
  sub_1C894BFFC(*(unsigned int *)(a1 + 40), *(_DWORD *)(a1 + 44));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void EDRCreateClientWithTimeoutAndCallback(int a1, void *a2)
{
  EDRCreateClientForDisplayWithTimeoutAndCallback(dword_1ED83AA58, a1, a2);
}

uint64_t EDRReleaseClient(unsigned int a1)
{
  unsigned int v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "EDRReleaseClient";
    v6 = 1024;
    v7 = a1;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", buf, 0x12u);
  }
  EDRUnregisterCallbackBlock(a1);
  return sub_1C8952A70(7, &v3, 4);
}

uint64_t EDREnable(unsigned int a1, int a2)
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = sub_1C89477C8(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = "No";
    v8 = 136315906;
    v9 = "EDREnable";
    if (a2)
      v5 = "Yes";
    v10 = 1024;
    v11 = a1;
    v12 = 1024;
    v13 = v4;
    v14 = 2080;
    v15 = v5;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d enable=%s\n", (uint8_t *)&v8, 0x22u);
  }
  if (a2)
    v6 = 8;
  else
    v6 = 9;
  v8 = a1;
  LODWORD(v9) = v4;
  return sub_1C8952A70(v6, &v8, 8);
}

BOOL EDRIsEnabled(unsigned int a1)
{
  int v2;
  const char *v3;
  int v5;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  unsigned int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = sub_1C89477C8(a1);
  sub_1C8952BDC(0x1388u, 10, &v6, 4, &v5, 0, 0);
  v2 = v5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3 = "No";
    v8 = "EDRIsEnabled";
    *(_DWORD *)buf = 136315906;
    if (v2 == 1)
      v3 = "Yes";
    v9 = 1024;
    v10 = a1;
    v11 = 1024;
    v12 = v6;
    v13 = 2080;
    v14 = v3;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d enabled=%s\n", buf, 0x22u);
  }
  return v2 == 1;
}

uint64_t EDRRequestAccessibilityLimit(unsigned int a1, int a2)
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v8;
  const char *v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = sub_1C89477C8(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = "No";
    v8 = 136315906;
    v9 = "EDRRequestAccessibilityLimit";
    if (a2)
      v5 = "Yes";
    v10 = 1024;
    v11 = a1;
    v12 = 1024;
    v13 = v4;
    v14 = 2080;
    v15 = v5;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d enable=%s\n", (uint8_t *)&v8, 0x22u);
  }
  if (a2)
    v6 = 11;
  else
    v6 = 12;
  v8 = a1;
  LODWORD(v9) = v4;
  return sub_1C8952A70(v6, &v8, 8);
}

BOOL EDRHasAccessibilityLimit(unsigned int a1)
{
  int v2;
  const char *v3;
  int v5;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  unsigned int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = sub_1C89477C8(a1);
  sub_1C8952BDC(0x1388u, 13, &v6, 4, &v5, 0, 0);
  v2 = v5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3 = "No";
    v8 = "EDRHasAccessibilityLimit";
    *(_DWORD *)buf = 136315906;
    if (v2 == 4)
      v3 = "Yes";
    v9 = 1024;
    v10 = a1;
    v11 = 1024;
    v12 = v6;
    v13 = 2080;
    v14 = v3;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d enable=%s\n", buf, 0x22u);
  }
  return v2 == 4;
}

uint64_t EDRRequestDisplayHeadroomLimit(unsigned int a1, float a2)
{
  unsigned int v4;
  int v6;
  const char *v7;
  __int16 v8;
  unsigned int v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = sub_1C89477C8(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = 136315906;
    v7 = "EDRRequestDisplayHeadroomLimit";
    v8 = 1024;
    v9 = a1;
    v10 = 1024;
    v11 = v4;
    v12 = 2048;
    v13 = a2;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d limit=%f\n", (uint8_t *)&v6, 0x22u);
  }
  v6 = a1;
  v7 = (const char *)__PAIR64__(LODWORD(a2), v4);
  return sub_1C8952A70(14, &v6, 12);
}

uint64_t EDRRequestRampingSpeedFactor(unsigned int a1, float a2)
{
  unsigned int v4;
  int v6;
  const char *v7;
  __int16 v8;
  unsigned int v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = sub_1C89477C8(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = 136315906;
    v7 = "EDRRequestRampingSpeedFactor";
    v8 = 1024;
    v9 = a1;
    v10 = 1024;
    v11 = v4;
    v12 = 2048;
    v13 = a2;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d factor=%f\n", (uint8_t *)&v6, 0x22u);
  }
  v6 = a1;
  v7 = (const char *)__PAIR64__(LODWORD(a2), v4);
  return sub_1C8952A70(15, &v6, 12);
}

uint64_t EDRRequestBrightnessAnimationTimeStepFactor(unsigned int a1, float a2)
{
  unsigned int v4;
  int v6;
  const char *v7;
  __int16 v8;
  unsigned int v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = sub_1C89477C8(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = 136315906;
    v7 = "EDRRequestBrightnessAnimationTimeStepFactor";
    v8 = 1024;
    v9 = a1;
    v10 = 1024;
    v11 = v4;
    v12 = 2048;
    v13 = a2;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d factor=%f\n", (uint8_t *)&v6, 0x22u);
  }
  v6 = a1;
  v7 = (const char *)__PAIR64__(LODWORD(a2), v4);
  return sub_1C8952A70(16, &v6, 12);
}

uint64_t EDRRequestTransitionAnimationTimeStepFactor(unsigned int a1, float a2)
{
  unsigned int v4;
  int v6;
  const char *v7;
  __int16 v8;
  unsigned int v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = sub_1C89477C8(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v6 = 136315906;
    v7 = "EDRRequestTransitionAnimationTimeStepFactor";
    v8 = 1024;
    v9 = a1;
    v10 = 1024;
    v11 = v4;
    v12 = 2048;
    v13 = a2;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d factor=%f\n", (uint8_t *)&v6, 0x22u);
  }
  v6 = a1;
  v7 = (const char *)__PAIR64__(LODWORD(a2), v4);
  return sub_1C8952A70(17, &v6, 12);
}

float EDRGetDisplayBrightness(unsigned int a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  float v13;
  int v15;
  const char *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = sub_1C89477C8(a1);
  v3 = sub_1C894CC4C();
  v6 = *(_QWORD *)(v3 + 96);
  v4 = v3 + 96;
  v5 = v6;
  v7 = 1.0;
  if (v6)
  {
    v8 = v4;
    do
    {
      v9 = *(_DWORD *)(v5 + 32);
      v10 = v9 >= v2;
      if (v9 >= v2)
        v11 = (uint64_t *)v5;
      else
        v11 = (uint64_t *)(v5 + 8);
      if (v10)
        v8 = v5;
      v5 = *v11;
    }
    while (*v11);
    v7 = 1.0;
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32))
      v7 = **(float **)(v8 + 40);
  }
  if (v7 > 1.0 || v7 < 0.0)
    v13 = 1.0;
  else
    v13 = v7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v15 = 136315906;
    v16 = "EDRGetDisplayBrightness";
    v17 = 1024;
    v18 = a1;
    v19 = 1024;
    v20 = v2;
    v21 = 2048;
    v22 = v13;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v15, 0x22u);
  }
  return v13;
}

uint64_t sub_1C894CC4C()
{
  unsigned __int8 v0;
  uint64_t v2;

  v0 = atomic_load((unsigned __int8 *)&qword_1ED83AA80);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83AA80))
  {
    v2 = operator new();
    *(_QWORD *)v2 = 850045863;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_QWORD *)(v2 + 72) = 0;
    *(_QWORD *)(v2 + 56) = 0;
    *(_QWORD *)(v2 + 64) = v2 + 72;
    *(_QWORD *)(v2 + 104) = 0;
    *(_QWORD *)(v2 + 96) = 0;
    *(_QWORD *)(v2 + 80) = 0;
    *(_QWORD *)(v2 + 88) = v2 + 96;
    qword_1ED83AB28 = v2;
    __cxa_guard_release(&qword_1ED83AA80);
  }
  return qword_1ED83AB28;
}

void sub_1C894CCF0(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1ED83AA80);
  _Unwind_Resume(a1);
}

float EDRGetDisplayBacklightBrightness(unsigned int a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  float v13;
  int v15;
  const char *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = sub_1C89477C8(a1);
  v3 = sub_1C894CC4C();
  v6 = *(_QWORD *)(v3 + 96);
  v4 = v3 + 96;
  v5 = v6;
  v7 = 1.0;
  if (v6)
  {
    v8 = v4;
    do
    {
      v9 = *(_DWORD *)(v5 + 32);
      v10 = v9 >= v2;
      if (v9 >= v2)
        v11 = (uint64_t *)v5;
      else
        v11 = (uint64_t *)(v5 + 8);
      if (v10)
        v8 = v5;
      v5 = *v11;
    }
    while (*v11);
    v7 = 1.0;
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32))
      v7 = *(float *)(*(_QWORD *)(v8 + 40) + 4);
  }
  if (v7 > 1.0 || v7 < 0.0)
    v13 = 1.0;
  else
    v13 = v7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v15 = 136315906;
    v16 = "EDRGetDisplayBacklightBrightness";
    v17 = 1024;
    v18 = a1;
    v19 = 1024;
    v20 = v2;
    v21 = 2048;
    v22 = v13;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v15, 0x22u);
  }
  return v13;
}

float EDRGetDisplayScalingFactor(unsigned int a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  float v12;
  int v14;
  const char *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = sub_1C89477C8(a1);
  v3 = sub_1C894CC4C();
  v6 = *(_QWORD *)(v3 + 96);
  v4 = v3 + 96;
  v5 = v6;
  v7 = 1.0;
  if (v6)
  {
    v8 = v4;
    do
    {
      v9 = *(_DWORD *)(v5 + 32);
      v10 = v9 >= v2;
      if (v9 >= v2)
        v11 = (uint64_t *)v5;
      else
        v11 = (uint64_t *)(v5 + 8);
      if (v10)
        v8 = v5;
      v5 = *v11;
    }
    while (*v11);
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32))
      v7 = *(float *)(*(_QWORD *)(v8 + 40) + 8);
  }
  if (v7 >= 0.000001)
    v12 = v7;
  else
    v12 = 0.000001;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v14 = 136315906;
    v15 = "EDRGetDisplayScalingFactor";
    v16 = 1024;
    v17 = a1;
    v18 = 1024;
    v19 = v2;
    v20 = 2048;
    v21 = v12;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v14, 0x22u);
  }
  return v12;
}

float EDRGetDisplayHeadroom(unsigned int a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  float v12;
  int v14;
  const char *v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = sub_1C89477C8(a1);
  v3 = sub_1C894CC4C();
  v6 = *(_QWORD *)(v3 + 96);
  v4 = v3 + 96;
  v5 = v6;
  v7 = 1.0;
  if (v6)
  {
    v8 = v4;
    do
    {
      v9 = *(_DWORD *)(v5 + 32);
      v10 = v9 >= v2;
      if (v9 >= v2)
        v11 = (uint64_t *)v5;
      else
        v11 = (uint64_t *)(v5 + 8);
      if (v10)
        v8 = v5;
      v5 = *v11;
    }
    while (*v11);
    v7 = 1.0;
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32))
      v7 = *(float *)(*(_QWORD *)(v8 + 40) + 8);
  }
  if (v7 >= 0.000001)
    v12 = 1.0 / v7;
  else
    v12 = 1000000.0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v14 = 136315906;
    v15 = "EDRGetDisplayHeadroom";
    v16 = 1024;
    v17 = a1;
    v18 = 1024;
    v19 = v2;
    v20 = 2048;
    v21 = v12;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v14, 0x22u);
  }
  return v12;
}

float EDRGetDisplayMaxLuminance(unsigned int a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  float v11;
  int v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = sub_1C89477C8(a1);
  v3 = sub_1C894CC4C();
  v6 = *(_QWORD *)(v3 + 96);
  v4 = v3 + 96;
  v5 = v6;
  if (!v6)
    goto LABEL_12;
  v7 = v4;
  do
  {
    v8 = *(_DWORD *)(v5 + 32);
    v9 = v8 >= v2;
    if (v8 >= v2)
      v10 = (uint64_t *)v5;
    else
      v10 = (uint64_t *)(v5 + 8);
    if (v9)
      v7 = v5;
    v5 = *v10;
  }
  while (*v10);
  if (v7 != v4 && v2 >= *(_DWORD *)(v7 + 32))
    v11 = *(float *)(*(_QWORD *)(v7 + 40) + 12);
  else
LABEL_12:
    v11 = 500.0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v13 = 136315906;
    v14 = "EDRGetDisplayMaxLuminance";
    v15 = 1024;
    v16 = a1;
    v17 = 1024;
    v18 = v2;
    v19 = 2048;
    v20 = v11;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v13, 0x22u);
  }
  return v11;
}

float EDRGetAmbientIlluminance(unsigned int a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  float v11;
  int v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = sub_1C89477C8(a1);
  v3 = sub_1C894CC4C();
  v6 = *(_QWORD *)(v3 + 96);
  v4 = v3 + 96;
  v5 = v6;
  if (!v6)
    goto LABEL_12;
  v7 = v4;
  do
  {
    v8 = *(_DWORD *)(v5 + 32);
    v9 = v8 >= v2;
    if (v8 >= v2)
      v10 = (uint64_t *)v5;
    else
      v10 = (uint64_t *)(v5 + 8);
    if (v9)
      v7 = v5;
    v5 = *v10;
  }
  while (*v10);
  if (v7 != v4 && v2 >= *(_DWORD *)(v7 + 32))
    v11 = *(float *)(*(_QWORD *)(v7 + 40) + 16);
  else
LABEL_12:
    v11 = 1000.0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v13 = 136315906;
    v14 = "EDRGetAmbientIlluminance";
    v15 = 1024;
    v16 = a1;
    v17 = 1024;
    v18 = v2;
    v19 = 2048;
    v20 = v11;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v13, 0x22u);
  }
  return v11;
}

float EDRGetBrightnessScaler(unsigned int a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  uint64_t *v11;
  int v13;
  const char *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = sub_1C89477C8(a1);
  v3 = sub_1C894CC4C();
  v6 = *(_QWORD *)(v3 + 96);
  v4 = v3 + 96;
  v5 = v6;
  v7 = 1.0;
  if (v6)
  {
    v8 = v4;
    do
    {
      v9 = *(_DWORD *)(v5 + 32);
      v10 = v9 >= v2;
      if (v9 >= v2)
        v11 = (uint64_t *)v5;
      else
        v11 = (uint64_t *)(v5 + 8);
      if (v10)
        v8 = v5;
      v5 = *v11;
    }
    while (*v11);
    if (v8 != v4 && v2 >= *(_DWORD *)(v8 + 32))
      v7 = *(float *)(*(_QWORD *)(v8 + 40) + 20);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v13 = 136315906;
    v14 = "EDRGetBrightnessScaler";
    v15 = 1024;
    v16 = a1;
    v17 = 1024;
    v18 = v2;
    v19 = 2048;
    v20 = v7;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", (uint8_t *)&v13, 0x22u);
  }
  return v7;
}

float EDRGetDefaultMinScalingFactor(unsigned int a1)
{
  int v2;
  _DWORD v4[3];
  int v5;
  int v6;
  float v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = sub_1C89477C8(a1);
  v6 = 0;
  v7 = 1.0;
  v5 = 0;
  v4[0] = a1;
  v4[1] = v2;
  sub_1C8952BDC(0x1388u, 18, v4, 8, &v6, &v7, &v5);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v9 = "EDRGetDefaultMinScalingFactor";
    v10 = 1024;
    v11 = a1;
    v12 = 1024;
    v13 = v2;
    v14 = 2048;
    v15 = v7;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d did=%d val=%f\n", buf, 0x22u);
  }
  return v7;
}

uint64_t sub_1C894D55C(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1C8946F70;
  v2[3] = &unk_1E82014D8;
  v2[4] = *(_QWORD *)(a1 + 32);
  return sub_1C89528EC(0x1388u, 0, v2, 0);
}

void EDRRegisterCallbackBlock(unsigned int a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "EDRRegisterCallbackBlock";
    v7 = 1024;
    v8 = a1;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: cid=%d\n", (uint8_t *)&v5, 0x12u);
  }
  dispatch_get_global_queue(0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EDRRegisterCallbackBlockOnQueue(a1, v4, v3);

}

void sub_1C894D6A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1C894D6C4()
{
  __int128 *v0;
  uint64_t v1;
  size_t v2;
  uint64_t result;
  const __CFString *v4;
  uint64_t v5;
  BOOL v6;
  const char *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  _BYTE buf[80];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int v25;
  char buffer[8];
  uint64_t v27;
  _OWORD __s[8];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  memset(__s, 0, sizeof(__s));
  v20 = 128;
  if (sysctlbyname("hw.model", __s, &v20, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      sub_1C895632C();
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "getModel_block_invoke";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = __s;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: model = %s\n", buf, 0x16u);
  }
  v0 = &xmmword_1E8201558;
  v1 = 8840;
  do
  {
    v2 = strlen((const char *)__s);
    result = sub_1C894DD14((size_t *)v0, (char *)__s, v2);
    if ((_DWORD)result)
    {
      v9 = v0[7];
      xmmword_1ED83AA30 = v0[6];
      xmmword_1ED83AA40 = v9;
      dword_1ED83AA50 = *((_DWORD *)v0 + 32);
      v10 = v0[3];
      xmmword_1ED83A9F0 = v0[2];
      unk_1ED83AA00 = v10;
      v11 = v0[5];
      unk_1ED83AA10 = v0[4];
      *(_OWORD *)&qword_1ED83AA20 = v11;
      v13 = *v0;
      v12 = v0[1];
LABEL_45:
      xmmword_1ED83A9D0 = v13;
      unk_1ED83A9E0 = v12;
      return result;
    }
    v0 = (__int128 *)((char *)v0 + 136);
    v1 -= 136;
  }
  while (v1);
  v4 = (const __CFString *)MGCopyAnswer();
  result = MGCopyAnswer();
  if (v4)
  {
    v5 = result;
    if (result)
    {
      *(_QWORD *)buffer = 0;
      v27 = 0;
      CFStringGetCString(v4, buffer, 16, 0x8000100u);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v6 = v5 == *MEMORY[0x1E0C9AE50];
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "getModel_block_invoke";
        if (v6)
          v7 = "YES";
        else
          v7 = "NO";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = buffer;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = v7;
        _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: platform = %s, oled = %s\n", buf, 0x20u);
      }
      result = CFStringCompare(v4, CFSTR("t8011"), 0);
      if (result == -1)
      {
        v14 = 0;
        memset(&buf[8], 0, 64);
        *(_DWORD *)&buf[72] = 1065353216;
        v22 = 0uLL;
        v25 = 1077936128;
        v23 = xmmword_1C8957A38;
        v24 = unk_1C8957A48;
        do
        {
          buf[v14 + 8] = byte_1C89585B4[v14 & 3] ^ aGeneric1x[v14];
          ++v14;
        }
        while (v14 != 10);
      }
      else
      {
        result = CFStringCompare(v4, CFSTR("t8011"), 0);
        if (result == 1 && v5 == *MEMORY[0x1E0C9AE40])
        {
          v8 = 0;
          memset(&buf[8], 0, 64);
          *(_DWORD *)&buf[72] = 1056964608;
          v22 = 0uLL;
          v25 = 1077936128;
          v23 = xmmword_1C8957A38;
          v24 = unk_1C8957A48;
          do
          {
            buf[v8 + 8] = byte_1C89585B4[v8 & 3] ^ aGeneric2x[v8];
            ++v8;
          }
          while (v8 != 10);
        }
        else
        {
          result = CFStringCompare(v4, CFSTR("t8011"), 0);
          v15 = *MEMORY[0x1E0C9AE50];
          if (result || v5 != v15)
          {
            result = CFStringCompare(v4, CFSTR("t8020"), 0);
            if (result || v5 != v15)
            {
              result = CFStringCompare(v4, CFSTR("t8030"), 0);
              if (result || v5 != v15)
              {
                if (v5 != v15)
                  return result;
                v19 = 0;
                memset(&buf[8], 0, 64);
                *(_DWORD *)&buf[72] = 1040187392;
                *(_QWORD *)&v22 = &unk_1C8957630;
                *((_QWORD *)&v22 + 1) = 86;
                v25 = 1077936128;
                v23 = xmmword_1C8957A38;
                v24 = unk_1C8957A48;
                do
                {
                  buf[v19 + 8] = byte_1C89585B4[v19 & 3] ^ aGeneric8x[v19];
                  ++v19;
                }
                while (v19 != 10);
              }
              else
              {
                v18 = 0;
                memset(&buf[8], 0, 64);
                *(_DWORD *)&buf[72] = 1040187392;
                *(_QWORD *)&v22 = &unk_1C8957228;
                *((_QWORD *)&v22 + 1) = 86;
                v25 = 1077936128;
                v23 = xmmword_1C8957A38;
                v24 = unk_1C8957A48;
                do
                {
                  buf[v18 + 8] = byte_1C89585B4[v18 & 3] ^ aGeneric8x[v18];
                  ++v18;
                }
                while (v18 != 10);
              }
            }
            else
            {
              v17 = 0;
              memset(&buf[8], 0, 64);
              *(_DWORD *)&buf[72] = 1048576000;
              *(_QWORD *)&v22 = &unk_1C8956EEC;
              *((_QWORD *)&v22 + 1) = 69;
              v25 = 1077936128;
              v23 = xmmword_1C8957A38;
              v24 = unk_1C8957A48;
              do
              {
                buf[v17 + 8] = byte_1C89585B4[v17 & 3] ^ aGeneric4x[v17];
                ++v17;
              }
              while (v17 != 10);
            }
          }
          else
          {
            v16 = 0;
            memset(&buf[8], 0, 64);
            *(_DWORD *)&buf[72] = 1048576000;
            *(_QWORD *)&v22 = &unk_1C8956EEC;
            *((_QWORD *)&v22 + 1) = 69;
            v25 = 1077936128;
            v23 = xmmword_1C8957A38;
            v24 = unk_1C8957A48;
            do
            {
              buf[v16 + 8] = byte_1C89585B4[v16 & 3] ^ aGeneric4x[v16];
              ++v16;
            }
            while (v16 != 10);
          }
        }
      }
      *(_QWORD *)buf = 9;
      xmmword_1ED83AA30 = v23;
      xmmword_1ED83AA40 = v24;
      dword_1ED83AA50 = v25;
      xmmword_1ED83A9F0 = *(_OWORD *)&buf[32];
      unk_1ED83AA00 = *(_OWORD *)&buf[48];
      unk_1ED83AA10 = *(_OWORD *)&buf[64];
      *(_OWORD *)&qword_1ED83AA20 = v22;
      v13 = *(_OWORD *)buf;
      v12 = *(_OWORD *)&buf[16];
      goto LABEL_45;
    }
  }
  return result;
}

BOOL sub_1C894DD14(size_t *a1, char *__s1, size_t a3)
{
  uint64_t v3;
  char v4;
  char __s2[65];
  uint64_t v8;

  v3 = 0;
  v8 = *MEMORY[0x1E0C80C00];
  __s2[64] = 0;
  do
  {
    v4 = byte_1C89585B4[v3 & 3] ^ *((_BYTE *)a1 + v3 + 8);
    __s2[v3] = v4;
    if (!v4)
      break;
  }
  while (v3++ != 63);
  return *a1 <= a3 && !strncmp(__s1, __s2, *a1);
}

void sub_1C894DDCC(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_1C894DDCC(a1, *a2);
    sub_1C894DDCC(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_1C894DE0C(unsigned int a1, unsigned int a2)
{
  uint64_t v4;
  BOOL v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  int v13;
  unint64_t v14;
  _BYTE buf[12];
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "EDRServerReleaseClient";
    v16 = 1024;
    v17 = a1;
    v18 = 1024;
    v19 = a2;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d cid=%d\n", buf, 0x18u);
  }
  v4 = 0;
  v13 = a2 | a1;
  if (a1)
    v5 = a2 == 0;
  else
    v5 = 0;
  v6 = v5;
  v12 = v6;
  v14 = a2 | ((unint64_t)a1 << 32);
  do
  {
    *(_QWORD *)buf = qword_1ED83AAC0;
    buf[8] = 1;
    std::mutex::lock((std::mutex *)qword_1ED83AAC0);
    v7 = *(_DWORD *)(qword_1ED83AAB8 + 584 * v4 + 320);
    if (v7 == -559038737)
    {
      sub_1C8947F34((uint64_t)buf);
    }
    else
    {
      v8 = qword_1ED83AAB8 + 584 * v4 + 296;
      if (v13)
      {
        if (v12)
        {
          v9 = *(uint64_t **)v8;
          if (*(_QWORD *)(qword_1ED83AAB8 + 584 * v4 + 296) != qword_1ED83AAB8 + 584 * v4 + 304)
          {
            do
            {
              if (*((_DWORD *)v9 + 9) == (unint64_t)a1)
              {
                v10 = sub_1C894E214((uint64_t **)v8, v9);
                operator delete(v9);
              }
              else
              {
                v11 = (uint64_t *)v9[1];
                if (v11)
                {
                  do
                  {
                    v10 = v11;
                    v11 = (uint64_t *)*v11;
                  }
                  while (v11);
                }
                else
                {
                  do
                  {
                    v10 = (uint64_t *)v9[2];
                    v5 = *v10 == (_QWORD)v9;
                    v9 = v10;
                  }
                  while (!v5);
                }
              }
              v9 = v10;
            }
            while (v10 != (uint64_t *)(v8 + 8));
          }
        }
        else
        {
          sub_1C894E608(v8, &v14);
        }
      }
      else
      {
        sub_1C894DDCC(qword_1ED83AAB8 + 584 * v4 + 296, *(_QWORD **)(qword_1ED83AAB8 + 584 * v4 + 304));
        *(_QWORD *)v8 = v8 + 8;
        *(_QWORD *)(v8 + 16) = 0;
        *(_QWORD *)(v8 + 8) = 0;
      }
      sub_1C8947F34((uint64_t)buf);
      sub_1C8946BD0(v7, 1);
    }
    if (buf[8])
      std::mutex::unlock(*(std::mutex **)buf);
    ++v4;
  }
  while (v4 != 16);
}

void sub_1C894E044(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(exception_object);
}

void sub_1C894E06C(int a1, int a2, int a3, int a4)
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _BYTE buf[12];
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = "No";
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "EDRServerEnableAccessibilityLimit";
    v15 = a1;
    v14 = 1024;
    if (a4)
      v8 = "Yes";
    v16 = 1024;
    v17 = a2;
    v18 = 1024;
    v19 = a3;
    v20 = 2080;
    v21 = v8;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: pid=%d cid=%d did=%d enable=%s\n", buf, 0x28u);
  }
  *(_QWORD *)buf = qword_1ED83AAC0;
  buf[8] = 1;
  std::mutex::lock((std::mutex *)qword_1ED83AAC0);
  v9 = sub_1C8947738(a3);
  if (!v9
    || (v10 = v9, *(unsigned __int8 *)(v9 + 368) == a4)
    || ((*(_BYTE *)(v9 + 368) = a4,
         sub_1C894B298(),
         sub_1C8947F34((uint64_t)buf),
         sub_1C8946BD0(a3, 0),
         *(_BYTE *)(v10 + 368))
      ? (v11 = 4)
      : (v11 = 5),
        sub_1C8947868(v11, &v12, 4),
        buf[8]))
  {
    std::mutex::unlock(*(std::mutex **)buf);
  }
}

void sub_1C894E1EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12)
    std::mutex::unlock(a11);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1C894E214(uint64_t **a1, uint64_t *a2)
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
  sub_1C894E284(v6, a2);
  return v3;
}

uint64_t *sub_1C894E284(uint64_t *result, uint64_t *a2)
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

uint64_t sub_1C894E608(uint64_t a1, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = (uint64_t *)(a1 + 8);
  do
  {
    v5 = v2[4];
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = v2;
    else
      v7 = v2 + 1;
    if (v6)
      v4 = v2;
    v2 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4])
    return 0;
  sub_1C894E214((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t **sub_1C894E680(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  _QWORD *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = operator new(0x30uLL);
    v10[4] = *(_QWORD *)a3;
    *((_DWORD *)v10 + 10) = *(_DWORD *)(a3 + 8);
    sub_1C894E740(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *sub_1C894E740(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = sub_1C894E794(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_1C894E794(uint64_t *result, uint64_t *a2)
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

char *sub_1C894E92C(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v2;
  CFStringRef v3;
  const void *v4;
  const __CFData *Data;
  const __CFData *v6;
  size_t Length;
  char *v8;
  char *v9;
  const UInt8 *BytePtr;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  sub_1C894EAEC();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v12 = 136315650;
    v13 = "EDRServerDumpStateToSysDiagnose";
    v14 = 2048;
    v15 = byte_1ED83AB34;
    v16 = 1024;
    v17 = strlen(byte_1ED83AB34);
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: data => %p size = %d\n", (uint8_t *)&v12, 0x1Cu);
  }
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], byte_1ED83AB34, 0x8000100u);
  if (!v3)
    return 0;
  v4 = v3;
  Data = CFPropertyListCreateData(v2, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Data)
  {
    v9 = 0;
    goto LABEL_10;
  }
  v6 = Data;
  Length = CFDataGetLength(Data);
  v8 = (char *)malloc_type_calloc(1uLL, Length + 200, 0xA713A156uLL);
  v9 = v8;
  if (v8)
  {
    *(_DWORD *)v8 = 1;
    *((_DWORD *)v8 + 1) = Length;
    strcpy(v8 + 136, "libEDR Server State");
    BytePtr = CFDataGetBytePtr(v6);
    memcpy(v9 + 200, BytePtr, Length);
    CFRelease(v4);
    v4 = v6;
LABEL_10:
    CFRelease(v4);
  }
  return v9;
}

void sub_1C894EAEC()
{
  tm *v0;
  char *v1;
  unsigned int v2;
  uint64_t v3;
  size_t v4;
  int v5;
  int v6;
  const __CFString *v7;
  int v8;
  uint64_t v9;
  const char *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  size_t v23;
  const char *v24;
  int v25;
  uint64_t v26;
  int v27;
  float v28;
  int v29;
  float v30;
  int v31;
  float v32;
  int v33;
  double v34;
  size_t v35;
  int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  float *v40;
  float *v41;
  int v42;
  float *v43;
  float *v44;
  BOOL v45;
  size_t v46;
  int v47;
  uint64_t v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  const char *v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  const char *v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  const char *v75;
  int v76;
  int v77;
  int v78;
  uint64_t v79;
  const char *v80;
  int v81;
  const char *v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  const char *v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  size_t v111;
  std::mutex *v112;
  time_t v113;
  char buffer[32];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  bzero(byte_1ED83AB34, 0x2000uLL);
  v113 = time(0);
  v0 = localtime(&v113);
  v1 = asctime(v0);
  v2 = snprintf(byte_1ED83AB34, 0x1FFFuLL, "TimeStamp: %s", v1);
  v3 = v2 & ~((int)v2 >> 31);
  if (v3 > 0x1FFE)
    goto LABEL_7;
  v4 = 0x1FFFLL - v3;
  v5 = snprintf(&byte_1ED83AB34[v3], v4, "Hardware: %s\n", (const char *)&xmmword_1ED83AAC9);
  if (v5 < 1)
  {
    v2 &= ~((int)v2 >> 31);
  }
  else
  {
    v2 = v5 + v3;
    if ((v5 + v3) > 0x1FFE)
      goto LABEL_7;
    v4 = 0x1FFFLL - v2;
    v3 = (v5 + v3);
  }
  v6 = snprintf(&byte_1ED83AB34[v3], v4, "Software: %s\n", (const char *)&xmmword_1ED83AAE9);
  v2 += v6 & ~(v6 >> 31);
LABEL_7:
  v7 = (const __CFString *)MGCopyAnswer();
  if (v7 && CFStringGetCString(v7, buffer, 32, 0x8000100u) && v2 <= 0x1FFE)
  {
    v8 = snprintf(&byte_1ED83AB34[v2], 0x1FFFLL - v2, "Platform: %s\n", buffer);
    v2 += v8 & ~(v8 >> 31);
  }
  v9 = MGCopyAnswer();
  if (v9 && v2 <= 0x1FFE)
  {
    v10 = "NO";
    if (v9 == *MEMORY[0x1E0C9AE50])
      v10 = "YES";
    v11 = snprintf(&byte_1ED83AB34[v2], 0x1FFFLL - v2, "OLEDDisplay: %s\n", v10);
    v2 += v11 & ~(v11 >> 31);
  }
  v12 = snprintf(&byte_1ED83AB34[v2], 0x1FFFLL - (int)v2, "MainDisplay: %d\n", dword_1ED83AA58);
  v112 = (std::mutex *)qword_1ED83AAC0;
  std::mutex::lock((std::mutex *)qword_1ED83AAC0);
  v13 = 0;
  LODWORD(v14) = v12 + v2;
  do
  {
    v15 = qword_1ED83AAB8;
    v16 = qword_1ED83AAB8 + 584 * v13;
    if (*(_DWORD *)(v16 + 320) == -559038737)
      goto LABEL_229;
    if (v14 <= 0x1FFE)
    {
      v17 = 0x1FFFLL - v14;
      v18 = snprintf(&byte_1ED83AB34[v14], v17, "Display: %d\n", *(_DWORD *)(v16 + 320));
      if (v18 <= 0)
      {
        v19 = v14;
      }
      else
      {
        v14 = (v18 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_47;
        v17 = 0x1FFFLL - v14;
        v19 = v14;
      }
      v20 = snprintf(&byte_1ED83AB34[v19], v17, "    gEDRDisplay:\n");
      if (v20 < 1)
      {
        LODWORD(v21) = v14;
      }
      else
      {
        LODWORD(v21) = v20 + v14;
        LODWORD(v14) = v21;
        if (v21 > 0x1FFE)
          goto LABEL_47;
      }
      v22 = sub_1C89482D4(v16);
      v23 = 0x1FFFLL - v21;
      v24 = "NO";
      if (v22)
        v24 = "YES";
      v25 = snprintf(&byte_1ED83AB34[v21], 0x1FFFLL - v21, "        IsEDREnabled = %s\n", v24);
      if (v25 < 1)
      {
        v26 = v21;
      }
      else
      {
        v21 = (v25 + v21);
        if (v21 > 0x1FFE)
          goto LABEL_44;
        v23 = 0x1FFFLL - v21;
        v26 = v21;
      }
      v27 = snprintf(&byte_1ED83AB34[v26], v23, "        CurrentBrightness:\n");
      if (v27 < 1 || (LODWORD(v21) = v27 + v21, LODWORD(v14) = v21, v21 <= 0x1FFE))
      {
        v28 = sub_1C89476D4(v16);
        v29 = snprintf(&byte_1ED83AB34[v21], 0x1FFFLL - v21, "            backlightBrightness = %f\n", v28);
        if (v29 <= 0 || (LODWORD(v21) = v29 + v21, LODWORD(v14) = v21, v21 <= 0x1FFE))
        {
          sub_1C89476D4(v16);
          v31 = snprintf(&byte_1ED83AB34[v21], 0x1FFFLL - v21, "            edrScalingValue = %f\n", v30);
          if (v31 <= 0 || (LODWORD(v21) = v31 + v21, LODWORD(v14) = v21, v21 <= 0x1FFE))
          {
            v32 = sub_1C8948FA8(v16);
            v33 = snprintf(&byte_1ED83AB34[v21], 0x1FFFLL - v21, "        TargetBrightness = %f\n", v32);
            if (v33 < 1 || (LODWORD(v21) = v33 + v21, LODWORD(v14) = v21, v21 <= 0x1FFE))
            {
              v34 = sub_1C8949004(v16);
              v35 = 0x1FFFLL - v21;
              v36 = snprintf(&byte_1ED83AB34[v21], v35, "        TimeStep = %f\n", v34);
              if (v36 < 1)
              {
                v37 = v21;
              }
              else
              {
                v21 = (v36 + v21);
                if (v21 > 0x1FFE)
                {
LABEL_44:
                  LODWORD(v14) = v21;
                  goto LABEL_47;
                }
                v35 = 0x1FFFLL - v21;
                v37 = v21;
              }
              v38 = snprintf(&byte_1ED83AB34[v37], v35, "    gScalingFactorLimits: (pid, cid) -> limit\n");
              LODWORD(v14) = (v38 & ~(v38 >> 31)) + v21;
            }
          }
        }
      }
    }
LABEL_47:
    v39 = v15 + 584 * v13;
    v40 = *(float **)(v39 + 296);
    v41 = (float *)(v39 + 304);
    if (v40 != (float *)(v39 + 304))
    {
      do
      {
        if (v14 <= 0x1FFE)
        {
          v42 = snprintf(&byte_1ED83AB34[v14], 0x1FFFLL - v14, "        (%d, %d) -> %f\n", HIDWORD(*((_QWORD *)v40 + 4)), *((_QWORD *)v40 + 4), v40[10]);
          LODWORD(v14) = (v42 & ~(v42 >> 31)) + v14;
        }
        v43 = (float *)*((_QWORD *)v40 + 1);
        if (v43)
        {
          do
          {
            v44 = v43;
            v43 = *(float **)v43;
          }
          while (v43);
        }
        else
        {
          do
          {
            v44 = (float *)*((_QWORD *)v40 + 2);
            v45 = *(_QWORD *)v44 == (_QWORD)v40;
            v40 = v44;
          }
          while (!v45);
        }
        v40 = v44;
      }
      while (v44 != v41);
    }
    if (v14 < 0x1FFF)
    {
      v46 = 0x1FFFLL - v14;
      v47 = snprintf(&byte_1ED83AB34[v14], v46, "    gDefaultMinScalingFactor = %f\n", *(float *)(v15 + 584 * v13 + 324));
      if (v47 < 1)
      {
        v48 = v14;
      }
      else
      {
        v14 = (v47 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v49 = snprintf(&byte_1ED83AB34[v48], v46, "    gDefaultRampingSpeedFactor = %f\n", *(float *)(v15 + 584 * v13 + 328));
      if (v49 >= 1)
      {
        v14 = (v49 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v50 = snprintf(&byte_1ED83AB34[v48], v46, "    gDefaultBrightnessAnimationTimeStepFactor = %f\n", *(float *)(v15 + 584 * v13 + 332));
      if (v50 >= 1)
      {
        v14 = (v50 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v51 = snprintf(&byte_1ED83AB34[v48], v46, "    gDefaultTransitionAnimationTimeStepFactor = %f\n", *(float *)(v15 + 584 * v13 + 336));
      if (v51 >= 1)
      {
        v14 = (v51 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v52 = snprintf(&byte_1ED83AB34[v48], v46, "    gMinScalingFactor = %f\n", *(float *)(v15 + 584 * v13 + 340));
      if (v52 >= 1)
      {
        v14 = (v52 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v53 = snprintf(&byte_1ED83AB34[v48], v46, "    gRampingSpeedFactor = %f\n", *(float *)(v15 + 584 * v13 + 344));
      if (v53 >= 1)
      {
        v14 = (v53 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v54 = snprintf(&byte_1ED83AB34[v48], v46, "    gBrightnessAnimationTimeStepFactor = %f\n", *(float *)(v15 + 584 * v13 + 348));
      if (v54 >= 1)
      {
        v14 = (v54 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v55 = snprintf(&byte_1ED83AB34[v48], v46, "    gTransitionAnimationTimeStepFactor = %f\n", *(float *)(v15 + 584 * v13 + 352));
      if (v55 >= 1)
      {
        v14 = (v55 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v56 = snprintf(&byte_1ED83AB34[v48], v46, "    gMaxLuminance = %f\n", *(float *)(v15 + 584 * v13 + 356));
      if (v56 >= 1)
      {
        v14 = (v56 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v57 = snprintf(&byte_1ED83AB34[v48], v46, "    gAmbientIlluminance = %f\n", *(float *)(v15 + 584 * v13 + 360));
      if (v57 >= 1)
      {
        v14 = (v57 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v58 = snprintf(&byte_1ED83AB34[v48], v46, "    gTargetBrightness = %f\n", *(float *)(v15 + 584 * v13 + 364));
      if (v58 >= 1)
      {
        v14 = (v58 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v59 = "Yes";
      if (!*(_BYTE *)(v15 + 584 * v13 + 368))
        v59 = "No";
      v60 = snprintf(&byte_1ED83AB34[v48], v46, "    gAccessibilityLimit = %s\n", v59);
      if (v60 >= 1)
      {
        v14 = (v60 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v61 = snprintf(&byte_1ED83AB34[v48], v46, "    gSBIMRequestedScalingFactor = %f\n", *(float *)(v15 + 584 * v13 + 372));
      if (v61 >= 1)
      {
        v14 = (v61 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v62 = snprintf(&byte_1ED83AB34[v48], v46, "    gScalingConstraints:\n");
      if (v62 >= 1)
      {
        v14 = (v62 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v63 = snprintf(&byte_1ED83AB34[v48], v46, "        SystemDefault = %f\n", *(float *)(v15 + 584 * v13 + 376));
      if (v63 >= 1)
      {
        v14 = (v63 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v64 = snprintf(&byte_1ED83AB34[v48], v46, "        Brightness = %f\n", *(float *)(v15 + 584 * v13 + 380));
      if (v64 >= 1)
      {
        v14 = (v64 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v65 = snprintf(&byte_1ED83AB34[v48], v46, "        ClientMaximum = %f\n", *(float *)(v15 + 584 * v13 + 384));
      if (v65 >= 1)
      {
        v14 = (v65 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v66 = snprintf(&byte_1ED83AB34[v48], v46, "        SBIM = %f\n", *(float *)(v15 + 584 * v13 + 388));
      if (v66 >= 1)
      {
        v14 = (v66 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v67 = snprintf(&byte_1ED83AB34[v48], v46, "        kLowPowerMode = %f\n", *(float *)(v15 + 584 * v13 + 392));
      if (v67 >= 1)
      {
        v14 = (v67 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v68 = snprintf(&byte_1ED83AB34[v48], v46, "        Accessibility = %f\n", *(float *)(v15 + 584 * v13 + 396));
      if (v68 >= 1)
      {
        v14 = (v68 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v69 = "Yes";
      if (!*(_BYTE *)(v15 + 584 * v13 + 400))
        v69 = "No";
      v70 = snprintf(&byte_1ED83AB34[v48], v46, "    gLowPowerMode = %s\n", v69);
      if (v70 >= 1)
      {
        v14 = (v70 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v71 = snprintf(&byte_1ED83AB34[v48], v46, "    gFramebuffer => %p\n", *(const void **)(v15 + 584 * v13 + 408));
      if (v71 >= 1)
      {
        v14 = (v71 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v72 = snprintf(&byte_1ED83AB34[v48], v46, "    gService = %d\n", *(_DWORD *)(v15 + 584 * v13 + 416));
      if (v72 >= 1)
      {
        v14 = (v72 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v73 = snprintf(&byte_1ED83AB34[v48], v46, "    gSBIMTimer => %p\n", *(const void **)(v15 + 584 * v13 + 424));
      if (v73 >= 1)
      {
        v14 = (v73 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v74 = snprintf(&byte_1ED83AB34[v48], v46, "    gMitigationTimer => %p\n", *(const void **)(v15 + 584 * v13 + 432));
      if (v74 >= 1)
      {
        v14 = (v74 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v75 = "Yes";
      if (!*(_BYTE *)(v15 + 584 * v13 + 440))
        v75 = "No";
      v76 = snprintf(&byte_1ED83AB34[v48], v46, "    gBurnInMitigatinEnabled = %s\n", v75);
      if (v76 >= 1)
      {
        v14 = (v76 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v77 = snprintf(&byte_1ED83AB34[v48], v46, "    gMinScalingFactorBySBIM = %f\n", *(float *)(v15 + 584 * v13 + 444));
      if (v77 >= 1)
      {
        v14 = (v77 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v78 = snprintf(&byte_1ED83AB34[v48], v46, "    gMitigationState:\n");
      if (v78 >= 1)
      {
        v14 = (v78 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v79 = *(int *)(v15 + 584 * v13 + 448);
      v80 = "UnknownMitigationStage";
      if (v79 <= 3)
        v80 = off_1E8203918[v79];
      v81 = snprintf(&byte_1ED83AB34[v48], v46, "        state = %s\n", v80);
      if (v81 >= 1)
      {
        v14 = (v81 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v82 = "Yes";
      if (!*(_BYTE *)(v15 + 584 * v13 + 452))
        v82 = "No";
      v83 = snprintf(&byte_1ED83AB34[v48], v46, "        violation = %s\n", v82);
      if (v83 >= 1)
      {
        v14 = (v83 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v84 = snprintf(&byte_1ED83AB34[v48], v46, "        sbim_timer_interval = %d\n", *(_DWORD *)(v15 + 584 * v13 + 460));
      if (v84 >= 1)
      {
        v14 = (v84 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v85 = snprintf(&byte_1ED83AB34[v48], v46, "        mitigation_timer_interval = %d\n", *(_DWORD *)(v15 + 584 * v13 + 464));
      if (v85 >= 1)
      {
        v14 = (v85 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v86 = snprintf(&byte_1ED83AB34[v48], v46, "        sbim_timer_size = %d\n", *(_DWORD *)(v15 + 584 * v13 + 468));
      if (v86 >= 1)
      {
        v14 = (v86 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v87 = snprintf(&byte_1ED83AB34[v48], v46, "        delta_factor = %f\n", *(float *)(v15 + 584 * v13 + 472));
      if (v87 >= 1)
      {
        v14 = (v87 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v88 = snprintf(&byte_1ED83AB34[v48], v46, "        minutes_per_stop_mitigate = %f\n", *(float *)(v15 + 584 * v13 + 476));
      if (v88 >= 1)
      {
        v14 = (v88 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v89 = snprintf(&byte_1ED83AB34[v48], v46, "        minutes_per_stop_recovery = %f\n", *(float *)(v15 + 584 * v13 + 480));
      if (v89 >= 1)
      {
        v14 = (v89 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v90 = snprintf(&byte_1ED83AB34[v48], v46, "        sbim_above_max = %f\n", *(float *)(v15 + 584 * v13 + 484));
      if (v90 >= 1)
      {
        v14 = (v90 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v91 = snprintf(&byte_1ED83AB34[v48], v46, "        sbim_sustain_max = %f\n", *(float *)(v15 + 584 * v13 + 488));
      if (v91 >= 1)
      {
        v14 = (v91 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v92 = snprintf(&byte_1ED83AB34[v48], v46, "        sbim_above_num = %f\n", *(float *)(v15 + 584 * v13 + 492));
      if (v92 >= 1)
      {
        v14 = (v92 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v93 = snprintf(&byte_1ED83AB34[v48], v46, "        sbim_sustain_num = %f\n", *(float *)(v15 + 584 * v13 + 496));
      if (v93 >= 1)
      {
        v14 = (v93 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v94 = snprintf(&byte_1ED83AB34[v48], v46, "        lastStateUpdate_ = %f\n", *(double *)(v15 + 584 * v13 + 504));
      if (v94 >= 1)
      {
        v14 = (v94 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v95 = snprintf(&byte_1ED83AB34[v48], v46, "        sbim_read_stage = %d\n", *(_DWORD *)(v15 + 584 * v13 + 512));
      if (v95 >= 1)
      {
        v14 = (v95 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v96 = snprintf(&byte_1ED83AB34[v48], v46, "        lastSBIMBlock_:\n");
      if (v96 >= 1)
      {
        v14 = (v96 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v97 = snprintf(&byte_1ED83AB34[v48], v46, "            version = %d\n", *(_DWORD *)(v15 + 584 * v13 + 520));
      if (v97 >= 1)
      {
        v14 = (v97 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v98 = snprintf(&byte_1ED83AB34[v48], v46, "            sbim = (%d, %d, %d)\n", *(_DWORD *)(v15 + 584 * v13 + 528), *(_DWORD *)(v15 + 584 * v13 + 532), *(_DWORD *)(v15 + 584 * v13 + 536));
      if (v98 >= 1)
      {
        v14 = (v98 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v99 = snprintf(&byte_1ED83AB34[v48], v46, "            duration_us = %lld\n", *(_QWORD *)(v15 + 584 * v13 + 544));
      if (v99 >= 1)
      {
        v14 = (v99 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v100 = snprintf(&byte_1ED83AB34[v48], v46, "    gBrightnessScaler = %f\n", *(float *)(v15 + 584 * v13 + 556));
      if (v100 >= 1)
      {
        v14 = (v100 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v101 = "Yes";
      if (!*(_BYTE *)(v15 + 584 * v13 + 552))
        v101 = "No";
      v102 = snprintf(&byte_1ED83AB34[v48], v46, "    gSBIMSupported = %s\n", v101);
      if (v102 >= 1)
      {
        v14 = (v102 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v103 = snprintf(&byte_1ED83AB34[v48], v46, "    gServerData:\n");
      if (v103 >= 1)
      {
        v14 = (v103 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v104 = snprintf(&byte_1ED83AB34[v48], v46, "        Brightness = %f\n", *(float *)(v15 + 584 * v13 + 560));
      if (v104 >= 1)
      {
        v14 = (v104 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v105 = snprintf(&byte_1ED83AB34[v48], v46, "        Backlight = %f\n", *(float *)(v15 + 584 * v13 + 564));
      if (v105 >= 1)
      {
        v14 = (v105 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v106 = snprintf(&byte_1ED83AB34[v48], v46, "        EDRScalingValue = %f\n", *(float *)(v15 + 584 * v13 + 568));
      if (v106 >= 1)
      {
        v14 = (v106 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v107 = snprintf(&byte_1ED83AB34[v48], v46, "        MaxLuminance = %f\n", *(float *)(v15 + 584 * v13 + 572));
      if (v107 >= 1)
      {
        v14 = (v107 + v14);
        if (v14 > 0x1FFE)
          goto LABEL_229;
        v46 = 0x1FFFLL - v14;
        v48 = v14;
      }
      v108 = snprintf(&byte_1ED83AB34[v48], v46, "        Ambient = %f\n", *(float *)(v15 + 584 * v13 + 576));
      LODWORD(v14) = (v108 & ~(v108 >> 31)) + v14;
    }
LABEL_229:
    ++v13;
  }
  while (v13 != 16);
  v109 = open("/var/tmp/libEDR_Server_State.txt", 1793, 420);
  v110 = v109;
  if (v109 >= 1)
  {
    v111 = strlen(byte_1ED83AB34);
    write(v110, byte_1ED83AB34, v111);
    close(v110);
  }
  std::mutex::unlock(v112);
}

void sub_1C894FFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::mutex *a12)
{
  std::mutex::unlock(a12);
  _Unwind_Resume(a1);
}

void sub_1C894FFE4()
{
  NSObject *v0;

  dispatch_get_global_queue(0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch("com.apple.libEDR.DumpState", &dword_1ED83CB4C, v0, &unk_1E8203840);

}

void sub_1C895003C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C8950050()
{
  char *v0;
  char *v1;
  NSObject *v2;
  char *__lasts;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sub_1C894EAEC();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v5 = "EDRServerDumpStateToSysLog";
    v6 = 2048;
    v7 = byte_1ED83AB34;
    v8 = 1024;
    v9 = strlen(byte_1ED83AB34);
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: data => %p size = %d\n", buf, 0x1Cu);
  }
  __lasts = 0;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - Server State Begin\n", buf, 2u);
  }
  v0 = strtok_r(byte_1ED83AB34, "\n", &__lasts);
  if (v0)
  {
    v1 = v0;
    v2 = MEMORY[0x1E0C81028];
    do
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v5 = v1;
        _os_log_impl(&dword_1C8945000, v2, OS_LOG_TYPE_INFO, "libEDR - Server State: %s\n", buf, 0xCu);
      }
      v1 = strtok_r(0, "\n", &__lasts);
    }
    while (v1);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - Server State End\n", buf, 2u);
  }
}

BOOL sub_1C895024C(int a1)
{
  uint64_t v2;
  uint64_t v3;
  io_registry_entry_t v4;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v6;
  _BOOL8 v7;
  const char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (dword_1ED83AA58 != a1)
    return 0;
  v2 = sub_1C8947738(a1);
  if (!v2)
    return 0;
  v3 = v2;
  sub_1C8950814(a1);
  v4 = *(_DWORD *)(v3 + 416);
  if (!v4)
    return 0;
  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v4, CFSTR("enableSBIM"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    v7 = CFBooleanGetValue(CFProperty) != 0;
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v9 = "No";
    if (v7)
      v9 = "Yes";
    v10 = 136315394;
    v11 = "EDRServerSBIMIsEnabled";
    v12 = 2080;
    v13 = v9;
    _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s => %s\n", (uint8_t *)&v10, 0x16u);
  }
  return v7;
}

void sub_1C895038C(int a1, int a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  io_registry_entry_t v7;
  CFTypeRef *v8;
  kern_return_t v9;
  kern_return_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (dword_1ED83AA58 == a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = "No";
      v12 = "EDRServerEnableSBIM";
      v11 = 136315650;
      if (a2)
        v4 = "Yes";
      v13 = 1024;
      v14 = a1;
      v15 = 2080;
      v16 = v4;
      _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: did=%d enable=%s\n", (uint8_t *)&v11, 0x1Cu);
    }
    v5 = sub_1C8947738(a1);
    if (v5)
    {
      v6 = v5;
      sub_1C8950814(a1);
      v7 = *(_DWORD *)(v6 + 416);
      if (v7)
      {
        if (*(_BYTE *)(v6 + 552))
        {
          v8 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
          if (!a2)
            v8 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
          v9 = IORegistryEntrySetCFProperty(v7, CFSTR("enableSBIM"), *v8);
          if (v9)
          {
            v10 = v9;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              sub_1C89563A0();
            if (v10 == -536870201)
              *(_BYTE *)(v6 + 552) = 0;
          }
        }
      }
    }
  }
}

void sub_1C8950508(int a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  dispatch_source_t v5;
  void *v6;
  unsigned int i;
  int v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  dispatch_source_t v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
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
  _QWORD v34[4];
  int v35;
  _QWORD handler[4];
  int v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (dword_1ED83AA58 == a1)
  {
    v2 = sub_1C8947738(a1);
    if (v2)
    {
      v3 = v2;
      *(_DWORD *)(v2 + 444) = *(_DWORD *)(v2 + 324);
      if (!*(_QWORD *)(v2 + 424))
      {
        dispatch_get_global_queue(0, 0);
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
        v6 = *(void **)(v3 + 424);
        *(_QWORD *)(v3 + 424) = v5;

        *(_DWORD *)(v3 + 512) = 0;
        if (*(_DWORD *)(v3 + 448))
        {
          for (i = fmin((double)vcvtad_u64_f64((sub_1C8947E5C() - *(double *)(v3 + 504))/ (double)(60 * *(_DWORD *)(v3 + 460))), 6.0); i; --i)
            sub_1C89510C4(v3 + 448, (__int128 *)(v3 + 520), 0, 0.0, 0.0, 100.0);
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v8 = *(_DWORD *)(v3 + 448);
            *(_DWORD *)buf = 136315394;
            v39 = "FastForwardMitigationState";
            v40 = 1024;
            v41 = v8;
            _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: fastforward sbim to stage %d\n", buf, 0x12u);
          }
        }
        v9 = *(NSObject **)(v3 + 424);
        if (v9)
        {
          v10 = dispatch_time(0, 1000000000);
          dispatch_source_set_timer(v9, v10, 1000000000 * *(unsigned int *)(v3 + 460), 1000000000 * *(unsigned int *)(v3 + 460));
          v11 = MEMORY[0x1E0C809B0];
          v12 = *(NSObject **)(v3 + 424);
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = sub_1C89508B8;
          handler[3] = &unk_1E8203860;
          v37 = a1;
          dispatch_source_set_event_handler(v12, handler);
          dispatch_resume(*(dispatch_object_t *)(v3 + 424));
          v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
          v14 = *(void **)(v3 + 432);
          *(_QWORD *)(v3 + 432) = v13;

          v15 = *(NSObject **)(v3 + 432);
          if (v15)
          {
            v16 = dispatch_time(0, 1000000000);
            dispatch_source_set_timer(v15, v16, 1000000000 * *(unsigned int *)(v3 + 464), 1000000000 * *(unsigned int *)(v3 + 464));
            v17 = *(NSObject **)(v3 + 432);
            v34[0] = v11;
            v34[1] = 3221225472;
            v34[2] = sub_1C8950C18;
            v34[3] = &unk_1E8203860;
            v35 = a1;
            dispatch_source_set_event_handler(v17, v34);
            dispatch_resume(*(dispatch_object_t *)(v3 + 432));
LABEL_17:

            return;
          }
          v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v26)
            sub_1C8956488(v26, v27, v28, v29, v30, v31, v32, v33);
        }
        else
        {
          v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v18)
            sub_1C8956414(v18, v19, v20, v21, v22, v23, v24, v25);
        }
        sub_1C894AA74(a1);
        goto LABEL_17;
      }
    }
  }
}

void sub_1C89507F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C8950814(int a1)
{
  uint64_t v1;
  _DWORD *v2;
  _QWORD *v3;
  int ServiceObject;

  v1 = sub_1C8947738(a1);
  if (v1 && !*(_DWORD *)(v1 + 416))
  {
    v2 = (_DWORD *)(v1 + 416);
    v3 = (_QWORD *)(v1 + 408);
    if (IOMobileFramebufferGetMainDisplay())
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        sub_1C8956574();
LABEL_6:
      *v3 = 0;
      *v2 = 0;
      return;
    }
    ServiceObject = IOMobileFramebufferGetServiceObject();
    *v2 = ServiceObject;
    if (!ServiceObject)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        sub_1C89564FC();
      goto LABEL_6;
    }
  }
}

void sub_1C89508B8(uint64_t a1)
{
  int v1;
  std::mutex *v2;
  uint64_t v3;
  uint64_t v4;
  int Block;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  _DWORD *v13;
  char v15;
  uint64_t v16;
  const char *v17;
  int v18;
  unint64_t v19;
  int v20;
  __int128 v21;
  __int128 v22;
  _BOOL4 v23;
  _BYTE buf[24];
  void *v25;
  _BYTE v26[40];
  const char *v27;
  unint64_t v28;
  unint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 32);
  v2 = (std::mutex *)qword_1ED83AAC0;
  std::mutex::lock((std::mutex *)qword_1ED83AAC0);
  v3 = sub_1C8947738(v1);
  if (v3)
  {
    v4 = v3;
    v23 = *(_DWORD *)(v3 + 512) == 0;
    Block = IOMobileFramebufferGetBlock();
    if (Block)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "sbimTimerHandler";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = Block;
        _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: IOMobileFramebufferGetBlock() => 0x%x\n", buf, 0x12u);
      }
    }
    else
    {
      v6 = sub_1C89476D4(v4);
      v8 = v7;
      v9 = log2f(1.0 / v7);
      v10 = log2f(1.0 / *(float *)(v4 + 372));
      v11 = v6 * (float)(v8 * *(float *)(v4 + 356));
      v12 = *(unsigned int *)(v4 + 468);
      if ((_DWORD)v12)
      {
        v13 = (_DWORD *)&v21 + 2;
        do
        {
          *v13++ *= 2;
          --v12;
        }
        while (v12);
      }
      v15 = *(_DWORD *)(v4 + 512) == 1 || v23;
      sub_1C89510C4(v4 + 448, &v21, v15, v9, v10, v11);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v16 = *(int *)(v4 + 448);
        if (v16 > 3)
          v17 = "UnknownMitigationStage";
        else
          v17 = off_1E8203918[v16];
        v18 = *(unsigned __int8 *)(v4 + 452);
        *(double *)&v19 = *(float *)(v4 + 492);
        v20 = *(_DWORD *)(v4 + 512);
        *(_DWORD *)buf = 136318210;
        *(_QWORD *)&buf[4] = "sbimTimerHandler";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = DWORD2(v21);
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = HIDWORD(v21);
        LOWORD(v25) = 1024;
        *(_DWORD *)((char *)&v25 + 2) = v22;
        HIWORD(v25) = 2048;
        *(_QWORD *)v26 = *((_QWORD *)&v22 + 1);
        *(_WORD *)&v26[8] = 2048;
        *(double *)&v26[10] = v11;
        *(_WORD *)&v26[18] = 2048;
        *(double *)&v26[20] = v10;
        *(_WORD *)&v26[28] = 2048;
        *(double *)&v26[30] = v9;
        *(_WORD *)&v26[38] = 2080;
        v27 = v17;
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v18;
        HIWORD(v28) = 2048;
        v29 = v19;
        v30 = 1024;
        v31 = v20;
        v32 = 1024;
        v33 = v23;
        _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: SBIM rgb=(%u, %u, %u), duration=%llu, refWhite: %f, HR_request: %f, HR_in: %f, state: %s, violation: %d, sbim_above: %f, sbim_read_stage: %d, sbim_reset: %d", buf, 0x6Cu);
      }
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1C8951A10;
      v25 = &unk_1E8203880;
      *(_OWORD *)v26 = v21;
      *(_OWORD *)&v26[16] = v22;
      v28 = __PAIR64__(LODWORD(v10), LODWORD(v11));
      v29 = __PAIR64__(v23, LODWORD(v9));
      *(_QWORD *)&v26[32] = v4;
      v27 = (const char *)(v4 + 512);
      AnalyticsSendEventLazy();
      *(_DWORD *)(v4 + 512) = (*(_DWORD *)(v4 + 512) + 1) % *(_DWORD *)(v4 + 456);
      sub_1C894B298();
    }
  }
  std::mutex::unlock(v2);
}

void sub_1C8950BFC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1C8950C18(uint64_t a1)
{
  uint64_t v1;
  std::mutex *v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  float v12;
  float v13;
  double v14;
  float v15;
  int v16;
  _BOOL4 v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  int v21;
  double v22;
  float v23;
  uint64_t v24;
  char v25;
  _BYTE buf[24];
  double v27;
  _BYTE v28[12];
  double v29;
  _BYTE v30[10];
  __int16 v31;
  int v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned int *)(a1 + 32);
  v2 = (std::mutex *)qword_1ED83AAC0;
  v24 = qword_1ED83AAC0;
  v25 = 1;
  std::mutex::lock((std::mutex *)qword_1ED83AAC0);
  v3 = sub_1C8947738(v1);
  if (!v3)
    goto LABEL_26;
  v4 = v3;
  v5 = sub_1C89476D4(v3);
  v7 = v6;
  v8 = log2f(1.0 / v6);
  v9 = log2f(1.0 / *(float *)(v4 + 372));
  v10 = atomic_load((unsigned __int8 *)&qword_1ED83CBA0);
  if ((v10 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83CBA0))
  {
    *(float *)&dword_1ED83CBD0 = (float)*(unsigned int *)(v4 + 464) / (float)(*(float *)(v4 + 476) * 60.0);
    __cxa_guard_release(&qword_1ED83CBA0);
  }
  v11 = atomic_load((unsigned __int8 *)&qword_1ED83CBA8);
  if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83CBA8))
  {
    *(float *)&dword_1ED83CBC8 = (float)*(unsigned int *)(v4 + 464) / (float)(*(float *)(v4 + 480) * 60.0);
    __cxa_guard_release(&qword_1ED83CBA8);
  }
  v12 = v9;
  switch(*(_DWORD *)(v4 + 448))
  {
    case 0:
      break;
    case 1:
      goto LABEL_8;
    case 2:
      v12 = v8;
      if (!*(_BYTE *)(v4 + 452))
        break;
      goto LABEL_8;
    case 3:
      if (*(_BYTE *)(v4 + 452))
      {
LABEL_8:
        v12 = fmax((float)(v8 - *(float *)&dword_1ED83CBD0), 0.0);
      }
      else if (v8 <= v9)
      {
        v12 = v8 + *(float *)&dword_1ED83CBC8;
      }
      else
      {
        v12 = fmaxf(v9, v8 - *(float *)&dword_1ED83CBC8);
      }
      break;
    default:
      v12 = 0.0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        sub_1C89565E8();
      break;
  }
  v13 = fminf(v9, v12);
  v14 = exp2(v13);
  v15 = v5 * (float)(v7 * *(float *)(v4 + 356));
  v16 = byte_1EF8FE518;
  v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
  if (v16)
  {
    if (!v17)
      goto LABEL_21;
    v18 = *(int *)(v4 + 448);
    if (v18 > 3)
      v19 = "UnknownMitigationStage";
    else
      v19 = off_1E8203918[v18];
  }
  else
  {
    if (!v17)
      goto LABEL_21;
    v20 = *(int *)(v4 + 448);
    if (v20 > 3)
      v19 = "UnknownMitigationStage";
    else
      v19 = off_1E8203918[v20];
  }
  v21 = *(unsigned __int8 *)(v4 + 452);
  v22 = *(float *)(v4 + 492);
  *(_DWORD *)buf = 136316930;
  *(_QWORD *)&buf[4] = "mitigationTimerHandler";
  *(_WORD *)&buf[12] = 2048;
  *(double *)&buf[14] = v15;
  *(_WORD *)&buf[22] = 2048;
  v27 = v9;
  *(_WORD *)v28 = 2048;
  *(double *)&v28[2] = v8;
  *(_WORD *)&v28[10] = 2048;
  v29 = v13;
  *(_WORD *)v30 = 2080;
  *(_QWORD *)&v30[2] = v19;
  v31 = 1024;
  v32 = v21;
  v33 = 2048;
  v34 = v22;
  _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: SBIM refWhite: %f, HR_request: %f, HR_current: %f, HR_out: %f, state: %s, violation: %d, sbim_above: %f\n", buf, 0x4Eu);
LABEL_21:
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_1C8951D74;
  v27 = COERCE_DOUBLE(&unk_1E82038A0);
  *(float *)&v28[8] = v15;
  v29 = COERCE_DOUBLE(__PAIR64__(LODWORD(v8), LODWORD(v9)));
  *(float *)v30 = v13;
  *(_QWORD *)v28 = v4;
  AnalyticsSendEventLazy();
  if (*(_BYTE *)(v4 + 452))
  {
    if (vabdd_f64(*(float *)(v4 + 444), 1.0 / v14) / *(float *)(v4 + 444) > 0.0001)
    {
      v23 = 1.0 / v14;
      *(float *)(v4 + 444) = v23;
      sub_1C8947F34((uint64_t)&v24);
      sub_1C8946BD0(v1, 0);
    }
  }
  if (v25)
  {
    v2 = (std::mutex *)v24;
LABEL_26:
    std::mutex::unlock(v2);
  }
}

void sub_1C8951094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  _Unwind_Resume(exception_object);
}

void sub_1C89510C4(uint64_t a1, __int128 *a2, char a3, float a4, float a5, float a6)
{
  unsigned __int8 v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  float *v23;
  float *v24;
  float v25;
  float *v26;
  float *v27;
  float *v28;
  float v29;
  float v30;
  float v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  int v35;
  int v36;
  int v37;
  _BOOL4 v38;
  float v39;
  float v40;
  int v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  __int128 v46;
  unint64_t v47;
  void *__p;
  _BYTE *v49;
  void *v50;
  char *v51;
  uint8_t buf[4];
  _BYTE v53[20];
  double v54;
  __int16 v55;
  double v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = atomic_load((unsigned __int8 *)&qword_1ED83CB98);
  if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83CB98))
  {
    v47 = *(unsigned int *)(a1 + 20);
    qword_1ED83CBE8 = 0;
    unk_1ED83CBF0 = 0;
    sub_1C8951850((uint64_t)&qword_1ED83CBE8, v47, 0.0);
    __cxa_atexit((void (*)(void *))sub_1C8951778, &qword_1ED83CBE8, &dword_1C8945000);
    __cxa_guard_release(&qword_1ED83CB98);
  }
  v13 = *(unsigned int *)(a1 + 20);
  v50 = 0;
  v51 = 0;
  if ((_DWORD)v13)
  {
    v14 = (char *)operator new(4 * v13);
    v50 = v14;
    bzero(v14, 4 * v13);
    v15 = &v14[4 * v13];
    v51 = v15;
    v16 = (char *)operator new(4 * v13);
    bzero(v16, 4 * v13);
    v17 = 0;
    v18 = &v16[4 * v13];
    if (v13 <= 1)
      v19 = 1;
    else
      v19 = v13;
    v20 = 4 * v19;
    do
    {
      *(float *)&v16[v17] = (float)*(unsigned int *)((char *)a2 + v17 + 8);
      v17 += 4;
    }
    while (v20 != v17);
    v21 = v13;
  }
  else
  {
    v21 = 0;
    v16 = 0;
    v18 = 0;
    v15 = 0;
    v14 = 0;
  }
  v22 = (v15 - v14) >> 2;
  if ((a3 & 1) != 0)
  {
    if (v22 != v21)
      sub_1C8951850((uint64_t)&v50, v21, 0.0);
    if ((_DWORD)v13)
    {
      v23 = (float *)v50;
      v24 = (float *)v16;
      do
      {
        v25 = *v24++;
        *v23++ = v25 * 0.03125;
        --v21;
      }
      while (v21);
    }
  }
  else
  {
    if (v22 != v21)
      sub_1C8951850((uint64_t)&v50, v21, 0.0);
    if ((_DWORD)v13)
    {
      v26 = (float *)v50;
      v27 = (float *)qword_1ED83CBE8;
      v28 = (float *)v16;
      do
      {
        v29 = *v28++;
        v30 = v29;
        v31 = *v27++;
        *v26++ = (float)(v30 - v31) * 0.03125;
        --v21;
      }
      while (v21);
    }
  }
  sub_1C89518D8((uint64_t)&qword_1ED83CBE8, v16, v18);
  v32 = atomic_load((unsigned __int8 *)&qword_1ED83CBB8);
  if ((v32 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83CBB8))
  {
    if (qword_1ED83CB58 != -1)
      dispatch_once(&qword_1ED83CB58, &unk_1E8201538);
    __cxa_guard_release(&qword_1ED83CBB8);
  }
  v33 = atomic_load((unsigned __int8 *)&qword_1ED83CBB0);
  if ((v33 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83CBB0))
  {
    qword_1ED83CBD8 = qword_1ED83AA20;
    __cxa_guard_release(&qword_1ED83CBB0);
  }
  v34 = atomic_load((unsigned __int8 *)&qword_1ED83CBC0);
  if ((v34 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83CBC0))
  {
    qword_1ED83CBE0 = qword_1ED83AA28;
    __cxa_guard_release(&qword_1ED83CBC0);
  }
  if (!qword_1ED83CBE0)
    __assert_rtn("SBIMLimitsByModel", "EDR.mm", 1976, "0 != curveSize");
  v35 = vcvtmd_s64_f64(a6 / 10.0 + 0.5);
  v36 = qword_1ED83CBE0 - 1;
  v37 = v35 & ~(v35 >> 31);
  if (v37 < (int)qword_1ED83CBE0 - 1)
    v36 = v37;
  sub_1C895199C(&__p, (const void *)(qword_1ED83CBD8 + 12 * v36), *(unsigned int *)(a1 + 20));
  *(_QWORD *)&v53[4] = &v50;
  *(_QWORD *)&v53[12] = &__p;
  v38 = sub_1C89517C8((uint64_t)buf);
  *(_BYTE *)(a1 + 4) = v38;
  switch(*(_DWORD *)a1)
  {
    case 0:
      if (v38)
      {
        v39 = *(float *)(a1 + 44) + -1.0;
        *(float *)(a1 + 44) = v39;
        if (v39 != 0.0)
          break;
        *(_DWORD *)a1 = 1;
      }
      *(_DWORD *)(a1 + 44) = *(_DWORD *)(a1 + 36);
      break;
    case 1:
      if (!v38)
      {
        *(_DWORD *)a1 = 2;
        *(_DWORD *)(a1 + 48) = *(_DWORD *)(a1 + 40);
      }
      break;
    case 2:
      v40 = *(float *)(a1 + 48) + -1.0;
      *(float *)(a1 + 48) = v40;
      if (v40 == 0.0)
      {
        *(_DWORD *)a1 = 3;
        *(_QWORD *)(a1 + 44) = *(_QWORD *)(a1 + 36);
      }
      break;
    case 3:
      if (vabds_f32(a4, a5) < (float)((float)(*(float *)(a1 + 24) * (float)*(unsigned int *)(a1 + 16))
                                     / (float)(fminf(*(float *)(a1 + 28), *(float *)(a1 + 32)) * 60.0)))
        *(_DWORD *)a1 = 0;
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        sub_1C895665C();
      break;
  }
  v41 = byte_1EF8FE518;
  v42 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
  if (v41)
  {
    if (!v42)
      goto LABEL_46;
  }
  else if (!v42)
  {
    goto LABEL_46;
  }
  v43 = *(float *)__p;
  v44 = *((float *)__p + 1);
  v45 = *((float *)__p + 2);
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)v53 = "UpdateMitigationState";
  *(_WORD *)&v53[8] = 2048;
  *(double *)&v53[10] = v43;
  *(_WORD *)&v53[18] = 2048;
  v54 = v44;
  v55 = 2048;
  v56 = v45;
  _os_log_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "libEDR - %s: SBIM limits [R: %f, G: %f, B: %f]\n", buf, 0x2Au);
LABEL_46:
  *(double *)(a1 + 56) = sub_1C8947E5C();
  v46 = *a2;
  *(_OWORD *)(a1 + 88) = a2[1];
  *(_OWORD *)(a1 + 72) = v46;
  if (__p)
  {
    if (v49 != __p)
      v49 += ((_BYTE *)__p - v49 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    operator delete(__p);
  }
  if (v16)
    operator delete(v16);
  if (v50)
  {
    if (v51 != v50)
      v51 += ((_BYTE *)v50 - v51 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    operator delete(v50);
  }
}

void sub_1C89516BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12)
{
  __cxa_guard_abort(&qword_1ED83CB98);
  _Unwind_Resume(a1);
}

uint64_t sub_1C8951778(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v3;

  v2 = *(_BYTE **)a1;
  if (v2)
  {
    v3 = *(_BYTE **)(a1 + 8);
    if (v3 != v2)
      *(_QWORD *)(a1 + 8) = &v3[(v2 - v3 + 3) & 0xFFFFFFFFFFFFFFFCLL];
    operator delete(v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  return a1;
}

BOOL sub_1C89517C8(uint64_t a1)
{
  uint64_t v1;
  float *v2;
  uint64_t v3;
  _BOOL4 v4;
  unint64_t v5;
  unint64_t v6;
  float *v7;
  float *v8;
  float v9;
  float v10;
  float v11;
  _BOOL4 v12;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(float **)v1;
  v3 = *(_QWORD *)(v1 + 8) - *(_QWORD *)v1;
  if (v3)
    v4 = *v2 > ***(float ***)(a1 + 16);
  else
    v4 = 0;
  if ((unint64_t)v3 >= 5)
  {
    v5 = v3 >> 2;
    if (v5 <= 2)
      v5 = 2;
    v6 = v5 - 1;
    v7 = v2 + 1;
    v8 = (float *)(**(_QWORD **)(a1 + 16) + 4);
    do
    {
      v9 = *v7++;
      v10 = v9;
      v11 = *v8++;
      v12 = v10 > v11;
      if (v12 && !v4)
        v4 = v12;
      --v6;
    }
    while (v6);
  }
  return v4;
}

void sub_1C8951850(uint64_t a1, unint64_t a2, float a3)
{
  _BYTE *v6;
  _BYTE *v7;
  float *v8;

  v6 = *(_BYTE **)a1;
  if (v6)
  {
    v7 = *(_BYTE **)(a1 + 8);
    if (v7 != v6)
      *(_QWORD *)(a1 + 8) = &v7[(v6 - v7 + 3) & 0xFFFFFFFFFFFFFFFCLL];
    operator delete(v6);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  if (a2)
  {
    if (a2 >> 62)
      sub_1C89491F0();
    v8 = (float *)operator new(4 * a2);
    *(_QWORD *)a1 = v8;
    do
    {
      *v8++ = a3;
      --a2;
    }
    while (a2);
    *(_QWORD *)(a1 + 8) = v8;
  }
}

uint64_t sub_1C89518D8(uint64_t a1, _BYTE *__src, _BYTE *a3)
{
  size_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  char *v11;

  v6 = a3 - __src;
  v7 = (a3 - __src) >> 2;
  v8 = *(_BYTE **)a1;
  v9 = *(_BYTE **)(a1 + 8);
  if (v7 == (v9 - v8) >> 2)
  {
    if (a3 != __src)
      memmove(v8, __src, a3 - __src);
  }
  else
  {
    if (v8)
    {
      if (v9 != v8)
        *(_QWORD *)(a1 + 8) = &v9[(v8 - v9 + 3) & 0xFFFFFFFFFFFFFFFCLL];
      operator delete(v8);
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
    if ((v6 & 0x8000000000000000) != 0)
      sub_1C89491F0();
    v11 = (char *)operator new(v6);
    *(_QWORD *)a1 = v11;
    *(_QWORD *)(a1 + 8) = &v11[4 * v7];
    if (__src != a3)
      memcpy(v11, __src, ((v6 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4);
  }
  return a1;
}

_QWORD *sub_1C895199C(_QWORD *a1, const void *a2, unint64_t a3)
{
  char *v6;

  *a1 = 0;
  a1[1] = 0;
  if (a3)
  {
    if (a3 >> 62)
      sub_1C89491F0();
    v6 = (char *)operator new(4 * a3);
    *a1 = v6;
    memcpy(v6, a2, 4 * a3);
    a1[1] = &v6[4 * a3];
  }
  return a1;
}

id sub_1C8951A10(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[12];
  _QWORD v23[14];

  v23[12] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("SBIM_red");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v22[1] = CFSTR("SBIM_green");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v20;
  v22[2] = CFSTR("SBIM_blue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v19;
  v22[3] = CFSTR("SBIM_duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v2;
  v22[4] = CFSTR("refWhite");
  LODWORD(v3) = *(_DWORD *)(a1 + 80);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v4;
  v22[5] = CFSTR("HR_request");
  LODWORD(v5) = *(_DWORD *)(a1 + 84);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v6;
  v22[6] = CFSTR("HR_current");
  LODWORD(v7) = *(_DWORD *)(a1 + 88);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v8;
  v22[7] = CFSTR("state");
  v9 = *(int *)(*(_QWORD *)(a1 + 64) + 448);
  if (v9 > 3)
    v10 = "UnknownMitigationStage";
  else
    v10 = off_1E8203918[v9];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v11;
  v22[8] = CFSTR("violation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 64) + 452));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v12;
  v22[9] = CFSTR("above");
  LODWORD(v13) = *(_DWORD *)(*(_QWORD *)(a1 + 64) + 492);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v14;
  v22[10] = CFSTR("read_stage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", **(unsigned int **)(a1 + 72));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v15;
  v22[11] = CFSTR("reset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void sub_1C8951CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

id sub_1C8951D74(uint64_t a1, double a2)
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[7];
  _QWORD v19[8];

  v19[7] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("refWhite");
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v18[1] = CFSTR("HR_request");
  LODWORD(v4) = *(_DWORD *)(a1 + 44);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("HR_current");
  LODWORD(v6) = *(_DWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("HR_out");
  LODWORD(v8) = *(_DWORD *)(a1 + 52);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  v18[4] = CFSTR("state");
  v10 = *(int *)(*(_QWORD *)(a1 + 32) + 448);
  if (v10 > 3)
    v11 = "UnknownMitigationStage";
  else
    v11 = off_1E8203918[v10];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v12;
  v18[5] = CFSTR("violation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 452));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v13;
  v18[6] = CFSTR("above");
  LODWORD(v14) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 492);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void sub_1C8951F4C(_Unwind_Exception *a1)
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

uint64_t **sub_1C8951FAC(uint64_t **a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
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
    *((_DWORD *)v11 + 10) = 0;
    sub_1C894E740(a1, (uint64_t)v9, v7, v11);
    return (uint64_t **)v11;
  }
  return v9;
}

id sub_1C895206C(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  _QWORD v25[11];
  _QWORD v26[13];

  v26[11] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("Hardware");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &xmmword_1ED83AAC9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v24;
  v25[1] = CFSTR("Software");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &xmmword_1ED83AAE9);
  v23 = objc_claimAutoreleasedReturnValue();
  v26[1] = v23;
  v25[2] = CFSTR("IsEDREnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", sub_1C89482D4(*(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v2;
  v25[3] = CFSTR("MinScalingFactor");
  LODWORD(v3) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 340);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v26[3] = v4;
  v26[4] = v5;
  v25[4] = CFSTR("ScalingFactorLimits");
  v25[5] = CFSTR("DefaultMinScalingFactor");
  LODWORD(v7) = *(_DWORD *)(v6 + 324);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v8;
  v25[6] = CFSTR("TargetBrightness");
  LODWORD(v9) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 364);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v10;
  v25[7] = CFSTR("MaxLuminance");
  LODWORD(v11) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 356);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v12;
  v25[8] = CFSTR("AmbientIlluminance");
  LODWORD(v13) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 360);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v14;
  v25[9] = CFSTR("BrightnessScaler");
  LODWORD(v15) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 556);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[9] = v16;
  v25[10] = CFSTR("MitigationState");
  v17 = *(int *)(*(_QWORD *)(a1 + 40) + 448);
  if (v17 > 3)
    v18 = "UnknownMitigationStage";
  else
    v18 = off_1E8203918[v17];
  v19 = (void *)v23;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18, v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[10] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void sub_1C89522FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
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

uint64_t *sub_1C8952388(uint64_t **a1, unsigned int *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unsigned int v7;
  uint64_t **v8;
  unsigned int v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v10 + 28) = *a3;
    sub_1C894E740(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t sub_1C8952440(uint64_t a1, unsigned int *a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = a1 + 8;
  do
  {
    v5 = *(_DWORD *)(v2 + 32);
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = (uint64_t *)v2;
    else
      v7 = (uint64_t *)(v2 + 8);
    if (v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32))
    return 0;
  sub_1C89524A4((uint64_t **)a1, v4);
  return 1;
}

uint64_t *sub_1C89524A4(uint64_t **a1, uint64_t a2)
{
  uint64_t *v3;

  v3 = sub_1C894E214(a1, (uint64_t *)a2);

  operator delete((void *)a2);
  return v3;
}

uint64_t **sub_1C89524E4(uint64_t **a1, unsigned int *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unsigned int v7;
  uint64_t **v8;
  unsigned int v9;
  _DWORD *v10;
  __int128 v11;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = operator new(0x40uLL);
    v10[8] = *(_DWORD *)a3;
    v10[10] = *(_DWORD *)(a3 + 8);
    v11 = *(_OWORD *)(a3 + 16);
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *((_OWORD *)v10 + 3) = v11;
    sub_1C894E740(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t **sub_1C89525B0(uint64_t **a1, unsigned int *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unsigned int v7;
  uint64_t **v8;
  unsigned int v9;
  _DWORD *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = operator new(0x30uLL);
    v10[8] = *(_DWORD *)a3;
    *((_QWORD *)v10 + 5) = *(_QWORD *)(a3 + 8);
    sub_1C894E740(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void sub_1C8952670(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1C89526BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_1C89526E0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  dispatch_queue_global_t global_queue;
  uint64_t *v7;
  NSObject *v8;
  dispatch_source_t v9;
  uint64_t *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD handler[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v0 = sub_1C89479F4();
  if (!v0)
    return 0xFFFFFFFFLL;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = v0;
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v0 + 232));
  *(_QWORD *)v18[3] = "com.apple.libEDR.Notification";
  v1 = v18[3];
  *(_DWORD *)(v1 + 20) = 0;
  v2 = sub_1C8952D3C("com.apple.libEDR.Notification", (mach_port_name_t *)(v1 + 20));
  v3 = v18[3];
  if (v2)
    goto LABEL_3;
  sub_1C8952EF8((_QWORD *)(v3 + 40));
  *(_DWORD *)(v18[3] + 8) = sub_1C8952F5C();
  *(_DWORD *)(v18[3] + 12) = sub_1C8952FAC();
  global_queue = dispatch_get_global_queue(2, 0);
  v7 = v18;
  *(_QWORD *)(v18[3] + 24) = global_queue;
  v3 = v7[3];
  v8 = *(NSObject **)(v3 + 24);
  if (!v8)
    goto LABEL_3;
  v9 = dispatch_source_create(MEMORY[0x1E0C80D98], *(unsigned int *)(v3 + 20), 0, v8);
  v10 = v18;
  *(_QWORD *)(v18[3] + 32) = v9;
  v3 = v10[3];
  v11 = *(NSObject **)(v3 + 32);
  if (v11)
  {
    dispatch_retain(v11);
    pthread_rwlock_unlock((pthread_rwlock_t *)(v18[3] + 232));
    v12 = *(NSObject **)(v18[3] + 32);
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = sub_1C8952FFC;
    handler[3] = &unk_1E8203940;
    handler[4] = &v17;
    dispatch_source_set_event_handler(v12, handler);
    v14 = *(NSObject **)(v18[3] + 32);
    v15[0] = v13;
    v15[1] = 0x40000000;
    v15[2] = sub_1C8953D20;
    v15[3] = &unk_1E8203968;
    v15[4] = &v17;
    dispatch_source_set_cancel_handler(v14, v15);
    dispatch_resume(*(dispatch_object_t *)(v18[3] + 32));
    v4 = 0;
  }
  else
  {
LABEL_3:
    pthread_rwlock_unlock((pthread_rwlock_t *)(v3 + 232));
    v4 = 0xFFFFFFFFLL;
  }
  _Block_object_dispose(&v17, 8);
  return v4;
}

void sub_1C89528A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

NSObject *sub_1C89528BC()
{
  uint64_t v0;
  NSObject *result;

  v0 = sub_1C89479F4();
  if (!v0)
    return 0xFFFFFFFFLL;
  result = *(NSObject **)(v0 + 32);
  if (result)
  {
    dispatch_source_cancel(result);
    return 0;
  }
  return result;
}

uint64_t sub_1C89528EC(unsigned int a1, int a2, const void *a3, uint64_t a4)
{
  uint64_t v8;

  v8 = sub_1C89479F4();
  if (v8)
    return sub_1C89549E0(v8, a1, 0, a2, a3, a4, 0, 0, 0);
  else
    return 0xFFFFFFFFLL;
}

uint64_t sub_1C8952958(uint64_t a1, int a2, const void *a3, uint64_t a4)
{
  uint64_t v8;

  v8 = sub_1C89479F4();
  if (!v8)
    return 0xFFFFFFFFLL;
  sub_1C89558BC(v8, a1, a2, 0, 0, a3, a4, 0);
  return 0;
}

uint64_t sub_1C89529BC(int a1)
{
  uint64_t v2;
  uint64_t v3;
  pthread_rwlock_t *v4;
  uint64_t *v5;
  const void *v6;
  uint64_t *v7;
  int v9;

  v2 = sub_1C89479F4();
  v9 = a1;
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  v4 = (pthread_rwlock_t *)(v2 + 232);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v2 + 232));
  v5 = sub_1C8947B94((_QWORD *)(v3 + 80), &v9);
  if (v5)
  {
    v5[3] = 0;
    v6 = (const void *)v5[5];
    if (v6)
      _Block_release(v6);
  }
  syslog(5, "EDR - client remove handlers client = %d type = %d\n", *(_DWORD *)(v3 + 160), a1);
  v7 = sub_1C8947B94((_QWORD *)(v3 + 80), &v9);
  if (v7)
    sub_1C8955E68((_QWORD *)(v3 + 80), v7);
  pthread_rwlock_unlock(v4);
  return 0;
}

uint64_t sub_1C8952A70(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = sub_1C89479F4();
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  if (sub_1C8954B04("com.apple.libEDR.Notification", v6, 0x2710u))
    return 0xFFFFFFFFLL;
  if (a3 >= 0x21)
  {
    syslog(3, "EDR - %s: data size %d exceeds max data size %d\n", "send_request", a3, 32);
    return 0xFFFFFFFFLL;
  }
  v9 = *(unsigned int *)(v7 + 8);
  if ((_DWORD)v9 == *(_DWORD *)(v7 + 160))
  {
    v11 = 0;
    memset(v12, 0, sizeof(v12));
    sub_1C8953A54(v7, v9, a1, (uint64_t)a2, a3, (uint64_t)&v11 + 4, (uint64_t)v12, (uint64_t)&v11, 1);
    sub_1C8947A7C(v7, HIDWORD(v11), (uint64_t)v12, v11, 1);
    return 0;
  }
  else
  {
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v7 + 232));
    v10 = sub_1C8953B40(*(unsigned int *)(v7 + 140), a1, a2, a3, 0);
    pthread_rwlock_unlock((pthread_rwlock_t *)(v7 + 232));
    return v10;
  }
}

uint64_t sub_1C8952BDC(mach_msg_timeout_t a1, uint64_t a2, const void *a3, uint64_t a4, _DWORD *a5, void *a6, _DWORD *a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  int v19;
  int v20;
  int v21;

  v14 = sub_1C89479F4();
  if (v14)
  {
    v15 = v14;
    if (!sub_1C8954B04("com.apple.libEDR.Notification", v14, 0x2710u))
    {
      if (a4 < 0x21)
      {
        v18 = *(unsigned int *)(v15 + 8);
        if ((_DWORD)v18 != *(_DWORD *)(v15 + 160))
        {
          pthread_rwlock_wrlock((pthread_rwlock_t *)(v15 + 232));
          v16 = sub_1C89546B8(*(unsigned int *)(v15 + 140), a2, a3, a4, *(unsigned int *)(v15 + 172), &v21, &v20, a5, a6, a7, &v19, a1);
          pthread_rwlock_unlock((pthread_rwlock_t *)(v15 + 232));
          return v16;
        }
        sub_1C8953A54(v15, v18, a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, 1);
        if (a7)
        {
          sub_1C8947A7C(v15, *a5, (uint64_t)a6, *a7, 1);
          return 0;
        }
      }
      else
      {
        syslog(3, "EDR - %s: data size %d exceeds max data size %d\n", "send_request_sync", a4, 32);
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_1C8952D3C(const char *a1, mach_port_name_t *a2)
{
  mach_error_t v4;
  mach_error_t v5;
  mach_error_t v6;
  char *v7;
  mach_error_t v8;
  uint64_t result;
  mach_port_options_t special_port;
  mach_port_name_t name;

  name = 0;
  if (a1)
  {
    special_port.flags = 0;
    v4 = task_get_special_port(*MEMORY[0x1E0C83DA0], 4, &special_port.flags);
    if (v4)
    {
      mach_error_string(v4);
      syslog(3, "EDR - %s: task_get_bootstrap_port() => %s (%d)\n");
LABEL_12:
      sub_1C8953EC4(name);
      return 0xFFFFFFFFLL;
    }
    syslog(5, "EDR - Bootstrap Port: %d\n", special_port.flags);
    name = 0;
    v8 = bootstrap_check_in(special_port.flags, a1, &name);
    if (v8)
    {
      mach_error_string(v8);
      syslog(3, "EDR - %s: bootstrap_check_in() => %s (%d)\n");
      goto LABEL_12;
    }
    syslog(5, "EDR - Local Port: %d (%s)\n");
LABEL_10:
    result = mach_port_insert_right(*MEMORY[0x1E0C83DA0], name, name, 0x14u);
    if (!(_DWORD)result)
    {
      *a2 = name;
      return result;
    }
    mach_error_string(result);
    syslog(3, "EDR - %s: mach_port_insert_right() => %s (%d)\n");
    goto LABEL_12;
  }
  special_port.reserved[1] = 0;
  *(_OWORD *)&special_port.flags = xmmword_1C89585F0;
  v5 = mach_port_construct(*MEMORY[0x1E0C83DA0], &special_port, 0, &name);
  if (!v5)
  {
    syslog(5, "EDR - Local Port: %d\n");
    goto LABEL_10;
  }
  v6 = v5;
  v7 = mach_error_string(v5);
  syslog(3, "EDR - %s: mach_port_construct() => %s (%d)\n", "setup_local_port", v7, v6);
  return 0xFFFFFFFFLL;
}

_QWORD *sub_1C8952EF8(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t sub_1C8952F5C()
{
  if (qword_1ED83CB70 != -1)
    dispatch_once(&qword_1ED83CB70, &unk_1E82013E8);
  if (qword_1ED83CB78)
    return *(unsigned int *)(qword_1ED83CB78 + 20);
  else
    return 0;
}

uint64_t sub_1C8952FAC()
{
  if (qword_1ED83CB70 != -1)
    dispatch_once(&qword_1ED83CB70, &unk_1E82013E8);
  if (qword_1ED83CB78)
    return *(unsigned int *)(qword_1ED83CB78 + 28);
  else
    return 0;
}

void sub_1C8952FFC(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  pthread_rwlock_t *v7;
  uint64_t *v8;
  uint64_t v9;
  mach_port_name_t v10;
  int v11;
  pthread_rwlock_t *v12;
  void **v13;
  uint64_t *v14;
  uint64_t *v15;
  char v16;
  _DWORD *v17;
  unint64_t v18;
  float v19;
  float v20;
  _BOOL4 v21;
  unint64_t v22;
  unint64_t v23;
  int8x8_t prime;
  uint64_t v25;
  pthread_rwlock_t *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t **v33;
  unint64_t v34;
  uint8x8_t v35;
  unint64_t v36;
  uint8x8_t v37;
  uint64_t v38;
  uint64_t *i;
  unint64_t v40;
  uint64_t *v41;
  _QWORD *v42;
  uint8x8_t v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t *v46;
  int v47;
  _QWORD *v48;
  unint64_t v49;
  unint64_t v50;
  _BOOL4 v51;
  int v52;
  unint64_t v53;
  unint64_t v54;
  mach_error_t v55;
  mach_error_t v56;
  char *v57;
  void *v58;
  unsigned int v59;
  int v60;
  mach_port_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  mach_port_t previous[4];
  __int128 v66;
  _OWORD v67[2];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v63 = 0;
  v64 = 0;
  v62 = 0;
  v61 = 0;
  memset(v67, 0, sizeof(v67));
  if (sub_1C8953794(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 20), (_DWORD *)&v64 + 1, &v64, (_DWORD *)&v63 + 1, (mach_port_t *)&v63, (mach_msg_size_t *)&v62 + 1, v67, (mach_port_t *)&v62, &v61))return;
  switch(HIDWORD(v63))
  {
    case 3:
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v6 = v63;
      v7 = (pthread_rwlock_t *)(v5 + 232);
      pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 232));
      v8 = (uint64_t *)(v5 + 56);
      while (1)
      {
        v8 = (uint64_t *)*v8;
        if (!v8)
          break;
        if (*((_DWORD *)v8 + 9) == v6)
        {
          v9 = *((unsigned int *)v8 + 6);
          goto LABEL_28;
        }
      }
      v9 = 0;
LABEL_28:
      pthread_rwlock_unlock(v7);
      v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v26 = (pthread_rwlock_t *)(v25 + 232);
      pthread_rwlock_wrlock((pthread_rwlock_t *)(v25 + 232));
      v27 = *(_QWORD *)(v25 + 56);
      if (v27)
      {
        v28 = (_QWORD *)(v25 + 40);
        do
        {
          while (*(_DWORD *)(v27 + 36) != v6)
          {
            v27 = *(_QWORD *)v27;
            if (!v27)
              goto LABEL_36;
          }
          syslog(5, "EDR - server remove client = %d type = %d port = %d\n", *(_DWORD *)(v27 + 24), *(_DWORD *)(v27 + 32), v6);
          v29 = *(unsigned int *)(v27 + 36);
          if ((_DWORD)v29)
          {
            sub_1C8953E40(v29);
            *(_DWORD *)(v27 + 36) = 0;
          }
          v27 = sub_1C89541E0(v28, (uint64_t *)v27);
        }
        while (v27);
      }
LABEL_36:
      pthread_rwlock_unlock(v26);
      sub_1C8953A54(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v9, 0, 0, 0, 0, 0, 0, 0);
      break;
    case 2:
      v59 = 0;
      v60 = 0;
      *(_OWORD *)previous = 0u;
      v66 = 0u;
      sub_1C8953A54(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), HIDWORD(v64), HIDWORD(v62), (uint64_t)v67, v62, (uint64_t)&v60, (uint64_t)previous, (uint64_t)&v59, 0);
      if (v61 == 1)
        sub_1C8953B40(v63, v60, previous, v59, 2);
      break;
    case 1:
      v2 = v64;
      v3 = HIDWORD(v64);
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      if (v64 == __PAIR64__(*(_DWORD *)(v4 + 8), *(_DWORD *)(v4 + 12)))
      {
        syslog(5, "EDR - server local client = %d type = %d port = %d\n", HIDWORD(v64), HIDWORD(v62), v63);
        return;
      }
      v11 = HIDWORD(v62);
      v10 = v63;
      previous[0] = HIDWORD(v62);
      v12 = (pthread_rwlock_t *)(v4 + 232);
      pthread_rwlock_wrlock((pthread_rwlock_t *)(v4 + 232));
      v13 = (void **)(v4 + 40);
      v14 = sub_1C895410C((_QWORD *)(v4 + 40), (int *)previous);
      if (v14 != v15)
      {
        v16 = 0;
        do
        {
          v16 |= *((_DWORD *)v14 + 9) == v10;
          v14 = (uint64_t *)*v14;
        }
        while (v14 != v15);
        if ((v16 & 1) != 0)
          goto LABEL_108;
      }
      v17 = operator new(0x38uLL);
      v17[4] = v11;
      v17[6] = v3;
      v17[7] = v2;
      v17[8] = v11;
      v17[9] = v10;
      *((_QWORD *)v17 + 5) = 0;
      *((_QWORD *)v17 + 6) = 0;
      *(_QWORD *)v17 = 0;
      *((_QWORD *)v17 + 1) = v11;
      v18 = *(_QWORD *)(v4 + 48);
      v19 = (float)(unint64_t)(*(_QWORD *)(v4 + 64) + 1);
      v20 = *(float *)(v4 + 72);
      if (v18 && (float)(v20 * (float)v18) >= v19)
        goto LABEL_71;
      v21 = (v18 & (v18 - 1)) == 0;
      if (v18 < 3)
        v21 = 0;
      v22 = (2 * v18) | !v21;
      v23 = vcvtps_u32_f32(v19 / v20);
      if (v22 <= v23)
        prime = (int8x8_t)v23;
      else
        prime = (int8x8_t)v22;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        v18 = *(_QWORD *)(v4 + 48);
      }
      if (*(_QWORD *)&prime > v18)
        goto LABEL_40;
      if (*(_QWORD *)&prime < v18)
      {
        v36 = vcvtps_u32_f32((float)*(unint64_t *)(v4 + 64) / *(float *)(v4 + 72));
        if (v18 < 3 || (v37 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
        {
          v36 = std::__next_prime(v36);
        }
        else
        {
          v38 = 1 << -(char)__clz(v36 - 1);
          if (v36 >= 2)
            v36 = v38;
        }
        if (*(_QWORD *)&prime <= v36)
          prime = (int8x8_t)v36;
        if (*(_QWORD *)&prime < v18)
        {
          if (prime)
          {
LABEL_40:
            if (*(_QWORD *)&prime >> 61)
              sub_1C89491F0();
            v30 = operator new(8 * *(_QWORD *)&prime);
            v31 = *v13;
            *v13 = v30;
            if (v31)
              operator delete(v31);
            v32 = 0;
            *(int8x8_t *)(v4 + 48) = prime;
            do
              *((_QWORD *)*v13 + v32++) = 0;
            while (*(_QWORD *)&prime != v32);
            v33 = *(uint64_t ***)(v4 + 56);
            if (v33)
            {
              v34 = (unint64_t)v33[1];
              v35 = (uint8x8_t)vcnt_s8(prime);
              v35.i16[0] = vaddlv_u8(v35);
              if (v35.u32[0] > 1uLL)
              {
                if (v34 >= *(_QWORD *)&prime)
                  v34 %= *(_QWORD *)&prime;
              }
              else
              {
                v34 &= *(_QWORD *)&prime - 1;
              }
              *((_QWORD *)*v13 + v34) = v4 + 56;
              for (i = *v33; *v33; i = *v33)
              {
                v40 = i[1];
                if (v35.u32[0] > 1uLL)
                {
                  if (v40 >= *(_QWORD *)&prime)
                    v40 %= *(_QWORD *)&prime;
                }
                else
                {
                  v40 &= *(_QWORD *)&prime - 1;
                }
                if (v40 == v34)
                {
                  v33 = (uint64_t **)i;
                }
                else
                {
                  v41 = i;
                  if (*((_QWORD *)*v13 + v40))
                  {
                    do
                    {
                      v42 = v41;
                      v41 = (uint64_t *)*v41;
                    }
                    while (v41 && *((_DWORD *)i + 4) == *((_DWORD *)v41 + 4));
                    *v33 = v41;
                    *v42 = **((_QWORD **)*v13 + v40);
                    **((_QWORD **)*v13 + v40) = i;
                  }
                  else
                  {
                    *((_QWORD *)*v13 + v40) = v33;
                    v33 = (uint64_t **)i;
                    v34 = v40;
                  }
                }
              }
            }
            v18 = (unint64_t)prime;
            goto LABEL_70;
          }
          v58 = *v13;
          *v13 = 0;
          v12 = (pthread_rwlock_t *)(v4 + 232);
          if (v58)
            operator delete(v58);
          v18 = 0;
          *(_QWORD *)(v4 + 48) = 0;
LABEL_71:
          v43 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
          v43.i16[0] = vaddlv_u8(v43);
          if (v43.u32[0] > 1uLL)
          {
            v44 = v11;
            if (v18 <= v11)
              v44 = v11 % v18;
          }
          else
          {
            v44 = (v18 - 1) & v11;
          }
          v45 = *v13;
          v46 = (uint64_t *)*((_QWORD *)*v13 + v44);
          if (v46)
          {
            v47 = 0;
            do
            {
              v48 = v46;
              v46 = (uint64_t *)*v46;
              if (!v46)
                break;
              v49 = v46[1];
              if (v43.u32[0] > 1uLL)
              {
                v50 = v46[1];
                if (v49 >= v18)
                  v50 = v49 % v18;
              }
              else
              {
                v50 = v49 & (v18 - 1);
              }
              if (v50 != v44)
                break;
              v51 = v49 == v11 && *((_DWORD *)v46 + 4) == v17[4];
              v52 = v47 & !v51;
              v47 |= v51;
            }
            while (v52 != 1);
          }
          else
          {
            v48 = 0;
          }
          v53 = *((_QWORD *)v17 + 1);
          if (v43.u32[0] > 1uLL)
          {
            if (v53 >= v18)
              v53 %= v18;
          }
          else
          {
            v53 &= v18 - 1;
          }
          if (v48)
          {
            *(_QWORD *)v17 = *v48;
            *v48 = v17;
            if (!*(_QWORD *)v17)
              goto LABEL_107;
            v54 = *(_QWORD *)(*(_QWORD *)v17 + 8);
            if (v43.u32[0] > 1uLL)
            {
              if (v54 >= v18)
                v54 %= v18;
            }
            else
            {
              v54 &= v18 - 1;
            }
            if (v54 == v53)
              goto LABEL_107;
          }
          else
          {
            *(_QWORD *)v17 = *(_QWORD *)(v4 + 56);
            *(_QWORD *)(v4 + 56) = v17;
            v45[v53] = v4 + 56;
            if (!*(_QWORD *)v17)
            {
LABEL_107:
              ++*(_QWORD *)(v4 + 64);
              syslog(5, "EDR - server insert client = %d type = %d port = %d\n", v3, v11, v10);
LABEL_108:
              pthread_rwlock_unlock(v12);
              previous[0] = 0;
              v55 = mach_port_request_notification(*MEMORY[0x1E0C83DA0], v10, 72, 1u, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 20), 0x15u, previous);
              v56 = v55;
              if (v55)
              {
                v57 = mach_error_string(v55);
                syslog(3, "EDR - %s: mach_port_request_notification() => %s (%d)\n", "start_notification_service_block_invoke", v57, v56);
              }
              return;
            }
            v54 = *(_QWORD *)(*(_QWORD *)v17 + 8);
            if (v43.u32[0] > 1uLL)
            {
              if (v54 >= v18)
                v54 %= v18;
            }
            else
            {
              v54 &= v18 - 1;
            }
          }
          *((_QWORD *)*v13 + v54) = v17;
          goto LABEL_107;
        }
        v18 = *(_QWORD *)(v4 + 48);
      }
LABEL_70:
      v12 = (pthread_rwlock_t *)(v4 + 232);
      goto LABEL_71;
    default:
      return;
  }
}

void sub_1C8953778(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C8953794(mach_port_name_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, mach_port_t *a5, mach_msg_size_t *a6, void *a7, mach_port_t *a8, mach_port_t *a9)
{
  mach_msg_header_t *v17;
  mach_msg_return_t v18;
  mach_msg_return_t v19;
  char *v20;
  uint64_t v21;
  _DWORD *v23;
  mach_msg_id_t msgh_id;
  size_t msgh_local_port;
  mach_port_t *p_msgh_remote_port;
  mach_msg_header_t *msg;
  mach_msg_header_t *v28;

  sub_1C8953FD4(&msg, 0x1000uLL);
  v17 = msg;
  v18 = mach_msg(msg, 50331650, 0, (_DWORD)v28 - (_DWORD)msg, a1, 0, 0);
  v19 = v18;
  if (v18)
  {
    v20 = mach_error_string(v18);
    syslog(3, "EDR - %s: mach_msg() => %s (%d), port: %d, local port: %d", "recv_msg", v20, v19, *a5, a1);
LABEL_3:
    v21 = 0xFFFFFFFFLL;
    goto LABEL_4;
  }
  v23 = (mach_msg_bits_t *)((char *)&v17->msgh_bits + ((v17->msgh_size + 3) & 0x1FFFFFFFCLL));
  if (!*v23 && v23[1] >= 0x34u)
  {
    *a2 = v23[10];
    *a3 = v23[12];
  }
  *a4 = 0;
  if ((v17->msgh_bits & 0x80000000) == 0)
  {
    msgh_id = v17->msgh_id;
    if (msgh_id)
    {
      if (msgh_id != 72 || v23[3])
      {
        syslog(3, "EDR - %s: unknown message id = %d\n", "recv_msg", msgh_id);
LABEL_30:
        mach_msg_destroy(v17);
        v21 = 0;
        goto LABEL_4;
      }
      p_msgh_remote_port = &v17[1].msgh_remote_port;
      *a4 = 3;
LABEL_29:
      *a5 = *p_msgh_remote_port;
      goto LABEL_30;
    }
    *a4 = 2;
    *a5 = v17->msgh_remote_port;
    *a6 = v17[1].msgh_size;
    *a9 = v17[1].msgh_remote_port;
    p_msgh_remote_port = &v17[1].msgh_local_port;
    msgh_local_port = v17[1].msgh_local_port;
    if ((msgh_local_port & 0x80000000) != 0)
    {
      syslog(3, "EDR - %s: data size negative %d\n", "recv_msg", msgh_local_port);
    }
    else if (msgh_local_port <= 0x20)
    {
      if ((unint64_t)v17->msgh_size - 40 >= msgh_local_port)
      {
        if (!a7)
          goto LABEL_30;
        memcpy(a7, &v17[1].msgh_voucher_port, msgh_local_port);
        a5 = a8;
        goto LABEL_29;
      }
      syslog(3, "EDR - %s: data size %d exceeds message data size %ud\n");
    }
    else
    {
      syslog(3, "EDR - %s: data size %d exceeds max data size %d\n");
    }
    mach_msg_destroy(v17);
    goto LABEL_3;
  }
  if (!v17[1].msgh_bits || HIWORD(v17[1].msgh_local_port) << 16 != 1114112)
  {
    syslog(3, "EDR - %s: invalid port descriptor\n", "recv_msg");
    mach_msg_destroy(v17);
    goto LABEL_3;
  }
  v21 = 0;
  *a4 = 1;
  *a5 = v17[1].msgh_size;
LABEL_4:
  if (msg)
  {
    v28 = msg;
    operator delete(msg);
  }
  return v21;
}

void sub_1C8953A2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1C8953A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  pthread_rwlock_t *v16;
  _QWORD *v17;
  uint64_t *v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  char v24;
  char v25;
  int v26;
  int v27[3];

  v27[0] = a3;
  v16 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 232));
  v17 = (_QWORD *)(a1 + 80);
  v26 = 0;
  v18 = sub_1C8947B94((_QWORD *)(a1 + 80), &v26);
  if (v18)
  {
    v19 = (__int128 *)&v25;
LABEL_5:
    v20 = *(_OWORD *)(v18 + 5);
    *v19 = *(_OWORD *)(v18 + 3);
    v19[1] = v20;
    v21 = *(_OWORD *)(v18 + 9);
    v19[2] = *(_OWORD *)(v18 + 7);
    v19[3] = v21;
    sub_1C8954330(v19, a2, a3, a4, a5, a6, a7, a8, a9);
    return pthread_rwlock_unlock(v16);
  }
  if (sub_1C8947B94(v17, v27))
  {
    v19 = (__int128 *)&v24;
    goto LABEL_5;
  }
  return pthread_rwlock_unlock(v16);
}

uint64_t sub_1C8953B40(uint64_t a1, int a2, const void *a3, unsigned int a4, int a5)
{
  mach_port_t v6;
  mach_error_t v10;
  mach_error_t v11;
  char *v12;
  uint64_t result;
  int v14;
  char *v15;
  int v16;
  mach_msg_header_t msg;
  __int128 v18;
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a4 >= 0x21)
  {
    syslog(3, "EDR - %s: data size %d exceeds max data size %d\n");
    return 0xFFFFFFFFLL;
  }
  v6 = a1;
  if (!(_DWORD)a1)
  {
    syslog(3, "EDR - %s: no remote port\n");
    return 0xFFFFFFFFLL;
  }
  v16 = 0;
  v10 = MEMORY[0x1CAA383E8](*MEMORY[0x1E0C83DA0], a1, 0, &v16);
  if (v10)
  {
    v11 = v10;
    v12 = mach_error_string(v10);
    syslog(3, "EDR - %s: mach_port_get_refs() => %s (%d)\n", "send_data", v12, v11);
  }
  if (!v16)
  {
    syslog(3, "EDR - %s: remote port %d has no send right\n", "send_data", v6);
    return 1;
  }
  v18 = 0u;
  memset(v19, 0, sizeof(v19));
  *(_QWORD *)&msg.msgh_bits = 0x4800000013;
  msg.msgh_remote_port = v6;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0;
  DWORD1(v18) = a2;
  if (a3)
  {
    memcpy(v19, a3, a4);
    HIDWORD(v18) = a4;
  }
  DWORD2(v18) = a5;
  result = mach_msg(&msg, 17, 0x48u, 0, 0, 1u, 0);
  if ((_DWORD)result)
  {
    v14 = result;
    v15 = mach_error_string(result);
    syslog(3, "EDR - %s: mach_msg() => %s (%d), remote port: %d", "send_data", v15, v14, v6);
    if ((v14 - 268435459) <= 1)
      mach_msg_destroy(&msg);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1C8953D20(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  NSObject *v5;

  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 232));
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3 = *(uint64_t **)(v2 + 56);
  if (v3)
  {
    do
    {
      if (*((_DWORD *)v3 + 9))
      {
        syslog(5, "EDR - server free client port = %d\n", *((_DWORD *)v3 + 9));
        sub_1C8953E40(*((unsigned int *)v3 + 9));
        *((_DWORD *)v3 + 9) = 0;
      }
      v3 = (uint64_t *)*v3;
    }
    while (v3);
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  sub_1C8952EF8((_QWORD *)(v2 + 40));
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v5 = *(NSObject **)(v4 + 32);
  if (v5)
  {
    dispatch_release(v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 32) = 0;
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  if (*(_DWORD *)(v4 + 20))
  {
    syslog(5, "EDR - server delete server port = %d\n", *(_DWORD *)(v4 + 20));
    sub_1C8953E40(*(unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 20));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 20) = 0;
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)(v4 + 232));
}

void sub_1C8953E40(uint64_t a1)
{
  mach_port_name_t v1;
  ipc_space_t *v2;
  mach_error_t v3;
  mach_error_t v4;
  char *v5;
  int v6;

  v1 = a1;
  v6 = 0;
  v2 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (MEMORY[0x1CAA383E8](*MEMORY[0x1E0C83DA0], a1, 4, &v6) != 15)
  {
    v3 = mach_port_deallocate(*v2, v1);
    if (v3)
    {
      v4 = v3;
      v5 = mach_error_string(v3);
      syslog(3, "EDR - %s: mach_port_deallocate() => %s (%d)\n", "release_port", v5, v4);
    }
  }
}

void sub_1C8953EC4(uint64_t a1)
{
  unsigned int *v2;
  mach_error_t v3;
  mach_error_t v4;
  char *v5;
  int v6;

  v6 = 0;
  v2 = (unsigned int *)MEMORY[0x1E0C83DA0];
  if (MEMORY[0x1CAA383E8](*MEMORY[0x1E0C83DA0], a1, 4, &v6) != 15)
  {
    v3 = MEMORY[0x1CAA383DC](*v2, a1);
    if (v3)
    {
      v4 = v3;
      v5 = mach_error_string(v3);
      syslog(3, "EDR - %s: mach_port_destroy() => %s (%d)\n", "destroy_port", v5, v4);
    }
  }
}

double sub_1C8953F48()
{
  kern_return_t v0;
  double result;
  _OWORD *v2;
  __int128 v3;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v6;

  task_info_outCnt = 8;
  v0 = task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt);
  if (v0)
  {
    syslog(3, "EDR - %s: failed to get audit token for current process: %llx", "get_audit_token_self_block_invoke", v0);
  }
  else
  {
    v2 = (_OWORD *)operator new();
    result = *(double *)task_info_out;
    v3 = v6;
    *v2 = *(_OWORD *)task_info_out;
    v2[1] = v3;
    qword_1ED83CB78 = (uint64_t)v2;
  }
  return result;
}

_QWORD *sub_1C8953FD4(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1C8954044(a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_1C8954028(_Unwind_Exception *exception_object)
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

char *sub_1C8954044(_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    sub_1C8954084();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_1C8954084()
{
  sub_1C8954098("vector");
}

void sub_1C8954098(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1C89540E8(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E8201010, MEMORY[0x1E0DE42D0]);
}

void sub_1C89540D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1C89540E8(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

uint64_t *sub_1C895410C(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;
  uint64_t *v9;

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
  result = *v6;
  if (!*v6)
    return result;
  while (1)
  {
    v8 = result[1];
    if (v8 == v3)
      break;
    if (v4.u32[0] > 1uLL)
    {
      if (v8 >= *(_QWORD *)&v2)
        v8 %= *(_QWORD *)&v2;
    }
    else
    {
      v8 &= *(_QWORD *)&v2 - 1;
    }
    if (v8 != v5)
      return 0;
LABEL_16:
    result = (uint64_t *)*result;
    if (!result)
      return result;
  }
  if (*((_DWORD *)result + 4) != (_DWORD)v3)
    goto LABEL_16;
  v9 = result;
  do
    v9 = (uint64_t *)*v9;
  while (v9 && *((_DWORD *)v9 + 4) == (_DWORD)v3);
  return result;
}

uint64_t sub_1C89541E0(_QWORD *a1, uint64_t *__p)
{
  int8x8_t v2;
  unint64_t v3;
  uint64_t v4;
  uint8x8_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v2 = (int8x8_t)a1[1];
  v4 = *__p;
  v3 = __p[1];
  v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v3 >= *(_QWORD *)&v2)
      v3 %= *(_QWORD *)&v2;
  }
  else
  {
    v3 &= *(_QWORD *)&v2 - 1;
  }
  v6 = *(uint64_t **)(*a1 + 8 * v3);
  do
  {
    v7 = v6;
    v6 = (uint64_t *)*v6;
  }
  while (v6 != __p);
  if (v7 == a1 + 2)
    goto LABEL_31;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v2)
      v8 %= *(_QWORD *)&v2;
  }
  else
  {
    v8 &= *(_QWORD *)&v2 - 1;
  }
  v9 = *__p;
  if (v8 != v3)
  {
LABEL_31:
    if (v4)
    {
      v10 = *(_QWORD *)(v4 + 8);
      if (v5.u32[0] > 1uLL)
      {
        v11 = *(_QWORD *)(v4 + 8);
        if (v10 >= *(_QWORD *)&v2)
          v11 = v10 % *(_QWORD *)&v2;
      }
      else
      {
        v11 = v10 & (*(_QWORD *)&v2 - 1);
      }
      v9 = *__p;
      if (v11 == v3)
        goto LABEL_22;
    }
    *(_QWORD *)(*a1 + 8 * v3) = 0;
    v9 = *__p;
  }
  if (!v9)
    goto LABEL_28;
  v10 = *(_QWORD *)(v9 + 8);
LABEL_22:
  if (v5.u32[0] > 1uLL)
  {
    if (v10 >= *(_QWORD *)&v2)
      v10 %= *(_QWORD *)&v2;
  }
  else
  {
    v10 &= *(_QWORD *)&v2 - 1;
  }
  if (v10 != v3)
  {
    *(_QWORD *)(*a1 + 8 * v10) = v7;
    v9 = *__p;
  }
LABEL_28:
  *v7 = v9;
  *__p = 0;
  --a1[3];
  operator delete(__p);
  return v4;
}

void sub_1C8954330(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  _QWORD block[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;

  if ((a9 & 1) != 0 || !*((_BYTE *)a1 + 56))
  {
    v9 = *(NSObject **)a1;
    if (*(_QWORD *)a1)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = sub_1C8954410;
      block[3] = &unk_1E82039A8;
      v10 = a1[1];
      v15 = *a1;
      v16 = v10;
      v11 = a1[3];
      v17 = a1[2];
      v18 = v11;
      v23 = a2;
      v24 = a3;
      v25 = a5;
      v19 = a4;
      v20 = a6;
      v21 = a7;
      v22 = a8;
      dispatch_sync(v9, block);
    }
    else
    {
      v12 = *((_QWORD *)a1 + 2);
      if (v12)
      {
        (*(void (**)(uint64_t))(v12 + 16))(v12);
      }
      else
      {
        v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))*((_QWORD *)a1 + 5);
        if (v13)
          v13(a2, a3, a4, a5, a6, a7, a8, *((_QWORD *)a1 + 6));
      }
    }
  }
}

uint64_t sub_1C8954410(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v1 = *(_QWORD *)(result + 48);
  if (v1)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, *(unsigned int *)(result + 128), *(unsigned int *)(result + 132), *(_QWORD *)(result + 96), *(unsigned int *)(result + 136), *(_QWORD *)(result + 104), *(_QWORD *)(result + 112), *(_QWORD *)(result + 120), *(_QWORD *)(result + 64));
  v2 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(result + 72);
  if (v2)
    return v2(*(unsigned int *)(result + 128), *(unsigned int *)(result + 132), *(_QWORD *)(result + 96), *(unsigned int *)(result + 136), *(_QWORD *)(result + 104), *(_QWORD *)(result + 112), *(_QWORD *)(result + 120), *(_QWORD *)(result + 80));
  return result;
}

double sub_1C8954480(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = 0;
  result = NAN;
  *(_QWORD *)(a1 + 8) = -1;
  *(_DWORD *)(a1 + 16) = -1;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_QWORD *)(a1 + 68) = 0x3F80000000000000;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = -1;
  *(_DWORD *)(a1 + 136) = -1;
  *(_QWORD *)(a1 + 148) = 0;
  *(_QWORD *)(a1 + 140) = 0;
  *(_DWORD *)(a1 + 156) = 0;
  *(_QWORD *)(a1 + 160) = -1;
  *(_DWORD *)(a1 + 168) = -1;
  *(_OWORD *)(a1 + 204) = 0u;
  *(_OWORD *)(a1 + 188) = 0u;
  *(_OWORD *)(a1 + 172) = 0u;
  *(_QWORD *)(a1 + 220) = 0x3F80000000000000;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_QWORD *)(a1 + 232) = 766030772;
  return result;
}

uint64_t sub_1C8954510(uint64_t a1)
{
  pthread_rwlock_t *v2;
  uint64_t v3;
  _QWORD *v4;
  unsigned int *v5;
  mach_error_t v6;
  mach_error_t v7;
  char *v8;
  uint64_t v9;
  int v11;

  v2 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 232));
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    v4 = (_QWORD *)(a1 + 40);
    v5 = (unsigned int *)MEMORY[0x1E0C83DA0];
    do
    {
      while (1)
      {
        v11 = 0;
        v6 = MEMORY[0x1CAA383E8](*v5, *(unsigned int *)(v3 + 36), 0, &v11);
        if (v6)
        {
          v7 = v6;
          v8 = mach_error_string(v6);
          syslog(3, "EDR - %s: mach_port_get_refs() => %s (%d)\n", "server_remove_client_with_no_send_right", v8, v7);
        }
        if (!v11)
          break;
        v3 = *(_QWORD *)v3;
        if (!v3)
          return pthread_rwlock_unlock(v2);
      }
      syslog(5, "EDR - server remove client = %d type = %d port = %d\n", *(_DWORD *)(v3 + 24), *(_DWORD *)(v3 + 32), *(_DWORD *)(v3 + 36));
      v9 = *(unsigned int *)(v3 + 36);
      if ((_DWORD)v9)
      {
        sub_1C8953E40(v9);
        *(_DWORD *)(v3 + 36) = 0;
      }
      v3 = sub_1C89541E0(v4, (uint64_t *)v3);
    }
    while (v3);
  }
  return pthread_rwlock_unlock(v2);
}

uint64_t *sub_1C8954618(_QWORD *a1, int *a2)
{
  uint64_t *result;
  uint64_t *v4;

  result = sub_1C8947B94(a1, a2);
  if (result)
  {
    v4 = result;
    do
      v4 = (uint64_t *)*v4;
    while (v4 && *((_DWORD *)v4 + 4) == *a2);
  }
  return result;
}

uint64_t sub_1C8954660(uint64_t a1)
{
  uint64_t result;
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD, _QWORD);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 96), *(unsigned int *)(a1 + 108), *(_QWORD *)(a1 + 64));
  v3 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 72);
  if (v3)
    return v3(*(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 96), *(unsigned int *)(a1 + 108), *(_QWORD *)(a1 + 80));
  return result;
}

uint64_t sub_1C89546B8(uint64_t a1, int a2, const void *a3, unsigned int a4, uint64_t a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, void *__dst, _DWORD *a10, _DWORD *a11, mach_msg_timeout_t timeout)
{
  unsigned int v18;
  unsigned int *v19;
  mach_error_t v20;
  mach_error_t v21;
  char *v22;
  mach_error_t v23;
  mach_error_t v24;
  char *v25;
  mach_msg_return_t v26;
  mach_msg_return_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v31;
  _DWORD *v32;
  int v33;
  int v35;
  _BYTE msg[36];
  size_t __n[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!(_DWORD)a1)
  {
    syslog(3, "EDR - %s: no remote port\n");
    return 0xFFFFFFFFLL;
  }
  if (!(_DWORD)a5)
  {
    syslog(3, "EDR - %s: no local port\n");
    return 0xFFFFFFFFLL;
  }
  v18 = a1;
  v35 = 0;
  v19 = (unsigned int *)MEMORY[0x1E0C83DA0];
  v20 = MEMORY[0x1CAA383E8](*MEMORY[0x1E0C83DA0], a1, 0, &v35);
  if (v20)
  {
    v21 = v20;
    v22 = mach_error_string(v20);
    syslog(3, "EDR - %s: mach_port_get_refs() => %s (%d)\n", "transceive_data", v22, v21);
  }
  if (!v35)
  {
    syslog(3, "EDR - %s: remote port %d has no send right\n", "transceive_data", v18);
    return 1;
  }
  v35 = 0;
  v23 = MEMORY[0x1CAA383E8](*v19, a5, 1, &v35);
  if (v23)
  {
    v24 = v23;
    v25 = mach_error_string(v23);
    syslog(3, "EDR - %s: mach_port_get_refs() => %s (%d)\n", "transceive_data", v25, v24);
  }
  if (!v35)
  {
    syslog(3, "EDR - %s: local port %d has no receive right\n");
    return 0xFFFFFFFFLL;
  }
  memset(&msg[4], 0, 32);
  v42 = 0;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  *(_OWORD *)__n = 0u;
  *(_QWORD *)&msg[8] = __PAIR64__(a5, v18);
  *(_DWORD *)msg = 4883;
  *(_DWORD *)&msg[28] = a2;
  if (a3)
  {
    memcpy((char *)__n + 4, a3, a4);
    LODWORD(__n[0]) = a4;
  }
  *(_DWORD *)&msg[32] = 1;
  v26 = mach_msg((mach_msg_header_t *)msg, 50331923, 0x48u, 0x7Cu, a5, timeout, 0);
  if (!v26)
  {
    v31 = *(unsigned int *)&msg[4];
    v32 = &msg[(*(unsigned int *)&msg[4] + 3) & 0x1FFFFFFFCLL];
    if (!*v32 && v32[1] >= 0x34u)
    {
      *a6 = v32[10];
      *a7 = v32[12];
    }
    *a8 = *(_DWORD *)&msg[28];
    if (__dst)
    {
      v33 = __n[0];
      if (LODWORD(__n[0]) >= 0x21)
      {
        syslog(3, "EDR - %s: data size %d exceeds max data size %d\n");
LABEL_28:
        v29 = 0xFFFFFFFFLL;
LABEL_31:
        mach_msg_destroy((mach_msg_header_t *)msg);
        return v29;
      }
      if (v31 - 40 < (unint64_t)LODWORD(__n[0]))
      {
        syslog(3, "EDR - %s: data size %d exceeds message data size %u\n");
        goto LABEL_28;
      }
      memcpy(__dst, (char *)__n + 4, LODWORD(__n[0]));
      *a10 = v33;
    }
    v29 = 0;
    *a11 = *(_DWORD *)&msg[32];
    goto LABEL_31;
  }
  v27 = v26;
  v28 = mach_error_string(v26);
  syslog(3, "EDR - %s: mach_msg() => %s (%d), remote port: %d, local port: %d", "transceive_data", v28, v27, v18, a5);
  v29 = 0xFFFFFFFFLL;
  if ((v27 - 268435459) < 2)
    goto LABEL_31;
  return v29;
}

uint64_t sub_1C89549E0(uint64_t a1, unsigned int a2, uint64_t a3, int a4, const void *a5, uint64_t a6, const void *a7, uint64_t a8, char a9)
{
  uint64_t v15;
  const char *v16;
  const char *v17;

  v15 = sub_1C8954B04("com.apple.libEDR.Notification", a1, a2);
  if (a5)
  {
    sub_1C8955394(a1, a3, a4, a5, a6, 0, 0, a9);
    if (a9)
      v16 = "true";
    else
      v16 = "false";
    syslog(5, "EDR - client insert callback block client = %d type = %d block = %p local_olny = %s\n", *(_DWORD *)(a1 + 160), a4, a5, v16);
  }
  if (a7)
  {
    sub_1C8955394(a1, a3, a4, 0, 0, (uint64_t)a7, a8, a9);
    if (a9)
      v17 = "true";
    else
      v17 = "false";
    syslog(5, "EDR - client insert callback function client = %d type = %d function = %p local_olny = %s\n", *(_DWORD *)(a1 + 160), a4, a7, v17);
  }
  return v15;
}

uint64_t sub_1C8954B04(const char *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned int *v16;
  mach_error_t v17;
  mach_error_t v18;
  char *v19;
  int v20;
  _DWORD *v21;
  mach_error_t v22;
  mach_error_t v23;
  char *v24;
  mach_error_t v25;
  mach_error_t v26;
  char *v27;
  mach_error_t v28;
  mach_error_t v29;
  char *v30;
  int v31;
  int v32;
  dispatch_time_t v33;
  NSObject *v34;
  dispatch_queue_global_t global_queue;
  uint64_t *v36;
  uint64_t v37;
  NSObject *v38;
  dispatch_source_t v39;
  uint64_t *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  _QWORD v46[5];
  _QWORD handler[5];
  _QWORD block[6];
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  mach_port_t sp;
  mach_port_t special_port;

  if (a2)
  {
    v3 = a2;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2000000000;
    v53 = a2;
    if (*(_DWORD *)(a2 + 140))
      goto LABEL_3;
    pthread_rwlock_wrlock((pthread_rwlock_t *)(a2 + 232));
    v11 = v51;
    *(_QWORD *)(v51[3] + 120) = a1;
    v12 = v11[3];
    *(_DWORD *)(v12 + 140) = 0;
    pthread_rwlock_unlock((pthread_rwlock_t *)(v12 + 232));
    syslog(5, "EDR - client setup_remote_port\n");
    v13 = v51[3];
    if (qword_1ED83CB68 != -1)
      dispatch_once(&qword_1ED83CB68, &unk_1E8203A78);
    v14 = atomic_load((unsigned __int8 *)&qword_1ED83AAA8);
    if ((v14 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83AAA8))
      __cxa_guard_release(&qword_1ED83AAA8);
    v15 = atomic_load((unsigned __int8 *)&qword_1ED83AAA0);
    if ((v15 & 1) == 0 && __cxa_guard_acquire(&qword_1ED83AAA0))
      __cxa_guard_release(&qword_1ED83AAA0);
    special_port = 0;
    v16 = (unsigned int *)MEMORY[0x1E0C83DA0];
    v17 = task_get_special_port(*MEMORY[0x1E0C83DA0], 4, &special_port);
    v18 = v17;
    if (v17)
    {
      v19 = mach_error_string(v17);
      syslog(3, "EDR - %s: task_get_bootstrap_port() => %s (%d)\n", "setup_remote_port", v19, v18);
    }
    else
    {
      syslog(5, "EDR - Bootstrap Port: %d\n", special_port);
      sp = 0;
      v25 = bootstrap_look_up(special_port, a1, &sp);
      v26 = v25;
      if (v25)
      {
        v27 = mach_error_string(v25);
        syslog(3, "EDR - %s: bootstrap_look_up() => %s (%d)\n", "setup_remote_port", v27, v26);
      }
      else
      {
        mach_absolute_time();
        v54 = 0;
        v28 = MEMORY[0x1CAA383E8](*v16, sp, 4, &v54);
        v29 = v28;
        if (!(v28 | v54))
        {
          syslog(5, "EDR - Remote Port: %d (%s)\n", sp, a1);
          *(_DWORD *)(v13 + 140) = sp;
          v3 = v51[3];
LABEL_3:
          v4 = *(_DWORD *)(v3 + 8);
          if (v4 == sub_1C8952F5C())
          {
            v5 = *(_DWORD *)(v51[3] + 12);
            if (v5 == sub_1C8952FAC())
            {
              *(_DWORD *)(v51[3] + 160) = sub_1C8952F5C();
              v6 = 0;
              *(_DWORD *)(v51[3] + 164) = sub_1C8952FAC();
LABEL_37:
              _Block_object_dispose(&v50, 8);
              return v6;
            }
          }
          v7 = v51[3];
          v8 = *(_DWORD *)(v7 + 172);
          if (v8)
          {
            sub_1C895509C(*(_DWORD *)(v7 + 140), v8);
LABEL_9:
            v6 = 0;
            goto LABEL_37;
          }
          *(_DWORD *)(v7 + 172) = 0;
          syslog(5, "EDR - client setup_local_port\n");
          if (!sub_1C8952D3C(0, (mach_port_name_t *)(v51[3] + 172)))
          {
            *(_DWORD *)(v51[3] + 160) = sub_1C8952F5C();
            v20 = sub_1C8952FAC();
            v21 = (_DWORD *)v51[3];
            v21[41] = v20;
            if (!sub_1C895509C(v21[35], v21[43]))
            {
              special_port = 0;
              v22 = mach_port_request_notification(*MEMORY[0x1E0C83DA0], *(_DWORD *)(v51[3] + 140), 72, 1u, *(_DWORD *)(v51[3] + 172), 0x15u, &special_port);
              v23 = v22;
              if (v22)
              {
                v24 = mach_error_string(v22);
                syslog(3, "EDR - %s: mach_port_request_notification() => %s (%d)\n", "initialize_client_context", v24, v23);
              }
              else
              {
                pthread_rwlock_wrlock((pthread_rwlock_t *)(v51[3] + 232));
                global_queue = dispatch_get_global_queue(2, 0);
                v36 = v51;
                *(_QWORD *)(v51[3] + 176) = global_queue;
                v37 = v36[3];
                v38 = *(NSObject **)(v37 + 176);
                if (v38)
                {
                  v39 = dispatch_source_create(MEMORY[0x1E0C80D98], *(unsigned int *)(v37 + 172), 0, v38);
                  v40 = v51;
                  *(_QWORD *)(v51[3] + 184) = v39;
                  v37 = v40[3];
                  v41 = *(NSObject **)(v37 + 184);
                  if (v41)
                  {
                    dispatch_retain(v41);
                    pthread_rwlock_unlock((pthread_rwlock_t *)(v51[3] + 232));
                    v42 = *(NSObject **)(v51[3] + 184);
                    v43 = MEMORY[0x1E0C809B0];
                    handler[0] = MEMORY[0x1E0C809B0];
                    handler[1] = 0x40000000;
                    handler[2] = sub_1C8955160;
                    handler[3] = &unk_1E8203A10;
                    handler[4] = &v50;
                    dispatch_source_set_event_handler(v42, handler);
                    v44 = *(NSObject **)(v51[3] + 184);
                    v46[0] = v43;
                    v46[1] = 0x40000000;
                    v46[2] = sub_1C89552C4;
                    v46[3] = &unk_1E8203A38;
                    v46[4] = &v50;
                    dispatch_source_set_cancel_handler(v44, v46);
                    dispatch_resume(*(dispatch_object_t *)(v51[3] + 184));
                    goto LABEL_9;
                  }
                }
                pthread_rwlock_unlock((pthread_rwlock_t *)(v37 + 232));
              }
            }
          }
LABEL_36:
          v6 = 0xFFFFFFFFLL;
          goto LABEL_37;
        }
        v30 = mach_error_string(v28);
        syslog(3, "EDR - %s: The port seems dead. mach_port_get_refs() => %s (%d), DEAD_NAME refs: %d", "setup_remote_port", v30, v29, v54);
      }
    }
    if ((a3 & 0x80000000) == 0)
    {
      v31 = a3 - 1000;
      if (a3 < 0x3E9)
        v31 = -1;
      if (a3)
        v32 = v31;
      else
        v32 = 0;
      v33 = dispatch_time(0, 1000000000);
      v34 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = sub_1C8955068;
      block[3] = &unk_1E82039E8;
      block[4] = a1;
      block[5] = v3;
      v49 = v32;
      dispatch_after(v33, v34, block);
      v6 = 1;
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  return 0xFFFFFFFFLL;
}

void sub_1C895504C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1C8955068(uint64_t a1)
{
  syslog(5, "EDR - initialize client context retry\n");
  return sub_1C8954B04(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

uint64_t sub_1C895509C(mach_port_t a1, int a2)
{
  uint64_t result;
  int v5;
  char *v6;
  mach_msg_header_t msg;
  int v8;
  int v9;
  uint64_t v10;

  *(_QWORD *)&msg.msgh_voucher_port = 0;
  v8 = 1;
  v10 = 0x13000000000000;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_bits = 0x2880000013;
  v9 = a2;
  result = mach_msg(&msg, 17, 0x28u, 0, 0, 1u, 0);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = mach_error_string(result);
    syslog(3, "EDR - %s: mach_msg() => %s (%d), remote port: %d, port: %d", "send_port", v6, v5, a1, a2);
    if ((v5 - 268435459) <= 1)
      mach_msg_destroy(&msg);
    return 0xFFFFFFFFLL;
  }
  return result;
}

void sub_1C8955160(uint64_t a1)
{
  uint64_t v2;
  mach_port_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v5 = 0;
  v3 = 0;
  memset(v8, 0, sizeof(v8));
  if (!sub_1C8953794(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 172), &v7, &v6, (_DWORD *)&v5 + 1, (mach_port_t *)&v5, (mach_msg_size_t *)&v4 + 1, v8, (mach_port_t *)&v4, &v3))
  {
    if (HIDWORD(v5) == 2)
    {
      sub_1C8947A7C(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), HIDWORD(v4), (uint64_t)v8, v4, 0);
      if (v3 == 1)
        sub_1C8953B40(*(unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 140), 0, 0, 0, 2);
    }
    else if (HIDWORD(v5) == 3)
    {
      v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      if (*(_DWORD *)(v2 + 140))
      {
        syslog(5, "EDR - client free server port = %d\n", *(_DWORD *)(v2 + 140));
        sub_1C8953E40(*(unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 140));
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 140) = 0;
        v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      }
      dispatch_source_cancel(*(dispatch_source_t *)(v2 + 184));
    }
  }
}

uint64_t sub_1C89552C4(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;

  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 232));
  v2 = *(_DWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  syslog(5, "EDR - client cancel client = %d type = %d port = %d\n", v2[40], v2[42], v2[43]);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = *(NSObject **)(v3 + 184);
  if (v4)
  {
    dispatch_release(v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 184) = 0;
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  v5 = *(unsigned int *)(v3 + 172);
  if ((_DWORD)v5)
  {
    sub_1C8953E40(v5);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 172) = 0;
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)(v3 + 232));
}

uint64_t sub_1C8955388()
{
  return mach_timebase_info(&stru_1ED83CB60);
}

uint64_t sub_1C8955394(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  pthread_rwlock_t *v16;
  uint64_t v17;
  void **v18;
  uint64_t *v19;
  uint64_t *v20;
  char v21;
  void *v22;
  _DWORD *v23;
  char v24;
  _DWORD *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  float v29;
  float v30;
  _BOOL4 v31;
  unint64_t v32;
  unint64_t v33;
  int8x8_t prime;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t **v38;
  unint64_t v39;
  uint8x8_t v40;
  unint64_t v41;
  uint8x8_t v42;
  uint64_t v43;
  uint64_t *i;
  unint64_t v45;
  uint64_t *v46;
  _QWORD *v47;
  uint8x8_t v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t *v51;
  int v52;
  _QWORD *v53;
  unint64_t v54;
  unint64_t v55;
  _BOOL4 v56;
  int v57;
  unint64_t v58;
  unint64_t v59;
  void *v61;
  pthread_rwlock_t *v62;
  int v63;

  v63 = a3;
  v16 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 232));
  v17 = a1;
  v18 = (void **)(a1 + 192);
  v19 = sub_1C8954618(v18, &v63);
  if (v19 == v20)
    goto LABEL_9;
  v21 = 0;
  do
  {
    if ((const void *)v19[6] == a4 && v19[7] == a5 && v19[8] == a6)
      v21 |= v19[9] == a7;
    v19 = (uint64_t *)*v19;
  }
  while (v19 != v20);
  if ((v21 & 1) == 0)
  {
LABEL_9:
    v62 = v16;
    v22 = _Block_copy(a4);
    v23 = operator new(0x58uLL);
    v24 = a8;
    v25 = v23;
    v23[4] = a3;
    *((_QWORD *)v23 + 3) = a2;
    v23[8] = a3;
    v23[9] = 0;
    *((_QWORD *)v23 + 5) = v22;
    *((_QWORD *)v23 + 6) = a4;
    *((_QWORD *)v23 + 7) = a5;
    *((_QWORD *)v23 + 8) = a6;
    *((_QWORD *)v23 + 9) = a7;
    *((_BYTE *)v23 + 80) = v24;
    *(_DWORD *)((char *)v23 + 81) = 0;
    v23[21] = 0;
    v26 = a3;
    *(_QWORD *)v23 = 0;
    *((_QWORD *)v23 + 1) = a3;
    v27 = v17;
    v28 = *(_QWORD *)(v17 + 200);
    v29 = (float)(unint64_t)(*(_QWORD *)(v17 + 216) + 1);
    v30 = *(float *)(v17 + 224);
    if (!v28 || (float)(v30 * (float)v28) < v29)
    {
      v31 = (v28 & (v28 - 1)) == 0;
      if (v28 < 3)
        v31 = 0;
      v32 = (2 * v28) | !v31;
      v33 = vcvtps_u32_f32(v29 / v30);
      if (v32 <= v33)
        prime = (int8x8_t)v33;
      else
        prime = (int8x8_t)v32;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        v28 = *(_QWORD *)(v27 + 200);
      }
      if (*(_QWORD *)&prime > v28)
        goto LABEL_101;
      if (*(_QWORD *)&prime >= v28)
        goto LABEL_51;
      v41 = vcvtps_u32_f32((float)*(unint64_t *)(v27 + 216) / *(float *)(v27 + 224));
      if (v28 < 3 || (v42 = (uint8x8_t)vcnt_s8((int8x8_t)v28), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
      {
        v41 = std::__next_prime(v41);
      }
      else
      {
        v43 = 1 << -(char)__clz(v41 - 1);
        if (v41 >= 2)
          v41 = v43;
      }
      if (*(_QWORD *)&prime <= v41)
        prime = (int8x8_t)v41;
      if (*(_QWORD *)&prime >= v28)
      {
        v28 = *(_QWORD *)(v27 + 200);
        goto LABEL_51;
      }
      if (prime)
      {
LABEL_101:
        if (*(_QWORD *)&prime >> 61)
          sub_1C89491F0();
        v35 = operator new(8 * *(_QWORD *)&prime);
        v36 = *v18;
        *v18 = v35;
        if (v36)
          operator delete(v36);
        v37 = 0;
        *(int8x8_t *)(v27 + 200) = prime;
        do
          *((_QWORD *)*v18 + v37++) = 0;
        while (*(_QWORD *)&prime != v37);
        v38 = *(uint64_t ***)(v27 + 208);
        if (v38)
        {
          v39 = (unint64_t)v38[1];
          v40 = (uint8x8_t)vcnt_s8(prime);
          v40.i16[0] = vaddlv_u8(v40);
          if (v40.u32[0] > 1uLL)
          {
            if (v39 >= *(_QWORD *)&prime)
              v39 %= *(_QWORD *)&prime;
          }
          else
          {
            v39 &= *(_QWORD *)&prime - 1;
          }
          *((_QWORD *)*v18 + v39) = v27 + 208;
          for (i = *v38; *v38; i = *v38)
          {
            v45 = i[1];
            if (v40.u32[0] > 1uLL)
            {
              if (v45 >= *(_QWORD *)&prime)
                v45 %= *(_QWORD *)&prime;
            }
            else
            {
              v45 &= *(_QWORD *)&prime - 1;
            }
            if (v45 == v39)
            {
              v38 = (uint64_t **)i;
            }
            else
            {
              v46 = i;
              if (*((_QWORD *)*v18 + v45))
              {
                do
                {
                  v47 = v46;
                  v46 = (uint64_t *)*v46;
                }
                while (v46 && *((_DWORD *)i + 4) == *((_DWORD *)v46 + 4));
                *v38 = v46;
                *v47 = **((_QWORD **)*v18 + v45);
                **((_QWORD **)*v18 + v45) = i;
              }
              else
              {
                *((_QWORD *)*v18 + v45) = v38;
                v38 = (uint64_t **)i;
                v39 = v45;
              }
            }
          }
        }
        v28 = (unint64_t)prime;
      }
      else
      {
        v61 = *v18;
        *v18 = 0;
        if (v61)
          operator delete(v61);
        v28 = 0;
        *(_QWORD *)(v27 + 200) = 0;
      }
    }
LABEL_51:
    v48 = (uint8x8_t)vcnt_s8((int8x8_t)v28);
    v48.i16[0] = vaddlv_u8(v48);
    if (v48.u32[0] > 1uLL)
    {
      v49 = v26;
      if (v28 <= v26)
        v49 = v26 % v28;
    }
    else
    {
      v49 = (v28 - 1) & v26;
    }
    v50 = *v18;
    v51 = (uint64_t *)*((_QWORD *)*v18 + v49);
    if (v51)
    {
      v52 = 0;
      do
      {
        v53 = v51;
        v51 = (uint64_t *)*v51;
        if (!v51)
          break;
        v54 = v51[1];
        if (v48.u32[0] > 1uLL)
        {
          v55 = v51[1];
          if (v54 >= v28)
            v55 = v54 % v28;
        }
        else
        {
          v55 = v54 & (v28 - 1);
        }
        if (v55 != v49)
          break;
        v56 = v54 == v26 && *((_DWORD *)v51 + 4) == v25[4];
        v57 = v52 & !v56;
        v52 |= v56;
      }
      while (v57 != 1);
    }
    else
    {
      v53 = 0;
    }
    v58 = *((_QWORD *)v25 + 1);
    if (v48.u32[0] > 1uLL)
    {
      if (v58 >= v28)
        v58 %= v28;
    }
    else
    {
      v58 &= v28 - 1;
    }
    if (v53)
    {
      *(_QWORD *)v25 = *v53;
      *v53 = v25;
      if (!*(_QWORD *)v25)
        goto LABEL_87;
      v59 = *(_QWORD *)(*(_QWORD *)v25 + 8);
      if (v48.u32[0] > 1uLL)
      {
        if (v59 >= v28)
          v59 %= v28;
      }
      else
      {
        v59 &= v28 - 1;
      }
      if (v59 == v58)
        goto LABEL_87;
    }
    else
    {
      *(_QWORD *)v25 = *(_QWORD *)(v27 + 208);
      *(_QWORD *)(v27 + 208) = v25;
      v50[v58] = v27 + 208;
      if (!*(_QWORD *)v25)
      {
LABEL_87:
        ++*(_QWORD *)(v27 + 216);
        v16 = v62;
        return pthread_rwlock_unlock(v16);
      }
      v59 = *(_QWORD *)(*(_QWORD *)v25 + 8);
      if (v48.u32[0] > 1uLL)
      {
        if (v59 >= v28)
          v59 %= v28;
      }
      else
      {
        v59 &= v28 - 1;
      }
    }
    *((_QWORD *)*v18 + v59) = v25;
    goto LABEL_87;
  }
  return pthread_rwlock_unlock(v16);
}

void sub_1C89558A8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C89558BC(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, const void *a6, uint64_t a7, int a8)
{
  const char *v15;
  const char *v16;

  if (a4)
  {
    sub_1C89559B8(a1, a2, a3, a4, a5, 0, 0, a8);
    if (a8)
      v15 = "true";
    else
      v15 = "false";
    syslog(5, "EDR - server insert handler block server = %d type = %d block = %p local_only = %s\n", *(_DWORD *)(a1 + 8), a3, a4, v15);
  }
  if (a6)
  {
    sub_1C89559B8(a1, a2, a3, 0, 0, (uint64_t)a6, a7, a8);
    if (a8)
      v16 = "true";
    else
      v16 = "false";
    syslog(5, "EDR - server insert handler function server = %d type = %d function = %p local_only = %s\n", *(_DWORD *)(a1 + 8), a3, a6, v16);
  }
}

uint64_t sub_1C89559B8(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  unint64_t v8;
  pthread_rwlock_t *v13;
  _QWORD *v14;
  uint64_t *v15;
  void *v16;
  unint64_t v17;
  uint8x8_t v18;
  uint64_t **v19;
  uint64_t *i;
  unint64_t v21;
  char *v22;
  float v23;
  float v24;
  _BOOL4 v25;
  unint64_t v26;
  unint64_t v27;
  int8x8_t prime;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  uint8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  unint64_t v42;
  _QWORD *v44;
  pthread_rwlock_t *v45;
  int v50;

  v50 = a3;
  v13 = (pthread_rwlock_t *)(a1 + 232);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 232));
  v14 = (_QWORD *)(a1 + 80);
  v15 = sub_1C8947B94((_QWORD *)(a1 + 80), &v50);
  if (!v15 || (const void *)v15[6] != a4 || v15[7] != a5 || v15[8] != a6 || v15[9] != a7)
  {
    v16 = _Block_copy(a4);
    v17 = *(_QWORD *)(a1 + 88);
    v45 = v13;
    if (v17)
    {
      v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
      v18.i16[0] = vaddlv_u8(v18);
      if (v18.u32[0] > 1uLL)
      {
        v8 = a3;
        if (v17 <= a3)
          v8 = a3 % v17;
      }
      else
      {
        v8 = (v17 - 1) & a3;
      }
      v19 = *(uint64_t ***)(*v14 + 8 * v8);
      if (v19)
      {
        for (i = *v19; i; i = (uint64_t *)*i)
        {
          v21 = i[1];
          if (v21 == a3)
          {
            if (*((_DWORD *)i + 4) == a3)
              return pthread_rwlock_unlock(v13);
          }
          else
          {
            if (v18.u32[0] > 1uLL)
            {
              if (v21 >= v17)
                v21 %= v17;
            }
            else
            {
              v21 &= v17 - 1;
            }
            if (v21 != v8)
              break;
          }
        }
      }
    }
    v22 = (char *)operator new(0x58uLL);
    *(_QWORD *)v22 = 0;
    *((_QWORD *)v22 + 1) = a3;
    *((_DWORD *)v22 + 4) = a3;
    *((_QWORD *)v22 + 3) = a2;
    *((_DWORD *)v22 + 8) = a3;
    *((_DWORD *)v22 + 9) = 0;
    *((_QWORD *)v22 + 5) = v16;
    *((_QWORD *)v22 + 6) = a4;
    *((_QWORD *)v22 + 7) = a5;
    *((_QWORD *)v22 + 8) = a6;
    *((_QWORD *)v22 + 9) = a7;
    v22[80] = a8;
    *(_DWORD *)(v22 + 81) = 0;
    *((_DWORD *)v22 + 21) = 0;
    v23 = (float)(unint64_t)(*(_QWORD *)(a1 + 104) + 1);
    v24 = *(float *)(a1 + 112);
    if (v17 && (float)(v24 * (float)v17) >= v23)
    {
LABEL_69:
      v40 = (_QWORD *)*v14;
      v41 = *(_QWORD **)(*v14 + 8 * v8);
      if (v41)
      {
        *(_QWORD *)v22 = *v41;
      }
      else
      {
        *(_QWORD *)v22 = *(_QWORD *)(a1 + 96);
        *(_QWORD *)(a1 + 96) = v22;
        v40[v8] = a1 + 96;
        if (!*(_QWORD *)v22)
        {
LABEL_78:
          ++*(_QWORD *)(a1 + 104);
          v13 = v45;
          return pthread_rwlock_unlock(v13);
        }
        v42 = *(_QWORD *)(*(_QWORD *)v22 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v42 >= v17)
            v42 %= v17;
        }
        else
        {
          v42 &= v17 - 1;
        }
        v41 = (_QWORD *)(*v14 + 8 * v42);
      }
      *v41 = v22;
      goto LABEL_78;
    }
    v25 = (v17 & (v17 - 1)) == 0;
    if (v17 < 3)
      v25 = 0;
    v26 = (2 * v17) | !v25;
    v27 = vcvtps_u32_f32(v23 / v24);
    if (v26 <= v27)
      prime = (int8x8_t)v27;
    else
      prime = (int8x8_t)v26;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v17 = *(_QWORD *)(a1 + 88);
    }
    if (*(_QWORD *)&prime > v17)
      goto LABEL_35;
    if (*(_QWORD *)&prime < v17)
    {
      v35 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 104) / *(float *)(a1 + 112));
      if (v17 < 3 || (v36 = (uint8x8_t)vcnt_s8((int8x8_t)v17), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
      {
        v35 = std::__next_prime(v35);
      }
      else
      {
        v37 = 1 << -(char)__clz(v35 - 1);
        if (v35 >= 2)
          v35 = v37;
      }
      if (*(_QWORD *)&prime <= v35)
        prime = (int8x8_t)v35;
      if (*(_QWORD *)&prime >= v17)
      {
        v17 = *(_QWORD *)(a1 + 88);
      }
      else
      {
        if (prime)
        {
LABEL_35:
          if (*(_QWORD *)&prime >> 61)
            sub_1C89491F0();
          v29 = operator new(8 * *(_QWORD *)&prime);
          v30 = (_QWORD *)*v14;
          *v14 = v29;
          if (v30)
            operator delete(v30);
          v31 = 0;
          *(int8x8_t *)(a1 + 88) = prime;
          do
            *(_QWORD *)(*v14 + 8 * v31++) = 0;
          while (*(_QWORD *)&prime != v31);
          v32 = *(_QWORD **)(a1 + 96);
          if (v32)
          {
            v33 = v32[1];
            v34 = (uint8x8_t)vcnt_s8(prime);
            v34.i16[0] = vaddlv_u8(v34);
            if (v34.u32[0] > 1uLL)
            {
              if (v33 >= *(_QWORD *)&prime)
                v33 %= *(_QWORD *)&prime;
            }
            else
            {
              v33 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*v14 + 8 * v33) = a1 + 96;
            v38 = (_QWORD *)*v32;
            if (*v32)
            {
              do
              {
                v39 = v38[1];
                if (v34.u32[0] > 1uLL)
                {
                  if (v39 >= *(_QWORD *)&prime)
                    v39 %= *(_QWORD *)&prime;
                }
                else
                {
                  v39 &= *(_QWORD *)&prime - 1;
                }
                if (v39 != v33)
                {
                  if (!*(_QWORD *)(*v14 + 8 * v39))
                  {
                    *(_QWORD *)(*v14 + 8 * v39) = v32;
                    goto LABEL_60;
                  }
                  *v32 = *v38;
                  *v38 = **(_QWORD **)(*v14 + 8 * v39);
                  **(_QWORD **)(*v14 + 8 * v39) = v38;
                  v38 = v32;
                }
                v39 = v33;
LABEL_60:
                v32 = v38;
                v38 = (_QWORD *)*v38;
                v33 = v39;
              }
              while (v38);
            }
          }
          v17 = (unint64_t)prime;
          goto LABEL_64;
        }
        v44 = (_QWORD *)*v14;
        *v14 = 0;
        if (v44)
          operator delete(v44);
        v17 = 0;
        *(_QWORD *)(a1 + 88) = 0;
      }
    }
LABEL_64:
    if ((v17 & (v17 - 1)) != 0)
    {
      if (v17 <= a3)
        v8 = a3 % v17;
      else
        v8 = a3;
    }
    else
    {
      v8 = (v17 - 1) & a3;
    }
    goto LABEL_69;
  }
  return pthread_rwlock_unlock(v13);
}

void sub_1C8955E54(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C8955E68(_QWORD *a1, uint64_t *__p)
{
  int8x8_t v2;
  uint64_t v3;
  unint64_t v4;
  uint8x8_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v2 = (int8x8_t)a1[1];
  v3 = *__p;
  v4 = __p[1];
  v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v2)
      v4 %= *(_QWORD *)&v2;
  }
  else
  {
    v4 &= *(_QWORD *)&v2 - 1;
  }
  v6 = *(uint64_t **)(*a1 + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (uint64_t *)*v6;
  }
  while (v6 != __p);
  if (v7 != a1 + 2)
  {
    v8 = v7[1];
    if (v5.u32[0] > 1uLL)
    {
      if (v8 >= *(_QWORD *)&v2)
        v8 %= *(_QWORD *)&v2;
    }
    else
    {
      v8 &= *(_QWORD *)&v2 - 1;
    }
    if (v8 == v4)
    {
LABEL_20:
      if (!v3)
        goto LABEL_27;
      goto LABEL_21;
    }
  }
  if (!v3)
    goto LABEL_19;
  v9 = *(_QWORD *)(v3 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v9 >= *(_QWORD *)&v2)
      v9 %= *(_QWORD *)&v2;
  }
  else
  {
    v9 &= *(_QWORD *)&v2 - 1;
  }
  if (v9 != v4)
  {
LABEL_19:
    *(_QWORD *)(*a1 + 8 * v4) = 0;
    v3 = *__p;
    goto LABEL_20;
  }
LABEL_21:
  v10 = *(_QWORD *)(v3 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v10 >= *(_QWORD *)&v2)
      v10 %= *(_QWORD *)&v2;
  }
  else
  {
    v10 &= *(_QWORD *)&v2 - 1;
  }
  if (v10 != v4)
  {
    *(_QWORD *)(*a1 + 8 * v10) = v7;
    v3 = *__p;
  }
LABEL_27:
  *v7 = v3;
  *__p = 0;
  --a1[3];
  operator delete(__p);
}

uint64_t sub_1C8955F90()
{
  return mach_timebase_info((mach_timebase_info_t)&qword_1ED83CB88);
}

uint64_t sub_1C8955F9C(uint64_t result)
{
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_DWORD *)(result + 24) = 1065353216;
  *(_QWORD *)(result + 32) = 0;
  return result;
}

uint64_t sub_1C8955FB4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = a2;
  return result;
}

uint64_t sub_1C8955FBC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = a2;
  return result;
}

uint64_t sub_1C8955FC4(uint64_t result, float a2)
{
  *(float *)(result + 24) = a2;
  return result;
}

uint64_t sub_1C8955FCC(uint64_t a1)
{
  uint64_t (*v1)(float, float, double);

  v1 = *(uint64_t (**)(float, float, double))(a1 + 40);
  if (!v1)
    sub_1C89566D4();
  return v1(*(float *)a1, *(float *)(a1 + 4), *(double *)(a1 + 16));
}

void sub_1C8955FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1C895269C();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: displayID %d is not permitted number\n", v1, v2, v3, v4, v5);
  sub_1C8952694();
}

void sub_1C8956060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], a3, "libEDR - %s: Exceed max number of displays (%d)\n", a5, a6, a7, a8, 2u);
  sub_1C8952694();
}

void sub_1C89560E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C8952680();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: displays %d context exists\n", v1, v2, v3, v4, 2u);
  sub_1C8952694();
}

void sub_1C8956158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1C895269C();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: attempt to use invalid display number %d\n", v1, v2, v3, v4, v5);
  sub_1C8952694();
}

void sub_1C89561C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C8952680();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: displays %d context not found\n", v1, v2, v3, v4, 2u);
  sub_1C8952694();
}

void sub_1C895623C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C8952680();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: displays %d context not found\n", v1, v2, v3, v4, 2u);
  sub_1C8952694();
}

void sub_1C89562B0(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1C8945000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "libEDR - NotificationCallback: can not find data for display %d\n", (uint8_t *)v1, 8u);
}

void sub_1C895632C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C8952680();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: sysctlbyname() => 0x%x\n", v1, v2, v3, v4, 2u);
  sub_1C8952694();
}

void sub_1C89563A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C8952680();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: IORegistryEntrySetCFProperty() => 0x%x\n", v1, v2, v3, v4, 2u);
  sub_1C8952694();
}

void sub_1C8956414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C89526BC(&dword_1C8945000, MEMORY[0x1E0C81028], a3, "libEDR - %s: Unable to create dispatch source for SBIM data pull\n", a5, a6, a7, a8, 2u);
  sub_1C8952694();
}

void sub_1C8956488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1C89526BC(&dword_1C8945000, MEMORY[0x1E0C81028], a3, "libEDR - %s: Unable to create dispatch source for SBIM mitigation\n", a5, a6, a7, a8, 2u);
  sub_1C8952694();
}

void sub_1C89564FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C89526CC();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: IOMobileFramebufferGetMainDisplay() => %d\n", v1, v2, v3, v4, 2u);
  sub_1C8952694();
}

void sub_1C8956574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C8952680();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: IOMobileFramebufferGetMainDisplay() => 0x%x\n", v1, v2, v3, v4, 2u);
  sub_1C8952694();
}

void sub_1C89565E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C8952680();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: unknown SBIM mitigation stage %d, ignoring ... \n", v1, v2, v3, v4, 2u);
  sub_1C8952694();
}

void sub_1C895665C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1C89526CC();
  sub_1C8952670(&dword_1C8945000, MEMORY[0x1E0C81028], v0, "libEDR - %s: SBIM unknown mitigation stage %d, ignoring ... \n", v1, v2, v3, v4, 2u);
  sub_1C8952694();
}

void sub_1C89566D4()
{
  __assert_rtn("TimeStep", "EDRBrightnessAnimation.cpp", 63, "timeStep_");
}

void sub_1C89566FC()
{
  __assert_rtn("ValueAtTime", "EDRBrightnessAnimation.cpp", 70, "animationCurve_");
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

uint64_t IOMobileFramebufferGetBlock()
{
  return MEMORY[0x1E0D39FB8]();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return MEMORY[0x1E0D3A020]();
}

uint64_t IOMobileFramebufferGetServiceObject()
{
  return MEMORY[0x1E0D3A048]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1E0CBB9B0](*(_QWORD *)&entry, propertyName, property);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x1E0DE4890](this);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x1E0DE48A8](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x1E0DE48B0](this);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x1E0DE4920](*(_QWORD *)&__ev, __what_arg);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E8201038();
}

void operator delete(void *__p)
{
  off_1E8201040(__p);
}

uint64_t operator new[]()
{
  return off_1E8201048();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E8201050(__sz);
}

uint64_t operator new()
{
  return off_1E8201058();
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

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

char *__cdecl asctime(const tm *a1)
{
  return (char *)MEMORY[0x1E0C81590](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C816F8](*(_QWORD *)&bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83BA8](a1);
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE8](*(_QWORD *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_destroy(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83D00](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x1E0C83D30](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, refs);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C83D70](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return MEMORY[0x1E0C83E28](deadline);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C85650](__str, __sep, __lasts);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C85828](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

