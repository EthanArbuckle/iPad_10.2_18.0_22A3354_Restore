void sub_2479792B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

int *OUTLINED_FUNCTION_4()
{
  return __error();
}

char *OUTLINED_FUNCTION_5(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_6()
{
  return __error();
}

void sub_24797B9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t CLSHInfer::CLSHInfer(uint64_t result, int *a2)
{
  unsigned __int16 *v2;
  uint64_t v3;
  unsigned __int16 *v4;
  uint64_t v5;
  unsigned __int16 *v6;
  unsigned int v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 *v20;
  unsigned int v21;
  int *v22;
  int *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  int v26;
  unsigned __int16 *v27;
  int *v28;
  unsigned __int16 *v29;
  uint64_t v30;
  int v31;
  unsigned __int16 *v32;
  unsigned int v33;
  unsigned __int16 *v34;
  uint64_t v35;
  int *v36;
  unsigned __int16 *v37;
  uint64_t v38;
  int v39;
  unsigned __int16 *v40;
  int *v41;
  unsigned __int16 *v42;
  uint64_t v43;
  uint64_t v44;
  int *v45;
  uint64_t v46;
  char *v47;
  unsigned __int16 *v48;
  float v49;
  uint64_t v50;
  int *v51;
  unsigned __int16 *v52;
  float v53;
  uint64_t v54;
  int *v55;
  unsigned __int16 *v56;
  float v57;
  uint64_t v58;
  int *v59;
  unsigned __int16 *v60;
  int v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  unsigned __int16 *v66;
  int *v67;
  unsigned __int16 *v68;
  uint64_t v69;
  int v70;
  unsigned __int16 *v71;
  int *v72;
  unsigned __int16 *v73;
  uint64_t v74;
  char *v75;
  unsigned __int16 *v76;
  unsigned int v77;
  char *v78;
  char *v79;

  *(_QWORD *)(result + 152) = 0;
  *(_QWORD *)(result + 144) = a2;
  *(_QWORD *)(result + 160) = 0;
  *(_DWORD *)(result + 168) = 16;
  v2 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v2 < 9u)
  {
    LODWORD(v3) = 0;
  }
  else
  {
    v3 = v2[4];
    if (v3)
      LODWORD(v3) = *(int *)((char *)a2 + v3);
  }
  *(_DWORD *)(result + 8) = v3;
  v4 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v4 < 7u)
  {
    LODWORD(v5) = 0;
  }
  else
  {
    v5 = v4[3];
    if (v5)
      LODWORD(v5) = *(int *)((char *)a2 + v5);
  }
  *(_DWORD *)(result + 12) = v5;
  v6 = (unsigned __int16 *)((char *)a2 - *a2);
  v7 = *v6;
  v8 = (unsigned int *)((char *)a2 + v6[2] + *(unsigned int *)((char *)a2 + v6[2]));
  *(_QWORD *)(result + 48) = *v8;
  *(_QWORD *)(result + 136) = v8 + 1;
  if (v7 < 0x19)
  {
    *(_QWORD *)(result + 120) = 4;
    *(_QWORD *)(result + 128) = 4;
    if (v7 < 0xB)
    {
      *(_QWORD *)(result + 56) = 0;
LABEL_39:
      *(_QWORD *)(result + 64) = 0;
LABEL_40:
      *(_QWORD *)(result + 72) = 0;
LABEL_41:
      *(_QWORD *)(result + 80) = 0;
LABEL_42:
      *(_QWORD *)(result + 88) = 0;
LABEL_43:
      v17 = 0;
      *(_QWORD *)(result + 96) = 0;
      goto LABEL_44;
    }
  }
  else
  {
    v9 = v6[12];
    if (v6[12])
      v9 += (uint64_t)a2 + *(unsigned int *)((char *)a2 + v9);
    *(_QWORD *)(result + 120) = v9 + 4;
    if (v7 < 0x1B)
    {
      v10 = 0;
    }
    else
    {
      v10 = v6[13];
      if (v6[13])
        v10 += (uint64_t)a2 + *(unsigned int *)((char *)a2 + v10);
    }
    *(_QWORD *)(result + 128) = v10 + 4;
  }
  v11 = v6[5];
  if (v6[5])
    v11 = *(_QWORD *)((char *)a2 + v11);
  *(_QWORD *)(result + 56) = v11;
  if (v7 < 0xD)
    goto LABEL_39;
  v12 = v6[6];
  if (v6[6])
    v12 = *(_QWORD *)((char *)a2 + v12);
  *(_QWORD *)(result + 64) = v12;
  if (v7 < 0xF)
    goto LABEL_40;
  v13 = v6[7];
  if (v6[7])
    v13 = *(_QWORD *)((char *)a2 + v13);
  *(_QWORD *)(result + 72) = v13;
  if (v7 < 0x11)
    goto LABEL_41;
  v14 = v6[8];
  if (v6[8])
    v14 = *(_QWORD *)((char *)a2 + v14);
  *(_QWORD *)(result + 80) = v14;
  if (v7 < 0x13)
    goto LABEL_42;
  v15 = v6[9];
  if (v6[9])
    v15 = *(_QWORD *)((char *)a2 + v15);
  *(_QWORD *)(result + 88) = v15;
  if (v7 < 0x15)
    goto LABEL_43;
  v16 = v6[10];
  if (v6[10])
    v16 = *(_QWORD *)((char *)a2 + v16);
  *(_QWORD *)(result + 96) = v16;
  if (v7 < 0x17)
  {
    v17 = 0;
  }
  else
  {
    v17 = v6[11];
    if (v17)
      v17 = *(_QWORD *)((char *)a2 + v17);
  }
LABEL_44:
  *(_QWORD *)(result + 104) = v17;
  *(_QWORD *)result = 0x800000003;
  *(_BYTE *)(result + 16) = 0;
  *(_QWORD *)(result + 20) = 0x4E2000000002;
  *(_OWORD *)(result + 28) = xmmword_2479886B0;
  v18 = *a2;
  v19 = -v18;
  v20 = (unsigned __int16 *)((char *)a2 - v18);
  v21 = *v20;
  if (v21 < 0x23)
  {
    LODWORD(v22) = 0;
  }
  else
  {
    v22 = (int *)v20[17];
    if (!v22)
      goto LABEL_112;
    v23 = (int *)((char *)v22 + (_QWORD)a2 + *(unsigned int *)((char *)v22 + (_QWORD)a2));
    v24 = (unsigned __int16 *)((char *)v23 - *v23);
    if (*v24 >= 5u && (v25 = v24[2]) != 0)
      v26 = *(int *)((char *)v23 + v25);
    else
      v26 = 3;
    *(_DWORD *)result = v26;
    v27 = (unsigned __int16 *)((char *)a2 - *a2);
    if (*v27 < 0x23u)
    {
      v28 = 0;
    }
    else
    {
      v28 = (int *)v27[17];
      if (v28)
        v28 = (int *)((char *)v28 + (_QWORD)a2 + *(unsigned int *)((char *)v28 + (_QWORD)a2));
    }
    v29 = (unsigned __int16 *)((char *)v28 - *v28);
    if (*v29 >= 7u && (v30 = v29[3]) != 0)
      v31 = *(int *)((char *)v28 + v30);
    else
      v31 = 8;
    *(_DWORD *)(result + 4) = v31;
    v32 = (unsigned __int16 *)((char *)a2 - *a2);
    v33 = *v32;
    if (v33 < 0x23)
    {
      v22 = 0;
    }
    else
    {
      v22 = (int *)v32[17];
      if (v32[17])
        v22 = (int *)((char *)v22 + (_QWORD)a2 + *(unsigned int *)((char *)v22 + (_QWORD)a2));
    }
    v34 = (unsigned __int16 *)((char *)v22 - *v22);
    LODWORD(v22) = *v34 >= 0x17u && (v35 = v34[11]) != 0 && *((unsigned __int8 *)v22 + v35) != 0;
    *(_BYTE *)(result + 16) = (_BYTE)v22;
    if (v33 < 0x23)
    {
      v36 = 0;
    }
    else
    {
      v36 = (int *)v32[17];
      if (v36)
        v36 = (int *)((char *)v36 + (_QWORD)a2 + *(unsigned int *)((char *)v36 + (_QWORD)a2));
    }
    v37 = (unsigned __int16 *)((char *)v36 - *v36);
    if (*v37 >= 9u && (v38 = v37[4]) != 0)
      v39 = *(int *)((char *)v36 + v38);
    else
      v39 = 2;
    *(_DWORD *)(result + 20) = v39;
    v40 = (unsigned __int16 *)((char *)a2 - *a2);
    if (*v40 < 0x23u)
    {
      v41 = 0;
    }
    else
    {
      v41 = (int *)v40[17];
      if (v41)
        v41 = (int *)((char *)v41 + (_QWORD)a2 + *(unsigned int *)((char *)v41 + (_QWORD)a2));
    }
    v42 = (unsigned __int16 *)((char *)v41 - *v41);
    if (*v42 >= 0xBu && (v43 = v42[5]) != 0)
      v44 = *(_QWORD *)((char *)v41 + v43);
    else
      LODWORD(v44) = 20000;
    v45 = 0;
    *(_DWORD *)(result + 24) = v44;
    v46 = *a2;
    v47 = (char *)a2 - v46;
    v21 = *(unsigned __int16 *)((char *)a2 - v46);
    if (v21 >= 0x23)
    {
      v45 = (int *)*((unsigned __int16 *)v47 + 17);
      if (*((_WORD *)v47 + 17))
        v45 = (int *)((char *)v45 + (_QWORD)a2 + *(unsigned int *)((char *)v45 + (_QWORD)a2));
    }
    v48 = (unsigned __int16 *)((char *)v45 - *v45);
    v49 = 10.0;
    if (*v48 >= 0xDu)
    {
      v50 = v48[6];
      if (v50)
        v49 = *(float *)((char *)v45 + v50);
    }
    *(float *)(result + 28) = v49;
    if (v21 < 0x23)
    {
      v51 = 0;
    }
    else
    {
      v51 = (int *)*((unsigned __int16 *)v47 + 17);
      if (*((_WORD *)v47 + 17))
        v51 = (int *)((char *)v51 + (_QWORD)a2 + *(unsigned int *)((char *)v51 + (_QWORD)a2));
    }
    v52 = (unsigned __int16 *)((char *)v51 - *v51);
    v53 = 10.0;
    if (*v52 >= 0xFu)
    {
      v54 = v52[7];
      if (v54)
        v53 = *(float *)((char *)v51 + v54);
    }
    *(float *)(result + 32) = v53;
    if (v21 < 0x23)
    {
      v55 = 0;
    }
    else
    {
      v55 = (int *)*((unsigned __int16 *)v47 + 17);
      if (*((_WORD *)v47 + 17))
        v55 = (int *)((char *)v55 + (_QWORD)a2 + *(unsigned int *)((char *)v55 + (_QWORD)a2));
    }
    v56 = (unsigned __int16 *)((char *)v55 - *v55);
    v57 = 1.0;
    if (*v56 >= 0x13u)
    {
      v58 = v56[9];
      if (v58)
        v57 = *(float *)((char *)v55 + v58);
    }
    *(float *)(result + 36) = v57;
    if (v21 < 0x23)
    {
      v59 = 0;
    }
    else
    {
      v59 = (int *)*((unsigned __int16 *)v47 + 17);
      if (v59)
        v59 = (int *)((char *)v59 + (_QWORD)a2 + *(unsigned int *)((char *)v59 + (_QWORD)a2));
    }
    v19 = -v46;
    v60 = (unsigned __int16 *)((char *)v59 - *v59);
    v61 = 0;
    if (*v60 >= 0x15u)
    {
      v62 = v60[10];
      if (v62)
        v61 = *(int *)((char *)v59 + v62);
    }
    *(_DWORD *)(result + 40) = v61;
  }
  if (v21 < 0x1D)
  {
    v63 = 0;
    goto LABEL_131;
  }
LABEL_112:
  v63 = (char *)*(unsigned __int16 *)((char *)a2 + v19 + 28);
  if (*(_WORD *)((char *)a2 + v19 + 28))
  {
    v64 = &v63[(_QWORD)a2 + *(unsigned int *)&v63[(_QWORD)a2]];
    v65 = &v64[*(unsigned __int16 *)&v64[-*(int *)v64 + 8]];
    *(_DWORD *)result = *(_DWORD *)&v65[*(unsigned int *)v65];
    v66 = (unsigned __int16 *)((char *)a2 - *a2);
    if (*v66 < 0x1Du)
    {
      v67 = 0;
    }
    else
    {
      v67 = (int *)v66[14];
      if (v67)
        v67 = (int *)((char *)v67 + (_QWORD)a2 + *(unsigned int *)((char *)v67 + (_QWORD)a2));
    }
    v68 = (unsigned __int16 *)((char *)v67 - *v67);
    if (*v68 >= 5u && (v69 = v68[2]) != 0)
      v70 = *(int *)((char *)v67 + v69);
    else
      v70 = 0;
    *(_DWORD *)(result + 4) = v70;
    v71 = (unsigned __int16 *)((char *)a2 - *a2);
    if (*v71 < 0x1Du)
    {
      v72 = 0;
    }
    else
    {
      v72 = (int *)v71[14];
      if (v72)
        v72 = (int *)((char *)v72 + (_QWORD)a2 + *(unsigned int *)((char *)v72 + (_QWORD)a2));
    }
    v73 = (unsigned __int16 *)((char *)v72 - *v72);
    if (*v73 >= 7u && (v74 = v73[3]) != 0)
      v75 = (char *)v72 + v74 + *(unsigned int *)((char *)v72 + v74);
    else
      v75 = 0;
    v63 = v75 + 4;
  }
LABEL_131:
  *(_QWORD *)(result + 112) = v63;
  if ((_DWORD)v22)
    LODWORD(v5) = v5 + 2;
  *(_DWORD *)(result + 8) = v5;
  v76 = (unsigned __int16 *)((char *)a2 - *a2);
  v77 = *v76;
  if (v77 >= 0x27)
  {
    if (v76[19])
    {
      v78 = (char *)a2 + v76[19] + *(unsigned int *)((char *)a2 + v76[19]);
      *(_QWORD *)(result + 152) = &v78[*((unsigned int *)v78 + 1) + 4];
    }
    if (v77 >= 0x29)
    {
      if (v76[20])
      {
        v79 = (char *)a2 + v76[20] + *(unsigned int *)((char *)a2 + v76[20]);
        *(_QWORD *)(result + 160) = &v79[*((unsigned int *)v79 + 1) + 4];
      }
    }
  }
  return result;
}

void CLSHInfer::search_lsh_flatbuffer(int *a1@<X0>, const float *a2@<X1>, std::vector<int> *a3@<X8>)
{
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  float *__Y;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t i;
  float v17;
  char *v18;
  int *v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  int v28;
  int8x8_t v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  int *v35;
  unsigned __int16 *v36;
  uint64_t v37;
  int *v38;
  unsigned __int16 *v39;
  uint64_t v40;
  unsigned int *v41;
  int *v42;
  unsigned int *v43;
  uint64_t v44;
  unint64_t k;
  unsigned __int16 *v46;
  unsigned int *v47;
  float v48;
  uint64_t v49;
  char *v50;
  int *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  int *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  int v61;
  unint64_t v62;
  uint64_t v63;
  std::vector<int> *v64;
  int *v65;
  char *v66;
  unint64_t v67;
  int *v68;
  unsigned __int16 *v69;
  uint64_t v70;
  int *v71;
  unsigned __int16 *v72;
  uint64_t v73;
  _DWORD *v74;
  char *v75;
  uint64_t v76;
  int *v77;
  unsigned __int16 *v78;
  unsigned int v79;
  _DWORD *v80;
  uint64_t v81;
  _DWORD *v82;
  uint64_t v83;
  int *v84;
  unsigned int *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  _DWORD *v90;
  _DWORD *v91;
  int *v92;
  unsigned __int16 *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  _DWORD *v97;
  _DWORD *v98;
  int *v99;
  unsigned int *v100;
  uint64_t v101;
  int *v102;
  unsigned __int16 *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  _DWORD *v107;
  int *v108;
  unsigned __int16 *v109;
  uint64_t v110;
  char *v111;
  _DWORD *v112;
  uint64_t v113;
  int *v114;
  uint64_t v115;
  std::vector<int> *v116;
  float *v117;
  unint64_t *v118;
  _BYTE v119[12];
  char *v120;
  char *v121;
  unint64_t v122;
  _BYTE v123[12];
  uint64_t v124;

  v124 = *MEMORY[0x24BDAC8D0];
  v6 = MEMORY[0x24BDAC7A8]();
  __Y = (float *)((char *)&v115 - v9);
  a3->__begin_ = 0;
  a3->__end_ = 0;
  a3->__end_cap_.__value_ = 0;
  if (*(_QWORD *)(v6 + 144))
  {
    bzero((char *)&v115 - v9, 4 * v8);
    v120 = 0;
    v121 = 0;
    v122 = 0;
    std::vector<int>::reserve(a3, a1[6]);
    v11 = *a1;
    v12 = a1[1];
    v116 = a3;
    if ((int)v12 >= 17 && v11 == 1)
    {
      v13 = 0;
      v14 = a1;
      v15 = *((_QWORD *)a1 + 14);
      v118 = &v122;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          v17 = -cblas_sdot(v14[2], a2, 1, (const float *)(v15 + 4 * v14[2] * (int)i), 1);
          v18 = v121;
          if ((unint64_t)v121 >= v122)
          {
            v20 = v120;
            v21 = 0xAAAAAAAAAAAAAAABLL * ((v121 - v120) >> 2);
            v22 = v21 + 1;
            if (v21 + 1 > 0x1555555555555555)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((uint64_t)(v122 - (_QWORD)v120) >> 2) > v22)
              v22 = 0x5555555555555556 * ((uint64_t)(v122 - (_QWORD)v120) >> 2);
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v122 - (_QWORD)v120) >> 2) >= 0xAAAAAAAAAAAAAAALL)
              v23 = 0x1555555555555555;
            else
              v23 = v22;
            if (v23)
            {
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::pair<int,int>>>>((uint64_t)v118, v23);
              v20 = v120;
              v18 = v121;
            }
            else
            {
              v24 = 0;
            }
            v25 = &v24[12 * v21];
            *(float *)v25 = v17;
            *((_DWORD *)v25 + 1) = i;
            *((_DWORD *)v25 + 2) = v13;
            v26 = v25;
            if (v18 != v20)
            {
              do
              {
                v27 = *(_QWORD *)(v18 - 12);
                v18 -= 12;
                v28 = *((_DWORD *)v18 + 2);
                *(_QWORD *)(v26 - 12) = v27;
                v26 -= 12;
                *((_DWORD *)v26 + 2) = v28;
              }
              while (v18 != v20);
              v20 = v120;
            }
            v19 = (int *)(v25 + 12);
            v120 = v26;
            v121 = v25 + 12;
            v122 = (unint64_t)&v24[12 * v23];
            if (v20)
              operator delete(v20);
          }
          else
          {
            *(float *)v121 = v17;
            v19 = (int *)(v18 + 12);
            *((_DWORD *)v18 + 1) = i;
            *((_DWORD *)v18 + 2) = v13;
          }
          v121 = (char *)v19;
        }
        ++v13;
      }
      while (v13 < *v14);
    }
    else
    {
      cblas_sgemv(CblasRowMajor, CblasNoTrans, v11 * v12, a1[2], *((const float *)a1 + 9), *((const float **)a1 + 14), a1[2], a2, 1, *((const float *)a1 + 10), __Y, 1);
      v14 = a1;
      v30 = *a1;
      if (*a1 >= 1)
      {
        v31 = 0;
        v32 = 0;
        v117 = __Y;
        v118 = &v122;
        do
        {
          v33 = v14[1];
          if ((int)v33 >= 1)
          {
            for (j = 0; j != v33; ++j)
            {
              if (__Y[(int)v33 * (int)v31 + j] >= 0.0)
                v32 |= 1 << j;
              else
                v32 &= ~(1 << j);
            }
          }
          v35 = (int *)*((_QWORD *)v14 + 18);
          v36 = (unsigned __int16 *)((char *)v35 - *v35);
          if (*v36 >= 0x1Du && (v37 = v36[14]) != 0)
            v38 = (int *)((char *)v35 + v37 + *(unsigned int *)((char *)v35 + v37));
          else
            v38 = 0;
          v39 = (unsigned __int16 *)((char *)v38 - *v38);
          if (*v39 >= 9u && (v40 = v39[4]) != 0)
            v41 = (unsigned int *)((char *)v38 + v40 + *(unsigned int *)((char *)v38 + v40));
          else
            v41 = 0;
          if (v31 >= *v41)
            __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
          v42 = (int *)((char *)&v41[v31 + 1] + v41[v31 + 1]);
          v43 = (unsigned int *)((char *)v42 + *(unsigned __int16 *)((char *)v42 - *v42 + 6));
          v44 = *(unsigned int *)((char *)v43 + *v43);
          if ((int)v44 >= 1)
          {
            for (k = 0; k != v44; ++k)
            {
              v46 = (unsigned __int16 *)((char *)v42 - *v42);
              if (*v46 < 5u)
              {
                v47 = 0;
              }
              else
              {
                v47 = (unsigned int *)v46[2];
                if (v47)
                  v47 = (unsigned int *)((char *)v47 + (_QWORD)v42 + *(unsigned int *)((char *)v47 + (_QWORD)v42));
              }
              if (k >= *v47)
                __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
              v29.i32[0] = v47[k + 1] ^ v32;
              v29 = vcnt_s8(v29);
              v29.i16[0] = vaddlv_u8((uint8x8_t)v29);
              *(_DWORD *)v123 = v29.i32[0];
              *(_QWORD *)&v123[4] = (v31 << 32) | k;
              *(_QWORD *)v119 = *(_QWORD *)v123;
              *(_DWORD *)&v119[8] = v31;
              v48 = (float)v29.i32[0];
              v49 = *(_QWORD *)&v119[4];
              v50 = v121;
              if ((unint64_t)v121 >= v122)
              {
                v52 = 0xAAAAAAAAAAAAAAABLL * ((v121 - v120) >> 2);
                v53 = v52 + 1;
                if (v52 + 1 > 0x1555555555555555)
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                if (0x5555555555555556 * ((uint64_t)(v122 - (_QWORD)v120) >> 2) > v53)
                  v53 = 0x5555555555555556 * ((uint64_t)(v122 - (_QWORD)v120) >> 2);
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v122 - (_QWORD)v120) >> 2) >= 0xAAAAAAAAAAAAAAALL)
                  v54 = 0x1555555555555555;
                else
                  v54 = v53;
                if (v54)
                  v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::pair<int,int>>>>((uint64_t)v118, v54);
                else
                  v55 = 0;
                v56 = &v55[12 * v52];
                *(float *)v56 = v48;
                *(_QWORD *)(v56 + 4) = v49;
                v58 = v120;
                v57 = (int *)v121;
                v59 = v56;
                if (v121 != v120)
                {
                  do
                  {
                    v60 = *(_QWORD *)(v57 - 3);
                    v57 -= 3;
                    v61 = v57[2];
                    *(_QWORD *)(v59 - 12) = v60;
                    v59 -= 12;
                    *((_DWORD *)v59 + 2) = v61;
                  }
                  while (v57 != (int *)v58);
                  v57 = (int *)v120;
                }
                v51 = (int *)(v56 + 12);
                v120 = v59;
                v121 = v56 + 12;
                v122 = (unint64_t)&v55[12 * v54];
                if (v57)
                  operator delete(v57);
              }
              else
              {
                *(float *)v121 = v48;
                *(_QWORD *)(v50 + 4) = v49;
                v51 = (int *)(v50 + 12);
              }
              v121 = (char *)v51;
            }
            v30 = *v14;
            __Y = v117;
          }
          ++v31;
        }
        while ((uint64_t)v31 < v30);
      }
    }
    v62 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v121 - v120) >> 2));
    if (v121 == v120)
      v63 = 0;
    else
      v63 = v62;
    v64 = v116;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,false>((int *)v120, (int *)v121, (uint64_t)v123, v63, 1);
    v65 = v14;
    v66 = v120;
    if (v121 != v120)
    {
      v67 = 0;
      while (1)
      {
        v68 = (int *)*((_QWORD *)v65 + 18);
        v69 = (unsigned __int16 *)((char *)v68 - *v68);
        if (*v69 >= 0x1Du && (v70 = v69[14]) != 0)
          v71 = (int *)((char *)v68 + v70 + *(unsigned int *)((char *)v68 + v70));
        else
          v71 = 0;
        v72 = (unsigned __int16 *)((char *)v71 - *v71);
        if (*v72 >= 9u && (v73 = v72[4]) != 0)
          v74 = (int *)((char *)v71 + v73 + *(unsigned int *)((char *)v71 + v73));
        else
          v74 = 0;
        v75 = &v66[12 * v67];
        v76 = *((unsigned int *)v75 + 2);
        if (*v74 <= v76)
          __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
        v77 = (_DWORD *)((char *)&v74[v76 + 1] + v74[v76 + 1]);
        v78 = (unsigned __int16 *)((char *)v77 - *v77);
        v79 = *v78;
        if (v79 < 7)
        {
          v80 = 0;
        }
        else
        {
          v80 = (_DWORD *)v78[3];
          if (v78[3])
            v80 = (_DWORD *)((char *)v80 + (_QWORD)v77 + *(unsigned int *)((char *)v80 + (_QWORD)v77));
        }
        v81 = *((unsigned int *)v75 + 1);
        if (*v80 <= v81)
          break;
        v82 = &v80[v81];
        v83 = v81;
        v84 = (_DWORD *)((char *)v82 + v82[1] + 4);
        v85 = (unsigned int *)((char *)v84 + *(unsigned __int16 *)((char *)v84 - *v84 + 4));
        v86 = *(int *)((char *)v85 + *v85);
        v87 = (char *)v64->__end_ - (char *)v64->__begin_;
        v88 = v86 + (v87 >> 2);
        v89 = v65[6];
        if (v88 >= v89)
        {
          if (v79 < 7)
          {
            v91 = 0;
          }
          else
          {
            v91 = (_DWORD *)v78[3];
            if (v78[3])
              v91 = (_DWORD *)((char *)v91 + (_QWORD)v77 + *(unsigned int *)((char *)v91 + (_QWORD)v77));
          }
          if (*v91 <= v81)
            __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
          v102 = (_DWORD *)((char *)&v91[v83 + 1] + v91[v83 + 1]);
          v103 = (unsigned __int16 *)((char *)v102 - *v102);
          if (*v103 >= 5u && (v104 = v103[2]) != 0)
            v105 = (char *)v102 + v104 + *(unsigned int *)((char *)v102 + v104);
          else
            v105 = 0;
          if (v79 >= 7 && (v106 = v78[3]) != 0)
            v107 = (int *)((char *)v77 + v106 + *(unsigned int *)((char *)v77 + v106));
          else
            v107 = 0;
          if (*v107 <= v81)
            __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
          v108 = (_DWORD *)((char *)&v107[v83 + 1] + v107[v83 + 1]);
          v109 = (unsigned __int16 *)((char *)v108 - *v108);
          if (*v109 >= 5u && (v110 = v109[2]) != 0)
            v111 = (char *)v108 + v110 + *(unsigned int *)((char *)v108 + v110);
          else
            v111 = 0;
          v112 = v105 + 4;
          v113 = (uint64_t)&v111[4 * (v89 - ((unint64_t)v87 >> 2)) + 4];
          *(_QWORD *)v123 = v64;
          while (v112 != (_DWORD *)v113)
          {
            *(_DWORD *)v119 = *v112;
            std::back_insert_iterator<std::vector<int>>::operator=[abi:ne180100]((uint64_t *)v123, v119);
            ++v112;
          }
        }
        else
        {
          if (v79 < 7)
          {
            v90 = 0;
          }
          else
          {
            v90 = (_DWORD *)v78[3];
            if (v78[3])
              v90 = (_DWORD *)((char *)v90 + (_QWORD)v77 + *(unsigned int *)((char *)v90 + (_QWORD)v77));
          }
          if (*v90 <= v81)
            break;
          v92 = (_DWORD *)((char *)&v90[v83 + 1] + v90[v83 + 1]);
          v93 = (unsigned __int16 *)((char *)v92 - *v92);
          if (*v93 >= 5u && (v94 = v93[2]) != 0)
            v95 = (char *)v92 + v94 + *(unsigned int *)((char *)v92 + v94);
          else
            v95 = 0;
          if (v79 >= 7 && (v96 = v78[3]) != 0)
            v97 = (int *)((char *)v77 + v96 + *(unsigned int *)((char *)v77 + v96));
          else
            v97 = 0;
          if (*v97 <= v81)
            break;
          v98 = v95 + 4;
          v99 = (_DWORD *)((char *)&v97[v83 + 1] + v97[v83 + 1]);
          v100 = (unsigned int *)((char *)v99 + *(unsigned __int16 *)((char *)v99 - *v99 + 4));
          v101 = (uint64_t)&v100[*(unsigned int *)((char *)v100 + *v100) + 1] + *v100;
          *(_QWORD *)v123 = v64;
          while (v98 != (_DWORD *)v101)
          {
            *(_DWORD *)v119 = *v98;
            std::back_insert_iterator<std::vector<int>>::operator=[abi:ne180100]((uint64_t *)v123, v119);
            ++v98;
          }
        }
        if (v88 < v89)
        {
          ++v67;
          v66 = v120;
          if (0xAAAAAAAAAAAAAAABLL * ((v121 - v120) >> 2) > v67)
            continue;
        }
        goto LABEL_129;
      }
      __assert_rtn("Get", "flatbuffers.h", 257, "i < size()");
    }
