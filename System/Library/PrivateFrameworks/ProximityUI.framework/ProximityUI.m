RoseSyntheticApertureFiltering::PRRoseRangeFilter *RoseSyntheticApertureFiltering::PRRoseRangeFilter::PRRoseRangeFilter(RoseSyntheticApertureFiltering::PRRoseRangeFilter *this)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  long double v6;
  unsigned int v7;
  NSObject *v8;
  uint8_t v10[16];

  *(_WORD *)this = 0;
  *((_DWORD *)this + 2) = 0;
  *((_OWORD *)this + 1) = xmmword_223118D10;
  *((_QWORD *)this + 6) = &off_24EC111A0;
  v2 = (char *)this + 48;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 9) = 0x100000003;
  *(_OWORD *)((char *)this + 56) = xmmword_223118D20;
  *((_QWORD *)this + 10) = (char *)this + 88;
  *((_QWORD *)this + 14) = &off_24EC111A0;
  v3 = (char *)this + 112;
  *((_QWORD *)this + 17) = 0x100000003;
  *(_OWORD *)((char *)this + 120) = xmmword_223118D20;
  *((_QWORD *)this + 22) = &off_24EC111A0;
  v4 = (char *)this + 176;
  *((_QWORD *)this + 18) = (char *)this + 152;
  *((_QWORD *)this + 25) = 0x100000003;
  *(_OWORD *)((char *)this + 184) = xmmword_223118D20;
  *((_QWORD *)this + 26) = (char *)this + 216;
  *((_OWORD *)this + 15) = xmmword_223118D30;
  v5 = (char *)this + 240;
  *((_QWORD *)this + 32) = 0xBFFBB67AE8584CAALL;
  v6 = erf(1.73205081);
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 40) = 0u;
  *((_QWORD *)this + 37) = 0;
  *((long double *)this + 38) = v6;
  v7 = 0;
  *((long double *)this + 39) = erf(-1.73205081);
  *(_OWORD *)((char *)this + 360) = xmmword_223118DD8;
  *(_OWORD *)((char *)this + 376) = unk_223118DE8;
  *((_QWORD *)this + 44) = 0x3FC5555555555555;
  *((_OWORD *)this + 20) = xmmword_223118DB0;
  *((_OWORD *)this + 21) = unk_223118DC0;
  *((_QWORD *)this + 49) = 0x3FC5555555555555;
  do
  {
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v3, v7) = 0;
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v4, v7) = 0;
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v2, v7++) = 0;
  }
  while (v7 != 3);
  v8 = os_log_create("com.apple.proximity", "RangeFilter");
  *((_QWORD *)this + 5) = v8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2230E5000, v8, OS_LOG_TYPE_DEFAULT, "PRRoseRangeFilter constructed", v10, 2u);
  }
  return this;
}

void sub_2230E6C5C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;

  *v3 = off_24EC111F8;
  *v2 = off_24EC111F8;
  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

_QWORD *cnmatrix::CNMatrix<3u,1u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::addMeasurementWithVIO(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  NSObject *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t (**v28)();
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (**v33)();
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (**v38)();
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  _BYTE v43[24];
  uint64_t v44;
  _QWORD v45[4];
  uint8_t buf[4];
  double v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(double *)a2;
    v8 = *(_QWORD *)(a2 + 8);
    v9 = *(_QWORD *)(a2 + 16);
    v10 = *(_QWORD *)(a2 + 96);
    v11 = *(_QWORD *)(a2 + 104);
    v12 = *(_QWORD *)(a2 + 112);
    *(_DWORD *)buf = 134219264;
    v47 = v7;
    v48 = 2048;
    v49 = v8;
    v50 = 2048;
    v51 = v9;
    v52 = 2048;
    v53 = v10;
    v54 = 2048;
    v55 = v11;
    v56 = 2048;
    v57 = v12;
    _os_log_impl(&dword_2230E5000, v6, OS_LOG_TYPE_DEFAULT, "Measurement added with VIO: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, position [%3.2f, %3.2f, %3.2f] m", buf, 0x3Eu);
  }
  v40 = 0x100000003;
  v38 = &off_24EC111A0;
  v39 = xmmword_223118D20;
  v41 = &v42;
  cnmatrix::FastResize<double>(&v38, 3, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v38, 0.0);
  v35 = 0x100000004;
  v33 = &off_24EC11228;
  v34 = xmmword_223118D40;
  v36 = &v37;
  cnmatrix::FastResize<double>(&v33, 4, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v33, 0.0);
  for (i = 0; i != 3; ++i)
  {
    v14 = a2 + 8 * i;
    v15 = *(_QWORD *)(v14 + 96);
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v38, i) = v15;
    v16 = *(_QWORD *)(v14 + 120);
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v33, i) = v16;
  }
  v17 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v33, 3u) = v17;
  RoseSyntheticApertureFiltering::quatn2rot((uint64_t)&v33, (uint64_t)buf);
  v44 = 0x100000003;
  *(_QWORD *)v43 = &off_24EC111A0;
  *(_OWORD *)&v43[8] = xmmword_223118D20;
  v45[0] = &v45[1];
  cnmatrix::Multiply<double>((uint64_t)buf, a1 + 112, (uint64_t)v43);
  v30 = 0x100000003;
  v28 = &off_24EC111A0;
  v29 = xmmword_223118D20;
  v31 = &v32;
  cnmatrix::Add<double>((uint64_t)&v38, (uint64_t)v43, (uint64_t)&v28);
  if (*(_BYTE *)a1)
  {
    v18 = *(_DWORD *)(a1 + 8);
    if (v18 == 1)
    {
      RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithPose(a1, (uint64_t)&v28);
    }
    else if (!v18)
    {
      v19 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_2230E5000, v19, OS_LOG_TYPE_DEFAULT, "Range filter transitioning from non-VIO to VIO mode", v43, 2u);
      }
      RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithTime((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1, *(double *)a2, 0);
      cnmatrix::CNMatrixBase<double>::operator=(a1 + 48, (uint64_t)&v28);
    }
    RoseSyntheticApertureFiltering::PRRoseRangeFilter::measurementUpdate((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1, *(double *)(a2 + 8), *(double *)(a2 + 16), 0);
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 8);
    cnmatrix::CNMatrixBase<double>::operator=(a1 + 48, (uint64_t)&v28);
    *(_BYTE *)a1 = 1;
    v20 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 16);
      v22 = *(_QWORD *)(a1 + 24);
      *(_DWORD *)v43 = 134218240;
      *(_QWORD *)&v43[4] = v21;
      *(_WORD *)&v43[12] = 2048;
      *(_QWORD *)&v43[14] = v22;
      _os_log_impl(&dword_2230E5000, v20, OS_LOG_TYPE_DEFAULT, "Initializing range filter with VIO: range %f m, uncertainty %f m", v43, 0x16u);
    }
  }
  v23 = *(double *)a2;
  *(_DWORD *)(a1 + 8) = 1;
  *(double *)(a1 + 32) = v23;
  v24 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(_QWORD *)(a1 + 16);
    v26 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)v43 = 134218754;
    *(double *)&v43[4] = v23;
    *(_WORD *)&v43[12] = 2048;
    *(_QWORD *)&v43[14] = v25;
    *(_WORD *)&v43[22] = 2048;
    v44 = v26;
    LOWORD(v45[0]) = 2080;
    *(_QWORD *)((char *)v45 + 2) = "YES";
    _os_log_impl(&dword_2230E5000, v24, OS_LOG_TYPE_DEFAULT, "Filter state after meas with VIO: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, with VIO: %s", v43, 0x2Au);
  }
  v27 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)a3 = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(a3 + 16) = v27;
  *(double *)(a3 + 8) = fmax(*(double *)(a3 + 8), 0.0);
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithTime(RoseSyntheticApertureFiltering::PRRoseRangeFilter *this, double a2, int a3)
{
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  int v10;
  double v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = *((double *)this + 4);
  v5 = a2 - v4;
  if (!a3)
    v5 = v5 * 0.0625;
  v6 = sqrt(v5 + *((double *)this + 3) * *((double *)this + 3));
  *((double *)this + 3) = v6;
  v7 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *((_QWORD *)this + 2);
    if (*((_DWORD *)this + 2) == 1)
      v9 = "YES";
    else
      v9 = "NO";
    v10 = 134218754;
    v11 = v4;
    v12 = 2048;
    v13 = v8;
    v14 = 2048;
    v15 = v6;
    v16 = 2080;
    v17 = v9;
    _os_log_impl(&dword_2230E5000, v7, OS_LOG_TYPE_DEFAULT, "Filter state after propagation with time: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, with VIO: %s", (uint8_t *)&v10, 0x2Au);
  }
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithPose(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  uint64_t (**v19)();
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (**v24)();
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (**v29)();
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  _BYTE buf[24];
  uint64_t v35;
  _QWORD v36[310];

  v36[309] = *MEMORY[0x24BDAC8D0];
  v4 = a1 + 48;
  v21 = 0x100000003;
  v19 = &off_24EC111A0;
  v20 = xmmword_223118D20;
  v22 = &v23;
  cnmatrix::Subtract<double>(a2, a1 + 48, (uint64_t)&v19);
  v31 = 0x100000003;
  v29 = &off_24EC111A0;
  v30 = xmmword_223118D20;
  v32 = &v33;
  v35 = 0x100000134;
  *(_QWORD *)buf = &off_24EC11270;
  *(_OWORD *)&buf[8] = xmmword_223118D50;
  v36[0] = &v36[1];
  v26 = 0x100000003;
  v24 = &off_24EC111A0;
  v25 = xmmword_223118D20;
  v27 = &v28;
  cnmatrix::Norm<double>((uint64_t)&v19, (uint64_t)&v29, (uint64_t)buf, (uint64_t)&v24, "2");
  v6 = v5;
  cnmatrix::CNMatrixBase<double>::operator=(v4, a2);
  v8 = *(double *)(a1 + 16);
  v7 = *(double *)(a1 + 24);
  if (v8 + v7 * -1.73205081 <= 0.0)
  {
    v15 = sqrt(v6 * 0.5 * (v6 * 0.5) + v7 * v7);
    *(double *)(a1 + 24) = v15;
  }
  else
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      v11 = v8 + v7 * *(double *)(a1 + v9 + 240);
      v12 = sqrt(v6 * v6 + v11 * v11 + v6 * -2.0 * v11 * *(double *)(a1 + v9 + 280));
      *(double *)&buf[v9] = v12;
      v10 = v10 + *(double *)(a1 + v9 + 320) * v12;
      v9 += 8;
    }
    while (v9 != 40);
    v13 = 0;
    v14 = 0.0;
    do
    {
      v14 = v14 + *(double *)(a1 + 360 + v13) * (*(double *)&buf[v13] - v10) * (*(double *)&buf[v13] - v10);
      v13 += 8;
    }
    while (v13 != 40);
    v15 = sqrt(v14);
    *(double *)(a1 + 16) = v10;
    *(double *)(a1 + 24) = v15;
    v8 = v10;
  }
  v16 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(a1 + 8) == 1)
      v18 = "YES";
    else
      v18 = "NO";
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2048;
    v35 = *(_QWORD *)&v15;
    LOWORD(v36[0]) = 2080;
    *(_QWORD *)((char *)v36 + 2) = v18;
    _os_log_impl(&dword_2230E5000, v16, OS_LOG_TYPE_DEFAULT, "Filter state after propagation with pose: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, with VIO: %s", buf, 0x2Au);
  }
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::measurementUpdate(RoseSyntheticApertureFiltering::PRRoseRangeFilter *this, double a2, double a3, char a4)
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3 * a3;
  v8 = *((double *)this + 2);
  v9 = *((double *)this + 3);
  v10 = a3 * a3 + v9 * v9;
  v11 = sqrt(v10);
  v12 = (a2 - v8) / v11;
  if ((a4 & 1) != 0 || v12 <= 6.0)
  {
    if ((a4 & 1) != 0 || v12 >= -6.0)
    {
      if (*((_BYTE *)this + 1))
      {
        *((_BYTE *)this + 1) = 0;
        v19 = *((_QWORD *)this + 5);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_2230E5000, v19, OS_LOG_TYPE_DEFAULT, "Did not observe a second nLoS->LoS event after the first one - marked as a false event due to packet collision", (uint8_t *)&v21, 2u);
          v8 = *((double *)this + 2);
          v9 = *((double *)this + 3);
        }
      }
      *((double *)this + 2) = (v7 * v8 + a2 * (v9 * v9)) / v10;
      *((double *)this + 3) = v9 * a3 / v11;
    }
    else if (*((_BYTE *)this + 1))
    {
      *((_BYTE *)this + 1) = 0;
      v18 = *((_QWORD *)this + 5);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v21 = 134218496;
        v22 = v8;
        v23 = 2048;
        v24 = a2;
        v25 = 2048;
        v26 = v12;
        _os_log_error_impl(&dword_2230E5000, v18, OS_LOG_TYPE_ERROR, "Second nLos->LoS event detected by the range filter: Previous range %f m, Current range %f m, Normalized change %f", (uint8_t *)&v21, 0x20u);
        v18 = *((_QWORD *)this + 5);
      }
      *((double *)this + 2) = a2;
      *((double *)this + 3) = a3;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 134218240;
        v22 = a2;
        v23 = 2048;
        v24 = a3;
        v15 = "Re-initializing range filter: range %f m, uncertainty %f m";
        v16 = v18;
        v17 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      *((_BYTE *)this + 1) = 1;
      v20 = *((_QWORD *)this + 5);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = 134218496;
        v22 = v8;
        v23 = 2048;
        v24 = a2;
        v25 = 2048;
        v26 = v12;
        _os_log_error_impl(&dword_2230E5000, v20, OS_LOG_TYPE_ERROR, "Possible nLos->LoS event detected by the range filter: Previous range %f m, Current range %f m, Normalized change %f - not acting yet", (uint8_t *)&v21, 0x20u);
      }
    }
  }
  else
  {
    v13 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v21 = 134218496;
      v22 = v8;
      v23 = 2048;
      v24 = a2;
      v25 = 2048;
      v26 = v12;
      _os_log_error_impl(&dword_2230E5000, v13, OS_LOG_TYPE_ERROR, "LoS->nLoS event detected by the range filter: Previous range %f m, Current range %f m, Normalized change %f", (uint8_t *)&v21, 0x20u);
    }
    if (*((_BYTE *)this + 1))
    {
      *((_BYTE *)this + 1) = 0;
      v14 = *((_QWORD *)this + 5);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        v15 = "Did not observe a second nLoS->LoS event after the first one - marked as a false event due to packet collision";
        v16 = v14;
        v17 = 2;
LABEL_15:
        _os_log_impl(&dword_2230E5000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, v17);
      }
    }
  }
}

double RoseSyntheticApertureFiltering::PRRoseRangeFilter::getCurrentState@<D0>(RoseSyntheticApertureFiltering::PRRoseRangeFilter *this@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  double result;

  v2 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)a2 = *(_OWORD *)((char *)this + 8);
  *(_OWORD *)(a2 + 16) = v2;
  result = fmax(*(double *)(a2 + 8), 0.0);
  *(double *)(a2 + 8) = result;
  return result;
}

_QWORD *cnmatrix::CNMatrix<4u,1u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

void RoseSyntheticApertureFiltering::PRRoseRangeFilter::addMeasurementWithoutVIO(uint64_t a1@<X0>, double *a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>)
{
  NSObject *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  RoseSyntheticApertureFiltering::PRRoseRangeFilter *v21;
  char v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  _DWORD *v27;
  NSObject *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  int v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *a2;
    v12 = *((_QWORD *)a2 + 1);
    v13 = *((_QWORD *)a2 + 2);
    v14 = "YES";
    if (a3)
      v15 = "YES";
    else
      v15 = "NO";
    if (!a4)
      v14 = "NO";
    v33 = 134219010;
    v34 = v11;
    v35 = 2048;
    v36 = v12;
    v37 = 2048;
    v38 = v13;
    v39 = 2080;
    v40 = v15;
    v41 = 2080;
    v42 = v14;
    _os_log_impl(&dword_2230E5000, v10, OS_LOG_TYPE_DEFAULT, "Measurement added without VIO: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, isCompanionMoving %s, isDeviceMoving %s", (uint8_t *)&v33, 0x34u);
  }
  if (*(_BYTE *)a1)
  {
    if ((a3 & 1) != 0 || (a4 & 1) != 0)
    {
      RoseSyntheticApertureFiltering::PRRoseRangeFilter::propagateStateWithTime((RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1, *a2, a3);
      v19 = a2[1];
      v20 = a2[2];
      v21 = (RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1;
      v22 = a3;
    }
    else
    {
      v16 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = a2[1];
        v18 = *((_QWORD *)a2 + 2);
        v33 = 134218240;
        v34 = v17;
        v35 = 2048;
        v36 = v18;
        _os_log_impl(&dword_2230E5000, v16, OS_LOG_TYPE_DEFAULT, "Range filter update with stationary companion and device: range %f m, uncertainty %f m", (uint8_t *)&v33, 0x16u);
      }
      v19 = a2[1];
      v20 = a2[2];
      v21 = (RoseSyntheticApertureFiltering::PRRoseRangeFilter *)a1;
      v22 = 0;
    }
    RoseSyntheticApertureFiltering::PRRoseRangeFilter::measurementUpdate(v21, v19, v20, v22);
  }
  else
  {
    v23 = a2[1];
    *(double *)(a1 + 16) = v23;
    v24 = *((_QWORD *)a2 + 2);
    *(_QWORD *)(a1 + 24) = v24;
    *(_BYTE *)a1 = 1;
    v25 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 134218240;
      v34 = v23;
      v35 = 2048;
      v36 = v24;
      _os_log_impl(&dword_2230E5000, v25, OS_LOG_TYPE_DEFAULT, "Initializing range filter without VIO: range %f m, uncertainty %f m", (uint8_t *)&v33, 0x16u);
    }
  }
  v27 = (_DWORD *)(a1 + 8);
  v26 = *(_DWORD *)(a1 + 8);
  *(double *)(a1 + 32) = *a2;
  v28 = *(NSObject **)(a1 + 40);
  if (v26 == 1 && os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v33) = 0;
    _os_log_impl(&dword_2230E5000, v28, OS_LOG_TYPE_DEFAULT, "Range filter transitioning from VIO to non-VIO mode", (uint8_t *)&v33, 2u);
    v28 = *(NSObject **)(a1 + 40);
  }
  *v27 = 0;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v30 = *(_QWORD *)(a1 + 24);
    v29 = *(double *)(a1 + 32);
    v31 = *(_QWORD *)(a1 + 16);
    v33 = 134218754;
    v34 = v29;
    v35 = 2048;
    v36 = v31;
    v37 = 2048;
    v38 = v30;
    v39 = 2080;
    v40 = "NO";
    _os_log_impl(&dword_2230E5000, v28, OS_LOG_TYPE_DEFAULT, "Filter state after meas without VIO: timestamp %3.2f s, range %3.2f m, uncertainty %3.2f m, with VIO: %s", (uint8_t *)&v33, 0x2Au);
  }
  v32 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)a5 = *(_OWORD *)v27;
  *(_OWORD *)(a5 + 16) = v32;
  *(double *)(a5 + 8) = fmax(*(double *)(a5 + 8), 0.0);
}

void cnmatrix::CNMatrix<3u,1u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<3u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[3];

  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

{
  OUTLINED_FUNCTION_1("TransposeDataFootprint", "cnmatrix.h", a3, "scratch != nullptr");
}

{
  OUTLINED_FUNCTION_0("TransposeDataFootprint", "cnmatrix.h", a3, "lead_dim > 0");
}

void cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(uint64_t a1, char *a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v5;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v3 = *(_DWORD *)(a1 + 8);
  if (v3 >= 2)
  {
    v5 = *(_DWORD *)(a1 + 12);
    if (v5 >= 2)
    {
      if (!a2)
        cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, 0, a3);
      v7 = v5 + v3 - *(_DWORD *)(a1 + 20);
      if (v7 <= 0)
        cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, (uint64_t)a2, a3);
      bzero(a2, *(unsigned int *)(a1 + 16));
      v8 = *(_DWORD *)(a1 + 16);
      if (v8 >= 3)
      {
        v9 = (v8 - 1);
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 1;
        do
        {
          v12 = &a2[v11];
          if (!a2[v11])
          {
            v13 = *(_QWORD *)(v10 + 8 * v11);
            v14 = v11;
            do
            {
              v14 = v14 * v7 % (int)v9;
              v15 = *(_QWORD *)(v10 + 8 * v14);
              *(_QWORD *)(v10 + 8 * v14) = v13;
              *v12 = 1;
              v12 = &a2[v14];
              v13 = v15;
            }
            while (!*v12);
          }
          ++v11;
        }
        while (v11 != v9);
      }
    }
  }
}

_DWORD *cnmatrix::FastResize<double>(_DWORD *result, int a2, int a3)
{
  if (a2 < 0)
    cnmatrix::FastResize<double>();
  if (result[6] < a2)
    cnmatrix::FastResize<double>();
  if (a3 < 0)
    cnmatrix::FastResize<double>();
  if (result[7] < a3)
    cnmatrix::FastResize<double>();
  result[2] = a2;
  result[3] = a3;
  result[4] = a3 * a2;
  result[5] = a2;
  return result;
}

uint64_t cnmatrix::CNMatrixBase<double>::WriteValue(uint64_t result, double a2)
{
  int64x2_t *v2;
  uint64_t v3;
  int64x2_t *v4;
  uint64_t v5;
  int64x2_t v6;

  v2 = *(int64x2_t **)(result + 32);
  if (!v2)
    cnmatrix::CNMatrixBase<double>::WriteValue();
  v3 = *(unsigned int *)(result + 16);
  if ((int)v3 > 3)
  {
    v4 = (int64x2_t *)((char *)v2 + 8 * (v3 - 2));
    v5 = (v3 - 1) >> 1;
    v6 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
    do
    {
      *v2++ = v6;
      --v5;
    }
    while (v5);
    *v4 = v6;
  }
  else if ((int)v3 >= 1)
  {
    do
    {
      *(double *)v2->i64 = a2;
      v2 = (int64x2_t *)((char *)v2 + 8);
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t cnmatrix::CNMatrixBase<double>::operator()(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    cnmatrix::CNMatrixBase<double>::operator()();
  if ((a2 & 0x80000000) != 0)
    cnmatrix::CNMatrixBase<double>::operator()();
  if (*(_DWORD *)(a1 + 16) <= (signed int)a2)
    cnmatrix::CNMatrixBase<double>::operator()();
  return v2 + 8 * a2;
}

void cnmatrix::CNMatrix<4u,1u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<4u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<4u,1u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[4];

  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

void cnmatrix::Multiply<double>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t __ldb;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const double *v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  double v16;
  uint64_t v17;
  double *v18;
  double *v19;
  double v20;

  __ldb = *(unsigned int *)(a1 + 12);
  if ((_DWORD)__ldb != *(_DWORD *)(a2 + 8))
    cnmatrix::Multiply<double>();
  if (a1 == a3)
    cnmatrix::Multiply<double>();
  if (a2 == a3)
    cnmatrix::Multiply<double>();
  v7 = *(unsigned int *)(a1 + 8);
  v8 = *(unsigned int *)(a2 + 12);
  cnmatrix::FastResize<double>((_DWORD *)a3, *(_DWORD *)(a1 + 8), *(_DWORD *)(a2 + 12));
  if (__ldb <= v8)
    v9 = v8;
  else
    v9 = __ldb;
  if (v9 <= v7)
    v9 = v7;
  v10 = *(const double **)(a1 + 32);
  if (v9 > 5)
  {
    cblas_dgemm(CblasColMajor, CblasNoTrans, CblasNoTrans, v7, v8, __ldb, 1.0, v10, v7, *(const double **)(a2 + 32), __ldb, 0.0, *(double **)(a3 + 32), *(_DWORD *)(a3 + 8));
  }
  else if ((_DWORD)v8)
  {
    v11 = 0;
    v12 = *(double **)(a2 + 32);
    v13 = *(_QWORD *)(a3 + 32);
    do
    {
      if ((_DWORD)v7)
      {
        v14 = 0;
        v15 = (double *)v10;
        do
        {
          v16 = 0.0;
          if ((_DWORD)__ldb)
          {
            v17 = __ldb;
            v18 = v12;
            v19 = v15;
            do
            {
              v20 = *v18++;
              v16 = v16 + *v19 * v20;
              v19 += v7;
              --v17;
            }
            while (v17);
          }
          *(double *)(v13 + 8 * (v11 * v7 + v14++)) = v16;
          ++v15;
        }
        while (v14 != v7);
      }
      ++v11;
      v12 += __ldb;
    }
    while (v11 != v8);
  }
}

float64x2_t cnmatrix::Add<double>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;
  int v7;
  float64x2_t result;
  uint64_t v9;
  double *v10;
  double *v11;
  float64_t *v12;
  double v13;
  double v14;
  double v15;
  float64x2_t *v16;
  float64x2_t *v17;
  float64x2_t *v18;
  float64x2_t *v19;
  float64x2_t *v20;
  float64x2_t *v21;
  uint64_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;

  v4 = *(_DWORD *)(a1 + 8);
  if (v4 != *(_DWORD *)(a2 + 8))
    cnmatrix::Add<double>();
  v7 = *(_DWORD *)(a1 + 12);
  if (v7 != *(_DWORD *)(a2 + 12))
    cnmatrix::Add<double>();
  if (a1 == a3)
    cnmatrix::Add<double>();
  if (a2 == a3)
    cnmatrix::Add<double>();
  cnmatrix::FastResize<double>((_DWORD *)a3, v4, v7);
  v9 = *(unsigned int *)(a3 + 16);
  if ((int)v9 > 3)
  {
    v16 = *(float64x2_t **)(a1 + 32);
    v17 = *(float64x2_t **)(a2 + 32);
    v18 = (float64x2_t *)((char *)v16 + 8 * (v9 - 2));
    v19 = *(float64x2_t **)(a3 + 32);
    v20 = (float64x2_t *)((char *)v17 + 8 * (v9 - 2));
    v21 = (float64x2_t *)((char *)v19 + 8 * (v9 - 2));
    v22 = (v9 - 1) >> 1;
    do
    {
      v23 = *v16++;
      v24 = v23;
      v25 = *v17++;
      *v19++ = vaddq_f64(v24, v25);
      --v22;
    }
    while (v22);
    result = vaddq_f64(*v18, *v20);
    *v21 = result;
  }
  else if ((int)v9 >= 1)
  {
    v10 = *(double **)(a1 + 32);
    v11 = *(double **)(a2 + 32);
    v12 = *(float64_t **)(a3 + 32);
    do
    {
      v13 = *v10++;
      v14 = v13;
      v15 = *v11++;
      result.f64[0] = v14 + v15;
      *v12++ = result.f64[0];
      --v9;
    }
    while (v9);
  }
  return result;
}

__n128 cnmatrix::CNMatrixBase<double>::operator=(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  __n128 result;
  _OWORD *v10;
  __int128 *v11;
  __n128 *v12;
  __n128 *v13;
  uint64_t v14;
  __int128 v15;

  if (a1 != a2)
  {
    v2 = *(_DWORD *)(a2 + 8);
    if (*(_DWORD *)(a1 + 24) < v2)
      cnmatrix::CNMatrixBase<double>::operator=();
    v3 = *(_DWORD *)(a2 + 12);
    if (*(_DWORD *)(a1 + 28) < v3)
      cnmatrix::CNMatrixBase<double>::operator=();
    *(_DWORD *)(a1 + 8) = v2;
    *(_DWORD *)(a1 + 12) = v3;
    v4 = v3 * v2;
    *(_DWORD *)(a1 + 16) = v4;
    *(_DWORD *)(a1 + 20) = v2;
    v5 = *(_DWORD *)(a2 + 16);
    if (v5 > 3)
    {
      v10 = *(_OWORD **)(a1 + 32);
      v11 = *(__int128 **)(a2 + 32);
      v12 = (__n128 *)((char *)v10 + 8 * (v5 - 2));
      v13 = (__n128 *)((char *)v11 + 8 * (v5 - 2));
      v14 = (v5 - 1) >> 1;
      do
      {
        v15 = *v11++;
        *v10++ = v15;
        --v14;
      }
      while (v14);
      result = *v13;
      *v12 = *v13;
    }
    else if ((int)v4 >= 1)
    {
      v6 = *(unint64_t **)(a2 + 32);
      v7 = *(unint64_t **)(a1 + 32);
      do
      {
        v8 = *v6++;
        result.n128_u64[0] = v8;
        *v7++ = v8;
        --v4;
      }
      while (v4);
    }
  }
  return result;
}

float64x2_t cnmatrix::Subtract<double>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;
  int v7;
  float64x2_t result;
  uint64_t v9;
  double *v10;
  double *v11;
  float64_t *v12;
  double v13;
  double v14;
  double v15;
  float64x2_t *v16;
  float64x2_t *v17;
  float64x2_t *v18;
  float64x2_t *v19;
  float64x2_t *v20;
  float64x2_t *v21;
  uint64_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;

  v4 = *(_DWORD *)(a1 + 8);
  if (v4 != *(_DWORD *)(a2 + 8))
    cnmatrix::Subtract<double>();
  v7 = *(_DWORD *)(a1 + 12);
  if (v7 != *(_DWORD *)(a2 + 12))
    cnmatrix::Subtract<double>();
  if (a1 == a3)
    cnmatrix::Subtract<double>();
  if (a2 == a3)
    cnmatrix::Subtract<double>();
  cnmatrix::FastResize<double>((_DWORD *)a3, v4, v7);
  v9 = *(unsigned int *)(a3 + 16);
  if ((int)v9 > 3)
  {
    v16 = *(float64x2_t **)(a1 + 32);
    v17 = *(float64x2_t **)(a2 + 32);
    v18 = (float64x2_t *)((char *)v16 + 8 * (v9 - 2));
    v19 = *(float64x2_t **)(a3 + 32);
    v20 = (float64x2_t *)((char *)v17 + 8 * (v9 - 2));
    v21 = (float64x2_t *)((char *)v19 + 8 * (v9 - 2));
    v22 = (v9 - 1) >> 1;
    do
    {
      v23 = *v16++;
      v24 = v23;
      v25 = *v17++;
      *v19++ = vsubq_f64(v24, v25);
      --v22;
    }
    while (v22);
    result = vsubq_f64(*v18, *v20);
    *v21 = result;
  }
  else if ((int)v9 >= 1)
  {
    v10 = *(double **)(a1 + 32);
    v11 = *(double **)(a2 + 32);
    v12 = *(float64_t **)(a3 + 32);
    do
    {
      v13 = *v10++;
      v14 = v13;
      v15 = *v11++;
      result.f64[0] = v14 - v15;
      *v12++ = result.f64[0];
      --v9;
    }
    while (v9);
  }
  return result;
}

void cnmatrix::Norm<double>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *__s1)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  double *v14;
  double v15;
  double *v16;
  uint64_t v17;
  double v18;
  long double v19;
  double *v20;
  double v21;
  double *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  int v28;
  double v29;
  uint64_t v30;
  unsigned int v31;
  double v32;
  double *v33;
  uint64_t v34;
  double v35;
  double v36;
  double *v37;
  double v38;
  double *v39;
  uint64_t v40;
  double v41;
  double *v42;
  double *v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  double *v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  double *v52;
  double *v53;
  double v54;
  double *v55;
  uint64_t v56;
  double v57;
  double v58;
  double *v59;
  double v60;
  double *v61;
  uint64_t v62;
  double v63;
  double v64;
  double *v65;
  long double v66;
  double *v67;
  uint64_t v68;
  double v69;
  double v70;
  double *v71;
  uint64_t v72;
  double v73;
  double v74;
  long double v75;

  if (a1 == a2)
    cnmatrix::Norm<double>();
  if (a1 == a3)
    cnmatrix::Norm<double>();
  if (a1 == a4)
    cnmatrix::Norm<double>();
  if (a2 == a3)
    cnmatrix::Norm<double>();
  if (a2 == a4)
    cnmatrix::Norm<double>();
  if (a3 == a4)
    cnmatrix::Norm<double>();
  v9 = *(unsigned int *)(a1 + 16);
  if (*(_DWORD *)(a2 + 16) < (int)v9)
    cnmatrix::Norm<double>();
  if ((_DWORD)v9)
  {
    v11 = *(unsigned int *)(a1 + 8);
    v12 = *(unsigned int *)(a1 + 12);
    v13 = strcmp(__s1, "2");
    if ((_DWORD)v11 == 1 || (_DWORD)v12 == 1)
    {
      if (v13)
      {
        if (!strcmp(__s1, "1"))
        {
          v37 = *(double **)(a1 + 32);
          v38 = fabs(*v37);
          if (v9 >= 2)
          {
            v39 = v37 + 1;
            v40 = v9 - 1;
            do
            {
              v41 = *v39++;
              v38 = v38 + fabs(v41);
              --v40;
            }
            while (v40);
          }
        }
        else if (!strcmp(__s1, "inf"))
        {
          v53 = *(double **)(a1 + 32);
          v54 = fabs(*v53);
          if (v9 >= 2)
          {
            v55 = v53 + 1;
            v56 = v9 - 1;
            do
            {
              v57 = *v55++;
              v58 = fabs(v57);
              if (v58 > v54)
                v54 = v58;
              --v56;
            }
            while (v56);
          }
        }
        else if (!strcmp(__s1, "-inf"))
        {
          v59 = *(double **)(a1 + 32);
          v60 = fabs(*v59);
          if (v9 >= 2)
          {
            v61 = v59 + 1;
            v62 = v9 - 1;
            do
            {
              v63 = *v61++;
              v64 = fabs(v63);
              if (v64 < v60)
                v60 = v64;
              --v62;
            }
            while (v62);
          }
        }
        else
        {
          v75 = 0.0;
          if (sscanf(__s1, "%lg", &v75) != 1)
            cnmatrix::Norm<double>();
          v19 = v75;
          if (fabs(v75) >= 2.22044605e-16)
          {
            v65 = *(double **)(a1 + 32);
            v66 = pow(fabs(*v65), v75);
            if (v9 >= 2)
            {
              v67 = v65 + 1;
              v68 = v9 - 1;
              do
              {
                v69 = *v67++;
                v66 = v66 + pow(fabs(v69), v19);
                --v68;
              }
              while (v68);
            }
            pow(v66, 1.0 / v19);
          }
        }
      }
      else
      {
        v20 = *(double **)(a1 + 32);
        v21 = *v20 * *v20;
        if (v9 >= 2)
        {
          v22 = v20 + 1;
          v23 = v9 - 1;
          do
          {
            v24 = *v22++;
            v21 = v21 + v24 * v24;
            --v23;
          }
          while (v23);
        }
      }
    }
    else if (v13)
    {
      if (!strcmp(__s1, "1"))
      {
        if ((_DWORD)v12)
        {
          v25 = 0;
          v26 = *(_QWORD *)(a1 + 32);
          v27 = *(double **)(a2 + 32);
          v28 = 1;
          do
          {
            v29 = fabs(*(double *)(v26 + 8 * (v11 * v25)));
            v27[v25] = v29;
            v30 = v11 - 1;
            v31 = v28;
            if (v11 >= 2)
            {
              do
              {
                v29 = v29 + fabs(*(double *)(v26 + 8 * v31));
                v27[v25] = v29;
                ++v31;
                --v30;
              }
              while (v30);
            }
            ++v25;
            v28 += v11;
          }
          while (v25 != v12);
          v32 = *v27;
          v33 = v27 + 1;
          v34 = v12 - 1;
          do
          {
            v35 = *v33++;
            v36 = v35;
            if (v35 > v32)
              v32 = v36;
            --v34;
          }
          while (v34);
        }
      }
      else if (!strcmp(__s1, "inf"))
      {
        if ((_DWORD)v11)
        {
          v42 = *(double **)(a1 + 32);
          v43 = *(double **)(a2 + 32);
          v44 = v11;
          do
          {
            v45 = *v42++;
            *v43++ = fabs(v45);
            --v44;
          }
          while (v44);
        }
        if (v12 <= 1)
        {
          v47 = *(double **)(a2 + 32);
        }
        else
        {
          v46 = *(_QWORD *)(a1 + 32);
          v47 = *(double **)(a2 + 32);
          v48 = 1;
          v49 = v11;
          do
          {
            v50 = v11;
            v51 = v49;
            v52 = v47;
            if ((_DWORD)v11)
            {
              do
              {
                *v52 = fabs(*(double *)(v46 + 8 * v51)) + *v52;
                ++v52;
                ++v51;
                --v50;
              }
              while (v50);
            }
            ++v48;
            v49 += v11;
          }
          while (v48 != (_DWORD)v12);
        }
        v70 = *v47;
        if (v11 >= 2)
        {
          v71 = v47 + 1;
          v72 = v11 - 1;
          do
          {
            v73 = *v71++;
            v74 = v73;
            if (v73 > v70)
              v70 = v74;
            --v72;
          }
          while (v72);
        }
      }
      else
      {
        if (strcmp(__s1, "fro"))
          cnmatrix::Norm<double>();
        v14 = *(double **)(a1 + 32);
        v15 = *v14 * *v14;
        if (v9 >= 2)
        {
          v16 = v14 + 1;
          v17 = v9 - 1;
          do
          {
            v18 = *v16++;
            v15 = v15 + v18 * v18;
            --v17;
          }
          while (v17);
        }
      }
    }
    else
    {
      cnmatrix::SingularValues<double>(a1, a2, a3, a4);
    }
  }
}

_QWORD *cnmatrix::CNMatrix<308u,1u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

void cnmatrix::CNMatrix<308u,1u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<308u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<308u,1u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[308];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

_DWORD *cnmatrix::SingularValues<double>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v11;
  __CLPK_integer v12;
  __CLPK_integer v13;
  __CLPK_doublereal *v14;
  __CLPK_doublereal *v15;
  __CLPK_doublereal *v16;
  uint64_t v17;
  __CLPK_integer v18;
  __CLPK_integer v20;
  __CLPK_integer __lwork;
  __CLPK_integer __ldvt;
  __CLPK_integer __ldu;
  __CLPK_integer __lda;
  __CLPK_integer __n;
  __CLPK_integer __m;
  char __jobvt;
  char __jobu;

  v6 = *(_DWORD *)(a1 + 8);
  v5 = *(_DWORD *)(a1 + 12);
  if (v5 <= v6)
    v7 = *(_DWORD *)(a1 + 8);
  else
    v7 = *(_DWORD *)(a1 + 12);
  if (v5 >= v6)
    v8 = *(_DWORD *)(a1 + 8);
  else
    v8 = *(_DWORD *)(a1 + 12);
  if (a1 == a2)
    cnmatrix::SingularValues<double>();
  if (a1 == a3)
    cnmatrix::SingularValues<double>();
  if (a1 == a4)
    cnmatrix::SingularValues<double>();
  if (a2 == a3)
    cnmatrix::SingularValues<double>();
  if (a2 == a4)
    cnmatrix::SingularValues<double>();
  if (a3 == a4)
    cnmatrix::SingularValues<double>();
  v11 = *(_DWORD *)(a3 + 28) * *(_DWORD *)(a3 + 24);
  if (!v11)
    cnmatrix::SingularValues<double>();
  if (v11 < 3 * v8 + v7)
    cnmatrix::SingularValues<double>();
  if (v11 < 5 * v8)
    cnmatrix::SingularValues<double>();
  if (*(_DWORD *)(a2 + 24) < v6)
    cnmatrix::SingularValues<double>();
  if (*(_DWORD *)(a2 + 28) < v5)
    cnmatrix::SingularValues<double>();
  if (*(_DWORD *)(a4 + 24) < v8)
    cnmatrix::SingularValues<double>();
  if (!*(_DWORD *)(a4 + 28))
    cnmatrix::SingularValues<double>();
  cnmatrix::CNMatrixBase<double>::operator=(a2, a1);
  v12 = *(_DWORD *)(a2 + 8);
  v13 = *(_DWORD *)(a2 + 12);
  v14 = *(__CLPK_doublereal **)(a2 + 32);
  v15 = *(__CLPK_doublereal **)(a4 + 32);
  v16 = *(__CLPK_doublereal **)(a3 + 32);
  __jobu = 78;
  __jobvt = 78;
  __n = v13;
  __m = v12;
  __lda = v12;
  __ldvt = 1;
  __ldu = 1;
  v20 = 0;
  __lwork = v11;
  v17 = dgesvd_(&__jobu, &__jobvt, &__m, &__n, v14, &__lda, v15, 0, &__ldu, 0, &__ldvt, v16, &__lwork, &v20);
  v18 = v20;
  if (v20)
  {
    LOWORD(__m) = 4;
    if (v20 < 0)
      LOBYTE(__n) = 5;
    else
      LOBYTE(__n) = 4;
    v17 = cnprint::CNPrinter::Print();
  }
  if (v11 < **(double **)(a3 + 32)
    && cnprint::CNPrinter::GetLogLevel((cnprint::CNPrinter *)v17) <= 1)
  {
    LOWORD(__m) = 4;
    LOBYTE(__n) = 1;
    cnprint::CNPrinter::Print();
  }
  if (v18)
    cnmatrix::SingularValues<double>();
  cnmatrix::FastResize<double>((_DWORD *)a3, *(_DWORD *)(a3 + 24), *(_DWORD *)(a3 + 28));
  return cnmatrix::FastResize<double>((_DWORD *)a4, v8, 1);
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 128, a4);
}

void OUTLINED_FUNCTION_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 122, a4);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return cnprint::CNPrinter::Print();
}

void sub_2230E9C84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2230E9CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2230E9D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2230E9F40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_2230EA308(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2230EA5D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2230EA678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EA738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2230EA7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EA83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2230EA8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2230EA91C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EAB14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_2230EB294(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2230EB820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_2230EB9D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2230EBD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_2230EBF00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2230EC020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2230EC0D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EC20C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EC330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2230EC43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EC4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EC56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EC6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2230EC79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EC8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_2230ECA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2230ECB8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2230ECE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_2230ECF04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
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
      *a1 = (double)v9 / 1000000000.0 + (double)v8 - *MEMORY[0x24BDBD238];
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
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), *v4);
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
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

void sub_2230ED474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
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

void sub_2230ED5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x2276831BC]();
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "length") > 0x8000)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: statedump too big (%d > %d)"), objc_msgSend(v6, "length"), 0x8000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1770];
    v15 = v3;
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataWithPropertyList:format:options:error:", v9, 200, 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  v11 = (char *)malloc_type_calloc(1uLL, objc_msgSend(v6, "length") + 200, 0x7E1CA1B2uLL);
  *(_DWORD *)v11 = 1;
  *((_DWORD *)v11 + 1) = objc_msgSend(v6, "length");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[nearbyd] %@"), v3);
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

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v8 = v3;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PRCommonSerializePrintableState(v3, v5);

  return v6;
}

void sub_2230ED800(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2230ED904(_Unwind_Exception *a1)
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

void sub_2230ED980(_Unwind_Exception *exception_object)
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
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24EC10DF0, MEMORY[0x24BEDAAF0]);
}

void sub_2230EDA2C(_Unwind_Exception *a1)
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

void sub_2230EDEE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_2230EE244(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2230EE53C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2230EEAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  void *v21;
  void *v22;
  void *v23;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2230EEC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_2230EED18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230EEFC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2230EF480(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2230EF658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2230EF7C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2230EF9A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2230EFC3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2230EFCF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2230EFDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2230EFECC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2230EFFCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2230F0230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  void *v21;

  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2230F0300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2230F03F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2230F04D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_2230F074C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2230F08C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2230F0B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v2;

  _Unwind_Resume(a1);
}

void sub_2230F0E34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2230F1344(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2230F1500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2230F15E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_2230F1800(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2230F1D40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2230F1E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230F242C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2230F2700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2230F27F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_2230F28C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2230F2AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;
  void *v11;

  a9.super_class = (Class)PRBTLocalizer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::default_delete<BTFinding::PRRSSIFilter>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  if (a2)
  {
    v3 = *(void **)(a2 + 88);
    if (v3)
    {
      *(_QWORD *)(a2 + 96) = v3;
      operator delete(v3);
    }
    v4 = *(void **)(a2 + 64);
    if (v4)
    {
      *(_QWORD *)(a2 + 72) = v4;
      operator delete(v4);
    }
    v5 = *(void **)(a2 + 40);
    if (v5)
    {
      *(_QWORD *)(a2 + 48) = v5;
      operator delete(v5);
    }

    JUMPOUT(0x227682F88);
  }
}

RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::PRRoseSyntheticApertureBatchFilter(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  char *v2;
  char *v3;
  unsigned int v4;
  NSObject *v5;
  uint8_t buf[8];
  __int128 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;

  *(_DWORD *)this = 0;
  *((_BYTE *)this + 4) = 0;
  *((_DWORD *)this + 2) = 0;
  *((_BYTE *)this + 12) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 14) = 0;
  *((_BYTE *)this + 60) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 26) = 0;
  *((_BYTE *)this + 108) = 0;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_QWORD *)((char *)this + 45) = 0;
  *((_OWORD *)this + 5) = 0u;
  *(_QWORD *)((char *)this + 93) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((_QWORD *)this + 20) = 0;
  *((_QWORD *)this + 21) = &off_24EC111A0;
  v2 = (char *)this + 168;
  *((_QWORD *)this + 24) = 0x100000003;
  *((_OWORD *)this + 11) = xmmword_223118D20;
  *((_QWORD *)this + 25) = (char *)this + 208;
  cnmatrix::FastResize<double>((_DWORD *)this + 42, 3, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)v2, 0.0);
  *((_QWORD *)this + 30) = &off_24EC11228;
  *((_QWORD *)this + 33) = 0x100000004;
  *(_OWORD *)((char *)this + 248) = xmmword_223118D40;
  *((_QWORD *)this + 34) = (char *)this + 280;
  cnmatrix::FastResize<double>((_DWORD *)this + 60, 4, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)this + 240, 0.0);
  *((_QWORD *)this + 42) = 0x300000003;
  *((_QWORD *)this + 39) = &off_24EC11458;
  *((_OWORD *)this + 20) = xmmword_223118FC0;
  *((_QWORD *)this + 43) = (char *)this + 352;
  *((_QWORD *)this + 53) = 0;
  *((_BYTE *)this + 440) = 0;
  *((_QWORD *)this + 60) = 0x100000003;
  *((_QWORD *)this + 57) = &off_24EC111A0;
  *((_OWORD *)this + 29) = xmmword_223118D20;
  *((_QWORD *)this + 61) = (char *)this + 496;
  *((_QWORD *)this + 68) = 0x100000003;
  *((_QWORD *)this + 65) = &off_24EC111A0;
  *((_OWORD *)this + 33) = xmmword_223118D20;
  *((_QWORD *)this + 69) = (char *)this + 560;
  *(_OWORD *)((char *)this + 584) = 0u;
  *(_OWORD *)((char *)this + 600) = 0u;
  *((_QWORD *)this + 77) = 0x3FF0000000000000;
  *((_QWORD *)this + 78) = 0;
  *((_QWORD *)this + 83) = 0;
  v3 = (char *)operator new(0x28uLL);
  *((_QWORD *)this + 79) = v3;
  *((_QWORD *)this + 80) = v3 + 40;
  *((_QWORD *)this + 82) = v3;
  *((_QWORD *)this + 81) = v3;
  *((_OWORD *)this + 42) = 0u;
  *((_OWORD *)this + 43) = 0u;
  *((_OWORD *)this + 44) = 0u;
  *((_OWORD *)this + 45) = 0u;
  *((_QWORD *)this + 92) = 0;
  v9 = 0x100000003;
  *(_QWORD *)buf = &off_24EC111A0;
  v8 = xmmword_223118D20;
  v10 = &v11;
  cnmatrix::FastResize<double>(buf, 3, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)buf, 0.0);
  *((_QWORD *)this + 93) = 0;
  *((_QWORD *)this + 94) = 0;
  *((_QWORD *)this + 95) = 0x7FF8000000000000;
  *((_QWORD *)this + 97) = 0;
  *((_QWORD *)this + 96) = 0;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)this + 784, (uint64_t)buf);
  v4 = 0;
  *((_DWORD *)this + 212) = 0;
  *((_QWORD *)this + 107) = 0;
  *((_QWORD *)this + 108) = &off_24EC111A0;
  *((_QWORD *)this + 111) = 0x100000003;
  *(_OWORD *)((char *)this + 872) = xmmword_223118D20;
  *((_QWORD *)this + 112) = (char *)this + 904;
  *((_DWORD *)this + 232) = 0x1000000;
  *((_WORD *)this + 466) = 1;
  *((_BYTE *)this + 934) = 0;
  *((_DWORD *)this + 234) = 0;
  *((_WORD *)this + 470) = 0;
  *((_QWORD *)this + 118) = 0x1000000032;
  *((_QWORD *)this + 119) = 0x3F847AE147AE147BLL;
  *((_OWORD *)this + 60) = xmmword_223118FD0;
  *((_OWORD *)this + 61) = xmmword_223118FE0;
  do
  {
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)this + 456, v4) = 0;
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)this + 520, v4++) = 0;
  }
  while (v4 != 3);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::reserve((uint64_t *)this + 84, 4uLL);
  v5 = os_log_create("com.apple.proximity", "3DBatchFilter");
  *((_QWORD *)this + 56) = v5;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2230E5000, v5, OS_LOG_TYPE_DEFAULT, "PRRoseSyntheticApertureBatchFilter constructed", buf, 2u);
  }
  return this;
}

void sub_2230F3168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, void **a10, uint64_t a11, uint64_t a12, void **a13)
{
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void **v16;
  void *v18;
  void *v19;
  void *v20;

  *(_QWORD *)(v13 + 864) = off_24EC111F8;
  *(_QWORD *)(v13 + 784) = off_24EC111F8;
  a13 = (void **)(v13 + 720);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a13);
  a13 = (void **)(v13 + 696);
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100](&a13);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a13);
  boost::circular_buffer<double,std::allocator<double>>::destroy(v13 + 632);
  *(_QWORD *)(v13 + 520) = off_24EC111F8;
  *(_QWORD *)(v13 + 456) = off_24EC111F8;
  *(_QWORD *)(v13 + 312) = off_24EC111F8;
  *v15 = off_24EC111F8;
  *v14 = off_24EC111F8;
  std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__destroy_vector::operator()[abi:ne180100](&a13);
  v18 = *v16;
  if (*v16)
  {
    *(_QWORD *)(v13 + 120) = v18;
    operator delete(v18);
  }
  v19 = *a9;
  if (*a9)
  {
    *(_QWORD *)(v13 + 72) = v19;
    operator delete(v19);
  }
  v20 = *a10;
  if (*a10)
  {
    *(_QWORD *)(v13 + 24) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(a1);
}

void std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void *__p;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - *a1) >> 4) < a2)
  {
    if (a2 >= 0x24924924924924ALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v13 = v3;
    __p = std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v3, a2);
    v10 = (char *)__p + v5;
    v11 = (char *)__p + v5;
    v12 = (char *)__p + 112 * v6;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
    v7 = v10;
    v8 = v11;
    if (v11 != v10)
    {
      do
      {
        *((_QWORD *)v8 - 9) = off_24EC111F8;
        v8 -= 112;
      }
      while (v8 != v7);
      v11 = v7;
    }
    if (__p)
      operator delete(__p);
  }
}

_QWORD *cnmatrix::CNMatrix<3u,3u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getCurrentRotatedSolution(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, uint64_t a2@<X8>)
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v6;
  uint64_t (**v7)();
  __int128 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (**v12)();
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;

  v3 = *((_DWORD *)this + 81);
  v4 = *((_DWORD *)this + 80);
  v17 = 0x300000003;
  v12 = &off_24EC11458;
  if (v3 > 3)
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getCurrentRotatedSolution(422, "this->max_num_rows_ >= num_rows");
  if (v4 >= 4)
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getCurrentRotatedSolution(423, "this->max_num_cols_ >= num_cols");
  v13 = v3;
  v14 = v4;
  v15 = v4 * v3;
  v16 = v3;
  v18 = &v19;
  cnmatrix::Transpose<double>((uint64_t)this + 312, &v12);
  v6 = *((_QWORD *)this + 18);
  v9 = 0x100000003;
  v7 = &off_24EC111A0;
  v8 = xmmword_223118D20;
  v10 = &v11;
  cnmatrix::Subtract<double>(v6, (uint64_t)this + 168, (uint64_t)&v7);
  *(_QWORD *)(a2 + 24) = 0x100000003;
  *(_QWORD *)a2 = &off_24EC111A0;
  *(_OWORD *)(a2 + 8) = xmmword_223118D20;
  *(_QWORD *)(a2 + 32) = a2 + 40;
  cnmatrix::Multiply<double>((uint64_t)&v12, (uint64_t)&v7, a2);
}

void sub_2230F3490(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getCurrentRotatedCovariance(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, uint64_t a2@<X8>)
{
  unsigned int v3;
  unsigned int v4;
  _BYTE v6[112];
  uint64_t (**v7)();
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  v3 = *((_DWORD *)this + 81);
  v4 = *((_DWORD *)this + 80);
  v12 = 0x300000003;
  v7 = &off_24EC11458;
  if (v3 > 3)
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getCurrentRotatedSolution(422, "this->max_num_rows_ >= num_rows");
  if (v4 >= 4)
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getCurrentRotatedSolution(423, "this->max_num_cols_ >= num_cols");
  v8 = v3;
  v9 = v4;
  v10 = v4 * v3;
  v11 = v3;
  v13 = &v14;
  cnmatrix::Transpose<double>((uint64_t)this + 312, &v7);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v6, *((_QWORD *)this + 18) + 128);
  *(_QWORD *)(a2 + 24) = 0x300000003;
  *(_QWORD *)a2 = &off_24EC11458;
  *(_OWORD *)(a2 + 8) = xmmword_223118FC0;
  *(_QWORD *)(a2 + 32) = a2 + 40;
  cnmatrix::Multiply<double>((uint64_t)&v7, (uint64_t)v6, a2);
}

void sub_2230F3580(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

double RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getBatchOrAoASolution@<D0>(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, _QWORD *a2@<X8>)
{
  double *v4;
  double result;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 934) || *((_BYTE *)this + 933))
    goto LABEL_3;
  if (*((_BYTE *)this + 928))
  {
    v6 = *((_QWORD *)this + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *((_QWORD *)this + 76);
      v10 = 134217984;
      v11 = v7;
      _os_log_impl(&dword_2230E5000, v6, OS_LOG_TYPE_DEFAULT, "Returning solution from AoA at %f s", (uint8_t *)&v10, 0xCu);
    }
    *a2 = *((_QWORD *)this + 6);
    *(_QWORD *)((char *)a2 + 5) = *(_QWORD *)((char *)this + 53);
    a2[3] = 0;
    a2[4] = 0;
    a2[2] = 0;
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(a2 + 2, *((const void **)this + 8), *((_QWORD *)this + 9), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)this + 9) - *((_QWORD *)this + 8)) >> 3));
    v4 = (double *)((char *)this + 88);
  }
  else
  {
    if (!*((_BYTE *)this + 929))
    {
LABEL_3:
      *a2 = *(_QWORD *)this;
      *(_QWORD *)((char *)a2 + 5) = *(_QWORD *)((char *)this + 5);
      a2[3] = 0;
      a2[4] = 0;
      a2[2] = 0;
      std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(a2 + 2, *((const void **)this + 2), *((_QWORD *)this + 3), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)this + 3) - *((_QWORD *)this + 2)) >> 3));
      v4 = (double *)((char *)this + 40);
      goto LABEL_4;
    }
    v8 = *((_QWORD *)this + 56);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *((_QWORD *)this + 107);
      v10 = 134217984;
      v11 = v9;
      _os_log_impl(&dword_2230E5000, v8, OS_LOG_TYPE_DEFAULT, "Returning solution from straight path estimator at %f s", (uint8_t *)&v10, 0xCu);
    }
    *a2 = *((_QWORD *)this + 12);
    *(_QWORD *)((char *)a2 + 5) = *(_QWORD *)((char *)this + 101);
    a2[3] = 0;
    a2[4] = 0;
    a2[2] = 0;
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(a2 + 2, *((const void **)this + 14), *((_QWORD *)this + 15), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)this + 15) - *((_QWORD *)this + 14)) >> 3));
    v4 = (double *)((char *)this + 136);
  }
LABEL_4:
  result = *v4;
  a2[5] = *(_QWORD *)v4;
  return result;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::updateCurrentBatchSolution(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, double a2@<D0>, double a3@<D1>, _QWORD *a4@<X8>)
{
  int v7;
  NSObject *v8;
  double v9;
  NSObject *v10;
  int v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *((double *)this + 29) = a3;
  if (a2 - *((double *)this + 74) <= 10.0 || *((_QWORD *)this + 85) == *((_QWORD *)this + 84))
  {
    if (*((_BYTE *)this + 933))
    {
      *((_BYTE *)this + 12) = 0;
      v7 = *((_DWORD *)this + 2);
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkVerticalAmbiguityResolution(this);
      if (v7 != *((_DWORD *)this + 2))
      {
        v8 = *((_QWORD *)this + 56);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_2230E5000, v8, OS_LOG_TYPE_DEFAULT, "Vertical state changed with the pose update", (uint8_t *)&v11, 2u);
        }
        *((_BYTE *)this + 12) = 1;
      }
    }
  }
  else
  {
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::reinitFilter(this);
    *(_DWORD *)this = 0;
    *((_BYTE *)this + 4) = 0;
    *((_DWORD *)this + 2) = 0;
    *((_BYTE *)this + 12) = 0;
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>((char *)this + 16, 0, 0, 0);
    *((_QWORD *)this + 5) = 0;
  }
  if (*((_BYTE *)this + 928))
  {
    v9 = *((double *)this + 76);
    if (a2 - v9 > 10.0)
    {
      *((_BYTE *)this + 928) = 0;
      v10 = *((_QWORD *)this + 56);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 134218240;
        v12 = v9;
        v13 = 2048;
        v14 = a2;
        _os_log_impl(&dword_2230E5000, v10, OS_LOG_TYPE_DEFAULT, "AoA Solution from AoA at %f s is no longer valid - current time is %f s", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getBatchOrAoASolution(this, a4);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::reinitFilter(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t j;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  __int16 v18[8];

  v2 = *((_QWORD *)this + 85);
  for (i = *((_QWORD *)this + 84); v2 != i; v2 -= 112)
    *(_QWORD *)(v2 - 72) = off_24EC111F8;
  *((_QWORD *)this + 85) = i;
  v4 = *((_QWORD *)this + 88);
  for (j = *((_QWORD *)this + 87); v4 != j; v4 -= 208)
  {
    *(_QWORD *)(v4 - 112) = off_24EC111F8;
    *(_QWORD *)(v4 - 176) = off_24EC111F8;
  }
  *((_QWORD *)this + 88) = j;
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::resetFilter(this);
  v6 = (void *)*((_QWORD *)this + 2);
  *(_QWORD *)((char *)this + 5) = 0;
  *(_QWORD *)this = 0;
  if (v6)
  {
    *((_QWORD *)this + 3) = v6;
    operator delete(v6);
  }
  v7 = 0uLL;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  v8 = (void *)*((_QWORD *)this + 8);
  *((_QWORD *)this + 6) = 0;
  *(_QWORD *)((char *)this + 53) = 0;
  if (v8)
  {
    *((_QWORD *)this + 9) = v8;
    operator delete(v8);
    v7 = 0uLL;
  }
  *((_OWORD *)this + 4) = v7;
  *((_OWORD *)this + 5) = v7;
  v9 = (void *)*((_QWORD *)this + 14);
  *((_QWORD *)this + 12) = 0;
  *(_QWORD *)((char *)this + 101) = 0;
  if (v9)
  {
    *((_QWORD *)this + 15) = v9;
    operator delete(v9);
  }
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_QWORD *)this + 29) = 0;
  *(_OWORD *)((char *)this + 584) = 0u;
  *(_OWORD *)((char *)this + 600) = 0u;
  *((_QWORD *)this + 77) = 0x3FF0000000000000;
  v10 = (_QWORD *)*((_QWORD *)this + 18);
  v11 = (_QWORD *)*((_QWORD *)this + 19);
  if (v11 != v10)
  {
    v12 = v11 - 24;
    do
    {
      v12[16] = off_24EC111F8;
      *v12 = off_24EC111F8;
      *(v12 - 14) = off_24EC111F8;
      *(v12 - 22) = off_24EC111F8;
      *(v12 - 30) = off_24EC111F8;
      v13 = v12 - 30 == v10;
      v12 -= 54;
    }
    while (!v13);
  }
  *((_QWORD *)this + 19) = v10;
  v14 = *((_QWORD *)this + 81);
  v15 = *((_QWORD *)this + 83);
  v16 = *((_QWORD *)this + 80);
  if (v15 >= (v16 - v14) >> 3)
    v15 -= (v16 - *((_QWORD *)this + 79)) >> 3;
  *((_QWORD *)this + 81) = v14 + 8 * v15;
  *((_QWORD *)this + 83) = 0;
  *((_WORD *)this + 464) = 0;
  *((_QWORD *)this + 107) = 0;
  *((_BYTE *)this + 440) = 0;
  v17 = *((_QWORD *)this + 56);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 0;
    _os_log_impl(&dword_2230E5000, v17, OS_LOG_TYPE_DEFAULT, "Batch filter is reinitialized", (uint8_t *)v18, 2u);
  }
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkVerticalAmbiguityResolution(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double *v24;
  double *v25;
  double *v26;
  int64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  double *v32;
  uint64_t v33;
  double *v34;
  double *v35;
  double *v36;
  uint64_t (**v37)();
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void *__p;
  double *v43;
  unint64_t v44;
  uint64_t (**v45)();
  __int128 v46;
  uint64_t v47;
  _BYTE *v48;
  _BYTE v49[40];

  *((_DWORD *)this + 234) = 0;
  *((_BYTE *)this + 940) = 0;
  if (*((_BYTE *)this + 933))
  {
    v2 = *((_QWORD *)this + 18);
    v47 = 0x100000003;
    v45 = &off_24EC111A0;
    v46 = xmmword_223118D20;
    v48 = v49;
    cnmatrix::Subtract<double>(v2, (uint64_t)this + 168, (uint64_t)&v45);
    v3 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v45, 0);
    v4 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v45, 0);
    v5 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v45, 2u);
    if (sqrt(v5 * cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v45, 2u) + v3 * v4) <= 2.0)
    {
      v6 = *((_QWORD *)this + 18);
      v7 = *((_QWORD *)this + 19);
      if (v6 == v7)
      {
LABEL_15:
        *((_DWORD *)this + 234) = 1;
      }
      else
      {
        while (1)
        {
          v8 = cnmatrix::CNMatrixBase<double>::operator()(v6 + 128, 1, 1);
          v9 = cnmatrix::CNMatrixBase<double>::operator()(v6, 1u);
          v10 = sqrt(v8);
          v11 = v9 - *((double *)this + 29);
          v12 = v10 + v11;
          v13 = v11 - v10;
          if (v13 <= -2.5 && v12 >= -2.5)
            break;
          if (v13 <= 2.5 && v12 >= 2.5)
            break;
          v6 += 432;
          if (v6 == v7)
            goto LABEL_15;
        }
      }
    }
    v16 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)this + 85) - *((_QWORD *)this + 84)) >> 4);
    __p = 0;
    v43 = 0;
    v44 = 0;
    std::vector<double>::reserve(&__p, v16);
    v17 = *((_QWORD *)this + 84);
    v18 = *((_QWORD *)this + 85);
    if (v17 != v18)
    {
      v19 = *((_QWORD *)this + 18);
      do
      {
        v39 = 0x100000003;
        v37 = &off_24EC111A0;
        v38 = xmmword_223118D20;
        v40 = &v41;
        cnmatrix::Subtract<double>(v19, v17 + 40, (uint64_t)&v37);
        v20 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v37, 0);
        v21 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v37, 2u);
        if (sqrt(v21 * v21 + v20 * v20) <= 1.0)
        {
          v22 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v37, 1u);
          v23 = v22;
          v24 = v43;
          if ((unint64_t)v43 >= v44)
          {
            v26 = (double *)__p;
            v27 = ((char *)v43 - (_BYTE *)__p) >> 3;
            v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 61)
              std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
            v29 = v44 - (_QWORD)__p;
            if ((uint64_t)(v44 - (_QWORD)__p) >> 2 > v28)
              v28 = v29 >> 2;
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
              v30 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v30 = v28;
            if (v30)
            {
              v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v44, v30);
              v26 = (double *)__p;
              v24 = v43;
            }
            else
            {
              v31 = 0;
            }
            v32 = (double *)&v31[8 * v27];
            *v32 = v23;
            v25 = v32 + 1;
            while (v24 != v26)
            {
              v33 = *((_QWORD *)v24-- - 1);
              *((_QWORD *)v32-- - 1) = v33;
            }
            __p = v32;
            v43 = v25;
            v44 = (unint64_t)&v31[8 * v30];
            if (v26)
              operator delete(v26);
          }
          else
          {
            *v43 = v22;
            v25 = v24 + 1;
          }
          v43 = v25;
        }
        v17 += 112;
      }
      while (v17 != v18);
    }
    v34 = (double *)__p;
    if (__p != v43)
    {
      v49[31] = 0;
      v35 = std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<double *>,std::__wrap_iter<double *>,std::__identity,std::__less<void,void>>((double *)__p, v43);
      if (*v36 - *v35 >= 0.5)
      {
        *((_DWORD *)this + 234) = 2;
        *((_BYTE *)this + 940) = 1;
      }
      v34 = (double *)__p;
    }
    if (v34)
    {
      v43 = v34;
      operator delete(v34);
    }
  }
}

void sub_2230F3E30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(uint64_t **a1@<X1>, uint64_t *a2@<X8>)
{
  __int128 *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  __int128 *v9;
  uint64_t *v10;
  BOOL v11;
  _QWORD *v12;
  BOOL v13;
  double v14;
  double v15;
  __int128 *v16;
  uint64_t *v17;
  uint64_t *v18;
  __int128 *v19;
  uint64_t *v20;
  BOOL v21;
  _QWORD *v22;
  BOOL v23;
  double v24;
  __int128 *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  __int128 *v29;
  uint64_t *v30;
  BOOL v31;
  _QWORD *v32;
  BOOL v33;
  double v34;
  double v35;
  uint64_t v36;
  float v37;
  unsigned int v38;
  float v39;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  float v44;
  unsigned int v45;
  float v46;
  unsigned int v47;
  _QWORD *v48;
  _QWORD **v49;
  _QWORD *v50;
  _QWORD **v51;
  unsigned int v52;
  uint64_t *v53;
  unint64_t v54;
  unsigned int v55;
  uint64_t *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t *v60;
  uint64_t *v61;
  BOOL v62;
  uint64_t *v63;
  _QWORD *v64[2];
  __int128 *v65;
  __int128 *v66;
  unint64_t v67;

  v5 = *a1;
  v4 = (__int128 *)a1[1];
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  v63 = v5;
  v64[0] = v5;
  v6 = (char *)v4 - (char *)v5;
  if (v4 == (__int128 *)v5)
  {
    v5 = (uint64_t *)v4;
    v7 = (uint64_t *)v4;
    goto LABEL_27;
  }
  v7 = v5 + 14;
  v66 = (__int128 *)(v5 + 14);
  if (v5 + 14 == (uint64_t *)v4)
  {
    v7 = v5;
    goto LABEL_27;
  }
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
  {
    v63 = v5 + 14;
    v8 = v5;
  }
  else
  {
    v64[0] = v5 + 14;
    v8 = v5 + 14;
    v7 = v5;
  }
  v9 = (__int128 *)(v5 + 28);
  if (v5 + 28 == (uint64_t *)v4)
    goto LABEL_26;
  v10 = v5 + 42;
  while (1)
  {
    v65 = (__int128 *)(v10 - 14);
    v66 = v9 + 7;
    if (v9 + 7 == v4)
      break;
    if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v65))
    {
      if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
      {
        v63 = v10;
        v7 = v10;
      }
      v11 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64);
      v12 = v9;
      if (v11)
        goto LABEL_20;
    }
    else
    {
      if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
      {
        v63 = v10 - 14;
        v7 = v10 - 14;
      }
      v13 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)v64);
      v12 = v10;
      if (v13)
        goto LABEL_20;
    }
    v64[0] = v12;
    v8 = v12;
LABEL_20:
    v9 += 14;
    v66 = v9;
    v10 += 28;
    if (v9 == v4)
      goto LABEL_26;
  }
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
  {
    v7 = v10 - 14;
  }
  else if (!std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64))
  {
    v8 = v10 - 14;
  }
LABEL_26:
  v5 = v8;
LABEL_27:
  v14 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v7 + 5), 0);
  v15 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v5 + 5), 0);
  v17 = *a1;
  v16 = (__int128 *)a1[1];
  v63 = v17;
  v64[0] = v17;
  if (v17 == (uint64_t *)v16)
    goto LABEL_46;
  v18 = v17 + 14;
  v66 = (__int128 *)(v17 + 14);
  if (v17 + 14 == (uint64_t *)v16)
    goto LABEL_46;
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
  {
    v63 = v17 + 14;
  }
  else
  {
    v64[0] = v17 + 14;
    v18 = v17;
  }
  v19 = (__int128 *)(v17 + 28);
  if (v17 + 28 == (uint64_t *)v16)
  {
LABEL_45:
    v17 = v18;
    goto LABEL_46;
  }
  v20 = v17 + 42;
  while (2)
  {
    v17 = v20 - 14;
    v65 = (__int128 *)(v20 - 14);
    v66 = v19 + 7;
    if (v19 + 7 != v16)
    {
      if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v65))
      {
        if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
        {
          v63 = v20;
          v18 = v20;
        }
        v21 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64);
        v22 = v19;
        if (v21)
          goto LABEL_44;
      }
      else
      {
        if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
        {
          v63 = v20 - 14;
          v18 = v20 - 14;
        }
        v23 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)v64);
        v22 = v20;
        if (v23)
        {
LABEL_44:
          v19 += 14;
          v66 = v19;
          v20 += 28;
          if (v19 == v16)
            goto LABEL_45;
          continue;
        }
      }
      v64[0] = v22;
      goto LABEL_44;
    }
    break;
  }
  if (!std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
  {
    std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64);
    v17 = v18;
  }
LABEL_46:
  v24 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v17 + 5), 1u);
  v26 = *a1;
  v25 = (__int128 *)a1[1];
  v63 = v26;
  v64[0] = v26;
  if (v26 == (uint64_t *)v25 || (v27 = v26 + 14, v66 = (__int128 *)(v26 + 14), v26 + 14 == (uint64_t *)v25))
  {
    v27 = v26;
    goto LABEL_73;
  }
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
  {
    v63 = v26 + 14;
    v28 = v26;
  }
  else
  {
    v64[0] = v26 + 14;
    v28 = v26 + 14;
    v27 = v26;
  }
  v29 = (__int128 *)(v26 + 28);
  if (v26 + 28 == (uint64_t *)v25)
    goto LABEL_72;
  v30 = v26 + 42;
  while (2)
  {
    v65 = (__int128 *)(v30 - 14);
    v66 = v29 + 7;
    if (v29 + 7 != v25)
    {
      if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v65))
      {
        if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)&v63))
        {
          v63 = v30;
          v27 = v30;
        }
        v31 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64);
        v32 = v29;
        if (v31)
          goto LABEL_64;
      }
      else
      {
        if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
        {
          v63 = v30 - 14;
          v27 = v30 - 14;
        }
        v33 = std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v66, (uint64_t *)v64);
        v32 = v30;
        if (v33)
        {
LABEL_64:
          v29 += 14;
          v66 = v29;
          v30 += 28;
          if (v29 == v25)
            goto LABEL_72;
          continue;
        }
      }
      v64[0] = v32;
      v28 = v32;
      goto LABEL_64;
    }
    break;
  }
  if (std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)&v63))
  {
    v27 = v30 - 14;
  }
  else if (!std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(&v65, (uint64_t *)v64))
  {
    v28 = v30 - 14;
  }
LABEL_72:
  v26 = v28;
LABEL_73:
  v34 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v27 + 5), 2u);
  v35 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)(v26 + 5), 2u);
  v64[0] = 0;
  v64[1] = 0;
  v63 = (uint64_t *)v64;
  if (-1227133513 * (v6 >> 4))
  {
    v36 = 0;
    v37 = ceil((v15 - v14) * 4.0);
    v38 = fmaxf(v37, 1.0);
    v39 = ceil((v35 - v34) * 4.0);
    v40 = fmaxf(v39, 1.0);
    do
    {
      v41 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&(*a1)[14 * v36 + 5], 0);
      v42 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&(*a1)[14 * v36 + 5], 1u);
      v43 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&(*a1)[14 * v36 + 5], 2u);
      v44 = ceil((v41 - v14) * 4.0) + -1.0;
      v45 = fmaxf(v44, 0.0);
      v46 = ceil((v42 - v24) * 4.0) + -1.0;
      *(float *)&v43 = ceil((v43 - v34) * 4.0) + -1.0;
      v47 = v45 + (fmaxf(*(float *)&v43, 0.0) + fmaxf(v46, 0.0) * v40) * v38;
      v48 = v64[0];
      if (!v64[0])
        goto LABEL_85;
      v49 = v64;
      do
      {
        v50 = v48;
        v51 = v49;
        v52 = *((_DWORD *)v48 + 7);
        if (v52 >= v47)
          v49 = (_QWORD **)v48;
        else
          ++v48;
        v48 = (_QWORD *)*v48;
      }
      while (v48);
      if (v49 == v64)
        goto LABEL_85;
      if (v52 < v47)
        v50 = v51;
      if (v47 >= *((_DWORD *)v50 + 7))
      {
        if (*(double *)&(*a1)[14 * v36 + 1] < *(double *)&(*a1)[14 * *((unsigned int *)v49 + 8) + 1])
          *((_DWORD *)v49 + 8) = v36;
      }
      else
      {
LABEL_85:
        v67 = __PAIR64__(v36, v47);
        std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,unsigned int>>(&v63, (unsigned int *)&v67, (uint64_t *)&v67);
      }
      ++v36;
    }
    while (v36 != -1227133513 * (v6 >> 4));
    v53 = v63;
    if (v63 != (uint64_t *)v64)
    {
      v54 = a2[1];
      do
      {
        v55 = *((_DWORD *)v53 + 8);
        v56 = *a1;
        v57 = (uint64_t)&(*a1)[14 * v55];
        if (v54 >= a2[2])
        {
          v54 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas const&>(a2, (__int128 *)v57);
        }
        else
        {
          v58 = *(_OWORD *)v57;
          v59 = *(_OWORD *)(v57 + 16);
          *(_QWORD *)(v54 + 32) = *(_QWORD *)(v57 + 32);
          *(_OWORD *)v54 = v58;
          *(_OWORD *)(v54 + 16) = v59;
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v54 + 40, (uint64_t)&v56[14 * v55 + 5]);
          *(_DWORD *)(v54 + 104) = v56[14 * v55 + 13];
          v54 += 112;
          a2[1] = v54;
        }
        a2[1] = v54;
        v60 = (uint64_t *)v53[1];
        if (v60)
        {
          do
          {
            v61 = v60;
            v60 = (uint64_t *)*v60;
          }
          while (v60);
        }
        else
        {
          do
          {
            v61 = (uint64_t *)v53[2];
            v62 = *v61 == (_QWORD)v53;
            v53 = v61;
          }
          while (!v62);
        }
        v53 = v61;
      }
      while (v61 != (uint64_t *)v64);
    }
  }
  std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy((uint64_t)&v63, v64[0]);
}

void sub_2230F451C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

double RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::estimateTargetOnStraightPath(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  uint64_t (**v25)();
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (**v30)();
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (**v35)();
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  _QWORD v40[3];
  uint64_t (**v41)();
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (**v46)();
  __int128 v47;
  uint64_t v48;
  _BYTE *v49;
  _BYTE v50[2464];
  uint64_t (**v51)();
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;

  memset(v40, 0, sizeof(v40));
  v3 = *a2;
  if (a2[1] == *a2)
  {
    v7 = 0.0;
  }
  else
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      v37 = 0x100000003;
      v35 = &off_24EC111A0;
      v36 = xmmword_223118D20;
      v38 = &v39;
      v32 = 0x100000003;
      v30 = &off_24EC111A0;
      v31 = xmmword_223118D20;
      v33 = &v34;
      v8 = *a3;
      v9 = 112 * v6;
      v10 = *(double *)(*a3 + 112 * v6 + 8);
      v11 = *(double *)(v3 + 112 * v6 + 8);
      v12 = 3.14159265
          - acos(((v11 + 0.1) * (v11 + 0.1) + (v10 - v11) * (v10 - v11) - (v10 + -0.1) * (v10 + -0.1))/ ((v11 + 0.1)* (v10 - v11 + v10 - v11)));
      if (v12 <= 1.0)
        v13 = 1.0;
      else
        v13 = 1.0 / v12;
      if (v10 <= v11)
        v14 = v8;
      else
        v14 = v3;
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v35, v14 + v9 + 40);
      v15 = *a3;
      if (*(double *)(*a3 + v9 + 8) <= *(double *)(*a2 + v9 + 8))
        v15 = *a2;
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v30, v15 + v9 + 40);
      v16 = *a2 + v9;
      v17 = *a3 + v9;
      if (*(double *)(v16 + 8) >= *(double *)(v17 + 8))
        v18 = *(double *)(v16 + 8);
      else
        v18 = *(double *)(v17 + 8);
      v27 = 0x100000003;
      v25 = &off_24EC111A0;
      v26 = xmmword_223118D20;
      v28 = &v29;
      cnmatrix::Subtract<double>((uint64_t)&v35, (uint64_t)&v30, (uint64_t)&v25);
      v53 = 0x100000003;
      v51 = &off_24EC111A0;
      v52 = xmmword_223118D20;
      v54 = &v55;
      v48 = 0x100000134;
      v46 = &off_24EC11270;
      v47 = xmmword_223118D50;
      v49 = v50;
      v43 = 0x100000003;
      v41 = &off_24EC111A0;
      v42 = xmmword_223118D20;
      v44 = &v45;
      cnmatrix::Norm<double>((uint64_t)&v25, (uint64_t)&v51, (uint64_t)&v46, (uint64_t)&v41, "2");
      v20 = v19;
      v48 = 0x100000003;
      v46 = &off_24EC111A0;
      v47 = xmmword_223118D20;
      v49 = v50;
      cnmatrix::Subtract<double>((uint64_t)&v35, (uint64_t)&v30, (uint64_t)&v46);
      v21 = 0;
      v7 = v7 + v13;
      do
      {
        v22 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v30, v21);
        *(double *)&v40[v21] = *(double *)&v40[v21]
                             + v13
                             * (v22
                              + v18 * *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v46, v21) / v20);
        ++v21;
      }
      while (v21 != 3);
      ++v6;
      v3 = *a2;
    }
    while (0x6DB6DB6DB6DB6DB7 * ((a2[1] - *a2) >> 4) > v6);
  }
  for (i = 0; i != 3; ++i)
    *(double *)&v40[i] = *(double *)&v40[i] / v7;
  return *(double *)v40;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::computeStraightPathSolution(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *v4;
  uint64_t v5;
  uint64_t i;
  __int128 **v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  _QWORD *v13;
  uint64_t v14;
  double v15;
  _QWORD *v16;
  _BYTE *v17;
  _BYTE *v18;
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *v19;
  __int128 *v20;
  __int128 *v21;
  __int128 *v22;
  __int128 v23;
  __int128 v24;
  __int128 *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 *v34;
  double *v35;
  double v36;
  double v37;
  double v38;
  __int128 *v39;
  uint64_t v40;
  double v41;
  __int128 *v42;
  uint64_t v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 *v48;
  __int128 *v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  unint64_t v54;
  NSObject *v55;
  uint64_t v56;
  _QWORD *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  char *v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89[3];
  uint64_t v90[3];
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t (**v97)();
  __int128 v98;
  uint64_t v99;
  _BYTE *v100;
  _BYTE v101[24];
  __int128 *v102;
  __int128 *v103;
  unint64_t v104;
  uint64_t *v105[3];
  uint64_t (**v106)();
  __int128 v107;
  uint64_t v108;
  _BYTE *v109;
  _BYTE v110[24];
  uint8_t *v111;
  __int128 v112;
  uint64_t v113;
  _BYTE *v114;
  _BYTE v115[24];
  uint8_t buf[24];
  uint64_t v117;
  _QWORD *v118;
  _QWORD v119[311];

  v119[308] = *MEMORY[0x24BDAC8D0];
  v1 = *((_QWORD *)this + 85);
  v2 = *((_QWORD *)this + 84);
  v3 = 0x6DB6DB6DB6DB6DB7 * ((v1 - v2) >> 4);
  if (v3 >= 4)
  {
    v4 = this;
    v5 = *((_QWORD *)this + 91);
    for (i = *((_QWORD *)this + 90); v5 != i; v5 -= 112)
      *(_QWORD *)(v5 - 72) = off_24EC111F8;
    *((_QWORD *)this + 91) = i;
    memset(v105, 0, sizeof(v105));
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v105, v2, v1, v3);
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(v105, (uint64_t *)buf);
    v7 = (__int128 **)((char *)v4 + 720);
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vdeallocate((char **)v4 + 90);
    *((_OWORD *)v4 + 45) = *(_OWORD *)buf;
    *((_QWORD *)v4 + 92) = *(_QWORD *)&buf[16];
    memset(buf, 0, sizeof(buf));
    v111 = buf;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v111);
    v111 = (uint8_t *)v105;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v111);
    v102 = 0;
    v103 = 0;
    v104 = 0;
    v8 = *((_QWORD *)v4 + 91);
    if (v8 == *((_QWORD *)v4 + 90))
    {
      v26 = *((_QWORD *)v4 + 91);
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v11 = v101;
      v12 = v115;
      v13 = v119;
      v8 = *((_QWORD *)v4 + 90);
      do
      {
        v14 = *((_QWORD *)v4 + 85) - 72;
        v99 = 0x100000003;
        v97 = &off_24EC111A0;
        v98 = xmmword_223118D20;
        v100 = v11;
        cnmatrix::Subtract<double>(v8 + v9 * 16 + 40, v14, (uint64_t)&v97);
        v113 = 0x100000003;
        v111 = (uint8_t *)&off_24EC111A0;
        v112 = xmmword_223118D20;
        v114 = v12;
        v117 = 0x100000134;
        *(_QWORD *)buf = &off_24EC11270;
        *(_OWORD *)&buf[8] = xmmword_223118D50;
        v118 = v13;
        v108 = 0x100000003;
        v106 = &off_24EC111A0;
        v107 = xmmword_223118D20;
        v109 = v110;
        cnmatrix::Norm<double>((uint64_t)&v97, (uint64_t)&v111, (uint64_t)buf, (uint64_t)&v106, "2");
        if (v15 < 2.0)
        {
          v16 = v13;
          v17 = v12;
          v18 = v11;
          v19 = v4;
          v20 = *v7;
          v21 = &(*v7)[v9];
          v22 = v103;
          if ((unint64_t)v103 >= v104)
          {
            v25 = (__int128 *)std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas&>((uint64_t *)&v102, v21);
          }
          else
          {
            v23 = *v21;
            v24 = v21[1];
            *((_QWORD *)v103 + 4) = *((_QWORD *)v21 + 4);
            *v22 = v23;
            v22[1] = v24;
            cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v22 + 40, (uint64_t)v21 + 40);
            *((_DWORD *)v22 + 26) = DWORD2(v20[v9 + 6]);
            v25 = v22 + 7;
          }
          v4 = v19;
          v12 = v17;
          v103 = v25;
          v11 = v18;
          v13 = v16;
        }
        ++v10;
        v26 = *((_QWORD *)v4 + 91);
        v8 = *((_QWORD *)v4 + 90);
        v9 += 7;
      }
      while (0x6DB6DB6DB6DB6DB7 * ((v26 - v8) >> 4) > v10);
    }
    if (v7 != &v102)
    {
      std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>((uint64_t)v7, v102, v103, 0x6DB6DB6DB6DB6DB7 * (v103 - v102));
      v26 = *((_QWORD *)v4 + 91);
      v8 = *((_QWORD *)v4 + 90);
    }
    v27 = 0x6DB6DB6DB6DB6DB7 * ((v26 - v8) >> 4);
    v28 = v27 - 2;
    if ((int)v27 >= 2)
    {
      if (v27 >= 4)
        v28 = 2;
      if (v28)
      {
        if (v28 == 1)
          v29 = v27;
        else
          v29 = ((int)v27 - 1) * (int)v27 / 2;
      }
      else
      {
        v29 = 1;
      }
      if (v27 >= 5)
      {
        v83 = v29;
        v82 = v4;
        v30 = 0;
        v94 = 0;
        v95 = 0;
        v85 = (v27 - 1);
        v96 = 0;
        v91 = 0;
        v92 = 0;
        v86 = (int)v27;
        v93 = 0;
        v84 = v27;
        v31 = 1;
        v88 = 112;
        do
        {
          v87 = v30 + 1;
          if (v30 + 1 < v86)
          {
            v32 = v84;
            v33 = v88;
            do
            {
              v34 = *v7;
              v35 = (double *)((char *)*v7 + v33);
              v36 = v35[1];
              v37 = *((double *)&(*v7)[7 * v30] + 1);
              if (vabdd_f64(3.14159265, acos(((v37 + 0.1) * (v37 + 0.1) + (v36 - v37) * (v36 - v37) - (v36 + -0.1) * (v36 + -0.1))/ ((v37 + 0.1)* (v36 - v37 + v36 - v37)))) < 1.22173048)
              {
                v99 = 0x100000003;
                v97 = &off_24EC111A0;
                v98 = xmmword_223118D20;
                v100 = v101;
                cnmatrix::Subtract<double>((uint64_t)&v34[7 * v30 + 2] + 8, (uint64_t)(v35 + 5), (uint64_t)&v97);
                v113 = 0x100000003;
                v111 = (uint8_t *)&off_24EC111A0;
                v112 = xmmword_223118D20;
                v114 = v115;
                v117 = 0x100000134;
                *(_QWORD *)buf = &off_24EC11270;
                *(_OWORD *)&buf[8] = xmmword_223118D50;
                v118 = v119;
                v108 = 0x100000003;
                v106 = &off_24EC111A0;
                v107 = xmmword_223118D20;
                v109 = v110;
                cnmatrix::Norm<double>((uint64_t)&v97, (uint64_t)&v111, (uint64_t)buf, (uint64_t)&v106, "2");
                if (vabdd_f64(v38, fmax(v37, v36) - fmin(v37, v36)) < 0.1414)
                {
                  v39 = *v7;
                  v40 = (uint64_t)&(*v7)[7 * v30 + 2] + 8;
                  v99 = 0x100000003;
                  v97 = &off_24EC111A0;
                  v98 = xmmword_223118D20;
                  v100 = v101;
                  cnmatrix::Subtract<double>(v40, (uint64_t)v39 + v33 + 40, (uint64_t)&v97);
                  v113 = 0x100000003;
                  v111 = (uint8_t *)&off_24EC111A0;
                  v112 = xmmword_223118D20;
                  v114 = v115;
                  v117 = 0x100000134;
                  *(_QWORD *)buf = &off_24EC11270;
                  *(_OWORD *)&buf[8] = xmmword_223118D50;
                  v118 = v119;
                  v108 = 0x100000003;
                  v106 = &off_24EC111A0;
                  v107 = xmmword_223118D20;
                  v109 = v110;
                  cnmatrix::Norm<double>((uint64_t)&v97, (uint64_t)&v111, (uint64_t)buf, (uint64_t)&v106, "2");
                  if (v41 > 0.25)
                  {
                    v42 = *v7;
                    v43 = (uint64_t)&(*v7)[7 * v30];
                    v44 = v95;
                    if (v95 >= v96)
                    {
                      v47 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas&>(&v94, (__int128 *)v43);
                    }
                    else
                    {
                      v45 = *(_OWORD *)v43;
                      v46 = *(_OWORD *)(v43 + 16);
                      *(_QWORD *)(v95 + 32) = *(_QWORD *)(v43 + 32);
                      *(_OWORD *)v44 = v45;
                      *(_OWORD *)(v44 + 16) = v46;
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v44 + 40, (uint64_t)&v42[7 * v30 + 2] + 8);
                      *(_DWORD *)(v44 + 104) = DWORD2(v42[7 * v30 + 6]);
                      v47 = v44 + 112;
                    }
                    v95 = v47;
                    v48 = *v7;
                    v49 = (__int128 *)((char *)*v7 + v33);
                    v50 = v92;
                    if (v92 >= v93)
                    {
                      v53 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas&>(&v91, v49);
                    }
                    else
                    {
                      v51 = *v49;
                      v52 = v49[1];
                      *(_QWORD *)(v92 + 32) = *((_QWORD *)v49 + 4);
                      *(_OWORD *)v50 = v51;
                      *(_OWORD *)(v50 + 16) = v52;
                      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v50 + 40, (uint64_t)v49 + 40);
                      *(_DWORD *)(v50 + 104) = *(_DWORD *)((char *)v48 + v33 + 104);
                      v53 = v50 + 112;
                    }
                    v92 = v53;
                  }
                }
              }
              v33 += 112;
              --v32;
            }
            while (v31 != v32);
          }
          ++v31;
          v88 += 112;
          ++v30;
        }
        while (v87 != v85);
        v54 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v95 - v94) >> 4);
        if (v54 > 5 && (float)((float)((float)v54 / (float)v83) * 100.0) >= 70.0)
        {
          *((_BYTE *)v82 + 929) = 1;
          *((_QWORD *)v82 + 107) = *((_QWORD *)v82 + 74);
          cnmatrix::CNMatrixBase<double>::operator=((uint64_t)v82 + 864, (uint64_t)v82 + 168);
          v55 = *((_QWORD *)v82 + 56);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = *((_QWORD *)v82 + 74);
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v56;
            _os_log_impl(&dword_2230E5000, v55, OS_LOG_TYPE_DEFAULT, "Straight path solution generated at %f s", buf, 0xCu);
          }
          *((_DWORD *)v82 + 24) = 5;
          *((_BYTE *)v82 + 100) = 1;
          *((_DWORD *)v82 + 26) = 2;
          *((_BYTE *)v82 + 108) = 0;
          *((_QWORD *)v82 + 17) = 0;
          memset(v90, 0, sizeof(v90));
          std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v90, v94, v95, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v95 - v94) >> 4));
          memset(v89, 0, sizeof(v89));
          v57 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v89, v91, v92, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v92 - v91) >> 4));
          v58 = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::estimateTargetOnStraightPath((uint64_t)v57, v90, v89);
          v60 = v59;
          v62 = v61;
          *(_QWORD *)buf = v89;
          std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          *(_QWORD *)buf = v90;
          std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          v63 = *((_QWORD *)v82 + 16);
          v64 = *((_QWORD *)v82 + 14);
          *((_QWORD *)v82 + 15) = v64;
          if (v64 >= v63)
          {
            v66 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v63 - v64) >> 3);
            v67 = 2 * v66;
            if (2 * v66 <= 1)
              v67 = 1;
            if (v66 >= 0xC30C30C30C30C3)
              v68 = 0x186186186186186;
            else
              v68 = v67;
            v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>((uint64_t)v82 + 128, v68);
            v71 = &v69[168 * v70];
            *(double *)v69 = v58;
            *((_QWORD *)v69 + 1) = v60;
            *((_QWORD *)v69 + 2) = v62;
            *((_QWORD *)v69 + 4) = 0;
            *((_QWORD *)v69 + 5) = 0;
            *((_QWORD *)v69 + 3) = 0x3F847AE147AE147CLL;
            *((_OWORD *)v69 + 3) = xmmword_223118FF0;
            *((_OWORD *)v69 + 4) = xmmword_223119000;
            *((_QWORD *)v69 + 10) = 0x3FF0000000000000;
            *(_OWORD *)(v69 + 88) = 0u;
            *(_OWORD *)(v69 + 104) = 0u;
            *(_OWORD *)(v69 + 120) = 0u;
            *(_OWORD *)(v69 + 136) = 0u;
            *((_QWORD *)v69 + 19) = 0;
            *((_DWORD *)v69 + 40) = 2;
            v65 = v69 + 168;
            v73 = (char *)*((_QWORD *)v82 + 14);
            v72 = (char *)*((_QWORD *)v82 + 15);
            if (v72 != v73)
            {
              do
              {
                v74 = *(_OWORD *)(v72 - 168);
                v75 = *(_OWORD *)(v72 - 152);
                *(_OWORD *)(v69 - 136) = *(_OWORD *)(v72 - 136);
                *(_OWORD *)(v69 - 152) = v75;
                *(_OWORD *)(v69 - 168) = v74;
                v76 = *(_OWORD *)(v72 - 120);
                v77 = *(_OWORD *)(v72 - 104);
                v78 = *(_OWORD *)(v72 - 88);
                *(_OWORD *)(v69 - 72) = *(_OWORD *)(v72 - 72);
                *(_OWORD *)(v69 - 88) = v78;
                *(_OWORD *)(v69 - 104) = v77;
                *(_OWORD *)(v69 - 120) = v76;
                v79 = *(_OWORD *)(v72 - 56);
                v80 = *(_OWORD *)(v72 - 40);
                v81 = *(_OWORD *)(v72 - 24);
                *((_DWORD *)v69 - 2) = *((_DWORD *)v72 - 2);
                *(_OWORD *)(v69 - 24) = v81;
                *(_OWORD *)(v69 - 40) = v80;
                *(_OWORD *)(v69 - 56) = v79;
                v69 -= 168;
                v72 -= 168;
              }
              while (v72 != v73);
              v72 = (char *)*((_QWORD *)v82 + 14);
            }
            *((_QWORD *)v82 + 14) = v69;
            *((_QWORD *)v82 + 15) = v65;
            *((_QWORD *)v82 + 16) = v71;
            if (v72)
              operator delete(v72);
          }
          else
          {
            *(double *)v64 = v58;
            *(_QWORD *)(v64 + 8) = v60;
            *(_QWORD *)(v64 + 16) = v62;
            *(_QWORD *)(v64 + 32) = 0;
            *(_QWORD *)(v64 + 40) = 0;
            *(_QWORD *)(v64 + 24) = 0x3F847AE147AE147CLL;
            *(_OWORD *)(v64 + 48) = xmmword_223118FF0;
            *(_OWORD *)(v64 + 64) = xmmword_223119000;
            *(_QWORD *)(v64 + 80) = 0x3FF0000000000000;
            *(_OWORD *)(v64 + 88) = 0u;
            *(_OWORD *)(v64 + 104) = 0u;
            *(_OWORD *)(v64 + 120) = 0u;
            *(_OWORD *)(v64 + 136) = 0u;
            *(_DWORD *)(v64 + 160) = 2;
            v65 = (char *)(v64 + 168);
            *(_QWORD *)(v64 + 152) = 0;
          }
          *((_QWORD *)v82 + 15) = v65;
        }
        *(_QWORD *)buf = &v91;
        std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        *(_QWORD *)buf = &v94;
        std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      }
    }
    *(_QWORD *)buf = &v102;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
}

void sub_2230F5374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,void **a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  a39 = (void **)&a33;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a39);
  a39 = (void **)&a36;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a39);
  a39 = (void **)&a47;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a39);
  _Unwind_Resume(a1);
}

uint64_t RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::setCurrentRangeFilterEstimate(uint64_t this, double a2, char a3)
{
  *(double *)(this + 432) = a2;
  *(_BYTE *)(this + 440) = a3;
  return this;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::addMeasurement(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this@<X0>, uint64_t a2@<X1>, _QWORD *j@<X8>)
{
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  RoseSyntheticApertureFiltering *v12;
  double v13;
  double v14;
  NSObject *v15;
  double v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  _BOOL8 v36;
  __int128 *v37;
  unint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  NSObject *v42;
  double v43;
  double v44;
  double v45;
  int v46;
  __int128 v47;
  uint64_t v48;
  double v49;
  _QWORD *v50;
  int v51;
  uint64_t v52;
  double v53;
  double v54;
  char *v55;
  _QWORD *v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  double v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  char *v72;
  _OWORD *v73;
  uint64_t v74;
  _OWORD *v75;
  _OWORD *k;
  RoseSyntheticApertureFiltering *v77;
  double *v78;
  double *v79;
  double *v80;
  double *v81;
  double v82;
  double v83;
  double *v84;
  double *v85;
  double v86;
  double v87;
  double v88;
  NSObject *v89;
  double v90;
  double v91;
  NSObject *v92;
  double v93;
  double v94;
  double v95;
  int v96;
  unint64_t v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  double v101;
  NSObject *v102;
  const char *v103;
  NSObject *v104;
  uint32_t v105;
  double v106;
  double v107;
  NSObject *v108;
  NSObject *v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  char *v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char *v121;
  uint64_t v122;
  char *v123;
  char *v124;
  char *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  unint64_t v135;
  double v136;
  int v137;
  NSObject *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  int v143;
  double v144;
  uint64_t v145;
  double v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _OWORD *v151;
  char *v152;
  _OWORD *v153;
  unint64_t v154;
  unint64_t v155;
  unint64_t v156;
  char *v157;
  char *v158;
  char *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  char *v168;
  uint64_t v169;
  NSObject *v170;
  _BOOL4 v171;
  uint64_t *v172;
  _QWORD *v173;
  uint64_t v174;
  uint64_t v175;
  void *__p;
  __int128 v177;
  uint64_t v178;
  _BYTE *v179;
  _BYTE v180[72];
  uint64_t (**v181)();
  __int128 v182;
  uint64_t v183;
  _BYTE *v184;
  _BYTE v185[72];
  uint64_t (**v186)();
  __int128 v187;
  uint64_t v188;
  _BYTE *v189;
  _BYTE v190[72];
  _BYTE v191[64];
  double *v192[3];
  uint64_t v193[3];
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  _OWORD v197[2];
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  uint64_t v206;
  _BYTE v207[13];
  __int128 __src;
  __int128 v209;
  uint64_t (**v210)();
  __int128 v211;
  uint64_t v212;
  uint64_t *v213;
  uint64_t v214;
  _BYTE v215[112];
  uint64_t (**v216)();
  __int128 v217;
  uint64_t v218;
  uint64_t *v219;
  uint64_t v220;
  uint64_t (**v221)();
  __int128 v222;
  uint64_t v223;
  uint64_t *v224;
  uint64_t v225;
  uint64_t (**v226)();
  __int128 v227;
  uint64_t v228;
  uint64_t *v229;
  uint64_t v230;
  _QWORD buf[4];
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  uint64_t v240;
  uint64_t v241;

  v241 = *MEMORY[0x24BDAC8D0];
  if (*((_BYTE *)this + 934))
  {
    *((_BYTE *)this + 934) = 0;
    if (*((_QWORD *)this + 84) != *((_QWORD *)this + 85))
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::reinitFilter(this);
  }
  *((_QWORD *)this + 29) = *(_QWORD *)(a2 + 104);
  v223 = 0x100000003;
  v221 = &off_24EC111A0;
  v222 = xmmword_223118D20;
  v224 = &v225;
  cnmatrix::FastResize<double>(&v221, 3, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v221, 0.0);
  v218 = 0x100000004;
  v216 = &off_24EC11228;
  v217 = xmmword_223118D40;
  v219 = &v220;
  cnmatrix::FastResize<double>(&v216, 4, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v216, 0.0);
  for (i = 0; i != 3; ++i)
  {
    v7 = a2 + 8 * i;
    v8 = *(_QWORD *)(v7 + 96);
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v221, i) = v8;
    v9 = *(_QWORD *)(v7 + 120);
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v216, i) = v9;
  }
  v10 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v216, 3u) = v10;
  RoseSyntheticApertureFiltering::quatn2rot((uint64_t)&v216, (uint64_t)v215);
  buf[3] = 0x100000003;
  buf[0] = &off_24EC111A0;
  *(_OWORD *)&buf[1] = xmmword_223118D20;
  *(_QWORD *)&v232 = (char *)&v232 + 8;
  cnmatrix::Multiply<double>((uint64_t)v215, (uint64_t)this + 456, (uint64_t)buf);
  v212 = 0x100000003;
  v210 = &off_24EC111A0;
  v211 = xmmword_223118D20;
  v213 = &v214;
  cnmatrix::Add<double>((uint64_t)&v221, (uint64_t)buf, (uint64_t)&v210);
  v11 = (char *)this + 168;
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)this + 168, (uint64_t)&v221);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)this + 240, (uint64_t)&v216);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)this + 312, (uint64_t)v215);
  v13 = *(double *)a2;
  *((_QWORD *)this + 74) = *(_QWORD *)a2;
  if (*((_BYTE *)this + 928))
  {
    v14 = *((double *)this + 76);
    if (v13 - v14 > 10.0)
    {
      *((_BYTE *)this + 928) = 0;
      v15 = *((_QWORD *)this + 56);
      v12 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v12)
      {
        LODWORD(buf[0]) = 134218240;
        *(double *)((char *)buf + 4) = v14;
        WORD2(buf[1]) = 2048;
        *(double *)((char *)&buf[1] + 6) = v13;
        _os_log_impl(&dword_2230E5000, v15, OS_LOG_TYPE_DEFAULT, "AoA Solution from AoA at %f s is no longer valid - current time is %f s", (uint8_t *)buf, 0x16u);
      }
    }
  }
  if (*((_BYTE *)this + 929))
  {
    v16 = *((double *)this + 74) - *((double *)this + 107);
    if (v16 >= 2.0 && (*((double *)this + 54) < 2.0 || !*((_BYTE *)this + 440)))
      goto LABEL_16;
    if (v16 >= 5.0)
    {
      v183 = 0x100000003;
      v181 = &off_24EC111A0;
      v182 = xmmword_223118D20;
      v184 = v185;
      cnmatrix::Subtract<double>((uint64_t)&v210, (uint64_t)this + 864, (uint64_t)&v181);
      *((_QWORD *)&v197[1] + 1) = 0x100000003;
      *(_QWORD *)&v197[0] = &off_24EC111A0;
      *(_OWORD *)((char *)v197 + 8) = xmmword_223118D20;
      *(_QWORD *)&v198 = (char *)&v198 + 8;
      buf[3] = 0x100000134;
      buf[0] = &off_24EC11270;
      *(_OWORD *)&buf[1] = xmmword_223118D50;
      *(_QWORD *)&v232 = (char *)&v232 + 8;
      v188 = 0x100000003;
      v186 = &off_24EC111A0;
      v187 = xmmword_223118D20;
      v189 = v190;
      cnmatrix::Norm<double>((uint64_t)&v181, (uint64_t)v197, (uint64_t)buf, (uint64_t)&v186, "2");
      if (v17 > 1.0)
      {
LABEL_16:
        *((_BYTE *)this + 929) = 0;
        v18 = *((_QWORD *)this + 56);
        v12 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v12)
        {
          v19 = *((_QWORD *)this + 107);
          v20 = *((_QWORD *)this + 74);
          LODWORD(buf[0]) = 134218240;
          *(_QWORD *)((char *)buf + 4) = v19;
          WORD2(buf[1]) = 2048;
          *(_QWORD *)((char *)&buf[1] + 6) = v20;
          _os_log_impl(&dword_2230E5000, v18, OS_LOG_TYPE_DEFAULT, "Straight path solution at %f s is no longer valid - current time is %f s", (uint8_t *)buf, 0x16u);
        }
      }
    }
  }
  v21 = *(double *)(a2 + 16);
  if (v21 <= 0.0 || *(double *)(a2 + 8) < -1.0)
  {
    v22 = *((_QWORD *)this + 56);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::addMeasurement(a2, v22, v21);
    goto LABEL_154;
  }
  v172 = (uint64_t *)((char *)this + 672);
  v23 = *((_QWORD *)this + 85);
  if (v23 != *((_QWORD *)this + 84))
  {
    v183 = 0x100000003;
    v181 = &off_24EC111A0;
    v182 = xmmword_223118D20;
    v184 = v185;
    cnmatrix::Subtract<double>((uint64_t)&v210, v23 - 72, (uint64_t)&v181);
    *((_QWORD *)&v197[1] + 1) = 0x100000003;
    *(_QWORD *)&v197[0] = &off_24EC111A0;
    *(_OWORD *)((char *)v197 + 8) = xmmword_223118D20;
    *(_QWORD *)&v198 = (char *)&v198 + 8;
    buf[3] = 0x100000134;
    buf[0] = &off_24EC11270;
    *(_OWORD *)&buf[1] = xmmword_223118D50;
    *(_QWORD *)&v232 = (char *)&v232 + 8;
    v188 = 0x100000003;
    v186 = &off_24EC111A0;
    v187 = xmmword_223118D20;
    v189 = v190;
    cnmatrix::Norm<double>((uint64_t)&v181, (uint64_t)v197, (uint64_t)buf, (uint64_t)&v186, "2");
    v25 = v24;
    v26 = *(double *)(a2 + 8);
    v27 = *(double *)(v23 - 104);
    v28 = v26 - v27;
    if (v26 - v27 <= 0.0)
    {
      if ((fabs(v28) - v24) / *(double *)(a2 + 16) <= 6.0)
      {
        if (*((_BYTE *)this + 941))
        {
          *((_BYTE *)this + 941) = 0;
          v42 = *((_QWORD *)this + 56);
          v12 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v12)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_2230E5000, v42, OS_LOG_TYPE_DEFAULT, "Did not observe a second consecutive nLoS->LoS event after the first one - marked as a false event due to packet collision", (uint8_t *)buf, 2u);
          }
        }
      }
      else
      {
        v33 = *((_QWORD *)this + 56);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf[0]) = 134218496;
          *(double *)((char *)buf + 4) = v27;
          WORD2(buf[1]) = 2048;
          *(double *)((char *)&buf[1] + 6) = v26;
          HIWORD(buf[2]) = 2048;
          *(double *)&buf[3] = v25;
          _os_log_error_impl(&dword_2230E5000, v33, OS_LOG_TYPE_ERROR, "nLoS->LoS event detected by the batch filter: Previous range %f m, Current range %f m, Distance travelled %f m", (uint8_t *)buf, 0x20u);
        }
        v34 = *((unsigned __int8 *)this + 941);
        v35 = *((_QWORD *)this + 56);
        v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        if (!v34)
        {
          if (v36)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_2230E5000, v35, OS_LOG_TYPE_DEFAULT, "fRangeDropped is false, buffering this nLoS->LoS event for now", (uint8_t *)buf, 2u);
          }
          *((_BYTE *)this + 941) = 1;
          v43 = RoseSyntheticApertureFiltering::range2deweight((RoseSyntheticApertureFiltering *)v36, *(double *)(a2 + 8) / *((double *)this + 77));
          v44 = *(double *)(a2 + 8);
          v45 = *(double *)(a2 + 16);
          v46 = *(_DWORD *)(a2 + 24);
          buf[0] = *(_QWORD *)a2;
          *(double *)&buf[1] = v44;
          *(double *)&buf[2] = v44 / (v43 * v45);
          *(double *)&buf[3] = v45;
          *(double *)&v232 = v43;
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v232 + 8, (uint64_t)&v210);
          DWORD2(v236) = v46;
          *((_QWORD *)this + 97) = v232;
          v47 = *(_OWORD *)&buf[2];
          *(_OWORD *)((char *)this + 744) = *(_OWORD *)buf;
          *(_OWORD *)((char *)this + 760) = v47;
          cnmatrix::CNMatrixBase<double>::operator=((uint64_t)this + 784, (uint64_t)&v232 + 8);
          *((_DWORD *)this + 212) = DWORD2(v236);
          goto LABEL_141;
        }
        if (v36)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_2230E5000, v35, OS_LOG_TYPE_DEFAULT, "fRangeDropped is true, detected two consecutive nLoS->LoS events", (uint8_t *)buf, 2u);
        }
        v37 = (__int128 *)((char *)this + 744);
        v38 = *((_QWORD *)this + 85);
        if (v38 >= *((_QWORD *)this + 86))
        {
          v41 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas const&>(v172, v37);
        }
        else
        {
          v39 = *v37;
          v40 = *(_OWORD *)((char *)this + 760);
          *(_QWORD *)(v38 + 32) = *((_QWORD *)this + 97);
          *(_OWORD *)v38 = v39;
          *(_OWORD *)(v38 + 16) = v40;
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v38 + 40, (uint64_t)this + 784);
          *(_DWORD *)(v38 + 104) = *((_DWORD *)this + 212);
          v41 = v38 + 112;
          *((_QWORD *)this + 85) = v38 + 112;
        }
        *((_QWORD *)this + 85) = v41;
        *((_BYTE *)this + 941) = 0;
        __p = 0;
        v177 = 0uLL;
        v48 = *((_QWORD *)this + 84);
        if (v48 != v41)
        {
          do
          {
            v183 = 0x100000003;
            v181 = &off_24EC111A0;
            v182 = xmmword_223118D20;
            v184 = v185;
            cnmatrix::Subtract<double>((uint64_t)&v210, v48 + 40, (uint64_t)&v181);
            *((_QWORD *)&v197[1] + 1) = 0x100000003;
            *(_QWORD *)&v197[0] = &off_24EC111A0;
            *(_OWORD *)((char *)v197 + 8) = xmmword_223118D20;
            *(_QWORD *)&v198 = (char *)&v198 + 8;
            buf[3] = 0x100000134;
            buf[0] = &off_24EC11270;
            *(_OWORD *)&buf[1] = xmmword_223118D50;
            *(_QWORD *)&v232 = (char *)&v232 + 8;
            v188 = 0x100000003;
            v186 = &off_24EC111A0;
            v187 = xmmword_223118D20;
            v189 = v190;
            cnmatrix::Norm<double>((uint64_t)&v181, (uint64_t)v197, (uint64_t)buf, (uint64_t)&v186, "2");
            if ((*(double *)(v48 + 8) - *(double *)(a2 + 8) - v49) / *(double *)(a2 + 16) <= 6.0)
            {
              v48 += 112;
              v68 = *((_QWORD *)this + 85);
            }
            else
            {
              v50 = j;
              v51 = 0;
              do
              {
                v52 = *((_QWORD *)this + 87);
                if (0x4EC4EC4EC4EC4EC5 * ((*((_QWORD *)this + 88) - v52) >> 4) <= (unint64_t)v51)
                  break;
                v53 = *(double *)(v52 + 208 * v51);
                v54 = *(double *)v48;
                if (v53 == *(double *)v48)
                {
                  v55 = (char *)v177;
                  if ((unint64_t)v177 >= *((_QWORD *)&v177 + 1))
                  {
                    v57 = (char *)__p;
                    v58 = (uint64_t)(v177 - (_QWORD)__p) >> 3;
                    v59 = v58 + 1;
                    if ((unint64_t)(v58 + 1) >> 61)
                      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                    v60 = *((_QWORD *)&v177 + 1) - (_QWORD)__p;
                    if ((uint64_t)(*((_QWORD *)&v177 + 1) - (_QWORD)__p) >> 2 > v59)
                      v59 = v60 >> 2;
                    if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8)
                      v61 = 0x1FFFFFFFFFFFFFFFLL;
                    else
                      v61 = v59;
                    if (v61)
                    {
                      v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v177 + 8, v61);
                      v57 = (char *)__p;
                      v55 = (char *)v177;
                    }
                    else
                    {
                      v62 = 0;
                    }
                    v63 = &v62[8 * v58];
                    *(_QWORD *)v63 = v51;
                    v56 = v63 + 8;
                    while (v55 != v57)
                    {
                      v64 = *((_QWORD *)v55 - 1);
                      v55 -= 8;
                      *((_QWORD *)v63 - 1) = v64;
                      v63 -= 8;
                    }
                    __p = v63;
                    *(_QWORD *)&v177 = v56;
                    *((_QWORD *)&v177 + 1) = &v62[8 * v61];
                    if (v57)
                      operator delete(v57);
                  }
                  else
                  {
                    *(_QWORD *)v177 = v51;
                    v56 = v55 + 8;
                  }
                  *(_QWORD *)&v177 = v56;
                }
                else
                {
                  ++v51;
                }
              }
              while (v53 != v54);
              if (*((_BYTE *)this + 928))
              {
                v65 = *((double *)this + 76);
                if (*(double *)v48 == v65)
                {
                  *((_BYTE *)this + 928) = 0;
                  v66 = *((_QWORD *)this + 56);
                  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf[0]) = 134217984;
                    *(double *)((char *)buf + 4) = v65;
                    _os_log_impl(&dword_2230E5000, v66, OS_LOG_TYPE_DEFAULT, "AoA Solution from AoA at %f s is no longer valid due to multipath", (uint8_t *)buf, 0xCu);
                  }
                }
              }
              v67 = *((_QWORD *)this + 56);
              if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              {
                v70 = *(double *)v48;
                v71 = *(_QWORD *)(v48 + 8);
                LODWORD(buf[0]) = 134218240;
                *(double *)((char *)buf + 4) = v70;
                WORD2(buf[1]) = 2048;
                *(_QWORD *)((char *)&buf[1] + 6) = v71;
                _os_log_error_impl(&dword_2230E5000, v67, OS_LOG_TYPE_ERROR, "Removing measurement at time %f s with range %f m", (uint8_t *)buf, 0x16u);
              }
              std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,0>((__int128 *)(v48 + 112), *((__int128 **)this + 85), v48);
              v69 = *((_QWORD *)this + 85);
              for (j = v50; v69 != v68; v69 -= 112)
                *(_QWORD *)(v69 - 72) = off_24EC111F8;
              *((_QWORD *)this + 85) = v68;
            }
          }
          while (v48 != v68);
          v72 = (char *)v177;
          v11 = (char *)this + 168;
          if ((void *)v177 != __p)
          {
            v73 = (_OWORD *)*((_QWORD *)this + 88);
            do
            {
              v74 = *((_QWORD *)v72 - 1);
              v72 -= 8;
              std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas *,RoseSyntheticApertureFiltering::InternalAoAMeas *,RoseSyntheticApertureFiltering::InternalAoAMeas *>((uint64_t)buf, (_OWORD *)(*((_QWORD *)this + 87) + 208 * v74 + 208), v73, (_OWORD *)(*((_QWORD *)this + 87) + 208 * v74));
              v73 = v75;
              for (k = (_OWORD *)*((_QWORD *)this + 88); k != v75; k -= 13)
              {
                *((_QWORD *)k - 14) = off_24EC111F8;
                *((_QWORD *)k - 22) = off_24EC111F8;
              }
              *((_QWORD *)this + 88) = v75;
            }
            while (v72 != __p);
          }
        }
        RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::resetFilter(this);
        v78 = (double *)*((_QWORD *)this + 84);
        v79 = (double *)*((_QWORD *)this + 85);
        if (v78 == v79)
        {
          *((_QWORD *)this + 77) = 0x3FF0000000000000;
        }
        else
        {
          v80 = v78 + 14;
          v81 = (double *)*((_QWORD *)this + 84);
          if (v78 + 14 != v79)
          {
            v81 = (double *)*((_QWORD *)this + 84);
            do
            {
              if (v80[1] < v81[1])
                v81 = v80;
              v80 += 14;
            }
            while (v80 != v79);
          }
          v82 = fmax(v81[1], 1.0);
          if (v82 != *((double *)this + 77))
          {
            *((double *)this + 77) = v82;
            do
            {
              v83 = RoseSyntheticApertureFiltering::range2deweight(v77, v78[1] / *((double *)this + 77));
              v78[4] = v83;
              v78[2] = v78[1] / (v83 * v78[3]);
              v78 += 14;
            }
            while (v78 != v79);
          }
        }
        v12 = (RoseSyntheticApertureFiltering *)__p;
        if (__p)
        {
          *(_QWORD *)&v177 = __p;
          operator delete(__p);
        }
      }
    }
    else
    {
      if (*((_BYTE *)this + 941))
      {
        *((_BYTE *)this + 941) = 0;
        v29 = *((_QWORD *)this + 56);
        v12 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v12)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_2230E5000, v29, OS_LOG_TYPE_DEFAULT, "Did not observe a second consecutive nLoS->LoS event after the first one - marked as a false event due to packet collision", (uint8_t *)buf, 2u);
        }
      }
      if ((v28 - v25) / *(double *)(a2 + 16) > 6.0)
      {
        v30 = *((_QWORD *)this + 56);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = *(_QWORD *)(v23 - 104);
          v32 = *(_QWORD *)(a2 + 8);
          LODWORD(buf[0]) = 134218496;
          *(_QWORD *)((char *)buf + 4) = v31;
          WORD2(buf[1]) = 2048;
          *(_QWORD *)((char *)&buf[1] + 6) = v32;
          HIWORD(buf[2]) = 2048;
          *(double *)&buf[3] = v25;
          _os_log_error_impl(&dword_2230E5000, v30, OS_LOG_TYPE_ERROR, "LoS->nLoS event detected by the batch filter: Previous range %f m, Current range %f m, Distance travelled %f m", (uint8_t *)buf, 0x20u);
        }
        goto LABEL_141;
      }
    }
  }
  v84 = (double *)*((_QWORD *)this + 84);
  v85 = (double *)*((_QWORD *)this + 85);
  v86 = *(double *)(a2 + 8);
  if (v84 == v85)
  {
    v91 = fmax(v86, 1.0);
    *((double *)this + 77) = v91;
    v92 = *((_QWORD *)this + 56);
    v12 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v12)
    {
      LODWORD(buf[0]) = 134217984;
      *(double *)((char *)buf + 4) = v91;
      _os_log_impl(&dword_2230E5000, v92, OS_LOG_TYPE_DEFAULT, "Minimum observed range initialized to %f m", (uint8_t *)buf, 0xCu);
    }
  }
  else
  {
    v87 = *((double *)this + 77);
    if (v86 < v87 && v87 > 1.0)
    {
      v88 = fmax(v86, 1.0);
      *((double *)this + 77) = v88;
      v89 = *((_QWORD *)this + 56);
      v12 = (RoseSyntheticApertureFiltering *)os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v12)
      {
        LODWORD(buf[0]) = 134217984;
        *(double *)((char *)buf + 4) = v88;
        _os_log_impl(&dword_2230E5000, v89, OS_LOG_TYPE_DEFAULT, "Minimum observed range changed to %f m", (uint8_t *)buf, 0xCu);
        v84 = (double *)*((_QWORD *)this + 84);
        v85 = (double *)*((_QWORD *)this + 85);
      }
      while (v84 != v85)
      {
        v90 = RoseSyntheticApertureFiltering::range2deweight(v12, v84[1] / *((double *)this + 77));
        v84[4] = v90;
        v84[2] = v84[1] / (v90 * v84[3]);
        v84 += 14;
      }
    }
  }
  v93 = RoseSyntheticApertureFiltering::range2deweight(v12, *(double *)(a2 + 8) / *((double *)this + 77));
  v94 = *(double *)(a2 + 8);
  v95 = *(double *)(a2 + 16);
  v96 = *(_DWORD *)(a2 + 24);
  buf[0] = *(_QWORD *)a2;
  *(double *)&buf[1] = v94;
  *(double *)&buf[2] = v94 / (v93 * v95);
  *(double *)&buf[3] = v95;
  *(double *)&v232 = v93;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v232 + 8, (uint64_t)&v210);
  DWORD2(v236) = v96;
  v97 = *((_QWORD *)this + 85);
  if (v97 >= *((_QWORD *)this + 86))
  {
    v100 = std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas>(v172, (__int128 *)buf);
  }
  else
  {
    v98 = *(_OWORD *)buf;
    v99 = *(_OWORD *)&buf[2];
    *(_QWORD *)(v97 + 32) = v232;
    *(_OWORD *)v97 = v98;
    *(_OWORD *)(v97 + 16) = v99;
    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v97 + 40, (uint64_t)&v232 + 8);
    *(_DWORD *)(v97 + 104) = DWORD2(v236);
    v100 = v97 + 112;
    *((_QWORD *)this + 85) = v97 + 112;
  }
  *((_QWORD *)this + 85) = v100;
  if (*(_BYTE *)(a2 + 88))
  {
    if (*(_BYTE *)(a2 + 80))
    {
      v101 = *(double *)(a2 + 72);
      if (v101 > 1.1)
      {
        v102 = *((_QWORD *)this + 56);
        if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          goto LABEL_141;
        LODWORD(buf[0]) = 134217984;
        *(double *)((char *)buf + 4) = v101;
        v103 = "AoA measurement rejected due to high multipath probability (%4.2f)";
        v104 = v102;
        v105 = 12;
        goto LABEL_116;
      }
    }
    v106 = *(double *)(a2 + 56);
    v107 = *(double *)(a2 + 64);
    if ((v107 < 450.0 || v106 < 0.0) && (v107 < 200.0 || v106 < 40.0))
    {
      v170 = *((_QWORD *)this + 56);
      if (!os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
        goto LABEL_141;
      LODWORD(buf[0]) = 134218240;
      *(double *)((char *)buf + 4) = v107;
      WORD2(buf[1]) = 2048;
      *(double *)((char *)&buf[1] + 6) = v106;
      v103 = "AoA measurement rejected due to low track score (%4.1f) or low sweep angle (%4.1f deg)";
      v104 = v170;
      v105 = 22;
LABEL_116:
      _os_log_impl(&dword_2230E5000, v104, OS_LOG_TYPE_DEFAULT, v103, (uint8_t *)buf, v105);
      goto LABEL_141;
    }
    v108 = *((_QWORD *)this + 56);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0]) = 134218240;
      *(double *)((char *)buf + 4) = v107;
      WORD2(buf[1]) = 2048;
      *(double *)((char *)&buf[1] + 6) = v106;
      _os_log_impl(&dword_2230E5000, v108, OS_LOG_TYPE_DEFAULT, "AoA measurement accepted: track score (%4.1f) and sweep angle (%4.1f deg)", (uint8_t *)buf, 0x16u);
    }
    *((_WORD *)this + 464) = 1;
    *((_QWORD *)this + 76) = *(_QWORD *)a2;
    buf[3] = 0x100000003;
    buf[0] = &off_24EC111A0;
    *(_OWORD *)&buf[1] = xmmword_223118D20;
    *(_QWORD *)&v232 = (char *)&v232 + 8;
    cnmatrix::Multiply<double>((uint64_t)v215, (uint64_t)this + 520, (uint64_t)buf);
    *((_QWORD *)&v197[1] + 1) = 0x100000003;
    *(_QWORD *)&v197[0] = &off_24EC111A0;
    *(_OWORD *)((char *)v197 + 8) = xmmword_223118D20;
    *(_QWORD *)&v198 = (char *)&v198 + 8;
    cnmatrix::Add<double>((uint64_t)&v221, (uint64_t)buf, (uint64_t)v197);
    if (!*(_BYTE *)(a2 + 88))
      std::__throw_bad_optional_access[abi:ne180100]();
    RoseSyntheticApertureFiltering::rangeAzEl2pos(*(double *)(a2 + 8), *(double *)(a2 + 40) / 180.0 * 3.14159265, *(double *)(a2 + 32) / 180.0 * 3.14159265, (uint64_t)&v186);
    buf[3] = 0x100000003;
    buf[0] = &off_24EC111A0;
    *(_OWORD *)&buf[1] = xmmword_223118D20;
    *(_QWORD *)&v232 = (char *)&v232 + 8;
    cnmatrix::Multiply<double>((uint64_t)v215, (uint64_t)&v186, (uint64_t)buf);
    v183 = 0x100000003;
    v181 = &off_24EC111A0;
    v182 = xmmword_223118D20;
    v184 = v185;
    cnmatrix::Add<double>((uint64_t)buf, (uint64_t)v197, (uint64_t)&v181);
    v109 = *((_QWORD *)this + 56);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      v110 = *((_QWORD *)this + 76);
      v111 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v181, 0);
      v112 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v181, 1u);
      v113 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v181, 2u);
      LODWORD(buf[0]) = 134218752;
      *(_QWORD *)((char *)buf + 4) = v110;
      WORD2(buf[1]) = 2048;
      *(double *)((char *)&buf[1] + 6) = v111;
      HIWORD(buf[2]) = 2048;
      *(double *)&buf[3] = v112;
      LOWORD(v232) = 2048;
      *(double *)((char *)&v232 + 2) = v113;
      _os_log_impl(&dword_2230E5000, v109, OS_LOG_TYPE_DEFAULT, "Solution from AoA is generated at %f s - device pos is [%f, %f, %f] m", (uint8_t *)buf, 0x2Au);
    }
    v114 = 0;
    *((_DWORD *)this + 12) = 5;
    *((_BYTE *)this + 52) = 1;
    *((_DWORD *)this + 14) = 2;
    *((_BYTE *)this + 60) = 0;
    *((_QWORD *)this + 11) = 0;
    v238 = 0u;
    v239 = 0u;
    v236 = 0u;
    v237 = 0u;
    v234 = 0u;
    v235 = 0u;
    v232 = 0u;
    v233 = 0u;
    memset(buf, 0, sizeof(buf));
    do
    {
      *(double *)&buf[v114] = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v181, v114);
      ++v114;
    }
    while (v114 != 3);
    buf[3] = 0x3F847AE147AE147CLL;
    v232 = 0uLL;
    v233 = xmmword_223118FF0;
    v234 = xmmword_223119000;
    *(_QWORD *)&v235 = 0x3FF0000000000000;
    LODWORD(v240) = 0;
    v115 = *((_QWORD *)this + 10);
    v116 = *((_QWORD *)this + 8);
    *((_QWORD *)this + 9) = v116;
    if (v116 >= v115)
    {
      v118 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v115 - v116) >> 3);
      v119 = 2 * v118;
      if (2 * v118 <= 1)
        v119 = 1;
      if (v118 >= 0xC30C30C30C30C3)
        v120 = 0x186186186186186;
      else
        v120 = v119;
      v121 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>((uint64_t)this + 80, v120);
      v123 = &v121[168 * v122];
      *((_OWORD *)v121 + 6) = v236;
      *((_OWORD *)v121 + 5) = v235;
      *((_OWORD *)v121 + 4) = v234;
      *((_OWORD *)v121 + 3) = v233;
      *((_QWORD *)v121 + 20) = v240;
      *((_OWORD *)v121 + 9) = v239;
      *((_OWORD *)v121 + 8) = v238;
      *((_OWORD *)v121 + 7) = v237;
      *(_OWORD *)v121 = *(_OWORD *)buf;
      *((_OWORD *)v121 + 1) = *(_OWORD *)&buf[2];
      *((_OWORD *)v121 + 2) = v232;
      v117 = v121 + 168;
      v125 = (char *)*((_QWORD *)this + 8);
      v124 = (char *)*((_QWORD *)this + 9);
      if (v124 != v125)
      {
        do
        {
          v126 = *(_OWORD *)(v124 - 168);
          v127 = *(_OWORD *)(v124 - 152);
          *(_OWORD *)(v121 - 136) = *(_OWORD *)(v124 - 136);
          *(_OWORD *)(v121 - 152) = v127;
          *(_OWORD *)(v121 - 168) = v126;
          v128 = *(_OWORD *)(v124 - 120);
          v129 = *(_OWORD *)(v124 - 104);
          v130 = *(_OWORD *)(v124 - 88);
          *(_OWORD *)(v121 - 72) = *(_OWORD *)(v124 - 72);
          *(_OWORD *)(v121 - 88) = v130;
          *(_OWORD *)(v121 - 104) = v129;
          *(_OWORD *)(v121 - 120) = v128;
          v131 = *(_OWORD *)(v124 - 56);
          v132 = *(_OWORD *)(v124 - 40);
          v133 = *(_OWORD *)(v124 - 24);
          *((_DWORD *)v121 - 2) = *((_DWORD *)v124 - 2);
          *(_OWORD *)(v121 - 24) = v133;
          *(_OWORD *)(v121 - 40) = v132;
          *(_OWORD *)(v121 - 56) = v131;
          v121 -= 168;
          v124 -= 168;
        }
        while (v124 != v125);
        v124 = (char *)*((_QWORD *)this + 8);
      }
      *((_QWORD *)this + 8) = v121;
      *((_QWORD *)this + 9) = v117;
      *((_QWORD *)this + 10) = v123;
      if (v124)
        operator delete(v124);
    }
    else
    {
      *(_OWORD *)(v116 + 112) = v237;
      *(_OWORD *)(v116 + 128) = v238;
      *(_OWORD *)(v116 + 144) = v239;
      *(_QWORD *)(v116 + 160) = v240;
      *(_OWORD *)(v116 + 48) = v233;
      *(_OWORD *)(v116 + 64) = v234;
      *(_OWORD *)(v116 + 80) = v235;
      *(_OWORD *)(v116 + 96) = v236;
      *(_OWORD *)v116 = *(_OWORD *)buf;
      *(_OWORD *)(v116 + 16) = *(_OWORD *)&buf[2];
      *(_OWORD *)(v116 + 32) = v232;
      v117 = (char *)(v116 + 168);
    }
    *((_QWORD *)this + 9) = v117;
  }
LABEL_141:
  if ((*((_BYTE *)this + 931) || *((_BYTE *)this + 932))
    && (unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)this + 85) - *((_QWORD *)this + 84)) >> 4)) >= 4)
  {
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkMotionStateAndObservability(this);
  }
  v134 = *((_QWORD *)this + 85) - *((_QWORD *)this + 84);
  v135 = 0x6DB6DB6DB6DB6DB7 * (v134 >> 4);
  if (v135 >= 4
    && !*((_BYTE *)this + 931)
    && !*((_BYTE *)this + 932)
    && *((double *)this + 74) - *((double *)this + 75) >= 0.5)
  {
    v171 = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(this);
    *((_BYTE *)this + 933) = v171;
    if (v171)
    {
      *((_QWORD *)this + 75) = *((_QWORD *)this + 74);
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkVerticalAmbiguityResolution(this);
      *((_BYTE *)this + 929) = 0;
      goto LABEL_154;
    }
LABEL_153:
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::computeStraightPathSolution(this);
    goto LABEL_154;
  }
  if (v134 == 112)
  {
    v136 = *((double *)this + 74);
    *((double *)this + 73) = v136;
    *((double *)this + 75) = v136 + -0.5;
    goto LABEL_154;
  }
  if (v135 >= 5 && !*((_BYTE *)this + 933))
    goto LABEL_153;
LABEL_154:
  *(_DWORD *)v207 = 0;
  v207[4] = 0;
  *(_DWORD *)&v207[8] = 0;
  __src = 0u;
  v209 = 0u;
  v207[12] = 0;
  if (*((_BYTE *)this + 934))
  {
    v137 = 6;
LABEL_156:
    *(_DWORD *)v207 = v137;
    goto LABEL_157;
  }
  if (*((_BYTE *)this + 931))
  {
    if (!*((_BYTE *)this + 932))
    {
      v137 = 1;
      goto LABEL_156;
    }
  }
  else
  {
    if (*((_BYTE *)this + 932))
    {
      v138 = *((_QWORD *)this + 56);
      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
      {
        v139 = *((_QWORD *)this + 78);
        LODWORD(buf[0]) = 134217984;
        *(_QWORD *)((char *)buf + 4) = v139;
        _os_log_impl(&dword_2230E5000, v138, OS_LOG_TYPE_DEFAULT, "Linear user path length is %4.2f m", (uint8_t *)buf, 0xCu);
      }
      if (*((double *)this + 78) >= 1.5)
        v137 = 3;
      else
        v137 = 2;
      goto LABEL_156;
    }
    v175 = (uint64_t)v11;
    if (!*((_BYTE *)this + 933))
    {
      v137 = 4;
      goto LABEL_156;
    }
    *(_DWORD *)v207 = 5;
    *(_DWORD *)&v207[8] = *((_DWORD *)this + 234);
    v207[4] = *(_DWORD *)&v207[8] == 2;
    v140 = *((_QWORD *)this + 18);
    v174 = *((_QWORD *)this + 19);
    if (v140 != v174)
    {
      v173 = j;
      do
      {
        v141 = 0;
        v204 = 0u;
        v205 = 0u;
        v202 = 0u;
        v203 = 0u;
        v200 = 0u;
        v201 = 0u;
        v198 = 0u;
        v199 = 0u;
        memset(v197, 0, sizeof(v197));
        LODWORD(v206) = 1;
        do
        {
          *((_QWORD *)v197 + v141) = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140, v141);
          ++v141;
        }
        while (v141 != 3);
        *((_QWORD *)&v197[1] + 1) = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 128, 0, 0);
        *(_QWORD *)&v198 = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 128, 0, 1);
        *((_QWORD *)&v198 + 1) = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 128, 0, 2);
        *(_QWORD *)&v199 = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 128, 1, 1);
        *((_QWORD *)&v199 + 1) = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 128, 1, 2);
        *(_QWORD *)&v200 = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 128, 2, 2);
        v142 = *(_DWORD *)(v140 + 136);
        if (v142 != *(_DWORD *)(v140 + 140))
          __assert_rtn("Trace", "cnmatrixbase.h", 4977, "A.NumRows() == A.NumCols()");
        if (v142 < 1)
        {
          v144 = 0.0;
        }
        else
        {
          v143 = 0;
          v144 = 0.0;
          do
          {
            v144 = v144 + cnmatrix::CNMatrixBase<double>::operator()<int,int>(v140 + 128, v143, v143);
            ++v143;
          }
          while (v142 != v143);
        }
        v145 = *(_QWORD *)(v140 + 352);
        *((_QWORD *)&v200 + 1) = sqrt(v144);
        *(_QWORD *)&v201 = v145;
        LODWORD(v206) = *(_DWORD *)(v140 + 360);
        v178 = 0x100000003;
        __p = &off_24EC111A0;
        v177 = xmmword_223118D20;
        v179 = v180;
        cnmatrix::Subtract<double>(v140 + 368, v175, (uint64_t)&__p);
        v188 = 0x100000003;
        v186 = &off_24EC111A0;
        v187 = xmmword_223118D20;
        v189 = v190;
        buf[3] = 0x100000134;
        buf[0] = &off_24EC11270;
        *(_OWORD *)&buf[1] = xmmword_223118D50;
        *(_QWORD *)&v232 = (char *)&v232 + 8;
        v183 = 0x100000003;
        v181 = &off_24EC111A0;
        v182 = xmmword_223118D20;
        v184 = v185;
        cnmatrix::Norm<double>((uint64_t)&__p, (uint64_t)&v186, (uint64_t)buf, (uint64_t)&v181, "2");
        if (v146 != 0.0)
        {
          v195 = 0;
          v194 = 0;
          v196 = 0;
          memset(v193, 0, sizeof(v193));
          memset(v192, 0, sizeof(v192));
          std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(&v194, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)this + 85) - *((_QWORD *)this + 84)) >> 4));
          cnmatrix::CNMatrixBase<double>::operator=(v140 + 368, v175);
          buf[3] = 0x100000003;
          buf[0] = &off_24EC111A0;
          *(_OWORD *)&buf[1] = xmmword_223118D20;
          *(_QWORD *)&v232 = (char *)&v232 + 8;
          cnmatrix::Subtract<double>(v140, v175, (uint64_t)buf);
          RoseSyntheticApertureFiltering::pos2rangeThPhi((uint64_t)buf, (uint64_t)v191);
          cnmatrix::CNMatrixBase<double>::operator=(v140 + 64, (uint64_t)v191);
          RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatchAlt(v147, (uint64_t)v191, v175, (double **)this + 84, v192, &v194, v193);
          v188 = 0x300000003;
          v186 = &off_24EC11458;
          v187 = xmmword_223118FC0;
          v189 = v190;
          cnmatrix::FastResize<double>(&v186, 3, 3);
          cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v186, 0.0);
          v148 = v194;
          v149 = v195;
          while (v148 != v149)
          {
            v183 = 0x300000003;
            v181 = &off_24EC11458;
            v182 = xmmword_223118FC0;
            v184 = v185;
            cnmatrix::Multiply<double>(v148 + 72, v148 + 8, (uint64_t)&v181);
            buf[3] = 0x300000003;
            buf[0] = &off_24EC11458;
            *(_OWORD *)&buf[1] = xmmword_223118FC0;
            *(_QWORD *)&v232 = (char *)&v232 + 8;
            cnmatrix::Add<double>((uint64_t)&v186, (uint64_t)&v181, (uint64_t)buf);
            cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v186, (uint64_t)buf);
            v148 += 136;
          }
          cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)&v181, (uint64_t)&v186);
          v178 = 0x300000003;
          __p = &off_24EC11458;
          v177 = xmmword_223118FC0;
          v179 = v180;
          v228 = 0x100000003;
          v226 = &off_24EC11578;
          v227 = xmmword_223118D20;
          v229 = &v230;
          buf[3] = 0x10000000CLL;
          buf[0] = &off_24EC11600;
          *(_OWORD *)&buf[1] = xmmword_223119010;
          *(_QWORD *)&v232 = (char *)&v232 + 8;
          cnmatrix::Inv<double>((uint64_t)&v181, (uint64_t)&v226, (uint64_t)buf, (uint64_t)&__p);
          cnmatrix::CNMatrixBase<double>::operator=(v140 + 240, (uint64_t)&__p);
          buf[0] = v192;
          std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          buf[0] = v193;
          std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          buf[0] = &v194;
          std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        }
        *((_QWORD *)&v201 + 1) = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 64, 0);
        *(_QWORD *)&v202 = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 64, 1u);
        *((_QWORD *)&v202 + 1) = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 64, 2u);
        *(_QWORD *)&v203 = sqrt(*(double *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 240, 0, 0));
        *((_QWORD *)&v203 + 1) = sqrt(*(double *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 240, 1, 1));
        v150 = 0;
        *(_QWORD *)&v204 = sqrt(*(double *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 240, 2, 2));
        do
        {
          *((_QWORD *)&v204 + v150 + 1) = *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(v140 + 368, v150);
          ++v150;
        }
        while (v150 != 3);
        v151 = (_OWORD *)*((_QWORD *)&__src + 1);
        if (*((_QWORD *)&__src + 1) >= (unint64_t)v209)
        {
          v153 = (_OWORD *)__src;
          v154 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)&__src + 1) - __src) >> 3);
          v155 = v154 + 1;
          if (v154 + 1 > 0x186186186186186)
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          if (0x9E79E79E79E79E7ALL * ((uint64_t)(v209 - __src) >> 3) > v155)
            v155 = 0x9E79E79E79E79E7ALL * ((uint64_t)(v209 - __src) >> 3);
          if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(v209 - __src) >> 3) >= 0xC30C30C30C30C3)
            v156 = 0x186186186186186;
          else
            v156 = v155;
          if (v156)
          {
            v157 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>((uint64_t)&v209, v156);
            v151 = (_OWORD *)*((_QWORD *)&__src + 1);
            v153 = (_OWORD *)__src;
          }
          else
          {
            v157 = 0;
          }
          v158 = &v157[168 * v154];
          *((_OWORD *)v158 + 7) = v203;
          *((_OWORD *)v158 + 8) = v204;
          *((_OWORD *)v158 + 9) = v205;
          *((_QWORD *)v158 + 20) = v206;
          *((_OWORD *)v158 + 3) = v199;
          *((_OWORD *)v158 + 4) = v200;
          *((_OWORD *)v158 + 5) = v201;
          *((_OWORD *)v158 + 6) = v202;
          *(_OWORD *)v158 = v197[0];
          *((_OWORD *)v158 + 1) = v197[1];
          *((_OWORD *)v158 + 2) = v198;
          if (v151 == v153)
          {
            v168 = &v157[168 * v154];
          }
          else
          {
            v159 = &v157[168 * v154];
            do
            {
              v160 = *(_OWORD *)((char *)v151 - 168);
              v161 = *(_OWORD *)((char *)v151 - 152);
              *(_OWORD *)(v159 - 136) = *(_OWORD *)((char *)v151 - 136);
              *(_OWORD *)(v159 - 152) = v161;
              *(_OWORD *)(v159 - 168) = v160;
              v162 = *(_OWORD *)((char *)v151 - 120);
              v163 = *(_OWORD *)((char *)v151 - 104);
              v164 = *(_OWORD *)((char *)v151 - 88);
              *(_OWORD *)(v159 - 72) = *(_OWORD *)((char *)v151 - 72);
              *(_OWORD *)(v159 - 88) = v164;
              *(_OWORD *)(v159 - 104) = v163;
              *(_OWORD *)(v159 - 120) = v162;
              v165 = *(_OWORD *)((char *)v151 - 56);
              v166 = *(_OWORD *)((char *)v151 - 40);
              v167 = *(_OWORD *)((char *)v151 - 24);
              v168 = v159 - 168;
              *((_DWORD *)v159 - 2) = *((_DWORD *)v151 - 2);
              *(_OWORD *)(v159 - 24) = v167;
              *(_OWORD *)(v159 - 40) = v166;
              *(_OWORD *)(v159 - 56) = v165;
              v151 = (_OWORD *)((char *)v151 - 168);
              v159 -= 168;
            }
            while (v151 != v153);
          }
          v152 = v158 + 168;
          *(_QWORD *)&__src = v168;
          *((_QWORD *)&__src + 1) = v158 + 168;
          *(_QWORD *)&v209 = &v157[168 * v156];
          j = v173;
          if (v153)
            operator delete(v153);
        }
        else
        {
          *(_OWORD *)(*((_QWORD *)&__src + 1) + 112) = v203;
          v151[8] = v204;
          v151[9] = v205;
          *((_QWORD *)v151 + 20) = v206;
          v151[3] = v199;
          v151[4] = v200;
          v151[5] = v201;
          v151[6] = v202;
          *v151 = v197[0];
          v151[1] = v197[1];
          v151[2] = v198;
          v152 = (char *)v151 + 168;
          j = v173;
        }
        *((_QWORD *)&__src + 1) = v152;
        v169 = *((_QWORD *)this + 82);
        if (v169 == *((_QWORD *)this + 79))
          v169 = *((_QWORD *)this + 80);
        *((_QWORD *)&v209 + 1) = *(_QWORD *)(v169 - 8);
        v140 += 432;
      }
      while (v140 != v174);
    }
  }
LABEL_157:
  *(_QWORD *)this = *(_QWORD *)v207;
  *(_QWORD *)((char *)this + 5) = *(_QWORD *)&v207[5];
  if (v207 != (_BYTE *)this)
    std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>((char *)this + 16, (char *)__src, *((uint64_t *)&__src + 1), 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)&__src + 1) - __src) >> 3));
  *((_QWORD *)this + 5) = *((_QWORD *)&v209 + 1);
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getBatchOrAoASolution(this, j);
  if ((_QWORD)__src)
  {
    *((_QWORD *)&__src + 1) = __src;
    operator delete((void *)__src);
  }
}

void sub_2230F7248(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 680) = v2;
  _Unwind_Resume(a1);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::resetFilter(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  NSObject *v1;
  uint8_t v2[16];

  *((_QWORD *)this + 75) = *((_QWORD *)this + 73);
  *((_QWORD *)this + 78) = 0;
  *(_DWORD *)((char *)this + 930) = 65792;
  *((_WORD *)this + 470) = 0;
  *((_DWORD *)this + 234) = 0;
  v1 = *((_QWORD *)this + 56);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2230E5000, v1, OS_LOG_TYPE_DEFAULT, "Batch filter is reset", v2, 2u);
  }
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkMotionStateAndObservability(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unsigned int v22;
  double v23;
  double *v24;
  double v25;
  uint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  NSObject *v38;
  int v39;
  const char *v40;
  const char *v41;
  int v42;
  _BYTE *v43;
  uint64_t (**v44)();
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  _BYTE v49[32];
  uint64_t (**v50)();
  __int128 v51;
  uint64_t v52;
  _BYTE *v53;
  _BYTE v54[32];
  uint64_t (**v55)();
  __int128 v56;
  uint64_t v57;
  _BYTE *v58;
  _BYTE v59[32];
  uint64_t (**v60)();
  __int128 v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (**v65)();
  __int128 v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  _BYTE v73[24];
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  void **buf[3];
  uint64_t v78;
  _QWORD *v79;
  _QWORD v80[229];

  v80[226] = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 85);
  v3 = *((_QWORD *)this + 84);
  v4 = 0x6DB6DB6DB6DB6DB7 * ((v2 - v3) >> 4);
  v70 = 0;
  v71 = 0;
  v72 = 0;
  std::vector<cnmatrix::CNMatrix<2u,1u,double>>::reserve(&v70, v4);
  v67 = 0x100000002;
  v65 = &off_24EC11690;
  v66 = xmmword_223119020;
  v68 = &v69;
  v5 = *((_QWORD *)this + 84);
  v6 = *((_QWORD *)this + 85);
  while (v5 != v6)
  {
    v7 = cnmatrix::CNMatrixBase<double>::operator()(v5 + 40, 2u);
    *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v65, 0) = v7;
    v8 = cnmatrix::CNMatrixBase<double>::operator()(v5 + 40, 0);
    *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v65, 1u) = v8;
    v9 = v71;
    if (v71 >= v72)
    {
      v10 = std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__push_back_slow_path<cnmatrix::CNMatrix<2u,1u,double> const&>(&v70, (uint64_t)&v65);
    }
    else
    {
      cnmatrix::CNMatrix<2u,1u,double>::CNMatrix(v71, (uint64_t)&v65);
      v10 = v9 + 56;
    }
    v71 = v10;
    v5 += 112;
  }
  v62 = 0x100000002;
  v60 = &off_24EC11690;
  v61 = xmmword_223119020;
  v63 = &v64;
  cnmatrix::FastResize<double>(&v60, 2, 1);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v60, 0.0);
  v11 = v70;
  for (i = v71; v11 != i; v11 += 56)
  {
    v78 = 0x100000002;
    buf[0] = (void **)&off_24EC11690;
    *(_OWORD *)&buf[1] = xmmword_223119020;
    v79 = v80;
    cnmatrix::Add<double>((uint64_t)&v60, v11, (uint64_t)buf);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v60, (uint64_t)buf);
  }
  v78 = 0x100000002;
  buf[0] = (void **)&off_24EC11690;
  *(_OWORD *)&buf[1] = xmmword_223119020;
  v79 = v80;
  cnmatrix::Multiply<double>((uint64_t)&v60, (uint64_t)buf, 1.0 / (double)v4);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v60, (uint64_t)buf);
  if (v2 == v3)
  {
    v17 = *((unsigned __int8 *)this + 931);
    goto LABEL_25;
  }
  v13 = 0;
  if (v4 <= 1)
    v14 = 1;
  else
    v14 = 0x6DB6DB6DB6DB6DB7 * ((v2 - v3) >> 4);
  v15 = 0.0;
  do
  {
    v78 = 0x100000002;
    buf[0] = (void **)&off_24EC11690;
    *(_OWORD *)&buf[1] = xmmword_223119020;
    v79 = v80;
    cnmatrix::Subtract<double>(v70 + v13, (uint64_t)&v60, (uint64_t)buf);
    cnmatrix::CNMatrixBase<double>::operator=(v70 + v13, (uint64_t)buf);
    if (*((_BYTE *)this + 931))
    {
      v57 = 0x100000002;
      v55 = &off_24EC11690;
      v56 = xmmword_223119020;
      v58 = v59;
      v78 = 0x1000000E1;
      buf[0] = (void **)&off_24EC116D8;
      *(_OWORD *)&buf[1] = xmmword_223119030;
      v79 = v80;
      v52 = 0x100000002;
      v50 = &off_24EC11690;
      v51 = xmmword_223119020;
      v53 = v54;
      cnmatrix::Norm<double>(v70 + v13, (uint64_t)&v55, (uint64_t)buf, (uint64_t)&v50, "2");
      if (v16 > v15)
        v15 = v16;
    }
    v13 += 56;
    --v14;
  }
  while (v14);
  v17 = *((unsigned __int8 *)this + 931);
  if (!*((_BYTE *)this + 931) || v15 < 0.3)
  {
LABEL_25:
    if (!*((_BYTE *)this + 932) || v17)
      goto LABEL_60;
LABEL_27:
    v43 = (char *)this + 932;
    v78 = 0x200000002;
    buf[0] = (void **)&off_24EC11720;
    *(_OWORD *)&buf[1] = xmmword_223119040;
    v79 = v80;
    cnmatrix::FastResize<double>(buf, 2, 2);
    cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)buf, 0.0);
    v19 = v70;
    v20 = v71;
    if (v70 != v71)
    {
      while (1)
      {
        v22 = *(_DWORD *)(v19 + 8);
        v21 = *(_DWORD *)(v19 + 12);
        v47 = 0x200000001;
        v48 = 0;
        v45 = 0;
        v46 = 0;
        v44 = &off_24EC11768;
        if (v21 > 1)
          break;
        if (v22 >= 3)
        {
          v39 = 423;
          v40 = "this->max_num_cols_ >= num_cols";
LABEL_63:
          __assert_rtn("SetMatrixSize", "cnmatrixbase.h", v39, v40);
        }
        v45 = __PAIR64__(v22, v21);
        LODWORD(v46) = v22 * v21;
        HIDWORD(v46) = v21;
        v48 = v49;
        cnmatrix::Transpose<double>(v19, &v44);
        v52 = 0x200000002;
        v50 = &off_24EC11720;
        v51 = xmmword_223119040;
        v53 = v54;
        cnmatrix::Multiply<double>(v19, (uint64_t)&v44, (uint64_t)&v50);
        v57 = 0x200000002;
        v55 = &off_24EC11720;
        v56 = xmmword_223119040;
        v58 = v59;
        cnmatrix::Add<double>((uint64_t)buf, (uint64_t)&v50, (uint64_t)&v55);
        cnmatrix::CNMatrixBase<double>::operator=((uint64_t)buf, (uint64_t)&v55);
        v19 += 56;
        if (v19 == v20)
          goto LABEL_31;
      }
      v39 = 422;
      v40 = "this->max_num_rows_ >= num_rows";
      goto LABEL_63;
    }
LABEL_31:
    v57 = 0x200000002;
    v55 = &off_24EC11720;
    v56 = xmmword_223119040;
    v58 = v59;
    v52 = 0x200000002;
    v50 = &off_24EC11720;
    v51 = xmmword_223119040;
    v53 = v54;
    cnmatrix::Eig<2u,2u,2u,2u,2u,2u,double>((uint64_t)buf, (uint64_t)&v55, (uint64_t)&v50);
    v23 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v50, 0, 0);
    v24 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v50, 1, 1);
    if (*v24 >= v23)
      v25 = v23;
    else
      v25 = *v24;
    v47 = 0x200000002;
    v44 = &off_24EC11720;
    if (DWORD1(v56) > 2)
    {
      v41 = "this->max_num_rows_ >= num_rows";
      v42 = 422;
    }
    else
    {
      if (v56 < 3)
      {
        v45 = __PAIR64__(v56, DWORD1(v56));
        LODWORD(v46) = v56 * DWORD1(v56);
        HIDWORD(v46) = DWORD1(v56);
        v48 = v49;
        cnmatrix::Transpose<double>((uint64_t)&v55, &v44);
        v26 = v70;
        v27 = v71;
        if (v70 == v71)
        {
          v35 = 0.0;
          v36 = 0.0;
        }
        else
        {
          v28 = 0.0;
          v29 = 0.0;
          v30 = 0.0;
          v31 = 0.0;
          do
          {
            v74 = 0x100000002;
            *(_QWORD *)v73 = &off_24EC11690;
            *(_OWORD *)&v73[8] = xmmword_223119020;
            v75 = &v76;
            cnmatrix::Multiply<double>((uint64_t)&v44, v26, (uint64_t)v73);
            v32 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v73, 0);
            v33 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v73, 1u);
            if (v32 < v31)
              v34 = v32;
            else
              v34 = v31;
            if (v32 > v30)
              v30 = v32;
            else
              v31 = v34;
            if (v33 <= v28)
            {
              if (v33 < v29)
                v29 = v33;
            }
            else
            {
              v28 = v33;
            }
            v26 += 56;
          }
          while (v26 != v27);
          v35 = v30 - v31;
          v36 = v28 - v29;
        }
        if (v36 >= v35)
          v37 = v35;
        else
          v37 = v36;
        if (v35 < v36)
          v35 = v36;
        *((double *)this + 78) = v35;
        if (v37 >= 0.3)
        {
          v38 = *((_QWORD *)this + 56);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v73 = 134218240;
            *(double *)&v73[4] = v25;
            *(_WORD *)&v73[12] = 2048;
            *(double *)&v73[14] = v37;
            _os_log_impl(&dword_2230E5000, v38, OS_LOG_TYPE_DEFAULT, "Batch filter problem is observable now: smallest eigenvalue is %f, smallest rectangular box dimension is %f m", v73, 0x16u);
          }
          *v43 = 0;
        }
        goto LABEL_60;
      }
      v41 = "this->max_num_cols_ >= num_cols";
      v42 = 423;
    }
    __assert_rtn("SetMatrixSize", "cnmatrixbase.h", v42, v41);
  }
  v18 = *((_QWORD *)this + 56);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 134217984;
    *(void ***)((char *)buf + 4) = *(void ***)&v15;
    _os_log_impl(&dword_2230E5000, v18, OS_LOG_TYPE_DEFAULT, "Enough user motion is detected: %f m - fStatic set to false", (uint8_t *)buf, 0xCu);
  }
  *((_BYTE *)this + 931) = 0;
  if (*((_BYTE *)this + 932))
    goto LABEL_27;
LABEL_60:
  buf[0] = (void **)&v70;
  std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__destroy_vector::operator()[abi:ne180100](buf);
}

void sub_2230F7B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  a15 = (void **)&a56;
  std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__destroy_vector::operator()[abi:ne180100](&a15);
  _Unwind_Resume(a1);
}

BOOL RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  double v7;
  double v8;
  _BOOL8 v9;
  uint64_t i;
  double v11;
  unsigned int j;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  BOOL v36;
  unint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  uint64_t v43;
  char **__ptr32 *v44;
  NSObject *v45;
  uint64_t v46;
  double v47;
  double *v48;
  double v49;
  unint64_t v50;
  uint64_t v51;
  double *v52;
  double v53;
  double v54;
  double *v55;
  double *v56;
  _BOOL4 v57;
  unint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  double v69;
  int v70;
  int v71;
  double v72;
  unint64_t v73;
  _QWORD *v74;
  _QWORD *v75;
  unint64_t v76;
  uint64_t v77;
  double v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  BOOL v82;
  uint64_t v83;
  double v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  _QWORD *v88;
  double v89;
  uint64_t v90;
  double v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t k;
  NSObject *v97;
  uint64_t v98;
  _QWORD *v99;
  _QWORD *v100;
  uint64_t *v101;
  _BYTE v102[64];
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t (**v106)();
  __int128 v107;
  uint64_t v108;
  _BYTE *v109;
  _BYTE v110[72];
  uint64_t (**v111)();
  __int128 v112;
  uint64_t v113;
  _BYTE *v114;
  _BYTE v115[72];
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t (**v119)();
  __int128 v120;
  uint64_t v121;
  _BYTE *v122;
  _BYTE v123[24];
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  char *v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t (**v133)();
  __int128 v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  _BYTE buf[24];
  uint64_t v139;
  _QWORD *v140;
  _QWORD v141[311];

  v141[308] = *MEMORY[0x24BDAC8D0];
  v1 = *((_QWORD *)this + 85);
  v2 = *((_QWORD *)this + 84);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v1 - v2) >> 4)) >= 4)
  {
    v131 = 0;
    v130 = 0;
    v132 = 0;
    v4 = *((_QWORD *)this + 18);
    v101 = (uint64_t *)((char *)this + 144);
    v5 = *((_QWORD *)this + 19);
    if (*((_BYTE *)this + 933))
      v6 = 0;
    else
      v6 = v4 == v5;
    if (v6)
    {
      if (v2 != v1)
      {
        for (i = v2 + 112; i != v1; i += 112)
        {
          if (*(double *)(i + 8) < *(double *)(v2 + 8))
            v2 = i;
        }
      }
      if (*(double *)(v2 + 8) >= 0.5)
        v11 = *(double *)(v2 + 8);
      else
        v11 = 0.5;
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)buf, v2 + 40);
      for (j = 0; j != 3; ++j)
      {
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v111, (uint64_t)buf);
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v106, (uint64_t)buf);
        v13 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v111, j);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v111, j) = v11 + v13;
        v14 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v106, j);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v106, j) = v14 - v11;
        std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v130, (uint64_t)&v111);
        std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v130, (uint64_t)&v106);
      }
    }
    else
    {
      if (v4 != v5)
      {
        do
        {
          std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v130, v4);
          v4 += 432;
        }
        while (v4 != v5);
        v5 = *v101;
      }
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)buf, v5);
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v111, (uint64_t)buf);
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v106, (uint64_t)buf);
      v7 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v111, 1u);
      *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v111, 1u) = v7 + 3.0;
      v8 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v106, 1u);
      *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v106, 1u) = v8 + -3.0;
      std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v130, (uint64_t)&v111);
      std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](&v130, (uint64_t)&v106);
    }
    v128 = 0;
    v127 = 0;
    v129 = 0;
    v15 = v130;
    v16 = v131;
    if (v130 == v131)
    {
      v20 = 0;
      v21 = 0;
    }
    else
    {
      do
      {
        v111 = 0;
        v112 = 0uLL;
        RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::initializeFilterWithGuess((uint64_t)this, v15, (uint64_t)this + 672, (double **)&v111, (uint64_t)buf);
        v17 = v128;
        if ((unint64_t)v128 >= v129)
        {
          v18 = (char *)std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult>(&v127, (uint64_t)buf);
        }
        else
        {
          std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult>((uint64_t)&v129, (uint64_t)v128, (uint64_t)buf);
          v18 = v17 + 376;
        }
        v128 = v18;
        v141[26] = off_24EC111F8;
        v141[12] = off_24EC111F8;
        v141[4] = off_24EC111F8;
        *(_QWORD *)&buf[8] = off_24EC111F8;
        v106 = (uint64_t (**)())&v111;
        std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v106);
        v15 += 64;
      }
      while (v15 != v16);
      v19 = v127;
      v20 = v128;
      while (1)
      {
        if ((char *)v19 == v128)
        {
          v21 = v128;
          goto LABEL_41;
        }
        if (!*(_BYTE *)v19)
          break;
        v19 += 376;
      }
      if ((char *)v19 == v128 || (char *)(v19 + 376) == v128)
      {
        v21 = (char *)v19;
      }
      else
      {
        v21 = (char *)v19;
        do
        {
          if (*(_BYTE *)(v19 + 376))
          {
            *v21 = *(_BYTE *)(v19 + 376);
            cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v21 + 8), v19 + 384);
            cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v21 + 72), v19 + 448);
            cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v21 + 136), v19 + 512);
            cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v21 + 248), v19 + 624);
            v22 = *(_QWORD *)(v19 + 736);
            *((_DWORD *)v21 + 92) = *(_DWORD *)(v19 + 744);
            *((_QWORD *)v21 + 45) = v22;
            v21 += 376;
          }
          v23 = (char *)(v19 + 752);
          v19 += 376;
        }
        while (v23 != v20);
        v20 = v128;
      }
    }
LABEL_41:
    std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::erase((uint64_t)&v127, (uint64_t)v21, (uint64_t)v20);
    v24 = 126 - 2 * __clz(0x51B3BEA3677D46CFLL * ((uint64_t)&v128[-v127] >> 3));
    if (v128 == (char *)v127)
      v25 = 0;
    else
      v25 = v24;
    std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(v127, v128, v25, 1);
    if ((char *)v127 == v128)
      goto LABEL_159;
    *(_QWORD *)buf = sqrt(*(double *)(v127 + 360)/ ((double)(unint64_t)(0x6DB6DB6DB6DB6DB7* ((uint64_t)(*((_QWORD *)this + 85) - *((_QWORD *)this + 84)) >> 4))+ -3.0));
    boost::circular_buffer<double,std::allocator<double>>::push_back_impl<double &&>((_QWORD *)this + 79, buf);
    v26 = *((_QWORD *)this + 82);
    v27 = *((_QWORD *)this + 79);
    v28 = v26;
    if (v26 == v27)
      v28 = *((_QWORD *)this + 80);
    v29 = *((double *)this + 123);
    if (*(double *)(v28 - 8) > v29)
    {
      v45 = *((_QWORD *)this + 56);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        if (v26 == v27)
          v26 = *((_QWORD *)this + 80);
        v46 = *(_QWORD *)(v26 - 8);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v46;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v29;
        _os_log_impl(&dword_2230E5000, v45, OS_LOG_TYPE_DEFAULT, "Batch filter has detected an issue with the measurements - rms normalized error (%f) is above the threshold (%f)", buf, 0x16u);
      }
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::reinitFilter(this);
      v9 = 0;
      *((_BYTE *)this + 934) = 1;
      goto LABEL_160;
    }
    v125 = 0;
    v124 = 0;
    v126 = 0;
    v30 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v124, v127);
    v31 = v30;
    v32 = v127;
    v125 = v30;
    if ((unint64_t)(0x51B3BEA3677D46CFLL * ((uint64_t)&v128[-v127] >> 3)) >= 2)
    {
      v33 = 1;
      v34 = v30;
      do
      {
        if (v34 == v124)
        {
          v37 = v34;
        }
        else
        {
          v35 = 0;
          v36 = 1;
          v34 = v124;
          v37 = v31;
          do
          {
            v38 = v34 + 376 * v35 + 8;
            while (!v36)
            {
              v36 = 0;
              ++v35;
              v38 += 376;
              if (0x51B3BEA3677D46CFLL * ((uint64_t)(v37 - v34) >> 3) <= v35)
              {
                v32 = v127;
                v31 = v37;
                goto LABEL_65;
              }
            }
            v121 = 0x100000003;
            v119 = &off_24EC111A0;
            v120 = xmmword_223118D20;
            v122 = v123;
            cnmatrix::Subtract<double>(v127 + 376 * v33 + 8, v38, (uint64_t)&v119);
            v113 = 0x100000003;
            v111 = &off_24EC111A0;
            v112 = xmmword_223118D20;
            v114 = v115;
            v139 = 0x100000134;
            *(_QWORD *)buf = &off_24EC11270;
            *(_OWORD *)&buf[8] = xmmword_223118D50;
            v140 = v141;
            v108 = 0x100000003;
            v106 = &off_24EC111A0;
            v107 = xmmword_223118D20;
            v109 = v110;
            cnmatrix::Norm<double>((uint64_t)&v119, (uint64_t)&v111, (uint64_t)buf, (uint64_t)&v106, "2");
            v36 = v39 > 0.1;
            v37 = v125;
            v34 = v124;
            ++v35;
          }
          while (0x51B3BEA3677D46CFLL * ((v125 - v124) >> 3) > v35);
          v32 = v127;
          v31 = v125;
          if (v39 <= 0.1)
            goto LABEL_65;
        }
        if (exp(*(double *)(v34 + 360) - *(double *)(v32 + 376 * v33 + 360)) > 0.01)
        {
          if (v37 >= v126)
          {
            v31 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v124, v32 + 376 * v33);
          }
          else
          {
            std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)&v126, v37, v32 + 376 * v33);
            v31 = v37 + 376;
          }
          v125 = v31;
          v32 = v127;
          v37 = v31;
        }
LABEL_65:
        ++v33;
        v34 = v37;
      }
      while (0x51B3BEA3677D46CFLL * ((uint64_t)&v128[-v32] >> 3) > v33);
    }
    v40 = v124;
    if ((unint64_t)(0x51B3BEA3677D46CFLL * ((v31 - v124) >> 3)) <= 1)
    {
LABEL_84:
      v44 = &off_223118000;
    }
    else
    {
      v41 = exp(-*(double *)(v124 + 360));
      v42 = 0.0;
      if (v40 == v31)
      {
        v44 = &off_223118000;
      }
      else
      {
        v43 = v40;
        v44 = &off_223118000;
        do
        {
          v42 = v42 + exp(-*(double *)(v43 + 360));
          v43 += 376;
        }
        while (v43 != v31);
      }
      v47 = v41 / v42;
      if (v47 < 0.9)
      {
        v48 = (double *)cnmatrix::CNMatrixBase<double>::operator()(v40 + 72, 1u);
        v31 = v125;
        v40 = v124;
        if ((unint64_t)(0x51B3BEA3677D46CFLL * ((v125 - v124) >> 3)) >= 2)
        {
          v49 = *v48;
          v50 = 1;
          v51 = 448;
          while (1)
          {
            v52 = (double *)cnmatrix::CNMatrixBase<double>::operator()(v40 + v51, 1u);
            v53 = fmod(*v52 - v49 + 3.14159265, 6.28318531);
            if (v53 < 0.0)
              v53 = v53 + 6.28318531;
            v54 = fabs(v53 + -3.14159265);
            if (v54 > 0.392699082)
              break;
            ++v50;
            v31 = v125;
            v40 = v124;
            v51 += 376;
            if (0x51B3BEA3677D46CFLL * ((v125 - v124) >> 3) <= v50)
              goto LABEL_84;
          }
          v97 = *((_QWORD *)this + 56);
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            *(double *)&buf[4] = v47;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v54;
            _os_log_impl(&dword_2230E5000, v97, OS_LOG_TYPE_DEFAULT, "Batch filter clearing solutions since the best one has a low weight (%f) and the horizontal angle difference to a secondary solution is too high (%f)", buf, 0x16u);
          }
          v98 = v124;
          v44 = &off_223118000;
          if (v125 != v124)
          {
            v99 = (_QWORD *)(v125 - 368);
            do
            {
              v99[30] = off_24EC111F8;
              v99[16] = off_24EC111F8;
              v99[8] = off_24EC111F8;
              *v99 = off_24EC111F8;
              v100 = v99 - 1;
              v99 -= 47;
            }
            while (v100 != (_QWORD *)v98);
          }
          v62 = 0;
          v61 = 0;
          v125 = v98;
          v116 = 0;
          v117 = 0;
          v118 = 0;
LABEL_108:
          v63 = 126 - 2 * __clz(0x51B3BEA3677D46CFLL * ((v62 - v61) >> 3));
          if (v62 == v61)
            v64 = 0;
          else
            v64 = v63;
          std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(v61, v62, v64, 1);
          v65 = v116;
          if (v116 != v117)
          {
            v66 = xmmword_223118FC0;
            v67 = *((_QWORD *)v44 + 428);
            v68 = xmmword_223119010;
            do
            {
              v113 = 0x300000003;
              v111 = &off_24EC11458;
              v112 = v66;
              v114 = v115;
              v108 = v67;
              v106 = &off_24EC11578;
              v107 = xmmword_223118D20;
              v109 = v110;
              v139 = 0x10000000CLL;
              *(_QWORD *)buf = &off_24EC11600;
              *(_OWORD *)&buf[8] = v68;
              v140 = v141;
              cnmatrix::Inv<double>(v65 + 248, (uint64_t)&v106, (uint64_t)buf, (uint64_t)&v111);
              v69 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v111, 1, 1);
              v108 = 0x300000003;
              v106 = &off_24EC11458;
              v107 = xmmword_223118FC0;
              v109 = v110;
              v121 = v67;
              v119 = &off_24EC11578;
              v120 = xmmword_223118D20;
              v122 = v123;
              v139 = 0x10000000CLL;
              *(_QWORD *)buf = &off_24EC11600;
              *(_OWORD *)&buf[8] = xmmword_223119010;
              v140 = v141;
              cnmatrix::Inv<double>(v65 + 136, (uint64_t)&v119, (uint64_t)buf, (uint64_t)&v106);
              v70 = v107;
              if ((_DWORD)v107 != DWORD1(v107))
                __assert_rtn("Trace", "cnmatrixbase.h", 4977, "A.NumRows() == A.NumCols()");
              if ((int)v107 < 1)
              {
                v72 = 0.0;
              }
              else
              {
                v71 = 0;
                v72 = 0.0;
                do
                {
                  v72 = v72 + cnmatrix::CNMatrixBase<double>::operator()<int,int>((uint64_t)&v106, v71, v71);
                  ++v71;
                }
                while (v70 != v71);
              }
              if (sqrt(v69) * 180.0 / 3.14159265 <= *((double *)this + 122) || v72 <= *((double *)this + 121))
              {
                v65 += 376;
                v73 = v117;
                v68 = xmmword_223119010;
                v66 = xmmword_223118FC0;
              }
              else
              {
                std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *>((uint64_t)buf, v65 + 376, v117, v65);
                v68 = xmmword_223119010;
                v66 = xmmword_223118FC0;
                if (v117 != v73)
                {
                  v74 = (_QWORD *)(v117 - 368);
                  do
                  {
                    v74[30] = off_24EC111F8;
                    v74[16] = off_24EC111F8;
                    v74[8] = off_24EC111F8;
                    *v74 = off_24EC111F8;
                    v75 = v74 - 1;
                    v74 -= 47;
                  }
                  while (v75 != (_QWORD *)v73);
                }
                v117 = v73;
              }
            }
            while (v65 != v73);
            if (v116 != v73)
            {
              v103 = 0;
              v104 = 0;
              v105 = 0;
              v76 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v103, v116);
              v77 = v116;
              v78 = *(double *)(v116 + 360);
              v104 = v76;
              if ((unint64_t)(0x51B3BEA3677D46CFLL * ((uint64_t)(v117 - v116) >> 3)) >= 2)
              {
                v79 = 1;
                do
                {
                  v80 = v103;
                  if (v76 == v103)
                    goto LABEL_138;
                  v81 = 0;
                  v82 = 1;
                  do
                  {
                    v83 = v80 + 376 * v81 + 8;
                    while (!v82)
                    {
                      v82 = 0;
                      ++v81;
                      v83 += 376;
                      if (0x51B3BEA3677D46CFLL * ((uint64_t)(v76 - v80) >> 3) <= v81)
                        goto LABEL_142;
                    }
                    v121 = v67;
                    v119 = &off_24EC111A0;
                    v120 = xmmword_223118D20;
                    v122 = v123;
                    cnmatrix::Subtract<double>(v116 + 376 * v79 + 8, v83, (uint64_t)&v119);
                    v113 = v67;
                    v111 = &off_24EC111A0;
                    v112 = xmmword_223118D20;
                    v114 = v115;
                    v139 = 0x100000134;
                    *(_QWORD *)buf = &off_24EC11270;
                    *(_OWORD *)&buf[8] = xmmword_223118D50;
                    v140 = v141;
                    v108 = v67;
                    v106 = &off_24EC111A0;
                    v107 = xmmword_223118D20;
                    v109 = v110;
                    cnmatrix::Norm<double>((uint64_t)&v119, (uint64_t)&v111, (uint64_t)buf, (uint64_t)&v106, "2");
                    v82 = v84 > 0.1;
                    v80 = v103;
                    v76 = v104;
                    ++v81;
                  }
                  while (0x51B3BEA3677D46CFLL * ((uint64_t)(v104 - v103) >> 3) > v81);
                  v77 = v116;
                  if (v84 > 0.1)
                  {
LABEL_138:
                    v85 = v77 + 376 * v79;
                    if (v76 >= v105)
                    {
                      v76 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v103, v85);
                    }
                    else
                    {
                      std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)&v105, v76, v85);
                      v76 += 376;
                    }
                    v104 = v76;
LABEL_142:
                    v77 = v116;
                  }
                  ++v79;
                }
                while (0x51B3BEA3677D46CFLL * ((uint64_t)(v117 - v77) >> 3) > v79);
              }
              v86 = (_QWORD *)*((_QWORD *)this + 18);
              v87 = (_QWORD *)*((_QWORD *)this + 19);
              if (v87 != v86)
              {
                v88 = v87 - 24;
                do
                {
                  v88[16] = off_24EC111F8;
                  *v88 = off_24EC111F8;
                  *(v88 - 14) = off_24EC111F8;
                  *(v88 - 22) = off_24EC111F8;
                  *(v88 - 30) = off_24EC111F8;
                  v6 = v88 - 30 == v86;
                  v88 -= 54;
                }
                while (!v6);
              }
              *((_QWORD *)this + 19) = v86;
              if (v103 != v76)
              {
                v89 = 0.0;
                v90 = v103 + 248;
                do
                {
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)&v119, v90 - 240);
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v102, v90 - 176);
                  v113 = 0x300000003;
                  v111 = &off_24EC11458;
                  v112 = xmmword_223118FC0;
                  v114 = v115;
                  v108 = v67;
                  v106 = &off_24EC11578;
                  v107 = xmmword_223118D20;
                  v109 = v110;
                  v139 = 0x10000000CLL;
                  *(_QWORD *)buf = &off_24EC11600;
                  *(_OWORD *)&buf[8] = xmmword_223119010;
                  v140 = v141;
                  cnmatrix::Inv<double>(v90 - 112, (uint64_t)&v106, (uint64_t)buf, (uint64_t)&v111);
                  v108 = 0x300000003;
                  v106 = &off_24EC11458;
                  v107 = xmmword_223118FC0;
                  v109 = v110;
                  v135 = v67;
                  v133 = &off_24EC11578;
                  v134 = xmmword_223118D20;
                  v136 = &v137;
                  v139 = 0x10000000CLL;
                  *(_QWORD *)buf = &off_24EC11600;
                  *(_OWORD *)&buf[8] = xmmword_223119010;
                  v140 = v141;
                  cnmatrix::Inv<double>(v90, (uint64_t)&v133, (uint64_t)buf, (uint64_t)&v106);
                  v91 = exp(v78 - *(double *)(v90 + 112));
                  *(double *)buf = v91;
                  LODWORD(v133) = *(_DWORD *)(v90 + 120);
                  v92 = *((_QWORD *)this + 19);
                  if (v92 >= *((_QWORD *)this + 20))
                  {
                    v93 = std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__emplace_back_slow_path<cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,double &,RoseSyntheticApertureFiltering::BatchSolutionType const&,cnmatrix::CNMatrix<3u,1u,double>&>(v101, (uint64_t)&v119, (uint64_t)v102, (uint64_t)&v111, (uint64_t)&v106, (double *)buf, (int *)&v133, (uint64_t)this + 168);
                  }
                  else
                  {
                    std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__construct_one_at_end[abi:ne180100]<cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,double &,RoseSyntheticApertureFiltering::BatchSolutionType const&,cnmatrix::CNMatrix<3u,1u,double>&>((uint64_t)v101, (uint64_t)&v119, (uint64_t)v102, (uint64_t)&v111, (uint64_t)&v106, (double *)buf, (int *)&v133, (uint64_t)this + 168);
                    v93 = v92 + 432;
                  }
                  *((_QWORD *)this + 19) = v93;
                  v89 = v89 + v91;
                  v94 = v90 + 128;
                  v90 += 376;
                }
                while (v94 != v76);
                for (k = *v101; k != v93; k += 432)
                  *(double *)(k + 352) = *(double *)(k + 352) / v89;
              }
              *(_QWORD *)buf = &v103;
              std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
            }
          }
          *(_QWORD *)buf = &v116;
          std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          *(_QWORD *)buf = &v124;
          std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
LABEL_159:
          v9 = *((_QWORD *)this + 19) != *((_QWORD *)this + 18);
LABEL_160:
          *(_QWORD *)buf = &v127;
          std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          *(_QWORD *)buf = &v130;
          std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          return v9;
        }
      }
    }
    v116 = 0;
    v117 = 0;
    v118 = 0;
    if (v40 == v31)
    {
      v62 = 0;
      v61 = 0;
      goto LABEL_108;
    }
    while (1)
    {
      RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoVBatch(v40 + 8, (uint64_t)this + 696, (uint64_t *)&v111);
      if (v111 == (uint64_t (**)())v112)
      {
        v58 = v117;
        if (v117 >= v118)
        {
          v60 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v116, v40);
          goto LABEL_105;
        }
      }
      else
      {
        RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::initializeFilterWithGuess((uint64_t)this, v40 + 8, (uint64_t)this + 672, (double **)&v111, (uint64_t)buf);
        v55 = (double *)v111;
        v56 = (double *)v112;
        v57 = 1;
        while (v55 != v56)
        {
          v57 = v57
             && RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoV((uint64_t)&buf[8], (uint64_t)v55);
          v55 += 26;
        }
        v58 = v117;
        if (v57 && buf[0])
        {
          if (v117 >= v118)
          {
            v59 = buf;
LABEL_104:
            v60 = std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(&v116, (uint64_t)v59);
            goto LABEL_105;
          }
          std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)&v118, v117, (uint64_t)buf);
          goto LABEL_101;
        }
        v59 = (_BYTE *)v40;
        if (v117 >= v118)
          goto LABEL_104;
      }
      std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)&v118, v117, v40);
LABEL_101:
      v60 = v58 + 376;
LABEL_105:
      v117 = v60;
      *(_QWORD *)buf = &v111;
      std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      v40 += 376;
      if (v40 == v31)
      {
        v61 = (char *)v116;
        v62 = (char *)v117;
        v44 = &off_223118000;
        goto LABEL_108;
      }
    }
  }
  return 0;
}

void sub_2230F8DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void **a69;

  a69 = (void **)&STACK[0x220];
  std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100](&a69);
  a69 = (void **)&STACK[0x238];
  std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100](&a69);
  a69 = (void **)&STACK[0x250];
  std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__destroy_vector::operator()[abi:ne180100](&a69);
  _Unwind_Resume(a1);
}

void std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void *__p;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xF0F0F0F0F0F0F0F1 * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x1E1E1E1E1E1E1E2)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v13 = v3;
    __p = std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>>(v3, a2);
    v10 = (char *)__p + v5;
    v11 = (char *)__p + v5;
    v12 = (char *)__p + 136 * v6;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__swap_out_circular_buffer(a1, &__p);
    v7 = v10;
    v8 = v11;
    if (v11 != v10)
    {
      do
      {
        *((_QWORD *)v8 - 8) = off_24EC111F8;
        *((_QWORD *)v8 - 16) = off_24EC111F8;
        v8 -= 136;
      }
      while (v8 != v7);
      v11 = v7;
    }
    if (__p)
      operator delete(__p);
  }
}

uint64_t RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatchAlt(uint64_t a1, uint64_t a2, uint64_t a3, double **a4, double **a5, uint64_t *a6, uint64_t *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  double *v16;
  double *v17;
  __int128 v18;
  double v19;
  double v20;
  double v21;
  double *v22;
  double v23;
  unsigned int v24;
  double v25;
  unint64_t v26;
  double *v27;
  double *v28;
  double v29;
  double v30;
  double *v31;
  double v32;
  double v33;
  double v34;
  int v35;
  double v36;
  double v37;
  unint64_t v38;
  double **v39;
  uint64_t (**v42)();
  __int128 v43;
  uint64_t v44;
  _BYTE *v45;
  _BYTE v46[48];
  uint64_t (**v47)();
  __int128 v48;
  uint64_t v49;
  _BYTE *v50;
  _BYTE v51[48];
  double v52;
  uint64_t (**v53)();
  __int128 v54;
  uint64_t v55;
  _BYTE *v56;
  _BYTE v57[48];
  uint64_t (**v58)();
  __int128 v59;
  uint64_t v60;
  _BYTE *v61;
  _BYTE v62[16];
  double v63;
  uint64_t (**v64)();
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (**v69)();
  __int128 v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;

  v11 = *a6;
  v12 = a6[1];
  if (*a6 != v12)
  {
    do
    {
      *(_QWORD *)(v12 - 64) = off_24EC111F8;
      *(_QWORD *)(v12 - 128) = off_24EC111F8;
      v12 -= 136;
    }
    while (v12 != v11);
    a6[1] = v11;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(a6, 0x6DB6DB6DB6DB6DB7 * (((char *)a4[1] - (char *)*a4) >> 4));
  }
  v13 = *a7;
  v14 = a7[1];
  if (*a7 != v14)
  {
    do
    {
      *(_QWORD *)(v14 - 88) = off_24EC111F8;
      *(_QWORD *)(v14 - 176) = off_24EC111F8;
      v14 -= 192;
    }
    while (v14 != v13);
    a7[1] = v13;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve(a7, 0x4EC4EC4EC4EC4EC5 * (((char *)a5[1] - (char *)*a5) >> 4));
  }
  v39 = a5;
  v71 = 0x100000003;
  v69 = &off_24EC111A0;
  v70 = xmmword_223118D20;
  v72 = &v73;
  v66 = 0x300000003;
  v64 = &off_24EC11458;
  v65 = xmmword_223118FC0;
  v67 = &v68;
  result = (uint64_t)RoseSyntheticApertureFiltering::rhoThPhi2pos(a2, (uint64_t)&v69, (uint64_t)&v64);
  v16 = *a4;
  v17 = a4[1];
  if (*a4 != v17)
  {
    do
    {
      v60 = 0x100000001;
      v58 = &off_24EC11648;
      *(_QWORD *)&v18 = 0x100000001;
      *((_QWORD *)&v18 + 1) = 0x100000001;
      v59 = v18;
      v61 = v62;
      v55 = 0x300000001;
      v53 = &off_24EC114A0;
      v54 = xmmword_223119050;
      v56 = v57;
      v49 = 0x100000003;
      v47 = &off_24EC111A0;
      v48 = xmmword_223118D20;
      v50 = v51;
      cnmatrix::Subtract<double>((uint64_t)(v16 + 5), a3, (uint64_t)&v47);
      RoseSyntheticApertureFiltering::measModelRangeAlt(a2, (uint64_t)&v64, (uint64_t)&v69, (uint64_t)&v47, (uint64_t)&v58, (uint64_t)&v53);
      v20 = v16[3];
      v19 = v16[4];
      v63 = 0.0;
      v21 = v16[2];
      v22 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v58, 0);
      v23 = 1.0 / (v20 * v19);
      v63 = v21 - v23 * *v22;
      v49 = 0x300000001;
      v47 = &off_24EC114A0;
      v48 = xmmword_223119050;
      v50 = v51;
      cnmatrix::Multiply<double>((uint64_t)&v53, (uint64_t)&v47, v23);
      v24 = 0;
      v44 = 0x100000003;
      v42 = &off_24EC111A0;
      v43 = xmmword_223118D20;
      v45 = v46;
      do
      {
        v25 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v47, v24);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v42, v24++) = v25;
      }
      while (v24 != 3);
      v26 = a6[1];
      if (v26 >= a6[2])
      {
        result = std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__emplace_back_slow_path<double const&,cnmatrix::CNMatrix<1u,3u,double> const&,cnmatrix::CNMatrix<3u,1u,double> &>(a6, &v63, (uint64_t)&v47, (uint64_t)&v42);
      }
      else
      {
        RoseSyntheticApertureFiltering::InternalExpectedRangeMeas::InternalExpectedRangeMeas((double *)a6[1], (uint64_t)&v47, (uint64_t)&v42, v63);
        result = v26 + 136;
        a6[1] = v26 + 136;
      }
      a6[1] = result;
      v16 += 14;
    }
    while (v16 != v17);
  }
  v28 = *a5;
  v27 = a5[1];
  if (*v39 != v27)
  {
    do
    {
      v60 = 0x100000002;
      v58 = &off_24EC11690;
      v59 = xmmword_223119020;
      v61 = v62;
      v55 = 0x300000002;
      v53 = &off_24EC114E8;
      v54 = xmmword_223119060;
      v56 = v57;
      v49 = 0x100000003;
      v47 = &off_24EC111A0;
      v48 = xmmword_223118D20;
      v50 = v51;
      cnmatrix::Subtract<double>((uint64_t)(v28 + 4), a3, (uint64_t)&v47);
      RoseSyntheticApertureFiltering::measModelAoAAlt(a2, (uint64_t)&v64, (uint64_t)&v69, (uint64_t)&v47, (uint64_t)(v28 + 12), (uint64_t)&v58, (uint64_t)&v53);
      v29 = v28[3];
      v30 = v28[1];
      v31 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v58, 0);
      v32 = 1.0 / v29;
      v33 = fmod(v29 * v30 - *v31 + 3.14159265, 6.28318531);
      if (v33 < 0.0)
        v33 = v33 + 6.28318531;
      v63 = v32 * (v33 + -3.14159265);
      v52 = 0.0;
      v34 = v28[2];
      v52 = v34 - v32 * *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v58, 1u);
      v49 = 0x300000002;
      v47 = &off_24EC114E8;
      v48 = xmmword_223119060;
      v50 = v51;
      cnmatrix::Multiply<double>((uint64_t)&v53, (uint64_t)&v47, v32);
      v35 = 0;
      v44 = 0x200000003;
      v42 = &off_24EC11530;
      v43 = xmmword_223119070;
      v45 = v46;
      do
      {
        v36 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v47, 0, v35);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v42, v35, 0) = v36;
        v37 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v47, 1, v35);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v42, v35++, 1) = v37;
      }
      while (v35 != 3);
      v38 = a7[1];
      if (v38 >= a7[2])
      {
        result = std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__emplace_back_slow_path<double const&,double const&,cnmatrix::CNMatrix<2u,3u,double> const&,cnmatrix::CNMatrix<3u,2u,double> &>(a7, &v63, &v52, (uint64_t)&v47, (uint64_t)&v42);
      }
      else
      {
        RoseSyntheticApertureFiltering::InternalExpectedAoAMeas::InternalExpectedAoAMeas((double *)a7[1], (uint64_t)&v47, (uint64_t)&v42, v63, v52);
        result = v38 + 192;
        a7[1] = v38 + 192;
      }
      a7[1] = result;
      v28 += 26;
    }
    while (v28 != v27);
  }
  return result;
}

void sub_2230F9650(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_2230F965C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void std::vector<cnmatrix::CNMatrix<3u,1u,double>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v9 = (uint64_t)(v7 - *a1) >> 6;
    if ((unint64_t)(v9 + 1) >> 58)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = v5 - *a1;
    v11 = v10 >> 5;
    if (v10 >> 5 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFC0)
      v12 = 0x3FFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v18 = v4;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<3u,1u,double>>>(v4, v12);
    else
      v13 = 0;
    v14 = v13;
    v15 = &v13[64 * v9];
    v17 = &v13[64 * v12];
    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v15, a2);
    v16 = v15 + 64;
    std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__swap_out_circular_buffer(a1, &v14);
    v8 = a1[1];
    std::__split_buffer<cnmatrix::CNMatrix<3u,1u,double>>::~__split_buffer((uint64_t)&v14);
  }
  else
  {
    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(*(_QWORD *)(v4 - 8), a2);
    v8 = v7 + 64;
    a1[1] = v7 + 64;
  }
  a1[1] = v8;
}

void sub_2230F9780(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::initializeFilterWithGuess(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, double **a4@<X3>, uint64_t a5@<X8>)
{
  double GNStep;
  int v9;
  int v10;
  double v11;
  unsigned int v12;
  double v13;
  _BOOL4 v14;
  double v15;
  char v17;
  uint64_t v18;
  double v19;
  double *v20;
  double *i;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double *v25;
  double *v26;
  double v27;
  double v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  uint64_t k;
  BOOL v35;
  double *v36;
  double *v37;
  uint64_t (**v39)();
  __int128 v40;
  uint64_t v41;
  _BYTE *v42;
  _BYTE v43[72];
  uint64_t (**v44)();
  __int128 v45;
  uint64_t v46;
  _BYTE *v47;
  _BYTE v48[72];
  _BYTE v49[64];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void **v56;
  __int128 v57;
  uint64_t v58;
  _BYTE *v59;
  _BYTE v60[72];
  uint64_t (**v61)();
  __int128 v62;
  uint64_t v63;
  _BYTE *v64;
  _BYTE v65[72];
  double *v66;
  double *v67;
  uint64_t v68;
  double *v69;
  double *v70;
  uint64_t v71;
  uint64_t (**v72)();
  __int128 v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (**v77)();
  __int128 v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  _BYTE v82[64];
  uint64_t (**v83)();
  __int128 v84;
  uint64_t v85;
  _BYTE *v86;
  _BYTE v87[2472];

  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v82, a2);
  v79 = 0x100000003;
  v77 = &off_24EC111A0;
  v78 = xmmword_223118D20;
  v80 = &v81;
  GNStep = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::generateGNStep(a1, (uint64_t)v82, a3, a4, (uint64_t)&v77);
  v74 = 0x100000003;
  v72 = &off_24EC111A0;
  v73 = xmmword_223118D20;
  v75 = &v76;
  if (*(int *)(a1 + 944) < 1)
  {
    v17 = 0;
    v9 = 1;
  }
  else
  {
    v9 = 1;
LABEL_3:
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v72, (uint64_t)&v77);
    v10 = 0;
    while (v10 < *(_DWORD *)(a1 + 948))
    {
      v85 = 0x100000003;
      v83 = &off_24EC111A0;
      v84 = xmmword_223118D20;
      v86 = v87;
      cnmatrix::Add<double>((uint64_t)v82, (uint64_t)&v72, (uint64_t)&v83);
      v11 = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::generateGNStep(a1, (uint64_t)&v83, a3, a4, (uint64_t)&v77);
      if (v11 < GNStep)
      {
        v85 = 0x100000003;
        v83 = &off_24EC111A0;
        v84 = xmmword_223118D20;
        v86 = v87;
        cnmatrix::Add<double>((uint64_t)v82, (uint64_t)&v72, (uint64_t)&v83);
        cnmatrix::CNMatrixBase<double>::operator=((uint64_t)v82, (uint64_t)&v83);
        v63 = 0x100000003;
        v61 = &off_24EC111A0;
        v62 = xmmword_223118D20;
        v64 = v65;
        v85 = 0x100000134;
        v83 = &off_24EC11270;
        v84 = xmmword_223118D50;
        v86 = v87;
        v58 = 0x100000003;
        v56 = (void **)&off_24EC111A0;
        v57 = xmmword_223118D20;
        v59 = v60;
        cnmatrix::Norm<double>((uint64_t)&v72, (uint64_t)&v61, (uint64_t)&v83, (uint64_t)&v56, "2");
        v14 = v15 < *(double *)(a1 + 952) || (GNStep - v11) / GNStep < *(double *)(a1 + 960);
        ++v9;
        GNStep = v11;
LABEL_15:
        if (v9 > *(_DWORD *)(a1 + 944) || v14)
        {
          v17 = 0;
          goto LABEL_22;
        }
        goto LABEL_3;
      }
      v12 = 0;
      ++v10;
      do
      {
        v13 = *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v72, v12);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v72, v12++) = v13 * 0.5;
      }
      while (v12 != 3);
      if (v11 < GNStep)
      {
        v14 = 0;
        goto LABEL_15;
      }
    }
    v17 = 1;
  }
LABEL_22:
  v70 = 0;
  v69 = 0;
  v71 = 0;
  v67 = 0;
  v66 = 0;
  v68 = 0;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve((uint64_t *)&v69, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 4));
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve((uint64_t *)&v66, 0x4EC4EC4EC4EC4EC5 * (((char *)a4[1] - (char *)*a4) >> 4));
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatch(v18, (uint64_t)v82, (double **)a3, a4, (uint64_t *)&v69, (uint64_t *)&v66);
  v85 = 0x300000003;
  v83 = &off_24EC11458;
  v84 = xmmword_223118FC0;
  v86 = v87;
  cnmatrix::FastResize<double>(&v83, 3, 3);
  v19 = 0.0;
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v83, 0.0);
  v20 = v69;
  for (i = v70; v20 != i; v20 = (double *)(v23 + 128))
  {
    v22 = (uint64_t)(v20 + 9);
    v24 = *v20;
    v23 = (uint64_t)(v20 + 1);
    v58 = 0x300000003;
    v56 = (void **)&off_24EC11458;
    v57 = xmmword_223118FC0;
    v59 = v60;
    cnmatrix::Multiply<double>(v22, v23, (uint64_t)&v56);
    v63 = 0x300000003;
    v61 = &off_24EC11458;
    v62 = xmmword_223118FC0;
    v64 = v65;
    cnmatrix::Add<double>((uint64_t)&v83, (uint64_t)&v56, (uint64_t)&v61);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v83, (uint64_t)&v61);
    v19 = v19 + v24 * v24;
  }
  v25 = v66;
  v26 = v67;
  if (v66 != v67)
  {
    do
    {
      v27 = *v25;
      v28 = v25[1];
      v58 = 0x300000003;
      v56 = (void **)&off_24EC11458;
      v57 = xmmword_223118FC0;
      v29 = v25 + 2;
      v59 = v60;
      cnmatrix::Multiply<double>((uint64_t)(v25 + 13), (uint64_t)(v25 + 2), (uint64_t)&v56);
      v63 = 0x300000003;
      v61 = &off_24EC11458;
      v62 = xmmword_223118FC0;
      v64 = v65;
      cnmatrix::Add<double>((uint64_t)&v83, (uint64_t)&v56, (uint64_t)&v61);
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v83, (uint64_t)&v61);
      v19 = v19 + v28 * v28 + v27 * v27;
      v25 = v29 + 22;
    }
    while (v29 + 22 != v26);
  }
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)&v61, (uint64_t)&v83);
  v53 = 0;
  v54 = 0;
  v55 = 0;
  v50 = 0;
  v51 = 0;
  v52 = 0;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(&v53, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 4));
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve(&v50, 0x4EC4EC4EC4EC4EC5 * (((char *)a4[1] - (char *)*a4) >> 4));
  v58 = 0x100000003;
  v56 = (void **)&off_24EC111A0;
  v57 = xmmword_223118D20;
  v59 = v60;
  cnmatrix::Subtract<double>((uint64_t)v82, a1 + 168, (uint64_t)&v56);
  RoseSyntheticApertureFiltering::pos2rangeThPhi((uint64_t)&v56, (uint64_t)v49);
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatchAlt(v30, (uint64_t)v49, a1 + 168, (double **)a3, a4, &v53, &v50);
  v58 = 0x300000003;
  v56 = (void **)&off_24EC11458;
  v57 = xmmword_223118FC0;
  v59 = v60;
  cnmatrix::FastResize<double>(&v56, 3, 3);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v56, 0.0);
  v31 = v53;
  for (j = v54; v31 != j; v31 += 136)
  {
    v41 = 0x300000003;
    v39 = &off_24EC11458;
    v40 = xmmword_223118FC0;
    v42 = v43;
    cnmatrix::Multiply<double>(v31 + 72, v31 + 8, (uint64_t)&v39);
    v46 = 0x300000003;
    v44 = &off_24EC11458;
    v45 = xmmword_223118FC0;
    v47 = v48;
    cnmatrix::Add<double>((uint64_t)&v56, (uint64_t)&v39, (uint64_t)&v44);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v56, (uint64_t)&v44);
  }
  v33 = v50;
  for (k = v51; v33 != k; v33 += 192)
  {
    v41 = 0x300000003;
    v39 = &off_24EC11458;
    v40 = xmmword_223118FC0;
    v42 = v43;
    cnmatrix::Multiply<double>(v33 + 104, v33 + 16, (uint64_t)&v39);
    v46 = 0x300000003;
    v44 = &off_24EC11458;
    v45 = xmmword_223118FC0;
    v47 = v48;
    cnmatrix::Add<double>((uint64_t)&v56, (uint64_t)&v39, (uint64_t)&v44);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v56, (uint64_t)&v44);
  }
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)&v44, (uint64_t)&v56);
  v35 = (v17 & 1) != 0 || v9 <= *(_DWORD *)(a1 + 944);
  v36 = *a4;
  v37 = a4[1];
  *(_BYTE *)a5 = v35;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a5 + 8, (uint64_t)v82);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a5 + 72, (uint64_t)v49);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a5 + 136, (uint64_t)&v61);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a5 + 248, (uint64_t)&v44);
  *(double *)(a5 + 360) = v19;
  *(_DWORD *)(a5 + 368) = v36 == v37;
  v56 = (void **)&v50;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100](&v56);
  v56 = (void **)&v53;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100](&v56);
  v83 = (uint64_t (**)())&v66;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  v83 = (uint64_t (**)())&v69;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
}

void sub_2230F9F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  char v10;

  if (a2 != a3)
  {
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *>((uint64_t)&v10, a3, *(_QWORD *)(a1 + 8), a2);
    v6 = *(_QWORD **)(a1 + 8);
    if (v6 != v5)
    {
      v7 = v6 - 46;
      do
      {
        v7[30] = off_24EC111F8;
        v7[16] = off_24EC111F8;
        v7[8] = off_24EC111F8;
        *v7 = off_24EC111F8;
        v8 = v7 - 1;
        v7 -= 47;
      }
      while (v8 != v5);
    }
    *(_QWORD *)(a1 + 8) = v5;
  }
  return a2;
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoVBatch(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  _OWORD *v3;
  _OWORD *v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v3 = *(_OWORD **)a2;
  v4 = *(_OWORD **)(a2 + 8);
  if (*(_OWORD **)a2 != v4)
  {
    v7 = (uint64_t)(a3 + 2);
    do
    {
      if (RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoV(a1, (uint64_t)v3))
      {
        v8 = a3[1];
        if (v8 >= a3[2])
        {
          v9 = std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalAoAMeas const&>(a3, v3);
        }
        else
        {
          std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>(v7, (_OWORD *)a3[1], v3);
          v9 = v8 + 208;
          a3[1] = v8 + 208;
        }
        a3[1] = v9;
      }
      v3 += 13;
    }
    while (v3 != v4);
  }
}

void sub_2230FA140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  a10 = (void **)v10;
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

BOOL RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoV(uint64_t a1, uint64_t a2)
{
  double v3;
  double v4;
  uint64_t (**v6)();
  __int128 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (**v11)();
  __int128 v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (**v16)();
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (**v21)();
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (**v26)();
  __int128 v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;

  v13 = 0x100000003;
  v11 = &off_24EC111A0;
  v12 = xmmword_223118D20;
  v14 = &v15;
  cnmatrix::Subtract<double>(a1, a2 + 32, (uint64_t)&v11);
  v8 = 0x100000003;
  v6 = &off_24EC111A0;
  v7 = xmmword_223118D20;
  v9 = &v10;
  cnmatrix::Multiply<double>(a2 + 96, (uint64_t)&v11, (uint64_t)&v6);
  v3 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v6, 2u);
  v28 = 0x100000003;
  v26 = &off_24EC111A0;
  v27 = xmmword_223118D20;
  v29 = &v30;
  v23 = 0x100000134;
  v21 = &off_24EC11270;
  v22 = xmmword_223118D50;
  v24 = &v25;
  v18 = 0x100000003;
  v16 = &off_24EC111A0;
  v17 = xmmword_223118D20;
  v19 = &v20;
  cnmatrix::Norm<double>((uint64_t)&v6, (uint64_t)&v26, (uint64_t)&v21, (uint64_t)&v16, "2");
  return acos(-v3 / v4) * 180.0 / 3.14159265 <= 60.0;
}

double RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::generateGNStep(uint64_t a1, uint64_t a2, uint64_t a3, double **a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  double v11;
  double *v12;
  double *i;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double *v17;
  double *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t (**v23)();
  __int128 v24;
  uint64_t v25;
  _BYTE *v26;
  _BYTE v27[24];
  uint64_t (**v28)();
  __int128 v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE v32[72];
  uint64_t (**v33)();
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (**v38)();
  __int128 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  double *v43;
  double *v44;
  uint64_t v45;
  double *v46;
  double *v47;
  uint64_t v48;
  uint64_t (**v49)();
  __int128 v50;
  uint64_t v51;
  _BYTE *v52;
  _BYTE v53[96];
  uint64_t (**v54)();
  __int128 v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;

  v9 = (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 4;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve((uint64_t *)&v46, 0x6DB6DB6DB6DB6DB7 * v9);
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatch(v10, a2, (double **)a3, a4, (uint64_t *)&v46, (uint64_t *)&v43);
  v40 = 0x300000003;
  v38 = &off_24EC11458;
  v39 = xmmword_223118FC0;
  v41 = &v42;
  cnmatrix::FastResize<double>(&v38, 3, 3);
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v38, 0.0);
  v35 = 0x100000003;
  v33 = &off_24EC111A0;
  v34 = xmmword_223118D20;
  v36 = &v37;
  cnmatrix::FastResize<double>(&v33, 3, 1);
  v11 = 0.0;
  cnmatrix::CNMatrixBase<double>::WriteValue((uint64_t)&v33, 0.0);
  v12 = v46;
  for (i = v47; v12 != i; v12 = (double *)(v15 + 64))
  {
    v14 = (uint64_t)(v12 + 9);
    v16 = *v12;
    v15 = (uint64_t)(v12 + 1);
    v30 = 0x300000003;
    v28 = &off_24EC11458;
    v29 = xmmword_223118FC0;
    v31 = v32;
    cnmatrix::Multiply<double>(v14, v15, (uint64_t)&v28);
    v51 = 0x300000003;
    v49 = &off_24EC11458;
    v50 = xmmword_223118FC0;
    v52 = v53;
    cnmatrix::Add<double>((uint64_t)&v38, (uint64_t)&v28, (uint64_t)&v49);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v38, (uint64_t)&v49);
    v30 = 0x100000003;
    v28 = &off_24EC111A0;
    v29 = xmmword_223118D20;
    v15 += 64;
    v31 = v32;
    cnmatrix::Multiply<double>(v15, (uint64_t)&v28, v16);
    v51 = 0x100000003;
    v49 = &off_24EC111A0;
    v50 = xmmword_223118D20;
    v52 = v53;
    cnmatrix::Add<double>((uint64_t)&v33, (uint64_t)&v28, (uint64_t)&v49);
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v33, (uint64_t)&v49);
    v11 = v11 + v16 * v16;
  }
  v17 = v43;
  v18 = v44;
  if (v43 != v44)
  {
    do
    {
      v19 = *v17;
      v20 = v17[1];
      v30 = 0x300000003;
      v28 = &off_24EC11458;
      v29 = xmmword_223118FC0;
      v21 = (uint64_t)(v17 + 2);
      v31 = v32;
      cnmatrix::Multiply<double>((uint64_t)(v17 + 13), (uint64_t)(v17 + 2), (uint64_t)&v28);
      v51 = 0x300000003;
      v49 = &off_24EC11458;
      v50 = xmmword_223118FC0;
      v52 = v53;
      cnmatrix::Add<double>((uint64_t)&v38, (uint64_t)&v28, (uint64_t)&v49);
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v38, (uint64_t)&v49);
      v25 = 0x100000002;
      v23 = &off_24EC11690;
      v24 = xmmword_223119020;
      v26 = v27;
      *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v23, 0) = v19;
      *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v23, 1u) = v20;
      v30 = 0x100000003;
      v28 = &off_24EC111A0;
      v29 = xmmword_223118D20;
      v21 += 88;
      v31 = v32;
      cnmatrix::Multiply<double>(v21, (uint64_t)&v23, (uint64_t)&v28);
      v51 = 0x100000003;
      v49 = &off_24EC111A0;
      v50 = xmmword_223118D20;
      v52 = v53;
      cnmatrix::Add<double>((uint64_t)&v33, (uint64_t)&v28, (uint64_t)&v49);
      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)&v33, (uint64_t)&v49);
      v11 = v11 + v20 * v20 + v19 * v19;
      v17 = (double *)(v21 + 88);
    }
    while ((double *)(v21 + 88) != v18);
  }
  v30 = 0x300000003;
  v28 = &off_24EC11458;
  v29 = xmmword_223118FC0;
  v31 = v32;
  v56 = 0x100000003;
  v54 = &off_24EC11578;
  v55 = xmmword_223118D20;
  v57 = &v58;
  v51 = 0x10000000CLL;
  v49 = &off_24EC11600;
  v50 = xmmword_223119010;
  v52 = v53;
  cnmatrix::Inv<double>((uint64_t)&v38, (uint64_t)&v54, (uint64_t)&v49, (uint64_t)&v28);
  v25 = 0x100000003;
  v23 = &off_24EC111A0;
  v24 = xmmword_223118D20;
  v26 = v27;
  cnmatrix::Multiply<double>((uint64_t)&v28, (uint64_t)&v33, (uint64_t)&v23);
  cnmatrix::CNMatrixBase<double>::operator=(a5, (uint64_t)&v23);
  v49 = (uint64_t (**)())&v43;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
  v49 = (uint64_t (**)())&v46;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);
  return v11;
}

void sub_2230FA72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,char a63)
{
  void **a66;

  a66 = (void **)&a60;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100](&a66);
  a66 = (void **)&a63;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a66);
  _Unwind_Resume(a1);
}

void std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void *__p;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 6) < a2)
  {
    if (a2 >= 0x155555555555556)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v13 = v3;
    __p = std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>>(v3, a2);
    v10 = (char *)__p + v5;
    v11 = (char *)__p + v5;
    v12 = (char *)__p + 192 * v6;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__swap_out_circular_buffer(a1, &__p);
    v7 = v10;
    v8 = v11;
    if (v11 != v10)
    {
      do
      {
        *((_QWORD *)v8 - 11) = off_24EC111F8;
        *((_QWORD *)v8 - 22) = off_24EC111F8;
        v8 -= 192;
      }
      while (v8 != v7);
      v11 = v7;
    }
    if (__p)
      operator delete(__p);
  }
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::measModelBatch(uint64_t a1, uint64_t a2, double **a3, double **a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  __int128 v16;
  double v17;
  double v18;
  double v19;
  double *v20;
  double v21;
  unsigned int v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  double *v26;
  double *v27;
  double v28;
  double v29;
  double *v30;
  double v31;
  double v32;
  double v33;
  int v34;
  double v35;
  double v36;
  unint64_t v37;
  uint64_t v38;
  double **v39;
  uint64_t (**v41)();
  __int128 v42;
  uint64_t v43;
  _BYTE *v44;
  _BYTE v45[48];
  uint64_t (**v46)();
  __int128 v47;
  uint64_t v48;
  _BYTE *v49;
  _BYTE v50[48];
  double v51;
  uint64_t (**v52)();
  __int128 v53;
  uint64_t v54;
  _BYTE *v55;
  _BYTE v56[48];
  uint64_t (**v57)();
  __int128 v58;
  uint64_t v59;
  _BYTE *v60;
  _BYTE v61[16];
  double v62[2];

  v10 = *a5;
  v11 = a5[1];
  if (*a5 != v11)
  {
    do
    {
      *(_QWORD *)(v11 - 64) = off_24EC111F8;
      *(_QWORD *)(v11 - 128) = off_24EC111F8;
      v11 -= 136;
    }
    while (v11 != v10);
    a5[1] = v10;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::reserve(a5, 0x6DB6DB6DB6DB6DB7 * (((char *)a3[1] - (char *)*a3) >> 4));
  }
  v12 = *a6;
  v13 = a6[1];
  if (*a6 != v13)
  {
    do
    {
      *(_QWORD *)(v13 - 88) = off_24EC111F8;
      *(_QWORD *)(v13 - 176) = off_24EC111F8;
      v13 -= 192;
    }
    while (v13 != v12);
    a6[1] = v12;
    std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::reserve(a6, 0x4EC4EC4EC4EC4EC5 * (((char *)a4[1] - (char *)*a4) >> 4));
  }
  v39 = a4;
  v14 = *a3;
  v15 = a3[1];
  if (*a3 != v15)
  {
    do
    {
      v59 = 0x100000001;
      v57 = &off_24EC11648;
      *(_QWORD *)&v16 = 0x100000001;
      *((_QWORD *)&v16 + 1) = 0x100000001;
      v58 = v16;
      v60 = v61;
      v54 = 0x300000001;
      v52 = &off_24EC114A0;
      v53 = xmmword_223119050;
      v55 = v56;
      RoseSyntheticApertureFiltering::measModelRange(a2, (uint64_t)(v14 + 5), (uint64_t)&v57, (uint64_t)&v52);
      v18 = v14[3];
      v17 = v14[4];
      v62[0] = 0.0;
      v19 = v14[2];
      v20 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v57, 0);
      v21 = 1.0 / (v18 * v17);
      v62[0] = v19 - v21 * *v20;
      v48 = 0x300000001;
      v46 = &off_24EC114A0;
      v47 = xmmword_223119050;
      v49 = v50;
      cnmatrix::Multiply<double>((uint64_t)&v52, (uint64_t)&v46, v21);
      v22 = 0;
      v43 = 0x100000003;
      v41 = &off_24EC111A0;
      v42 = xmmword_223118D20;
      v44 = v45;
      do
      {
        v23 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v46, v22);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v41, v22++) = v23;
      }
      while (v22 != 3);
      v24 = a5[1];
      if (v24 >= a5[2])
      {
        v25 = std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__emplace_back_slow_path<double const&,cnmatrix::CNMatrix<1u,3u,double> const&,cnmatrix::CNMatrix<3u,1u,double> &>(a5, v62, (uint64_t)&v46, (uint64_t)&v41);
      }
      else
      {
        RoseSyntheticApertureFiltering::InternalExpectedRangeMeas::InternalExpectedRangeMeas((double *)a5[1], (uint64_t)&v46, (uint64_t)&v41, v62[0]);
        v25 = v24 + 136;
        a5[1] = v24 + 136;
      }
      a5[1] = v25;
      v14 += 14;
    }
    while (v14 != v15);
  }
  v27 = *a4;
  v26 = a4[1];
  if (*v39 != v26)
  {
    do
    {
      v59 = 0x100000002;
      v57 = &off_24EC11690;
      v58 = xmmword_223119020;
      v60 = v61;
      v54 = 0x300000002;
      v52 = &off_24EC114E8;
      v53 = xmmword_223119060;
      v55 = v56;
      RoseSyntheticApertureFiltering::measModelAoA(a2, (uint64_t)(v27 + 4), (uint64_t)(v27 + 12), (uint64_t)&v57, (uint64_t)&v52);
      v28 = v27[3];
      v29 = v27[1];
      v30 = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v57, 0);
      v31 = 1.0 / v28;
      v32 = fmod(v28 * v29 - *v30 + 3.14159265, 6.28318531);
      if (v32 < 0.0)
        v32 = v32 + 6.28318531;
      v62[0] = v31 * (v32 + -3.14159265);
      v51 = 0.0;
      v33 = v27[2];
      v51 = v33 - v31 * *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v57, 1u);
      v48 = 0x300000002;
      v46 = &off_24EC114E8;
      v47 = xmmword_223119060;
      v49 = v50;
      cnmatrix::Multiply<double>((uint64_t)&v52, (uint64_t)&v46, 1.0 / v28);
      v34 = 0;
      v43 = 0x200000003;
      v41 = &off_24EC11530;
      v42 = xmmword_223119070;
      v44 = v45;
      do
      {
        v35 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v46, 0, v34);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v41, v34, 0) = v35;
        v36 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v46, 1, v34);
        *(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v41, v34++, 1) = v36;
      }
      while (v34 != 3);
      v37 = a6[1];
      if (v37 >= a6[2])
      {
        v38 = std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__emplace_back_slow_path<double const&,double const&,cnmatrix::CNMatrix<2u,3u,double> const&,cnmatrix::CNMatrix<3u,2u,double> &>(a6, v62, &v51, (uint64_t)&v46, (uint64_t)&v41);
      }
      else
      {
        RoseSyntheticApertureFiltering::InternalExpectedAoAMeas::InternalExpectedAoAMeas((double *)a6[1], (uint64_t)&v46, (uint64_t)&v41, v62[0], v51);
        v38 = v37 + 192;
        a6[1] = v37 + 192;
      }
      a6[1] = v38;
      v27 += 26;
    }
    while (v27 != v26);
  }
}

void sub_2230FADB4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_2230FADC0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

_QWORD *cnmatrix::CNMatrix<1u,3u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

_QWORD *cnmatrix::CNMatrix<1u,1u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

_QWORD *cnmatrix::CNMatrix<3u,2u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

_QWORD *cnmatrix::CNMatrix<2u,3u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

_QWORD *cnmatrix::CNMatrix<2u,1u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

uint64_t std::vector<cnmatrix::CNMatrix<2u,1u,double>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x492492492492493)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 56 * v6;
    std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_2230FAEE4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *cnmatrix::CNMatrix<2u,2u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

_QWORD *cnmatrix::CNMatrix<1u,2u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

void cnmatrix::Eig<2u,2u,2u,2u,2u,2u,double>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v4;
  uint64_t (**v5)();
  __int128 v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (**v10)();
  __int128 v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (**v15)();
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (**v20)();
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (**v25)();
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (**v30)();
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;

  v32 = 0x200000002;
  v30 = &off_24EC11720;
  v31 = xmmword_223119040;
  v33 = &v34;
  v27 = 0x200000002;
  v25 = &off_24EC11720;
  v26 = xmmword_223119040;
  v28 = &v29;
  v22 = 0x200000002;
  v20 = &off_24EC11720;
  v21 = xmmword_223119040;
  v23 = &v24;
  v17 = 0x100000002;
  v15 = &off_24EC11690;
  v16 = xmmword_223119020;
  v18 = &v19;
  v12 = 0x200000002;
  v10 = &off_24EC11720;
  v11 = xmmword_223119040;
  v13 = &v14;
  v7 = 0x1000000A8;
  v5 = &off_24EC117B0;
  v6 = xmmword_223119080;
  v8 = &v9;
  cnmatrix::Eig<double>(a1, (uint64_t)&v30, a3, (uint64_t)&v25, a2, (uint64_t)&v20, (uint64_t)&v15, (uint64_t)&v10, (uint64_t)&v5);
  if (DWORD2(v26))
  {
    v3 = 0;
    while (*(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v25, v3) == 0.0)
    {
      if (++v3 >= DWORD2(v26))
        goto LABEL_6;
    }
    cnprint::CNPrinter::Print();
  }
LABEL_6:
  if (DWORD2(v21))
  {
    v4 = 0;
    while (*(double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v20, v4) == 0.0)
    {
      if (++v4 >= DWORD2(v21))
        return;
    }
    cnprint::CNPrinter::Print();
  }
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoVBatchMultiple(uint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  _OWORD *v3;
  _OWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t v12;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v3 = *(_OWORD **)a2;
  v4 = *(_OWORD **)(a2 + 8);
  if (*(_OWORD **)a2 != v4)
  {
    v7 = (uint64_t)(a3 + 2);
    do
    {
      v8 = *a1;
      v9 = a1[1];
      if (*a1 == v9)
        goto LABEL_11;
      v10 = 1;
      do
      {
        while (!v10)
        {
          v10 = 0;
          v8 += 64;
          if (v8 == v9)
            goto LABEL_15;
        }
        v10 = RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::checkFoV(v8, (uint64_t)v3);
        v8 += 64;
      }
      while (v8 != v9);
      if (v10)
      {
LABEL_11:
        v11 = a3[1];
        if (v11 >= a3[2])
        {
          v12 = std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalAoAMeas const&>(a3, v3);
        }
        else
        {
          std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>(v7, (_OWORD *)a3[1], v3);
          v12 = v11 + 208;
          a3[1] = v11 + 208;
        }
        a3[1] = v12;
      }
LABEL_15:
      v3 += 13;
    }
    while (v3 != v4);
  }
}

void sub_2230FB26C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8 - 4);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2230FB2F0(_Unwind_Exception *exception_object)
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

char *std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x186186186186187)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[168 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::BatchSolutionParticle>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x186186186186187)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(168 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

char *std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::BatchSolutionParticle*,RoseSyntheticApertureFiltering::BatchSolutionParticle*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  char *v14;
  _BYTE *v15;
  char *v16;
  uint64_t v17;
  size_t v18;
  void *v19;
  char *v20;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (0xCF3CF3CF3CF3CF3DLL * ((v8 - *(_QWORD *)result) >> 3) < a4)
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
    if (a4 > 0x186186186186186)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 0xCF3CF3CF3CF3CF3DLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0xC30C30C30C30C3)
      v12 = 0x186186186186186;
    else
      v12 = v11;
    result = std::vector<RoseSyntheticApertureFiltering::BatchSolutionParticle>::__vallocate[abi:ne180100](v7, v12);
    v14 = (char *)v7[1];
    v13 = (void **)(v7 + 1);
    v9 = v14;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v17 - 4;
      v19 = v9;
      v20 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13 = (void **)(result + 8);
  v15 = (_BYTE *)*((_QWORD *)result + 1);
  if (0xCF3CF3CF3CF3CF3DLL * ((v15 - v9) >> 3) >= a4)
    goto LABEL_16;
  v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v15 - v9 - 4);
    v9 = (char *)*v13;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v17 - 4;
    v19 = v9;
    v20 = v16;
LABEL_18:
    result = (char *)memmove(v19, v20, v18);
  }
LABEL_19:
  *v13 = &v9[v17];
  return result;
}

BOOL std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_0,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(__int128 **a1, uint64_t *a2)
{
  __int128 *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  double v6;
  _DWORD v8[18];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  _DWORD v12[18];

  v2 = *a1;
  v3 = *a2;
  v4 = **a1;
  v5 = (*a1)[1];
  v11 = *((_QWORD *)*a1 + 4);
  v9 = v4;
  v10 = v5;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v12, (uint64_t)v2 + 40);
  v12[16] = *((_DWORD *)v2 + 26);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v8, v3 + 40);
  v8[16] = *(_DWORD *)(v3 + 104);
  v6 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v12, 0);
  return v6 < cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v8, 0);
}

BOOL std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_1,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(__int128 **a1, uint64_t *a2)
{
  __int128 *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  double v6;
  _DWORD v8[18];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  _DWORD v12[18];

  v2 = *a1;
  v3 = *a2;
  v4 = **a1;
  v5 = (*a1)[1];
  v11 = *((_QWORD *)*a1 + 4);
  v9 = v4;
  v10 = v5;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v12, (uint64_t)v2 + 40);
  v12[16] = *((_DWORD *)v2 + 26);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v8, v3 + 40);
  v8[16] = *(_DWORD *)(v3 + 104);
  v6 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v12, 1u);
  return v6 < cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v8, 1u);
}

BOOL std::_MinmaxElementLessFunc<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::spatialBinning(std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>)::$_2,std::__identity>::operator()[abi:ne180100]<std::__wrap_iter<RoseSyntheticApertureFiltering::InternalRangeMeas const*>>(__int128 **a1, uint64_t *a2)
{
  __int128 *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  double v6;
  _DWORD v8[18];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  _DWORD v12[18];

  v2 = *a1;
  v3 = *a2;
  v4 = **a1;
  v5 = (*a1)[1];
  v11 = *((_QWORD *)*a1 + 4);
  v9 = v4;
  v10 = v5;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v12, (uint64_t)v2 + 40);
  v12[16] = *((_DWORD *)v2 + 26);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v8, v3 + 40);
  v8[16] = *(_DWORD *)(v3 + 104);
  v6 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v12, 2u);
  return v6 < cnmatrix::CNMatrixBase<double>::operator()((uint64_t)v8, 2u);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

double *std::__minmax_element_impl[abi:ne180100]<std::__wrap_iter<double *>,std::__wrap_iter<double *>,std::__identity,std::__less<void,void>>(double *result, double *a2)
{
  double *v2;
  double v4;
  double v5;
  double *v6;
  double *v7;
  double v8;
  double v9;

  v2 = result;
  if (result != a2 && result + 1 != a2)
  {
    v5 = *result;
    v4 = result[1];
    if (v4 < *result)
      ++result;
    v6 = v4 >= *v2 ? v2 + 1 : v2;
    v7 = v2 + 2;
    if (v7 != a2)
    {
      if (v4 >= v5)
        v4 = v5;
      while (v7 + 1 != a2)
      {
        v9 = *v7;
        v8 = v7[1];
        if (v8 >= *v7)
        {
          if (v9 < v4)
          {
            v4 = *v7;
            result = v7;
          }
          if (v8 >= *v6)
            v6 = v7 + 1;
        }
        else
        {
          v4 = *result;
          if (v8 < *result)
          {
            v4 = v7[1];
            result = v7 + 1;
          }
          if (v9 >= *v6)
            v6 = v7;
        }
        v7 += 2;
        if (v7 == a2)
          return result;
      }
      if (*v7 < *result)
        return v7;
    }
  }
  return result;
}

void cnmatrix::CNMatrix<3u,3u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<3u,3u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<3u,3u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[9];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

__n128 cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  __n128 result;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  _OWORD *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __n128 *v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  const char *v16;
  int v17;
  const char *v18;
  const char *v19;

  result.n128_u64[0] = 0x100000003;
  *(_QWORD *)(a1 + 24) = 0x100000003;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = &off_24EC111A0;
  if (a1 == a2)
  {
    v16 = "this != &(A)";
    v17 = 603;
LABEL_21:
    v18 = "cnmatrix.h";
    v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 3)
  {
    v16 = "this->max_num_rows_ >= num_rows";
    v17 = 422;
LABEL_18:
    v18 = "cnmatrixbase.h";
    v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 2)
  {
    v16 = "this->max_num_cols_ >= num_cols";
    v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  v6 = (_OWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 3u)
  {
    v16 = "this->max_num_rows_ >= A.num_rows_";
    v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 1u)
  {
    v16 = "this->max_num_cols_ >= A.num_cols_";
    v17 = 617;
    goto LABEL_21;
  }
  v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    v10 = (v7 - 2);
    v11 = *(__int128 **)(a2 + 32);
    v12 = (__n128 *)((char *)v6 + 8 * v10);
    v13 = (v7 - 1) >> 1;
    v14 = v11;
    do
    {
      v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    result = *(__n128 *)((char *)v11 + 8 * v10);
    *v12 = result;
  }
  else if ((_DWORD)v5)
  {
    v8 = *(unint64_t **)(a2 + 32);
    do
    {
      v9 = *v8++;
      result.n128_u64[0] = v9;
      *(_QWORD *)v6 = v9;
      v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_2230FBA28(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

__n128 cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  __n128 result;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  _OWORD *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __n128 *v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  const char *v16;
  int v17;
  const char *v18;
  const char *v19;

  result.n128_u64[0] = 0x300000003;
  *(_QWORD *)(a1 + 24) = 0x300000003;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = &off_24EC11458;
  if (a1 == a2)
  {
    v16 = "this != &(A)";
    v17 = 603;
LABEL_21:
    v18 = "cnmatrix.h";
    v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 3)
  {
    v16 = "this->max_num_rows_ >= num_rows";
    v17 = 422;
LABEL_18:
    v18 = "cnmatrixbase.h";
    v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 4)
  {
    v16 = "this->max_num_cols_ >= num_cols";
    v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  v6 = (_OWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 3u)
  {
    v16 = "this->max_num_rows_ >= A.num_rows_";
    v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 3u)
  {
    v16 = "this->max_num_cols_ >= A.num_cols_";
    v17 = 617;
    goto LABEL_21;
  }
  v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    v10 = (v7 - 2);
    v11 = *(__int128 **)(a2 + 32);
    v12 = (__n128 *)((char *)v6 + 8 * v10);
    v13 = (v7 - 1) >> 1;
    v14 = v11;
    do
    {
      v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    result = *(__n128 *)((char *)v11 + 8 * v10);
    *v12 = result;
  }
  else if ((_DWORD)v5)
  {
    v8 = *(unint64_t **)(a2 + 32);
    do
    {
      v9 = *v8++;
      result.n128_u64[0] = v9;
      *(_QWORD *)v6 = v9;
      v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_2230FBB90(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

void cnmatrix::CNMatrix<1u,3u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<1u,3u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<1u,3u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[3];

  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

void cnmatrix::CNMatrix<2u,3u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<2u,3u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<2u,3u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[6];

  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

void cnmatrix::CNMatrix<3u,2u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<3u,2u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<3u,2u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[6];

  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

void std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v3;
  char *v4;
  BOOL v5;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v3 = (char *)v1[1];
    if (v3 != v2)
    {
      v4 = v3 - 192;
      do
      {
        *((_QWORD *)v4 + 16) = off_24EC111F8;
        *(_QWORD *)v4 = off_24EC111F8;
        *((_QWORD *)v4 - 14) = off_24EC111F8;
        *((_QWORD *)v4 - 22) = off_24EC111F8;
        *((_QWORD *)v4 - 30) = off_24EC111F8;
        v5 = v4 - 240 == v2;
        v4 -= 432;
      }
      while (!v5);
    }
    v1[1] = v2;
    operator delete(v2);
  }
}

void boost::circular_buffer<double,std::allocator<double>>::destroy(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)a1;
  v6 = v3 - v2;
  v7 = (unint64_t)(v3 - (_QWORD)v5) >> 3;
  if (v4 < v6 >> 3)
    v7 = 0;
  *(_QWORD *)(a1 + 16) = v2 + 8 * (v4 - v7);
  if (v5)
    operator delete(v5);
}

void std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *i;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    for (i = (char *)v1[1]; i != v2; i -= 112)
      *((_QWORD *)i - 9) = off_24EC111F8;
    v1[1] = v2;
    operator delete(v2);
  }
}

void std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *i;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    for (i = (char *)v1[1]; i != v2; i -= 208)
    {
      *((_QWORD *)i - 14) = off_24EC111F8;
      *((_QWORD *)i - 22) = off_24EC111F8;
    }
    v1[1] = v2;
    operator delete(v2);
  }
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(112 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalRangeMeas*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  if (a3 != a5)
  {
    v11 = 0;
    do
    {
      v12 = a7 + v11;
      v13 = *(_OWORD *)(a3 + v11 - 112);
      v14 = *(_OWORD *)(a3 + v11 - 96);
      *(_QWORD *)(v12 - 80) = *(_QWORD *)(a3 + v11 - 80);
      *(_OWORD *)(v12 - 112) = v13;
      *(_OWORD *)(v12 - 96) = v14;
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a7 + v11 - 72, a3 + v11 - 72);
      *(_DWORD *)(v12 - 8) = *(_DWORD *)(a3 + v11 - 8);
      v11 -= 112;
    }
    while (a3 + v11 != a5);
  }
  return a6;
}

void sub_2230FBEE8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  for (; v2; v2 += 112)
    *(_QWORD *)(v1 + 40 + v2) = off_24EC111F8;
  _Unwind_Resume(a1);
}

double *cnmatrix::Transpose<double>(uint64_t a1, _DWORD *a2)
{
  double *result;
  int v5;
  int v6;
  int v7;
  int i;
  double v9;

  if ((_DWORD *)a1 == a2)
    cnmatrix::Transpose<double>();
  result = (double *)cnmatrix::FastResize<double>(a2, *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 8));
  v5 = a2[2];
  if (v5)
  {
    v6 = 0;
    v7 = a2[3];
    do
    {
      if (v7)
      {
        for (i = 0; i != v7; ++i)
        {
          v9 = cnmatrix::CNMatrixBase<double>::operator()(a1, i, v6);
          result = (double *)cnmatrix::CNMatrixBase<double>::operator()((uint64_t)a2, v6, i);
          *result = v9;
        }
      }
      ++v6;
    }
    while (v6 != v5);
  }
  return result;
}

double cnmatrix::CNMatrixBase<double>::operator()(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  unsigned int v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    cnmatrix::CNMatrixBase<double>::operator()();
  v4 = a2 + *(_DWORD *)(a1 + 20) * a3;
  if ((v4 & 0x80000000) != 0)
    cnmatrix::CNMatrixBase<double>::operator()();
  if ((signed int)v4 >= *(_DWORD *)(a1 + 16))
    cnmatrix::CNMatrixBase<double>::operator()();
  return *(double *)(v3 + 8 * v4);
}

uint64_t cnmatrix::CNMatrixBase<double>::operator()(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  unsigned int v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    cnmatrix::CNMatrixBase<double>::operator()();
  v4 = a2 + *(_DWORD *)(a1 + 20) * a3;
  if ((v4 & 0x80000000) != 0)
    cnmatrix::CNMatrixBase<double>::operator()();
  if ((signed int)v4 >= *(_DWORD *)(a1 + 16))
    cnmatrix::CNMatrixBase<double>::operator()();
  return v3 + 8 * v4;
}

double cnmatrix::CNMatrixBase<double>::operator()(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    cnmatrix::CNMatrixBase<double>::operator()();
  if ((a2 & 0x80000000) != 0)
    cnmatrix::CNMatrixBase<double>::operator()();
  if (*(_DWORD *)(a1 + 16) <= (signed int)a2)
    cnmatrix::CNMatrixBase<double>::operator()();
  return *(double *)(v2 + 8 * a2);
}

void std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int const,unsigned int>>(uint64_t **a1, unsigned int *a2, uint64_t *a3)
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
    std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  char *v15;
  char *v16;
  void *__p;
  char *v19;
  char *v20;
  char *v21;
  uint64_t *v22;

  v3 = *a1;
  v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x249249249249249)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x124924924924924)
    v9 = 0x249249249249249;
  else
    v9 = v5;
  v22 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[112 * v4];
  __p = v10;
  v19 = v11;
  v20 = v11;
  v21 = &v10[112 * v9];
  v12 = *a2;
  v13 = a2[1];
  *((_QWORD *)v11 + 4) = *((_QWORD *)a2 + 4);
  *(_OWORD *)v11 = v12;
  *((_OWORD *)v11 + 1) = v13;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(v11 + 40), (uint64_t)a2 + 40);
  *(_DWORD *)&v10[112 * v4 + 104] = *((_DWORD *)a2 + 26);
  v20 += 112;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
  v14 = a1[1];
  v15 = v19;
  v16 = v20;
  if (v20 != v19)
  {
    do
    {
      *((_QWORD *)v16 - 9) = off_24EC111F8;
      v16 -= 112;
    }
    while (v16 != v15);
    v20 = v15;
  }
  if (__p)
    operator delete(__p);
  return v14;
}

_QWORD *std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__init_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2230FC550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x24924924924924ALL)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[112 * v4];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  if (a2 != a3)
  {
    v7 = 0;
    do
    {
      v8 = a4 + v7;
      v9 = a2 + v7;
      v10 = *(_OWORD *)(a2 + v7);
      v11 = *(_OWORD *)(a2 + v7 + 16);
      *(_QWORD *)(v8 + 32) = *(_QWORD *)(a2 + v7 + 32);
      *(_OWORD *)v8 = v10;
      *(_OWORD *)(v8 + 16) = v11;
      cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a4 + v7 + 40, a2 + v7 + 40);
      *(_DWORD *)(v8 + 104) = *(_DWORD *)(a2 + v7 + 104);
      v7 += 112;
    }
    while (v9 + 112 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_2230FC648(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  for (; v2; v2 -= 112)
    *(_QWORD *)(v1 - 72 + v2) = off_24EC111F8;
  _Unwind_Resume(a1);
}

void std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vdeallocate(char **a1)
{
  char *v2;
  char *i;

  v2 = *a1;
  if (v2)
  {
    for (i = a1[1]; i != v2; i -= 112)
      *((_QWORD *)i - 9) = off_24EC111F8;
    a1[1] = v2;
    operator delete(v2);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  char *v15;
  char *v16;
  void *__p;
  char *v19;
  char *v20;
  char *v21;
  uint64_t *v22;

  v3 = *a1;
  v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x249249249249249)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x124924924924924)
    v9 = 0x249249249249249;
  else
    v9 = v5;
  v22 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[112 * v4];
  __p = v10;
  v19 = v11;
  v20 = v11;
  v21 = &v10[112 * v9];
  v12 = *a2;
  v13 = a2[1];
  *((_QWORD *)v11 + 4) = *((_QWORD *)a2 + 4);
  *(_OWORD *)v11 = v12;
  *((_OWORD *)v11 + 1) = v13;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(v11 + 40), (uint64_t)a2 + 40);
  *(_DWORD *)&v10[112 * v4 + 104] = *((_DWORD *)a2 + 26);
  v20 += 112;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
  v14 = a1[1];
  v15 = v19;
  v16 = v20;
  if (v20 != v19)
  {
    do
    {
      *((_QWORD *)v16 - 9) = off_24EC111F8;
      v16 -= 112;
    }
    while (v16 != v15);
    v20 = v15;
  }
  if (__p)
    operator delete(__p);
  return v14;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__assign_with_size[abi:ne180100]<RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(uint64_t a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  __int128 *v13;
  uint64_t v14;
  uint64_t i;

  v8 = a1 + 16;
  v9 = *(char **)a1;
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4) < a4)
  {
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vdeallocate((char **)a1);
    if (a4 > 0x249249249249249)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4);
    if (v10 <= a4)
      v10 = a4;
    if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4)) >= 0x124924924924924)
      v11 = 0x249249249249249;
    else
      v11 = v10;
    std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__vallocate[abi:ne180100]((_QWORD *)a1, v11);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v8, (uint64_t)a2, (uint64_t)a3, *(_QWORD *)(a1 + 8));
    goto LABEL_11;
  }
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 4) < a4)
  {
    v13 = &a2[(uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 4];
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,0>(a2, v13, (uint64_t)v9);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*,RoseSyntheticApertureFiltering::InternalRangeMeas*>(v8, (uint64_t)v13, (uint64_t)a3, *(_QWORD *)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = result;
    return result;
  }
  result = (uint64_t)std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,0>(a2, a3, (uint64_t)v9);
  for (i = *(_QWORD *)(a1 + 8); i != v14; i -= 112)
    *(_QWORD *)(i - 72) = off_24EC111F8;
  *(_QWORD *)(a1 + 8) = v14;
  return result;
}

void sub_2230FC9E4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_2230FC9EC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

__int128 *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,RoseSyntheticApertureFiltering::InternalRangeMeas *,0>(__int128 *a1, __int128 *a2, uint64_t a3)
{
  __int128 *v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;

  v4 = a1;
  if (a1 == a2)
    return a1;
  v5 = a2;
  do
  {
    v6 = *v4;
    v7 = v4[1];
    *(_QWORD *)(a3 + 32) = *((_QWORD *)v4 + 4);
    *(_OWORD *)a3 = v6;
    *(_OWORD *)(a3 + 16) = v7;
    cnmatrix::CNMatrixBase<double>::operator=(a3 + 40, (uint64_t)v4 + 40);
    *(_DWORD *)(a3 + 104) = *((_DWORD *)v4 + 26);
    a3 += 112;
    v4 += 7;
  }
  while (v4 != v5);
  return v5;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  char *v15;
  char *v16;
  void *__p;
  char *v19;
  char *v20;
  char *v21;
  uint64_t *v22;

  v3 = *a1;
  v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x249249249249249)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x124924924924924)
    v9 = 0x249249249249249;
  else
    v9 = v5;
  v22 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[112 * v4];
  __p = v10;
  v19 = v11;
  v20 = v11;
  v21 = &v10[112 * v9];
  v12 = *a2;
  v13 = a2[1];
  *((_QWORD *)v11 + 4) = *((_QWORD *)a2 + 4);
  *(_OWORD *)v11 = v12;
  *((_OWORD *)v11 + 1) = v13;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(v11 + 40), (uint64_t)a2 + 40);
  *(_DWORD *)&v10[112 * v4 + 104] = *((_DWORD *)a2 + 26);
  v20 += 112;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
  v14 = a1[1];
  v15 = v19;
  v16 = v20;
  if (v20 != v19)
  {
    do
    {
      *((_QWORD *)v16 - 9) = off_24EC111F8;
      v16 -= 112;
    }
    while (v16 != v15);
    v20 = v15;
  }
  if (__p)
    operator delete(__p);
  return v14;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

_OWORD *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas *,RoseSyntheticApertureFiltering::InternalAoAMeas *,RoseSyntheticApertureFiltering::InternalAoAMeas *>(uint64_t a1, _OWORD *a2, _OWORD *a3, _OWORD *a4)
{
  _OWORD *v5;
  _OWORD *v6;
  __int128 v7;

  v5 = a2;
  if (a2 == a3)
    return a2;
  v6 = a3;
  do
  {
    v7 = v5[1];
    *a4 = *v5;
    a4[1] = v7;
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a4 + 2), (uint64_t)(v5 + 2));
    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a4 + 6), (uint64_t)(v5 + 6));
    a4 += 13;
    v5 += 13;
  }
  while (v5 != v6);
  return v6;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__emplace_back_slow_path<RoseSyntheticApertureFiltering::InternalRangeMeas>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  char *v15;
  char *v16;
  void *__p;
  char *v19;
  char *v20;
  char *v21;
  uint64_t *v22;

  v3 = *a1;
  v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x249249249249249)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x124924924924924)
    v9 = 0x249249249249249;
  else
    v9 = v5;
  v22 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalRangeMeas>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[112 * v4];
  __p = v10;
  v19 = v11;
  v20 = v11;
  v21 = &v10[112 * v9];
  v12 = *a2;
  v13 = a2[1];
  *((_QWORD *)v11 + 4) = *((_QWORD *)a2 + 4);
  *(_OWORD *)v11 = v12;
  *((_OWORD *)v11 + 1) = v13;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(v11 + 40), (uint64_t)a2 + 40);
  *(_DWORD *)&v10[112 * v4 + 104] = *((_DWORD *)a2 + 26);
  v20 += 112;
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__swap_out_circular_buffer(a1, &__p);
  v14 = a1[1];
  v15 = v19;
  v16 = v20;
  if (v20 != v19)
  {
    do
    {
      *((_QWORD *)v16 - 9) = off_24EC111F8;
      v16 -= 112;
    }
    while (v16 != v15);
    v20 = v15;
  }
  if (__p)
    operator delete(__p);
  return v14;
}

double cnmatrix::CNMatrixBase<double>::operator()<int,int>(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  unsigned int v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    cnmatrix::CNMatrixBase<double>::operator()<int,int>();
  v4 = a2 + *(_DWORD *)(a1 + 20) * a3;
  if ((v4 & 0x80000000) != 0)
    cnmatrix::CNMatrixBase<double>::operator()<int,int>();
  if ((signed int)v4 >= *(_DWORD *)(a1 + 16))
    cnmatrix::CNMatrixBase<double>::operator()<int,int>();
  return *(double *)(v3 + 8 * v4);
}

void std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *i;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    for (i = (char *)v1[1]; i != v2; i -= 136)
    {
      *((_QWORD *)i - 8) = off_24EC111F8;
      *((_QWORD *)i - 16) = off_24EC111F8;
    }
    v1[1] = v2;
    operator delete(v2);
  }
}

void std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *i;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    for (i = (char *)v1[1]; i != v2; i -= 192)
    {
      *((_QWORD *)i - 11) = off_24EC111F8;
      *((_QWORD *)i - 22) = off_24EC111F8;
    }
    v1[1] = v2;
    operator delete(v2);
  }
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1E1E1E1E1E1E1E2)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(136 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v11 = 0;
  v12 = a7 - 136;
  while (a3 + v11 != a5)
  {
    v13 = (_QWORD *)(v12 + v11);
    v11 -= 136;
    std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas,RoseSyntheticApertureFiltering::InternalExpectedRangeMeas const&>(a1, v13, (_QWORD *)(v11 + a3));
  }
  return a6;
}

double std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas,RoseSyntheticApertureFiltering::InternalExpectedRangeMeas const&>(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v4;
  double result;

  v4 = (uint64_t)(a3 + 9);
  *a2 = *a3;
  cnmatrix::CNMatrix<1u,3u,double>::CNMatrix((uint64_t)(a2 + 1), (uint64_t)(a3 + 1));
  *(_QWORD *)&result = cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(a2 + 9), v4).n128_u64[0];
  return result;
}

void sub_2230FD0C4(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

__n128 cnmatrix::CNMatrix<1u,3u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  __n128 result;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  _OWORD *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __n128 *v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  const char *v16;
  int v17;
  const char *v18;
  const char *v19;

  result.n128_u64[0] = 0x300000001;
  *(_QWORD *)(a1 + 24) = 0x300000001;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = &off_24EC114A0;
  if (a1 == a2)
  {
    v16 = "this != &(A)";
    v17 = 603;
LABEL_21:
    v18 = "cnmatrix.h";
    v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 1)
  {
    v16 = "this->max_num_rows_ >= num_rows";
    v17 = 422;
LABEL_18:
    v18 = "cnmatrixbase.h";
    v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 4)
  {
    v16 = "this->max_num_cols_ >= num_cols";
    v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  v6 = (_OWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 1u)
  {
    v16 = "this->max_num_rows_ >= A.num_rows_";
    v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 3u)
  {
    v16 = "this->max_num_cols_ >= A.num_cols_";
    v17 = 617;
    goto LABEL_21;
  }
  v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    v10 = (v7 - 2);
    v11 = *(__int128 **)(a2 + 32);
    v12 = (__n128 *)((char *)v6 + 8 * v10);
    v13 = (v7 - 1) >> 1;
    v14 = v11;
    do
    {
      v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    result = *(__n128 *)((char *)v11 + 8 * v10);
    *v12 = result;
  }
  else if ((_DWORD)v5)
  {
    v8 = *(unint64_t **)(a2 + 32);
    do
    {
      v9 = *v8++;
      result.n128_u64[0] = v9;
      *(_QWORD *)v6 = v9;
      v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_2230FD230(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

cnprint::CNPrinter *cnmatrix::Inv<double>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  __CLPK_doublereal *v10;
  __CLPK_integer v11;
  void *v12;
  size_t v13;
  __CLPK_integer *v14;
  __CLPK_integer *v15;
  __CLPK_doublereal *v16;
  __CLPK_integer v17;
  size_t v18;
  __CLPK_integer *v19;
  __CLPK_integer *v20;
  cnprint::CNPrinter *result;
  int v22;
  __CLPK_integer v23;
  __CLPK_integer __info;
  __CLPK_integer __lda;
  __CLPK_integer __n;
  __CLPK_integer __m;

  if (a1 == a3)
    cnmatrix::Inv<double>();
  if (a1 == a4)
    cnmatrix::Inv<double>();
  if (a3 == a4)
    cnmatrix::Inv<double>();
  v7 = *(_DWORD *)(a1 + 8);
  if (v7 != *(_DWORD *)(a1 + 12))
    cnmatrix::Inv<double>();
  if (*(_DWORD *)(a2 + 28) * *(_DWORD *)(a2 + 24) < v7)
    cnmatrix::Inv<double>();
  if (*(_DWORD *)(a3 + 28) * *(_DWORD *)(a3 + 24) < 4 * v7)
    cnmatrix::Inv<double>();
  if (*(_DWORD *)(a4 + 24) < v7)
    cnmatrix::Inv<double>();
  if (*(_DWORD *)(a4 + 28) < v7)
    cnmatrix::Inv<double>();
  cnmatrix::CNMatrixBase<double>::operator=(a4, a1);
  v8 = *(unsigned int *)(a4 + 8);
  v9 = *(unsigned int *)(a4 + 12);
  v10 = *(__CLPK_doublereal **)(a4 + 32);
  v11 = *(_DWORD *)(a4 + 20);
  v12 = *(void **)(a2 + 32);
  __n = *(_DWORD *)(a4 + 12);
  __m = v8;
  __lda = v11;
  if ((int)v8 < 1)
    goto LABEL_37;
  v13 = 4 * v8;
  v14 = (__CLPK_integer *)operator new[](4 * v8, MEMORY[0x24BEDB6B8]);
  if (!v14)
    cnmatrix::Inv<double>();
  v15 = v14;
  __info = 0;
  dgetrf_(&__m, &__n, v10, &__lda, v14, &__info);
  memcpy(v12, v15, v13);
  MEMORY[0x227682F70](v15, 0x1000C8052888210);
  if (__info)
  {
    if (__info >= 1)
    {
      LOWORD(__m) = 4;
      LOBYTE(__n) = 2;
      cnprint::CNPrinter::Print();
      goto LABEL_14;
    }
LABEL_37:
    cnmatrix::Inv<double>();
  }
LABEL_14:
  v16 = *(__CLPK_doublereal **)(a3 + 32);
  v17 = *(_DWORD *)(a3 + 28) * *(_DWORD *)(a3 + 24);
  __n = v11;
  __m = v9;
  if ((int)v9 < 1)
  {
    v23 = -1;
LABEL_20:
    LOWORD(__m) = 4;
    LOBYTE(__n) = 5;
    result = (cnprint::CNPrinter *)cnprint::CNPrinter::Print();
    v22 = 1;
    goto LABEL_21;
  }
  v18 = 4 * v9;
  v19 = (__CLPK_integer *)operator new[](v18, MEMORY[0x24BEDB6B8]);
  if (!v19)
  {
    v23 = -4;
    goto LABEL_20;
  }
  v20 = v19;
  memcpy(v19, v12, v18);
  __info = 0;
  __lda = v17;
  dgetri_(&__m, v10, &__n, v20, v16, &__lda, &__info);
  result = (cnprint::CNPrinter *)MEMORY[0x227682F70](v20, 0x1000C8052888210);
  v22 = 0;
  v23 = __info;
  if (__info < 0)
    goto LABEL_20;
LABEL_21:
  if (v17 < (int)**(double **)(a3 + 32))
  {
    result = (cnprint::CNPrinter *)cnprint::CNPrinter::GetLogLevel(result);
    if (result <= 1)
    {
      LOWORD(__m) = 4;
      LOBYTE(__n) = 1;
      result = (cnprint::CNPrinter *)cnprint::CNPrinter::Print();
    }
  }
  if (v22)
    cnmatrix::Inv<double>();
  if (v23)
    return (cnprint::CNPrinter *)cnmatrix::CNMatrixBase<double>::WriteValue(a4, INFINITY);
  return result;
}

_QWORD *cnmatrix::CNMatrix<12u,1u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

_QWORD *cnmatrix::CNMatrix<3u,1u,int>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC115D0;
  return result;
}

void cnmatrix::CNMatrix<3u,1u,int>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC115D0;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<3u,1u,int>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<3u,1u,int>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[3];

  cnmatrix::CNMatrix<3u,1u,int>::TransposeDataFootprint(a1, v3, a3);
}

void cnmatrix::CNMatrix<3u,1u,int>::TransposeDataFootprint(uint64_t a1, char *a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v5;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int v13;
  int v14;
  int v15;

  v3 = *(_DWORD *)(a1 + 8);
  if (v3 >= 2)
  {
    v5 = *(_DWORD *)(a1 + 12);
    if (v5 >= 2)
    {
      if (!a2)
        cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, 0, a3);
      v7 = v5 + v3 - *(_DWORD *)(a1 + 20);
      if (v7 <= 0)
        cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, (uint64_t)a2, a3);
      bzero(a2, *(unsigned int *)(a1 + 16));
      v8 = *(_DWORD *)(a1 + 16);
      if (v8 >= 3)
      {
        v9 = (v8 - 1);
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 1;
        do
        {
          v12 = &a2[v11];
          if (!a2[v11])
          {
            v13 = *(_DWORD *)(v10 + 4 * v11);
            v14 = v11;
            do
            {
              v14 = v14 * v7 % (int)v9;
              v15 = *(_DWORD *)(v10 + 4 * v14);
              *(_DWORD *)(v10 + 4 * v14) = v13;
              *v12 = 1;
              v12 = &a2[v14];
              v13 = v15;
            }
            while (!*v12);
          }
          ++v11;
        }
        while (v11 != v9);
      }
    }
  }
}

void cnmatrix::CNMatrix<12u,1u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<12u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<12u,1u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[12];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

void std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  char *v7;
  void (**v8)(char *);
  BOOL v9;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = v4 - 64;
      v7 = v4 - 64;
      do
      {
        v8 = *(void (***)(char *))v7;
        v7 -= 64;
        (*v8)(v6);
        v9 = v6 == v2;
        v6 = v7;
      }
      while (!v9);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<cnmatrix::CNMatrix<3u,1u,double>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<3u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<3u,1u,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a2 << 6);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<3u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<3u,1u,double>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = 0;
  v11 = a7 - 64;
  while (a3 + v10 != a5)
  {
    v12 = v11 + v10;
    v10 -= 64;
    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v12, v10 + a3);
  }
  return a6;
}

uint64_t std::__split_buffer<cnmatrix::CNMatrix<3u,1u,double>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  void (**v4)(void);

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(void (***)(void))(i - 64);
    *(_QWORD *)(a1 + 16) = i - 64;
    (*v4)();
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v3 = (char *)v1[1];
    if (v3 != v2)
    {
      v4 = v3 - 368;
      do
      {
        *((_QWORD *)v4 + 30) = off_24EC111F8;
        *((_QWORD *)v4 + 16) = off_24EC111F8;
        *((_QWORD *)v4 + 8) = off_24EC111F8;
        *(_QWORD *)v4 = off_24EC111F8;
        v5 = v4 - 8;
        v4 -= 376;
      }
      while (v5 != v2);
    }
    v1[1] = v2;
    operator delete(v2);
  }
}

uint64_t std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t *v14;

  v3 = 0x51B3BEA3677D46CFLL * ((a1[1] - *a1) >> 3);
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0xAE4C415C9882B9)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  if (0xA3677D46CEFA8D9ELL * ((a1[2] - *a1) >> 3) > v4)
    v4 = 0xA3677D46CEFA8D9ELL * ((a1[2] - *a1) >> 3);
  if ((unint64_t)(0x51B3BEA3677D46CFLL * ((a1[2] - *a1) >> 3)) >= 0x572620AE4C415CLL)
    v6 = 0xAE4C415C9882B9;
  else
    v6 = v4;
  v14 = a1 + 2;
  if (v6)
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>>((uint64_t)(a1 + 2), v6);
  else
    v7 = 0;
  v10 = v7;
  v11 = &v7[376 * v3];
  v13 = &v7[376 * v6];
  std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult>((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  v12 = v11 + 376;
  std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__swap_out_circular_buffer(a1, &v10);
  v8 = a1[1];
  std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer((uint64_t)&v10);
  return v8;
}

void sub_2230FDA38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a3 + 72;
  *(_BYTE *)a2 = *(_BYTE *)a3;
  v6 = a2 + 72;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2 + 8, a3 + 8);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v6, v5);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 136, a3 + 136);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 248, a3 + 248);
  v7 = *(_QWORD *)(a3 + 360);
  *(_DWORD *)(a2 + 368) = *(_DWORD *)(a3 + 368);
  *(_QWORD *)(a2 + 360) = v7;
}

void sub_2230FDAD4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;

  *v3 = off_24EC111F8;
  *v2 = off_24EC111F8;
  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAE4C415C9882BALL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(376 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>,std::reverse_iterator<RoseSyntheticApertureFiltering::FilterInitializationResult*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v11 = 0;
  v12 = a7 - 376;
  while (a3 + v11 != a5)
  {
    v13 = v12 + v11;
    v11 -= 376;
    std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>(a1, v13, v11 + a3);
  }
  return a6;
}

void std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a3 + 72;
  *(_BYTE *)a2 = *(_BYTE *)a3;
  v6 = a2 + 72;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2 + 8, a3 + 8);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v6, v5);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 136, a3 + 136);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 248, a3 + 248);
  v7 = *(_QWORD *)(a3 + 360);
  *(_DWORD *)(a2 + 368) = *(_DWORD *)(a3 + 368);
  *(_QWORD *)(a2 + 360) = v7;
}

void sub_2230FDCF4(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;

  *v3 = off_24EC111F8;
  *v2 = off_24EC111F8;
  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 16);
  if (v3 != v2)
  {
    v4 = v3 - 46;
    do
    {
      v4[30] = off_24EC111F8;
      v4[16] = off_24EC111F8;
      v4[8] = off_24EC111F8;
      *v4 = off_24EC111F8;
      v5 = v4 - 1;
      v4 -= 47;
    }
    while (v5 != v2);
    *(_QWORD *)(a1 + 16) = v2;
  }
  v6 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v6);
  return a1;
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  int v7;

  v5 = a2;
  if (a2 == a3)
    return a2;
  v6 = a3;
  do
  {
    *(_BYTE *)a4 = *(_BYTE *)v5;
    cnmatrix::CNMatrixBase<double>::operator=(a4 + 8, v5 + 8);
    cnmatrix::CNMatrixBase<double>::operator=(a4 + 72, v5 + 72);
    cnmatrix::CNMatrixBase<double>::operator=(a4 + 136, v5 + 136);
    cnmatrix::CNMatrixBase<double>::operator=(a4 + 248, v5 + 248);
    v7 = *(_DWORD *)(v5 + 368);
    *(_QWORD *)(a4 + 360) = *(_QWORD *)(v5 + 360);
    *(_DWORD *)(a4 + 368) = v7;
    a4 += 376;
    v5 += 376;
  }
  while (v5 != v6);
  return v6;
}

void std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(uint64_t a1, char *a2, uint64_t a3, char a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  double v24;
  unint64_t v25;
  double v26;
  char *v27;
  double v28;
  double v29;
  char *v30;
  int v31;
  __n128 v32;
  int v33;
  BOOL v34;
  double v35;
  uint64_t v36;
  double v37;
  unint64_t v38;
  double v39;
  char *v40;
  char *v41;
  double v42;
  double v43;
  double v44;
  char *v45;
  int v46;
  int v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  int v59;
  int64_t v60;
  int64_t v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int v77;
  int64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int64_t v86;
  int v87;
  _BYTE *v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  unint64_t v92;
  double v93;
  uint64_t v94;
  int v95;
  int v96;
  int v97;
  BOOL v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  double v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v116;
  int64_t v117;
  double *v118;
  uint64_t v119;
  char v121;
  _BYTE v122[64];
  _BYTE v123[64];
  _BYTE v124[112];
  _BYTE v125[112];
  uint64_t v126;
  int v127;
  char v128;
  _BYTE v129[64];
  _BYTE v130[64];
  _BYTE v131[112];
  _BYTE v132[112];
  double v133;
  int v134;

LABEL_1:
  v112 = a2 - 376;
  v110 = (uint64_t)(a2 - 1128);
  v111 = (uint64_t)(a2 - 752);
  v6 = a1;
  v119 = (uint64_t)a2;
  while (2)
  {
    v7 = v6;
    v8 = (uint64_t)&a2[-v6];
    v9 = 0x51B3BEA3677D46CFLL * ((uint64_t)&a2[-v6] >> 3);
    a1 = v7;
    switch(v9)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if (*((double *)a2 - 2) < *(double *)(v7 + 360))
        {
          v48 = (char *)v7;
          v49 = v112;
          goto LABEL_55;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v7, v7 + 376, (uint64_t)v112);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v7, v7 + 376, v7 + 752, (uint64_t)v112);
        return;
      case 5uLL:
        v50 = (char *)(v7 + 752);
        v51 = (char *)(v7 + 1128);
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v7, v7 + 376, v7 + 752, v7 + 1128);
        if (*((double *)a2 - 2) < *(double *)(v7 + 1488))
        {
          std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(v51, v112);
          if (*(double *)(v7 + 1488) < *(double *)(v7 + 1112))
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(v50, v51);
            if (*(double *)(v7 + 1112) < *(double *)(v7 + 736))
            {
              std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)(v7 + 376), v50);
              if (*(double *)(v7 + 736) < *(double *)(v7 + 360))
              {
                v48 = (char *)v7;
                v49 = (char *)(v7 + 376);
LABEL_55:
                std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(v48, v49);
              }
            }
          }
        }
        return;
      default:
        if (v8 <= 9023)
        {
          if ((a4 & 1) != 0)
          {
            if ((char *)v7 != a2)
            {
              v52 = (char *)(v7 + 376);
              if ((char *)(v7 + 376) != a2)
              {
                v53 = 0;
                v54 = v7;
                do
                {
                  v55 = v52;
                  if (*(double *)(v54 + 736) < *(double *)(v54 + 360))
                  {
                    v128 = *v52;
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v129, v54 + 384);
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v130, v54 + 448);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v131, v54 + 512);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v132, v54 + 624);
                    v133 = *(double *)(v54 + 736);
                    v134 = *(_DWORD *)(v54 + 744);
                    v56 = v53;
                    while (1)
                    {
                      v57 = v7 + v56;
                      *(_BYTE *)(v7 + v56 + 376) = *(_BYTE *)(v7 + v56);
                      cnmatrix::CNMatrixBase<double>::operator=(v7 + v56 + 384, v7 + v56 + 8);
                      cnmatrix::CNMatrixBase<double>::operator=(v57 + 448, v57 + 72);
                      cnmatrix::CNMatrixBase<double>::operator=(v57 + 512, v57 + 136);
                      cnmatrix::CNMatrixBase<double>::operator=(v57 + 624, v57 + 248);
                      *(_QWORD *)(v57 + 736) = *(_QWORD *)(v57 + 360);
                      *(_DWORD *)(v57 + 744) = *(_DWORD *)(v57 + 368);
                      if (!v56)
                        break;
                      v56 -= 376;
                      if (v133 >= *(double *)(v57 - 16))
                      {
                        v58 = (_BYTE *)(v7 + v56 + 376);
                        goto LABEL_73;
                      }
                    }
                    v58 = (_BYTE *)v7;
LABEL_73:
                    a2 = (char *)v119;
                    *v58 = v128;
                    cnmatrix::CNMatrixBase<double>::operator=(v57 + 8, (uint64_t)v129);
                    cnmatrix::CNMatrixBase<double>::operator=(v57 + 72, (uint64_t)v130);
                    cnmatrix::CNMatrixBase<double>::operator=(v57 + 136, (uint64_t)v131);
                    cnmatrix::CNMatrixBase<double>::operator=(v57 + 248, (uint64_t)v132);
                    v59 = v134;
                    *(double *)(v57 + 360) = v133;
                    *(_DWORD *)(v57 + 368) = v59;
                  }
                  v52 = v55 + 376;
                  v53 += 376;
                  v54 = (uint64_t)v55;
                }
                while (v55 + 376 != a2);
              }
            }
          }
          else if ((char *)v7 != a2)
          {
            v99 = (char *)(v7 + 376);
            if ((char *)(v7 + 376) != a2)
            {
              v100 = v7 - 16;
              do
              {
                v101 = v99;
                if (*(double *)(a1 + 736) < *(double *)(a1 + 360))
                {
                  v128 = *v99;
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v129, a1 + 384);
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v130, a1 + 448);
                  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v131, a1 + 512);
                  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v132, a1 + 624);
                  v133 = *(double *)(a1 + 736);
                  v134 = *(_DWORD *)(a1 + 744);
                  v102 = v100;
                  do
                  {
                    *(_BYTE *)(v102 + 392) = *(_BYTE *)(v102 + 16);
                    cnmatrix::CNMatrixBase<double>::operator=(v102 + 400, v102 + 24);
                    cnmatrix::CNMatrixBase<double>::operator=(v102 + 464, v102 + 88);
                    cnmatrix::CNMatrixBase<double>::operator=(v102 + 528, v102 + 152);
                    cnmatrix::CNMatrixBase<double>::operator=(v102 + 640, v102 + 264);
                    *(_DWORD *)(v102 + 760) = *(_DWORD *)(v102 + 384);
                    *(_QWORD *)(v102 + 752) = *(_QWORD *)(v102 + 376);
                    v103 = *(double *)v102;
                    v102 -= 376;
                  }
                  while (v133 < v103);
                  *(_BYTE *)(v102 + 392) = v128;
                  cnmatrix::CNMatrixBase<double>::operator=(v102 + 400, (uint64_t)v129);
                  cnmatrix::CNMatrixBase<double>::operator=(v102 + 464, (uint64_t)v130);
                  cnmatrix::CNMatrixBase<double>::operator=(v102 + 528, (uint64_t)v131);
                  cnmatrix::CNMatrixBase<double>::operator=(v102 + 640, (uint64_t)v132);
                  v104 = v134;
                  *(double *)(v102 + 752) = v133;
                  *(_DWORD *)(v102 + 760) = v104;
                  a2 = (char *)v119;
                }
                v99 = v101 + 376;
                v100 += 376;
                a1 = (uint64_t)v101;
              }
              while (v101 + 376 != a2);
            }
          }
          return;
        }
        if (!a3)
        {
          if ((char *)v7 != a2)
          {
            v113 = v8;
            v60 = (v9 - 2) >> 1;
            v61 = v60;
            v62 = v7;
            do
            {
              v63 = v61;
              if (v60 >= v61)
              {
                v64 = (2 * v61) | 1;
                v65 = v62 + 376 * v64;
                if (2 * v61 + 2 < (uint64_t)v9 && *(double *)(v62 + 376 * v64 + 360) < *(double *)(v65 + 736))
                {
                  v65 += 376;
                  v64 = 2 * v61 + 2;
                }
                v66 = v62 + 376 * v61;
                if (*(double *)(v65 + 360) >= *(double *)(v66 + 360))
                {
                  v67 = v62 + 376 * v63;
                  v68 = v66 + 360;
                  v128 = *(_BYTE *)v67;
                  v117 = v63;
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v129, v67 + 8);
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v130, v67 + 72);
                  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v131, v67 + 136);
                  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v132, v67 + 248);
                  v69 = *(double *)v68;
                  v134 = *(_DWORD *)(v68 + 8);
                  v133 = v69;
                  do
                  {
                    v70 = v65;
                    *(_BYTE *)v67 = *(_BYTE *)v65;
                    v71 = v65 + 8;
                    cnmatrix::CNMatrixBase<double>::operator=(v67 + 8, v65 + 8);
                    v72 = v65 + 72;
                    cnmatrix::CNMatrixBase<double>::operator=(v67 + 72, v65 + 72);
                    v73 = v65 + 136;
                    cnmatrix::CNMatrixBase<double>::operator=(v67 + 136, v65 + 136);
                    v74 = v65 + 248;
                    cnmatrix::CNMatrixBase<double>::operator=(v67 + 248, v65 + 248);
                    v75 = *(_DWORD *)(v65 + 368);
                    *(_QWORD *)(v67 + 360) = *(_QWORD *)(v65 + 360);
                    *(_DWORD *)(v67 + 368) = v75;
                    if (v60 < v64)
                      break;
                    v76 = (2 * v64) | 1;
                    v65 = a1 + 376 * v76;
                    if (2 * v64 + 2 < (uint64_t)v9 && *(double *)(a1 + 376 * v76 + 360) < *(double *)(v65 + 736))
                    {
                      v65 += 376;
                      v76 = 2 * v64 + 2;
                    }
                    v67 = v70;
                    v64 = v76;
                  }
                  while (*(double *)(v65 + 360) >= v133);
                  *(_BYTE *)v70 = v128;
                  cnmatrix::CNMatrixBase<double>::operator=(v71, (uint64_t)v129);
                  cnmatrix::CNMatrixBase<double>::operator=(v72, (uint64_t)v130);
                  cnmatrix::CNMatrixBase<double>::operator=(v73, (uint64_t)v131);
                  cnmatrix::CNMatrixBase<double>::operator=(v74, (uint64_t)v132);
                  v63 = v117;
                  v77 = v134;
                  *(double *)(v70 + 360) = v133;
                  *(_DWORD *)(v70 + 368) = v77;
                  v62 = a1;
                }
              }
              v61 = v63 - 1;
            }
            while (v63);
            v78 = v113 / 0x178;
            v109 = v62 + 8;
            v107 = v62 + 136;
            v108 = v62 + 72;
            v105 = v62 + 360;
            v106 = v62 + 248;
            v79 = v119;
            do
            {
              v114 = v79;
              v80 = a1;
              v121 = *(_BYTE *)a1;
              cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v122, v109);
              cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v123, v108);
              cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v124, v107);
              cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v125, v106);
              v81 = 0;
              v82 = *(_QWORD *)v105;
              v127 = *(_DWORD *)(v105 + 8);
              v126 = v82;
              do
              {
                v83 = v80;
                v84 = v81 + 1;
                v80 += 376 * (v81 + 1);
                v85 = 2 * v81;
                v81 = (2 * v81) | 1;
                v86 = v85 + 2;
                if (v86 < v78 && *(double *)(v83 + 376 * v84 + 360) < *(double *)(v80 + 736))
                {
                  v80 += 376;
                  v81 = v86;
                }
                *(_BYTE *)v83 = *(_BYTE *)v80;
                cnmatrix::CNMatrixBase<double>::operator=(v83 + 8, v80 + 8);
                cnmatrix::CNMatrixBase<double>::operator=(v83 + 72, v80 + 72);
                cnmatrix::CNMatrixBase<double>::operator=(v83 + 136, v80 + 136);
                cnmatrix::CNMatrixBase<double>::operator=(v83 + 248, v80 + 248);
                v87 = *(_DWORD *)(v80 + 368);
                *(_QWORD *)(v83 + 360) = *(_QWORD *)(v80 + 360);
                *(_DWORD *)(v83 + 368) = v87;
              }
              while (v81 <= (uint64_t)((unint64_t)(v78 - 2) >> 1));
              v88 = (_BYTE *)(v114 - 376);
              v118 = (double *)(v80 + 360);
              if (v80 == v114 - 376)
              {
                *(_BYTE *)v80 = v121;
                cnmatrix::CNMatrixBase<double>::operator=(v80 + 8, (uint64_t)v122);
                cnmatrix::CNMatrixBase<double>::operator=(v80 + 72, (uint64_t)v123);
                cnmatrix::CNMatrixBase<double>::operator=(v80 + 136, (uint64_t)v124);
                cnmatrix::CNMatrixBase<double>::operator=(v80 + 248, (uint64_t)v125);
                v97 = v127;
                *(_QWORD *)v118 = v126;
                *(_DWORD *)(v80 + 368) = v97;
              }
              else
              {
                *(_BYTE *)v80 = *v88;
                cnmatrix::CNMatrixBase<double>::operator=(v80 + 8, v114 - 368);
                cnmatrix::CNMatrixBase<double>::operator=(v80 + 72, v114 - 304);
                cnmatrix::CNMatrixBase<double>::operator=(v80 + 136, v114 - 240);
                cnmatrix::CNMatrixBase<double>::operator=(v80 + 248, v114 - 128);
                v89 = *(_QWORD *)(v114 - 16);
                *(_DWORD *)(v80 + 368) = *(_DWORD *)(v114 - 8);
                *(_QWORD *)v118 = v89;
                *v88 = v121;
                cnmatrix::CNMatrixBase<double>::operator=(v114 - 368, (uint64_t)v122);
                cnmatrix::CNMatrixBase<double>::operator=(v114 - 304, (uint64_t)v123);
                cnmatrix::CNMatrixBase<double>::operator=(v114 - 240, (uint64_t)v124);
                cnmatrix::CNMatrixBase<double>::operator=(v114 - 128, (uint64_t)v125);
                v90 = v127;
                *(_QWORD *)(v114 - 16) = v126;
                *(_DWORD *)(v114 - 8) = v90;
                v91 = v80 - a1 + 376;
                if (v91 >= 377)
                {
                  v92 = (v91 / 0x178uLL - 2) >> 1;
                  if (*(double *)(a1 + 376 * v92 + 360) < *v118)
                  {
                    v128 = *(_BYTE *)v80;
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v129, v80 + 8);
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v130, v80 + 72);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v131, v80 + 136);
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v132, v80 + 248);
                    v93 = *v118;
                    v134 = *(_DWORD *)(v80 + 368);
                    v133 = v93;
                    do
                    {
                      v94 = v80;
                      v80 = a1 + 376 * v92;
                      *(_BYTE *)v94 = *(_BYTE *)v80;
                      cnmatrix::CNMatrixBase<double>::operator=(v94 + 8, v80 + 8);
                      cnmatrix::CNMatrixBase<double>::operator=(v94 + 72, v80 + 72);
                      cnmatrix::CNMatrixBase<double>::operator=(v94 + 136, v80 + 136);
                      cnmatrix::CNMatrixBase<double>::operator=(v94 + 248, v80 + 248);
                      v95 = *(_DWORD *)(v80 + 368);
                      *(_QWORD *)(v94 + 360) = *(_QWORD *)(v80 + 360);
                      *(_DWORD *)(v94 + 368) = v95;
                      if (!v92)
                        break;
                      v92 = (v92 - 1) >> 1;
                    }
                    while (*(double *)(a1 + 376 * v92 + 360) < v133);
                    *(_BYTE *)v80 = v128;
                    cnmatrix::CNMatrixBase<double>::operator=(v80 + 8, (uint64_t)v129);
                    cnmatrix::CNMatrixBase<double>::operator=(v80 + 72, (uint64_t)v130);
                    cnmatrix::CNMatrixBase<double>::operator=(v80 + 136, (uint64_t)v131);
                    cnmatrix::CNMatrixBase<double>::operator=(v80 + 248, (uint64_t)v132);
                    v96 = v134;
                    *(double *)(v80 + 360) = v133;
                    *(_DWORD *)(v80 + 368) = v96;
                  }
                }
              }
              v98 = v78-- <= 2;
              v79 = v114 - 376;
            }
            while (!v98);
          }
          return;
        }
        v10 = v9 >> 1;
        if ((unint64_t)v8 < 0xBC01)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v7 + 376 * (v9 >> 1), v7, (uint64_t)v112);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v7, v7 + 376 * (v9 >> 1), (uint64_t)v112);
          v11 = 376 * v10;
          v12 = 376 * v10 + v7 - 376;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v7 + 376, v12, v111);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v7 + 752, v7 + 376 + v11, v110);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v12, v7 + 376 * (v9 >> 1), v7 + 376 + v11);
          std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v7, (char *)(v7 + 376 * (v9 >> 1)));
        }
        --a3;
        if ((a4 & 1) == 0 && *(double *)(v7 - 16) >= *(double *)(v7 + 360))
        {
          v128 = *(_BYTE *)v7;
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v129, v7 + 8);
          cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v130, v7 + 72);
          cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v131, v7 + 136);
          cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v132, v7 + 248);
          v35 = *(double *)(v7 + 360);
          v134 = *(_DWORD *)(v7 + 368);
          v133 = v35;
          if (v35 >= *((double *)a2 - 2))
          {
            v38 = v7 + 376;
            do
            {
              v6 = v38;
              if (v38 >= (unint64_t)a2)
                break;
              v39 = *(double *)(v38 + 360);
              v38 += 376;
            }
            while (v133 >= v39);
          }
          else
          {
            v36 = v7;
            do
            {
              v6 = v36 + 376;
              v37 = *(double *)(v36 + 736);
              v36 += 376;
            }
            while (v133 >= v37);
          }
          v40 = a2;
          if (v6 < (unint64_t)a2)
          {
            v41 = a2;
            do
            {
              v40 = v41 - 376;
              v42 = *((double *)v41 - 2);
              v41 -= 376;
            }
            while (v133 < v42);
          }
          while (v6 < (unint64_t)v40)
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v6, v40);
            do
            {
              v43 = *(double *)(v6 + 736);
              v6 += 376;
            }
            while (v133 >= v43);
            do
            {
              v44 = *((double *)v40 - 2);
              v40 -= 376;
            }
            while (v133 < v44);
          }
          v45 = (char *)(v6 - 376);
          if (v6 - 376 != v7)
          {
            *(_BYTE *)v7 = *v45;
            cnmatrix::CNMatrixBase<double>::operator=(v7 + 8, v6 - 368);
            cnmatrix::CNMatrixBase<double>::operator=(v7 + 72, v6 - 304);
            cnmatrix::CNMatrixBase<double>::operator=(v7 + 136, v6 - 240);
            cnmatrix::CNMatrixBase<double>::operator=(v7 + 248, v6 - 128);
            v46 = *(_DWORD *)(v6 - 8);
            *(_QWORD *)(v7 + 360) = *(_QWORD *)(v6 - 16);
            *(_DWORD *)(v7 + 368) = v46;
          }
          *v45 = v128;
          cnmatrix::CNMatrixBase<double>::operator=(v6 - 368, (uint64_t)v129);
          cnmatrix::CNMatrixBase<double>::operator=(v6 - 304, (uint64_t)v130);
          cnmatrix::CNMatrixBase<double>::operator=(v6 - 240, (uint64_t)v131);
          cnmatrix::CNMatrixBase<double>::operator=(v6 - 128, (uint64_t)v132);
          a4 = 0;
          v47 = v134;
          *(double *)(v6 - 16) = v133;
          *(_DWORD *)(v6 - 8) = v47;
          continue;
        }
        v116 = a3;
        v128 = *(_BYTE *)v7;
        v13 = v7 + 8;
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v129, v7 + 8);
        v14 = v7 + 72;
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v130, v7 + 72);
        v15 = v7 + 136;
        cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v131, v7 + 136);
        v16 = v7 + 248;
        cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v132, v7 + 248);
        v17 = 0;
        v18 = v7 + 360;
        v19 = *(double *)(v7 + 360);
        v134 = *(_DWORD *)(v7 + 368);
        v133 = v19;
        do
        {
          v20 = *(double *)(v7 + v17 + 736);
          v17 += 376;
        }
        while (v20 < v133);
        v21 = v7 + v17;
        v22 = v119;
        if (v17 == 376)
        {
          v25 = v119;
          while (v21 < v25)
          {
            v23 = (char *)(v25 - 376);
            v26 = *(double *)(v25 - 16);
            v25 -= 376;
            if (v26 < v133)
              goto LABEL_20;
          }
          v23 = (char *)v25;
        }
        else
        {
          do
          {
            v23 = (char *)(v22 - 376);
            v24 = *(double *)(v22 - 16);
            v22 -= 376;
          }
          while (v24 >= v133);
        }
LABEL_20:
        v6 = v21;
        if (v21 < (unint64_t)v23)
        {
          v27 = v23;
          do
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v6, v27);
            do
            {
              v28 = *(double *)(v6 + 736);
              v6 += 376;
            }
            while (v28 < v133);
            do
            {
              v29 = *((double *)v27 - 2);
              v27 -= 376;
            }
            while (v29 >= v133);
          }
          while (v6 < (unint64_t)v27);
        }
        v30 = (char *)(v6 - 376);
        if (v6 - 376 != a1)
        {
          *(_BYTE *)a1 = *v30;
          cnmatrix::CNMatrixBase<double>::operator=(v13, v6 - 368);
          cnmatrix::CNMatrixBase<double>::operator=(v14, v6 - 304);
          cnmatrix::CNMatrixBase<double>::operator=(v15, v6 - 240);
          cnmatrix::CNMatrixBase<double>::operator=(v16, v6 - 128);
          v31 = *(_DWORD *)(v6 - 8);
          *(_QWORD *)v18 = *(_QWORD *)(v6 - 16);
          *(_DWORD *)(v18 + 8) = v31;
        }
        *v30 = v128;
        cnmatrix::CNMatrixBase<double>::operator=(v6 - 368, (uint64_t)v129);
        cnmatrix::CNMatrixBase<double>::operator=(v6 - 304, (uint64_t)v130);
        cnmatrix::CNMatrixBase<double>::operator=(v6 - 240, (uint64_t)v131);
        v32 = cnmatrix::CNMatrixBase<double>::operator=(v6 - 128, (uint64_t)v132);
        a3 = v116;
        v33 = v134;
        *(double *)(v6 - 16) = v133;
        *(_DWORD *)(v6 - 8) = v33;
        a2 = (char *)v119;
        if (v21 < (unint64_t)v23)
        {
LABEL_31:
          std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(a1, v6 - 376, v116, a4 & 1, v32);
          a4 = 0;
          continue;
        }
        v34 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, v6 - 376);
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v6, v119))
        {
          if (v34)
            continue;
          goto LABEL_31;
        }
        a2 = (char *)(v6 - 376);
        if (!v34)
          goto LABEL_1;
        return;
    }
  }
}

  v136 = a2 - 376;
  v138 = (unint64_t)a2;
  v127 = (uint64_t)(a2 - 1128);
  v129 = (uint64_t)(a2 - 752);
  v131 = a2 - 384;
  k = (unint64_t)a1;
  while (2)
  {
    v8 = k;
    v9 = (uint64_t)&a2[-k];
    v10 = 0x51B3BEA3677D46CFLL * ((uint64_t)&a2[-k] >> 3);
    switch(v10)
    {
      case 0:
      case 1:
        return;
      case 2:
        v54 = *((_DWORD *)a2 - 2);
        v55 = *(_DWORD *)(v8 + 368);
        if (v54 < v55 || v54 <= v55 && *((double *)a2 - 2) < *(double *)(v8 + 360))
          std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v8, v136);
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v8, v8 + 376, (uint64_t)v136);
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v8, v8 + 376, v8 + 752, (uint64_t)v136);
        return;
      case 5:
        std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,0>(v8, v8 + 376, v8 + 752, v8 + 1128, (uint64_t)v136);
        return;
      default:
        v139 = (char *)v8;
        if (v9 <= 9023)
        {
          if ((a4 & 1) != 0)
          {
            if ((char *)v8 != a2)
            {
              v56 = (char *)(v8 + 376);
              if ((char *)(v8 + 376) != a2)
              {
                v57 = 0;
                v58 = v148;
                v59 = (char *)v8;
                do
                {
                  v60 = v59;
                  v59 = v56;
                  v61 = *((_DWORD *)v60 + 186);
                  v62 = *((_DWORD *)v60 + 92);
                  if (v61 < v62 || v61 <= v62 && *((double *)v60 + 92) < *((double *)v60 + 45))
                  {
                    v147 = *v59;
                    v63 = (uint64_t)v58;
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v58, (uint64_t)(v60 + 384));
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v149, (uint64_t)(v60 + 448));
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v150, (uint64_t)(v60 + 512));
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v151, (uint64_t)(v60 + 624));
                    v152 = *((double *)v60 + 92);
                    v153 = *((_DWORD *)v60 + 186);
                    for (i = v57; ; i -= 376)
                    {
                      v65 = v8 + i;
                      *(_BYTE *)(v8 + i + 376) = *(_BYTE *)(v8 + i);
                      v66 = v8 + i + 8;
                      cnmatrix::CNMatrixBase<double>::operator=(v8 + i + 384, v66);
                      cnmatrix::CNMatrixBase<double>::operator=(v65 + 448, v65 + 72);
                      cnmatrix::CNMatrixBase<double>::operator=(v65 + 512, v65 + 136);
                      cnmatrix::CNMatrixBase<double>::operator=(v65 + 624, v65 + 248);
                      *(_QWORD *)(v65 + 736) = *(_QWORD *)(v65 + 360);
                      *(_DWORD *)(v65 + 744) = *(_DWORD *)(v65 + 368);
                      if (!i)
                      {
                        v68 = v139;
                        goto LABEL_115;
                      }
                      v67 = *(_DWORD *)(v65 - 8);
                      if (v153 >= v67 && (v153 > v67 || v152 >= *(double *)&v139[i - 16]))
                        break;
                      v8 = (uint64_t)v139;
                    }
                    v68 = &v139[i];
LABEL_115:
                    v58 = (_BYTE *)v63;
                    *v68 = v147;
                    cnmatrix::CNMatrixBase<double>::operator=(v66, v63);
                    cnmatrix::CNMatrixBase<double>::operator=(v65 + 72, (uint64_t)v149);
                    cnmatrix::CNMatrixBase<double>::operator=(v65 + 136, (uint64_t)v150);
                    cnmatrix::CNMatrixBase<double>::operator=(v65 + 248, (uint64_t)v151);
                    v69 = v153;
                    *(double *)(v65 + 360) = v152;
                    *(_DWORD *)(v65 + 368) = v69;
                    a2 = (char *)v138;
                    v8 = (uint64_t)v139;
                  }
                  v56 = v59 + 376;
                  v57 += 376;
                }
                while (v59 + 376 != a2);
              }
            }
          }
          else if ((char *)v8 != a2)
          {
            v115 = v8 + 376;
            if ((char *)(v8 + 376) != a2)
            {
              v116 = v8 + 736;
              do
              {
                v117 = v8;
                v8 = v115;
                v118 = *(_DWORD *)(v117 + 744);
                v119 = *(_DWORD *)(v117 + 368);
                if (v118 < v119 || v118 <= v119 && *(double *)(v117 + 736) < *(double *)(v117 + 360))
                {
                  v147 = *(_BYTE *)v8;
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v148, v117 + 384);
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v149, v117 + 448);
                  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v150, v117 + 512);
                  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v151, v117 + 624);
                  v152 = *(double *)(v117 + 736);
                  v153 = *(_DWORD *)(v117 + 744);
                  for (j = v116; ; j -= 376)
                  {
                    *(_BYTE *)(j - 360) = *(_BYTE *)(j - 736);
                    cnmatrix::CNMatrixBase<double>::operator=(j - 352, j - 728);
                    cnmatrix::CNMatrixBase<double>::operator=(j - 288, j - 664);
                    cnmatrix::CNMatrixBase<double>::operator=(j - 224, j - 600);
                    cnmatrix::CNMatrixBase<double>::operator=(j - 112, j - 488);
                    *(_DWORD *)(j + 8) = *(_DWORD *)(j - 368);
                    *(_QWORD *)j = *(_QWORD *)(j - 376);
                    v121 = *(_DWORD *)(j - 744);
                    if (v153 >= v121 && (v153 > v121 || v152 >= *(double *)(j - 752)))
                      break;
                  }
                  *(_BYTE *)(j - 736) = v147;
                  cnmatrix::CNMatrixBase<double>::operator=(j - 728, (uint64_t)v148);
                  cnmatrix::CNMatrixBase<double>::operator=(j - 664, (uint64_t)v149);
                  cnmatrix::CNMatrixBase<double>::operator=(j - 600, (uint64_t)v150);
                  cnmatrix::CNMatrixBase<double>::operator=(j - 488, (uint64_t)v151);
                  v122 = v153;
                  *(double *)(j - 376) = v152;
                  *(_DWORD *)(j - 368) = v122;
                  a2 = (char *)v138;
                }
                v115 = v8 + 376;
                v116 += 376;
              }
              while ((char *)(v8 + 376) != a2);
            }
          }
          return;
        }
        if (!a3)
        {
          if ((char *)v8 != a2)
          {
            v137 = (unint64_t)(v10 - 2) >> 1;
            v70 = v137;
            do
            {
              v71 = v70;
              if (v137 >= v70)
              {
                v72 = (2 * v70) | 1;
                v73 = (char *)(v8 + 376 * v72);
                if (2 * v70 + 2 < v10)
                {
                  v74 = *(_DWORD *)(v8 + 376 * v72 + 368);
                  v75 = *((_DWORD *)v73 + 186);
                  if (v74 < v75 || v74 <= v75 && *(double *)(v8 + 376 * v72 + 360) < *((double *)v73 + 92))
                  {
                    v73 += 376;
                    v72 = 2 * v70 + 2;
                  }
                }
                v76 = *((_DWORD *)v73 + 92);
                v77 = *(_DWORD *)(v8 + 376 * v71 + 368);
                if (v76 >= v77 && (v76 > v77 || *((double *)v73 + 45) >= *(double *)(v8 + 376 * v71 + 360)))
                {
                  v78 = v8 + 376 * v71;
                  v147 = *(_BYTE *)v78;
                  v135 = v71;
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v148, v78 + 8);
                  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v149, v78 + 72);
                  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v150, v78 + 136);
                  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v151, v78 + 248);
                  v79 = *(double *)(v78 + 360);
                  v153 = *(_DWORD *)(v78 + 368);
                  v152 = v79;
                  while (1)
                  {
                    v80 = (double *)v73;
                    *(_BYTE *)v78 = *v73;
                    v81 = (uint64_t)(v73 + 8);
                    cnmatrix::CNMatrixBase<double>::operator=(v78 + 8, (uint64_t)(v73 + 8));
                    v82 = (uint64_t)(v73 + 72);
                    cnmatrix::CNMatrixBase<double>::operator=(v78 + 72, (uint64_t)(v73 + 72));
                    v83 = (uint64_t)(v73 + 136);
                    cnmatrix::CNMatrixBase<double>::operator=(v78 + 136, (uint64_t)(v73 + 136));
                    v84 = (uint64_t)(v73 + 248);
                    cnmatrix::CNMatrixBase<double>::operator=(v78 + 248, (uint64_t)(v73 + 248));
                    v85 = *((_DWORD *)v73 + 92);
                    *(_QWORD *)(v78 + 360) = *((_QWORD *)v73 + 45);
                    *(_DWORD *)(v78 + 368) = v85;
                    if (v137 < v72)
                      break;
                    v86 = (2 * v72) | 1;
                    v73 = &v139[376 * v86];
                    if (2 * v72 + 2 < v10)
                    {
                      v87 = *(_DWORD *)&v139[376 * v86 + 368];
                      v88 = *((_DWORD *)v73 + 186);
                      if (v87 < v88 || v87 <= v88 && *(double *)&v139[376 * v86 + 360] < *((double *)v73 + 92))
                      {
                        v73 += 376;
                        v86 = 2 * v72 + 2;
                      }
                    }
                    v89 = *((_DWORD *)v73 + 92);
                    if (v89 < v153)
                      break;
                    v78 = (uint64_t)v80;
                    v72 = v86;
                    if (v89 <= v153)
                    {
                      v78 = (uint64_t)v80;
                      v72 = v86;
                      if (*((double *)v73 + 45) < v152)
                        break;
                    }
                  }
                  *(_BYTE *)v80 = v147;
                  cnmatrix::CNMatrixBase<double>::operator=(v81, (uint64_t)v148);
                  cnmatrix::CNMatrixBase<double>::operator=(v82, (uint64_t)v149);
                  cnmatrix::CNMatrixBase<double>::operator=(v83, (uint64_t)v150);
                  cnmatrix::CNMatrixBase<double>::operator=(v84, (uint64_t)v151);
                  v71 = v135;
                  v90 = v153;
                  v80[45] = v152;
                  *((_DWORD *)v80 + 92) = v90;
                  a2 = (char *)v138;
                  v8 = (uint64_t)v139;
                }
              }
              v70 = v71 - 1;
            }
            while (v71);
            v91 = v9 / 0x178uLL;
            v128 = v8 + 72;
            v130 = v8 + 8;
            v125 = v8 + 248;
            v126 = v8 + 136;
            v124 = v8 + 360;
            do
            {
              v133 = a2;
              v140 = *(_BYTE *)v8;
              cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v141, v130);
              cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v142, v128);
              cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v143, v126);
              cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v144, v125);
              v92 = 0;
              v93 = *(_QWORD *)v124;
              v146 = *(_DWORD *)(v124 + 8);
              v145 = v93;
              v94 = (char *)v8;
              do
              {
                v95 = v94;
                v96 = v92 + 1;
                v94 += 376 * v92 + 376;
                v97 = 2 * v92;
                v92 = (2 * v92) | 1;
                v98 = v97 + 2;
                if (v98 < v91)
                {
                  v99 = *(_DWORD *)&v95[376 * v96 + 368];
                  v100 = *((_DWORD *)v94 + 186);
                  if (v99 < v100 || v99 <= v100 && *(double *)&v95[376 * v96 + 360] < *((double *)v94 + 92))
                  {
                    v94 += 376;
                    v92 = v98;
                  }
                }
                *v95 = *v94;
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v95 + 8), (uint64_t)(v94 + 8));
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v95 + 72), (uint64_t)(v94 + 72));
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v95 + 136), (uint64_t)(v94 + 136));
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v95 + 248), (uint64_t)(v94 + 248));
                v101 = *((_DWORD *)v94 + 92);
                *((_QWORD *)v95 + 45) = *((_QWORD *)v94 + 45);
                *((_DWORD *)v95 + 92) = v101;
              }
              while (v92 <= (uint64_t)((unint64_t)(v91 - 2) >> 1));
              a2 = v133 - 376;
              if (v94 == v133 - 376)
              {
                *v94 = v140;
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 8), (uint64_t)v141);
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 72), (uint64_t)v142);
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 136), (uint64_t)v143);
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 248), (uint64_t)v144);
                v113 = v146;
                *((_QWORD *)v94 + 45) = v145;
                *((_DWORD *)v94 + 92) = v113;
                v8 = (uint64_t)v139;
              }
              else
              {
                *v94 = *a2;
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 8), (uint64_t)(v133 - 368));
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 72), (uint64_t)(v133 - 304));
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 136), (uint64_t)(v133 - 240));
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 248), (uint64_t)(v133 - 128));
                v102 = *((_QWORD *)v133 - 2);
                *((_DWORD *)v94 + 92) = *((_DWORD *)v133 - 2);
                v123 = (double *)(v94 + 360);
                *((_QWORD *)v94 + 45) = v102;
                *a2 = v140;
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v133 - 368), (uint64_t)v141);
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v133 - 304), (uint64_t)v142);
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v133 - 240), (uint64_t)v143);
                cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v133 - 128), (uint64_t)v144);
                v103 = v146;
                *((_QWORD *)v133 - 2) = v145;
                *((_DWORD *)v133 - 2) = v103;
                v8 = (uint64_t)v139;
                v104 = v94 - v139 + 376;
                if (v104 >= 377)
                {
                  v105 = (v104 / 0x178uLL - 2) >> 1;
                  v106 = *(_DWORD *)&v139[376 * v105 + 368];
                  v107 = *((_DWORD *)v94 + 92);
                  if (v106 < v107 || v106 <= v107 && *(double *)&v139[376 * v105 + 360] < *v123)
                  {
                    v147 = *v94;
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v148, (uint64_t)(v94 + 8));
                    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v149, (uint64_t)(v94 + 72));
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v150, (uint64_t)(v94 + 136));
                    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v151, (uint64_t)(v94 + 248));
                    v108 = *v123;
                    v153 = *((_DWORD *)v94 + 92);
                    v152 = v108;
                    do
                    {
                      v109 = v94;
                      v94 = &v139[376 * v105];
                      *v109 = *v94;
                      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v109 + 8), (uint64_t)(v94 + 8));
                      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v109 + 72), (uint64_t)(v94 + 72));
                      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v109 + 136), (uint64_t)(v94 + 136));
                      cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v109 + 248), (uint64_t)(v94 + 248));
                      v110 = *((_DWORD *)v94 + 92);
                      *((_QWORD *)v109 + 45) = *((_QWORD *)v94 + 45);
                      *((_DWORD *)v109 + 92) = v110;
                      if (!v105)
                        break;
                      v105 = (v105 - 1) >> 1;
                      v111 = *(_DWORD *)&v139[376 * v105 + 368];
                    }
                    while (v111 < v153 || v111 <= v153 && *(double *)&v139[376 * v105 + 360] < v152);
                    *v94 = v147;
                    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 8), (uint64_t)v148);
                    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 72), (uint64_t)v149);
                    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 136), (uint64_t)v150);
                    cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(v94 + 248), (uint64_t)v151);
                    v112 = v153;
                    *((double *)v94 + 45) = v152;
                    *((_DWORD *)v94 + 92) = v112;
                    a2 = v133 - 376;
                  }
                }
              }
            }
            while (v91-- > 2);
          }
          return;
        }
        v11 = (unint64_t)v10 >> 1;
        v12 = (char *)(v8 + 376 * ((unint64_t)v10 >> 1));
        if ((unint64_t)v9 < 0xBC01)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>((uint64_t)v12, v8, (uint64_t)v136);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v8, (uint64_t)v12, (uint64_t)v136);
          v13 = 376 * v11;
          v14 = 376 * v11 + v8 - 376;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v8 + 376, v14, v129);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v8 + 752, v8 + 376 + v13, v127);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(v14, (uint64_t)v12, v8 + 376 + v13);
          std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)v8, v12);
        }
        --a3;
        if ((a4 & 1) == 0)
        {
          v15 = *(_DWORD *)(v8 - 8);
          v16 = *(_DWORD *)(v8 + 368);
          if (v15 >= v16 && (v15 > v16 || *(double *)(v8 - 16) >= *(double *)(v8 + 360)))
          {
            v147 = *(_BYTE *)v8;
            cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v148, v8 + 8);
            cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v149, v8 + 72);
            cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v150, v8 + 136);
            cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v151, v8 + 248);
            v41 = *(double *)(v8 + 360);
            v153 = *(_DWORD *)(v8 + 368);
            v152 = v41;
            v42 = *((_DWORD *)a2 - 2);
            if (v153 < v42 || v153 <= v42 && v152 < *((double *)a2 - 2))
            {
              v43 = *(_DWORD *)(v8 + 744);
              if (v153 >= v43)
              {
                v45 = v8 + 736;
                do
                {
                  if (v153 <= v43 && v152 < *(double *)v45)
                    break;
                  v43 = *(_DWORD *)(v45 + 384);
                  v45 += 376;
                }
                while (v153 >= v43);
                k = v45 - 360;
              }
              else
              {
                k = v8 + 376;
              }
            }
            else
            {
              for (k = v8 + 376; k < (unint64_t)a2; k += 376)
              {
                v44 = *(_DWORD *)(k + 368);
                if (v153 < v44 || v153 <= v44 && v152 < *(double *)(k + 360))
                  break;
              }
            }
            v46 = a2;
            if (k < (unint64_t)a2)
            {
              for (m = v131; v153 < v42 || v153 <= v42 && v152 < *((double *)m + 46); m -= 376)
                v42 = *(_DWORD *)m;
              v46 = m + 8;
            }
            while (k < (unint64_t)v46)
            {
              std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)k, v46);
              v48 = *(_DWORD *)(k + 744);
              if (v153 >= v48)
              {
                v49 = k + 736;
                do
                {
                  if (v153 <= v48 && v152 < *(double *)v49)
                    break;
                  v48 = *(_DWORD *)(v49 + 384);
                  v49 += 376;
                }
                while (v153 >= v48);
                k = v49 - 360;
              }
              else
              {
                k += 376;
              }
              do
              {
                do
                {
                  v46 -= 376;
                  v50 = *((_DWORD *)v46 + 92);
                }
                while (v153 < v50);
              }
              while (v153 <= v50 && v152 < *((double *)v46 + 45));
            }
            v51 = (char *)(k - 376);
            if (k - 376 != v8)
            {
              *(_BYTE *)v8 = *v51;
              cnmatrix::CNMatrixBase<double>::operator=(v8 + 8, k - 368);
              cnmatrix::CNMatrixBase<double>::operator=(v8 + 72, k - 304);
              cnmatrix::CNMatrixBase<double>::operator=(v8 + 136, k - 240);
              cnmatrix::CNMatrixBase<double>::operator=(v8 + 248, k - 128);
              v52 = *(_DWORD *)(k - 8);
              *(_QWORD *)(v8 + 360) = *(_QWORD *)(k - 16);
              *(_DWORD *)(v8 + 368) = v52;
            }
            *v51 = v147;
            cnmatrix::CNMatrixBase<double>::operator=(k - 368, (uint64_t)v148);
            cnmatrix::CNMatrixBase<double>::operator=(k - 304, (uint64_t)v149);
            cnmatrix::CNMatrixBase<double>::operator=(k - 240, (uint64_t)v150);
            cnmatrix::CNMatrixBase<double>::operator=(k - 128, (uint64_t)v151);
            a4 = 0;
            v53 = v153;
            *(double *)(k - 16) = v152;
            *(_DWORD *)(k - 8) = v53;
            continue;
          }
        }
        v134 = a3;
        v147 = *(_BYTE *)v8;
        v17 = v8 + 8;
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v148, v8 + 8);
        v18 = v8 + 72;
        cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v149, v8 + 72);
        v19 = v8 + 136;
        cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v150, v8 + 136);
        v20 = v8 + 248;
        cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v151, v8 + 248);
        v21 = 0;
        v22 = v8 + 360;
        v23 = *(double *)(v8 + 360);
        v153 = *(_DWORD *)(v8 + 368);
        v152 = v23;
        while (1)
        {
          v24 = *(_DWORD *)(v8 + v21 + 744);
          if (v24 >= v153 && (v24 > v153 || *(double *)(v8 + v21 + 736) >= v152))
            break;
          v21 += 376;
        }
        v25 = v8 + v21 + 376;
        if (v21)
        {
          v26 = v136;
          v27 = *(_DWORD *)(v138 - 8);
          v28 = v131;
          if (v27 >= v153)
          {
            do
            {
              if (v27 <= v153 && *((double *)v28 + 46) < v152)
                break;
              v27 = *(_DWORD *)v28;
              v28 -= 376;
            }
            while (v27 >= v153);
LABEL_22:
            v26 = v28 + 8;
          }
        }
        else
        {
          v26 = (char *)v138;
          if (v25 < v138)
          {
            v26 = v136;
            v29 = *(_DWORD *)(v138 - 8);
            if (v29 >= v153)
            {
              v28 = v131;
              v26 = v136;
              while (1)
              {
                v39 = (unint64_t)(v28 + 8);
                if (v29 <= v153)
                {
                  if (*((double *)v28 + 46) < v152 || v25 >= v39)
                    break;
                }
                else if (v25 >= v39)
                {
                  goto LABEL_22;
                }
                v26 -= 376;
                v29 = *(_DWORD *)v28;
                v28 -= 376;
                if (v29 < v153)
                  goto LABEL_22;
              }
            }
          }
        }
        k = v25;
        if (v25 < (unint64_t)v26)
        {
          v30 = v26;
          do
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)k, v30);
            do
            {
              do
              {
                k += 376;
                v31 = *(_DWORD *)(k + 368);
              }
              while (v31 < v153);
            }
            while (v31 <= v153 && *(double *)(k + 360) < v152);
            v32 = *((_DWORD *)v30 - 2);
            if (v32 >= v153)
            {
              v33 = v30 - 384;
              do
              {
                if (v32 <= v153 && *((double *)v33 + 46) < v152)
                  break;
                v32 = *(_DWORD *)v33;
                v33 -= 376;
              }
              while (v32 >= v153);
              v30 = v33 + 8;
            }
            else
            {
              v30 -= 376;
            }
          }
          while (k < (unint64_t)v30);
        }
        v34 = (char *)(k - 376);
        a1 = v139;
        if ((char *)(k - 376) != v139)
        {
          *v139 = *v34;
          cnmatrix::CNMatrixBase<double>::operator=(v17, k - 368);
          cnmatrix::CNMatrixBase<double>::operator=(v18, k - 304);
          cnmatrix::CNMatrixBase<double>::operator=(v19, k - 240);
          cnmatrix::CNMatrixBase<double>::operator=(v20, k - 128);
          v35 = *(_DWORD *)(k - 8);
          *(_QWORD *)v22 = *(_QWORD *)(k - 16);
          *(_DWORD *)(v22 + 8) = v35;
        }
        *v34 = v147;
        cnmatrix::CNMatrixBase<double>::operator=(k - 368, (uint64_t)v148);
        cnmatrix::CNMatrixBase<double>::operator=(k - 304, (uint64_t)v149);
        cnmatrix::CNMatrixBase<double>::operator=(k - 240, (uint64_t)v150);
        v36 = cnmatrix::CNMatrixBase<double>::operator=(k - 128, (uint64_t)v151);
        a3 = v134;
        v37 = v153;
        *(double *)(k - 16) = v152;
        *(_DWORD *)(k - 8) = v37;
        a2 = (char *)v138;
        if (v25 < (unint64_t)v26)
        {
LABEL_44:
          std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(v139, k - 376, v134, a4 & 1, v36);
          a4 = 0;
          continue;
        }
        v38 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>((uint64_t)v139, k - 376);
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(k, v138))
        {
          if (v38)
            continue;
          goto LABEL_44;
        }
        a2 = (char *)(k - 376);
        if (!v38)
          goto LABEL_1;
        return;
    }
  }
}

void std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  double v6;
  double v7;
  char *v8;

  v5 = a1;
  v6 = *(double *)(a2 + 360);
  v7 = *(double *)(a3 + 360);
  if (v6 < *(double *)(a1 + 360))
  {
    if (v7 >= v6)
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
      if (*(double *)(a3 + 360) >= *(double *)(a2 + 360))
        return;
      a1 = a2;
    }
    v8 = (char *)a3;
    goto LABEL_9;
  }
  if (v7 < v6)
  {
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
    if (*(double *)(a2 + 360) < *(double *)(v5 + 360))
    {
      a1 = v5;
      v8 = (char *)a2;
LABEL_9:
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, v8);
    }
  }
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _BOOL8 result;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  char v17;
  _BYTE v18[64];
  _BYTE v19[64];
  _BYTE v20[112];
  _BYTE v21[112];
  double v22;
  int v23;

  v2 = a2;
  v4 = 0x51B3BEA3677D46CFLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (*(double *)(a2 - 16) < *(double *)(a1 + 360))
      {
        v6 = (char *)(a2 - 376);
        v7 = (char *)a1;
        goto LABEL_4;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a2 - 376);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752, a2 - 376);
      return 1;
    case 5:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752, a1 + 1128);
      if (*(double *)(v2 - 16) < *(double *)(a1 + 1488))
      {
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)(a1 + 1128), (char *)(v2 - 376));
        if (*(double *)(a1 + 1488) < *(double *)(a1 + 1112))
        {
          std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)(a1 + 752), (char *)(a1 + 1128));
          if (*(double *)(a1 + 1112) < *(double *)(a1 + 736))
          {
            std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)(a1 + 376), (char *)(a1 + 752));
            if (*(double *)(a1 + 736) < *(double *)(a1 + 360))
            {
              v7 = (char *)a1;
              v6 = (char *)(a1 + 376);
LABEL_4:
              std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(v7, v6);
            }
          }
        }
      }
      return 1;
    default:
      v8 = a1 + 752;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752);
      v9 = a1 + 1128;
      if (a1 + 1128 == v2)
        return 1;
      v10 = 0;
      v11 = 0;
      v16 = v2;
      break;
  }
  while (*(double *)(v9 + 360) >= *(double *)(v8 + 360))
  {
LABEL_16:
    v8 = v9;
    v10 += 376;
    v9 += 376;
    if (v9 == v2)
      return 1;
  }
  v17 = *(_BYTE *)v9;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v18, v9 + 8);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v19, v9 + 72);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v20, v9 + 136);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v21, v9 + 248);
  v22 = *(double *)(v9 + 360);
  v23 = *(_DWORD *)(v9 + 368);
  v12 = v10;
  while (1)
  {
    v13 = a1 + v12;
    *(_BYTE *)(a1 + v12 + 1128) = *(_BYTE *)(a1 + v12 + 752);
    v14 = a1 + v12 + 760;
    cnmatrix::CNMatrixBase<double>::operator=(a1 + v12 + 1136, v14);
    cnmatrix::CNMatrixBase<double>::operator=(v13 + 1200, v13 + 824);
    cnmatrix::CNMatrixBase<double>::operator=(v13 + 1264, v13 + 888);
    cnmatrix::CNMatrixBase<double>::operator=(v13 + 1376, v13 + 1000);
    *(_QWORD *)(v13 + 1488) = *(_QWORD *)(v13 + 1112);
    *(_DWORD *)(v13 + 1496) = *(_DWORD *)(v13 + 1120);
    if (v12 == -752)
      break;
    v12 -= 376;
    if (v22 >= *(double *)(v13 + 736))
    {
      v15 = (_BYTE *)(a1 + v12 + 1128);
      goto LABEL_14;
    }
  }
  v15 = (_BYTE *)a1;
LABEL_14:
  *v15 = v17;
  cnmatrix::CNMatrixBase<double>::operator=(v14, (uint64_t)v18);
  cnmatrix::CNMatrixBase<double>::operator=(v13 + 824, (uint64_t)v19);
  cnmatrix::CNMatrixBase<double>::operator=(v13 + 888, (uint64_t)v20);
  cnmatrix::CNMatrixBase<double>::operator=(v13 + 1000, (uint64_t)v21);
  *(double *)(v13 + 1112) = v22;
  *(_DWORD *)(v13 + 1120) = v23;
  if (++v11 != 8)
  {
    v2 = v16;
    goto LABEL_16;
  }
  return v9 + 376 == v16;
}

void std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>(char *a1, char *a2)
{
  uint64_t v4;
  char v5;
  _BYTE v6[64];
  _BYTE v7[64];
  _BYTE v8[112];
  _BYTE v9[112];
  uint64_t v10;
  int v11;

  v5 = *a1;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v6, (uint64_t)(a1 + 8));
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v7, (uint64_t)(a1 + 72));
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v8, (uint64_t)(a1 + 136));
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v9, (uint64_t)(a1 + 248));
  v10 = *((_QWORD *)a1 + 45);
  v11 = *((_DWORD *)a1 + 92);
  *a1 = *a2;
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a1 + 8), (uint64_t)(a2 + 8));
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a1 + 72), (uint64_t)(a2 + 72));
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a1 + 136), (uint64_t)(a2 + 136));
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a1 + 248), (uint64_t)(a2 + 248));
  v4 = *((_QWORD *)a2 + 45);
  *((_DWORD *)a1 + 92) = *((_DWORD *)a2 + 92);
  *((_QWORD *)a1 + 45) = v4;
  *a2 = v5;
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a2 + 8), (uint64_t)v6);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a2 + 72), (uint64_t)v7);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a2 + 136), (uint64_t)v8);
  cnmatrix::CNMatrixBase<double>::operator=((uint64_t)(a2 + 248), (uint64_t)v9);
  *((_QWORD *)a2 + 45) = v10;
  *((_DWORD *)a2 + 92) = v11;
}

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_2 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a2, a3);
  if (*(double *)(a4 + 360) < *(double *)(a3 + 360))
  {
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a3, (char *)a4);
    if (*(double *)(a3 + 360) < *(double *)(a2 + 360))
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
      if (*(double *)(a2 + 360) < *(double *)(a1 + 360))
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
    }
  }
}

_QWORD *boost::circular_buffer<double,std::allocator<double>>::push_back_impl<double &&>(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  v2 = (_QWORD *)*result;
  v3 = (_QWORD *)result[1];
  v4 = result[4];
  if (v4 == ((uint64_t)v3 - *result) >> 3)
  {
    if (v3 != v2)
    {
      v5 = (_QWORD *)result[3];
      *v5 = *a2;
      v6 = v5 + 1;
      if (v6 != v3)
        v2 = v6;
      result[2] = v2;
      result[3] = v2;
    }
  }
  else
  {
    v7 = (_QWORD *)result[3];
    *v7 = *a2;
    v8 = v7 + 1;
    if (v8 != v3)
      v2 = v8;
    result[3] = v2;
    result[4] = v4 + 1;
  }
  return result;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__push_back_slow_path<RoseSyntheticApertureFiltering::FilterInitializationResult const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t *v14;

  v3 = 0x51B3BEA3677D46CFLL * ((a1[1] - *a1) >> 3);
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0xAE4C415C9882B9)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  if (0xA3677D46CEFA8D9ELL * ((a1[2] - *a1) >> 3) > v4)
    v4 = 0xA3677D46CEFA8D9ELL * ((a1[2] - *a1) >> 3);
  if ((unint64_t)(0x51B3BEA3677D46CFLL * ((a1[2] - *a1) >> 3)) >= 0x572620AE4C415CLL)
    v6 = 0xAE4C415C9882B9;
  else
    v6 = v4;
  v14 = a1 + 2;
  if (v6)
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>>((uint64_t)(a1 + 2), v6);
  else
    v7 = 0;
  v10 = v7;
  v11 = &v7[376 * v3];
  v13 = &v7[376 * v6];
  std::allocator<RoseSyntheticApertureFiltering::FilterInitializationResult>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult,RoseSyntheticApertureFiltering::FilterInitializationResult const&>((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  v12 = v11 + 376;
  std::vector<RoseSyntheticApertureFiltering::FilterInitializationResult>::__swap_out_circular_buffer(a1, &v10);
  v8 = a1[1];
  std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer((uint64_t)&v10);
  return v8;
}

void sub_2230FF518(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::FilterInitializationResult>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,false>(char *a1, char *a2, uint64_t a3, char a4)
{
  unint64_t k;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  int v24;
  unint64_t v25;
  char *v26;
  int v27;
  char *v28;
  int v29;
  char *v30;
  int v31;
  int v32;
  char *v33;
  char *v34;
  int v35;
  __n128 v36;
  int v37;
  BOOL v38;
  unint64_t v39;
  double v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  char *v46;
  char *m;
  int v48;
  unint64_t v49;
  int v50;
  char *v51;
  int v52;
  int v53;
  int v54;
  int v55;
  char *v56;
  uint64_t v57;
  _BYTE *v58;
  char *v59;
  char *v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t i;
  uint64_t v65;
  uint64_t v66;
  int v67;
  char *v68;
  int v69;
  int64_t v70;
  int64_t v71;
  uint64_t v72;
  char *v73;
  int v74;
  int v75;
  int v76;
  int v77;
  uint64_t v78;
  double v79;
  double *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  int64_t v98;
  int v99;
  int v100;
  int v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  unint64_t v105;
  int v106;
  int v107;
  double v108;
  char *v109;
  int v110;
  int v111;
  int v112;
  int v113;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  int v119;
  uint64_t j;
  int v121;
  int v122;
  double *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v133;
  uint64_t v134;
  int64_t v135;
  char *v136;
  int64_t v137;
  unint64_t v138;
  char *v139;
  char v140;
  _BYTE v141[64];
  _BYTE v142[64];
  _BYTE v143[112];
  _BYTE v144[112];
  uint64_t v145;
  int v146;
  char v147;
  _BYTE v148[64];
  _BYTE v149[64];
  _BYTE v150[112];
  _BYTE v151[112];
  double v152;
  int v153;

double std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double result;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;

  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a2, a3, a4);
  v11 = *(_DWORD *)(a5 + 368);
  v12 = *(_DWORD *)(a4 + 368);
  if (v11 < v12 || v11 <= v12 && (result = *(double *)(a5 + 360), result < *(double *)(a4 + 360)))
  {
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a4, (char *)a5);
    v13 = *(_DWORD *)(a4 + 368);
    v14 = *(_DWORD *)(a3 + 368);
    if (v13 < v14 || v13 <= v14 && (result = *(double *)(a4 + 360), result < *(double *)(a3 + 360)))
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a3, (char *)a4);
      v15 = *(_DWORD *)(a3 + 368);
      v16 = *(_DWORD *)(a2 + 368);
      if (v15 < v16 || v15 <= v16 && (result = *(double *)(a3 + 360), result < *(double *)(a2 + 360)))
      {
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
        v17 = *(_DWORD *)(a2 + 368);
        v18 = *(_DWORD *)(a1 + 368);
        if (v17 < v18 || v17 <= v18 && (result = *(double *)(a2 + 360), result < *(double *)(a1 + 360)))
          std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
      }
    }
  }
  return result;
}

double std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int v7;
  double result;
  int v9;
  int v10;
  int v11;
  int v12;
  char *v13;
  int v14;
  int v15;

  v5 = a1;
  v6 = *(_DWORD *)(a2 + 368);
  v7 = *(_DWORD *)(a1 + 368);
  if (v6 >= v7 && (v6 > v7 || (result = *(double *)(a2 + 360), result >= *(double *)(a1 + 360))))
  {
    v10 = *(_DWORD *)(a3 + 368);
    if (v10 < v6 || v10 <= v6 && (result = *(double *)(a3 + 360), result < *(double *)(a2 + 360)))
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
      v11 = *(_DWORD *)(a2 + 368);
      v12 = *(_DWORD *)(v5 + 368);
      if (v11 < v12 || v11 <= v12 && (result = *(double *)(a2 + 360), result < *(double *)(v5 + 360)))
      {
        a1 = v5;
        v13 = (char *)a2;
LABEL_18:
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, v13);
      }
    }
  }
  else
  {
    v9 = *(_DWORD *)(a3 + 368);
    if (v9 < v6 || v9 <= v6 && *(double *)(a3 + 360) < *(double *)(a2 + 360))
      goto LABEL_17;
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
    v14 = *(_DWORD *)(a3 + 368);
    v15 = *(_DWORD *)(a2 + 368);
    if (v14 < v15 || v14 <= v15 && (result = *(double *)(a3 + 360), result < *(double *)(a2 + 360)))
    {
      a1 = a2;
LABEL_17:
      v13 = (char *)a3;
      goto LABEL_18;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _BOOL8 result;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  uint64_t i;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  char v19;
  _BYTE v20[64];
  _BYTE v21[64];
  _BYTE v22[112];
  _BYTE v23[112];
  double v24;
  int v25;

  v2 = a2;
  v4 = 0x51B3BEA3677D46CFLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(_DWORD *)(a2 - 8);
      v7 = *(_DWORD *)(a1 + 368);
      if (v6 < v7 || v6 <= v7 && *(double *)(a2 - 16) < *(double *)(a1 + 360))
      {
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)(a2 - 376));
        return 1;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a2 - 376);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752, a2 - 376);
      return 1;
    case 5:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *,0>(a1, a1 + 376, a1 + 752, a1 + 1128, a2 - 376);
      return 1;
    default:
      v8 = a1 + 752;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a1 + 376, a1 + 752);
      v9 = a1 + 1128;
      if (a1 + 1128 == v2)
        return 1;
      v10 = 0;
      v11 = 0;
      v17 = v2;
      break;
  }
  while (1)
  {
    v12 = *(_DWORD *)(v9 + 368);
    v13 = *(_DWORD *)(v8 + 368);
    if (v12 >= v13 && (v12 > v13 || *(double *)(v9 + 360) >= *(double *)(v8 + 360)))
      goto LABEL_21;
    v18 = v11;
    v19 = *(_BYTE *)v9;
    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v20, v9 + 8);
    cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v21, v9 + 72);
    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v22, v9 + 136);
    cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)v23, v9 + 248);
    v24 = *(double *)(v9 + 360);
    v25 = *(_DWORD *)(v9 + 368);
    for (i = v10; ; i -= 376)
    {
      v15 = a1 + i;
      *(_BYTE *)(a1 + i + 1128) = *(_BYTE *)(a1 + i + 752);
      cnmatrix::CNMatrixBase<double>::operator=(a1 + i + 1136, a1 + i + 760);
      cnmatrix::CNMatrixBase<double>::operator=(v15 + 1200, v15 + 824);
      cnmatrix::CNMatrixBase<double>::operator=(v15 + 1264, v15 + 888);
      cnmatrix::CNMatrixBase<double>::operator=(v15 + 1376, v15 + 1000);
      *(_QWORD *)(v15 + 1488) = *(_QWORD *)(v15 + 1112);
      *(_DWORD *)(v15 + 1496) = *(_DWORD *)(v15 + 1120);
      if (i == -752)
        break;
      v16 = *(_DWORD *)(v15 + 744);
      if (v25 >= v16)
      {
        if (v25 > v16)
        {
          v8 = a1 + i + 752;
          goto LABEL_19;
        }
        if (v24 >= *(double *)(a1 + i + 736))
          goto LABEL_19;
      }
      v8 -= 376;
    }
    v8 = a1;
LABEL_19:
    *(_BYTE *)v8 = v19;
    cnmatrix::CNMatrixBase<double>::operator=(a1 + i + 760, (uint64_t)v20);
    cnmatrix::CNMatrixBase<double>::operator=(v15 + 824, (uint64_t)v21);
    cnmatrix::CNMatrixBase<double>::operator=(v15 + 888, (uint64_t)v22);
    cnmatrix::CNMatrixBase<double>::operator=(v15 + 1000, (uint64_t)v23);
    *(double *)(v15 + 1112) = v24;
    *(_DWORD *)(v15 + 1120) = v25;
    v11 = v18 + 1;
    if (v18 == 7)
      return v9 + 376 == v17;
    v2 = v17;
LABEL_21:
    v8 = v9;
    v10 += 376;
    v9 += 376;
    if (v9 == v2)
      return 1;
  }
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double result;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::batchSolver(void)::$_3 &,RoseSyntheticApertureFiltering::FilterInitializationResult *>(a1, a2, a3);
  v9 = *(_DWORD *)(a4 + 368);
  v10 = *(_DWORD *)(a3 + 368);
  if (v9 < v10 || v9 <= v10 && (result = *(double *)(a4 + 360), result < *(double *)(a3 + 360)))
  {
    std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a3, (char *)a4);
    v11 = *(_DWORD *)(a3 + 368);
    v12 = *(_DWORD *)(a2 + 368);
    if (v11 < v12 || v11 <= v12 && (result = *(double *)(a3 + 360), result < *(double *)(a2 + 360)))
    {
      std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a2, (char *)a3);
      v13 = *(_DWORD *)(a2 + 368);
      v14 = *(_DWORD *)(a1 + 368);
      if (v13 < v14 || v13 <= v14 && (result = *(double *)(a2 + 360), result < *(double *)(a1 + 360)))
        std::swap[abi:ne180100]<RoseSyntheticApertureFiltering::FilterInitializationResult>((char *)a1, (char *)a2);
    }
  }
  return result;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__construct_one_at_end[abi:ne180100]<cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,double &,RoseSyntheticApertureFiltering::BatchSolutionType const&,cnmatrix::CNMatrix<3u,1u,double>&>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double *a6, int *a7, uint64_t a8)
{
  uint64_t v13;
  double v14;
  int v15;
  uint64_t result;
  _BYTE v17[64];

  v13 = *(_QWORD *)(a1 + 8);
  v14 = *a6;
  v15 = *a7;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v17, a8);
  result = RoseSyntheticApertureFiltering::InternalFilterState::InternalFilterState(v13, a2, a3, a4, a5, v15, (uint64_t)v17, v14);
  *(_QWORD *)(a1 + 8) = v13 + 432;
  return result;
}

void sub_223100DFC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__emplace_back_slow_path<cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,1u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,cnmatrix::CNMatrix<3u,3u,double> const&,double &,RoseSyntheticApertureFiltering::BatchSolutionType const&,cnmatrix::CNMatrix<3u,1u,double>&>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double *a6, int *a7, uint64_t a8)
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  double v23;
  int v24;
  uint64_t v25;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t *v31;
  _BYTE v32[64];

  v9 = *a1;
  v10 = 0x84BDA12F684BDA13 * ((a1[1] - *a1) >> 4);
  v11 = v10 + 1;
  if (v10 + 1 > 0x97B425ED097B42)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v19 = (uint64_t)(a1 + 2);
  v20 = 0x84BDA12F684BDA13 * ((a1[2] - v9) >> 4);
  if (2 * v20 > v11)
    v11 = 2 * v20;
  if (v20 >= 0x4BDA12F684BDA1)
    v21 = 0x97B425ED097B42;
  else
    v21 = v11;
  v31 = a1 + 2;
  if (v21)
    v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>>(v19, v21);
  else
    v22 = 0;
  v27 = v22;
  v28 = &v22[432 * v10];
  v29 = (uint64_t)v28;
  v30 = &v22[432 * v21];
  v23 = *a6;
  v24 = *a7;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)v32, a8);
  RoseSyntheticApertureFiltering::InternalFilterState::InternalFilterState((uint64_t)v28, a2, a3, a4, a5, v24, (uint64_t)v32, v23);
  v29 = (uint64_t)(v28 + 432);
  std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__swap_out_circular_buffer(a1, &v27);
  v25 = a1[1];
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalFilterState>::~__split_buffer((uint64_t)&v27);
  return v25;
}

void sub_223100F70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<RoseSyntheticApertureFiltering::InternalFilterState>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t RoseSyntheticApertureFiltering::InternalFilterState::InternalFilterState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, double a8)
{
  uint64_t v15;

  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a1, a2);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v15 + 64, a3);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a1 + 128, a4);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a1 + 240, a5);
  *(double *)(a1 + 352) = a8;
  *(_DWORD *)(a1 + 360) = a6;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a1 + 368, a7);
  return a1;
}

void sub_223101024(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  *v4 = off_24EC111F8;
  *v3 = off_24EC111F8;
  *v2 = off_24EC111F8;
  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x97B425ED097B43)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(432 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t i;

  for (i = 0;
        a3 + i != a5;
        std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalFilterState,RoseSyntheticApertureFiltering::InternalFilterState const&>(a1, i + a7, i + a3))
  {
    i -= 432;
  }
  return a6;
}

double std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalFilterState,RoseSyntheticApertureFiltering::InternalFilterState const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  double result;

  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2, a3);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2 + 64, a3 + 64);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 128, a3 + 128);
  cnmatrix::CNMatrix<3u,3u,double>::CNMatrix(a2 + 240, a3 + 240);
  v5 = *(_QWORD *)(a3 + 352);
  *(_DWORD *)(a2 + 360) = *(_DWORD *)(a3 + 360);
  *(_QWORD *)(a2 + 352) = v5;
  *(_QWORD *)&result = cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(a2 + 368, a3 + 368).n128_u64[0];
  return result;
}

void sub_223101238(_Unwind_Exception *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  *v4 = off_24EC111F8;
  *v3 = off_24EC111F8;
  *v2 = off_24EC111F8;
  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<RoseSyntheticApertureFiltering::InternalFilterState>::~__split_buffer(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  BOOL v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 16);
  if (v3 != v2)
  {
    v4 = v3 - 24;
    do
    {
      v4[16] = off_24EC111F8;
      *v4 = off_24EC111F8;
      *(v4 - 14) = off_24EC111F8;
      *(v4 - 22) = off_24EC111F8;
      *(v4 - 30) = off_24EC111F8;
      v5 = v4 - 30 == v2;
      v4 -= 54;
    }
    while (!v5);
    *(_QWORD *)(a1 + 16) = v2;
  }
  v6 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v6);
  return a1;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x155555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(192 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;

  v11 = 0;
  v12 = a7 - 192;
  while (a3 + v11 != a5)
  {
    v13 = (_OWORD *)(v12 + v11);
    v11 -= 192;
    std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas,RoseSyntheticApertureFiltering::InternalExpectedAoAMeas const&>(a1, v13, (_OWORD *)(v11 + a3));
  }
  return a6;
}

double std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas,RoseSyntheticApertureFiltering::InternalExpectedAoAMeas const&>(uint64_t a1, _OWORD *a2, _OWORD *a3)
{
  double result;

  *a2 = *a3;
  cnmatrix::CNMatrix<2u,3u,double>::CNMatrix((uint64_t)(a2 + 1), (uint64_t)(a3 + 1));
  *(_QWORD *)&result = cnmatrix::CNMatrix<3u,2u,double>::CNMatrix((uint64_t)a2 + 104, (uint64_t)a3 + 104).n128_u64[0];
  return result;
}

void sub_22310148C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

__n128 cnmatrix::CNMatrix<2u,3u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  __n128 result;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  _OWORD *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __n128 *v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  const char *v16;
  int v17;
  const char *v18;
  const char *v19;

  result.n128_u64[0] = 0x300000002;
  *(_QWORD *)(a1 + 24) = 0x300000002;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = &off_24EC114E8;
  if (a1 == a2)
  {
    v16 = "this != &(A)";
    v17 = 603;
LABEL_21:
    v18 = "cnmatrix.h";
    v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 2)
  {
    v16 = "this->max_num_rows_ >= num_rows";
    v17 = 422;
LABEL_18:
    v18 = "cnmatrixbase.h";
    v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 4)
  {
    v16 = "this->max_num_cols_ >= num_cols";
    v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  v6 = (_OWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 2u)
  {
    v16 = "this->max_num_rows_ >= A.num_rows_";
    v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 3u)
  {
    v16 = "this->max_num_cols_ >= A.num_cols_";
    v17 = 617;
    goto LABEL_21;
  }
  v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    v10 = (v7 - 2);
    v11 = *(__int128 **)(a2 + 32);
    v12 = (__n128 *)((char *)v6 + 8 * v10);
    v13 = (v7 - 1) >> 1;
    v14 = v11;
    do
    {
      v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    result = *(__n128 *)((char *)v11 + 8 * v10);
    *v12 = result;
  }
  else if ((_DWORD)v5)
  {
    v8 = *(unint64_t **)(a2 + 32);
    do
    {
      v9 = *v8++;
      result.n128_u64[0] = v9;
      *(_QWORD *)v6 = v9;
      v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_2231015F8(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

__n128 cnmatrix::CNMatrix<3u,2u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  __n128 result;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  _OWORD *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __n128 *v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  const char *v16;
  int v17;
  const char *v18;
  const char *v19;

  result.n128_u64[0] = 0x200000003;
  *(_QWORD *)(a1 + 24) = 0x200000003;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = &off_24EC11530;
  if (a1 == a2)
  {
    v16 = "this != &(A)";
    v17 = 603;
LABEL_21:
    v18 = "cnmatrix.h";
    v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 3)
  {
    v16 = "this->max_num_rows_ >= num_rows";
    v17 = 422;
LABEL_18:
    v18 = "cnmatrixbase.h";
    v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 3)
  {
    v16 = "this->max_num_cols_ >= num_cols";
    v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  v6 = (_OWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 3u)
  {
    v16 = "this->max_num_rows_ >= A.num_rows_";
    v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 2u)
  {
    v16 = "this->max_num_cols_ >= A.num_cols_";
    v17 = 617;
    goto LABEL_21;
  }
  v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    v10 = (v7 - 2);
    v11 = *(__int128 **)(a2 + 32);
    v12 = (__n128 *)((char *)v6 + 8 * v10);
    v13 = (v7 - 1) >> 1;
    v14 = v11;
    do
    {
      v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    result = *(__n128 *)((char *)v11 + 8 * v10);
    *v12 = result;
  }
  else if ((_DWORD)v5)
  {
    v8 = *(unint64_t **)(a2 + 32);
    do
    {
      v9 = *v8++;
      result.n128_u64[0] = v9;
      *(_QWORD *)v6 = v9;
      v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_223101764(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

void cnmatrix::CNMatrix<1u,1u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<1u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<1u,1u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, &v3, a3);
}

float64x2_t cnmatrix::Multiply<double>(uint64_t a1, uint64_t a2, double a3)
{
  float64x2_t result;
  uint64_t v6;
  double *v7;
  double *v8;
  double v9;
  float64x2_t *v10;
  float64x2_t *v11;
  float64x2_t *v12;
  float64x2_t *v13;
  uint64_t v14;
  float64x2_t v15;

  if (a1 == a2)
    cnmatrix::Multiply<double>();
  cnmatrix::FastResize<double>((_DWORD *)a2, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  v6 = *(unsigned int *)(a2 + 16);
  if ((int)v6 > 3)
  {
    v10 = *(float64x2_t **)(a1 + 32);
    v11 = *(float64x2_t **)(a2 + 32);
    v12 = (float64x2_t *)((char *)v10 + 8 * (v6 - 2));
    v13 = (float64x2_t *)((char *)v11 + 8 * (v6 - 2));
    v14 = (v6 - 1) >> 1;
    do
    {
      v15 = *v10++;
      *v11++ = vmulq_n_f64(v15, a3);
      --v14;
    }
    while (v14);
    result = vmulq_n_f64(*v12, a3);
    *v13 = result;
  }
  else if ((int)v6 >= 1)
  {
    v7 = *(double **)(a1 + 32);
    v8 = *(double **)(a2 + 32);
    do
    {
      v9 = *v7++;
      result.f64[0] = v9 * a3;
      *v8++ = v9 * a3;
      --v6;
    }
    while (v6);
  }
  return result;
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__emplace_back_slow_path<double const&,cnmatrix::CNMatrix<1u,3u,double> const&,cnmatrix::CNMatrix<3u,1u,double> &>(uint64_t *a1, double *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  double *v16;
  double *v17;
  void *__p;
  double *v20;
  double *v21;
  char *v22;
  uint64_t *v23;

  v5 = *a1;
  v6 = 0xF0F0F0F0F0F0F0F1 * ((a1[1] - *a1) >> 3);
  v7 = v6 + 1;
  if (v6 + 1 > 0x1E1E1E1E1E1E1E1)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v11 = (uint64_t)(a1 + 2);
  v12 = 0xF0F0F0F0F0F0F0F1 * ((a1[2] - v5) >> 3);
  if (2 * v12 > v7)
    v7 = 2 * v12;
  if (v12 >= 0xF0F0F0F0F0F0F0)
    v13 = 0x1E1E1E1E1E1E1E1;
  else
    v13 = v7;
  v23 = a1 + 2;
  if (v13)
    v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>>(v11, v13);
  else
    v14 = 0;
  __p = v14;
  v20 = (double *)&v14[136 * v6];
  v21 = v20;
  v22 = &v14[136 * v13];
  RoseSyntheticApertureFiltering::InternalExpectedRangeMeas::InternalExpectedRangeMeas(v20, a3, a4, *a2);
  v21 = v20 + 17;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedRangeMeas>::__swap_out_circular_buffer(a1, &__p);
  v15 = a1[1];
  v16 = v20;
  v17 = v21;
  if (v21 != v20)
  {
    do
    {
      *((_QWORD *)v17 - 8) = off_24EC111F8;
      *((_QWORD *)v17 - 16) = off_24EC111F8;
      v17 -= 17;
    }
    while (v17 != v16);
    v21 = v16;
  }
  if (__p)
    operator delete(__p);
  return v15;
}

double *RoseSyntheticApertureFiltering::InternalExpectedRangeMeas::InternalExpectedRangeMeas(double *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v6;

  *a1 = a4;
  v6 = (uint64_t)(a1 + 9);
  cnmatrix::CNMatrix<1u,3u,double>::CNMatrix((uint64_t)(a1 + 1), a2);
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix(v6, a3);
  return a1;
}

void sub_223101A4C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

void cnmatrix::CNMatrix<2u,1u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<2u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<2u,1u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[2];

  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__emplace_back_slow_path<double const&,double const&,cnmatrix::CNMatrix<2u,3u,double> const&,cnmatrix::CNMatrix<3u,2u,double> &>(uint64_t *a1, double *a2, double *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  double *v18;
  double *v19;
  void *__p;
  double *v22;
  double *v23;
  char *v24;
  uint64_t *v25;

  v6 = *a1;
  v7 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 6);
  v8 = v7 + 1;
  if (v7 + 1 > 0x155555555555555)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v13 = (uint64_t)(a1 + 2);
  v14 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v6) >> 6);
  if (2 * v14 > v8)
    v8 = 2 * v14;
  if (v14 >= 0xAAAAAAAAAAAAAALL)
    v15 = 0x155555555555555;
  else
    v15 = v8;
  v25 = a1 + 2;
  if (v15)
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>>(v13, v15);
  else
    v16 = 0;
  __p = v16;
  v22 = (double *)&v16[192 * v7];
  v23 = v22;
  v24 = &v16[192 * v15];
  RoseSyntheticApertureFiltering::InternalExpectedAoAMeas::InternalExpectedAoAMeas(v22, a4, a5, *a2, *a3);
  v23 = v22 + 24;
  std::vector<RoseSyntheticApertureFiltering::InternalExpectedAoAMeas>::__swap_out_circular_buffer(a1, &__p);
  v17 = a1[1];
  v18 = v22;
  v19 = v23;
  if (v23 != v22)
  {
    do
    {
      *((_QWORD *)v19 - 11) = off_24EC111F8;
      *((_QWORD *)v19 - 22) = off_24EC111F8;
      v19 -= 24;
    }
    while (v19 != v18);
    v23 = v18;
  }
  if (__p)
    operator delete(__p);
  return v17;
}

double *RoseSyntheticApertureFiltering::InternalExpectedAoAMeas::InternalExpectedAoAMeas(double *a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  *a1 = a4;
  a1[1] = a5;
  cnmatrix::CNMatrix<2u,3u,double>::CNMatrix((uint64_t)(a1 + 2), a2);
  cnmatrix::CNMatrix<3u,2u,double>::CNMatrix((uint64_t)(a1 + 13), a3);
  return a1;
}

void sub_223101C7C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

void std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  char *v7;
  void (**v8)(char *);
  BOOL v9;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = v4 - 56;
      v7 = v4 - 56;
      do
      {
        v8 = *(void (***)(char *))v7;
        v7 -= 56;
        (*v8)(v6);
        v9 = v6 == v2;
        v6 = v7;
      }
      while (!v9);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(56 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>,std::reverse_iterator<cnmatrix::CNMatrix<2u,1u,double>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = 0;
  v11 = a7 - 56;
  while (a3 + v10 != a5)
  {
    v12 = v11 + v10;
    v10 -= 56;
    cnmatrix::CNMatrix<2u,1u,double>::CNMatrix(v12, v10 + a3);
  }
  return a6;
}

__n128 cnmatrix::CNMatrix<2u,1u,double>::CNMatrix(uint64_t a1, uint64_t a2)
{
  __n128 result;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  _OWORD *v6;
  int v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  __int128 *v11;
  __n128 *v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  const char *v16;
  int v17;
  const char *v18;
  const char *v19;

  result.n128_u64[0] = 0x100000002;
  *(_QWORD *)(a1 + 24) = 0x100000002;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = &off_24EC11690;
  if (a1 == a2)
  {
    v16 = "this != &(A)";
    v17 = 603;
LABEL_21:
    v18 = "cnmatrix.h";
    v19 = "CNMatrix";
LABEL_22:
    __assert_rtn(v19, v18, v17, v16);
  }
  v3 = *(_DWORD *)(a2 + 8);
  if (v3 > 2)
  {
    v16 = "this->max_num_rows_ >= num_rows";
    v17 = 422;
LABEL_18:
    v18 = "cnmatrixbase.h";
    v19 = "SetMatrixSize";
    goto LABEL_22;
  }
  v4 = *(_DWORD *)(a2 + 12);
  if (v4 >= 2)
  {
    v16 = "this->max_num_cols_ >= num_cols";
    v17 = 423;
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 12) = v4;
  v5 = v4 * v3;
  *(_DWORD *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 20) = v3;
  v6 = (_OWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = a1 + 40;
  if (*(_DWORD *)(a2 + 8) > 2u)
  {
    v16 = "this->max_num_rows_ >= A.num_rows_";
    v17 = 616;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a2 + 12) > 1u)
  {
    v16 = "this->max_num_cols_ >= A.num_cols_";
    v17 = 617;
    goto LABEL_21;
  }
  v7 = *(_DWORD *)(a2 + 16);
  if (v7 > 3)
  {
    v10 = (v7 - 2);
    v11 = *(__int128 **)(a2 + 32);
    v12 = (__n128 *)((char *)v6 + 8 * v10);
    v13 = (v7 - 1) >> 1;
    v14 = v11;
    do
    {
      v15 = *v14++;
      *v6++ = v15;
      --v13;
    }
    while (v13);
    result = *(__n128 *)((char *)v11 + 8 * v10);
    *v12 = result;
  }
  else if ((_DWORD)v5)
  {
    v8 = *(unint64_t **)(a2 + 32);
    do
    {
      v9 = *v8++;
      result.n128_u64[0] = v9;
      *(_QWORD *)v6 = v9;
      v6 = (_OWORD *)((char *)v6 + 8);
      --v5;
    }
    while (v5);
  }
  return result;
}

void sub_223101FC8(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  void (**v4)(void);

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(void (***)(void))(i - 56);
    *(_QWORD *)(a1 + 16) = i - 56;
    (*v4)();
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__push_back_slow_path<cnmatrix::CNMatrix<2u,1u,double> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) > 0x492492492492492)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x249249249249249)
    v9 = 0x492492492492492;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cnmatrix::CNMatrix<2u,1u,double>>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[56 * v4];
  v16 = &v10[56 * v9];
  cnmatrix::CNMatrix<2u,1u,double>::CNMatrix((uint64_t)v14, a2);
  v15 = v14 + 56;
  std::vector<cnmatrix::CNMatrix<2u,1u,double>>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_223102130(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<cnmatrix::CNMatrix<2u,1u,double>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *cnmatrix::CNMatrix<225u,1u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

void cnmatrix::CNMatrix<225u,1u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<225u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<225u,1u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[225];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

void cnmatrix::CNMatrix<2u,2u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<2u,2u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<2u,2u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[4];

  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

void cnmatrix::CNMatrix<1u,2u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<1u,2u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<1u,2u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[2];

  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

double cnmatrix::Eig<double>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  __CLPK_doublereal *v19;
  __CLPK_doublereal *__wi;
  __CLPK_doublereal *__scale;
  __CLPK_doublereal *__rconde;
  __CLPK_doublereal *__work;
  __CLPK_doublereal *v24;
  __CLPK_integer v25;
  __CLPK_doublereal *v26;
  __CLPK_integer v27;
  uint64_t v28;
  __CLPK_integer v29;
  double result;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  double *v41;
  _QWORD *v42;
  int v43;
  unsigned int v44;
  __CLPK_doublereal v45;
  __CLPK_integer v46;
  unsigned int v47;
  __CLPK_integer __ihi[2];
  __CLPK_integer __ldvr;
  __CLPK_integer __ldvl;
  __CLPK_integer __lda;
  __CLPK_integer __n;
  char __sense[12];

  if (a1 == a2)
    cnmatrix::Eig<double>();
  if (a1 == a3)
    cnmatrix::Eig<double>();
  if (a1 == a4)
    cnmatrix::Eig<double>();
  if (a1 == a5)
    cnmatrix::Eig<double>();
  if (a1 == a6)
    cnmatrix::Eig<double>();
  if (a1 == a7)
    cnmatrix::Eig<double>();
  if (a1 == a8)
    cnmatrix::Eig<double>();
  if (a1 == a9)
    cnmatrix::Eig<double>();
  if (a2 == a3)
    cnmatrix::Eig<double>();
  if (a2 == a4)
    cnmatrix::Eig<double>();
  if (a2 == a5)
    cnmatrix::Eig<double>();
  if (a2 == a6)
    cnmatrix::Eig<double>();
  if (a2 == a7)
    cnmatrix::Eig<double>();
  if (a2 == a8)
    cnmatrix::Eig<double>();
  if (a2 == a9)
    cnmatrix::Eig<double>();
  if (a3 == a4)
    cnmatrix::Eig<double>();
  if (a3 == a5)
    cnmatrix::Eig<double>();
  if (a3 == a6)
    cnmatrix::Eig<double>();
  if (a3 == a7)
    cnmatrix::Eig<double>();
  if (a3 == a8)
    cnmatrix::Eig<double>();
  if (a3 == a9)
    cnmatrix::Eig<double>();
  if (a4 == a5)
    cnmatrix::Eig<double>();
  if (a4 == a6)
    cnmatrix::Eig<double>();
  if (a4 == a7)
    cnmatrix::Eig<double>();
  if (a4 == a8)
    cnmatrix::Eig<double>();
  if (a4 == a9)
    cnmatrix::Eig<double>();
  if (a5 == a6)
    cnmatrix::Eig<double>();
  if (a5 == a7)
    cnmatrix::Eig<double>();
  if (a5 == a8)
    cnmatrix::Eig<double>();
  if (a5 == a9)
    cnmatrix::Eig<double>();
  if (a6 == a7)
    cnmatrix::Eig<double>();
  if (a6 == a8)
    cnmatrix::Eig<double>();
  if (a6 == a9)
    cnmatrix::Eig<double>();
  if (a7 == a8)
    cnmatrix::Eig<double>();
  if (a7 == a9)
    cnmatrix::Eig<double>();
  if (a8 == a9)
    cnmatrix::Eig<double>();
  v16 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v16 != *(_DWORD *)(a1 + 12))
    cnmatrix::Eig<double>();
  v17 = *(_DWORD *)(a7 + 24);
  if (*(_DWORD *)(a7 + 28) * v17 < v16)
    cnmatrix::Eig<double>();
  v18 = *(_DWORD *)(a8 + 24);
  if (*(_DWORD *)(a8 + 28) * v18 < v16)
    cnmatrix::Eig<double>();
  v44 = *(_DWORD *)(a9 + 28) * *(_DWORD *)(a9 + 24);
  if (v44 < 3 * (int)v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a2 + 24) < v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a2 + 28) < v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a3 + 24) < v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a3 + 28) < v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a4 + 24) < v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a4 + 28) < v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a5 + 24) < v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a5 + 28) < v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a6 + 24) < v16)
    cnmatrix::Eig<double>();
  if (*(_DWORD *)(a6 + 28) < v16)
    cnmatrix::Eig<double>();
  if (v17 < v16)
    cnmatrix::Eig<double>();
  if (v18 < v16)
    cnmatrix::Eig<double>();
  cnmatrix::CNMatrixBase<double>::operator=(a2, a1);
  cnmatrix::FastResize<double>((_DWORD *)a3, v16, v16);
  cnmatrix::CNMatrixBase<double>::WriteValue(a3, 0.0);
  cnmatrix::FastResize<double>((_DWORD *)a4, v16, v16);
  cnmatrix::CNMatrixBase<double>::WriteValue(a4, 0.0);
  cnmatrix::FastResize<double>((_DWORD *)a5, v16, v16);
  cnmatrix::CNMatrixBase<double>::WriteValue(a5, 0.0);
  cnmatrix::FastResize<double>((_DWORD *)a6, v16, v16);
  cnmatrix::CNMatrixBase<double>::WriteValue(a6, 0.0);
  v19 = *(__CLPK_doublereal **)(a3 + 32);
  __wi = *(__CLPK_doublereal **)(a4 + 32);
  __scale = *(__CLPK_doublereal **)(a7 + 32);
  v45 = 0.0;
  __rconde = *(__CLPK_doublereal **)(a8 + 32);
  __work = *(__CLPK_doublereal **)(a9 + 32);
  v24 = *(__CLPK_doublereal **)(a2 + 32);
  v25 = *(_DWORD *)(a2 + 8);
  v26 = *(__CLPK_doublereal **)(a5 + 32);
  v27 = *(_DWORD *)(a5 + 8);
  qmemcpy(__sense, "NVNB", 4);
  __lda = v25;
  __n = v16;
  __ldvr = v27;
  __ldvl = 1;
  *(_QWORD *)__ihi = 0;
  v46 = 0;
  v47 = v44;
  v28 = dgeevx_(&__sense[3], &__sense[2], &__sense[1], __sense, &__n, v24, &__lda, v19, __wi, 0, &__ldvl, v26, &__ldvr, &__ihi[1], __ihi, __scale, &v45, __rconde, &__rconde[(int)v16],
          __work,
          (__CLPK_integer *)&v47,
          0,
          &v46);
  v29 = v46;
  if (v46)
  {
    LOWORD(__n) = 4;
    if (v46 < 0)
      LOBYTE(__lda) = 5;
    else
      LOBYTE(__lda) = 4;
    v28 = cnprint::CNPrinter::Print();
  }
  if (v44 < **(double **)(a9 + 32)
    && cnprint::CNPrinter::GetLogLevel((cnprint::CNPrinter *)v28) <= 1)
  {
    LOWORD(__n) = 4;
    LOBYTE(__lda) = 1;
    cnprint::CNPrinter::Print();
  }
  if (v29)
    cnmatrix::Eig<double>();
  cnmatrix::FastResize<double>((_DWORD *)a9, *(_DWORD *)(a9 + 24), *(_DWORD *)(a9 + 28));
  cnmatrix::FastResize<double>((_DWORD *)a8, v16, 2);
  cnmatrix::FastResize<double>((_DWORD *)a7, v16, 1);
  if ((_DWORD)v16)
  {
    v31 = 0;
    v32 = *(_QWORD *)(a4 + 32);
    v33 = *(_QWORD *)(a5 + 32);
    v34 = *(_QWORD *)(a6 + 32);
    do
    {
      result = *(double *)(v32 + 8 * v31);
      if (result != 0.0)
      {
        v35 = v31 * v16;
        v36 = v16 + v31;
        v37 = v16;
        do
        {
          *(_QWORD *)(v34 + 8 * v35) = *(_QWORD *)(v33 + 8 * v36);
          *(double *)(v34 + 8 * v36) = -*(double *)(v33 + 8 * v36);
          result = *(double *)(v33 + 8 * v35++);
          *(double *)(v33 + 8 * v36++) = result;
          --v37;
        }
        while (v37);
        ++v31;
      }
      ++v31;
    }
    while (v31 < v16);
    if (v16 >= 2)
    {
      v38 = *(_QWORD *)(a3 + 32);
      v39 = *(_QWORD *)(a4 + 32);
      v40 = v16 - 1;
      v41 = (double *)(v39 + 8);
      v42 = (_QWORD *)(v38 + 8);
      v43 = v16 + 1;
      do
      {
        *(_QWORD *)(v38 + 8 * v43) = *v42;
        result = *v41;
        *(double *)(v39 + 8 * v43) = *v41;
        *v42++ = 0;
        *v41++ = 0.0;
        v43 += v16 + 1;
        --v40;
      }
      while (v40);
    }
  }
  return result;
}

_QWORD *cnmatrix::CNMatrix<168u,1u,double>::~CNMatrix(_QWORD *result)
{
  *result = off_24EC111F8;
  return result;
}

void cnmatrix::CNMatrix<168u,1u,double>::~CNMatrix(_QWORD *a1)
{
  *a1 = off_24EC111F8;
  JUMPOUT(0x227682F88);
}

uint64_t cnmatrix::CNMatrix<168u,1u,double>::AllocateAndBindMemoryBacking(uint64_t result)
{
  *(_QWORD *)(result + 32) = result + 40;
  return result;
}

void cnmatrix::CNMatrix<168u,1u,double>::TransposeDataFootprint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3[168];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  cnmatrix::CNMatrix<3u,1u,double>::TransposeDataFootprint(a1, v3, a3);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__push_back_slow_path<RoseSyntheticApertureFiltering::InternalAoAMeas const&>(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  void *__p;
  char *v13;
  char *v14;
  char *v15;
  uint64_t *v16;

  v3 = 0x4EC4EC4EC4EC4EC5 * ((a1[1] - *a1) >> 4);
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x13B13B13B13B13BLL)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  if (0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 4) > v4)
    v4 = 0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 4);
  if ((unint64_t)(0x4EC4EC4EC4EC4EC5 * ((a1[2] - *a1) >> 4)) >= 0x9D89D89D89D89DLL)
    v6 = 0x13B13B13B13B13BLL;
  else
    v6 = v4;
  v16 = a1 + 2;
  if (v6)
    v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>>((uint64_t)(a1 + 2), v6);
  else
    v7 = 0;
  __p = v7;
  v13 = &v7[208 * v3];
  v15 = &v7[208 * v6];
  std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>((uint64_t)(a1 + 2), v13, a2);
  v14 = v13 + 208;
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__swap_out_circular_buffer(a1, &__p);
  v8 = a1[1];
  v9 = v13;
  v10 = v14;
  if (v14 != v13)
  {
    do
    {
      *((_QWORD *)v10 - 14) = off_24EC111F8;
      *((_QWORD *)v10 - 22) = off_24EC111F8;
      v10 -= 208;
    }
    while (v10 != v9);
    v14 = v9;
  }
  if (__p)
    operator delete(__p);
  return v8;
}

double std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>(uint64_t a1, _OWORD *a2, _OWORD *a3)
{
  __int128 v5;
  double result;

  v5 = a3[1];
  *a2 = *a3;
  a2[1] = v5;
  cnmatrix::CNMatrix<3u,1u,double>::CNMatrix((uint64_t)(a2 + 2), (uint64_t)(a3 + 2));
  *(_QWORD *)&result = cnmatrix::CNMatrix<3u,3u,double>::CNMatrix((uint64_t)(a2 + 6), (uint64_t)(a3 + 6)).n128_u64[0];
  return result;
}

void sub_223102AA4(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

uint64_t std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x13B13B13B13B13CLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(208 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalAoAMeas*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;

  v11 = 0;
  v12 = a7 - 208;
  while (a3 + v11 != a5)
  {
    v13 = (_OWORD *)(v12 + v11);
    v11 -= 208;
    std::allocator<RoseSyntheticApertureFiltering::InternalAoAMeas>::construct[abi:ne180100]<RoseSyntheticApertureFiltering::InternalAoAMeas,RoseSyntheticApertureFiltering::InternalAoAMeas const&>(a1, v13, (_OWORD *)(v11 + a3));
  }
  return a6;
}

double *RoseSyntheticApertureFiltering::measModelRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double *result;
  uint64_t (**v13)();
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (**v18)();
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (**v23)();
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (**v28)();
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;

  v15 = 0x100000003;
  v13 = &off_24EC111A0;
  v14 = xmmword_223118D20;
  v16 = &v17;
  cnmatrix::Subtract<double>(a1, a2, (uint64_t)&v13);
  v30 = 0x100000003;
  v28 = &off_24EC111A0;
  v29 = xmmword_223118D20;
  v31 = &v32;
  v25 = 0x100000134;
  v23 = &off_24EC11270;
  v24 = xmmword_223118D50;
  v26 = &v27;
  v20 = 0x100000003;
  v18 = &off_24EC111A0;
  v19 = xmmword_223118D20;
  v21 = &v22;
  cnmatrix::Norm<double>((uint64_t)&v13, (uint64_t)&v28, (uint64_t)&v23, (uint64_t)&v18, "2");
  v7 = v6;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 0) = v6;
  if (v7 == 0.0)
  {
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 0) = 0;
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 1) = 0;
    result = (double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 2);
    *result = 0.0;
  }
  else
  {
    v8 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v13, 0);
    v9 = 1.0 / v7;
    *(double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 0) = 1.0 / v7 * v8;
    v10 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v13, 1u);
    *(double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 1) = v9 * v10;
    v11 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v13, 2u);
    result = (double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0, 2);
    *result = v9 * v11;
  }
  return result;
}

void RoseSyntheticApertureFiltering::measModelAoA(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v8;
  double v9;
  double v10;
  long double v11;
  double v12;
  long double v13;
  long double *v14;
  long double *v15;
  double v16;
  double v17;
  double v18;
  long double *v19;
  uint64_t (**v20)();
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (**v25)();
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (**v30)();
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (**v35)();
  __int128 v36;
  uint64_t v37;
  _BYTE *v38;
  _BYTE v39[2464];
  uint64_t (**v40)();
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;

  v27 = 0x100000003;
  v25 = &off_24EC111A0;
  v26 = xmmword_223118D20;
  v28 = &v29;
  cnmatrix::Subtract<double>(a1, a2, (uint64_t)&v25);
  v22 = 0x100000003;
  v20 = &off_24EC111A0;
  v21 = xmmword_223118D20;
  v23 = &v24;
  cnmatrix::Multiply<double>(a3, (uint64_t)&v25, (uint64_t)&v20);
  v42 = 0x100000003;
  v40 = &off_24EC111A0;
  v41 = xmmword_223118D20;
  v43 = &v44;
  v37 = 0x100000134;
  v35 = &off_24EC11270;
  v36 = xmmword_223118D50;
  v38 = v39;
  v32 = 0x100000003;
  v30 = &off_24EC111A0;
  v31 = xmmword_223118D20;
  v33 = &v34;
  cnmatrix::Norm<double>((uint64_t)&v20, (uint64_t)&v40, (uint64_t)&v35, (uint64_t)&v30, "2");
  v9 = v8;
  v10 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v20, 0);
  v11 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v20, 1u);
  v12 = cnmatrix::CNMatrixBase<double>::operator()((uint64_t)&v20, 2u);
  if (v9 != 0.0)
  {
    v13 = v12;
    v14 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0);
    *v14 = atan2(v13, v11);
    v15 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 1u);
    *v15 = asin(v10 / v9);
    v16 = v13 * v13 + v11 * v11;
    v17 = 1.0 / (v9 * v9);
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(a5, 0, 0) = 0;
    v18 = sqrt(v16);
    *(double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 0) = v17 * v18;
    v19 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 0, 1);
    if (v16 == 0.0)
    {
      *v19 = 0.0;
      *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(a5, 0, 2) = 0;
      *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 1) = 0;
      *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 2) = 0;
    }
    else
    {
      *v19 = -v13 / v16;
      *(long double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 0, 2) = v11 / v16;
      *(long double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 1) = v17 * (-(v10 * v11) / v18);
      *(long double *)cnmatrix::CNMatrixBase<double>::operator()(a5, 1, 2) = v17 * (-(v10 * v13) / v18);
    }
  }
  v37 = 0x300000002;
  v35 = &off_24EC114E8;
  v36 = xmmword_223119060;
  v38 = v39;
  cnmatrix::Multiply<double>(a5, a3, (uint64_t)&v35);
  cnmatrix::CNMatrixBase<double>::operator=(a5, (uint64_t)&v35);
}

void RoseSyntheticApertureFiltering::measModelRangeAlt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (**v8)();
  __int128 v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (**v13)();
  __int128 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;

  v15 = 0x300000001;
  v13 = &off_24EC114A0;
  v14 = xmmword_223119050;
  v16 = &v17;
  RoseSyntheticApertureFiltering::measModelRange(a3, a4, a5, (uint64_t)&v13);
  v10 = 0x300000001;
  v8 = &off_24EC114A0;
  v9 = xmmword_223119050;
  v11 = &v12;
  cnmatrix::Multiply<double>((uint64_t)&v13, a2, (uint64_t)&v8);
  cnmatrix::CNMatrixBase<double>::operator=(a6, (uint64_t)&v8);
}

void RoseSyntheticApertureFiltering::measModelAoAAlt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (**v9)();
  __int128 v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (**v14)();
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  v16 = 0x300000002;
  v14 = &off_24EC114E8;
  v15 = xmmword_223119060;
  v17 = &v18;
  RoseSyntheticApertureFiltering::measModelAoA(a3, a4, a5, a6, (uint64_t)&v14);
  v11 = 0x300000002;
  v9 = &off_24EC114E8;
  v10 = xmmword_223119060;
  v12 = &v13;
  cnmatrix::Multiply<double>((uint64_t)&v14, a2, (uint64_t)&v9);
  cnmatrix::CNMatrixBase<double>::operator=(a7, (uint64_t)&v9);
}

double *RoseSyntheticApertureFiltering::rhoThPhi2pos(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v6;
  double v7;
  double v8;
  __double2 v9;
  __double2 v10;
  double v11;
  double v12;
  double v13;
  double *result;

  v6 = cnmatrix::CNMatrixBase<double>::operator()(a1, 0);
  v7 = cnmatrix::CNMatrixBase<double>::operator()(a1, 1u);
  v8 = cnmatrix::CNMatrixBase<double>::operator()(a1, 2u);
  v9 = __sincos_stret(v8);
  v10 = __sincos_stret(v7);
  v11 = v6 * v9.__cosval;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0) = v10.__sinval * (v6 * v9.__cosval);
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1u) = v6 * v9.__sinval;
  v12 = v10.__cosval * (v6 * v9.__cosval);
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2u) = v12;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 0, 0) = v10.__sinval * v9.__cosval;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 1, 0) = v9.__sinval;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 2, 0) = v10.__cosval * v9.__cosval;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 0, 1) = v12;
  *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(a3, 1, 1) = 0;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 2, 1) = v10.__sinval * -(v6 * v9.__cosval);
  v13 = -(v6 * v9.__sinval);
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 0, 2) = v10.__sinval * v13;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 1, 2) = v11;
  result = (double *)cnmatrix::CNMatrixBase<double>::operator()(a3, 2, 2);
  *result = v10.__cosval * v13;
  return result;
}

void RoseSyntheticApertureFiltering::pos2rangeThPhi(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long double v4;
  double v5;
  long double v6;
  long double *v7;
  double v8;
  long double *v9;

  v4 = cnmatrix::CNMatrixBase<double>::operator()(a1, 0);
  v5 = cnmatrix::CNMatrixBase<double>::operator()(a1, 1u);
  v6 = cnmatrix::CNMatrixBase<double>::operator()(a1, 2u);
  *(_QWORD *)(a2 + 24) = 0x100000003;
  *(_QWORD *)a2 = &off_24EC111A0;
  *(_OWORD *)(a2 + 8) = xmmword_223118D20;
  *(_QWORD *)(a2 + 32) = a2 + 40;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0) = sqrt(v5 * v5 + v4 * v4 + v6 * v6);
  if (*(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0) <= 0.0)
  {
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1u) = 0;
    *(_QWORD *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2u) = 0;
  }
  else
  {
    v7 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1u);
    *v7 = atan2(v4, v6);
    v8 = *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0);
    v9 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2u);
    *v9 = asin(v5 / v8);
  }
}

void sub_22310353C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

long double RoseSyntheticApertureFiltering::rangeAzEl2pos@<D0>(double a1@<D0>, long double a2@<D1>, long double a3@<D2>, uint64_t a4@<X8>)
{
  long double *v9;
  long double *v10;
  long double v11;
  double *v12;
  long double result;

  *(_QWORD *)(a4 + 24) = 0x100000003;
  *(_QWORD *)a4 = &off_24EC111A0;
  *(_OWORD *)(a4 + 8) = xmmword_223118D20;
  *(_QWORD *)(a4 + 32) = a4 + 40;
  v9 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 0);
  *v9 = sin(a2) * a1;
  v10 = (long double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 1u);
  v11 = cos(a2) * a1;
  *v10 = v11 * cos(a3);
  v12 = (double *)cnmatrix::CNMatrixBase<double>::operator()(a4, 2u);
  result = v11 * sin(a3);
  *v12 = result;
  return result;
}

void sub_22310361C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

double RoseSyntheticApertureFiltering::quatn2rot@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double *v12;
  double result;
  double v14;
  double v15;

  *(_QWORD *)(a2 + 24) = 0x300000003;
  *(_QWORD *)a2 = &off_24EC11458;
  *(_OWORD *)(a2 + 8) = xmmword_223118FC0;
  *(_QWORD *)(a2 + 32) = a2 + 40;
  cnmatrix::FastResize<double>((_DWORD *)a2, 3, 3);
  cnmatrix::CNMatrixBase<double>::WriteValue(a2, 0.0);
  v4 = cnmatrix::CNMatrixBase<double>::operator()(a1, 0);
  v5 = cnmatrix::CNMatrixBase<double>::operator()(a1, 1u);
  v6 = cnmatrix::CNMatrixBase<double>::operator()(a1, 2u);
  v7 = cnmatrix::CNMatrixBase<double>::operator()(a1, 3u);
  v14 = v5 * v5;
  v15 = v4 * v4;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0, 0) = v4 * v4 - v5 * v5 - v6 * v6 + v7 * v7;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1, 0) = v4 * v5 + v6 * v7 + v4 * v5 + v6 * v7;
  v8 = v4 * v6;
  v9 = v5 * v7;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2, 0) = v4 * v6 - v5 * v7 + v4 * v6 - v5 * v7;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0, 1) = v4 * v5 - v6 * v7 + v4 * v5 - v6 * v7;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1, 1) = v5 * v5 - v4 * v4 - v6 * v6 + v7 * v7;
  v10 = v4 * v7;
  v11 = v5 * v6;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2, 1) = v11 + v10 + v11 + v10;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 0, 2) = v8 + v9 + v8 + v9;
  *(double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 1, 2) = v11 - v10 + v11 - v10;
  v12 = (double *)cnmatrix::CNMatrixBase<double>::operator()(a2, 2, 2);
  result = -v15 - v14 + v6 * v6 + v7 * v7;
  *v12 = result;
  return result;
}

void sub_22310384C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  *v1 = off_24EC111F8;
  _Unwind_Resume(a1);
}

double RoseSyntheticApertureFiltering::range2deweight(RoseSyntheticApertureFiltering *this, double a2)
{
  double v2;

  v2 = 1.0;
  if (a2 <= 1.0)
    return v2;
  v2 = 5.0;
  if (a2 >= 10.0)
    return v2;
  else
    return (a2 + -1.0) * 0.444444444 + 1.0;
}

void sub_223103F28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_223104118(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2231043B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_223104814(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_223104C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  void *v19;
  id *v20;
  void *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_223104D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;

  MEMORY[0x227682F88](v10, 0x1080C4011C7A211);

  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseRangeFilter>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    *(_QWORD *)(v2 + 176) = off_24EC111F8;
    *(_QWORD *)(v2 + 112) = off_24EC111F8;
    *(_QWORD *)(v2 + 48) = off_24EC111F8;

    JUMPOUT(0x227682F88);
  }
  return result;
}

void sub_223104EDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_223105184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  void *v16;
  void *v17;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_223105260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;

  MEMORY[0x227682F88](v10, 0x1080C4011C7A211);

  _Unwind_Resume(a1);
}

void sub_223105414(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22310566C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2231058F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_223105988(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2231059CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_223105A7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_223105B50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_223105C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_2231061D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

double simd_quaternion(simd_float4x4 a1)
{
  float v1;
  float v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  unsigned __int32 v11;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;

  v1 = a1.columns[2].f32[2] + (float)(a1.columns[0].f32[0] + a1.columns[1].f32[1]);
  if (v1 >= 0.0)
  {
    a1.columns[3].f32[0] = sqrtf(v1 + 1.0);
    v5 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]));
    v6 = vmul_f32(v5, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v5));
    *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL), *(int32x2_t *)a1.columns[2].f32), (float32x2_t)vext_s8(*(int8x8_t *)a1.columns[2].f32, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), 4uLL)), vmul_f32(v6, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v6)).f32[0]);
  }
  else if (a1.columns[0].f32[0] < a1.columns[1].f32[1] || a1.columns[0].f32[0] < a1.columns[2].f32[2])
  {
    v3 = 1.0 - a1.columns[0].f32[0];
    if (a1.columns[1].f32[1] >= a1.columns[2].f32[2])
    {
      a1.columns[3].f32[0] = sqrtf(a1.columns[1].f32[1] + (float)(v3 - a1.columns[2].f32[2]));
      a1.columns[3].f32[0] = a1.columns[3].f32[0] + a1.columns[3].f32[0];
      v16 = vrecpe_f32((float32x2_t)a1.columns[3].u32[0]);
      v17 = vmul_f32(v16, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v16));
      v18.i32[0] = vmul_f32(v17, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v17)).u32[0];
      v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)a1.columns[0].f32, 1), *(float32x2_t *)a1.columns[1].f32).u32[0];
      v17.i32[1] = a1.columns[3].i32[0];
      v18.i32[1] = 0.25;
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v17, v18);
    }
    else
    {
      v4 = (float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[2].f32[2] + (float)(v3 - a1.columns[1].f32[1]))));
      *(float32x2_t *)a1.columns[2].f32 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL)), *(float32x2_t *)a1.columns[2].f32);
      *(int32x2_t *)a1.columns[1].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
      a1.columns[1].i32[0] = 2.0;
      a1.columns[1].i32[0] = vmul_f32(v4, *(float32x2_t *)a1.columns[1].f32).u32[0];
      *(float32x2_t *)a1.columns[3].f32 = vrecpe_f32((float32x2_t)a1.columns[1].u32[0]);
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32));
      *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(*(float32x2_t *)a1.columns[2].f32, vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32)).f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
    }
  }
  else
  {
    *(int32x2_t *)a1.columns[3].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
    v7 = vadd_f32(*(float32x2_t *)a1.columns[0].f32, *(float32x2_t *)a1.columns[3].f32);
    a1.columns[3].i32[0] = 2.0;
    v8.i32[0] = vmul_f32((float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[0].f32[0]+ (float)((float)(1.0 - a1.columns[1].f32[1]) - a1.columns[2].f32[2])))), *(float32x2_t *)a1.columns[3].f32).u32[0];
    v8.i32[1] = v7.i32[1];
    v9 = vrecpe_f32((float32x2_t)v8.u32[0]);
    v10 = vmul_f32(v9, vrecps_f32((float32x2_t)v8.u32[0], v9));
    v11 = vmul_f32(v10, vrecps_f32((float32x2_t)v8.u32[0], v10)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.i32[1] = v11;
    *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v8, _D5);
  }
  return *(double *)a1.columns[3].i64;
}

void sub_223106874(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_223106AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  void *v14;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_22310703C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void sub_22310725C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2231074DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_223107640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22310777C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223107864(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2231079CC(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  objc_destroyWeak((id *)(v2 - 56));

  _Unwind_Resume(a1);
}

void sub_223107D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28)
{
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void sub_223107F18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223108330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;

  v34 = *(void **)(v32 - 80);
  if (v34)
  {
    *(_QWORD *)(v32 - 72) = v34;
    operator delete(v34);
  }

  _Unwind_Resume(a1);
}

void sub_223108484(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_223108564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *std::unique_ptr<RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter>::reset[abi:ne180100](RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter **a1, RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *a2)
{
  RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::~PRRoseSyntheticApertureBatchFilter(result);
    JUMPOUT(0x227682F88);
  }
  return result;
}

void sub_2231086F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223108BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;
  void *v19;

  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_223108CA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223108E60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_223108F94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223109160(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223109624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_223109770(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223109870(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22310998C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223109A8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223109BA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223109CA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22310A1E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22310A3F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22310A4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  v16 = v15;

  _Unwind_Resume(a1);
}

void sub_22310A58C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22310A8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_22310A9E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_22310AAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)PRItemLocalizer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_22310AB8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22310AC74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::~PRRoseSyntheticApertureBatchFilter(RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter *this)
{
  void *v2;
  void *v3;
  void *v4;
  void **v5;

  *((_QWORD *)this + 108) = off_24EC111F8;
  *((_QWORD *)this + 98) = off_24EC111F8;
  v5 = (void **)((char *)this + 720);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&v5);
  v5 = (void **)((char *)this + 696);
  std::vector<RoseSyntheticApertureFiltering::InternalAoAMeas>::__destroy_vector::operator()[abi:ne180100](&v5);
  v5 = (void **)((char *)this + 672);
  std::vector<RoseSyntheticApertureFiltering::InternalRangeMeas>::__destroy_vector::operator()[abi:ne180100](&v5);
  boost::circular_buffer<double,std::allocator<double>>::destroy((uint64_t)this + 632);
  *((_QWORD *)this + 65) = off_24EC111F8;
  *((_QWORD *)this + 57) = off_24EC111F8;

  *((_QWORD *)this + 39) = off_24EC111F8;
  *((_QWORD *)this + 30) = off_24EC111F8;
  *((_QWORD *)this + 21) = off_24EC111F8;
  v5 = (void **)((char *)this + 144);
  std::vector<RoseSyntheticApertureFiltering::InternalFilterState>::__destroy_vector::operator()[abi:ne180100](&v5);
  v2 = (void *)*((_QWORD *)this + 14);
  if (v2)
  {
    *((_QWORD *)this + 15) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 8);
  if (v3)
  {
    *((_QWORD *)this + 9) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 2);
  if (v4)
  {
    *((_QWORD *)this + 3) = v4;
    operator delete(v4);
  }
}

BTFinding::PRRSSIFilter *BTFinding::PRRSSIFilter::PRRSSIFilter(BTFinding::PRRSSIFilter *this, int a2)
{
  NSObject *v3;
  int v4;
  int v5;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  *((_BYTE *)this + 8) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_DWORD *)this + 8) = 2;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((_QWORD *)this + 13) = 0;
  *((_DWORD *)this + 28) = -128;
  *((_QWORD *)this + 15) = 0;
  *((_DWORD *)this + 32) = 0;
  *((_DWORD *)this + 34) = -128;
  *((_QWORD *)this + 18) = 0;
  *((_DWORD *)this + 38) = 1;
  *((_DWORD *)this + 40) = -128;
  *((_QWORD *)this + 21) = 0;
  *((_DWORD *)this + 44) = 2;
  *((_DWORD *)this + 6) = a2;
  *((_DWORD *)this + 7) = a2 - 4;
  v3 = os_log_create("com.apple.proximity", "BTRSSIFilter");
  *(_QWORD *)this = v3;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *((_DWORD *)this + 6);
    v5 = *((_DWORD *)this + 7);
    v7[0] = 67109376;
    v7[1] = v4;
    v8 = 1024;
    v9 = v5;
    _os_log_impl(&dword_2230E5000, v3, OS_LOG_TYPE_DEFAULT, "Received Tx Power: %d dB, calculated Tx power adjustment: %d dB", (uint8_t *)v7, 0xEu);
  }
  return this;
}

uint64_t BTFinding::PRRSSIFilter::reset(uint64_t this)
{
  *(_BYTE *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_DWORD *)(this + 32) = 2;
  *(_DWORD *)(this + 112) = -128;
  *(_QWORD *)(this + 120) = 0;
  *(_DWORD *)(this + 128) = 0;
  *(_DWORD *)(this + 136) = -128;
  *(_QWORD *)(this + 144) = 0;
  *(_DWORD *)(this + 152) = 1;
  *(_DWORD *)(this + 160) = -128;
  *(_QWORD *)(this + 168) = 0;
  *(_DWORD *)(this + 176) = 2;
  *(_QWORD *)(this + 48) = *(_QWORD *)(this + 40);
  *(_QWORD *)(this + 72) = *(_QWORD *)(this + 64);
  *(_QWORD *)(this + 96) = *(_QWORD *)(this + 88);
  return this;
}

void BTFinding::PRRSSIFilter::addRSSImeasurement(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v5;
  double v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  __int128 *v13;
  void **v14;
  uint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 *v18;
  void **v19;
  uint64_t v20;
  __int128 *v21;
  __int128 v22;
  __int128 *v23;
  void **v24;
  unint64_t v25;
  __int128 *v26;
  __int128 v27;
  unint64_t v28;
  int *v29;
  char *v30;
  unint64_t v31;
  int *v32;
  char *v33;
  unint64_t v34;
  char *v35;
  int *v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  int *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  double *v54;
  char *v55;
  __int128 v56;
  double *v57;
  char *v58;
  __int128 v59;
  double *v60;
  char *v61;
  __int128 v62;
  NSObject *v63;
  NSObject *v64;
  char v65;
  double v66;
  double v67;
  double v68;
  NSObject *v69;
  double v70;
  double v71;
  double v72;
  NSObject *v73;
  int v74;
  int v75;
  _BYTE v76[18];
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v5 = *(_DWORD *)a2 - *(_DWORD *)(a1 + 28);
  v6 = *(double *)(a2 + 8);
  v7 = *(_DWORD *)(a2 + 16);
  v8 = *(NSObject **)a1;
  v9 = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 0x80000000) == 0)
  {
    if (v9)
    {
      v75 = 67109376;
      *(_DWORD *)v76 = v5;
      *(_WORD *)&v76[4] = 2048;
      *(double *)&v76[6] = v6;
      v10 = "An invalid RSSI measurement with a value of %d dB has been received and ignored at time = %5.3f s";
      v11 = v8;
      v12 = 18;
LABEL_109:
      _os_log_impl(&dword_2230E5000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v75, v12);
      goto LABEL_110;
    }
    goto LABEL_110;
  }
  if (v9)
  {
    v75 = 67109376;
    *(_DWORD *)v76 = v5;
    *(_WORD *)&v76[4] = 2048;
    *(double *)&v76[6] = v6;
    _os_log_impl(&dword_2230E5000, v8, OS_LOG_TYPE_DEFAULT, "Processing measurement with an adjusted value of %d dB has at time = %5.3f s", (uint8_t *)&v75, 0x12u);
  }
  v15 = *(_QWORD *)(a1 + 40);
  v13 = *(__int128 **)(a1 + 48);
  v14 = (void **)(a1 + 40);
  if ((__int128 *)v15 != v13)
  {
    while (v6 - *(double *)(v15 + 8) <= 0.5)
    {
      v15 += 24;
      if ((__int128 *)v15 == v13)
        goto LABEL_18;
    }
    if ((__int128 *)v15 != v13)
    {
      v16 = (__int128 *)(v15 + 24);
      if ((__int128 *)(v15 + 24) != v13)
      {
        do
        {
          if (v6 - *((double *)v16 + 1) <= 0.5)
          {
            v17 = *v16;
            *(_DWORD *)(v15 + 16) = *((_DWORD *)v16 + 4);
            *(_OWORD *)v15 = v17;
            v15 += 24;
          }
          v16 = (__int128 *)((char *)v16 + 24);
        }
        while (v16 != v13);
        v13 = *(__int128 **)(a1 + 48);
      }
    }
    if ((__int128 *)v15 != v13)
      *(_QWORD *)(a1 + 48) = v15;
  }
LABEL_18:
  v20 = *(_QWORD *)(a1 + 64);
  v18 = *(__int128 **)(a1 + 72);
  v19 = (void **)(a1 + 64);
  if ((__int128 *)v20 != v18)
  {
    while (v6 - *(double *)(v20 + 8) <= 0.5)
    {
      v20 += 24;
      if ((__int128 *)v20 == v18)
        goto LABEL_30;
    }
    if ((__int128 *)v20 != v18)
    {
      v21 = (__int128 *)(v20 + 24);
      if ((__int128 *)(v20 + 24) != v18)
      {
        do
        {
          if (v6 - *((double *)v21 + 1) <= 0.5)
          {
            v22 = *v21;
            *(_DWORD *)(v20 + 16) = *((_DWORD *)v21 + 4);
            *(_OWORD *)v20 = v22;
            v20 += 24;
          }
          v21 = (__int128 *)((char *)v21 + 24);
        }
        while (v21 != v18);
        v18 = *(__int128 **)(a1 + 72);
      }
    }
    if ((__int128 *)v20 != v18)
      *(_QWORD *)(a1 + 72) = v20;
  }
LABEL_30:
  v25 = *(_QWORD *)(a1 + 88);
  v23 = *(__int128 **)(a1 + 96);
  v24 = (void **)(a1 + 88);
  if ((__int128 *)v25 != v23)
  {
    while (v6 - *(double *)(v25 + 8) <= 0.5)
    {
      v25 += 24;
      if ((__int128 *)v25 == v23)
        goto LABEL_42;
    }
    if ((__int128 *)v25 != v23)
    {
      v26 = (__int128 *)(v25 + 24);
      if ((__int128 *)(v25 + 24) != v23)
      {
        do
        {
          if (v6 - *((double *)v26 + 1) <= 0.5)
          {
            v27 = *v26;
            *(_DWORD *)(v25 + 16) = *((_DWORD *)v26 + 4);
            *(_OWORD *)v25 = v27;
            v25 += 24;
          }
          v26 = (__int128 *)((char *)v26 + 24);
        }
        while (v26 != v23);
        v23 = *(__int128 **)(a1 + 96);
      }
    }
    if ((__int128 *)v25 != v23)
    {
      *(_QWORD *)(a1 + 96) = v25;
      goto LABEL_43;
    }
LABEL_42:
    v25 = (unint64_t)v23;
  }
LABEL_43:
  switch(v7)
  {
    case 2:
      if (v6 > *(double *)(a1 + 168))
      {
        *(_DWORD *)(a1 + 160) = v5;
        *(double *)(a1 + 168) = v6;
        *(_DWORD *)(a1 + 176) = 2;
      }
      v34 = *(_QWORD *)(a1 + 104);
      if (v25 >= v34)
      {
        v42 = *v24;
        v43 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v25 - (_QWORD)*v24) >> 3);
        v44 = v43 + 1;
        if (v43 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v34 - (_QWORD)v42) >> 3);
        if (2 * v45 > v44)
          v44 = 2 * v45;
        if (v45 >= 0x555555555555555)
          v46 = 0xAAAAAAAAAAAAAAALL;
        else
          v46 = v44;
        if (v46)
        {
          v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BTFinding::RSSIMeasurement>>(a1 + 104, v46);
          v42 = *(void **)(a1 + 88);
          v25 = *(_QWORD *)(a1 + 96);
        }
        else
        {
          v47 = 0;
        }
        v57 = (double *)&v47[24 * v43];
        v58 = &v47[24 * v46];
        *(_DWORD *)v57 = v5;
        v57[1] = v6;
        *((_DWORD *)v57 + 4) = 2;
        v35 = (char *)(v57 + 3);
        if ((void *)v25 != v42)
        {
          do
          {
            v59 = *(_OWORD *)(v25 - 24);
            *((_DWORD *)v57 - 2) = *(_DWORD *)(v25 - 8);
            *(_OWORD *)(v57 - 3) = v59;
            v57 -= 3;
            v25 -= 24;
          }
          while ((void *)v25 != v42);
          v42 = *v24;
        }
        *(_QWORD *)(a1 + 88) = v57;
        *(_QWORD *)(a1 + 96) = v35;
        *(_QWORD *)(a1 + 104) = v58;
        if (v42)
          operator delete(v42);
      }
      else
      {
        *(_DWORD *)v25 = v5;
        *(double *)(v25 + 8) = v6;
        *(_DWORD *)(v25 + 16) = 2;
        v35 = (char *)(v25 + 24);
      }
      *(_QWORD *)(a1 + 96) = v35;
      break;
    case 1:
      if (v6 > *(double *)(a1 + 144))
      {
        *(_DWORD *)(a1 + 136) = v5;
        *(double *)(a1 + 144) = v6;
        *(_DWORD *)(a1 + 152) = 1;
      }
      v31 = *(_QWORD *)(a1 + 80);
      v32 = *(int **)(a1 + 72);
      if ((unint64_t)v32 >= v31)
      {
        v36 = (int *)*v19;
        v37 = 0xAAAAAAAAAAAAAAABLL * (((char *)v32 - (_BYTE *)*v19) >> 3);
        v38 = v37 + 1;
        if (v37 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v39 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v31 - (_QWORD)v36) >> 3);
        if (2 * v39 > v38)
          v38 = 2 * v39;
        if (v39 >= 0x555555555555555)
          v40 = 0xAAAAAAAAAAAAAAALL;
        else
          v40 = v38;
        if (v40)
        {
          v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BTFinding::RSSIMeasurement>>(a1 + 80, v40);
          v36 = *(int **)(a1 + 64);
          v32 = *(int **)(a1 + 72);
        }
        else
        {
          v41 = 0;
        }
        v54 = (double *)&v41[24 * v37];
        v55 = &v41[24 * v40];
        *(_DWORD *)v54 = v5;
        v54[1] = v6;
        *((_DWORD *)v54 + 4) = 1;
        v33 = (char *)(v54 + 3);
        if (v32 != v36)
        {
          do
          {
            v56 = *(_OWORD *)(v32 - 6);
            *((_DWORD *)v54 - 2) = *(v32 - 2);
            *(_OWORD *)(v54 - 3) = v56;
            v54 -= 3;
            v32 -= 6;
          }
          while (v32 != v36);
          v36 = (int *)*v19;
        }
        *(_QWORD *)(a1 + 64) = v54;
        *(_QWORD *)(a1 + 72) = v33;
        *(_QWORD *)(a1 + 80) = v55;
        if (v36)
          operator delete(v36);
      }
      else
      {
        *v32 = v5;
        *((double *)v32 + 1) = v6;
        v32[4] = 1;
        v33 = (char *)(v32 + 6);
      }
      *(_QWORD *)(a1 + 72) = v33;
      break;
    case 0:
      if (v6 > *(double *)(a1 + 120))
      {
        *(_DWORD *)(a1 + 112) = v5;
        *(double *)(a1 + 120) = v6;
        *(_DWORD *)(a1 + 128) = 0;
      }
      v28 = *(_QWORD *)(a1 + 56);
      v29 = *(int **)(a1 + 48);
      if ((unint64_t)v29 >= v28)
      {
        v48 = (int *)*v14;
        v49 = 0xAAAAAAAAAAAAAAABLL * (((char *)v29 - (_BYTE *)*v14) >> 3);
        v50 = v49 + 1;
        if (v49 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v51 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - (_QWORD)v48) >> 3);
        if (2 * v51 > v50)
          v50 = 2 * v51;
        if (v51 >= 0x555555555555555)
          v52 = 0xAAAAAAAAAAAAAAALL;
        else
          v52 = v50;
        if (v52)
        {
          v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<BTFinding::RSSIMeasurement>>(a1 + 56, v52);
          v48 = *(int **)(a1 + 40);
          v29 = *(int **)(a1 + 48);
        }
        else
        {
          v53 = 0;
        }
        v60 = (double *)&v53[24 * v49];
        *(_DWORD *)v60 = v5;
        v61 = &v53[24 * v52];
        v60[1] = v6;
        *((_DWORD *)v60 + 4) = 0;
        v30 = (char *)(v60 + 3);
        if (v29 != v48)
        {
          do
          {
            v62 = *(_OWORD *)(v29 - 6);
            *((_DWORD *)v60 - 2) = *(v29 - 2);
            *(_OWORD *)(v60 - 3) = v62;
            v60 -= 3;
            v29 -= 6;
          }
          while (v29 != v48);
          v48 = (int *)*v14;
        }
        *(_QWORD *)(a1 + 40) = v60;
        *(_QWORD *)(a1 + 48) = v30;
        *(_QWORD *)(a1 + 56) = v61;
        if (v48)
          operator delete(v48);
      }
      else
      {
        *v29 = v5;
        *((double *)v29 + 1) = v6;
        v30 = (char *)(v29 + 6);
        v29[4] = 0;
      }
      *(_QWORD *)(a1 + 48) = v30;
      break;
  }
  if (!*(_BYTE *)(a1 + 8))
  {
    *(_BYTE *)(a1 + 8) = 1;
    *(double *)(a1 + 16) = v6;
    v63 = *(NSObject **)a1;
    if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v75) = 0;
      _os_log_impl(&dword_2230E5000, v63, OS_LOG_TYPE_DEFAULT, "RSSI filter is initialized", (uint8_t *)&v75, 2u);
    }
  }
  if (v6 - *(double *)(a1 + 16) < 0.5)
  {
    v64 = *(NSObject **)a1;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v75 = 134217984;
      *(double *)v76 = v6;
      v10 = "Not returning any solution yet at time = %5.3f s";
      v11 = v64;
      v12 = 12;
      goto LABEL_109;
    }
LABEL_110:
    v65 = 0;
    *(_BYTE *)a3 = 0;
    goto LABEL_111;
  }
  v66 = BTFinding::PRRSSIFilter::calculateAverageForChannel((os_log_t *)a1, (int **)(a1 + 40));
  v67 = BTFinding::PRRSSIFilter::calculateAverageForChannel((os_log_t *)a1, (int **)(a1 + 64));
  v68 = BTFinding::PRRSSIFilter::calculateAverageForChannel((os_log_t *)a1, (int **)(a1 + 88));
  v69 = *(NSObject **)a1;
  if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT))
  {
    v75 = 134218752;
    *(double *)v76 = v66;
    *(_WORD *)&v76[8] = 2048;
    *(double *)&v76[10] = v67;
    v77 = 2048;
    v78 = v68;
    v79 = 2048;
    v80 = v6;
    _os_log_impl(&dword_2230E5000, v69, OS_LOG_TYPE_DEFAULT, "Averages calculated for channel 37, 38, and 39 are: %4.1f, %4.1f, and %4.1f dB at time = %5.3f s", (uint8_t *)&v75, 0x2Au);
    v69 = *(NSObject **)a1;
  }
  if (v66 >= v67)
    v70 = v66;
  else
    v70 = v67;
  if (v70 >= v68)
    v71 = v70;
  else
    v71 = v68;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    v75 = 134218240;
    *(double *)v76 = v71;
    *(_WORD *)&v76[8] = 2048;
    *(double *)&v76[10] = v6;
    _os_log_impl(&dword_2230E5000, v69, OS_LOG_TYPE_DEFAULT, "Max among channel is %4.1f dB at time = %5.3f s", (uint8_t *)&v75, 0x16u);
  }
  v72 = 0.0;
  if (v71 > -100.0)
  {
    v72 = 1.0;
    if (v71 < -40.0)
      v72 = (v71 + 100.0) / 60.0;
  }
  v73 = *(NSObject **)a1;
  if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_DEFAULT))
  {
    v75 = 134218240;
    *(double *)v76 = v72;
    *(_WORD *)&v76[8] = 2048;
    *(double *)&v76[10] = v6;
    _os_log_impl(&dword_2230E5000, v73, OS_LOG_TYPE_DEFAULT, "Continuous proximity level %3.2f at time = %5.3f s", (uint8_t *)&v75, 0x16u);
  }
  BTFinding::PRRSSIFilter::updateProximityLevelWithHysteresis((BTFinding::PRRSSIFilter *)a1, v71);
  v74 = *(_DWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a1 + 88);
  *(double *)(a1 + 16) = v6;
  *(double *)a3 = v71;
  *(double *)(a3 + 8) = v6;
  *(_DWORD *)(a3 + 16) = v74;
  v65 = 1;
  *(double *)(a3 + 24) = v72;
LABEL_111:
  *(_BYTE *)(a3 + 32) = v65;
}

double BTFinding::PRRSSIFilter::calculateAverageForChannel(os_log_t *a1, int **a2)
{
  int *v2;
  int *v3;
  double v4;
  int *v5;
  int v6;
  NSObject *v8;
  __int16 v9[8];

  v2 = *a2;
  v3 = a2[1];
  if (*a2 != v3)
  {
    v4 = 0.0;
    v5 = *a2;
    do
    {
      v6 = *v5;
      v5 += 6;
      v4 = v4 + (double)v6;
    }
    while (v5 != v3);
    if (v2 != v3)
      return v4 / (double)(0xAAAAAAAAAAAAAAABLL * (((char *)v3 - (char *)v2) >> 3));
  }
  v8 = *a1;
  if (os_log_type_enabled(*a1, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 0;
    _os_log_impl(&dword_2230E5000, v8, OS_LOG_TYPE_DEFAULT, "No measurement found for channel", (uint8_t *)v9, 2u);
  }
  return -128.0;
}

double BTFinding::PRRSSIFilter::convertRSSIToContinuousProximityLevel(BTFinding::PRRSSIFilter *this, double a2)
{
  double v2;

  v2 = 0.0;
  if (a2 > -100.0)
  {
    v2 = 1.0;
    if (a2 < -40.0)
      return (a2 + 100.0) / 60.0;
  }
  return v2;
}

void BTFinding::PRRSSIFilter::updateProximityLevelWithHysteresis(BTFinding::PRRSSIFilter *this, double a2)
{
  int v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  if (a2 > -65.0)
    v2 = 1;
  else
    v2 = 2;
  if (a2 > -50.0)
    v2 = 0;
  v3 = *((int *)this + 8);
  if ((_DWORD)v3 == 2 || v2 - (_DWORD)v3 != 1)
  {
    *((_DWORD *)this + 8) = v2;
    return;
  }
  if (BTFinding::offsetThresholds[v3] <= a2)
  {
    v5 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEFAULT))
      return;
    v8 = 0;
    v6 = "Hysteresis: RSSI decrease is not small enough to switch to the lower level";
    v7 = (uint8_t *)&v8;
  }
  else
  {
    *((_DWORD *)this + 8) = v2;
    v5 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEFAULT))
      return;
    v9 = 0;
    v6 = "Hysteresis: RSSI decrease is enough to switch to the lower level";
    v7 = (uint8_t *)&v9;
  }
  _os_log_impl(&dword_2230E5000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<BTFinding::RSSIMeasurement>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void sub_22310C5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_22310CCF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_22310CF70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22310D07C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22310D198(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  objc_destroyWeak((id *)(v2 - 40));

  _Unwind_Resume(a1);
}

void sub_22310D9C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_22310DC94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22310DDE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22310DEF4(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  objc_destroyWeak((id *)(v2 - 40));

  _Unwind_Resume(a1);
}

void sub_22310E2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_22310E458(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  objc_destroyWeak((id *)(v2 - 40));

  _Unwind_Resume(a1);
}

void sub_22310E80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_22310ECB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, objc_super a14)
{

  a14.super_class = (Class)PRBTGroupLocalizer;
  -[_Unwind_Exception dealloc](&a14, sel_dealloc);
  _Unwind_Resume(a1);
}

uint64_t platformSupportsProximity()
{
  return objc_msgSend(MEMORY[0x24BE7B438], "isSupported");
}

double PRArmsReachThresholdEnter()
{
  return 0.9144;
}

double PRArmsReachThresholdExit()
{
  return 1.143;
}

double PRVerticalThresholdEnter()
{
  return 2.5;
}

double PRVerticalThresholdExit()
{
  return 2.75;
}

double PRItemFoundThresholdEnter()
{
  return 0.15;
}

double PRItemFoundThresholdExit()
{
  return 0.1875;
}

unint64_t calculateBearingAngleHorizontalDistanceAndVerticalDistance(void *a1, void *a2)
{
  float32x2_t v2;
  id v4;
  id v5;
  float v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x2_t v14;
  float v15;
  float32x4_t v16;
  float32x2_t v17;
  float32x4_t v18;
  int32x2_t v19;
  int32x2_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  float32x2_t v25;
  float v26;
  float32x4_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x4_t v30;
  float32x2_t v31;
  float32x2_t v32;
  int32x2_t v33;
  int32x2_t v34;
  float32x2_t v35;
  float v36;
  __float2 v37;
  float32x2_t v38;
  float32x2_t v39;
  double v41;
  double v42;
  double v43;
  float32x2_t v44;
  int32x2_t v45;
  float v46;
  float32x4_t v47;
  float32x2_t v48;
  float32x2_t v49;
  float32x4_t v50;
  float32x2_t v51;
  float32x4_t v52;
  __int32 v53;
  float32x4_t v54;

  v4 = a2;
  v5 = a1;
  objc_msgSend(v4, "pose");
  v46 = v6;
  objc_msgSend(v4, "pose");
  v47 = v7;
  objc_msgSend(v4, "pose");
  v50 = v8;
  objc_msgSend(v4, "pose");
  v54 = v9;

  objc_msgSend(v5, "vector");
  v52 = v10;

  v11 = vsubq_f32(v52, v54);
  v12 = vmulq_f32(v11, v11);
  v13 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2);
  v13.f32[0] = sqrtf(vaddq_f32(v13, v12).f32[0]);
  if (v13.f32[0] > 0.01)
  {
    v14.i32[0] = vextq_s8((int8x16_t)v11, (int8x16_t)v11, 8uLL).u32[0];
    v14.i32[1] = v11.i32[0];
    v53 = v13.i32[0];
    v44 = vdiv_f32(v14, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.f32, 0));
    v15 = acosf(-v50.f32[1]);
    *(float *)&v20.i32[1] = v46;
    v16 = v47;
    v2.i32[0] = v47.i32[1];
    v17.i32[0] = vextq_s8((int8x16_t)v16, (int8x16_t)v16, 8uLL).u32[0];
    v17.i32[1] = v47.i32[0];
    v18 = vmulq_f32(v16, v16);
    v19 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), v18).u64[0];
    *(float *)v20.i32 = sqrtf(*(float *)v19.i32);
    if (fabsf(v47.f32[1]) >= fabsf(v46))
    {
      v45 = v20;
      v48 = v17;
      v26 = asinf(*(float *)v20.i32);
      if (v26 >= 0.43633)
      {
        v21 = COERCE_DOUBLE(vdiv_f32(v48, (float32x2_t)vdup_lane_s32(v45, 0)));
        v41 = v15;
        v38 = v44;
        if (v15 <= 1.57079633)
        {
          *(float *)&v41 = -*((float *)&v21 + 1);
          v23 = COERCE_DOUBLE(vzip1_s32(*(int32x2_t *)&v41, *(int32x2_t *)&v21));
          v42 = COERCE_DOUBLE(vneg_f32(*(float32x2_t *)&v21));
          LODWORD(v43) = vdup_lane_s32(*(int32x2_t *)&v42, 1).u32[0];
          if (v15 > 0.7854)
          {
            *((float *)&v43 + 1) = -*(float *)&v42;
            v23 = v43;
            v21 = v42;
          }
        }
        else
        {
          LODWORD(v23) = vdup_lane_s32(*(int32x2_t *)&v21, 1).u32[0];
          *((float *)&v23 + 1) = -*(float *)&v21;
        }
        goto LABEL_12;
      }
      v27 = v50;
      v28.i32[0] = vextq_s8((int8x16_t)v27, (int8x16_t)v27, 8uLL).u32[0];
      v28.i32[1] = v50.i32[0];
      v25.i32[0] = 0;
      v29 = (float32x2_t)vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v2, v25), 0), (int8x8_t)vneg_f32(v28), (int8x8_t)v28);
      v30 = vmulq_f32(v27, v27);
      v30.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v30, 2), v30).u64[0];
      v30.f32[0] = sqrtf(v30.f32[0]);
      v21 = COERCE_DOUBLE(vdiv_f32(v29, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v30.f32, 0)));
      if (v26 > 0.2618)
      {
        v31 = (float32x2_t)vbsl_s8((int8x8_t)vcgtd_f64(1.57079633, v15), (int8x8_t)vneg_f32(v48), (int8x8_t)v48);
        v32 = vmul_f32(v31, v31);
        v32.f32[0] = sqrtf(vaddv_f32(v32));
        v33 = (int32x2_t)vdiv_f32(v31, (float32x2_t)vdup_lane_s32((int32x2_t)v32, 0));
        v31.f32[0] = -*(float *)&v33.i32[1];
        v34 = vzip1_s32((int32x2_t)v31, v33);
        v49 = (float32x2_t)v34;
        v51 = (float32x2_t)v33;
        v35 = vmla_lane_f32(vmul_n_f32((float32x2_t)__PAIR64__(v34.u32[0], v33.u32[0]), *(float *)&v21), (float32x2_t)__PAIR64__(v34.u32[1], v33.u32[1]), *(float32x2_t *)&v21, 1);
        v36 = atan2f(v35.f32[1], v35.f32[0]);
        v37 = __sincosf_stret((float)((float)(v26 + -0.43633) / -0.17453) * v36);
        v21 = COERCE_DOUBLE(vmla_n_f32(vmul_n_f32(v49, v37.__sinval), v51, v37.__cosval));
      }
      LODWORD(v23) = vdup_lane_s32(*(int32x2_t *)&v21, 1).u32[0];
      *((float *)&v23 + 1) = -*(float *)&v21;
    }
    else
    {
      v21 = COERCE_DOUBLE(vdiv_f32(v17, (float32x2_t)vdup_lane_s32(v20, 0)));
      LODWORD(v23) = HIDWORD(v21);
      *(float *)v19.i32 = -*((float *)&v21 + 1);
      v22 = COERCE_DOUBLE(vzip1_s32(v19, *(int32x2_t *)&v21));
      *((float *)&v23 + 1) = -*(float *)&v21;
      if (v15 <= 0.7854)
        v23 = v22;
    }
    v38 = v44;
LABEL_12:
    v39 = vmla_lane_f32(vmul_n_f32((float32x2_t)vzip1_s32(*(int32x2_t *)&v21, *(int32x2_t *)&v23), v38.f32[0]), (float32x2_t)vzip2_s32(*(int32x2_t *)&v21, *(int32x2_t *)&v23), v38, 1);
    v24 = COERCE_UNSIGNED_INT(atan2f(v39.f32[1], v39.f32[0]));
    v13.i32[0] = v53;
    return v24 | ((unint64_t)v13.u32[0] << 32);
  }
  v24 = 0;
  return v24 | ((unint64_t)v13.u32[0] << 32);
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
  v10 = vmulq_n_f32((float32x4_t)xmmword_223119350, v3.__sinval);
  v4 = __sincosf_stret(a2 * 0.5);
  v5 = vmulq_n_f32((float32x4_t)xmmword_223119360, v4.__sinval);
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

void sub_22310FAE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22310FB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_22310FD68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_22310FED8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_223110120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2231104C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2231108BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_223110974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223110A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_223110AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_223110B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_223110B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223110CB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_223110DEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_223110F24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22311105C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_223111194(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2231112CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_223111358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2231113C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_223111438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223111678(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_22311240C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_223112C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_223112EE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22311330C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2231134E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_223113638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2231136E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223113850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223113A1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_223113B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223113C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223113D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223113E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_223113FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223114040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2231140B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_223114110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_223114170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_2231142C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_22311459C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _Unwind_Resume(a1);
}

void sub_223114790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_223114850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2231148B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2231149A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_223114C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_223114D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

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

void cnmatrix::FastResize<double>()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2337, "in_nr >= 0");
}

{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2339, "in_nr <= max_nr");
}

{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2340, "in_nc >= 0");
}

{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2342, "in_nc <= max_nc");
}

void cnmatrix::CNMatrixBase<double>::WriteValue()
{
  __assert_rtn("WriteValue", "cnmatrixbase.h", 1104, "data_ != __null");
}

void cnmatrix::CNMatrixBase<double>::operator()()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 913, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 914, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 915, "idx < num_elements_");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 815, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 816, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 817, "idx < num_elements_");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 782, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 783, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 784, "idx < num_elements_");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 945, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 946, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 947, "idx < num_elements_");
}

void cnmatrix::Multiply<double>()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3887, "&(A) != &(C)");
}

{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3888, "&(B) != &(C)");
}

{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3885, "A.num_cols_ == B.num_rows_");
}

{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3818, "&(B) != &(C)");
}

void cnmatrix::Add<double>()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3536, "&(A) != &(C)");
}

{
  __assert_rtn("Add", "cnmatrixbase.h", 3537, "&(B) != &(C)");
}

{
  __assert_rtn("Add", "cnmatrixbase.h", 3534, "A.num_cols_ == B.num_cols_");
}

{
  __assert_rtn("Add", "cnmatrixbase.h", 3533, "A.num_rows_ == B.num_rows_");
}

void cnmatrix::CNMatrixBase<double>::operator=()
{
  __assert_rtn("operator=", "cnmatrixbase.h", 619, "this->max_num_rows_ >= A.num_rows_");
}

{
  __assert_rtn("operator=", "cnmatrixbase.h", 620, "this->max_num_cols_ >= A.num_cols_");
}

void cnmatrix::Subtract<double>()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3677, "&(A) != &(C)");
}

{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3678, "&(B) != &(C)");
}

{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3675, "A.num_cols_ == B.num_cols_");
}

{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3674, "A.num_rows_ == B.num_rows_");
}

void cnmatrix::Norm<double>()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4504, "&A != &Acopy");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4505, "&A != &Work");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4506, "&A != &S");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4507, "&Acopy != &Work");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4508, "&Acopy != &S");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4509, "&Work != &S");
}

{
  __assert_rtn("Norm", "cnmatrixbase.h", 4512, "Acopy.num_elements_ >= A.num_elements_");
}

{
  OUTLINED_FUNCTION_2();
  __assert_rtn("Norm", "cnmatrixbase.h", 4640, "false");
}

{
  OUTLINED_FUNCTION_2();
  __assert_rtn("Norm", "cnmatrixbase.h", 4716, "ret == 1");
}

void cnmatrix::SingularValues<double>()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7028, "&A != &Acopy");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7029, "&A != &Work");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7030, "&A != &S");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7031, "&Acopy != &Work");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7032, "&Acopy != &S");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7033, "&Work != &S");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7036, "ne >= 1");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7037, "ne >= 3*minnrnc + maxnrnc");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7038, "ne >= 5*minnrnc");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7040, "Acopy.max_num_rows_ >= nrA");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7041, "Acopy.max_num_cols_ >= ncA");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7042, "S.max_num_rows_ >= minnrnc");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7043, "S.max_num_cols_ >= 1");
}

{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7111, "info == 0");
}

void PRCommonConvertTicksToSeconds()
{
  __assert_rtn("PRCommonConvertTicksToSeconds", "PRCommon.mm", 43, "timebaseResult == KERN_SUCCESS");
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::getCurrentRotatedSolution(int a1, char *a2)
{
  __assert_rtn("SetMatrixSize", "cnmatrixbase.h", a1, a2);
}

void RoseSyntheticApertureFiltering::PRRoseSyntheticApertureBatchFilter::addMeasurement(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a3;
  _os_log_error_impl(&dword_2230E5000, a2, OS_LOG_TYPE_ERROR, "Invalid measurement rejected by the batch filter filter, range passed: %f m, range uncertainty passed: %f m", (uint8_t *)&v4, 0x16u);
}

void cnmatrix::Transpose<double>()
{
  __assert_rtn("Transpose", "cnmatrixbase.h", 5010, "&(A) != &(B)");
}

void cnmatrix::CNMatrixBase<double>::operator()<int,int>()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 749, "data_ != __null");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 750, "idx >= 0");
}

{
  __assert_rtn("operator()", "cnmatrixbase.h", 751, "idx < num_elements_");
}

void cnmatrix::Inv<double>()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6077, "&A != &Work");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6078, "&A != &B");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6081, "&Work != &B");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6086, "Ipiv.max_num_rows_ * Ipiv.max_num_cols_ >= A.num_rows_");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6088, "Work.max_num_rows_ * Work.max_num_cols_ >= 4 * A.num_rows_");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6090, "B.max_num_rows_ >= A.num_rows_");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6091, "B.max_num_cols_ >= A.num_cols_");
}

{
  OUTLINED_FUNCTION_2();
  __assert_rtn("Inv", "cnmatrixbase.h", 6127, "info >= 0");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6159, "info >= 0");
}

{
  __assert_rtn("Inv", "cnmatrixbase.h", 6084, "A.num_rows_ == A.num_cols_");
}

_QWORD *std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<RoseSyntheticApertureFiltering::InternalFilterState>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>,std::reverse_iterator<RoseSyntheticApertureFiltering::InternalFilterState*>>(_QWORD *result, _QWORD *a2)
{
  do
  {
    result[46] = off_24EC111F8;
    result[30] = off_24EC111F8;
    result[16] = off_24EC111F8;
    result[8] = off_24EC111F8;
    *result = off_24EC111F8;
    result += 54;
  }
  while (result != a2);
  return result;
}

void cnmatrix::Eig<double>()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5690, "&A != &Acopy");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5691, "&A != &Dr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5692, "&A != &Di");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5693, "&A != &Vr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5694, "&A != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5695, "&A != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5696, "&A != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5697, "&A != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5698, "&Acopy != &Dr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5699, "&Acopy != &Di");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5700, "&Acopy != &Vr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5701, "&Acopy != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5702, "&Acopy != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5703, "&Acopy != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5704, "&Acopy != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5705, "&Dr != &Di");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5706, "&Dr != &Vr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5707, "&Dr != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5708, "&Dr != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5709, "&Dr != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5710, "&Dr != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5711, "&Di != &Vr");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5712, "&Di != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5713, "&Di != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5714, "&Di != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5715, "&Di != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5716, "&Vr != &Vi");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5717, "&Vr != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5718, "&Vr != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5719, "&Vr != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5720, "&Vi != &Swork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5721, "&Vi != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5722, "&Vi != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5723, "&Swork != &Rwork");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5724, "&Swork != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5725, "&Rwork != &Work");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5730, "Swork.max_num_rows_ * Swork.max_num_cols_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5731, "Rwork.max_num_rows_ * Rwork.max_num_cols_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5732, "ne >= 3*nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5734, "Acopy.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5735, "Acopy.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5736, "Dr.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5737, "Dr.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5738, "Di.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5739, "Di.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5740, "Vr.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5741, "Vr.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5742, "Vi.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5743, "Vi.max_num_cols_ >= ncA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5744, "Swork.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5745, "Rwork.max_num_rows_ >= nrA");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5834, "info == 0");
}

{
  __assert_rtn("Eig", "cnmatrixbase.h", 5728, "nrA == ncA");
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t PRSetRoseGlobalConfigParams()
{
  return MEMORY[0x24BE7B450]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t cnprint::CNPrinter::GetLogLevel(cnprint::CNPrinter *this)
{
  return MEMORY[0x24BE1E650](this);
}

uint64_t cnprint::CNPrinter::Print()
{
  return MEMORY[0x24BE1E658]();
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

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24EC10E18();
}

void operator delete(void *__p)
{
  off_24EC10E20(__p);
}

uint64_t operator delete()
{
  return off_24EC10E28();
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_24EC10E30(__sz, a2);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EC10E38(__sz);
}

uint64_t operator new()
{
  return off_24EC10E40();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
  MEMORY[0x24BDB2AC8](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__TransB, *(_QWORD *)&__M, *(_QWORD *)&__N, *(_QWORD *)&__K, __A, *(_QWORD *)&__lda, __alpha, __beta);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

int dgeevx_(char *__balanc, char *__jobvl, char *__jobvr, char *__sense, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__wr, __CLPK_doublereal *__wi, __CLPK_doublereal *__vl, __CLPK_integer *__ldvl, __CLPK_doublereal *__vr, __CLPK_integer *__ldvr, __CLPK_integer *__ilo, __CLPK_integer *__ihi, __CLPK_doublereal *__scale, __CLPK_doublereal *__abnrm, __CLPK_doublereal *__rconde, __CLPK_doublereal *__rcondv, __CLPK_doublereal *__work,__CLPK_integer *__lwork,__CLPK_integer *__iwork,__CLPK_integer *__info)
{
  return MEMORY[0x24BDB2CC0](__balanc, __jobvl, __jobvr, __sense, __n, __a, __lda, __wr);
}

int dgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2D28](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2D38](__m, __n, __a, __lda, __ipiv, __info);
}

int dgetri_(__CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2D48](__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double erf(long double __x)
{
  long double result;

  MEMORY[0x24BDAE1A8](__x);
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