LABEL_129:
    if (*v65 >= 2)
    {
      v123[0] = 0;
      std::__sort<std::__less<int,int> &,int *>();
      v114 = std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<int *>,std::__wrap_iter<int *>,std::__equal_to &>(v64->__begin_, v64->__end_);
      std::vector<int>::resize(v64, v114 - v64->__begin_);
    }
    if (v120)
    {
      v121 = v120;
      operator delete(v120);
    }
  }
  else
  {
    *v7 = 2;
  }
}

void sub_24797F144(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;

  v4 = *(void **)(v2 - 144);
  if (v4)
  {
    *(_QWORD *)(v2 - 136) = v4;
    operator delete(v4);
  }
  v5 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *value;
  int64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  int *v9;
  std::vector<int>::pointer begin;
  int *end;
  int *v12;
  int v13;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v5 = (char *)this->__end_ - (char *)this->__begin_;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)p_end_cap, __n);
    v7 = (int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = (int *)&v6[4 * v8];
    begin = this->__begin_;
    end = this->__end_;
    v12 = v7;
    if (end != this->__begin_)
    {
      v12 = v7;
      do
      {
        v13 = *--end;
        *--v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
      operator delete(begin);
  }
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

void CLSHInfer::search(uint64_t a1, const float *a2, int a3, void *a4, _DWORD *a5)
{
  std::vector<int>::pointer begin;
  unint64_t v11;
  int v12;
  uint64_t v13;
  int *v14;
  unsigned __int16 *v15;
  uint64_t v16;
  char *v17;
  std::vector<int>::pointer v18;
  uint64_t v19;
  std::vector<int>::pointer v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  std::vector<int> __p;

  CLSHInfer::search_lsh_flatbuffer((int *)a1, a2, &__p);
  begin = __p.__begin_;
  if (*a5)
    goto LABEL_20;
  v11 = (unint64_t)((char *)__p.__end_ - (char *)__p.__begin_) >> 2;
  v12 = *(_DWORD *)(a1 + 24);
  if (v12 >= (int)v11)
    v13 = v11;
  else
    v13 = v12;
  v14 = *(int **)(a1 + 144);
  v15 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v15 >= 0x1Fu && (v16 = v15[15]) != 0)
    v17 = (char *)v14 + v16 + *(unsigned int *)((char *)v14 + v16);
  else
    v17 = 0;
  memset(&__p, 0, sizeof(__p));
  std::vector<long long>::vector(&__p, (int)v13);
  if ((int)v13 >= 1)
  {
    v18 = __p.__begin_;
    v19 = v13;
    v20 = begin;
    do
    {
      v21 = *v20++;
      *(_QWORD *)v18 = *(_QWORD *)&v17[8 * v21 + 4];
      v18 += 2;
      --v19;
    }
    while (v19);
  }
  v26 = 0;
  v27 = 0;
  v28 = 0;
  CLSHInfer::rerank(a1, (uint64_t)&__p, v13, a3, *(_DWORD *)(a1 + 168), (uint64_t)a2, a5, (uint64_t)&v26);
  v22 = v26;
  v23 = v27 - v26;
  v24 = (unint64_t)(v27 - v26) >> 4;
  bzero(a4, 8 * a3);
  if ((int)v24 < 1)
  {
    if (!v22)
      goto LABEL_18;
  }
  else
  {
    v25 = (v23 >> 4) + 1;
    do
    {
      *((_QWORD *)a4 + (v25 - 2)) = *(_QWORD *)&v22[16 * (v25 - 2) + 8];
      --v25;
    }
    while (v25 > 1);
  }
  v27 = v22;
  operator delete(v22);
LABEL_18:
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
LABEL_20:
  if (begin)
    operator delete(begin);
}

void sub_24797F404(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;

  if (__p)
    operator delete(__p);
  if (v13)
    operator delete(v13);
  _Unwind_Resume(exception_object);
}

void CLSHInfer::rerank(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, unsigned int a5@<W4>, uint64_t a6@<X5>, _DWORD *a7@<X6>, uint64_t a8@<X8>)
{
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  char *v16;
  size_t v17;
  pthread_t *v18;
  pthread_t *v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  _DWORD *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  pthread_t *v30;
  pthread_t *v31;
  pthread_t *v32;
  _opaque_pthread_t *v33;
  pthread_t *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  _DWORD *v41;
  char **v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  pthread_t v46;
  pthread_t *v47;
  char *v48;
  char *v49;
  pthread_attr_t v50;
  uint64_t v51;

  v43 = a2;
  v44 = a6;
  v51 = *MEMORY[0x24BDAC8D0];
  if (a4 >= a3)
    v12 = 1;
  else
    v12 = a5;
  if (a4 >= a3)
    v13 = a3;
  else
    v13 = a4;
  v45 = v13;
  *(_QWORD *)a8 = 0;
  *(_QWORD *)(a8 + 8) = 0;
  *(_QWORD *)(a8 + 16) = 0;
  std::vector<std::pair<float,long long>>::reserve((void **)a8, (int)v12 * (int)v13);
  if (a3 % (int)v12 <= 0)
    v14 = a3 / (int)v12;
  else
    v14 = a3 / (int)v12 + 1;
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v40 - v15;
  bzero((char *)&v40 - v15, v17);
  memset(&v50, 0, sizeof(v50));
  pthread_attr_init(&v50);
  pthread_attr_setstacksize(&v50, 0x2800uLL);
  v18 = 0;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v19 = 0;
  if ((int)v12 < 1 || a3 < 1)
    goto LABEL_42;
  v40 = a8;
  v41 = a7;
  v20 = 0;
  v21 = 0;
  v42 = &v49;
  do
  {
    v22 = v14 + v21;
    if (v14 + v21 >= a3)
      v23 = a3;
    else
      v23 = v14 + v21;
    v46 = 0;
    v24 = (_DWORD *)operator new();
    *(_QWORD *)v24 = v43;
    v24[2] = v21;
    v24[3] = v23;
    v24[4] = v45;
    *((_QWORD *)v24 + 3) = v44;
    *((_QWORD *)v24 + 4) = a1;
    v24[10] = 0;
    *((_QWORD *)v24 + 7) = 0;
    *((_QWORD *)v24 + 8) = 0;
    *((_QWORD *)v24 + 6) = 0;
    *(_QWORD *)&v16[8 * v20] = v24;
    if (pthread_create(&v46, &v50, (void *(__cdecl *)(void *))worker, v24))
    {
      *v41 = 6;
      goto LABEL_53;
    }
    v25 = v48;
    if (v48 >= v49)
    {
      v26 = (v48 - (char *)v47) >> 3;
      if ((unint64_t)(v26 + 1) >> 61)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      v27 = (v49 - (char *)v47) >> 2;
      if (v27 <= v26 + 1)
        v27 = v26 + 1;
      if ((unint64_t)(v49 - (char *)v47) >= 0x7FFFFFFFFFFFFFF8)
        v28 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v28 = v27;
      if (v28)
        v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)v42, v28);
      else
        v29 = 0;
      v30 = (pthread_t *)&v29[8 * v26];
      *v30 = v46;
      v18 = v30 + 1;
      v32 = v47;
      v31 = (pthread_t *)v48;
      if (v48 != (char *)v47)
      {
        do
        {
          v33 = *--v31;
          *--v30 = v33;
        }
        while (v31 != v32);
        v31 = v47;
      }
      v47 = v30;
      v48 = (char *)v18;
      v49 = &v29[8 * v28];
      if (v31)
        operator delete(v31);
    }
    else
    {
      *(_QWORD *)v48 = v46;
      v18 = (pthread_t *)(v25 + 8);
    }
    v48 = (char *)v18;
    if (++v20 >= v12)
      break;
    v21 = v23;
  }
  while (v22 < a3);
  v34 = v47;
  if (v47 == v18)
  {
    v19 = v18;
    a8 = v40;
    a7 = v41;
LABEL_42:
    if ((int)((unint64_t)((char *)v19 - (char *)v18) >> 3) >= 1)
    {
      v35 = 0;
      do
      {
        v36 = *(_QWORD *)&v16[8 * v35];
        v37 = *(_DWORD *)(v36 + 40);
        if (v37)
          *a7 = v37;
        else
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::pair<float,long long> *>,std::__wrap_iter<std::pair<float,long long> *>,std::back_insert_iterator<std::vector<std::pair<float,long long>>>,0>(*(_OWORD **)(v36 + 48), *(_OWORD **)(v36 + 56), (void **)a8);
        v38 = *(void **)(v36 + 48);
        if (v38)
        {
          *(_QWORD *)(v36 + 56) = v38;
          operator delete(v38);
        }
        MEMORY[0x249585BE4](v36, 0x10E0C4018814F32);
        ++v35;
      }
      while (v35 < (int)((unint64_t)(v48 - (char *)v47) >> 3));
    }
    v39 = (int)v45;
    if ((_DWORD)v45)
      std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>,std::__wrap_iter<std::pair<float,long long>*>>(*(_QWORD *)a8, *(_QWORD *)a8 + 16 * (int)v45, *(_QWORD *)(a8 + 8), (uint64_t)&v46);
    std::vector<std::pair<float,long long>>::resize(a8, v39);
    goto LABEL_53;
  }
  a8 = v40;
  a7 = v41;
  while (!pthread_join(*v34, 0))
  {
    if (++v34 == v18)
    {
      v18 = v47;
      v19 = (pthread_t *)v48;
      goto LABEL_42;
    }
  }
  *a7 = 6;
LABEL_53:
  if (v47)
  {
    v48 = (char *)v47;
    operator delete(v47);
  }
}

void sub_24797F7BC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;

  *(_QWORD *)(v2 - 240) = v1;
  v4 = *(void **)(v2 - 184);
  if (v4)
  {
    *(_QWORD *)(v2 - 176) = v4;
    operator delete(v4);
  }
  v5 = **(void ***)(v2 - 240);
  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(v2 - 240) + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void CLSHInfer::search(uint64_t a1, uint64_t *a2, int a3, int a4, _QWORD *a5, _DWORD *a6)
{
  uint64_t v12;
  size_t v13;
  char *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  float v20;
  char *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v12 = *(int *)(a1 + 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)v22 - ((v13 + 15) & 0x7FFFFFFF0);
  bzero(v14, v13);
  bzero(v14, 4 * v12);
  if (a3 < 1)
    goto LABEL_10;
  v15 = 0;
  v16 = a3;
  do
  {
    v18 = *a2++;
    v17 = v18;
    if (CLSHInfer::check_vocab_id_present((CLSHInfer *)a1, v18))
    {
      CLSHInfer::emb_lookup_accumulate((CLSHInfer *)a1, v17, (float *)v14);
      ++v15;
    }
    --v16;
  }
  while (v16);
  if (v15)
  {
    v19 = 1.0 / (double)v15;
    cblas_sscal(*(_DWORD *)(a1 + 12), v19, (float *)v14, 1);
    if (*(_BYTE *)(a1 + 16))
    {
      v20 = cblas_snrm2(*(_DWORD *)(a1 + 12), (const float *)v14, 1);
      cblas_sscal(*(_DWORD *)(a1 + 12), 1.0 / *(float *)(a1 + 28), (float *)v14, 1);
      v21 = &v14[4 * *(int *)(a1 + 12)];
      *(float *)v21 = sqrtf(1.0 - (float)((float)(v20 * v20) / (float)(*(float *)(a1 + 28) * *(float *)(a1 + 28))));
      *((_DWORD *)v21 + 1) = 0;
    }
    CLSHInfer::search(a1, (const float *)v14, a4, a5, a6);
  }
  else
  {
LABEL_10:
    *a5 = -1;
    *a6 = 4;
  }
}

BOOL CLSHInfer::check_vocab_id_present(CLSHInfer *this, uint64_t a2)
{
  int *v2;
  unsigned __int16 *v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;

  v2 = (int *)*((_QWORD *)this + 18);
  if (!v2)
    return 1;
  v3 = (unsigned __int16 *)((char *)v2 - *v2);
  if (*v3 < 0x1Fu)
    return 1;
  v4 = v3[15];
  if (!v3[15])
    return 1;
  v5 = *((_QWORD *)this + 7);
  if (!v5)
    return 0;
  v6 = (_QWORD *)((char *)v2 + v4 + *(unsigned int *)((char *)v2 + v4) + 4);
  v7 = &v6[v5];
  do
  {
    v8 = v5 >> 1;
    v9 = &v6[v5 >> 1];
    v11 = *v9;
    v10 = v9 + 1;
    v5 += ~(v5 >> 1);
    if (v11 >= a2)
      v5 = v8;
    else
      v6 = v10;
  }
  while (v5);
  return v6 != v7 && *v6 <= a2;
}

float CLSHInfer::emb_lookup_accumulate(CLSHInfer *this, uint64_t a2, float *a3)
{
  size_t v6;
  float *v7;
  float result;
  uint64_t v9;
  float v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v7 = (float *)((char *)v11 - ((v6 + 15) & 0x7FFFFFFF0));
  bzero(v7, v6);
  CLSHInfer::emb_lookup(this, a2, v7);
  v9 = *((unsigned int *)this + 3);
  if ((int)v9 >= 1)
  {
    do
    {
      v10 = *v7++;
      result = v10 + *a3;
      *a3++ = result;
      --v9;
    }
    while (v9);
  }
  return result;
}

void CLSHInfer::rerank_heap(int *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, int a4@<W3>, const float *a5@<X4>, _DWORD *a6@<X5>, char **a7@<X8>)
{
  size_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  float v17;
  float v18;
  char *v19;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  uint64_t *v40;
  _QWORD *v41;
  unint64_t v42;
  _DWORD *v43;
  char v44;
  char v45;
  char v46;
  uint64_t v47;

  v43 = a6;
  v47 = *MEMORY[0x24BDAC8D0];
  *a7 = 0;
  a7[1] = 0;
  a7[2] = 0;
  v42 = a4;
  std::vector<std::pair<float,long long>>::reserve((void **)a7, a4);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v38 - ((v13 + 15) & 0x7FFFFFFF0);
  bzero(v14, v13);
  if (a2 != a3)
  {
    v38 = a4 - 1;
    v39 = a1;
    v40 = a3;
    v41 = a7 + 2;
    do
    {
      v15 = *a2;
      CLSHInfer::emb_lookup((CLSHInfer *)a1, *a2, (float *)v14);
      if (*v43)
        break;
      v16 = v14;
      v17 = cblas_sdot(a1[2], a5, 1, (const float *)v14, 1);
      v18 = v17;
      v20 = (float *)*a7;
      v19 = a7[1];
      v21 = v19 - *a7;
      v22 = v21 >> 4;
      if (v21 >> 4 >= v42)
      {
        v24 = *v20;
        if (*v20 < v17)
        {
          if (v21 >= 17)
          {
            v25 = *((_QWORD *)v20 + 1);
            std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>((uint64_t)*a7, (uint64_t)&v45, (unint64_t)v21 >> 4);
            if (v19 - 16 == v26)
            {
              *(float *)v26 = v24;
              *((_QWORD *)v26 + 1) = v25;
            }
            else
            {
              *(_DWORD *)v26 = *((_DWORD *)v19 - 4);
              *((_QWORD *)v26 + 1) = *((_QWORD *)v19 - 1);
              *((float *)v19 - 4) = v24;
              *((_QWORD *)v19 - 1) = v25;
              std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>((uint64_t)v20, (uint64_t)(v26 + 16), (uint64_t)&v45, (v26 + 16 - (char *)v20) >> 4);
            }
          }
          v35 = *a7;
          v36 = (uint64_t)a7[1];
          v37 = (uint64_t)&(*a7)[16 * v38];
          *(float *)v37 = v18;
          *(_QWORD *)(v37 + 8) = v15;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>((uint64_t)v35, v36, (uint64_t)&v46, (v36 - (uint64_t)v35) >> 4);
        }
      }
      else
      {
        if ((unint64_t)v19 >= *v41)
        {
          v27 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 60)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v28 = *v41 - (_QWORD)v20;
          if (v28 >> 3 > v27)
            v27 = v28 >> 3;
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0)
            v29 = 0xFFFFFFFFFFFFFFFLL;
          else
            v29 = v27;
          if (v29)
            v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>((uint64_t)v41, v29);
          else
            v30 = 0;
          v31 = &v30[16 * v22];
          *(_QWORD *)v31 = LODWORD(v18);
          *((_QWORD *)v31 + 1) = v15;
          v33 = *a7;
          v32 = a7[1];
          v34 = v31;
          if (v32 != *a7)
          {
            do
            {
              *((_OWORD *)v34 - 1) = *((_OWORD *)v32 - 1);
              v34 -= 16;
              v32 -= 16;
            }
            while (v32 != v33);
            v32 = *a7;
          }
          v23 = (uint64_t)(v31 + 16);
          *a7 = v34;
          a7[1] = v31 + 16;
          a7[2] = &v30[16 * v29];
          a3 = v40;
          if (v32)
            operator delete(v32);
        }
        else
        {
          *(_QWORD *)v19 = LODWORD(v17);
          *((_QWORD *)v19 + 1) = v15;
          v23 = (uint64_t)(v19 + 16);
          a3 = v40;
        }
        a1 = v39;
        a7[1] = (char *)v23;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>((uint64_t)*a7, v23, (uint64_t)&v44, (v23 - (uint64_t)*a7) >> 4);
      }
      ++a2;
      v14 = v16;
    }
    while (a2 != a3);
  }
}

void sub_24797FE14(_Unwind_Exception *exception_object)
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

void std::vector<std::pair<float,long long>>::reserve(void **a1, unint64_t a2)
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

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void CLSHInfer::emb_lookup(CLSHInfer *this, uint64_t a2, float *__X)
{
  int v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float *v13;

  v5 = *((_DWORD *)this + 3);
  if (v5 >= 1)
  {
    v7 = 0;
    v8 = *((_QWORD *)this + 9);
    do
    {
      v9 = *(_QWORD *)(*((_QWORD *)this + 15) + 8 * v7);
      v10 = *((_QWORD *)this + 6) - v8 + 1;
      v11 = (*((_QWORD *)this + 10) * (*((_QWORD *)this + 8) + a2 + v9)
           + (*((_QWORD *)this + 8) + a2) * v9 * *((_QWORD *)this + 11)
           + *((_QWORD *)this + 12))
          * *((_QWORD *)this + 13)
          % v10;
      memcpy(&__X[v7], (const void *)(*((_QWORD *)this + 17) + 4 * (int)(((v11 >> 63) & v10) + v11)), 4 * v8);
      v8 = *((_QWORD *)this + 9);
      v7 += v8;
      v5 = *((_DWORD *)this + 3);
    }
    while (v7 < v5);
  }
  if (*((_BYTE *)this + 16))
  {
    v12 = cblas_snrm2(v5, __X, 1);
    cblas_sscal(*((_DWORD *)this + 3), 1.0 / *((float *)this + 8), __X, 1);
    v13 = &__X[*((int *)this + 3)];
    *v13 = 0.0;
    v13[1] = sqrtf(1.0 - (float)((float)(v12 * v12) / (float)(*((float *)this + 8) * *((float *)this + 8))));
  }
}

void CLSHInfer::rerank(int *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, const float *a5@<X4>, _DWORD *a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t *v10;
  size_t v13;
  char *v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v32 = a4;
  v10 = a2;
  v34 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a7 = 0;
  *(_QWORD *)(a7 + 8) = 0;
  *(_QWORD *)(a7 + 16) = 0;
  std::vector<std::pair<float,long long>>::reserve((void **)a7, a3 - a2);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v32 - ((v13 + 15) & 0x7FFFFFFF0);
  bzero(v14, v13);
  if (v10 == a3)
  {
    v20 = *(_QWORD *)(a7 + 8);
LABEL_23:
    v30 = v32;
    v31 = *(_QWORD *)a7 + 16 * (int)v32;
    if (v31 != v20)
      std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(*(_QWORD *)a7, v31, v20);
    std::vector<std::pair<float,long long>>::resize(a7, v30);
  }
  else
  {
    v33 = a7 + 16;
    while (1)
    {
      v15 = *v10;
      CLSHInfer::emb_lookup((CLSHInfer *)a1, *v10, (float *)v14);
      if (*a6)
        break;
      v16 = cblas_sdot(a1[2], a5, 1, (const float *)v14, 1);
      v17 = LODWORD(v16);
      v19 = *(_QWORD **)(a7 + 8);
      v18 = *(_QWORD *)(a7 + 16);
      if ((unint64_t)v19 >= v18)
      {
        v21 = ((uint64_t)v19 - *(_QWORD *)a7) >> 4;
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 60)
          std::vector<int>::__throw_length_error[abi:ne180100]();
        v23 = v18 - *(_QWORD *)a7;
        if (v23 >> 3 > v22)
          v22 = v23 >> 3;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0)
          v24 = 0xFFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        if (v24)
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(v33, v24);
        else
          v25 = 0;
        v26 = &v25[16 * v21];
        *(_QWORD *)v26 = v17;
        *((_QWORD *)v26 + 1) = v15;
        v28 = *(char **)a7;
        v27 = *(char **)(a7 + 8);
        v29 = v26;
        if (v27 != *(char **)a7)
        {
          do
          {
            *((_OWORD *)v29 - 1) = *((_OWORD *)v27 - 1);
            v29 -= 16;
            v27 -= 16;
          }
          while (v27 != v28);
          v27 = *(char **)a7;
        }
        v20 = (uint64_t)(v26 + 16);
        *(_QWORD *)a7 = v29;
        *(_QWORD *)(a7 + 8) = v26 + 16;
        *(_QWORD *)(a7 + 16) = &v25[16 * v24];
        if (v27)
          operator delete(v27);
      }
      else
      {
        *v19 = LODWORD(v16);
        v19[1] = v15;
        v20 = (uint64_t)(v19 + 2);
      }
      *(_QWORD *)(a7 + 8) = v20;
      if (++v10 == a3)
        goto LABEL_23;
    }
  }
}

void sub_247980224(_Unwind_Exception *exception_object)
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

void std::vector<std::pair<float,long long>>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 16 * a2;
  }
  else
  {
    std::vector<std::pair<float,long long>>::__append((void **)a1, a2 - v2);
  }
}

uint64_t CLSHInfer::get_consolidated_params@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  _DWORD *v4;
  int *v5;
  unsigned __int16 *v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_DWORD *)a4 = a3;
  *(_QWORD *)(a4 + 12) = 0;
  v4 = (_DWORD *)(a4 + 12);
  *(_QWORD *)(a4 + 20) = 0;
  *(_QWORD *)(a4 + 40) = 0;
  *(_QWORD *)(a4 + 4) = 0x100000008;
  v5 = *(int **)(result + 152);
  if (v5)
  {
    v6 = (unsigned __int16 *)((char *)v5 - *v5);
    v7 = *v6;
    if (v7 < 9)
    {
      *(_DWORD *)a4 = 100;
      if (v7 < 7)
        goto LABEL_11;
    }
    else
    {
      if (v6[4])
        v8 = *(int *)((char *)v5 + v6[4]);
      else
        v8 = 100;
      *(_DWORD *)a4 = v8;
    }
    v9 = v6[3];
    if (v9)
    {
      v10 = *(int *)((char *)v5 + v9);
LABEL_12:
      *v4 = v10;
      goto LABEL_13;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
LABEL_13:
  if (a2)
  {
    v11 = *(_DWORD *)(a2 + 4);
    if (v11 >= 1)
      *(_DWORD *)(a4 + 4) = v11;
    if ((*(_DWORD *)a2 & 0x80000000) == 0)
      *(_DWORD *)a4 = *(_DWORD *)a2;
    v12 = *(_DWORD *)(a2 + 12);
    if ((v12 & 0x80000000) == 0)
      *v4 = v12;
    v13 = *(_DWORD *)(a2 + 8);
    if ((v13 & 0x80000000) == 0)
      *(_DWORD *)(a4 + 8) = v13;
    v14 = *(_DWORD *)(a2 + 44);
    if ((v14 & 0x80000000) == 0)
      *(_DWORD *)(a4 + 44) = v14;
    v15 = *(_DWORD *)(a2 + 24);
    if (v15 >= 1)
    {
      v16 = *(_QWORD *)(a2 + 16);
      if (v16)
      {
        *(_DWORD *)(a4 + 24) = v15;
        *(_QWORD *)(a4 + 16) = v16;
      }
    }
    v17 = *(_DWORD *)(a2 + 40);
    if (v17 >= 1)
    {
      v18 = *(_QWORD *)(a2 + 32);
      if (v18)
      {
        *(_DWORD *)(a4 + 40) = v17;
        *(_QWORD *)(a4 + 32) = v18;
      }
    }
  }
  return result;
}

uint64_t CLSHInfer::retrieve_top_genre_recommendations(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int *a5)
{
  int *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  int *v10;
  unsigned __int16 *v11;
  unint64_t v14;
  size_t v15;
  void **v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  void **v22;
  uint64_t v24;
  int *v25;
  unsigned __int16 *v26;
  uint64_t v27;
  int *v28;
  unsigned __int16 *v29;
  uint64_t v30;
  unsigned int *v31;
  uint64_t v32;
  unsigned int *v33;
  unsigned int *v34;
  int *v35;
  void *v36;
  unsigned __int16 *v37;
  unsigned int v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void **v46;
  uint64_t v47;
  void **v48;
  int v49;
  int v50;
  int v51;
  int v52;
  BOOL v54;
  _BOOL4 v55;
  int v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unsigned int *v63;
  _DWORD *v64;
  uint64_t *v65;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  _QWORD *v72;
  int v73;
  uint64_t v74;
  int v75;
  int v76;
  int v77;
  int v78;
  void *__dst[2];
  unsigned __int8 v80;
  __int128 v81;
  uint64_t v82;
  void *v83[2];
  uint64_t v84;
  void *__s1[2];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  void *__p[2];
  __int128 v90;
  __int128 v91;
  _OWORD v92[9];
  uint64_t v93;
  _BYTE v94[9];

  if (!a5)
    return 7;
  *a5 = 0;
  if (!a2)
    return 7;
  v7 = *(int **)(a1 + 152);
  if (!v7)
    return 10;
  v8 = (unsigned __int16 *)((char *)v7 - *v7);
  if (*v8 < 5u)
    return 10;
  v9 = v8[2];
  if (!v9)
    return 10;
  v10 = (int *)((char *)v7 + v9 + *(unsigned int *)((char *)v7 + v9));
  v11 = (unsigned __int16 *)((char *)v10 - *v10);
  if (*v11 < 5u || !v11[2])
    return 10;
  v78 = *(_DWORD *)(a2 + 44);
  v83[0] = 0;
  v83[1] = 0;
  v84 = 0;
  v14 = *(_QWORD *)(a2 + 32);
  if (v14)
  {
    v15 = *(unsigned int *)(a2 + 40);
    if ((int)v15 < 1)
    {
      LOBYTE(v14) = 0;
    }
    else
    {
      std::string::basic_string[abi:ne180100](__dst, *(void **)(a2 + 32), v15);
      v93 = 0;
      v91 = 0u;
      memset(v92, 0, sizeof(v92));
      *(_OWORD *)__p = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      *(_OWORD *)__s1 = 0u;
      v86 = 0u;
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)__s1);
      if ((v80 & 0x80u) == 0)
        v16 = __dst;
      else
        v16 = (void **)__dst[0];
      if ((v80 & 0x80u) == 0)
        v17 = v80;
      else
        v17 = (unint64_t)__dst[1];
      if (v17)
      {
        v18 = MEMORY[0x24BDAC740];
        while (1)
        {
          v19 = *(char *)v16;
          if ((v19 & 0x80000000) == 0)
            break;
          if (__maskrune(*(char *)v16, 0x8000uLL))
            goto LABEL_24;
          if (__maskrune(v19, 0x1000uLL))
            goto LABEL_26;
LABEL_27:
          v16 = (void **)((char *)v16 + 1);
          if (!--v17)
            goto LABEL_28;
        }
        v20 = *(_DWORD *)(v18 + 4 * v19 + 60);
        if ((v20 & 0x8000) == 0)
        {
          if ((v20 & 0x1000) == 0 && (v20 & 0x400) == 0)
            goto LABEL_27;
LABEL_26:
          v94[0] = v19;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__s1, (uint64_t)v94, 1);
          goto LABEL_27;
        }
LABEL_24:
        v94[0] = __tolower(v19);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__s1, (uint64_t)v94, 1);
        goto LABEL_27;
      }
LABEL_28:
      std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&__s1[1], &v81);
      __s1[0] = *(void **)MEMORY[0x24BEDB800];
      *(void **)((char *)__s1 + *((_QWORD *)__s1[0] - 3)) = *(void **)(MEMORY[0x24BEDB800] + 24);
      __s1[1] = (void *)(MEMORY[0x24BEDB848] + 16);
      if (SHIBYTE(v90) < 0)
        operator delete(__p[1]);
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x249585BC0](v92);
      if (SHIBYTE(v84) < 0)
        operator delete(v83[0]);
      *(_OWORD *)v83 = v81;
      v84 = v82;
      HIBYTE(v82) = 0;
      LOBYTE(v81) = 0;
      if ((char)v80 < 0)
        operator delete(__dst[0]);
      LOBYTE(v14) = HIBYTE(v84);
      if (SHIBYTE(v84) < 0)
      {
        LODWORD(v21) = v83[1];
        if (v83[1])
        {
          v22 = (void **)v83[0];
          goto LABEL_125;
        }
      }
      else if (HIBYTE(v84))
      {
        LODWORD(v21) = HIBYTE(v84);
        v22 = v83;
LABEL_125:
        v24 = 0;
        if (v22 && (v21 & 0x80000000) == 0)
        {
          if ((int)v21 >= 1000)
            v21 = 1000;
          else
            v21 = v21;
          if ((_DWORD)v21)
          {
            v75 = -2128831035;
            do
            {
              v76 = *(char *)v22;
              v22 = (void **)((char *)v22 + 1);
              v75 = 16777619 * (v75 ^ v76);
              --v21;
            }
            while (v21);
            v24 = v75 & 0x7FFFFFFF;
          }
          else
          {
            v24 = 18652613;
          }
        }
        goto LABEL_41;
      }
    }
  }
  v24 = 0;
LABEL_41:
  v25 = *(int **)(a1 + 152);
  v26 = (unsigned __int16 *)((char *)v25 - *v25);
  if (*v26 >= 5u && (v27 = v26[2]) != 0)
    v28 = (int *)((char *)v25 + v27 + *(unsigned int *)((char *)v25 + v27));
  else
    v28 = 0;
  v29 = (unsigned __int16 *)((char *)v28 - *v28);
  if (*v29 >= 5u && (v30 = v29[2]) != 0)
    v31 = (unsigned int *)((char *)v28 + v30 + *(unsigned int *)((char *)v28 + v30));
  else
    v31 = 0;
  v33 = v31 + 1;
  v32 = *v31;
  if (!(_DWORD)v32)
  {
LABEL_102:
    v14 = v14;
    if ((v14 & 0x80u) != 0)
      v14 = (unint64_t)v83[1];
    if (!v14)
    {
      v58 = *v31;
      if ((_DWORD)v58)
      {
        v35 = 0;
        v59 = 4 * v58;
        do
        {
          v60 = v31[1];
          v61 = (char *)v31 + v60 - *(int *)((char *)v31 + v60 + 4);
          if (*((unsigned __int16 *)v61 + 2) < 7u
            || (v62 = *((unsigned __int16 *)v61 + 5)) == 0
            || !*(unsigned int *)((char *)v31 + v60 + v62 + 4))
          {
            v35 = (int *)((char *)v31 + v60 + 4);
          }
          ++v31;
          v59 -= 4;
        }
        while (v59);
        if (v35)
          goto LABEL_113;
      }
    }
    goto LABEL_120;
  }
  v34 = &v33[v32];
  while (1)
  {
    v35 = (int *)((char *)v33 + *v33);
    v36 = v83[1];
    if (v84 >= 0)
      v36 = (void *)HIBYTE(v84);
    v37 = (unsigned __int16 *)((char *)v35 - *v35);
    v38 = *v37;
    if (v36)
    {
      if (v38 >= 7)
      {
        v39 = v37[3];
        if (v37[3])
          LODWORD(v39) = *(int *)((char *)v35 + v39);
      }
      else
      {
        LODWORD(v39) = 0;
      }
      v40 = v24 == (int)v39;
    }
    else
    {
      if (v38 >= 7)
      {
        v41 = v37[3];
        if (v37[3])
          LODWORD(v41) = *(int *)((char *)v35 + v41);
      }
      else
      {
        LODWORD(v41) = 0;
      }
      v40 = (_DWORD)v41 == v78;
    }
    v42 = v40;
    if (v38 < 5 || (v43 = v37[2]) == 0)
    {
      if ((v42 & 1) != 0)
        goto LABEL_113;
      goto LABEL_93;
    }
    std::string::basic_string[abi:ne180100](__s1, (char *)v35 + v43 + *(unsigned int *)((char *)v35 + v43) + 4, *(unsigned int *)((char *)v35 + v43 + *(unsigned int *)((char *)v35 + v43)));
    if ((SBYTE7(v86) & 0x80u) == 0)
      v44 = (void *)BYTE7(v86);
    else
      v44 = __s1[1];
    v45 = (void *)HIBYTE(v84);
    if (v84 < 0)
      v45 = v83[1];
    if (v44 != v45)
    {
      v55 = 0;
      goto LABEL_90;
    }
    v46 = v84 >= 0 ? v83 : (void **)v83[0];
    if ((BYTE7(v86) & 0x80) == 0)
      break;
    v57 = __s1[0];
    v77 = memcmp(__s1[0], v46, (size_t)__s1[1]);
    operator delete(v57);
    if (v77)
      v56 = v42;
    else
      v56 = 1;
    if ((v56 & 1) != 0)
      goto LABEL_99;
LABEL_93:
    if (++v33 == v34)
    {
      LOBYTE(v14) = HIBYTE(v84);
      goto LABEL_102;
    }
  }
  if (!BYTE7(v86))
    goto LABEL_113;
  v47 = BYTE7(v86) - 1;
  v48 = __s1;
  do
  {
    v50 = *(unsigned __int8 *)v48;
    v48 = (void **)((char *)v48 + 1);
    v49 = v50;
    v52 = *(unsigned __int8 *)v46;
    v46 = (void **)((char *)v46 + 1);
    v51 = v52;
    v54 = v47-- != 0;
    v55 = v49 == v51;
  }
  while (v49 == v51 && v54);
LABEL_90:
  if ((BYTE7(v86) & 0x80) != 0)
    operator delete(__s1[0]);
  v56 = v55 | v42;
  if (((v55 | v42) & 1) == 0)
    goto LABEL_93;
LABEL_99:
  if (!v56)
    v35 = 0;
LABEL_113:
  v63 = (unsigned int *)((char *)v35 + *(unsigned __int16 *)((char *)v35 - *v35 + 8));
  v64 = (unsigned int *)((char *)v63 + *v63);
  v67 = *v64;
  v65 = (uint64_t *)(v64 + 1);
  v66 = v67;
  if (v67)
  {
    v68 = 8 * v66;
    v69 = *a5;
    if ((int)v69 <= a4)
      v70 = a4;
    else
      v70 = *a5;
    v71 = v70 - v69;
    v72 = (_QWORD *)(a3 + 8 * v69);
    v73 = v69 + 1;
    do
    {
      if (!v71)
        break;
      v74 = *v65++;
      *v72++ = v74;
      *a5 = v73;
      --v71;
      ++v73;
      v68 -= 8;
    }
    while (v68);
  }
LABEL_120:
  if (SHIBYTE(v84) < 0)
    operator delete(v83[0]);
  return 0;
}

void sub_247980960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,char a27)
{
  std::ostringstream::~ostringstream((uint64_t)&a27);
  if (a16 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  _Unwind_Resume(a1);
}

uint64_t fnv_1a_31(char *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  v2 = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    if (a2 >= 1000)
      v3 = 1000;
    else
      v3 = a2;
    if ((_DWORD)v3)
    {
      v4 = -2128831035;
      do
      {
        v5 = *a1++;
        v4 = 16777619 * (v4 ^ v5);
        --v3;
      }
      while (v3);
      return v4 & 0x7FFFFFFF;
    }
    else
    {
      return 18652613;
    }
  }
  return v2;
}

uint64_t worker(threadParam *a1)
{
  threadParam::work(a1);
  return 0;
}

double threadParam::work(threadParam *this)
{
  void *v2;
  double result;
  __int128 v4;
  uint64_t v5;

  CLSHInfer::rerank(*((int **)this + 4), (uint64_t *)(**(_QWORD **)this + 8 * *((int *)this + 2)), (uint64_t *)(**(_QWORD **)this + 8 * *((int *)this + 3)), *((unsigned int *)this + 4), *((const float **)this + 3), (_DWORD *)this + 10, (uint64_t)&v4);
  v2 = (void *)*((_QWORD *)this + 6);
  if (v2)
  {
    *((_QWORD *)this + 7) = v2;
    operator delete(v2);
  }
  result = *(double *)&v4;
  *((_OWORD *)this + 3) = v4;
  *((_QWORD *)this + 8) = v5;
  return result;
}

uint64_t query_lsh_flatbuffer(uint64_t *a1, int a2, int a3, _QWORD *a4, unsigned int *a5, int a6)
{
  int *v11;
  unsigned __int16 *v12;
  uint64_t v13;
  char *v14;
  int *v15;
  unsigned int v17;
  _OWORD v18[10];
  __int128 v19;

  v11 = (int *)((char *)a5 + *a5);
  v12 = (unsigned __int16 *)((char *)v11 - *v11);
  if (*v12 >= 0xDu && (v13 = v12[6]) != 0)
    v14 = (char *)v11 + v13 + *(unsigned int *)((char *)v11 + v13);
  else
    v14 = 0;
  v19 = 0u;
  v15 = (int *)&v14[*((unsigned int *)v14 + 1) + 4];
  memset(v18, 0, sizeof(v18));
  CLSHInfer::CLSHInfer((uint64_t)v18, v15);
  DWORD2(v19) = a6;
  v17 = 0;
  CLSHInfer::search((uint64_t)v18, a1, a2, a3, a4, &v17);
  return v17;
}

uint64_t retrieval_flatbuffer(uint64_t *a1, int a2, int a3, uint64_t *a4, unsigned int *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  int *v14;
  unsigned __int16 *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  unsigned __int16 *v20;
  uint64_t v21;
  char *v22;
  int v23;
  unint64_t v25;
  uint64_t v26;
  uint64_t i;
  unint64_t v28;
  int *v29;
  float *v30;
  uint64_t v31;
  uint64_t *v32;
  int v33;
  int v34;
  uint64_t v35;
  float *v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  float *v40;
  void *__p;
  float *v42;
  _BYTE v43[12];
  int v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  float *__Y;
  float *v52;
  uint64_t v53;
  int v54;
  _OWORD v55[3];
  _OWORD v56[10];
  __int128 v57;
  char v58;

  if (!a7)
    return 7;
  LODWORD(v13) = 0;
  *(_QWORD *)a7 = 0;
  *(_QWORD *)(a7 + 8) = 0;
  v14 = (int *)((char *)a5 + *a5);
  v15 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v15 >= 5u)
  {
    v13 = v15[2];
    if (v15[2])
      v13 = *(_QWORD *)((char *)v14 + v13);
  }
  *(_DWORD *)(a7 + 16) = v13;
  v16 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v16 < 7u)
  {
    LODWORD(v17) = 0;
  }
  else
  {
    v17 = v16[3];
    if (v17)
      v17 = *(_QWORD *)((char *)v14 + v17);
  }
  *(_DWORD *)(a7 + 20) = v17;
  v18 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v18 < 9u)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    v19 = v18[4];
    if (v19)
      v19 = *(_QWORD *)((char *)v14 + v19);
  }
  *(_DWORD *)(a7 + 24) = v19;
  v57 = 0u;
  memset(v56, 0, sizeof(v56));
  v20 = (unsigned __int16 *)((char *)v14 - *v14);
  if (*v20 >= 0xDu && (v21 = v20[6]) != 0)
    v22 = (char *)v14 + v21 + *(unsigned int *)((char *)v14 + v21);
  else
    v22 = 0;
  CLSHInfer::CLSHInfer((uint64_t)v56, (int *)&v22[*((unsigned int *)v22 + 1) + 4]);
  DWORD2(v57) = 8;
  memset(v55, 0, sizeof(v55));
  CLSHInfer::get_consolidated_params((uint64_t)v56, a6, a3, (uint64_t)v55);
  v23 = v55[0];
  if (HIDWORD(v55[0]) + LODWORD(v55[0]) > a3)
    return 7;
  v54 = 0;
  if (SLODWORD(v55[0]) >= 1)
  {
    CLSHInfer::search((uint64_t)v56, a1, a2, v55[0], a4, &v54);
    if (v54)
    {
      v23 = 0;
      *(_DWORD *)(a7 + 8) = v54;
    }
    else
    {
      v23 = v55[0];
    }
  }
  *(_DWORD *)(a7 + 4) = v23;
  if (SHIDWORD(v55[0]) >= 1)
    *(_DWORD *)(a7 + 12) = CLSHInfer::retrieve_top_genre_recommendations((uint64_t)v56, (uint64_t)v55, (uint64_t)&a4[v23], SHIDWORD(v55[0]), (int *)a7);
  if (a2 >= 1 && DWORD2(v55[0]) == 1)
  {
    if ((_QWORD)v57)
    {
      v25 = *(unsigned int *)(a7 + 4);
      if ((int)v25 >= 1)
      {
        __Y = 0;
        v52 = 0;
        v53 = 0;
        std::vector<float>::vector(&__Y, a2 << 8);
        v48 = 0;
        v49 = 0;
        v50 = 0;
        std::vector<float>::vector(&v48, (int)((_DWORD)v25 << 8));
        v45 = 0;
        v46 = 0;
        v47 = 0;
        std::vector<float>::vector(&v45, v25);
        v26 = 0;
        do
        {
          CLSHInfer::emb_lookup((CLSHInfer *)v56, a1[v26], &__Y[HIDWORD(v56[0]) * (int)v26]);
          ++v26;
        }
        while (a2 != v26);
        for (i = 0; i != v25; ++i)
          CLSHInfer::emb_lookup((CLSHInfer *)v56, a4[i], (float *)v48 + HIDWORD(v56[0]) * (int)i);
        __p = (void *)0x10000000032;
        LODWORD(v42) = 128;
        HIDWORD(v42) = a2;
        *(_DWORD *)v43 = v25;
        *(_QWORD *)&v43[4] = 0x400000100;
        v44 = 2;
        reranker::Reranker<float>::forward_fb((uint64_t)&__p, __Y, (const float *)v48, (float *)v45, (int *)v57);
        __p = 0;
        v42 = 0;
        *(_QWORD *)v43 = 0;
        std::vector<std::pair<float,long long>>::vector(&__p, v25);
        v28 = 0;
        v29 = (int *)v45;
        v30 = (float *)__p;
        v31 = 16 * v25;
        v32 = a4;
        do
        {
          v33 = *v29++;
          v34 = v33;
          v35 = *v32++;
          v36 = &v30[v28 / 4];
          *(_DWORD *)v36 = v34;
          *((_QWORD *)v36 + 1) = v35;
          v28 += 16;
        }
        while (v31 != v28);
        v37 = 126 - 2 * __clz(((char *)v42 - (char *)v30) >> 4);
        if (v42 == v30)
          v38 = 0;
        else
          v38 = v37;
        std::__introsort<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,false>((uint64_t)v30, v42, (uint64_t)&v58, v38, 1);
        v39 = 0;
        v40 = (float *)__p;
        do
        {
          *a4++ = *(_QWORD *)&v40[v39 / 4 + 2];
          v39 += 16;
        }
        while (v31 != v39);
        v42 = v40;
        operator delete(v40);
        if (v45)
        {
          v46 = v45;
          operator delete(v45);
        }
        if (v48)
        {
          v49 = v48;
          operator delete(v48);
        }
        if (__Y)
        {
          v52 = __Y;
          operator delete(__Y);
        }
      }
    }
  }
  if (*(_DWORD *)(a7 + 8) && *(_DWORD *)(a7 + 12))
    return 11;
  else
    return 0;
}

void sub_247980F3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a16)
    operator delete(a16);
  if (a19)
    operator delete(a19);
  _Unwind_Resume(exception_object);
}

void reranker::Reranker<float>::forward_fb(uint64_t a1, float *__Y, const float *a3, float *a4, int *a5)
{
  unsigned __int16 *v9;
  uint64_t v10;
  unsigned __int16 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
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
  const float *v29;
  unint64_t v30;
  unsigned __int16 *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  const float *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  const float *v45;
  unint64_t v46;
  uint64_t v47;
  void *__p;
  void *v49;
  uint64_t v50;
  float *__C;
  float *v52;
  uint64_t v53;
  float *v54;
  float *v55;
  uint64_t v56;

  v9 = (unsigned __int16 *)((char *)a5 - *a5);
  if (*v9 < 9u)
  {
    v10 = 0;
  }
  else
  {
    v10 = v9[4];
    if (v10)
      v10 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v10);
  }
  cblas_saxpy(*(_DWORD *)(a1 + 12) * *(_DWORD *)(a1 + 4), 1.0, (const float *)(v10 + 4 * (*(_DWORD *)a1 - *(_DWORD *)(a1 + 12)) * *(_DWORD *)(a1 + 4) + 4), 1, __Y, 1);
  v11 = (unsigned __int16 *)((char *)a5 - *a5);
  v12 = *v11;
  v45 = a3;
  if (v12 < 0x53)
  {
    if (v12 < 0x4F)
    {
      v40 = 0;
      v41 = 4;
      v21 = 4;
      v22 = 4;
      v19 = 4;
      v44 = 4;
      v15 = 4;
      v17 = 4;
      v43 = 4;
      v16 = 4;
      goto LABEL_45;
    }
    v16 = 4;
    v43 = 4;
    v17 = 4;
    v15 = 4;
    v44 = 4;
    goto LABEL_36;
  }
  v13 = v11[41];
  if (v11[41])
    v13 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v13);
  v44 = v13 + 4;
  if (v12 < 0x59)
  {
    v15 = 4;
    if (v12 >= 0x55)
      goto LABEL_15;
    v15 = 4;
    v16 = 4;
    v43 = 4;
    v17 = 4;
LABEL_36:
    v19 = 4;
    goto LABEL_37;
  }
  v14 = v11[44];
  if (v11[44])
    v14 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v14);
  v15 = v14 + 4;
LABEL_15:
  v18 = v11[42];
  if (v11[42])
    v18 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v18);
  v19 = v18 + 4;
  if (v12 < 0x5B)
  {
    v17 = 4;
    if (v12 >= 0x57)
      goto LABEL_23;
    v17 = 4;
    v16 = 4;
    v43 = 4;
LABEL_37:
    v22 = 4;
    goto LABEL_38;
  }
  v20 = v11[45];
  if (v11[45])
    v20 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v20);
  v17 = v20 + 4;
LABEL_23:
  v23 = v11[43];
  if (v11[43])
    v23 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v23);
  v22 = v23 + 4;
  if (v12 < 0x5D)
  {
    v16 = 4;
    v43 = 4;
  }
  else
  {
    v24 = v11[46];
    if (v11[46])
      v24 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v24);
    v43 = v24 + 4;
    if (v12 >= 0x5F)
    {
      v25 = v11[47];
      if (v11[47])
        v25 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v25);
      v21 = v25 + 4;
      if (v12 < 0x61)
      {
        v26 = 0;
      }
      else
      {
        v26 = v11[48];
        if (v11[48])
          v26 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v26);
      }
      v16 = v26 + 4;
      goto LABEL_39;
    }
    v16 = 4;
  }
LABEL_38:
  v21 = 4;
LABEL_39:
  v27 = v11[39];
  if (v11[39])
    v27 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v27);
  v41 = v27 + 4;
  if (v12 >= 0x51 && (v28 = v11[40]) != 0)
    v40 = (const float *)((char *)a5 + v28 + *(unsigned int *)((char *)a5 + v28));
  else
    v40 = 0;
LABEL_45:
  v54 = 0;
  v55 = 0;
  v56 = 0;
  std::vector<float>::vector(&v54, *(int *)(a1 + 4) * (uint64_t)*(int *)(a1 + 16));
  v29 = v54;
  v30 = *(unsigned int *)(a1 + 12) | ((unint64_t)*(unsigned int *)(a1 + 24) << 32);
  __C = (float *)(*(unsigned int *)(a1 + 4) | ((unint64_t)*(unsigned int *)(a1 + 16) << 32));
  v52 = (float *)v30;
  reranker::MultiHeadAttention<float>::forward((int *)&__C, v45, __Y, __Y, v54, (const float *)v44, (const float *)v15, (const float *)v19, (float *)v17, (const float *)v22, (const float *)v43, (const float *)v21, (const float *)v16);
  __C = 0;
  v52 = 0;
  v53 = 0;
  std::vector<float>::vector(&__C, *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 16));
  v31 = (unsigned __int16 *)((char *)a5 - *a5);
  v32 = *v31;
  if (v32 < 0xB)
  {
    v35 = 0;
    v34 = 4;
  }
  else
  {
    v33 = v31[5];
    if (v31[5])
      v33 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v33);
    v34 = v33 + 4;
    if (v32 < 0xD)
    {
      v35 = 0;
    }
    else
    {
      v35 = v31[6];
      if (v35)
        v35 += (uint64_t)a5 + *(unsigned int *)((char *)a5 + v35);
    }
  }
  v36 = *(_DWORD *)(a1 + 16);
  __p = *(void **)(a1 + 4);
  LODWORD(v49) = v36;
  reranker::Linear::forward((reranker::Linear *)&__p, v29, __C, (const float *)v34, (const float *)(v35 + 4));
  __p = 0;
  v49 = 0;
  v50 = 0;
  std::vector<float>::vector(&__p, *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 16));
  v37 = *(_QWORD *)(a1 + 20);
  v46 = *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned int *)(a1 + 16) << 32);
  v47 = v37;
  reranker::EncoderLayer<float>::forward((unsigned int *)&v46, __C, (float *)__p, a5, 0);
  v38 = *(_QWORD *)(a1 + 20);
  v46 = *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned int *)(a1 + 16) << 32);
  v47 = v38;
  reranker::EncoderLayer<float>::forward((unsigned int *)&v46, (const float *)__p, __C, a5, 1);
  v39 = *(_DWORD *)(a1 + 16);
  v46 = *(unsigned int *)(a1 + 8) | 0x100000000;
  LODWORD(v47) = v39;
  reranker::Linear::forward((reranker::Linear *)&v46, __C, a4, (const float *)v41, v40 + 1);
  if (__p)
  {
    v49 = __p;
    operator delete(__p);
  }
  if (__C)
  {
    v52 = __C;
    operator delete(__C);
  }
  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
}

void sub_247981454(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,void *a26,uint64_t a27)
{
  uint64_t v27;
  void *v29;

  if (__p)
    operator delete(__p);
  if (a26)
    operator delete(a26);
  v29 = *(void **)(v27 - 112);
  if (v29)
  {
    *(_QWORD *)(v27 - 104) = v29;
    operator delete(v29);
  }
  _Unwind_Resume(exception_object);
}

uint64_t verify_model_from_container_flatbuffer(unsigned int *a1, unint64_t a2)
{
  uint64_t result;
  int *v4;
  unsigned __int16 *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  result = 2;
  if (a1 && a2 >= 0xC)
  {
    v8[0] = a1;
    v8[1] = a2;
    v9 = xmmword_2479886C0;
    v10 = 0;
    v11 = 1;
    if (a2 >= 0x7FFFFFFF)
      verify_model_from_container_flatbuffer_cold_1();
    if (flatbuffers::Verifier::VerifyBufferFromStart<HashML::ModelContainer>((flatbuffers::Verifier *)v8, "HMFB", 0))
    {
      v4 = (int *)((char *)a1 + *a1);
      v5 = (unsigned __int16 *)((char *)v4 - *v4);
      if (*v5 < 0xDu || !v5[6])
        return 9;
      v6 = v5[5];
      if (v5[5])
        v6 = *(_QWORD *)((char *)v4 + v6);
      if (v6 == *(int *)((char *)v4 + v5[6] + *(unsigned int *)((char *)v4 + v5[6])))
      {
        if (v5[2] && *(_QWORD *)((char *)v4 + v5[2]) == 1 && (v7 = v5[3]) != 0 && *(uint64_t *)((char *)v4 + v7) > 0)
          return 0;
        else
          return 8;
      }
      else
      {
        return 9;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t verify_and_load_flatbuffer_from_file(const char *a1, unsigned int **a2, off_t *a3)
{
  uint64_t result;

  result = flatbuffer_from_file(a1, a2, a3);
  if (!(_DWORD)result)
    return verify_model_from_container_flatbuffer(*a2, *a3);
  return result;
}

uint64_t flatbuffer_from_file(const char *a1, _QWORD *a2, off_t *a3)
{
  ssize_t v6;
  stat *v7;
  int v8;
  int v9;
  void *v10;
  uint64_t result;
  stat v12;
  stat v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  memset(&v12, 0, sizeof(v12));
  stat(a1, &v12);
  if ((v12.st_mode & 0xF000) == 0xA000)
  {
    bzero(&v13, 0x400uLL);
    v6 = readlink(a1, (char *)&v13, 0x3FFuLL);
    if (v6 < 0)
      return 1;
    *((_BYTE *)&v13.st_dev + v6) = 0;
    v7 = &v13;
  }
  else
  {
    v7 = (stat *)a1;
  }
  v8 = open((const char *)v7, 0);
  v9 = v8;
  if (v8 < 0)
    return 5;
  memset(&v13, 0, sizeof(v13));
  if (fstat(v8, &v13) < 0)
    return 5;
  v10 = mmap(0, v13.st_size, 1, 1, v9, 0);
  result = 0;
  *a2 = v10;
  *a3 = v13.st_size;
  return result;
}

uint64_t query_lsh_flatbuffer_from_file(uint64_t *a1, int a2, int a3, _QWORD *a4, const char *a5, int a6)
{
  uint64_t result;
  int *v12;
  unsigned __int16 *v13;
  uint64_t v14;
  char *v15;
  _OWORD v16[10];
  __int128 v17;
  size_t v18;
  unsigned int *v19;
  unsigned int v20;

  v18 = 0;
  v19 = 0;
  result = verify_and_load_flatbuffer_from_file(a5, &v19, (off_t *)&v18);
  v20 = result;
  if (!(_DWORD)result)
  {
    v12 = (int *)((char *)v19 + *v19);
    v17 = 0u;
    memset(v16, 0, sizeof(v16));
    v13 = (unsigned __int16 *)((char *)v12 - *v12);
    if (*v13 >= 0xDu && (v14 = v13[6]) != 0)
      v15 = (char *)v12 + v14 + *(unsigned int *)((char *)v12 + v14);
    else
      v15 = 0;
    CLSHInfer::CLSHInfer((uint64_t)v16, (int *)&v15[*((unsigned int *)v15 + 1) + 4]);
    DWORD2(v17) = a6;
    CLSHInfer::search((uint64_t)v16, a1, a2, a3, a4, &v20);
    munmap(v19, v18);
    return v20;
  }
  return result;
}

uint64_t retrieval_flatbuffer_from_file(uint64_t *a1, int a2, int a3, uint64_t *a4, const char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  int *v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned __int16 *v19;
  uint64_t v20;
  unsigned __int16 *v21;
  uint64_t v22;
  int v23;
  size_t v25;
  unsigned int *v26;

  if (!a7)
    return 7;
  v25 = 0;
  v26 = 0;
  v13 = verify_and_load_flatbuffer_from_file(a5, &v26, (off_t *)&v25);
  if ((_DWORD)v13)
  {
    v14 = v13;
    *(_QWORD *)(a7 + 16) = 0;
    *(_DWORD *)(a7 + 24) = 0;
    if ((v13 & 0xFFFFFFFE) == 8)
    {
      v15 = (int *)((char *)v26 + *v26);
      v16 = (unsigned __int16 *)((char *)v15 - *v15);
      if (*v16 < 5u)
      {
        LODWORD(v17) = 0;
      }
      else
      {
        v17 = v16[2];
        if (v17)
          LODWORD(v17) = *(int *)((char *)v15 + v17);
      }
      *(_DWORD *)(a7 + 16) = v17;
      v19 = (unsigned __int16 *)((char *)v15 - *v15);
      if (*v19 < 7u)
      {
        LODWORD(v20) = 0;
      }
      else
      {
        v20 = v19[3];
        if (v20)
          LODWORD(v20) = *(int *)((char *)v15 + v20);
      }
      *(_DWORD *)(a7 + 20) = v20;
      v21 = (unsigned __int16 *)((char *)v15 - *v15);
      if (*v21 >= 9u && (v22 = v21[4]) != 0)
        v23 = *(int *)((char *)v15 + v22);
      else
        v23 = 0;
      *(_DWORD *)(a7 + 24) = v23;
    }
  }
  else
  {
    v18 = v26;
    v14 = retrieval_flatbuffer(a1, a2, a3, a4, v26, a6, a7);
    munmap(v18, v25);
  }
  return v14;
}

uint64_t emb_query_lsh_flatbuffer(const float *a1, int a2, void *a3, unsigned int *a4)
{
  int *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  char *v10;
  int *v11;
  unsigned int v13;
  _OWORD v14[11];

  v7 = (int *)((char *)a4 + *a4);
  v8 = (unsigned __int16 *)((char *)v7 - *v7);
  if (*v8 >= 0xDu && (v9 = v8[6]) != 0)
    v10 = (char *)v7 + v9 + *(unsigned int *)((char *)v7 + v9);
  else
    v10 = 0;
  v11 = (int *)&v10[*((unsigned int *)v10 + 1) + 4];
  memset(v14, 0, sizeof(v14));
  CLSHInfer::CLSHInfer((uint64_t)v14, v11);
  v13 = 0;
  CLSHInfer::search((uint64_t)v14, a1, a2, a3, &v13);
  return v13;
}

uint64_t emb_query_lsh_flatbuffer_from_file(const float *a1, int a2, void *a3, const char *a4)
{
  uint64_t result;
  int *v8;
  unsigned __int16 *v9;
  uint64_t v10;
  char *v11;
  _OWORD v12[11];
  size_t v13;
  unsigned int *v14;
  unsigned int v15;

  v13 = 0;
  v14 = 0;
  result = verify_and_load_flatbuffer_from_file(a4, &v14, (off_t *)&v13);
  v15 = result;
  if (!(_DWORD)result)
  {
    v8 = (int *)((char *)v14 + *v14);
    memset(v12, 0, sizeof(v12));
    v9 = (unsigned __int16 *)((char *)v8 - *v8);
    if (*v9 >= 0xDu && (v10 = v9[6]) != 0)
      v11 = (char *)v8 + v10 + *(unsigned int *)((char *)v8 + v10);
    else
      v11 = 0;
    CLSHInfer::CLSHInfer((uint64_t)v12, (int *)&v11[*((unsigned int *)v11 + 1) + 4]);
    CLSHInfer::search((uint64_t)v12, a1, a2, a3, &v15);
    munmap(v14, v13);
    return v15;
  }
  return result;
}

uint64_t emb_lookup_flatbuffer(uint64_t *a1, int a2, char *a3, unsigned int *a4, int a5)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  _OWORD v16[11];

  LODWORD(v7) = a2;
  v9 = *a4;
  memset(v16, 0, sizeof(v16));
  CLSHInfer::CLSHInfer((uint64_t)v16, (int *)((char *)a4 + v9));
  v10 = SHIDWORD(v16[0]);
  if (a5)
  {
    bzero(a3, 4 * SHIDWORD(v16[0]));
    if ((int)v7 >= 1)
    {
      v11 = v7;
      do
      {
        v12 = *a1++;
        CLSHInfer::emb_lookup_accumulate((CLSHInfer *)v16, v12, (float *)a3);
        --v11;
      }
      while (v11);
    }
    if (a5 == 2)
    {
      v13 = 1.0 / (double)(int)v7;
      cblas_sscal(v10, v13, (float *)a3, 1);
    }
  }
  else if ((int)v7 >= 1)
  {
    v7 = v7;
    do
    {
      v14 = *a1++;
      CLSHInfer::emb_lookup((CLSHInfer *)v16, v14, (float *)a3);
      a3 += 4 * v10;
      --v7;
    }
    while (v7);
  }
  return 0;
}

uint64_t emb_lookup_flatbuffer_from_file(uint64_t *a1, int a2, char *a3, const char *a4, int a5)
{
  uint64_t v7;
  uint64_t v9;
  int *v10;
  unsigned __int16 *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  _OWORD v20[11];
  size_t v21;
  unsigned int *v22;

  LODWORD(v7) = a2;
  v21 = 0;
  v22 = 0;
  v9 = verify_and_load_flatbuffer_from_file(a4, &v22, (off_t *)&v21);
  if (!(_DWORD)v9)
  {
    v10 = (int *)((char *)v22 + *v22);
    memset(v20, 0, sizeof(v20));
    v11 = (unsigned __int16 *)((char *)v10 - *v10);
    if (*v11 >= 0xDu && (v12 = v11[6]) != 0)
      v13 = (char *)v10 + v12 + *(unsigned int *)((char *)v10 + v12);
    else
      v13 = 0;
    CLSHInfer::CLSHInfer((uint64_t)v20, (int *)&v13[*((unsigned int *)v13 + 1) + 4]);
    v14 = SHIDWORD(v20[0]);
    if (a5)
    {
      bzero(a3, 4 * SHIDWORD(v20[0]));
      if ((int)v7 >= 1)
      {
        v15 = v7;
        do
        {
          v16 = *a1++;
          CLSHInfer::emb_lookup_accumulate((CLSHInfer *)v20, v16, (float *)a3);
          --v15;
        }
        while (v15);
      }
      if (a5 == 2)
      {
        v17 = 1.0 / (double)(int)v7;
        cblas_sscal(v14, v17, (float *)a3, 1);
      }
    }
    else if ((int)v7 >= 1)
    {
      v7 = v7;
      do
      {
        v18 = *a1++;
        CLSHInfer::emb_lookup((CLSHInfer *)v20, v18, (float *)a3);
        a3 += 4 * v14;
        --v7;
      }
      while (v7);
    }
    munmap(v22, v21);
  }
  return v9;
}

uint64_t fnv_1a_64(char *a1, int a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    result = 0xCBF29CE484222325;
    if (a2 >= 1000)
      v4 = 1000;
    else
      v4 = a2;
    if ((_DWORD)v4)
    {
      do
      {
        v5 = *a1++;
        result = 0x100000001B3 * (result ^ v5);
        --v4;
      }
      while (v4);
    }
  }
  return result;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::vector<int>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_251905070, MEMORY[0x24BEDAAF0]);
}

void sub_247981E2C(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,std::pair<int,int>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(12 * a2);
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,false>(int *a1, int *a2, uint64_t a3, uint64_t a4, char a5)
{
  int *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int *v15;
  int *v16;
  int *v17;
  int v18;
  uint64_t v19;
  unsigned __int8 v20;
  int *v21;
  __n128 v22;
  int *v23;
  char v24;
  BOOL v25;
  unsigned __int8 v26;
  int v27;
  int v28;
  int v29;

LABEL_1:
  v8 = a2 - 3;
  v9 = a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = 0xAAAAAAAAAAAAAAABLL * (a2 - v9);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v26 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v8, (uint64_t)v9);
        if (v26 != 129 && (char)v26 < 0)
        {
          v27 = *v9;
          *v9 = *(a2 - 3);
          *(a2 - 3) = v27;
          v28 = v9[1];
          v9[1] = *(a2 - 2);
          *(a2 - 2) = v28;
          v29 = v9[2];
          v9[2] = *(a2 - 1);
          *(a2 - 1) = v29;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v9, v9 + 3, v8);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v9, v9 + 3, v9 + 6, v8);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v9, v9 + 3, v9 + 6, v9 + 9, v8);
        return;
      default:
        if (v12 <= 287)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)v9, (uint64_t)a2);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)v9, (uint64_t)a2);
          return;
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[3 * (v13 >> 1)];
          if ((unint64_t)v12 < 0x601)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(&v9[3 * (v13 >> 1)], v9, v8);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v9, &v9[3 * (v13 >> 1)], v8);
            v16 = v8;
            v17 = &v9[3 * v14];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v9 + 3, v17 - 3, a2 - 6);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v9 + 6, &v9[3 * v14 + 3], a2 - 9);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v17 - 3, v15, &v9[3 * v14 + 3]);
            v18 = *v9;
            *v9 = *v15;
            *v15 = v18;
            v19 = *(_QWORD *)(v9 + 1);
            *(_QWORD *)(v9 + 1) = *(_QWORD *)(v17 + 1);
            *(_QWORD *)(v17 + 1) = v19;
            v8 = v16;
          }
          if ((a5 & 1) == 0)
          {
            v20 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)(v9 - 3), (uint64_t)v9);
            if (v20 == 129 || ((char)v20 & 0x80000000) == 0)
            {
              v9 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,std::pair<int,int>> *,std::__less<void,void> &>(v9, a2);
              goto LABEL_17;
            }
          }
          v22.n128_f32[0] = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,std::pair<int,int>> *,std::__less<void,void> &>(v9, (unint64_t)a2);
          v23 = v21;
          if ((v24 & 1) == 0)
            goto LABEL_15;
          v25 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v9, v21);
          v9 = v23 + 3;
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(v23 + 3, a2))
          {
            v10 = v11 + 1;
            if (v25)
              continue;
LABEL_15:
            std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,false>(a1, v23, a3, -v11, a5 & 1, v22);
            v9 = v23 + 3;
LABEL_17:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = v23;
          if (v25)
            return;
          goto LABEL_1;
        }
        if (v9 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,std::pair<float,std::pair<int,int>> *>((char *)v9, (char *)a2, (char *)a2, a3);
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  int v12;
  _DWORD *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  if (result != a2)
  {
    v17 = v2;
    v18 = v3;
    v5 = (_DWORD *)result;
    v6 = result + 12;
    if (result + 12 != a2)
    {
      v7 = 0;
      v8 = result;
      do
      {
        v9 = v8;
        v8 = v6;
        result = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(v6, v9);
        if (result != 129 && (char)result < 0)
        {
          v15 = *(_QWORD *)v8;
          v16 = *(_DWORD *)(v8 + 8);
          v10 = v7;
          while (1)
          {
            v11 = (_DWORD *)((char *)v5 + v10);
            v11[3] = *(_DWORD *)((char *)v5 + v10);
            v12 = *(_DWORD *)((char *)v5 + v10 + 8);
            v11[4] = *(_DWORD *)((char *)v5 + v10 + 4);
            v11[5] = v12;
            if (!v10)
              break;
            v10 -= 12;
            result = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v15, (uint64_t)v5 + v10);
            if (result == 129 || ((char)result & 0x80000000) == 0)
            {
              v13 = (_DWORD *)((char *)v5 + v10 + 12);
              goto LABEL_12;
            }
          }
          v13 = v5;
LABEL_12:
          *v13 = v15;
          v14 = v16;
          v13[1] = HIDWORD(v15);
          v13[2] = v14;
        }
        v6 = v8 + 12;
        v7 += 12;
      }
      while (v8 + 12 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  _DWORD *v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  if (result != a2)
  {
    v14 = v2;
    v15 = v3;
    v5 = result;
    v6 = result + 12;
    if (result + 12 != a2)
    {
      v7 = (_DWORD *)(result - 12);
      do
      {
        v8 = v5;
        v5 = v6;
        result = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(v6, v8);
        if (result != 129 && (char)result < 0)
        {
          v12 = *(_QWORD *)v5;
          v13 = *(_DWORD *)(v5 + 8);
          v9 = v7;
          do
          {
            v9[6] = v9[3];
            v10 = v9[5];
            v9[7] = v9[4];
            v9[8] = v10;
            result = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v12, (uint64_t)v9);
            v9 -= 3;
          }
          while (result != 129 && (char)result < 0);
          v9[6] = v12;
          v11 = v13;
          v9[7] = HIDWORD(v12);
          v9[8] = v11;
        }
        v6 = v5 + 12;
        v7 += 3;
      }
      while (v5 + 12 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(int *a1, int *a2, int *a3)
{
  unsigned __int8 v6;
  unsigned __int8 v7;
  _BOOL4 v9;
  int *v10;
  int v11;
  int v12;
  int *v13;
  uint64_t result;
  int v15;
  int v16;
  int v17;
  unsigned __int8 v18;
  int v19;
  int v20;
  int v21;
  int v22;
  unsigned __int8 v23;
  int v24;
  int v25;
  int v26;

  v6 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a2, (uint64_t)a1);
  v7 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a3, (uint64_t)a2);
  v9 = v7 != 129 && (v7 & 0x80u) != 0;
  if (v6 == 129 || ((char)v6 & 0x80000000) == 0)
  {
    if (v9)
    {
      v15 = *a2;
      *a2 = *a3;
      *a3 = v15;
      v16 = a2[1];
      a2[1] = a3[1];
      a3[1] = v16;
      v13 = a2 + 2;
      v17 = a2[2];
      a2[2] = a3[2];
      a3[2] = v17;
      v18 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a2, (uint64_t)a1);
      result = 1;
      if (v18 != 129 && (char)v18 < 0)
      {
        v19 = *a1;
        *a1 = *a2;
        *a2 = v19;
        v20 = a1[1];
        a1[1] = a2[1];
        a2[1] = v20;
        v10 = a1 + 2;
LABEL_18:
        result = 2;
        goto LABEL_19;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v10 = a1 + 2;
    v11 = *a1;
    if (v9)
    {
      *a1 = *a3;
      *a3 = v11;
      v12 = a1[1];
      a1[1] = a3[1];
      a3[1] = v12;
      v13 = a3 + 2;
      result = 1;
LABEL_19:
      v26 = *v10;
      *v10 = *v13;
      *v13 = v26;
      return result;
    }
    *a1 = *a2;
    *a2 = v11;
    v21 = a1[1];
    a1[1] = a2[1];
    a2[1] = v21;
    v10 = a2 + 2;
    v22 = a1[2];
    a1[2] = a2[2];
    a2[2] = v22;
    v23 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a3, (uint64_t)a2);
    result = 1;
    if (v23 != 129 && (char)v23 < 0)
    {
      v24 = *a2;
      *a2 = *a3;
      *a3 = v24;
      v25 = a2[1];
      a2[1] = a3[1];
      a3[1] = v25;
      v13 = a3 + 2;
      goto LABEL_18;
    }
  }
  return result;
}

int *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,std::pair<int,int>> *,std::__less<void,void> &>(int *a1, int *a2)
{
  int *v2;
  unsigned __int8 v4;
  int *v5;
  unsigned __int8 v6;
  unint64_t v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  int v10;
  int v11;
  int v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  uint64_t v16;
  int v17;

  v2 = a2;
  v16 = *(_QWORD *)a1;
  v17 = a1[2];
  v4 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)(a2 - 3));
  if (v4 == 129 || ((char)v4 & 0x80000000) == 0)
  {
    v7 = (unint64_t)(a1 + 3);
    do
    {
      v5 = (int *)v7;
      if (v7 >= (unint64_t)v2)
        break;
      v8 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, v7);
      v7 = (unint64_t)(v5 + 3);
    }
    while (v8 == 129 || ((char)v8 & 0x80000000) == 0);
  }
  else
  {
    v5 = a1;
    do
    {
      do
      {
        v5 += 3;
        v6 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)v5);
      }
      while (v6 == 129);
    }
    while (((char)v6 & 0x80000000) == 0);
  }
  if (v5 < v2)
  {
    do
    {
      v2 -= 3;
      v9 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)v2);
    }
    while (v9 != 129 && (char)v9 < 0);
  }
  while (v5 < v2)
  {
    v10 = *v5;
    *v5 = *v2;
    *v2 = v10;
    v11 = v5[1];
    v5[1] = v2[1];
    v2[1] = v11;
    v12 = v5[2];
    v5[2] = v2[2];
    v2[2] = v12;
    do
    {
      do
      {
        v5 += 3;
        v13 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)v5);
      }
      while (v13 == 129);
    }
    while (((char)v13 & 0x80000000) == 0);
    do
    {
      v2 -= 3;
      v14 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v16, (uint64_t)v2);
    }
    while (v14 != 129 && (char)v14 < 0);
  }
  if (v5 - 3 != a1)
  {
    *a1 = *(v5 - 3);
    a1[1] = *(v5 - 2);
    a1[2] = *(v5 - 1);
  }
  *(_QWORD *)(v5 - 3) = v16;
  *(v5 - 1) = v17;
  return v5;
}

float std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,std::pair<int,int>> *,std::__less<void,void> &>(int *a1, unint64_t a2)
{
  uint64_t v4;
  unsigned __int8 v5;
  unint64_t v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  int *v9;
  int *v10;
  int v11;
  int v12;
  int v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  float result;
  uint64_t v17;
  int v18;

  v4 = 0;
  v17 = *(_QWORD *)a1;
  v18 = a1[2];
  do
  {
    v4 += 3;
    v5 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&a1[v4], (uint64_t)&v17);
  }
  while (v5 != 129 && (char)v5 < 0);
  v6 = (unint64_t)&a1[v4];
  if (v4 == 3)
  {
    while (v6 < a2)
    {
      a2 -= 12;
      v8 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(a2, (uint64_t)&v17);
      if (v8 != 129 && (char)v8 < 0)
        break;
    }
  }
  else
  {
    do
    {
      do
      {
        a2 -= 12;
        v7 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(a2, (uint64_t)&v17);
      }
      while (v7 == 129);
    }
    while (((char)v7 & 0x80000000) == 0);
  }
  if (v6 >= a2)
  {
    v10 = &a1[v4];
  }
  else
  {
    v9 = (int *)a2;
    v10 = &a1[v4];
    do
    {
      v11 = *v10;
      *v10 = *v9;
      *v9 = v11;
      v12 = v10[1];
      v10[1] = v9[1];
      v9[1] = v12;
      v13 = v10[2];
      v10[2] = v9[2];
      v9[2] = v13;
      do
      {
        v10 += 3;
        v14 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v10, (uint64_t)&v17);
      }
      while (v14 != 129 && (char)v14 < 0);
      do
      {
        do
        {
          v9 -= 3;
          v15 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v9, (uint64_t)&v17);
        }
        while (v15 == 129);
      }
      while (((char)v15 & 0x80000000) == 0);
    }
    while (v10 < v9);
  }
  if (v10 - 3 != a1)
  {
    *a1 = *(v10 - 3);
    a1[1] = *(v10 - 2);
    a1[2] = *(v10 - 1);
  }
  result = *(float *)&v17;
  *(_QWORD *)(v10 - 3) = v17;
  *(v10 - 1) = v18;
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(int *a1, int *a2)
{
  unint64_t v4;
  _BOOL8 result;
  unsigned __int8 v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned __int8 v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  unsigned __int8 v18;
  int *v19;
  int v20;
  uint64_t v21;
  int v22;

  v4 = 0xAAAAAAAAAAAAAAABLL * (a2 - a1);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)(a2 - 3), (uint64_t)a1);
      result = 1;
      if (v6 != 129 && (char)v6 < 0)
      {
        v7 = *a1;
        *a1 = *(a2 - 3);
        *(a2 - 3) = v7;
        v8 = a1[1];
        a1[1] = *(a2 - 2);
        *(a2 - 2) = v8;
        v9 = a1[2];
        a1[2] = *(a2 - 1);
        *(a2 - 1) = v9;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a1 + 3, a2 - 3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a1 + 3, a1 + 6, a2 - 3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a1 + 3, a1 + 6, a1 + 9, a2 - 3);
      return 1;
    default:
      v10 = (uint64_t)(a1 + 6);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a1 + 3, a1 + 6);
      v11 = (uint64_t)(a1 + 9);
      if (a1 + 9 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(v11, v10);
    if (v14 != 129 && (char)v14 < 0)
    {
      v21 = *(_QWORD *)v11;
      v22 = *(_DWORD *)(v11 + 8);
      v15 = v12;
      while (1)
      {
        v16 = (int *)((char *)a1 + v15);
        v16[9] = *(int *)((char *)a1 + v15 + 24);
        v17 = *(int *)((char *)a1 + v15 + 32);
        v16[10] = *(int *)((char *)a1 + v15 + 28);
        v16[11] = v17;
        if (v15 == -24)
          break;
        v18 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&v21, (uint64_t)(v16 + 3));
        v15 -= 12;
        if (v18 == 129 || ((char)v18 & 0x80000000) == 0)
        {
          v19 = (int *)((char *)a1 + v15 + 36);
          goto LABEL_15;
        }
      }
      v19 = a1;
LABEL_15:
      *v19 = v21;
      v20 = v22;
      v19[1] = HIDWORD(v21);
      v19[2] = v20;
      if (++v13 == 8)
        return v11 + 12 == (_QWORD)a2;
    }
    v10 = v11;
    v12 += 12;
    v11 += 12;
    if ((int *)v11 == a2)
      return 1;
  }
}

uint64_t std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  BOOL v5;
  char v6;
  int v7;
  int v8;
  BOOL v9;

  if (*(float *)a1 == *(float *)a2)
    LODWORD(v2) = 0;
  else
    LODWORD(v2) = -127;
  if (*(float *)a1 > *(float *)a2)
    LODWORD(v2) = 1;
  if (*(float *)a1 < *(float *)a2)
    v2 = 0xFFFFFFFFLL;
  else
    v2 = v2;
  if (!(_DWORD)v2)
  {
    v3 = *(_DWORD *)(a1 + 4);
    v4 = *(_DWORD *)(a2 + 4);
    v5 = v3 == v4;
    if (v3 < v4)
      v6 = -1;
    else
      v6 = 1;
    if (v5)
    {
      v7 = *(_DWORD *)(a1 + 8);
      v8 = *(_DWORD *)(a2 + 8);
      v9 = v7 == v8;
      if (v7 < v8)
        v6 = -1;
      else
        v6 = 1;
      if (v9)
        v6 = 0;
    }
    if (v6)
      return (v6 >> 7) | 1u;
    else
      return 0;
  }
  return v2;
}

float std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(int *a1, int *a2, int *a3, int *a4)
{
  unsigned __int8 v8;
  float result;
  int v10;
  int v11;
  int v12;
  unsigned __int8 v13;
  int v14;
  int v15;
  int v16;
  unsigned __int8 v17;
  int v18;
  int v19;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a2, a3);
  v8 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a4, (uint64_t)a3);
  if (v8 != 129 && (char)v8 < 0)
  {
    v10 = *a3;
    *a3 = *a4;
    *a4 = v10;
    v11 = a3[1];
    a3[1] = a4[1];
    a4[1] = v11;
    v12 = a3[2];
    a3[2] = a4[2];
    a4[2] = v12;
    v13 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a3, (uint64_t)a2);
    if (v13 != 129 && (char)v13 < 0)
    {
      v14 = *a2;
      *a2 = *a3;
      *a3 = v14;
      v15 = a2[1];
      a2[1] = a3[1];
      a3[1] = v15;
      v16 = a2[2];
      a2[2] = a3[2];
      a3[2] = v16;
      v17 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a2, (uint64_t)a1);
      if (v17 != 129 && (char)v17 < 0)
      {
        result = *(float *)a1;
        *a1 = *a2;
        *(float *)a2 = result;
        v18 = a1[1];
        a1[1] = a2[1];
        a2[1] = v18;
        v19 = a1[2];
        a1[2] = a2[2];
        a2[2] = v19;
      }
    }
  }
  return result;
}

float std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(int *a1, int *a2, int *a3, int *a4, int *a5)
{
  unsigned __int8 v10;
  float result;
  int v12;
  int v13;
  int v14;
  unsigned __int8 v15;
  int v16;
  int v17;
  int v18;
  unsigned __int8 v19;
  int v20;
  int v21;
  int v22;
  unsigned __int8 v23;
  int v24;
  int v25;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a2, a3, a4);
  v10 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a5, (uint64_t)a4);
  if (v10 != 129 && (char)v10 < 0)
  {
    v12 = *a4;
    *a4 = *a5;
    *a5 = v12;
    v13 = a4[1];
    a4[1] = a5[1];
    a5[1] = v13;
    v14 = a4[2];
    a4[2] = a5[2];
    a5[2] = v14;
    v15 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a4, (uint64_t)a3);
    if (v15 != 129 && (char)v15 < 0)
    {
      v16 = *a3;
      *a3 = *a4;
      *a4 = v16;
      v17 = a3[1];
      a3[1] = a4[1];
      a4[1] = v17;
      v18 = a3[2];
      a3[2] = a4[2];
      a4[2] = v18;
      v19 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a3, (uint64_t)a2);
      if (v19 != 129 && (char)v19 < 0)
      {
        v20 = *a2;
        *a2 = *a3;
        *a3 = v20;
        v21 = a2[1];
        a2[1] = a3[1];
        a3[1] = v21;
        v22 = a2[2];
        a2[2] = a3[2];
        a3[2] = v22;
        v23 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)a2, (uint64_t)a1);
        if (v23 != 129 && (char)v23 < 0)
        {
          result = *(float *)a1;
          *a1 = *a2;
          *(float *)a2 = result;
          v24 = a1[1];
          a1[1] = a2[1];
          a2[1] = v24;
          v25 = a1[2];
          a1[2] = a2[2];
          a2[2] = v25;
        }
      }
    }
  }
  return result;
}

char *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *,std::pair<float,std::pair<int,int>> *>(char *a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  unsigned __int8 v15;
  int v16;
  int v17;
  int v18;
  int64_t v19;
  char *v20;
  int v21;
  int v22;
  int v23;
  char *v24;

  if (a1 != a2)
  {
    v8 = a2 - a1;
    v9 = (a2 - a1) / 12;
    if (a2 - a1 >= 13)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (uint64_t)&a1[12 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)a1, a4, v9, v12);
        v12 -= 12;
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
        v15 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v14, (uint64_t)a1);
        if (v15 != 129 && (char)v15 < 0)
        {
          v16 = *(_DWORD *)v14;
          *(_DWORD *)v14 = *(_DWORD *)a1;
          *(_DWORD *)a1 = v16;
          v17 = *((_DWORD *)v14 + 1);
          *((_DWORD *)v14 + 1) = *((_DWORD *)a1 + 1);
          *((_DWORD *)a1 + 1) = v17;
          v18 = *((_DWORD *)v14 + 2);
          *((_DWORD *)v14 + 2) = *((_DWORD *)a1 + 2);
          *((_DWORD *)a1 + 2) = v18;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)a1, a4, v9, (uint64_t)a1);
        }
        v14 += 12;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 13)
    {
      v19 = v8 / 0xCuLL;
      v20 = a2 - 12;
      do
      {
        v21 = *(_DWORD *)a1;
        v23 = *((_DWORD *)a1 + 1);
        v22 = *((_DWORD *)a1 + 2);
        v24 = (char *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(a1, a4, v19);
        if (v20 == v24)
        {
          *(_DWORD *)v24 = v21;
          *((_DWORD *)v24 + 1) = v23;
          *((_DWORD *)v24 + 2) = v22;
        }
        else
        {
          *(_DWORD *)v24 = *(_DWORD *)v20;
          *((_DWORD *)v24 + 1) = *((_DWORD *)v20 + 1);
          *((_DWORD *)v24 + 2) = *((_DWORD *)v20 + 2);
          *(_DWORD *)v20 = v21;
          *((_DWORD *)v20 + 1) = v23;
          *((_DWORD *)v20 + 2) = v22;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>((uint64_t)a1, (uint64_t)(v24 + 12), a4, 0xAAAAAAAAAAAAAAABLL * ((v24 + 12 - a1) >> 2));
        }
        v20 -= 12;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

float std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  float result;
  _DWORD *v17;
  uint64_t v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v23 = v4;
    v24 = v5;
    v7 = a4;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * ((a4 - a1) >> 2)))
    {
      v11 = (0x5555555555555556 * ((a4 - a1) >> 2)) | 1;
      v12 = (_DWORD *)(a1 + 12 * v11);
      v13 = 0x5555555555555556 * ((a4 - a1) >> 2) + 2;
      if (v13 < a3)
      {
        v14 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(a1 + 12 * v11, (uint64_t)(v12 + 3));
        if (v14 != 129 && (v14 & 0x80u) != 0)
        {
          v12 += 3;
          v11 = v13;
        }
      }
      v15 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v12, v7);
      if (v15 == 129 || ((char)v15 & 0x80000000) == 0)
      {
        v21 = *(_QWORD *)v7;
        v22 = *(_DWORD *)(v7 + 8);
        while (1)
        {
          v17 = v12;
          *(_DWORD *)v7 = *v12;
          *(_DWORD *)(v7 + 4) = v12[1];
          *(_DWORD *)(v7 + 8) = v12[2];
          if (v9 < v11)
            break;
          v18 = (2 * v11) | 1;
          v12 = (_DWORD *)(a1 + 12 * v18);
          v11 = 2 * v11 + 2;
          if (v11 >= a3)
          {
            v11 = v18;
          }
          else
          {
            v19 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>(a1 + 12 * v18, (uint64_t)(v12 + 3));
            if (v19 != 129 && (v19 & 0x80u) != 0)
              v12 += 3;
            else
              v11 = v18;
          }
          v20 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v12, (uint64_t)&v21);
          v7 = (uint64_t)v17;
          if (v20 != 129)
          {
            v7 = (uint64_t)v17;
            if ((char)v20 < 0)
              break;
          }
        }
        result = *(float *)&v21;
        *(_QWORD *)v17 = v21;
        v17[2] = v22;
      }
    }
  }
  return result;
}

_DWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;

  v5 = 0;
  v6 = a3 - 2;
  if (a3 < 2)
    v6 = a3 - 1;
  v7 = v6 >> 1;
  do
  {
    v8 = &a1[3 * v5 + 3];
    v9 = (2 * v5) | 1;
    v10 = 2 * v5 + 2;
    if (v10 < a3)
    {
      v11 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)&a1[3 * v5 + 3], (uint64_t)&a1[3 * v5 + 6]);
      if (v11 != 129 && (v11 & 0x80u) != 0)
      {
        v8 += 3;
        v9 = v10;
      }
    }
    *a1 = *v8;
    a1[1] = v8[1];
    a1[2] = v8[2];
    a1 = v8;
    v5 = v9;
  }
  while (v9 <= v7);
  return v8;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<float,std::pair<int,int>> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  unsigned __int8 v10;
  double result;
  _DWORD *v12;
  unsigned __int8 v13;
  _BYTE v14[12];
  uint64_t v15;
  uint64_t v16;

  if (a4 >= 2)
  {
    v15 = v4;
    v16 = v5;
    v7 = (unint64_t)(a4 - 2) >> 1;
    v8 = (_DWORD *)(a1 + 12 * v7);
    v9 = (_DWORD *)(a2 - 12);
    v10 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v8, a2 - 12);
    if (v10 != 129 && (char)v10 < 0)
    {
      *(_QWORD *)v14 = *(_QWORD *)v9;
      *(_DWORD *)&v14[8] = v9[2];
      do
      {
        v12 = v8;
        *v9 = *v8;
        v9[1] = v8[1];
        v9[2] = v8[2];
        if (!v7)
          break;
        v7 = (v7 - 1) >> 1;
        v8 = (_DWORD *)(a1 + 12 * v7);
        v13 = std::operator<=>[abi:ne180100]<float,std::pair<int,int>,float,std::pair<int,int>>((uint64_t)v8, (uint64_t)v14);
        if (v13 == 129)
          break;
        v9 = v12;
      }
      while ((char)v13 < 0);
      *v12 = *(_DWORD *)v14;
      result = *(double *)&v14[4];
      *(_QWORD *)(v12 + 1) = *(_QWORD *)&v14[4];
    }
  }
  return result;
}

uint64_t *std::back_insert_iterator<std::vector<int>>::operator=[abi:ne180100](uint64_t *a1, _DWORD *a2)
{
  uint64_t v4;
  _DWORD *v5;
  _QWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;

  v4 = *a1;
  v5 = *(_DWORD **)(*a1 + 8);
  v6 = (_QWORD *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    v8 = *(_DWORD **)v4;
    v9 = ((uint64_t)v5 - *(_QWORD *)v4) >> 2;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v6, v12);
      v8 = *(_DWORD **)v4;
      v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[4 * v9];
    v15 = &v13[4 * v12];
    *(_DWORD *)v14 = *a2;
    v7 = v14 + 4;
    while (v5 != v8)
    {
      v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(_QWORD *)v4 = v14;
    *(_QWORD *)(v4 + 8) = v7;
    *(_QWORD *)(v4 + 16) = v15;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v5 = *a2;
    v7 = v5 + 1;
  }
  *(_QWORD *)(v4 + 8) = v7;
  return a1;
}

int *std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<int *>,std::__wrap_iter<int *>,std::__equal_to &>(int *a1, int *a2)
{
  int *result;
  int *v4;
  int v5;
  int v6;
  int *v7;
  int v8;

  result = a2;
  if (a1 != a2)
  {
    v4 = a1 + 1;
    do
    {
      if (v4 == a2)
        return a2;
      v5 = *(v4 - 1);
      v6 = *v4++;
    }
    while (v5 != v6);
    v7 = v4 - 2;
    while (v4 != a2)
    {
      v8 = v5;
      v5 = *v4;
      if (v8 != *v4)
      {
        v7[1] = v5;
        ++v7;
      }
      ++v4;
    }
    return v7 + 1;
  }
  return result;
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *v5;
  int *value;
  int *end;
  std::vector<int>::pointer begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  int *v16;
  int *v17;
  int v18;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v9 = (char *)end - (char *)this->__begin_;
    v10 = __n + (v9 >> 2);
    if (v10 >> 62)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)p_end_cap, v13);
      begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

_QWORD *std::vector<long long>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long long>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_2479836D0(_Unwind_Exception *exception_object)
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

char *std::vector<long long>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<int>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  int v18;

  if (a4 >= 2)
  {
    v4 = (unint64_t)(a4 - 2) >> 1;
    v5 = result + 16 * v4;
    v6 = a2 - 16;
    v7 = *(float *)(a2 - 16);
    v8 = *(float *)v5;
    if (*(float *)v5 == v7)
      v9 = 0;
    else
      v9 = -127;
    if (*(float *)v5 > v7)
      v9 = 1;
    if (*(float *)v5 < v7)
      v9 = -1;
    if (v9
      || ((v10 = *(_QWORD *)(v5 + 8), v11 = *(_QWORD *)(a2 - 8), v12 = v10 == v11, v10 < v11)
        ? (LOBYTE(v9) = -1)
        : (LOBYTE(v9) = 1),
          !v12))
    {
      if ((char)v9 >= 1)
      {
        v13 = *(_QWORD *)(a2 - 8);
        do
        {
          v14 = v5;
          *(float *)v6 = v8;
          *(_QWORD *)(v6 + 8) = *(_QWORD *)(v5 + 8);
          if (!v4)
            break;
          v4 = (v4 - 1) >> 1;
          v5 = result + 16 * v4;
          v8 = *(float *)v5;
          if (*(float *)v5 == v7)
            v15 = 0;
          else
            v15 = -127;
          if (*(float *)v5 > v7)
            v15 = 1;
          if (*(float *)v5 < v7)
            v15 = -1;
          if (!v15)
          {
            v16 = *(_QWORD *)(v5 + 8);
            v17 = v16 == v13;
            LOBYTE(v15) = v16 < v13 ? -1 : 1;
            if (v17)
              break;
          }
          v18 = (char)v15;
          v6 = v14;
        }
        while (v18 > 0);
        *(float *)v14 = v7;
        *(_QWORD *)(v14 + 8) = v13;
      }
    }
  }
  return result;
}

float std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  float result;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = a1;
    v7 = v3 + 1;
    a1 += 16 * (v3 + 1);
    v8 = 2 * v3;
    v3 = (2 * v3) | 1;
    if (v8 + 2 < a3)
    {
      v9 = *(float *)(a1 + 16);
      if (*(float *)a1 == v9)
        v10 = 0;
      else
        v10 = -127;
      if (*(float *)a1 > v9)
        v10 = 1;
      if (*(float *)a1 < v9)
        v10 = -1;
      if (v10
        || ((v11 = *(_QWORD *)(v6 + 16 * v7 + 8), v12 = *(_QWORD *)(a1 + 24), v13 = v11 == v12, v11 < v12)
          ? (LOBYTE(v10) = -1)
          : (LOBYTE(v10) = 1),
            !v13))
      {
        if ((char)v10 > 0)
        {
          a1 += 16;
          v3 = v8 + 2;
        }
      }
    }
    result = *(float *)a1;
    *(_DWORD *)v6 = *(_DWORD *)a1;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(a1 + 8);
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, unint64_t a2, uint64_t a3)
{
  float *v3;
  float *v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  float *v9;
  float *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  float *v16;
  int v17;
  uint64_t v18;
  float *v19;
  float *i;
  uint64_t v21;
  float v22;
  float v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  float *v28;
  float v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  float v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  BOOL v41;
  float *v42;
  float *k;
  float *v44;
  float v45;
  float v46;
  int v47;
  uint64_t v48;
  float v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  float v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  float v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  float *v68;
  float v69;
  BOOL v70;
  BOOL v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  BOOL v75;
  int v76;
  float *j;
  float *v78;
  float v79;
  float v80;
  int v81;
  uint64_t v82;
  float v83;
  float v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  uint64_t v89;
  float *v90;
  float *v91[13];

  if (a3 != a2)
  {
    v91[11] = v3;
    v91[12] = v4;
    v5 = a3;
    v7 = result;
    while (1)
    {
      v8 = (v5 - v7) >> 4;
      if (v8 < 2)
        return result;
      if (v8 == 3)
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v7, v7 + 16, v5 - 16);
      if (v8 == 2)
      {
        v83 = *(float *)(v5 - 16);
        v84 = *(float *)v7;
        if (v83 == *(float *)v7)
          v85 = 0;
        else
          v85 = -127;
        if (v83 > *(float *)v7)
          v85 = 1;
        if (v83 < *(float *)v7)
          v85 = -1;
        if (v85
          || ((v86 = *(_QWORD *)(v5 - 8), v87 = *(_QWORD *)(v7 + 8), v88 = v86 == v87, v86 < v87)
            ? (LOBYTE(v85) = -1)
            : (LOBYTE(v85) = 1),
              !v88))
        {
          if ((char)v85 >= 1)
          {
            *(float *)v7 = v83;
            *(float *)(v5 - 16) = v84;
            v89 = *(_QWORD *)(v7 + 8);
            *(_QWORD *)(v7 + 8) = *(_QWORD *)(v5 - 8);
            *(_QWORD *)(v5 - 8) = v89;
          }
        }
        return result;
      }
      if (v5 - v7 <= 127)
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v7, v5);
      v9 = (float *)(v7 + 16 * (v8 >> 1));
      v10 = (float *)(v5 - 16);
      result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v7, (uint64_t)v9, v5 - 16);
      v11 = result;
      v90 = (float *)(v5 - 16);
      v91[0] = (float *)v7;
      if (*(float *)v7 == *v9)
        v12 = 0;
      else
        v12 = -127;
      if (*(float *)v7 > *v9)
        v12 = 1;
      if (*(float *)v7 < *v9)
        v12 = -1;
      if (v12
        || ((v13 = *(_QWORD *)(v7 + 8), v14 = *((_QWORD *)v9 + 1), v15 = v13 == v14, v13 < v14)
          ? (LOBYTE(v12) = -1)
          : (LOBYTE(v12) = 1),
            !v15))
      {
        if ((char)v12 > 0)
          break;
      }
      result = std::__nth_element_find_guard[abi:ne180100]<std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v91, &v90, (uint64_t)v9);
      v16 = v91[0];
      if ((_DWORD)result)
      {
        v10 = v90;
        v17 = *(_DWORD *)v91[0];
        *v91[0] = *v90;
        *(_DWORD *)v10 = v17;
        v18 = *((_QWORD *)v16 + 1);
        *((_QWORD *)v16 + 1) = *((_QWORD *)v10 + 1);
        *((_QWORD *)v10 + 1) = v18;
        ++v11;
        goto LABEL_23;
      }
      v42 = v91[0] + 4;
      v49 = *(float *)v7;
      v50 = *(_DWORD *)v10;
      if (*(float *)v7 == *v10)
        v51 = 0;
      else
        v51 = -127;
      if (*(float *)v7 > *v10)
        v51 = 1;
      if (*(float *)v7 < *v10)
        v51 = -1;
      if (!v51
        && ((v52 = *(_QWORD *)(v7 + 8), v53 = *(_QWORD *)(v5 - 8), v54 = v52 == v53, v52 < v53)
          ? (LOBYTE(v51) = -1)
          : (LOBYTE(v51) = 1),
            v54)
        || (char)v51 <= 0)
      {
        while (v42 != v10)
        {
          v55 = *v42;
          if (v49 == *v42)
            v56 = 0;
          else
            v56 = -127;
          if (v49 > *v42)
            v56 = 1;
          if (v49 < *v42)
            v56 = -1;
          if (v56
            || ((v57 = *(_QWORD *)(v7 + 8), v58 = *((_QWORD *)v42 + 1), v59 = v57 == v58, v57 < v58)
              ? (LOBYTE(v56) = -1)
              : (LOBYTE(v56) = 1),
                !v59))
          {
            if ((char)v56 >= 1)
            {
              *(_DWORD *)v42 = v50;
              *(float *)(v5 - 16) = v55;
              v60 = *((_QWORD *)v42 + 1);
              *((_QWORD *)v42 + 1) = *(_QWORD *)(v5 - 8);
              *(_QWORD *)(v5 - 8) = v60;
              v42 += 4;
              goto LABEL_130;
            }
          }
          v42 += 4;
          v91[0] = v42;
        }
        return result;
      }
LABEL_130:
      if (v42 == v10)
        return result;
      while (1)
      {
        v62 = *(float *)v7;
        while (1)
        {
          v63 = *v42;
          if (v62 == *v42)
            v64 = 0;
          else
            v64 = -127;
          if (v62 > *v42)
            v64 = 1;
          if (v62 < *v42)
            v64 = -1;
          if (v64
            || ((v65 = *(_QWORD *)(v7 + 8), v66 = *((_QWORD *)v42 + 1), v67 = v65 == v66, v65 < v66)
              ? (LOBYTE(v64) = -1)
              : (LOBYTE(v64) = 1),
                !v67))
          {
            if ((char)v64 >= 1)
              break;
          }
          v42 += 4;
          v91[0] = v42;
        }
        v68 = v10 - 4;
        do
        {
          v10 = v68;
          v69 = *v68;
          v70 = v62 < *v68;
          v71 = v62 <= *v68;
          if (v62 == *v68)
            v72 = 0;
          else
            v72 = -127;
          if (!v71)
            v72 = 1;
          if (v70)
            v72 = -1;
          if (!v72)
          {
            v73 = *(_QWORD *)(v7 + 8);
            v74 = *((_QWORD *)v10 + 1);
            v75 = v73 == v74;
            LOBYTE(v72) = v73 < v74 ? -1 : 1;
            if (v75)
              break;
          }
          v76 = (char)v72;
          v68 = v10 - 4;
        }
        while (v76 > 0);
        if (v42 >= v10)
          break;
        *v42 = v69;
        *v10 = v63;
        v61 = *((_QWORD *)v42 + 1);
        *((_QWORD *)v42 + 1) = *((_QWORD *)v10 + 1);
        *((_QWORD *)v10 + 1) = v61;
        v42 += 4;
        v91[0] = v42;
      }
      if ((unint64_t)v42 > a2)
        return result;
LABEL_165:
      v7 = (uint64_t)v42;
      if (v5 == a2)
        return result;
    }
    v16 = (float *)v7;
LABEL_23:
    v19 = v16 + 4;
    if (v19 >= v10)
    {
      v21 = (uint64_t)v19;
    }
    else
    {
      i = v19;
      while (1)
      {
        v21 = (uint64_t)i;
        v22 = *v9;
        for (i = v19 + 4; ; i += 4)
        {
          v23 = *v19;
          if (*v19 == v22)
            v24 = 0;
          else
            v24 = -127;
          if (*v19 > v22)
            v24 = 1;
          if (*v19 < v22)
            v24 = -1;
          if (!v24)
          {
            v25 = *((_QWORD *)v19 + 1);
            v26 = *((_QWORD *)v9 + 1);
            v27 = v25 == v26;
            LOBYTE(v24) = v25 < v26 ? -1 : 1;
            if (v27)
              break;
          }
          if ((char)v24 <= 0)
            break;
          v21 = (uint64_t)(v19 + 4);
          v91[0] = v19 + 4;
          v19 += 4;
        }
        do
        {
          v28 = v10 - 4;
          v29 = *(v10 - 4);
          if (v29 == v22)
            v30 = 0;
          else
            v30 = -127;
          if (v29 > v22)
            v30 = 1;
          if (v29 < v22)
            v30 = -1;
          if (!v30)
          {
            v31 = *((_QWORD *)v10 - 1);
            v32 = *((_QWORD *)v9 + 1);
            v33 = v31 == v32;
            LOBYTE(v30) = v31 < v32 ? -1 : 1;
            if (v33)
              LOBYTE(v30) = 0;
          }
          v10 -= 4;
        }
        while ((char)v30 < 1);
        v90 = v28;
        if (v19 >= v28)
          break;
        *v19 = v29;
        *v28 = v23;
        v34 = *((_QWORD *)v19 + 1);
        *((_QWORD *)v19 + 1) = *((_QWORD *)v28 + 1);
        *((_QWORD *)v28 + 1) = v34;
        ++v11;
        v10 = v90;
        if (v19 == v9)
          v9 = v90;
        v19 += 4;
        v91[0] = v19;
      }
    }
    if (v19 != v9)
    {
      v35 = *v19;
      if (*v9 == *v19)
        v36 = 0;
      else
        v36 = -127;
      if (*v9 > *v19)
        v36 = 1;
      if (*v9 < *v19)
        v36 = -1;
      if (v36
        || ((v37 = *((_QWORD *)v9 + 1), v38 = *((_QWORD *)v19 + 1), v39 = v37 == v38, v37 < v38)
          ? (LOBYTE(v36) = -1)
          : (LOBYTE(v36) = 1),
            !v39))
      {
        if ((char)v36 >= 1)
        {
          *v19 = *v9;
          *v9 = v35;
          v40 = *((_QWORD *)v19 + 1);
          *((_QWORD *)v19 + 1) = *((_QWORD *)v9 + 1);
          *((_QWORD *)v9 + 1) = v40;
          ++v11;
        }
      }
    }
    if (v19 == (float *)a2)
      return result;
    if (!v11)
    {
      if ((unint64_t)v19 <= a2)
      {
        if (v21 + 16 == v5)
          return result;
        for (j = (float *)(v21 + 24); ; j += 4)
        {
          v78 = j - 2;
          v79 = *(j - 2);
          v80 = *(j - 6);
          if (v79 == v80)
            v81 = 0;
          else
            v81 = -127;
          if (v79 > v80)
            v81 = 1;
          if (v79 < v80)
            v81 = -1;
          if (v81
            || ((v82 = *((_QWORD *)j - 2), *(_QWORD *)j < v82) ? (LOBYTE(v81) = -1) : (LOBYTE(v81) = 1),
                *(_QWORD *)j != v82))
          {
            if ((char)v81 > 0)
              break;
          }
          if (v78 + 4 == (float *)v5)
            return result;
        }
      }
      else
      {
        if ((float *)(v7 + 16) == v19)
          return result;
        for (k = (float *)(v7 + 24); ; k += 4)
        {
          v44 = k - 2;
          v45 = *(k - 2);
          v46 = *(k - 6);
          if (v45 == v46)
            v47 = 0;
          else
            v47 = -127;
          if (v45 > v46)
            v47 = 1;
          if (v45 < v46)
            v47 = -1;
          if (v47
            || ((v48 = *((_QWORD *)k - 2), *(_QWORD *)k < v48) ? (LOBYTE(v47) = -1) : (LOBYTE(v47) = 1),
                *(_QWORD *)k != v48))
          {
            if ((char)v47 > 0)
              break;
          }
          if (v44 + 4 == v19)
            return result;
        }
      }
    }
    v41 = (unint64_t)v19 > a2;
    v42 = v19 + 4;
    if (v41)
      v5 = v21;
    if (v41)
      v42 = (float *)v7;
    goto LABEL_165;
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3;
  float v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  float v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v26;
  int v27;
  uint64_t v28;
  BOOL v29;

  v3 = *(float *)a2;
  v4 = *(float *)a1;
  if (*(float *)a2 == *(float *)a1)
    v5 = 0;
  else
    v5 = -127;
  if (*(float *)a2 > *(float *)a1)
    v5 = 1;
  if (*(float *)a2 < *(float *)a1)
    v5 = -1;
  if (!v5
    && ((v6 = *(_QWORD *)(a2 + 8), v7 = *(_QWORD *)(a1 + 8), v8 = v6 == v7, v6 < v7)
      ? (LOBYTE(v5) = -1)
      : (LOBYTE(v5) = 1),
        v8)
    || (char)v5 <= 0)
  {
    if (*(float *)a3 == v3)
      v14 = 0;
    else
      v14 = -127;
    if (*(float *)a3 > v3)
      v14 = 1;
    if (*(float *)a3 < v3)
      v14 = -1;
    if (!v14)
    {
      v15 = *(_QWORD *)(a3 + 8);
      v16 = *(_QWORD *)(a2 + 8);
      v17 = v15 == v16;
      LOBYTE(v14) = v15 < v16 ? -1 : 1;
      if (v17)
        return 0;
    }
    if ((char)v14 < 1)
      return 0;
    *(_DWORD *)a2 = *(_DWORD *)a3;
    *(float *)a3 = v3;
    v18 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = *(_QWORD *)(a3 + 8);
    *(_QWORD *)(a3 + 8) = v18;
    v19 = *(float *)a1;
    if (*(float *)a2 == *(float *)a1)
      v20 = 0;
    else
      v20 = -127;
    if (*(float *)a2 > *(float *)a1)
      v20 = 1;
    if (*(float *)a2 < *(float *)a1)
      v20 = -1;
    if (!v20)
    {
      v21 = *(_QWORD *)(a2 + 8);
      v22 = *(_QWORD *)(a1 + 8);
      v23 = v21 == v22;
      LOBYTE(v20) = v21 < v22 ? -1 : 1;
      if (v23)
        return 1;
    }
    if ((char)v20 < 1)
      return 1;
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(float *)a2 = v19;
    v24 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = v24;
    return 2;
  }
  if (*(float *)a3 == v3)
    v9 = 0;
  else
    v9 = -127;
  if (*(float *)a3 > v3)
    v9 = 1;
  if (*(float *)a3 < v3)
    v9 = -1;
  if (!v9)
  {
    v10 = *(_QWORD *)(a3 + 8);
    v11 = *(_QWORD *)(a2 + 8);
    v12 = v10 == v11;
    LOBYTE(v9) = v10 < v11 ? -1 : 1;
    if (v12)
    {
LABEL_57:
      *(float *)a1 = v3;
      *(float *)a2 = v4;
      v26 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v10;
      *(_QWORD *)(a2 + 8) = v26;
      if (*(float *)a3 == v4)
        v27 = 0;
      else
        v27 = -127;
      if (*(float *)a3 > v4)
        v27 = 1;
      if (*(float *)a3 < v4)
        v27 = -1;
      if (!v27)
      {
        v28 = *(_QWORD *)(a3 + 8);
        v29 = v28 == v26;
        LOBYTE(v27) = v28 < v26 ? -1 : 1;
        if (v29)
          return 1;
      }
      if ((char)v27 < 1)
        return 1;
      *(_DWORD *)a2 = *(_DWORD *)a3;
      *(float *)a3 = v4;
      *(_QWORD *)(a2 + 8) = *(_QWORD *)(a3 + 8);
      *(_QWORD *)(a3 + 8) = v26;
      return 2;
    }
  }
  if ((char)v9 <= 0)
  {
    v10 = *(_QWORD *)(a2 + 8);
    goto LABEL_57;
  }
  *(_DWORD *)a1 = *(_DWORD *)a3;
  *(float *)a3 = v4;
  v13 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a3 + 8);
  *(_QWORD *)(a3 + 8) = v13;
  return 1;
}

uint64_t std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v2 = a2 - 16;
  if (a2 - 16 != result)
  {
    v4 = result;
    v5 = result;
    do
    {
      result = std::__min_element[abi:ne180100]<std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>,std::__wrap_iter<std::pair<float,long long>*>>(v4, a2);
      if (v5 != result)
      {
        v6 = *(_DWORD *)v5;
        *(_DWORD *)v5 = *(_DWORD *)result;
        *(_DWORD *)result = v6;
        v7 = *(_QWORD *)(v5 + 8);
        *(_QWORD *)(v5 + 8) = *(_QWORD *)(result + 8);
        *(_QWORD *)(result + 8) = v7;
      }
      v5 += 16;
      v4 += 16;
    }
    while (v5 != v2);
  }
  return result;
}

BOOL std::__nth_element_find_guard[abi:ne180100]<std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(float **a1, float **a2, uint64_t a3)
{
  float *v3;
  float *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;

  v3 = *a2 - 4;
  do
  {
    v4 = v3;
    *a2 = v3;
    if (v3 == *a1)
      break;
    if (*v3 == *(float *)a3)
      v5 = 0;
    else
      v5 = -127;
    if (*v4 > *(float *)a3)
      v5 = 1;
    if (*v4 < *(float *)a3)
      v5 = -1;
    if (!v5)
    {
      v6 = *((_QWORD *)v4 + 1);
      v7 = *(_QWORD *)(a3 + 8);
      v8 = v6 == v7;
      if (v6 < v7)
        LOBYTE(v5) = -1;
      else
        LOBYTE(v5) = 1;
      if (v8)
        LOBYTE(v5) = 0;
    }
    v9 = (char)v5;
    v3 = v4 - 4;
  }
  while (v9 < 1);
  return v4 != *a1;
}

uint64_t std::__min_element[abi:ne180100]<std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, uint64_t a2)
{
  uint64_t i;
  int v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  if (result != a2)
  {
    for (i = result + 16; i != a2; i += 16)
    {
      if (*(float *)i == *(float *)result)
        v3 = 0;
      else
        v3 = -127;
      if (*(float *)i > *(float *)result)
        v3 = 1;
      if (*(float *)i < *(float *)result)
        v3 = -1;
      if (!v3)
      {
        v4 = *(_QWORD *)(i + 8);
        v5 = *(_QWORD *)(result + 8);
        v6 = v4 == v5;
        LOBYTE(v3) = v4 < v5 ? -1 : 1;
        if (v6)
          continue;
      }
      if ((char)v3 > 0)
        result = i;
    }
  }
  return result;
}

void std::vector<std::pair<float,long long>>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(v4 - 8);
  if (a2 <= (v6 - (_BYTE *)v7) >> 4)
  {
    if (a2)
    {
      v14 = &v7[2 * a2];
      do
      {
        *(_DWORD *)v7 = 0;
        v7[1] = 0;
        v7 += 2;
      }
      while (v7 != v14);
      v7 = v14;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = (char *)v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(v4, v12);
    else
      v13 = 0;
    v15 = &v13[16 * v10];
    v16 = &v15[16 * a2];
    v17 = v15;
    do
    {
      *(_DWORD *)v17 = 0;
      *((_QWORD *)v17 + 1) = 0;
      v17 += 16;
    }
    while (v17 != v16);
    v18 = &v13[16 * v12];
    v20 = (char *)*a1;
    v19 = (char *)a1[1];
    if (v19 != *a1)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v19 - 1);
        v15 -= 16;
        v19 -= 16;
      }
      while (v19 != v20);
      v19 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v16;
    a1[2] = v18;
    if (v19)
      operator delete(v19);
  }
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
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
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

_OWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<std::pair<float,long long> *>,std::__wrap_iter<std::pair<float,long long> *>,std::back_insert_iterator<std::vector<std::pair<float,long long>>>,0>(_OWORD *a1, _OWORD *a2, void **a3)
{
  _OWORD *v3;
  _OWORD *v4;
  void **v6;

  v3 = a1;
  v6 = a3;
  if (a1 == a2)
    return a1;
  v4 = a2;
  do
    std::back_insert_iterator<std::vector<std::pair<float,long long>>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

void ***std::back_insert_iterator<std::vector<std::pair<float,long long>>>::operator=[abi:ne180100](void ***a1, _OWORD *a2)
{
  void **v4;
  _OWORD *v5;
  void **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;

  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    v11 = ((char *)v5 - (_BYTE *)*v4) >> 4;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 60)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v13 = v8 - (_QWORD)*v4;
    if (v13 >> 3 > v12)
      v12 = v13 >> 3;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>(v7, v14);
    else
      v15 = 0;
    v16 = &v15[16 * v11];
    v17 = &v15[16 * v14];
    *(_OWORD *)v16 = *a2;
    v10 = v16 + 16;
    v19 = (char *)*v4;
    v18 = (char *)v4[1];
    if (v18 != *v4)
    {
      do
      {
        *((_OWORD *)v16 - 1) = *((_OWORD *)v18 - 1);
        v16 -= 16;
        v18 -= 16;
      }
      while (v18 != v19);
      v18 = (char *)*v4;
    }
    *v4 = v16;
    v4[1] = v10;
    v4[2] = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v5 = *a2;
    v10 = v5 + 1;
  }
  v4[1] = v10;
  return a1;
}

uint64_t std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;

  if (a1 != a2)
  {
    v8 = a2 - a1;
    v9 = (a2 - a1) >> 4;
    if (a2 - a1 >= 17)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = a1 + 16 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a4, v9, v12);
        v12 -= 16;
        --v11;
      }
      while (v11);
    }
    if (a2 == a3)
    {
      a3 = a2;
    }
    else
    {
      v13 = a2;
      do
      {
        v14 = *(float *)v13;
        if (*(float *)v13 == *(float *)a1)
          v15 = 0;
        else
          v15 = -127;
        if (*(float *)v13 > *(float *)a1)
          v15 = 1;
        if (*(float *)v13 < *(float *)a1)
          v15 = -1;
        if (v15
          || ((v16 = *(_QWORD *)(v13 + 8), v17 = *(_QWORD *)(a1 + 8), v18 = v16 == v17, v16 < v17)
            ? (LOBYTE(v15) = -1)
            : (LOBYTE(v15) = 1),
              !v18))
        {
          if ((char)v15 >= 1)
          {
            *(_DWORD *)v13 = *(_DWORD *)a1;
            *(float *)a1 = v14;
            v19 = *(_QWORD *)(v13 + 8);
            *(_QWORD *)(v13 + 8) = *(_QWORD *)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v19;
            std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a4, v9, a1);
          }
        }
        v13 += 16;
      }
      while (v13 != a3);
    }
    if (v8 >= 17)
    {
      v20 = (unint64_t)v8 >> 4;
      v21 = a2 - 16;
      do
      {
        v22 = *(float *)a1;
        v23 = *(_QWORD *)(a1 + 8);
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a4, v20);
        if (v21 == v24)
        {
          *(float *)v24 = v22;
          *(_QWORD *)(v24 + 8) = v23;
        }
        else
        {
          *(_DWORD *)v24 = *(_DWORD *)v21;
          *(_QWORD *)(v24 + 8) = *(_QWORD *)(v21 + 8);
          *(float *)v21 = v22;
          *(_QWORD *)(v21 + 8) = v23;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, v24 + 16, a4, (v24 + 16 - a1) >> 4);
        }
        v21 -= 16;
      }
      while (v20-- > 2);
    }
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  float v15;
  float v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  int v31;
  uint64_t v32;
  BOOL v33;

  if (a3 >= 2)
  {
    v4 = a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= (a4 - result) >> 4)
    {
      v6 = v4 >> 3;
      v7 = (v4 >> 3) | 1;
      v8 = result + 16 * v7;
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = *(float *)(v8 + 16);
        if (*(float *)v8 == v10)
          v11 = 0;
        else
          v11 = -127;
        if (*(float *)v8 > v10)
          v11 = 1;
        if (*(float *)v8 < v10)
          v11 = -1;
        if (v11
          || ((v12 = *(_QWORD *)(result + 16 * v7 + 8), v13 = *(_QWORD *)(v8 + 24), v14 = v12 == v13, v12 < v13)
            ? (LOBYTE(v11) = -1)
            : (LOBYTE(v11) = 1),
              !v14))
        {
          if ((char)v11 > 0)
          {
            v8 += 16;
            v7 = v9;
          }
        }
      }
      v15 = *(float *)v8;
      v16 = *(float *)a4;
      if (*(float *)v8 == *(float *)a4)
        v17 = 0;
      else
        v17 = -127;
      if (*(float *)v8 > *(float *)a4)
        v17 = 1;
      if (*(float *)v8 < *(float *)a4)
        v18 = -1;
      else
        v18 = v17;
      if (v18
        || ((v19 = *(_QWORD *)(v8 + 8), v20 = *(_QWORD *)(a4 + 8), v21 = v19 == v20, v19 < v20)
          ? (LOBYTE(v18) = -1)
          : (LOBYTE(v18) = 1),
            !v21))
      {
        if ((char)v18 > 0)
          return result;
        v19 = *(_QWORD *)(a4 + 8);
      }
      do
      {
        v22 = a4;
        a4 = v8;
        *(float *)v22 = v15;
        *(_QWORD *)(v22 + 8) = *(_QWORD *)(v8 + 8);
        if (v5 < v7)
          break;
        v23 = (2 * v7) | 1;
        v8 = result + 16 * v23;
        v24 = 2 * v7 + 2;
        if (v24 >= a3)
        {
          v7 = (2 * v7) | 1;
        }
        else
        {
          v25 = *(float *)(v8 + 16);
          if (*(float *)v8 == v25)
            v26 = 0;
          else
            v26 = -127;
          if (*(float *)v8 > v25)
            v26 = 1;
          if (*(float *)v8 < v25)
            v27 = -1;
          else
            v27 = v26;
          if (v27
            || ((v28 = *(_QWORD *)(result + 16 * v23 + 8),
                 v29 = *(_QWORD *)(v8 + 24),
                 v7 = v23,
                 v30 = v28 == v29,
                 v28 < v29)
              ? (LOBYTE(v27) = -1)
              : (LOBYTE(v27) = 1),
                !v30))
          {
            if ((char)v27 <= 0)
            {
              v7 = v23;
            }
            else
            {
              v8 += 16;
              v7 = v24;
            }
          }
        }
        v15 = *(float *)v8;
        if (*(float *)v8 == v16)
          v31 = 0;
        else
          v31 = -127;
        if (*(float *)v8 > v16)
          v31 = 1;
        if (*(float *)v8 < v16)
          v31 = -1;
        if (!v31)
        {
          v32 = *(_QWORD *)(v8 + 8);
          v33 = v32 == v19;
          if (v32 < v19)
            LOBYTE(v31) = -1;
          else
            LOBYTE(v31) = 1;
          if (v33)
            LOBYTE(v31) = 0;
        }
      }
      while ((char)v31 < 1);
      *(float *)a4 = v16;
      *(_QWORD *)(a4 + 8) = v19;
    }
  }
  return result;
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_247984894(_Unwind_Exception *exception_object)
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

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<int>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

_QWORD *std::vector<std::pair<float,long long>>::vector(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::pair<float,long long>>::__vallocate[abi:ne180100](a1, a2);
    v4 = a1[1];
    v5 = v4 + 16 * a2;
    do
    {
      *(_DWORD *)v4 = 0;
      *(_QWORD *)(v4 + 8) = 0;
      v4 += 16;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

void sub_247984948(_Unwind_Exception *exception_object)
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

char *std::vector<std::pair<float,long long>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<int>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,long long>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,false>(uint64_t result, float *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  float v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  char v24;
  BOOL v25;
  float v26;
  float v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;

  v8 = result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (uint64_t)a2 - v9;
    v13 = ((uint64_t)a2 - v9) >> 4;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v26 = *(a2 - 4);
        v27 = *(float *)v9;
        if (v26 == *(float *)v9)
          v28 = 0;
        else
          v28 = -127;
        if (v26 > *(float *)v9)
          v28 = 1;
        if (v26 < *(float *)v9)
          v28 = -1;
        if (v28
          || ((v29 = *((_QWORD *)a2 - 1), v30 = *(_QWORD *)(v9 + 8), v31 = v29 == v30, v29 < v30)
            ? (LOBYTE(v28) = -1)
            : (LOBYTE(v28) = 1),
              !v31))
        {
          if ((char)v28 >= 1)
          {
            *(float *)v9 = v26;
            *(a2 - 4) = v27;
            v32 = *(_QWORD *)(v9 + 8);
            *(_QWORD *)(v9 + 8) = *((_QWORD *)a2 - 1);
            *((_QWORD *)a2 - 1) = v32;
          }
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v9, v9 + 16, (uint64_t)(a2 - 4));
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v9, v9 + 16, v9 + 32, (uint64_t)(a2 - 4));
      case 5uLL:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v9, v9 + 16, v9 + 32, v9 + 48, (uint64_t)(a2 - 4));
      default:
        if (v12 <= 383)
        {
          if ((a5 & 1) != 0)
            return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v9, (uint64_t)a2);
          else
            return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v9, (uint64_t)a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = v9 + 16 * (v13 >> 1);
          if ((unint64_t)v12 < 0x801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v9 + 16 * (v13 >> 1), v9, (uint64_t)(a2 - 4));
            if ((a5 & 1) != 0)
              goto LABEL_24;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v9, v9 + 16 * (v13 >> 1), (uint64_t)(a2 - 4));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v9 + 16, v15 - 16, (uint64_t)(a2 - 8));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v9 + 32, v9 + 16 + 16 * v14, (uint64_t)(a2 - 12));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(v15 - 16, v15, v9 + 16 + 16 * v14);
            v16 = *(float *)v9;
            *(_DWORD *)v9 = *(_DWORD *)v15;
            *(float *)v15 = v16;
            v17 = *(_QWORD *)(v9 + 8);
            *(_QWORD *)(v9 + 8) = *(_QWORD *)(v15 + 8);
            *(_QWORD *)(v15 + 8) = v17;
            if ((a5 & 1) != 0)
              goto LABEL_24;
          }
          v18 = *(float *)(v9 - 16);
          if (v18 == *(float *)v9)
            v19 = 0;
          else
            v19 = -127;
          if (v18 > *(float *)v9)
            v19 = 1;
          if (v18 < *(float *)v9)
            v19 = -1;
          if (!v19
            && ((v20 = *(_QWORD *)(v9 - 8), v21 = *(_QWORD *)(v9 + 8), v22 = v20 == v21, v20 < v21)
              ? (LOBYTE(v19) = -1)
              : (LOBYTE(v19) = 1),
                v22)
            || (char)v19 <= 0)
          {
            result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,long long> *,std::greater<std::pair<float,long long>> &>(v9, a2);
            v9 = result;
            goto LABEL_29;
          }
LABEL_24:
          v23 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,long long> *,std::greater<std::pair<float,long long>> &>(v9, a2);
          if ((v24 & 1) == 0)
            goto LABEL_27;
          v25 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v9, v23);
          v9 = v23 + 16;
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(v23 + 16, (uint64_t)a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v25)
              continue;
LABEL_27:
            result = std::__introsort<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,false>(v8, v23, a3, -v11, a5 & 1);
            v9 = v23 + 16;
LABEL_29:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = (float *)v23;
          if (v25)
            return result;
          goto LABEL_2;
        }
        if ((float *)v9 != a2)
          return std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,std::pair<float,long long>*>(v9, (uint64_t)a2, (uint64_t)a2, a3);
        return result;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  float v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  BOOL v19;

  if (result != a2)
  {
    v2 = result + 16;
    if (result + 16 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v6 = *(float *)(v5 + 16);
        v7 = *(float *)v5;
        if (v6 == *(float *)v5)
          v8 = 0;
        else
          v8 = -127;
        if (v6 > *(float *)v5)
          v8 = 1;
        if (v6 < *(float *)v5)
          v8 = -1;
        if (v8
          || ((v9 = *(_QWORD *)(v5 + 24), v10 = *(_QWORD *)(v5 + 8), v11 = v9 == v10, v9 < v10)
            ? (LOBYTE(v8) = -1)
            : (LOBYTE(v8) = 1),
              !v11))
        {
          if ((char)v8 >= 1)
          {
            v12 = *(_QWORD *)(v5 + 24);
            v13 = v3;
            while (1)
            {
              v14 = v5;
              v15 = result + v13;
              *(float *)(v15 + 16) = v7;
              *(_QWORD *)(v15 + 24) = *(_QWORD *)(result + v13 + 8);
              if (!v13)
              {
                v14 = result;
                goto LABEL_36;
              }
              v7 = *(float *)(v15 - 16);
              if (v6 == v7)
                v16 = 0;
              else
                v16 = -127;
              if (v6 > v7)
                v16 = 1;
              v17 = v6 < v7 ? -1 : v16;
              if (!v17)
              {
                v18 = *(_QWORD *)(result + v13 - 8);
                v19 = v12 == v18;
                LOBYTE(v17) = v12 < v18 ? -1 : 1;
                if (v19)
                  break;
              }
              v5 = v14 - 16;
              v13 -= 16;
              if ((char)v17 <= 0)
                goto LABEL_36;
            }
            v14 = result + v13;
LABEL_36:
            *(float *)v14 = v6;
            *(_QWORD *)(v14 + 8) = v12;
          }
        }
        v2 = v4 + 16;
        v3 += 16;
      }
      while (v4 + 16 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  float *v3;
  uint64_t v4;
  float v5;
  float v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  float *v12;
  float *v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  int v17;

  if (result != a2)
  {
    v2 = result + 16;
    if (result + 16 != a2)
    {
      v3 = (float *)(result + 8);
      do
      {
        v4 = result;
        result = v2;
        v5 = *(float *)(v4 + 16);
        v6 = *(float *)v4;
        if (v5 == *(float *)v4)
          v7 = 0;
        else
          v7 = -127;
        if (v5 > *(float *)v4)
          v7 = 1;
        if (v5 < *(float *)v4)
          v7 = -1;
        if (v7
          || ((v8 = *(_QWORD *)(v4 + 24), v9 = *(_QWORD *)(v4 + 8), v10 = v8 == v9, v8 < v9)
            ? (LOBYTE(v7) = -1)
            : (LOBYTE(v7) = 1),
              !v10))
        {
          if ((char)v7 >= 1)
          {
            v11 = *(_QWORD *)(v4 + 24);
            v12 = v3;
            do
            {
              v13 = v12;
              v12[2] = v6;
              *((_QWORD *)v12 + 2) = *(_QWORD *)v12;
              v6 = *(v12 - 6);
              if (v5 == v6)
                v14 = 0;
              else
                v14 = -127;
              if (v5 > v6)
                v14 = 1;
              if (v5 < v6)
                v14 = -1;
              if (!v14)
              {
                v15 = *((_QWORD *)v13 - 2);
                v16 = v11 == v15;
                LOBYTE(v14) = v11 < v15 ? -1 : 1;
                if (v16)
                  break;
              }
              v17 = (char)v14;
              v12 = v13 - 4;
            }
            while (v17 > 0);
            *(v13 - 2) = v5;
            *(_QWORD *)v13 = v11;
          }
        }
        v2 = result + 16;
        v3 += 4;
      }
      while (result + 16 != a2);
    }
  }
  return result;
}

float *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,long long> *,std::greater<std::pair<float,long long>> &>(uint64_t a1, float *a2)
{
  float v2;
  uint64_t v3;
  float v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  float *v8;
  float *v9;
  float v10;
  BOOL v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  char v16;
  float *v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  float *v22;
  BOOL v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  BOOL v27;
  int v28;
  float v29;
  float v30;
  uint64_t v31;
  float *v32;
  float v33;
  BOOL v34;
  BOOL v35;
  int v36;
  uint64_t v37;
  BOOL v38;
  char v39;
  float *v40;
  BOOL v41;
  BOOL v42;
  int v43;
  uint64_t v44;
  BOOL v45;
  int v46;

  v2 = *(float *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(a2 - 4);
  if (*(float *)a1 == v4)
    v5 = 0;
  else
    v5 = -127;
  if (*(float *)a1 > v4)
    v5 = 1;
  if (*(float *)a1 < v4)
    v5 = -1;
  if (!v5 && ((v6 = *((_QWORD *)a2 - 1), v7 = v3 == v6, v3 < v6) ? (LOBYTE(v5) = -1) : (LOBYTE(v5) = 1), v7)
    || (char)v5 < 1)
  {
    v17 = (float *)(a1 + 16);
    do
    {
      v9 = v17;
      if (v17 >= a2)
        break;
      if (v2 == *v17)
        v18 = 0;
      else
        v18 = -127;
      if (v2 > *v9)
        v18 = 1;
      if (v2 < *v9)
        v18 = -1;
      if (!v18)
      {
        v19 = *((_QWORD *)v9 + 1);
        v20 = v3 == v19;
        LOBYTE(v18) = v3 < v19 ? -1 : 1;
        if (v20)
          LOBYTE(v18) = 0;
      }
      v21 = (char)v18;
      v17 = v9 + 4;
    }
    while (v21 < 1);
  }
  else
  {
    v8 = (float *)a1;
    v9 = (float *)a1;
    do
    {
      v10 = v9[4];
      v9 += 4;
      v11 = v2 < v10;
      v12 = v2 <= v10;
      if (v2 == v10)
        v13 = 0;
      else
        v13 = -127;
      if (!v12)
        v13 = 1;
      if (v11)
        v13 = -1;
      if (!v13)
      {
        v14 = *((_QWORD *)v8 + 3);
        v15 = v3 == v14;
        if (v3 < v14)
          v16 = -1;
        else
          v16 = 1;
        if (v15)
          LOBYTE(v13) = 0;
        else
          LOBYTE(v13) = v16;
      }
      v8 = v9;
    }
    while ((char)v13 <= 0);
  }
  if (v9 < a2)
  {
    v22 = a2 - 4;
    do
    {
      a2 = v22;
      v23 = v2 < *v22;
      v24 = v2 <= *v22;
      if (v2 == *v22)
        v25 = 0;
      else
        v25 = -127;
      if (!v24)
        v25 = 1;
      if (v23)
        v25 = -1;
      if (!v25)
      {
        v26 = *((_QWORD *)a2 + 1);
        v27 = v3 == v26;
        LOBYTE(v25) = v3 < v26 ? -1 : 1;
        if (v27)
          break;
      }
      v28 = (char)v25;
      v22 = a2 - 4;
    }
    while (v28 > 0);
  }
  if (v9 < a2)
  {
    v29 = *v9;
    v30 = *a2;
    do
    {
      *v9 = v30;
      *a2 = v29;
      v31 = *((_QWORD *)v9 + 1);
      *((_QWORD *)v9 + 1) = *((_QWORD *)a2 + 1);
      *((_QWORD *)a2 + 1) = v31;
      v32 = v9;
      do
      {
        v33 = v9[4];
        v9 += 4;
        v29 = v33;
        v34 = v2 < v33;
        v35 = v2 <= v33;
        if (v2 == v33)
          v36 = 0;
        else
          v36 = -127;
        if (!v35)
          v36 = 1;
        if (v34)
          v36 = -1;
        if (!v36)
        {
          v37 = *((_QWORD *)v32 + 3);
          v38 = v3 == v37;
          if (v3 < v37)
            v39 = -1;
          else
            v39 = 1;
          if (v38)
            LOBYTE(v36) = 0;
          else
            LOBYTE(v36) = v39;
        }
        v32 = v9;
      }
      while ((char)v36 < 1);
      v40 = a2 - 4;
      do
      {
        a2 = v40;
        v30 = *v40;
        v41 = v2 < *v40;
        v42 = v2 <= *v40;
        if (v2 == *v40)
          v43 = 0;
        else
          v43 = -127;
        if (!v42)
          v43 = 1;
        if (v41)
          v43 = -1;
        if (!v43)
        {
          v44 = *((_QWORD *)a2 + 1);
          v45 = v3 == v44;
          LOBYTE(v43) = v3 < v44 ? -1 : 1;
          if (v45)
            break;
        }
        v46 = (char)v43;
        v40 = a2 - 4;
      }
      while (v46 > 0);
    }
    while (v9 < a2);
  }
  if (v9 - 4 != (float *)a1)
  {
    *(float *)a1 = *(v9 - 4);
    *(_QWORD *)(a1 + 8) = *((_QWORD *)v9 - 1);
  }
  *(v9 - 4) = v2;
  *((_QWORD *)v9 - 1) = v3;
  return v9;
}

unint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<float,long long> *,std::greater<std::pair<float,long long>> &>(uint64_t a1, float *a2)
{
  uint64_t v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  float *v11;
  float v12;
  BOOL v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  BOOL v17;
  float v18;
  int v19;
  uint64_t v20;
  BOOL v21;
  float v22;
  float *v23;
  unint64_t v24;
  uint64_t v25;
  float *v26;
  BOOL v27;
  BOOL v28;
  int v29;
  uint64_t v30;
  BOOL v31;
  int v32;
  float *v33;
  float v34;
  BOOL v35;
  BOOL v36;
  int v37;
  uint64_t v38;
  BOOL v39;
  char v40;

  v2 = 0;
  v3 = *(float *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  do
  {
    v5 = v2;
    v6 = a1 + v2;
    v7 = *(float *)(v6 + 16);
    if (v7 == v3)
      v8 = 0;
    else
      v8 = -127;
    if (v7 > v3)
      v8 = 1;
    if (v7 < v3)
      v8 = -1;
    if (!v8)
    {
      v9 = *(_QWORD *)(v6 + 24);
      LOBYTE(v8) = v9 < v4 ? -1 : 1;
      if (v9 == v4)
        break;
    }
    v2 = v5 + 16;
  }
  while ((char)v8 > 0);
  v10 = a1 + v5 + 16;
  if (v5)
  {
    v11 = a2;
    do
    {
      v12 = *(v11 - 4);
      v11 -= 4;
      v13 = v12 < v3;
      v14 = v12 <= v3;
      if (v12 == v3)
        v15 = 0;
      else
        v15 = -127;
      if (!v14)
        v15 = 1;
      if (v13)
        v15 = -1;
      if (!v15)
      {
        v16 = *((_QWORD *)a2 - 1);
        v17 = v16 == v4;
        LOBYTE(v15) = v16 < v4 ? -1 : 1;
        if (v17)
          LOBYTE(v15) = 0;
      }
      a2 = v11;
    }
    while ((char)v15 < 1);
  }
  else
  {
    while (v10 < (unint64_t)a2)
    {
      v11 = a2 - 4;
      v18 = *(a2 - 4);
      if (v18 == v3)
        v19 = 0;
      else
        v19 = -127;
      if (v18 > v3)
        v19 = 1;
      if (v18 < v3)
        v19 = -1;
      if (!v19)
      {
        v20 = *((_QWORD *)a2 - 1);
        v21 = v20 == v4;
        LOBYTE(v19) = v20 < v4 ? -1 : 1;
        if (v21)
          LOBYTE(v19) = 0;
      }
      a2 -= 4;
      if ((char)v19 > 0)
        goto LABEL_49;
    }
    v11 = a2;
  }
LABEL_49:
  if (v10 >= (unint64_t)v11)
  {
    v24 = v10;
  }
  else
  {
    v22 = *v11;
    v23 = v11;
    v24 = v10;
    do
    {
      *(float *)v24 = v22;
      *v23 = v7;
      v25 = *(_QWORD *)(v24 + 8);
      *(_QWORD *)(v24 + 8) = *((_QWORD *)v23 + 1);
      *((_QWORD *)v23 + 1) = v25;
      v26 = (float *)(v24 + 16);
      do
      {
        v24 = (unint64_t)v26;
        v7 = *v26;
        v27 = *v26 < v3;
        v28 = *v26 <= v3;
        if (*v26 == v3)
          v29 = 0;
        else
          v29 = -127;
        if (!v28)
          v29 = 1;
        if (v27)
          v29 = -1;
        if (!v29)
        {
          v30 = *(_QWORD *)(v24 + 8);
          v31 = v30 == v4;
          LOBYTE(v29) = v30 < v4 ? -1 : 1;
          if (v31)
            break;
        }
        v32 = (char)v29;
        v26 = (float *)(v24 + 16);
      }
      while (v32 > 0);
      v33 = v23;
      do
      {
        v34 = *(v33 - 4);
        v33 -= 4;
        v22 = v34;
        v35 = v34 < v3;
        v36 = v34 <= v3;
        if (v34 == v3)
          v37 = 0;
        else
          v37 = -127;
        if (!v36)
          v37 = 1;
        if (v35)
          v37 = -1;
        if (!v37)
        {
          v38 = *((_QWORD *)v23 - 1);
          v39 = v38 == v4;
          if (v38 < v4)
            v40 = -1;
          else
            v40 = 1;
          if (v39)
            LOBYTE(v37) = 0;
          else
            LOBYTE(v37) = v40;
        }
        v23 = v33;
      }
      while ((char)v37 < 1);
      v23 = v33;
    }
    while (v24 < (unint64_t)v33);
  }
  if (v24 - 16 != a1)
  {
    *(_DWORD *)a1 = *(_DWORD *)(v24 - 16);
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(v24 - 8);
  }
  *(float *)(v24 - 16) = v3;
  *(_QWORD *)(v24 - 8) = v4;
  return v24 - 16;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 result;
  float v6;
  float v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  float v17;
  float v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  BOOL v29;

  v4 = (a2 - a1) >> 4;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(float *)(a2 - 16);
      v7 = *(float *)a1;
      if (v6 == *(float *)a1)
        v8 = 0;
      else
        v8 = -127;
      if (v6 > *(float *)a1)
        v8 = 1;
      if (v6 < *(float *)a1)
        v8 = -1;
      if (v8
        || ((v9 = *(_QWORD *)(a2 - 8), v10 = *(_QWORD *)(a1 + 8), v11 = v9 == v10, v9 < v10)
          ? (LOBYTE(v8) = -1)
          : (LOBYTE(v8) = 1),
            !v11))
      {
        if ((char)v8 >= 1)
        {
          *(float *)a1 = v6;
          *(float *)(a2 - 16) = v7;
          v12 = *(_QWORD *)(a1 + 8);
          *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 - 8);
          *(_QWORD *)(a2 - 8) = v12;
        }
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a1 + 16, a2 - 16);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a1 + 16, a1 + 32, a2 - 16);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a1 + 16, a1 + 32, a1 + 48, a2 - 16);
      return 1;
    default:
      v13 = a1 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a1 + 16, a1 + 32);
      v14 = a1 + 48;
      if (a1 + 48 == a2)
        return 1;
      v15 = 0;
      v16 = 0;
      break;
  }
  while (1)
  {
    v17 = *(float *)v14;
    v18 = *(float *)v13;
    if (*(float *)v14 == *(float *)v13)
      v19 = 0;
    else
      v19 = -127;
    if (*(float *)v14 > *(float *)v13)
      v19 = 1;
    if (*(float *)v14 < *(float *)v13)
      v19 = -1;
    if (v19
      || ((v20 = *(_QWORD *)(v14 + 8), v21 = *(_QWORD *)(v13 + 8), v22 = v20 == v21, v20 < v21)
        ? (LOBYTE(v19) = -1)
        : (LOBYTE(v19) = 1),
          !v22))
    {
      if ((char)v19 >= 1)
      {
        v23 = *(_QWORD *)(v14 + 8);
        v24 = v15;
        while (1)
        {
          v25 = a1 + v24;
          *(float *)(v25 + 48) = v18;
          *(_QWORD *)(v25 + 56) = *(_QWORD *)(a1 + v24 + 40);
          if (v24 == -32)
          {
            v26 = a1;
            goto LABEL_49;
          }
          v26 = v13;
          v18 = *(float *)(v25 + 16);
          if (v17 == v18)
            v27 = 0;
          else
            v27 = -127;
          if (v17 > v18)
            v27 = 1;
          if (v17 < v18)
            v27 = -1;
          if (!v27)
          {
            v28 = *(_QWORD *)(a1 + v24 + 24);
            v29 = v23 == v28;
            LOBYTE(v27) = v23 < v28 ? -1 : 1;
            if (v29)
              break;
          }
          v13 -= 16;
          v24 -= 16;
          if ((char)v27 <= 0)
            goto LABEL_49;
        }
        v26 = a1 + v24 + 32;
LABEL_49:
        *(float *)v26 = v17;
        *(_QWORD *)(v26 + 8) = v23;
        if (++v16 == 8)
          return v14 + 16 == a2;
      }
    }
    v13 = v14;
    v15 += 16;
    v14 += 16;
    if (v14 == a2)
      return 1;
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  float v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  float v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  float v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a2, a3);
  v9 = *(float *)a3;
  if (*(float *)a4 == *(float *)a3)
    v10 = 0;
  else
    v10 = -127;
  if (*(float *)a4 > *(float *)a3)
    v10 = 1;
  if (*(float *)a4 < *(float *)a3)
    v10 = -1;
  if (v10
    || ((v11 = *(_QWORD *)(a4 + 8), v12 = *(_QWORD *)(a3 + 8), v13 = v11 == v12, v11 < v12)
      ? (LOBYTE(v10) = -1)
      : (LOBYTE(v10) = 1),
        !v13))
  {
    if ((char)v10 >= 1)
    {
      *(_DWORD *)a3 = *(_DWORD *)a4;
      *(float *)a4 = v9;
      v14 = *(_QWORD *)(a3 + 8);
      *(_QWORD *)(a3 + 8) = *(_QWORD *)(a4 + 8);
      *(_QWORD *)(a4 + 8) = v14;
      v15 = *(float *)a2;
      if (*(float *)a3 == *(float *)a2)
        v16 = 0;
      else
        v16 = -127;
      if (*(float *)a3 > *(float *)a2)
        v16 = 1;
      if (*(float *)a3 < *(float *)a2)
        v16 = -1;
      if (v16
        || ((v17 = *(_QWORD *)(a3 + 8), v18 = *(_QWORD *)(a2 + 8), v19 = v17 == v18, v17 < v18)
          ? (LOBYTE(v16) = -1)
          : (LOBYTE(v16) = 1),
            !v19))
      {
        if ((char)v16 >= 1)
        {
          *(_DWORD *)a2 = *(_DWORD *)a3;
          *(float *)a3 = v15;
          v20 = *(_QWORD *)(a2 + 8);
          *(_QWORD *)(a2 + 8) = *(_QWORD *)(a3 + 8);
          *(_QWORD *)(a3 + 8) = v20;
          v21 = *(float *)a1;
          if (*(float *)a2 == *(float *)a1)
            v22 = 0;
          else
            v22 = -127;
          if (*(float *)a2 > *(float *)a1)
            v22 = 1;
          if (*(float *)a2 < *(float *)a1)
            v22 = -1;
          if (v22
            || ((v23 = *(_QWORD *)(a2 + 8), v24 = *(_QWORD *)(a1 + 8), v25 = v23 == v24, v23 < v24)
              ? (LOBYTE(v22) = -1)
              : (LOBYTE(v22) = 1),
                !v25))
          {
            if ((char)v22 >= 1)
            {
              *(_DWORD *)a1 = *(_DWORD *)a2;
              *(float *)a2 = v21;
              v26 = *(_QWORD *)(a1 + 8);
              *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
              *(_QWORD *)(a2 + 8) = v26;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  float v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  float v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  float v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  float v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;

  result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a2, a3, a4);
  v11 = *(float *)a4;
  if (*(float *)a5 == *(float *)a4)
    v12 = 0;
  else
    v12 = -127;
  if (*(float *)a5 > *(float *)a4)
    v12 = 1;
  if (*(float *)a5 < *(float *)a4)
    v12 = -1;
  if (v12
    || ((v13 = *(_QWORD *)(a5 + 8), v14 = *(_QWORD *)(a4 + 8), v15 = v13 == v14, v13 < v14)
      ? (LOBYTE(v12) = -1)
      : (LOBYTE(v12) = 1),
        !v15))
  {
    if ((char)v12 >= 1)
    {
      *(_DWORD *)a4 = *(_DWORD *)a5;
      *(float *)a5 = v11;
      v16 = *(_QWORD *)(a4 + 8);
      *(_QWORD *)(a4 + 8) = *(_QWORD *)(a5 + 8);
      *(_QWORD *)(a5 + 8) = v16;
      v17 = *(float *)a3;
      if (*(float *)a4 == *(float *)a3)
        v18 = 0;
      else
        v18 = -127;
      if (*(float *)a4 > *(float *)a3)
        v18 = 1;
      if (*(float *)a4 < *(float *)a3)
        v18 = -1;
      if (v18
        || ((v19 = *(_QWORD *)(a4 + 8), v20 = *(_QWORD *)(a3 + 8), v21 = v19 == v20, v19 < v20)
          ? (LOBYTE(v18) = -1)
          : (LOBYTE(v18) = 1),
            !v21))
      {
        if ((char)v18 >= 1)
        {
          *(_DWORD *)a3 = *(_DWORD *)a4;
          *(float *)a4 = v17;
          v22 = *(_QWORD *)(a3 + 8);
          *(_QWORD *)(a3 + 8) = *(_QWORD *)(a4 + 8);
          *(_QWORD *)(a4 + 8) = v22;
          v23 = *(float *)a2;
          if (*(float *)a3 == *(float *)a2)
            v24 = 0;
          else
            v24 = -127;
          if (*(float *)a3 > *(float *)a2)
            v24 = 1;
          if (*(float *)a3 < *(float *)a2)
            v24 = -1;
          if (v24
            || ((v25 = *(_QWORD *)(a3 + 8), v26 = *(_QWORD *)(a2 + 8), v27 = v25 == v26, v25 < v26)
              ? (LOBYTE(v24) = -1)
              : (LOBYTE(v24) = 1),
                !v27))
          {
            if ((char)v24 >= 1)
            {
              *(_DWORD *)a2 = *(_DWORD *)a3;
              *(float *)a3 = v23;
              v28 = *(_QWORD *)(a2 + 8);
              *(_QWORD *)(a2 + 8) = *(_QWORD *)(a3 + 8);
              *(_QWORD *)(a3 + 8) = v28;
              v29 = *(float *)a1;
              if (*(float *)a2 == *(float *)a1)
                v30 = 0;
              else
                v30 = -127;
              if (*(float *)a2 > *(float *)a1)
                v30 = 1;
              if (*(float *)a2 < *(float *)a1)
                v30 = -1;
              if (v30
                || ((v31 = *(_QWORD *)(a2 + 8), v32 = *(_QWORD *)(a1 + 8), v33 = v31 == v32, v31 < v32)
                  ? (LOBYTE(v30) = -1)
                  : (LOBYTE(v30) = 1),
                    !v33))
              {
                if ((char)v30 >= 1)
                {
                  *(_DWORD *)a1 = *(_DWORD *)a2;
                  *(float *)a2 = v29;
                  v34 = *(_QWORD *)(a1 + 8);
                  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
                  *(_QWORD *)(a2 + 8) = v34;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*,std::pair<float,long long>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  uint64_t v24;
  uint64_t v25;

  if (a1 != a2)
  {
    v8 = a2 - a1;
    v9 = (a2 - a1) >> 4;
    if (a2 - a1 >= 17)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = a1 + 16 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a4, v9, v12);
        v12 -= 16;
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
        v15 = *(float *)v14;
        if (*(float *)v14 == *(float *)a1)
          v16 = 0;
        else
          v16 = -127;
        if (*(float *)v14 > *(float *)a1)
          v16 = 1;
        if (*(float *)v14 < *(float *)a1)
          v16 = -1;
        if (v16
          || ((v17 = *(_QWORD *)(v14 + 8), v18 = *(_QWORD *)(a1 + 8), v19 = v17 == v18, v17 < v18)
            ? (LOBYTE(v16) = -1)
            : (LOBYTE(v16) = 1),
              !v19))
        {
          if ((char)v16 >= 1)
          {
            *(_DWORD *)v14 = *(_DWORD *)a1;
            *(float *)a1 = v15;
            v20 = *(_QWORD *)(v14 + 8);
            *(_QWORD *)(v14 + 8) = *(_QWORD *)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v20;
            std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(a1, a4, v9, a1);
          }
        }
        v14 += 16;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 17)
    {
      v21 = (unint64_t)v8 >> 4;
      v22 = a2 - 16;
      do
      {
        v23 = *(float *)a1;
        v24 = *(_QWORD *)(a1 + 8);
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, a4, v21);
        if (v22 == v25)
        {
          *(float *)v25 = v23;
          *(_QWORD *)(v25 + 8) = v24;
        }
        else
        {
          *(_DWORD *)v25 = *(_DWORD *)v22;
          *(_QWORD *)(v25 + 8) = *(_QWORD *)(v22 + 8);
          *(float *)v22 = v23;
          *(_QWORD *)(v22 + 8) = v24;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::__wrap_iter<std::pair<float,long long>*>>(a1, v25 + 16, a4, (v25 + 16 - a1) >> 4);
        }
        v22 -= 16;
      }
      while (v21-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::greater<std::pair<float,long long>> &,std::pair<float,long long>*>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  float v15;
  float v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  int v31;
  uint64_t v32;
  BOOL v33;

  if (a3 >= 2)
  {
    v4 = a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= (a4 - result) >> 4)
    {
      v6 = v4 >> 3;
      v7 = (v4 >> 3) + 1;
      v8 = result + 16 * v7;
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = *(float *)(v8 + 16);
        if (*(float *)v8 == v10)
          v11 = 0;
        else
          v11 = -127;
        if (*(float *)v8 > v10)
          v11 = 1;
        if (*(float *)v8 < v10)
          v11 = -1;
        if (v11
          || ((v12 = *(_QWORD *)(result + 16 * v7 + 8), v13 = *(_QWORD *)(v8 + 24), v14 = v12 == v13, v12 < v13)
            ? (LOBYTE(v11) = -1)
            : (LOBYTE(v11) = 1),
              !v14))
        {
          if ((char)v11 > 0)
          {
            v8 += 16;
            v7 = v9;
          }
        }
      }
      v15 = *(float *)v8;
      v16 = *(float *)a4;
      if (*(float *)v8 == *(float *)a4)
        v17 = 0;
      else
        v17 = -127;
      if (*(float *)v8 > *(float *)a4)
        v17 = 1;
      if (*(float *)v8 < *(float *)a4)
        v18 = -1;
      else
        v18 = v17;
      if (v18
        || ((v19 = *(_QWORD *)(v8 + 8), v20 = *(_QWORD *)(a4 + 8), v21 = v19 == v20, v19 < v20)
          ? (LOBYTE(v18) = -1)
          : (LOBYTE(v18) = 1),
            !v21))
      {
        if ((char)v18 > 0)
          return result;
        v19 = *(_QWORD *)(a4 + 8);
      }
      do
      {
        v22 = v8;
        *(float *)a4 = v15;
        *(_QWORD *)(a4 + 8) = *(_QWORD *)(v8 + 8);
        if (v5 < v7)
          break;
        v23 = (2 * v7) | 1;
        v8 = result + 16 * v23;
        v24 = 2 * v7 + 2;
        if (v24 >= a3)
        {
          v7 = (2 * v7) | 1;
        }
        else
        {
          v25 = *(float *)(v8 + 16);
          if (*(float *)v8 == v25)
            v26 = 0;
          else
            v26 = -127;
          if (*(float *)v8 > v25)
            v26 = 1;
          if (*(float *)v8 < v25)
            v27 = -1;
          else
            v27 = v26;
          if (v27
            || ((v28 = *(_QWORD *)(result + 16 * v23 + 8),
                 v29 = *(_QWORD *)(v8 + 24),
                 v7 = v23,
                 v30 = v28 == v29,
                 v28 < v29)
              ? (LOBYTE(v27) = -1)
              : (LOBYTE(v27) = 1),
                !v30))
          {
            if ((char)v27 <= 0)
            {
              v7 = v23;
            }
            else
            {
              v8 += 16;
              v7 = v24;
            }
          }
        }
        v15 = *(float *)v8;
        if (*(float *)v8 == v16)
          v31 = 0;
        else
          v31 = -127;
        if (*(float *)v8 > v16)
          v31 = 1;
        if (*(float *)v8 < v16)
          v31 = -1;
        if (!v31)
        {
          v32 = *(_QWORD *)(v8 + 8);
          v33 = v32 == v19;
          if (v32 < v19)
            LOBYTE(v31) = -1;
          else
            LOBYTE(v31) = 1;
          if (v33)
            LOBYTE(v31) = 0;
        }
        a4 = v22;
      }
      while ((char)v31 < 1);
      *(float *)v22 = v16;
      *(_QWORD *)(v22 + 8) = v19;
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyBufferFromStart<HashML::ModelContainer>(flatbuffers::Verifier *this, const char *a2, unint64_t a3)
{
  unsigned int v5;

  return (!a2 || *((_QWORD *)this + 1) >= 8uLL && !strncmp((const char *)(*(_QWORD *)this + a3 + 4), a2, 4uLL))
      && (v5 = flatbuffers::Verifier::VerifyOffset(this, a3)) != 0
      && HashML::ModelContainer::Verify((HashML::ModelContainer *)(*(_QWORD *)this + a3 + v5), this);
}

uint64_t flatbuffers::Verifier::VerifyOffset(flatbuffers::Verifier *this, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;

  if ((a2 & 3) != 0 && *((_BYTE *)this + 40))
    return 0;
  v2 = *((_QWORD *)this + 1);
  if (v2 < 5 || v2 - 4 < a2)
    return 0;
  v4 = *(unsigned int *)(*(_QWORD *)this + a2);
  if ((int)v4 < 1)
    return 0;
  if (v2 - 1 >= v4 + a2)
    return v4;
  return 0;
}

BOOL HashML::ModelContainer::Verify(HashML::ModelContainer *this, flatbuffers::Verifier *a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned __int16 *v12;
  uint64_t v13;

  result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    v6 = *v5;
    if (v6 < 5)
      goto LABEL_18;
    if (!v5[2]
      || (result = 0, v7 = *((_QWORD *)a2 + 1), v7 >= 9) && v7 - 8 >= (unint64_t)this + v5[2] - *(_QWORD *)a2)
    {
      if (v6 < 7
        || (!v5[3]
         || (result = 0, v8 = *((_QWORD *)a2 + 1), v8 >= 9)
         && v8 - 8 >= (unint64_t)this + v5[3] - *(_QWORD *)a2)
        && (v6 < 9
         || (!v5[4]
          || (result = 0, v9 = *((_QWORD *)a2 + 1), v9 >= 9)
          && v9 - 8 >= (unint64_t)this + v5[4] - *(_QWORD *)a2)
         && (v6 < 0xB
          || (v10 = v5[5]) == 0
          || (result = 0, v11 = *((_QWORD *)a2 + 1), v11 >= 9)
          && v11 - 8 >= (unint64_t)this + v10 - *(_QWORD *)a2)))
      {
LABEL_18:
        result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
        if (result)
        {
          v12 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v12 < 0xDu
            || (v13 = v12[6]) == 0
            || (result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v13 + *(unsigned int *)((char *)this + v13), 1uLL, 0)))
          {
            --*((_DWORD *)a2 + 4);
            return 1;
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Table::VerifyOffset(flatbuffers::Table *this, const flatbuffers::Verifier *a2, unsigned int a3)
{
  unsigned __int16 *v3;
  uint64_t v4;

  v3 = (unsigned __int16 *)((char *)this - *(int *)this);
  return *v3 <= a3
      || (v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || flatbuffers::Verifier::VerifyOffset(a2, (unint64_t)this + v4 - *(_QWORD *)a2) != 0;
}

BOOL flatbuffers::Verifier::VerifyTableStart(flatbuffers::Verifier *this, const unsigned __int8 *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;

  v2 = *(_QWORD *)this;
  v3 = (unint64_t)&a2[-*(_QWORD *)this];
  if ((v3 & 3) != 0 && *((_BYTE *)this + 40))
    return 0;
  v4 = *((_QWORD *)this + 1);
  v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5)
    return 0;
  v6 = *(int *)a2;
  v7 = *((_DWORD *)this + 5);
  v8 = *((_DWORD *)this + 4) + 1;
  *((_DWORD *)this + 4) = v8;
  v9 = *((_DWORD *)this + 6) + 1;
  *((_DWORD *)this + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)this + 7))
    return 0;
  v10 = v3 - v6;
  if ((v10 & 1) != 0)
  {
    v11 = 0;
    if (*((_BYTE *)this + 40) || v4 - 2 < v10)
      return v11;
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((_BYTE *)this + 40))
    return 0;
  v5 = v4 >= v12;
  v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL flatbuffers::Verifier::VerifyVectorOrString(flatbuffers::Verifier *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  v4 = (unint64_t)&a2[-*(_QWORD *)this];
  if ((v4 & 3) != 0 && *((_BYTE *)this + 40))
    return 0;
  v5 = *((_QWORD *)this + 1);
  if (v5 < 5 || v5 - 4 < v4)
    return 0;
  v7 = *(unsigned int *)a2;
  if (0x7FFFFFFF / a3 <= v7)
    return 0;
  v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    v5 = *((_QWORD *)this + 1);
  }
  v9 = v5 > v8;
  v10 = v5 - v8;
  return v9 && v10 >= v4;
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x24BEDB870];
  v3 = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x24BEDB870] + 64;
  v4 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v5 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_24798601C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x249585BC0](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x249585BC0](a1 + 112);
  return a1;
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

  v13[0] = 0;
  v13[1] = 0;
  MEMORY[0x249585B48](v13, a1);
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
  MEMORY[0x249585B54](v13);
  return a1;
}

void sub_2479861D4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x249585B54](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2479861B4);
}

void sub_24798621C(_Unwind_Exception *a1)
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
  uint64_t v18;

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
      __p[0] = 0;
      __p[1] = 0;
      v18 = 0;
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(v18) < 0)
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

void sub_247986358(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  unint64_t v4;
  const void *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = (const void *)result;
  v6 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((_BYTE *)a2 + 23) = v4;
    if (!v4)
      goto LABEL_9;
  }
  result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((_BYTE *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1;
  unint64_t v3;

  v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 88) < v3)
      *(_QWORD *)(a1 + 88) = v3;
    return *(_QWORD *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(_QWORD *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void reranker::MultiHeadAttention<float>::forward(int *a1, const float *a2, const float *a3, const float *a4, float *a5, const float *a6, const float *a7, const float *a8, float *a9, const float *a10, const float *a11, const float *a12, const float *a13)
{
  float *v20;
  float *v21;
  float *v22;
  int v23;
  int v24;
  int v25;
  float *v26;
  float *__B;
  float *v28;
  float *__C;
  float *v30;
  int v31;
  int v32;
  uint64_t v33;
  float v34;
  int v35;
  int v36;
  int v37;
  _DWORD *v38;
  int v39;
  float *v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  unint64_t v47;
  int v48;
  void *__p;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  float *v67;
  float *v68;
  uint64_t v69;
  float *v70;
  float *v71;
  uint64_t v72;
  float *v73;
  float *v74;
  uint64_t v75;

  v45 = a1[3];
  v73 = 0;
  v74 = 0;
  v75 = 0;
  v44 = *a1;
  std::vector<float>::vector(&v73, a1[1] * (uint64_t)*a1);
  v20 = v73;
  v70 = 0;
  v71 = 0;
  v72 = 0;
  std::vector<float>::vector(&v70, (*a1 * *a1));
  v21 = v70;
  v67 = 0;
  v68 = 0;
  v69 = 0;
  std::vector<float>::vector(&v67, a1[2] * (uint64_t)*a1);
  v22 = v67;
  v23 = a1[1];
  v64 = (void *)(*a1 | ((unint64_t)*a1 << 32));
  LODWORD(v65) = v23;
  reranker::Linear::forward((reranker::Linear *)&v64, a2, v20, a6, a7);
  v24 = a1[2];
  v64 = (void *)(*a1 | ((unint64_t)*a1 << 32));
  LODWORD(v65) = v24;
  reranker::Linear::forward((reranker::Linear *)&v64, a3, v21, a8, a9);
  v25 = a1[2];
  v64 = (void *)(*a1 | ((unint64_t)*a1 << 32));
  LODWORD(v65) = v25;
  reranker::Linear::forward((reranker::Linear *)&v64, a4, v22, a10, a11);
  v64 = 0;
  v65 = 0;
  v66 = 0;
  std::vector<float>::vector(&v64, a1[1] * *a1 / a1[3]);
  v26 = (float *)v64;
  v61 = 0;
  v62 = 0;
  v63 = 0;
  std::vector<float>::vector(&v61, *a1 * *a1 / a1[3]);
  __B = (float *)v61;
  v58 = 0;
  v59 = 0;
  v60 = 0;
  std::vector<float>::vector(&v58, a1[2] * *a1 / a1[3]);
  v28 = (float *)v58;
  v55 = 0;
  v56 = 0;
  v57 = 0;
  std::vector<float>::vector(&v55, a1[2] * (uint64_t)a1[1]);
  __C = (float *)v55;
  v52 = 0;
  v53 = 0;
  v54 = 0;
  std::vector<float>::vector(&v52, *a1 * a1[1] / a1[3]);
  v30 = (float *)v52;
  __p = 0;
  v50 = 0;
  v51 = 0;
  std::vector<float>::vector(&__p, *a1 * (uint64_t)a1[1]);
  v31 = a1[3];
  v32 = a1[1];
  if (v31 >= 1)
  {
    v33 = 0;
    v34 = 1.0 / sqrt((float)v44 / (double)v45);
    do
    {
      cblas_scopy(v32 * *a1 / v31, &v73[v33], v31, v26, 1);
      cblas_scopy(a1[2] * *a1 / a1[3], &v70[v33], a1[3], __B, 1);
      cblas_scopy(a1[2] * *a1 / a1[3], &v67[v33], a1[3], v28, 1);
      cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasTrans, a1[1], a1[2], *a1 / a1[3], v34, v26, *a1 / a1[3], __B, *a1 / a1[3], 0.0, __C, a1[2]);
      v47 = *(_QWORD *)(a1 + 1);
      Softmax::forward((Softmax *)&v47, __C);
      cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, a1[1], *a1 / a1[3], a1[2], 1.0, __C, a1[2], v28, *a1 / a1[3], 0.0, v30, *a1 / a1[3]);
      v32 = a1[1];
      v31 = a1[3];
      if (v32 >= 1)
      {
        v35 = 0;
        v36 = *a1;
        v37 = *a1 / v31;
        v38 = __p;
        v39 = v37 * v33;
        do
        {
          if (v37 >= 1)
          {
            v40 = &v30[v36 * v35 / v31];
            v41 = (v36 / v31);
            v42 = v39;
            do
            {
              v43 = *(_DWORD *)v40++;
              v38[v42++] = v43;
              --v41;
            }
            while (v41);
          }
          ++v35;
          v39 += v36;
        }
        while (v35 != v32);
      }
      ++v33;
    }
    while (v33 < v31);
    v32 = a1[1];
  }
  v47 = *a1 | ((unint64_t)*a1 << 32);
  v48 = v32;
  reranker::Linear::forward((reranker::Linear *)&v47, (const float *)__p, a5, a12, a13);
  if (__p)
  {
    v50 = __p;
    operator delete(__p);
  }
  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }
  if (v55)
  {
    v56 = v55;
    operator delete(v55);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  if (v61)
  {
    v62 = v61;
    operator delete(v61);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  if (v67)
  {
    v68 = v67;
    operator delete(v67);
  }
  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }
  if (v73)
  {
    v74 = v73;
    operator delete(v73);
  }
}

void sub_24798697C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35)
{
  uint64_t v35;
  void *v37;
  void *v38;
  void *v39;

  if (__p)
    operator delete(__p);
  if (a22)
    operator delete(a22);
  if (a25)
    operator delete(a25);
  if (a28)
    operator delete(a28);
  if (a31)
    operator delete(a31);
  if (a34)
    operator delete(a34);
  v37 = *(void **)(v35 - 176);
  if (v37)
  {
    *(_QWORD *)(v35 - 168) = v37;
    operator delete(v37);
  }
  v38 = *(void **)(v35 - 152);
  if (v38)
  {
    *(_QWORD *)(v35 - 144) = v38;
    operator delete(v38);
  }
  v39 = *(void **)(v35 - 128);
  if (v39)
  {
    *(_QWORD *)(v35 - 120) = v39;
    operator delete(v39);
  }
  _Unwind_Resume(exception_object);
}

void reranker::Linear::forward(reranker::Linear *this, const float *__A, float *__C, const float *__B, const float *a5)
{
  int v8;

  cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, *((_DWORD *)this + 2), *((_DWORD *)this + 1), *(_DWORD *)this, 1.0, __A, *(_DWORD *)this, __B, *((_DWORD *)this + 1), 0.0, __C, *((_DWORD *)this + 1));
  if (*((int *)this + 2) >= 1)
  {
    v8 = 0;
    do
      cblas_saxpy(*((_DWORD *)this + 1), 1.0, a5, 1, &__C[*((_DWORD *)this + 1) * v8++], 1);
    while (v8 < *((_DWORD *)this + 2));
  }
}

void reranker::EncoderLayer<float>::forward(unsigned int *a1, const float *a2, float *a3, int *a4, int a5)
{
  unsigned __int16 *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 *v13;
  unsigned int v14;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  float *v59;
  float *v60;
  float v61;
  int v62;
  uint64_t v63;
  int v64;
  const float *v65;
  uint64_t v66;
  float *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  float *v71;
  float *v72;
  float v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  int v84;
  void *__p;
  unint64_t v86;
  uint64_t v87;
  float *v88;
  float *v89;
  uint64_t v90;

  if (a5 == 1)
  {
    v13 = (unsigned __int16 *)((char *)a4 - *a4);
    v14 = *v13;
    if (v14 >= 0x2F)
    {
      v15 = v13[23];
      if (v13[23])
        v15 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v15);
      v10 = v15 + 4;
      v82 = v15 + 4;
      if (v14 < 0x35)
      {
        if (v14 < 0x31)
          goto LABEL_34;
        v12 = 4;
      }
      else
      {
        v16 = v13[26];
        if (v13[26])
          v16 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v16);
        v12 = v16 + 4;
      }
      v26 = v13[24];
      if (v13[24])
        v26 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v26);
      v23 = v26 + 4;
      if (v14 < 0x37)
      {
        if (v14 < 0x33)
          goto LABEL_62;
        v22 = 4;
      }
      else
      {
        v27 = v13[27];
        if (v13[27])
          v27 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v27);
        v22 = v27 + 4;
      }
      v33 = v13[25];
      if (v13[25])
        v33 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v33);
      v29 = v33 + 4;
      v81 = v33 + 4;
      if (v14 >= 0x39)
      {
        v34 = v13[28];
        if (v13[28])
          v34 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v34);
        v17 = v34 + 4;
        if (v14 < 0x4B)
        {
          v18 = 4;
          if (v14 < 0x3B)
            goto LABEL_67;
          v19 = 4;
        }
        else
        {
          v35 = v13[37];
          if (v13[37])
            v35 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v35);
          v18 = v35 + 4;
          if (v14 < 0x4D)
          {
            v36 = 0;
          }
          else
          {
            v36 = v13[38];
            if (v13[38])
              v36 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v36);
          }
          v19 = v36 + 4;
        }
        v46 = v13[29];
        if (v13[29])
          v46 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v46);
        v79 = v46 + 4;
        if (v14 >= 0x3D)
        {
          v47 = v13[30];
          if (v13[30])
            v47 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v47);
          v78 = v47 + 4;
          if (v14 >= 0x3F)
          {
            v48 = v13[31];
            if (v13[31])
              v48 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v48);
            v77 = v48 + 4;
            if (v14 >= 0x41)
            {
              v49 = v13[32];
              if (v13[32])
                v49 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v49);
              v76 = v49 + 4;
              if (v14 >= 0x43)
              {
                v50 = v13[33];
                if (v13[33])
                  v50 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v50);
                v20 = v50 + 4;
                if (v14 >= 0x45)
                {
                  v51 = v13[34];
                  if (v13[34])
                    v51 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v51);
                  v21 = v51 + 4;
                  if (v14 >= 0x47)
                  {
                    v52 = v13[35];
                    if (v13[35])
                      v52 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v52);
                    v44 = v52 + 4;
                    if (v14 < 0x49)
                      goto LABEL_146;
                    v45 = v13[36];
                    if (!v45)
                      goto LABEL_146;
LABEL_117:
                    v81 = v29;
                    v82 = v10;
                    v74 = v44;
                    v75 = (char *)a4 + v45 + *(int *)((char *)a4 + v45);
                    goto LABEL_125;
                  }
                  goto LABEL_145;
                }
                goto LABEL_144;
              }
              goto LABEL_143;
            }
            goto LABEL_142;
          }
          goto LABEL_141;
        }
        goto LABEL_118;
      }
LABEL_61:
      v75 = 0;
      v17 = 4;
      v18 = 4;
      v19 = 4;
      v79 = 4;
LABEL_119:
      v78 = 4;
LABEL_120:
      v77 = 4;
LABEL_121:
      v76 = 4;
LABEL_122:
      v20 = 4;
LABEL_123:
      v21 = 4;
LABEL_124:
      v74 = 4;
      goto LABEL_125;
    }
LABEL_17:
    v81 = 4;
    v17 = 4;
    v18 = 4;
    v19 = 4;
    v79 = 4;
    v78 = 4;
    v77 = 4;
    v75 = 0;
    v76 = 4;
    v20 = 4;
    v21 = 4;
    v74 = 4;
    v22 = 4;
    v23 = 4;
    v12 = 4;
    v82 = 4;
    goto LABEL_125;
  }
  if (a5)
    exit(1);
  v7 = (unsigned __int16 *)((char *)a4 - *a4);
  v8 = *v7;
  if (v8 < 0xF)
    goto LABEL_17;
  v9 = v7[7];
  if (v7[7])
    v9 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v9);
  v10 = v9 + 4;
  v82 = v9 + 4;
  if (v8 < 0x15)
  {
    if (v8 >= 0x11)
    {
      v12 = 4;
      goto LABEL_20;
    }
LABEL_34:
    v81 = 4;
    v17 = 4;
    v18 = 4;
    v19 = 4;
    v79 = 4;
    v78 = 4;
    v77 = 4;
    v75 = 0;
    v76 = 4;
    v20 = 4;
    v21 = 4;
    v74 = 4;
    v22 = 4;
    v23 = 4;
    v12 = 4;
    goto LABEL_125;
  }
  v11 = v7[10];
  if (v7[10])
    v11 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v11);
  v12 = v11 + 4;
LABEL_20:
  v24 = v7[8];
  if (v7[8])
    v24 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v24);
  v23 = v24 + 4;
  if (v8 < 0x17)
  {
    if (v8 >= 0x13)
    {
      v22 = 4;
      goto LABEL_37;
    }
LABEL_62:
    v81 = 4;
    v17 = 4;
    v18 = 4;
    v19 = 4;
    v79 = 4;
    v78 = 4;
    v77 = 4;
    v75 = 0;
    v76 = 4;
    v20 = 4;
    v21 = 4;
    v74 = 4;
    v22 = 4;
    goto LABEL_125;
  }
  v25 = v7[11];
  if (v7[11])
    v25 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v25);
  v22 = v25 + 4;
LABEL_37:
  v28 = v7[9];
  if (v7[9])
    v28 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v28);
  v29 = v28 + 4;
  v81 = v28 + 4;
  if (v8 < 0x19)
    goto LABEL_61;
  v30 = v7[12];
  if (v7[12])
    v30 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v30);
  v17 = v30 + 4;
  if (v8 < 0x2B)
  {
    v18 = 4;
    if (v8 >= 0x1B)
    {
      v19 = 4;
      goto LABEL_70;
    }
LABEL_67:
    v19 = 4;
    v79 = 4;
    v78 = 4;
    v77 = 4;
    v75 = 0;
    v76 = 4;
    v20 = 4;
    v21 = 4;
    v74 = 4;
    v18 = 4;
    goto LABEL_125;
  }
  v31 = v7[21];
  if (v7[21])
    v31 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v31);
  v18 = v31 + 4;
  if (v8 < 0x2D)
  {
    v32 = 0;
  }
  else
  {
    v32 = v7[22];
    if (v7[22])
      v32 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v32);
  }
  v19 = v32 + 4;
LABEL_70:
  v37 = v7[13];
  if (v7[13])
    v37 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v37);
  v79 = v37 + 4;
  if (v8 < 0x1D)
  {
LABEL_118:
    v75 = 0;
    goto LABEL_119;
  }
  v38 = v7[14];
  if (v7[14])
    v38 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v38);
  v78 = v38 + 4;
  if (v8 < 0x1F)
  {
LABEL_141:
    v75 = 0;
    goto LABEL_120;
  }
  v39 = v7[15];
  if (v7[15])
    v39 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v39);
  v77 = v39 + 4;
  if (v8 < 0x21)
  {
LABEL_142:
    v75 = 0;
    goto LABEL_121;
  }
  v40 = v7[16];
  if (v7[16])
    v40 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v40);
  v76 = v40 + 4;
  if (v8 < 0x23)
  {
LABEL_143:
    v75 = 0;
    goto LABEL_122;
  }
  v41 = v7[17];
  if (v7[17])
    v41 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v41);
  v20 = v41 + 4;
  if (v8 < 0x25)
  {
LABEL_144:
    v75 = 0;
    goto LABEL_123;
  }
  v42 = v7[18];
  if (v7[18])
    v42 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v42);
  v21 = v42 + 4;
  if (v8 < 0x27)
  {
LABEL_145:
    v75 = 0;
    goto LABEL_124;
  }
  v43 = v7[19];
  if (v7[19])
    v43 += (uint64_t)a4 + *(unsigned int *)((char *)a4 + v43);
  v44 = v43 + 4;
  if (v8 >= 0x29)
  {
    v45 = v7[20];
    if (v45)
      goto LABEL_117;
  }
LABEL_146:
  v74 = v44;
  v75 = 0;
LABEL_125:
  v88 = 0;
  v89 = 0;
  v90 = 0;
  std::vector<float>::vector(&v88, (int)a1[1] * (uint64_t)(int)*a1);
  v53 = a1[1];
  v54 = (void *)(*a1 | (unint64_t)(v53 << 32));
  v55 = v53 | ((unint64_t)a1[3] << 32);
  __p = v54;
  v86 = v55;
  reranker::MultiHeadAttention<float>::forward((int *)&__p, a2, a2, a2, v88, (const float *)v82, (const float *)v12, (const float *)v23, (float *)v22, (const float *)v81, (const float *)v17, (const float *)v18, (const float *)v19);
  v57 = *a1;
  v56 = a1[1];
  v58 = (v57 * v56);
  v59 = v88;
  if ((int)v58 >= 1)
  {
    v60 = v88;
    do
    {
      v61 = *a2++;
      *v60 = v61 + *v60;
      ++v60;
      --v58;
    }
    while (v58);
  }
  __p = (void *)(v57 | (v56 << 32));
  LayerNorm<float>::forward((unsigned int *)&__p, v59, v20, v21);
  __p = 0;
  v86 = 0;
  v87 = 0;
  std::vector<float>::vector(&__p, (int)a1[1] * (uint64_t)(int)a1[2]);
  v62 = a1[1];
  v83 = *a1 | ((unint64_t)a1[2] << 32);
  v84 = v62;
  reranker::Linear::forward((reranker::Linear *)&v83, v88, (float *)__p, (const float *)v79, (const float *)v78);
  v64 = a1[1];
  v63 = a1[2];
  v65 = (const float *)__p;
  v66 = (v64 * v63);
  if ((int)v66 >= 1)
  {
    v67 = (float *)__p;
    do
    {
      if (*v67 < 0.0)
        *v67 = 0.0;
      ++v67;
      --v66;
    }
    while (v66);
  }
  v83 = v63 | ((unint64_t)*a1 << 32);
  v84 = v64;
  reranker::Linear::forward((reranker::Linear *)&v83, v65, a3, (const float *)v77, (const float *)v76);
  v69 = *a1;
  v68 = a1[1];
  v70 = (v69 * v68);
  if ((int)v70 >= 1)
  {
    v71 = v88;
    v72 = a3;
    do
    {
      v73 = *v71++;
      *v72 = v73 + *v72;
      ++v72;
      --v70;
    }
    while (v70);
  }
  v83 = v69 | (v68 << 32);
  LayerNorm<float>::forward((unsigned int *)&v83, a3, v74, (uint64_t)(v75 + 4));
  if (__p)
  {
    v86 = (unint64_t)__p;
    operator delete(__p);
  }
  if (v88)
  {
    v89 = v88;
    operator delete(v88);
  }
}

void sub_24798735C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  uint64_t v27;
  void *v29;

  if (__p)
    operator delete(__p);
  v29 = *(void **)(v27 - 112);
  if (v29)
  {
    *(_QWORD *)(v27 - 104) = v29;
    operator delete(v29);
  }
  _Unwind_Resume(exception_object);
}

void Softmax::forward(Softmax *this, float *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  float *v9;
  float v10;
  float v11;
  unint64_t v12;
  float v13;
  float v14;
  unint64_t v15;

  v2 = *(unsigned int *)this;
  if ((int)v2 >= 1)
  {
    v4 = 0;
    v5 = *((unsigned int *)this + 1);
    v6 = 4 * v5;
    do
    {
      if ((int)v5 >= 1)
      {
        v7 = 0.0;
        v8 = v5;
        v9 = a2;
        do
        {
          v10 = *v9++;
          v11 = v10;
          if (v7 < v10)
            v7 = v11;
          --v8;
        }
        while (v8);
        v12 = 0;
        v13 = 0.0;
        do
        {
          v14 = expf(a2[v12 / 4] - v7);
          a2[v12 / 4] = v14;
          v13 = v13 + v14;
          v12 += 4;
        }
        while (v6 != v12);
        v15 = 0;
        do
        {
          a2[v15 / 4] = a2[v15 / 4] / v13;
          v15 += 4;
        }
        while (v6 != v15);
      }
      ++v4;
      a2 += (int)v5;
    }
    while (v4 != v2);
  }
}

unsigned int *LayerNorm<float>::forward(unsigned int *result, float *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  float *v10;
  float v11;
  float v12;
  uint64_t v13;
  float v14;
  float v15;

  v4 = result[1];
  if ((int)v4 >= 1)
  {
    v5 = 0;
    v6 = *result;
    v7 = (float)(int)v6;
    do
    {
      if ((int)v6 < 1)
      {
        v11 = 0.0;
        v8 = 0.0;
      }
      else
      {
        v8 = 0.0;
        v9 = v6;
        v10 = a2;
        v11 = 0.0;
        do
        {
          v12 = *v10++;
          v11 = v11 + v12;
          v8 = v8 + (float)(v12 * v12);
          --v9;
        }
        while (v9);
      }
      if ((int)v6 >= 1)
      {
        v13 = 0;
        v14 = v11 / v7;
        v15 = sqrt((float)((float)(v8 / v7) - (float)(v14 * v14)) + 0.00001);
        do
        {
          a2[v13] = *(float *)(a4 + v13 * 4) + (float)((float)((float)(a2[v13] - v14) / v15) * *(float *)(a3 + v13 * 4));
          ++v13;
        }
        while (v6 != v13);
      }
      ++v5;
      a2 += (int)v6;
    }
    while (v5 != v4);
  }
  return result;
}

void verify_model_from_container_flatbuffer_cold_1()
{
  __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
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

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return MEMORY[0x24BEDB3B0]();
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
  off_2519050A0(__p);
}

uint64_t operator delete()
{
  return off_2519050A8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2519050B0(__sz);
}

uint64_t operator new()
{
  return off_2519050B8();
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

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void cblas_saxpy(const int __N, const float __alpha, const float *__X, const int __incX, float *__Y, const int __incY)
{
  MEMORY[0x24BDB2B98](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY, __alpha);
}

void cblas_scopy(const int __N, const float *__X, const int __incX, float *__Y, const int __incY)
{
  MEMORY[0x24BDB2BA8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY);
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  float result;

  MEMORY[0x24BDB2BB8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY);
  return result;
}

void cblas_sgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const float __alpha, const float *__A, const int __lda, const float *__B, const int __ldb, const float __beta, float *__C, const int __ldc)
{
  MEMORY[0x24BDB2BC8](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__TransB, *(_QWORD *)&__M, *(_QWORD *)&__N, *(_QWORD *)&__K, __A, *(_QWORD *)&__lda, __alpha, __beta);
}

void cblas_sgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const float __alpha, const float *__A, const int __lda, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
  MEMORY[0x24BDB2BE0](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__M, *(_QWORD *)&__N, __A, *(_QWORD *)&__lda, __X, *(_QWORD *)&__incX, __alpha, __beta);
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  float result;

  MEMORY[0x24BDB2C08](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
  return result;
}

void cblas_sscal(const int __N, const float __alpha, float *__X, const int __incX)
{
  MEMORY[0x24BDB2C18](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __alpha);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

uint64_t logForCSLogCategoryRecs()
{
  return MEMORY[0x24BDC25A0]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x24BDAF7C0](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDAFA98](a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

