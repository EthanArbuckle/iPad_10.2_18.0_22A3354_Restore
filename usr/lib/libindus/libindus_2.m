uint64_t XofSvcsIf::GetSbasBrdCstEphData(uint64_t a1, char **a2)
{
  std::mutex *v4;
  _QWORD *v5;
  _QWORD *v6;
  char *v7;
  __int128 *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  char *v24;
  _QWORD *v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;

  a2[1] = *a2;
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1 && *(_BYTE *)(a1 + 66))
  {
    if (*(_QWORD *)(a1 + 824))
    {
      v5 = *(_QWORD **)(a1 + 808);
      v6 = (_QWORD *)(a1 + 816);
      if (v5 != v6)
      {
        v7 = a2[1];
        do
        {
          v8 = (__int128 *)(v5 + 4);
          v9 = (unint64_t)a2[2];
          if ((unint64_t)v7 >= v9)
          {
            v12 = *a2;
            v13 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - *a2) >> 3);
            v14 = v13 + 1;
            if (v13 + 1 > 0x666666666666666)
              std::vector<gnss::Measurement>::__throw_length_error[abi:ne180100]();
            v15 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v9 - (_QWORD)v12) >> 3);
            if (2 * v15 > v14)
              v14 = 2 * v15;
            if (v15 >= 0x333333333333333)
              v16 = 0x666666666666666;
            else
              v16 = v14;
            if (v16)
            {
              if (v16 > 0x666666666666666)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v17 = (char *)operator new(40 * v16);
            }
            else
            {
              v17 = 0;
            }
            v18 = &v17[40 * v13];
            v19 = *v8;
            v20 = *((_OWORD *)v5 + 3);
            *((_QWORD *)v18 + 4) = v5[8];
            *(_OWORD *)v18 = v19;
            *((_OWORD *)v18 + 1) = v20;
            if (v7 == v12)
            {
              v24 = v7;
              v21 = &v17[40 * v13];
            }
            else
            {
              v21 = &v17[40 * v13];
              do
              {
                v22 = *(_OWORD *)(v7 - 40);
                v23 = *(_OWORD *)(v7 - 24);
                *(_QWORD *)(v21 - 9) = *(_QWORD *)(v7 - 9);
                *(_OWORD *)(v21 - 24) = v23;
                *(_OWORD *)(v21 - 40) = v22;
                v21 -= 40;
                v7 -= 40;
              }
              while (v7 != v12);
              v24 = *a2;
            }
            v7 = v18 + 40;
            *a2 = v21;
            a2[1] = v18 + 40;
            a2[2] = &v17[40 * v16];
            if (v24)
              operator delete(v24);
          }
          else
          {
            v10 = *v8;
            v11 = *((_OWORD *)v5 + 3);
            *((_QWORD *)v7 + 4) = v5[8];
            *(_OWORD *)v7 = v10;
            *((_OWORD *)v7 + 1) = v11;
            v7 += 40;
          }
          a2[1] = v7;
          v25 = (_QWORD *)v5[1];
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
              v26 = (_QWORD *)v5[2];
              v27 = *v26 == (_QWORD)v5;
              v5 = v26;
            }
            while (!v27);
          }
          v5 = v26;
        }
        while (v26 != v6);
      }
      v28 = 1;
    }
    else
    {
      v28 = 10;
    }
  }
  else
  {
    v28 = 7;
  }
  std::mutex::unlock(v4);
  return v28;
}

void sub_24BBB4D48(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetNavicBrdCstEphData(uint64_t a1, char **a2)
{
  std::mutex *v4;
  uint64_t BrdCstEph;

  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  BrdCstEph = XofSvcsIf::GetBrdCstEphData<XofNavicEphemeris>(a1, 6, (_QWORD *)(a1 + 832), a2);
  std::mutex::unlock(v4);
  return BrdCstEph;
}

void sub_24BBB4DF0(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetBrdCstEphData<XofNavicEphemeris>(uint64_t a1, int a2, _QWORD *a3, char **a4)
{
  _OWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _OWORD *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char *v27;
  _QWORD *v28;
  _QWORD *v29;
  BOOL v30;

  v4 = *a4;
  a4[1] = *a4;
  if (*(_DWORD *)(a1 + 1128) != 1 || !*(_BYTE *)(a1 + 48 * a2 + 18))
    return 7;
  if (!a3[2])
    return 10;
  v5 = a3 + 1;
  v6 = (_QWORD *)*a3;
  if ((_QWORD *)*a3 != a3 + 1)
  {
    do
    {
      v8 = v6 + 4;
      v9 = (unint64_t)a4[2];
      if ((unint64_t)v4 >= v9)
      {
        v13 = *a4;
        v14 = 0xF0F0F0F0F0F0F0F1 * (((char *)v4 - *a4) >> 2);
        v15 = v14 + 1;
        if (v14 + 1 > 0x3C3C3C3C3C3C3C3)
          std::vector<gnss::Measurement>::__throw_length_error[abi:ne180100]();
        v16 = 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(v9 - (_QWORD)v13) >> 2);
        if (2 * v16 > v15)
          v15 = 2 * v16;
        if (v16 >= 0x1E1E1E1E1E1E1E1)
          v17 = 0x3C3C3C3C3C3C3C3;
        else
          v17 = v15;
        if (v17)
        {
          if (v17 > 0x3C3C3C3C3C3C3C3)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v18 = (char *)operator new(68 * v17);
        }
        else
        {
          v18 = 0;
        }
        v19 = &v18[68 * v14];
        *(_OWORD *)v19 = *v8;
        v20 = *((_OWORD *)v6 + 3);
        v21 = *((_OWORD *)v6 + 4);
        v22 = *((_OWORD *)v6 + 5);
        *((_DWORD *)v19 + 16) = *((_DWORD *)v6 + 24);
        *((_OWORD *)v19 + 2) = v21;
        *((_OWORD *)v19 + 3) = v22;
        *((_OWORD *)v19 + 1) = v20;
        if (v4 == (_OWORD *)v13)
        {
          v27 = (char *)v4;
          v23 = &v18[68 * v14];
        }
        else
        {
          v23 = &v18[68 * v14];
          do
          {
            *(_OWORD *)(v23 - 68) = *(_OWORD *)((char *)v4 - 68);
            v24 = *(_OWORD *)((char *)v4 - 52);
            v25 = *(_OWORD *)((char *)v4 - 36);
            v26 = *(_OWORD *)((char *)v4 - 20);
            *((_DWORD *)v23 - 1) = *((_DWORD *)v4 - 1);
            *(_OWORD *)(v23 - 20) = v26;
            *(_OWORD *)(v23 - 36) = v25;
            *(_OWORD *)(v23 - 52) = v24;
            v23 -= 68;
            v4 = (_OWORD *)((char *)v4 - 68);
          }
          while (v4 != (_OWORD *)v13);
          v27 = *a4;
        }
        v4 = v19 + 68;
        *a4 = v23;
        a4[1] = v19 + 68;
        a4[2] = &v18[68 * v17];
        if (v27)
          operator delete(v27);
      }
      else
      {
        *v4 = *v8;
        v10 = *((_OWORD *)v6 + 3);
        v11 = *((_OWORD *)v6 + 4);
        v12 = *((_OWORD *)v6 + 5);
        *((_DWORD *)v4 + 16) = *((_DWORD *)v6 + 24);
        v4[2] = v11;
        v4[3] = v12;
        v4[1] = v10;
        v4 = (_OWORD *)((char *)v4 + 68);
      }
      a4[1] = (char *)v4;
      v28 = (_QWORD *)v6[1];
      if (v28)
      {
        do
        {
          v29 = v28;
          v28 = (_QWORD *)*v28;
        }
        while (v28);
      }
      else
      {
        do
        {
          v29 = (_QWORD *)v6[2];
          v30 = *v29 == (_QWORD)v6;
          v6 = v29;
        }
        while (!v30);
      }
      v6 = v29;
    }
    while (v29 != v5);
  }
  return 1;
}

uint64_t XofSvcsIf::GetGpsSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  std::mutex *v7;
  uint64_t v8;
  uint64_t v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, 0, a3, v10, a1 + 856, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_24BBB50F4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(uint64_t a1, int a2, unsigned int a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 1128) == 1 && (v12 = 0, XofSvcsIf::GetExtEphBlockNum(a1, a2, *a4, &v12) == 1))
    return XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, a2, a3, v12, a5, a6);
  else
    return 7;
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  BOOL v23;
  uint64_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  result = 7;
  if (a2 != 7 && *(_DWORD *)(a1 + 1128) == 1)
  {
    v8 = a1 + 16;
    if (*(_BYTE *)(v8 + 48 * a2 + 3))
    {
      v9 = *(_QWORD *)(v8 + 48 * a2 + 8);
      if (a2 == 1)
        v10 = -120;
      else
        v10 = -1;
      if (a2 == 2)
        v10 = 63;
      if (((v9 >> (v10 + a3)) & 1) != 0)
      {
        if (a4 <= 0x2A)
        {
          v13 = *(_QWORD *)(a5 + 8);
          v11 = a5 + 8;
          v12 = v13;
          if (v13)
          {
            v14 = v11;
            do
            {
              v15 = *(unsigned __int8 *)(v12 + 32);
              v16 = v15 >= a4;
              if (v15 >= a4)
                v17 = (uint64_t *)v12;
              else
                v17 = (uint64_t *)(v12 + 8);
              if (v16)
                v14 = v12;
              v12 = *v17;
            }
            while (*v17);
            if (v14 == v11)
              return 7;
            if (*(unsigned __int8 *)(v14 + 32) > a4)
              return 7;
            v20 = *(_QWORD *)(v14 + 48);
            v18 = v14 + 48;
            v19 = v20;
            if (!v20)
              return 7;
            v21 = v18;
            do
            {
              v22 = *(unsigned __int8 *)(v19 + 28);
              v23 = v22 >= a3;
              if (v22 >= a3)
                v24 = (uint64_t *)v19;
              else
                v24 = (uint64_t *)(v19 + 8);
              if (v23)
                v21 = v19;
              v19 = *v24;
            }
            while (*v24);
            if (v21 == v18 || *(unsigned __int8 *)(v21 + 28) > a3)
            {
              return 7;
            }
            else
            {
              *(_OWORD *)a6 = *(_OWORD *)(v21 + 32);
              v25 = *(_OWORD *)(v21 + 48);
              v26 = *(_OWORD *)(v21 + 64);
              v27 = *(_OWORD *)(v21 + 80);
              *(_QWORD *)(a6 + 64) = *(_QWORD *)(v21 + 96);
              *(_OWORD *)(a6 + 32) = v26;
              *(_OWORD *)(a6 + 48) = v27;
              *(_OWORD *)(a6 + 16) = v25;
              return 1;
            }
          }
        }
        else
        {
          return 9;
        }
      }
    }
  }
  return result;
}

uint64_t XofSvcsIf::GetGloSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  std::mutex *v7;
  uint64_t v8;
  uint64_t v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, 4, a3, v10, a1 + 880, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_24BBB53B8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetQzssSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  std::mutex *v7;
  uint64_t v8;
  uint64_t v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, 2, a3, v10, a1 + 928, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_24BBB5468(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetGalSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  std::mutex *v7;
  uint64_t v8;
  uint64_t v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,XofGpsQzssEphemeris>(a1, 3, a3, v10, a1 + 904, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_24BBB5518(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetBdsSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  std::mutex *v7;
  uint64_t v8;
  uint64_t v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofBeidouEphemeris>>,XofBeidouEphemeris>(a1, 5, a3, v10, a1 + 952, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_24BBB55C8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofBeidouEphemeris>>,XofBeidouEphemeris>(uint64_t a1, int a2, unsigned int a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 1128) == 1 && (v12 = 0, XofSvcsIf::GetExtEphBlockNum(a1, a2, *a4, &v12) == 1))
    return XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofBeidouEphemeris>>,XofBeidouEphemeris>(a1, a2, a3, v12, a5, a6);
  else
    return 7;
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofBeidouEphemeris>>,XofBeidouEphemeris>(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  BOOL v23;
  uint64_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  result = 7;
  if (a2 != 7 && *(_DWORD *)(a1 + 1128) == 1)
  {
    v8 = a1 + 16;
    if (*(_BYTE *)(v8 + 48 * a2 + 3))
    {
      v9 = *(_QWORD *)(v8 + 48 * a2 + 8);
      if (a2 == 1)
        v10 = -120;
      else
        v10 = -1;
      if (a2 == 2)
        v10 = 63;
      if (((v9 >> (v10 + a3)) & 1) != 0)
      {
        if (a4 <= 0x2A)
        {
          v13 = *(_QWORD *)(a5 + 8);
          v11 = a5 + 8;
          v12 = v13;
          if (v13)
          {
            v14 = v11;
            do
            {
              v15 = *(unsigned __int8 *)(v12 + 32);
              v16 = v15 >= a4;
              if (v15 >= a4)
                v17 = (uint64_t *)v12;
              else
                v17 = (uint64_t *)(v12 + 8);
              if (v16)
                v14 = v12;
              v12 = *v17;
            }
            while (*v17);
            if (v14 == v11)
              return 7;
            if (*(unsigned __int8 *)(v14 + 32) > a4)
              return 7;
            v20 = *(_QWORD *)(v14 + 48);
            v18 = v14 + 48;
            v19 = v20;
            if (!v20)
              return 7;
            v21 = v18;
            do
            {
              v22 = *(unsigned __int8 *)(v19 + 32);
              v23 = v22 >= a3;
              if (v22 >= a3)
                v24 = (uint64_t *)v19;
              else
                v24 = (uint64_t *)(v19 + 8);
              if (v23)
                v21 = v19;
              v19 = *v24;
            }
            while (*v24);
            if (v21 == v18 || *(unsigned __int8 *)(v21 + 32) > a3)
            {
              return 7;
            }
            else
            {
              *(_OWORD *)a6 = *(_OWORD *)(v21 + 40);
              v25 = *(_OWORD *)(v21 + 56);
              v26 = *(_OWORD *)(v21 + 72);
              v27 = *(_OWORD *)(v21 + 104);
              *(_OWORD *)(a6 + 48) = *(_OWORD *)(v21 + 88);
              *(_OWORD *)(a6 + 64) = v27;
              *(_OWORD *)(a6 + 16) = v25;
              *(_OWORD *)(a6 + 32) = v26;
              v28 = *(_OWORD *)(v21 + 120);
              v29 = *(_OWORD *)(v21 + 136);
              v30 = *(_OWORD *)(v21 + 152);
              *(_QWORD *)(a6 + 126) = *(_QWORD *)(v21 + 166);
              *(_OWORD *)(a6 + 96) = v29;
              *(_OWORD *)(a6 + 112) = v30;
              *(_OWORD *)(a6 + 80) = v28;
              return 1;
            }
          }
        }
        else
        {
          return 9;
        }
      }
    }
  }
  return result;
}

uint64_t XofSvcsIf::GetNavicSvOrbData(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  std::mutex *v7;
  uint64_t v8;
  uint64_t v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v10[0] = a2;
  v7 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  v8 = XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofNavicEphemeris>>,XofNavicEphemeris>(a1, 6, a3, v10, a1 + 976, a4);
  std::mutex::unlock(v7);
  return v8;
}

void sub_24BBB58A8(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofNavicEphemeris>>,XofNavicEphemeris>(uint64_t a1, int a2, unsigned int a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 1128) == 1 && (v12 = 0, XofSvcsIf::GetExtEphBlockNum(a1, a2, *a4, &v12) == 1))
    return XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofNavicEphemeris>>,XofNavicEphemeris>(a1, a2, a3, v12, a5, a6);
  else
    return 7;
}

uint64_t XofSvcsIf::GetExtEphData<std::map<unsigned char,std::map<unsigned char,XofNavicEphemeris>>,XofNavicEphemeris>(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  BOOL v23;
  uint64_t *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  result = 7;
  if (a2 != 7 && *(_DWORD *)(a1 + 1128) == 1)
  {
    v8 = a1 + 16;
    if (*(_BYTE *)(v8 + 48 * a2 + 3))
    {
      v9 = *(_QWORD *)(v8 + 48 * a2 + 8);
      if (a2 == 1)
        v10 = -120;
      else
        v10 = -1;
      if (a2 == 2)
        v10 = 63;
      if (((v9 >> (v10 + a3)) & 1) != 0)
      {
        if (a4 <= 0x2A)
        {
          v13 = *(_QWORD *)(a5 + 8);
          v11 = a5 + 8;
          v12 = v13;
          if (v13)
          {
            v14 = v11;
            do
            {
              v15 = *(unsigned __int8 *)(v12 + 32);
              v16 = v15 >= a4;
              if (v15 >= a4)
                v17 = (uint64_t *)v12;
              else
                v17 = (uint64_t *)(v12 + 8);
              if (v16)
                v14 = v12;
              v12 = *v17;
            }
            while (*v17);
            if (v14 == v11)
              return 7;
            if (*(unsigned __int8 *)(v14 + 32) > a4)
              return 7;
            v20 = *(_QWORD *)(v14 + 48);
            v18 = v14 + 48;
            v19 = v20;
            if (!v20)
              return 7;
            v21 = v18;
            do
            {
              v22 = *(unsigned __int8 *)(v19 + 28);
              v23 = v22 >= a3;
              if (v22 >= a3)
                v24 = (uint64_t *)v19;
              else
                v24 = (uint64_t *)(v19 + 8);
              if (v23)
                v21 = v19;
              v19 = *v24;
            }
            while (*v24);
            if (v21 == v18 || *(unsigned __int8 *)(v21 + 28) > a3)
            {
              return 7;
            }
            else
            {
              *(_OWORD *)a6 = *(_OWORD *)(v21 + 32);
              v25 = *(_OWORD *)(v21 + 48);
              v26 = *(_OWORD *)(v21 + 64);
              v27 = *(_OWORD *)(v21 + 80);
              *(_DWORD *)(a6 + 64) = *(_DWORD *)(v21 + 96);
              *(_OWORD *)(a6 + 32) = v26;
              *(_OWORD *)(a6 + 48) = v27;
              *(_OWORD *)(a6 + 16) = v25;
              return 1;
            }
          }
        }
        else
        {
          return 9;
        }
      }
    }
  }
  return result;
}

uint64_t XofSvcsIf::GetRtiData(uint64_t a1, int a2, _OWORD *a3)
{
  std::mutex *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char __str[966];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (std::mutex *)(a1 + 1200);
  std::mutex::lock((std::mutex *)(a1 + 1200));
  if (*(_DWORD *)(a1 + 1132) == 1)
  {
    if (a2 == 7)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Unknown constellation\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 87, "GetRtiData");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      v8 = 9;
    }
    else
    {
      *a3 = *(_OWORD *)(a1 + 16 * a2 + 1016);
      v8 = 1;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RTI data is not parsed yet!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 87, "GetRtiData");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v8 = 7;
  }
  std::mutex::unlock(v6);
  return v8;
}

void sub_24BBB5C78(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void XofSvcsIf::ClrBceOrbData(XofSvcsIf *this)
{
  char *v2;
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  _QWORD *v24;
  uint64_t v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  _QWORD *v30;
  uint64_t v31;
  char *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  std::mutex *v44;
  _QWORD **v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD **v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD **v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD **v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD **v57;
  _QWORD *v58;
  uint64_t v59;
  _QWORD **v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v44 = (std::mutex *)((char *)this + 1136);
  std::mutex::lock((std::mutex *)((char *)this + 1136));
  v45 = &v46;
  v46 = 0;
  v49 = 0;
  v50 = 0;
  v47 = 0;
  v48 = &v49;
  v51 = &v52;
  v52 = 0;
  v55 = 0;
  v56 = 0;
  v53 = 0;
  v54 = &v55;
  v57 = &v58;
  v58 = 0;
  v61 = 0;
  v62 = 0;
  v59 = 0;
  v60 = &v61;
  v64 = 0;
  v65 = 0;
  v63 = &v64;
  v2 = (char *)this + 696;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 688, *((_QWORD **)this + 87));
  v3 = v46;
  *((_QWORD *)this + 86) = &v46;
  *((_QWORD *)this + 87) = v3;
  v4 = v47;
  *((_QWORD *)this + 88) = v47;
  if (v4)
  {
    v3[2] = v2;
    v45 = &v46;
    v46 = 0;
    v47 = 0;
  }
  else
  {
    *((_QWORD *)this + 86) = v2;
  }
  v5 = (char *)this + 720;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 90));
  v6 = v49;
  *((_QWORD *)this + 89) = v48;
  *((_QWORD *)this + 90) = v6;
  v7 = v50;
  *((_QWORD *)this + 91) = v50;
  if (v7)
  {
    v6[2] = v5;
    v48 = &v49;
    v49 = 0;
    v50 = 0;
  }
  else
  {
    *((_QWORD *)this + 89) = v5;
  }
  v8 = (char *)this + 744;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 736, *((_QWORD **)this + 93));
  v9 = v52;
  *((_QWORD *)this + 92) = v51;
  *((_QWORD *)this + 93) = v9;
  v10 = v53;
  *((_QWORD *)this + 94) = v53;
  if (v10)
  {
    v9[2] = v8;
    v51 = &v52;
    v52 = 0;
    v53 = 0;
  }
  else
  {
    *((_QWORD *)this + 92) = v8;
  }
  v11 = (char *)this + 768;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 760, *((_QWORD **)this + 96));
  v12 = v55;
  *((_QWORD *)this + 95) = v54;
  *((_QWORD *)this + 96) = v12;
  v13 = v56;
  *((_QWORD *)this + 97) = v56;
  if (v13)
  {
    v12[2] = v11;
    v54 = &v55;
    v55 = 0;
    v56 = 0;
  }
  else
  {
    *((_QWORD *)this + 95) = v11;
  }
  v14 = (char *)this + 792;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 784, *((_QWORD **)this + 99));
  v15 = v58;
  *((_QWORD *)this + 98) = v57;
  *((_QWORD *)this + 99) = v15;
  v16 = v59;
  *((_QWORD *)this + 100) = v59;
  if (v16)
  {
    v15[2] = v14;
    v57 = &v58;
    v58 = 0;
    v59 = 0;
  }
  else
  {
    *((_QWORD *)this + 98) = v14;
  }
  v17 = (char *)this + 816;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 808, *((_QWORD **)this + 102));
  v18 = v61;
  *((_QWORD *)this + 101) = v60;
  *((_QWORD *)this + 102) = v18;
  v19 = v62;
  *((_QWORD *)this + 103) = v62;
  if (v19)
  {
    v18[2] = v17;
    v60 = &v61;
    v61 = 0;
    v62 = 0;
  }
  else
  {
    *((_QWORD *)this + 101) = v17;
  }
  v20 = (char *)this + 840;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 832, *((_QWORD **)this + 105));
  v21 = v64;
  *((_QWORD *)this + 104) = v63;
  *((_QWORD *)this + 105) = v21;
  v22 = v65;
  *((_QWORD *)this + 106) = v65;
  if (v22)
  {
    v21[2] = v20;
    v21 = 0;
    v63 = &v64;
    v64 = 0;
    v65 = 0;
  }
  else
  {
    *((_QWORD *)this + 104) = v20;
  }
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v63, v21);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v60, v61);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v57, v58);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v54, v55);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v51, v52);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v49);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v45, v46);
  v45 = &v46;
  v46 = 0;
  v49 = 0;
  v50 = 0;
  v47 = 0;
  v48 = &v49;
  v51 = &v52;
  v52 = 0;
  v55 = 0;
  v56 = 0;
  v53 = 0;
  v54 = &v55;
  v57 = &v58;
  v58 = 0;
  v61 = 0;
  v62 = 0;
  v59 = 0;
  v60 = &v61;
  v23 = (char *)this + 552;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 69));
  v24 = v46;
  *((_QWORD *)this + 68) = v45;
  *((_QWORD *)this + 69) = v24;
  v25 = v47;
  *((_QWORD *)this + 70) = v47;
  if (v25)
  {
    v24[2] = v23;
    v45 = &v46;
    v46 = 0;
    v47 = 0;
  }
  else
  {
    *((_QWORD *)this + 68) = v23;
  }
  v26 = (char *)this + 576;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 72));
  v27 = v49;
  *((_QWORD *)this + 71) = v48;
  *((_QWORD *)this + 72) = v27;
  v28 = v50;
  *((_QWORD *)this + 73) = v50;
  if (v28)
  {
    v27[2] = v26;
    v48 = &v49;
    v49 = 0;
    v50 = 0;
  }
  else
  {
    *((_QWORD *)this + 71) = v26;
  }
  v29 = (char *)this + 600;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 75));
  v30 = v52;
  *((_QWORD *)this + 74) = v51;
  *((_QWORD *)this + 75) = v30;
  v31 = v53;
  *((_QWORD *)this + 76) = v53;
  if (v31)
  {
    v30[2] = v29;
    v51 = &v52;
    v52 = 0;
    v53 = 0;
  }
  else
  {
    *((_QWORD *)this + 74) = v29;
  }
  v32 = (char *)this + 624;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 78));
  v33 = v55;
  *((_QWORD *)this + 77) = v54;
  *((_QWORD *)this + 78) = v33;
  v34 = v56;
  *((_QWORD *)this + 79) = v56;
  if (v34)
  {
    v33[2] = v32;
    v54 = &v55;
    v55 = 0;
    v56 = 0;
  }
  else
  {
    *((_QWORD *)this + 77) = v32;
  }
  v35 = (char *)this + 648;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 81));
  v36 = v58;
  *((_QWORD *)this + 80) = v57;
  *((_QWORD *)this + 81) = v36;
  v37 = v59;
  *((_QWORD *)this + 82) = v59;
  if (v37)
  {
    v36[2] = v35;
    v57 = &v58;
    v58 = 0;
    v59 = 0;
  }
  else
  {
    *((_QWORD *)this + 80) = v35;
  }
  v38 = (char *)this + 672;
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 84));
  v39 = v61;
  *((_QWORD *)this + 83) = v60;
  *((_QWORD *)this + 84) = v39;
  v40 = v62;
  *((_QWORD *)this + 85) = v62;
  if (v40)
  {
    v39[2] = v38;
    v39 = 0;
    v60 = &v61;
    v61 = 0;
    v62 = 0;
  }
  else
  {
    *((_QWORD *)this + 83) = v38;
  }
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v39);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v58);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v55);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v52);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v49);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v46);
  *((_QWORD *)this + 46) = 0;
  v41 = (char *)this + 444;
  do
  {
    *(_QWORD *)(v41 + 5) = 0;
    *(_QWORD *)v41 = 0;
    *((_WORD *)v41 + 7) = 0;
    v41 += 16;
  }
  while (v41 != (char *)this + 540);
  v42 = 0;
  *((_QWORD *)this + 47) = 0;
  *((_QWORD *)this + 48) = 0;
  *((_DWORD *)this + 98) = 0;
  do
  {
    v43 = (char *)this + v42;
    *(_WORD *)(v43 + 17) = 0;
    *((_OWORD *)v43 + 2) = 0uLL;
    *((_OWORD *)v43 + 3) = 0uLL;
    v42 += 48;
  }
  while (v42 != 336);
  std::mutex::unlock(v44);
}

uint64_t XofSvcsIf::GetBlockLen(uint64_t a1, int a2)
{
  std::mutex *v4;
  uint64_t v5;

  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  v5 = 0;
  if (a2 != 7 && *(_DWORD *)(a1 + 1128) == 1)
    v5 = *(unsigned __int8 *)(a1 + 48 * a2 + 21);
  std::mutex::unlock(v4);
  return v5;
}

uint64_t XofSvcsIf::GetXofInjctTime(uint64_t a1, uint64_t a2)
{
  std::mutex *v4;
  uint64_t v5;
  uint64_t v6;
  char __str[966];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1)
  {
    *(_WORD *)a2 = *(_WORD *)(a1 + 2);
    *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 4);
    v5 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 87, "GetXofInjctTime");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v5 = 7;
  }
  std::mutex::unlock(v4);
  return v5;
}

void sub_24BBB633C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetRtiInjctTime(uint64_t a1, uint64_t a2)
{
  std::mutex *v4;
  uint64_t v5;
  uint64_t v6;
  char __str[966];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (std::mutex *)(a1 + 1200);
  std::mutex::lock((std::mutex *)(a1 + 1200));
  if (*(_DWORD *)(a1 + 1132) == 1)
  {
    *(_WORD *)a2 = *(_WORD *)(a1 + 1002);
    *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 1004);
    v5 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RTI file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 87, "GetRtiInjctTime");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v5 = 7;
  }
  std::mutex::unlock(v4);
  return v5;
}

void sub_24BBB6464(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetXofExtEphStartTime(uint64_t a1, uint64_t a2)
{
  std::mutex *v4;
  uint64_t v5;
  uint64_t v6;
  char __str[966];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1)
  {
    *(_WORD *)a2 = *(_WORD *)(a1 + 8);
    *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 12);
    v5 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 87, "GetXofExtEphStartTime");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v5 = 7;
  }
  std::mutex::unlock(v4);
  return v5;
}

void sub_24BBB658C(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetXofBrdSvBitMask(uint64_t a1, int a2, _OWORD *a3)
{
  std::mutex *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char __str[966];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1)
  {
    if (a2 == 7)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid input, unknown constellation\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 87, "GetXofBrdSvBitMask");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      v8 = 9;
    }
    else
    {
      *a3 = *(_OWORD *)(a1 + 48 * a2 + 32);
      v8 = 1;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 87, "GetXofBrdSvBitMask");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v8 = 7;
  }
  std::mutex::unlock(v6);
  return v8;
}

void sub_24BBB6748(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::GetXofDoNotUseSvBitMask(uint64_t a1, int a2, _OWORD *a3)
{
  std::mutex *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char __str[966];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (std::mutex *)(a1 + 1136);
  std::mutex::lock((std::mutex *)(a1 + 1136));
  if (*(_DWORD *)(a1 + 1128) == 1)
  {
    if (a2 == 7)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid input, unknown constellation\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 87, "GetXofDoNotUseSvBitMask");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      v8 = 9;
    }
    else
    {
      *a3 = *(_OWORD *)(a1 + 48 * a2 + 48);
      v8 = 1;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has not been injected!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 87, "GetXofDoNotUseSvBitMask");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v8 = 7;
  }
  std::mutex::unlock(v6);
  return v8;
}

void sub_24BBB6908(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::DecodeXofFormatVersion(uint64_t a1, _QWORD *a2, unsigned __int16 *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9[450];
  char __str[966];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  XofHeaderCodec::XofHeaderCodec((XofHeaderCodec *)v9);
  if (XofHeaderCodec::DecodeXofFormatVersion((uint64_t)v9, a2, a3) == 1)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF format version is [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 73, "DecodeXofFormatVersion", *a3);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v6 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode XOF format version!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 73, "DecodeXofFormatVersion");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v6 = 5;
  }
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofConstellationHeaderCodec,XofIntegralType<unsigned long long>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>>::~__tuple_impl((uint64_t)v9);
  return v6;
}

void sub_24BBB6AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofConstellationHeaderCodec,XofIntegralType<unsigned long long>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>>::~__tuple_impl((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t XofSvcsIf::DecodeRtiFormatVersion(uint64_t a1, _QWORD *a2, unsigned __int16 *a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[8];
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *__p;
  char v19;
  char __str[8];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  RtiDataCodec::RtiDataCodec((RtiDataCodec *)v8);
  if (RtiDataCodec::DecodeRtiFormatVersion((uint64_t)v8, a2, a3) == 1)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RTI format version is [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 73, "DecodeRtiFormatVersion", *a3);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v6 = 1;
  }
  else
  {
    v6 = 5;
  }
  if (v19 < 0)
    operator delete(__p);
  if (v17 < 0)
    operator delete(v16);
  *(_QWORD *)__str = &v15;
  std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)__str);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  return v6;
}

void sub_24BBB6C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  RtiDataCodec::~RtiDataCodec((void **)va);
  _Unwind_Resume(a1);
}

void XofSvcsIf::XofSvcsIf(XofSvcsIf *this)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  XofSvcsIf *v4;
  uint64_t i;
  _QWORD *v6;

  v1 = 0;
  *((_DWORD *)this + 3) = 0;
  *(_QWORD *)this = 0;
  *((_WORD *)this + 4) = 0;
  do
  {
    v2 = (char *)this + v1;
    *((_WORD *)v2 + 10) = 0;
    *((_DWORD *)v2 + 4) = 0;
    *(_OWORD *)(v2 + 24) = 0uLL;
    *(_OWORD *)(v2 + 40) = 0uLL;
    v1 += 48;
    *((_QWORD *)v2 + 7) = 0;
  }
  while (v1 != 336);
  *((_QWORD *)this + 44) = 0;
  *((_DWORD *)this + 90) = 0;
  *((_QWORD *)this + 47) = 0;
  *((_QWORD *)this + 48) = 0;
  *((_QWORD *)this + 46) = 0;
  v3 = 396;
  *((_DWORD *)this + 98) = 0;
  do
  {
    *(_WORD *)((char *)this + v3) = 25344;
    v4 = (XofSvcsIf *)((char *)this + v3 + 2);
    v3 += 2;
  }
  while (v4 != (XofSvcsIf *)((char *)this + 444));
  for (i = 0; i != 96; i += 16)
  {
    v6 = (_QWORD *)((char *)this + i + 444);
    *(_WORD *)((char *)this + i + 458) = 0;
    *v6 = 0;
    *(_QWORD *)((char *)v6 + 5) = 0;
  }
  *((_QWORD *)this + 70) = 0;
  *((_QWORD *)this + 69) = 0;
  *((_QWORD *)this + 68) = (char *)this + 552;
  *((_QWORD *)this + 73) = 0;
  *((_QWORD *)this + 72) = 0;
  *((_QWORD *)this + 71) = (char *)this + 576;
  *((_QWORD *)this + 76) = 0;
  *((_QWORD *)this + 75) = 0;
  *((_QWORD *)this + 74) = (char *)this + 600;
  *((_QWORD *)this + 79) = 0;
  *((_QWORD *)this + 78) = 0;
  *((_QWORD *)this + 77) = (char *)this + 624;
  *((_QWORD *)this + 82) = 0;
  *((_QWORD *)this + 81) = 0;
  *((_QWORD *)this + 80) = (char *)this + 648;
  *((_QWORD *)this + 84) = 0;
  *((_QWORD *)this + 85) = 0;
  *((_QWORD *)this + 83) = (char *)this + 672;
  *((_QWORD *)this + 88) = 0;
  *((_QWORD *)this + 87) = 0;
  *((_QWORD *)this + 86) = (char *)this + 696;
  *((_QWORD *)this + 90) = 0;
  *((_QWORD *)this + 91) = 0;
  *((_QWORD *)this + 89) = (char *)this + 720;
  *((_QWORD *)this + 93) = 0;
  *((_QWORD *)this + 94) = 0;
  *((_QWORD *)this + 92) = (char *)this + 744;
  *((_QWORD *)this + 96) = 0;
  *((_QWORD *)this + 97) = 0;
  *((_QWORD *)this + 95) = (char *)this + 768;
  *((_QWORD *)this + 99) = 0;
  *((_QWORD *)this + 100) = 0;
  *((_QWORD *)this + 98) = (char *)this + 792;
  *((_QWORD *)this + 103) = 0;
  *((_QWORD *)this + 102) = 0;
  *((_QWORD *)this + 101) = (char *)this + 816;
  *((_QWORD *)this + 106) = 0;
  *((_QWORD *)this + 105) = 0;
  *((_QWORD *)this + 104) = (char *)this + 840;
  *((_QWORD *)this + 109) = 0;
  *((_QWORD *)this + 108) = 0;
  *((_QWORD *)this + 107) = (char *)this + 864;
  *((_QWORD *)this + 112) = 0;
  *((_QWORD *)this + 111) = 0;
  *((_QWORD *)this + 110) = (char *)this + 888;
  *((_QWORD *)this + 115) = 0;
  *((_QWORD *)this + 114) = 0;
  *((_QWORD *)this + 113) = (char *)this + 912;
  *((_QWORD *)this + 118) = 0;
  *((_QWORD *)this + 117) = 0;
  *((_QWORD *)this + 116) = (char *)this + 936;
  *((_QWORD *)this + 121) = 0;
  *((_QWORD *)this + 120) = 0;
  *((_QWORD *)this + 119) = (char *)this + 960;
  *((_QWORD *)this + 124) = 0;
  *((_QWORD *)this + 123) = 0;
  *((_QWORD *)this + 122) = (char *)this + 984;
  *(_OWORD *)((char *)this + 1096) = 0u;
  *(_OWORD *)((char *)this + 1112) = 0u;
  *(_OWORD *)((char *)this + 1064) = 0u;
  *(_OWORD *)((char *)this + 1080) = 0u;
  *(_OWORD *)((char *)this + 1032) = 0u;
  *(_OWORD *)((char *)this + 1048) = 0u;
  *(_OWORD *)((char *)this + 1016) = 0u;
  *((_QWORD *)this + 142) = 850045863;
  *((_QWORD *)this + 149) = 0;
  *(_OWORD *)((char *)this + 1176) = 0u;
  *(_OWORD *)((char *)this + 1160) = 0u;
  *(_OWORD *)((char *)this + 1144) = 0u;
  *((_QWORD *)this + 150) = 850045863;
  *((_QWORD *)this + 157) = 0;
  *(_OWORD *)((char *)this + 1240) = 0u;
  *(_OWORD *)((char *)this + 1224) = 0u;
  *(_OWORD *)((char *)this + 1208) = 0u;
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__tree_node<std::__value_type<unsigned char,XofGpsQzssAlmanac>,void *> *,long>>(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;
  __int128 v14;
  uint64_t *v15;
  uint64_t **v16;
  uint64_t **v17;
  _QWORD *v18;
  BOOL v19;
  uint64_t **v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  uint64_t *v24;
  uint64_t **v25;
  uint64_t **v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t **v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;

  v5 = result;
  v32 = *MEMORY[0x24BDAC8D0];
  if (result[2])
  {
    v6 = *result;
    v8 = result + 1;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v9 = v6[1];
    else
      v9 = (uint64_t)v6;
    v29 = result;
    v30 = (_QWORD *)v9;
    v31 = v9;
    if (v9)
    {
      v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      v30 = v10;
      if (a2 != a3)
      {
        v11 = a2;
        do
        {
          v12 = (uint64_t)v10;
          v13 = *((unsigned __int8 *)v11 + 28);
          *(_BYTE *)(v9 + 28) = v13;
          v14 = *((_OWORD *)v11 + 3);
          *(_OWORD *)(v9 + 32) = *((_OWORD *)v11 + 2);
          *(_OWORD *)(v9 + 48) = v14;
          v15 = *v8;
          v16 = v5 + 1;
          v17 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                v16 = (uint64_t **)v15;
                if (v13 >= *((unsigned __int8 *)v15 + 28))
                  break;
                v15 = (uint64_t *)*v15;
                v17 = v16;
                if (!*v16)
                  goto LABEL_14;
              }
              v15 = (uint64_t *)v15[1];
            }
            while (v15);
            v17 = v16 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v16, v17, (uint64_t *)v9);
          if (v12)
            v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          else
            v10 = 0;
          v18 = (_QWORD *)v11[1];
          if (v18)
          {
            do
            {
              a2 = v18;
              v18 = (_QWORD *)*v18;
            }
            while (v18);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v11[2];
              v19 = *a2 == (_QWORD)v11;
              v11 = a2;
            }
            while (!v19);
          }
          if (!v12)
            break;
          v9 = v12;
          v11 = a2;
        }
        while (a2 != a3);
        v30 = v10;
        v31 = v12;
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v29);
  }
  if (a2 != a3)
  {
    v20 = v5 + 1;
    do
    {
      v21 = (char *)operator new(0x40uLL);
      v22 = *(_OWORD *)((char *)a2 + 28);
      v23 = *(_OWORD *)((char *)a2 + 44);
      *((_DWORD *)v21 + 15) = *((_DWORD *)a2 + 15);
      *(_OWORD *)(v21 + 44) = v23;
      *(_OWORD *)(v21 + 28) = v22;
      v24 = *v20;
      v25 = v5 + 1;
      v26 = v5 + 1;
      if (*v20)
      {
        do
        {
          while (1)
          {
            v25 = (uint64_t **)v24;
            if (v21[28] >= *((unsigned __int8 *)v24 + 28))
              break;
            v24 = (uint64_t *)*v24;
            v26 = v25;
            if (!*v25)
              goto LABEL_34;
          }
          v24 = (uint64_t *)v24[1];
        }
        while (v24);
        v26 = v25 + 1;
      }
LABEL_34:
      result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v25, v26, (uint64_t *)v21);
      v27 = (_QWORD *)a2[1];
      if (v27)
      {
        do
        {
          v28 = v27;
          v27 = (_QWORD *)*v27;
        }
        while (v27);
      }
      else
      {
        do
        {
          v28 = (_QWORD *)a2[2];
          v19 = *v28 == (_QWORD)a2;
          a2 = v28;
        }
        while (!v19);
      }
      a2 = v28;
    }
    while (v28 != a3);
  }
  return result;
}

_QWORD *std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(v2);
  }
  return a1;
}

void std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofGpsQzssEphemeris>,void *> *,long>>(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t *v17;
  uint64_t **v18;
  uint64_t **v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t **v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t *v27;
  uint64_t **v28;
  uint64_t **v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t **v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = result;
  v35 = *MEMORY[0x24BDAC8D0];
  if (result[2])
  {
    v6 = *result;
    v8 = result + 1;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v9 = v6[1];
    else
      v9 = (uint64_t)v6;
    v32 = result;
    v33 = (_QWORD *)v9;
    v34 = v9;
    if (v9)
    {
      v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      v33 = v10;
      if (a2 != a3)
      {
        v11 = a2;
        do
        {
          v12 = (uint64_t)v10;
          v13 = *((unsigned __int8 *)v11 + 28);
          *(_BYTE *)(v9 + 28) = v13;
          *(_OWORD *)(v9 + 32) = *((_OWORD *)v11 + 2);
          v14 = *((_OWORD *)v11 + 3);
          v15 = *((_OWORD *)v11 + 4);
          v16 = *((_OWORD *)v11 + 5);
          *(_QWORD *)(v9 + 96) = v11[12];
          *(_OWORD *)(v9 + 64) = v15;
          *(_OWORD *)(v9 + 80) = v16;
          *(_OWORD *)(v9 + 48) = v14;
          v17 = *v8;
          v18 = v5 + 1;
          v19 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                v18 = (uint64_t **)v17;
                if (v13 >= *((unsigned __int8 *)v17 + 28))
                  break;
                v17 = (uint64_t *)*v17;
                v19 = v18;
                if (!*v18)
                  goto LABEL_14;
              }
              v17 = (uint64_t *)v17[1];
            }
            while (v17);
            v19 = v18 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v18, v19, (uint64_t *)v9);
          if (v12)
            v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          else
            v10 = 0;
          v20 = (_QWORD *)v11[1];
          if (v20)
          {
            do
            {
              a2 = v20;
              v20 = (_QWORD *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v11[2];
              v21 = *a2 == (_QWORD)v11;
              v11 = a2;
            }
            while (!v21);
          }
          if (!v12)
            break;
          v9 = v12;
          v11 = a2;
        }
        while (a2 != a3);
        v33 = v10;
        v34 = v12;
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v32);
  }
  if (a2 != a3)
  {
    v22 = v5 + 1;
    do
    {
      v23 = (char *)operator new(0x68uLL);
      *(_OWORD *)(v23 + 28) = *(_OWORD *)((char *)a2 + 28);
      v24 = *(_OWORD *)((char *)a2 + 44);
      v25 = *(_OWORD *)((char *)a2 + 60);
      v26 = *(_OWORD *)((char *)a2 + 76);
      *(_OWORD *)(v23 + 88) = *(_OWORD *)(a2 + 11);
      *(_OWORD *)(v23 + 76) = v26;
      *(_OWORD *)(v23 + 60) = v25;
      *(_OWORD *)(v23 + 44) = v24;
      v27 = *v22;
      v28 = v5 + 1;
      v29 = v5 + 1;
      if (*v22)
      {
        do
        {
          while (1)
          {
            v28 = (uint64_t **)v27;
            if (v23[28] >= *((unsigned __int8 *)v27 + 28))
              break;
            v27 = (uint64_t *)*v27;
            v29 = v28;
            if (!*v28)
              goto LABEL_34;
          }
          v27 = (uint64_t *)v27[1];
        }
        while (v27);
        v29 = v28 + 1;
      }
LABEL_34:
      result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v28, v29, (uint64_t *)v23);
      v30 = (_QWORD *)a2[1];
      if (v30)
      {
        do
        {
          v31 = v30;
          v30 = (_QWORD *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          v31 = (_QWORD *)a2[2];
          v21 = *v31 == (_QWORD)a2;
          a2 = v31;
        }
        while (!v21);
      }
      a2 = v31;
    }
    while (v31 != a3);
  }
  return result;
}

uint64_t std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofGalileoEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGalileoEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGalileoEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofGalileoEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofGalileoEphemeris>,void *> *,long>>(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t *v17;
  uint64_t **v18;
  uint64_t **v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t **v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t *v27;
  uint64_t **v28;
  uint64_t **v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t **v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = result;
  v35 = *MEMORY[0x24BDAC8D0];
  if (result[2])
  {
    v6 = *result;
    v8 = result + 1;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v9 = v6[1];
    else
      v9 = (uint64_t)v6;
    v32 = result;
    v33 = (_QWORD *)v9;
    v34 = v9;
    if (v9)
    {
      v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      v33 = v10;
      if (a2 != a3)
      {
        v11 = a2;
        do
        {
          v12 = (uint64_t)v10;
          v13 = *((unsigned __int8 *)v11 + 28);
          *(_BYTE *)(v9 + 28) = v13;
          *(_OWORD *)(v9 + 32) = *((_OWORD *)v11 + 2);
          v14 = *((_OWORD *)v11 + 3);
          v15 = *((_OWORD *)v11 + 4);
          v16 = *((_OWORD *)v11 + 5);
          *(_QWORD *)(v9 + 96) = v11[12];
          *(_OWORD *)(v9 + 64) = v15;
          *(_OWORD *)(v9 + 80) = v16;
          *(_OWORD *)(v9 + 48) = v14;
          v17 = *v8;
          v18 = v5 + 1;
          v19 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                v18 = (uint64_t **)v17;
                if (v13 >= *((unsigned __int8 *)v17 + 28))
                  break;
                v17 = (uint64_t *)*v17;
                v19 = v18;
                if (!*v18)
                  goto LABEL_14;
              }
              v17 = (uint64_t *)v17[1];
            }
            while (v17);
            v19 = v18 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v18, v19, (uint64_t *)v9);
          if (v12)
            v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          else
            v10 = 0;
          v20 = (_QWORD *)v11[1];
          if (v20)
          {
            do
            {
              a2 = v20;
              v20 = (_QWORD *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v11[2];
              v21 = *a2 == (_QWORD)v11;
              v11 = a2;
            }
            while (!v21);
          }
          if (!v12)
            break;
          v9 = v12;
          v11 = a2;
        }
        while (a2 != a3);
        v33 = v10;
        v34 = v12;
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v32);
  }
  if (a2 != a3)
  {
    v22 = v5 + 1;
    do
    {
      v23 = (char *)operator new(0x68uLL);
      *(_OWORD *)(v23 + 28) = *(_OWORD *)((char *)a2 + 28);
      v24 = *(_OWORD *)((char *)a2 + 44);
      v25 = *(_OWORD *)((char *)a2 + 60);
      v26 = *(_OWORD *)((char *)a2 + 76);
      *(_OWORD *)(v23 + 88) = *(_OWORD *)(a2 + 11);
      *(_OWORD *)(v23 + 76) = v26;
      *(_OWORD *)(v23 + 60) = v25;
      *(_OWORD *)(v23 + 44) = v24;
      v27 = *v22;
      v28 = v5 + 1;
      v29 = v5 + 1;
      if (*v22)
      {
        do
        {
          while (1)
          {
            v28 = (uint64_t **)v27;
            if (v23[28] >= *((unsigned __int8 *)v27 + 28))
              break;
            v27 = (uint64_t *)*v27;
            v29 = v28;
            if (!*v28)
              goto LABEL_34;
          }
          v27 = (uint64_t *)v27[1];
        }
        while (v27);
        v29 = v28 + 1;
      }
LABEL_34:
      result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v28, v29, (uint64_t *)v23);
      v30 = (_QWORD *)a2[1];
      if (v30)
      {
        do
        {
          v31 = v30;
          v30 = (_QWORD *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          v31 = (_QWORD *)a2[2];
          v21 = *v31 == (_QWORD)a2;
          a2 = v31;
        }
        while (!v21);
      }
      a2 = v31;
    }
    while (v31 != a3);
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofBeidouEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofBeidouEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofBeidouEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofBeidouEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofBeidouEphemeris>,void *> *,long>>(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t *v20;
  uint64_t **v21;
  uint64_t **v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t **v25;
  unsigned __int8 *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t *v33;
  uint64_t **v34;
  uint64_t **v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t **v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;

  v5 = result;
  v41 = *MEMORY[0x24BDAC8D0];
  if (result[2])
  {
    v6 = *result;
    v8 = result + 1;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v9 = v6[1];
    else
      v9 = (uint64_t)v6;
    v38 = result;
    v39 = (_QWORD *)v9;
    v40 = v9;
    if (v9)
    {
      v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      v39 = v10;
      if (a2 != a3)
      {
        v11 = a2;
        do
        {
          v12 = (uint64_t)v10;
          v13 = *((unsigned __int8 *)v11 + 32);
          *(_BYTE *)(v9 + 32) = v13;
          *(_OWORD *)(v9 + 40) = *(_OWORD *)(v11 + 5);
          v14 = *(_OWORD *)(v11 + 7);
          v15 = *(_OWORD *)(v11 + 9);
          v16 = *(_OWORD *)(v11 + 11);
          *(_OWORD *)(v9 + 104) = *(_OWORD *)(v11 + 13);
          *(_OWORD *)(v9 + 88) = v16;
          *(_OWORD *)(v9 + 72) = v15;
          *(_OWORD *)(v9 + 56) = v14;
          v17 = *(_OWORD *)(v11 + 15);
          v18 = *(_OWORD *)(v11 + 17);
          v19 = *(_OWORD *)(v11 + 19);
          *(_QWORD *)(v9 + 166) = *(_QWORD *)((char *)v11 + 166);
          *(_OWORD *)(v9 + 152) = v19;
          *(_OWORD *)(v9 + 136) = v18;
          *(_OWORD *)(v9 + 120) = v17;
          v20 = *v8;
          v21 = v5 + 1;
          v22 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                v21 = (uint64_t **)v20;
                if (v13 >= *((unsigned __int8 *)v20 + 32))
                  break;
                v20 = (uint64_t *)*v20;
                v22 = v21;
                if (!*v21)
                  goto LABEL_14;
              }
              v20 = (uint64_t *)v20[1];
            }
            while (v20);
            v22 = v21 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v21, v22, (uint64_t *)v9);
          if (v12)
            v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          else
            v10 = 0;
          v23 = (_QWORD *)v11[1];
          if (v23)
          {
            do
            {
              a2 = v23;
              v23 = (_QWORD *)*v23;
            }
            while (v23);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v11[2];
              v24 = *a2 == (_QWORD)v11;
              v11 = a2;
            }
            while (!v24);
          }
          if (!v12)
            break;
          v9 = v12;
          v11 = a2;
        }
        while (a2 != a3);
        v39 = v10;
        v40 = v12;
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v38);
  }
  if (a2 != a3)
  {
    v25 = v5 + 1;
    do
    {
      v26 = (unsigned __int8 *)operator new(0xB0uLL);
      *((_OWORD *)v26 + 2) = *((_OWORD *)a2 + 2);
      v27 = *((_OWORD *)a2 + 3);
      v28 = *((_OWORD *)a2 + 4);
      v29 = *((_OWORD *)a2 + 6);
      *((_OWORD *)v26 + 5) = *((_OWORD *)a2 + 5);
      *((_OWORD *)v26 + 6) = v29;
      *((_OWORD *)v26 + 3) = v27;
      *((_OWORD *)v26 + 4) = v28;
      v30 = *((_OWORD *)a2 + 7);
      v31 = *((_OWORD *)a2 + 8);
      v32 = *((_OWORD *)a2 + 10);
      *((_OWORD *)v26 + 9) = *((_OWORD *)a2 + 9);
      *((_OWORD *)v26 + 10) = v32;
      *((_OWORD *)v26 + 7) = v30;
      *((_OWORD *)v26 + 8) = v31;
      v33 = *v25;
      v34 = v5 + 1;
      v35 = v5 + 1;
      if (*v25)
      {
        do
        {
          while (1)
          {
            v34 = (uint64_t **)v33;
            if (v26[32] >= *((unsigned __int8 *)v33 + 32))
              break;
            v33 = (uint64_t *)*v33;
            v35 = v34;
            if (!*v34)
              goto LABEL_34;
          }
          v33 = (uint64_t *)v33[1];
        }
        while (v33);
        v35 = v34 + 1;
      }
LABEL_34:
      result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v34, v35, (uint64_t *)v26);
      v36 = (_QWORD *)a2[1];
      if (v36)
      {
        do
        {
          v37 = v36;
          v36 = (_QWORD *)*v36;
        }
        while (v36);
      }
      else
      {
        do
        {
          v37 = (_QWORD *)a2[2];
          v24 = *v37 == (_QWORD)a2;
          a2 = v37;
        }
        while (!v24);
      }
      a2 = v37;
    }
    while (v37 != a3);
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned char,XofNavicEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofNavicEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofNavicEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofNavicEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofNavicEphemeris>,void *> *,long>>(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t *v17;
  uint64_t **v18;
  uint64_t **v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t **v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t *v27;
  uint64_t **v28;
  uint64_t **v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t **v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = result;
  v35 = *MEMORY[0x24BDAC8D0];
  if (result[2])
  {
    v6 = *result;
    v8 = result + 1;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v9 = v6[1];
    else
      v9 = (uint64_t)v6;
    v32 = result;
    v33 = (_QWORD *)v9;
    v34 = v9;
    if (v9)
    {
      v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v9);
      v33 = v10;
      if (a2 != a3)
      {
        v11 = a2;
        do
        {
          v12 = (uint64_t)v10;
          v13 = *((unsigned __int8 *)v11 + 28);
          *(_BYTE *)(v9 + 28) = v13;
          *(_OWORD *)(v9 + 32) = *((_OWORD *)v11 + 2);
          v14 = *((_OWORD *)v11 + 3);
          v15 = *((_OWORD *)v11 + 4);
          v16 = *((_OWORD *)v11 + 5);
          *(_DWORD *)(v9 + 96) = *((_DWORD *)v11 + 24);
          *(_OWORD *)(v9 + 64) = v15;
          *(_OWORD *)(v9 + 80) = v16;
          *(_OWORD *)(v9 + 48) = v14;
          v17 = *v8;
          v18 = v5 + 1;
          v19 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                v18 = (uint64_t **)v17;
                if (v13 >= *((unsigned __int8 *)v17 + 28))
                  break;
                v17 = (uint64_t *)*v17;
                v19 = v18;
                if (!*v18)
                  goto LABEL_14;
              }
              v17 = (uint64_t *)v17[1];
            }
            while (v17);
            v19 = v18 + 1;
          }
LABEL_14:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v18, v19, (uint64_t *)v9);
          if (v12)
            v10 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next(v12);
          else
            v10 = 0;
          v20 = (_QWORD *)v11[1];
          if (v20)
          {
            do
            {
              a2 = v20;
              v20 = (_QWORD *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v11[2];
              v21 = *a2 == (_QWORD)v11;
              v11 = a2;
            }
            while (!v21);
          }
          if (!v12)
            break;
          v9 = v12;
          v11 = a2;
        }
        while (a2 != a3);
        v33 = v10;
        v34 = v12;
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v32);
  }
  if (a2 != a3)
  {
    v22 = v5 + 1;
    do
    {
      v23 = (char *)operator new(0x68uLL);
      *(_OWORD *)(v23 + 28) = *(_OWORD *)((char *)a2 + 28);
      v24 = *(_OWORD *)((char *)a2 + 44);
      v25 = *(_OWORD *)((char *)a2 + 60);
      v26 = *(_OWORD *)((char *)a2 + 76);
      *(_QWORD *)(v23 + 92) = *(_QWORD *)((char *)a2 + 92);
      *(_OWORD *)(v23 + 76) = v26;
      *(_OWORD *)(v23 + 60) = v25;
      *(_OWORD *)(v23 + 44) = v24;
      v27 = *v22;
      v28 = v5 + 1;
      v29 = v5 + 1;
      if (*v22)
      {
        do
        {
          while (1)
          {
            v28 = (uint64_t **)v27;
            if (v23[28] >= *((unsigned __int8 *)v27 + 28))
              break;
            v27 = (uint64_t *)*v27;
            v29 = v28;
            if (!*v28)
              goto LABEL_34;
          }
          v27 = (uint64_t *)v27[1];
        }
        while (v27);
        v29 = v28 + 1;
      }
LABEL_34:
      result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v28, v29, (uint64_t *)v23);
      v30 = (_QWORD *)a2[1];
      if (v30)
      {
        do
        {
          v31 = v30;
          v30 = (_QWORD *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          v31 = (_QWORD *)a2[2];
          v21 = *v31 == (_QWORD)a2;
          a2 = v31;
        }
        while (!v21);
      }
      a2 = v31;
    }
    while (v31 != a3);
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__tree_node<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,void *> *,long>>(uint64_t **result, uint64_t *a2, uint64_t *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t **v12;
  uint64_t **v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t **v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t **v19;
  uint64_t **v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t **v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;

  v5 = result;
  v26 = *MEMORY[0x24BDAC8D0];
  if (result[2])
  {
    v6 = *result;
    v8 = result + 1;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v9 = (uint64_t *)v6[1];
    else
      v9 = v6;
    v23 = result;
    v24 = v9;
    v25 = v9;
    if (v9)
    {
      v24 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next((uint64_t)v9);
      if (a2 != a3)
      {
        v10 = a2;
        do
        {
          *((_BYTE *)v9 + 32) = *((_BYTE *)v10 + 32);
          if (v9 != v10)
          {
            std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__tree_node<std::__value_type<unsigned char,XofGpsQzssEphemeris>,void *> *,long>>((uint64_t **)v9 + 5, (_QWORD *)v10[5], v10 + 6);
            v9 = v25;
          }
          v11 = *v8;
          v12 = v5 + 1;
          v13 = v5 + 1;
          if (*v8)
          {
            do
            {
              while (1)
              {
                v12 = (uint64_t **)v11;
                if (*((unsigned __int8 *)v9 + 32) >= *((unsigned __int8 *)v11 + 32))
                  break;
                v11 = (uint64_t *)*v11;
                v13 = v12;
                if (!*v12)
                  goto LABEL_16;
              }
              v11 = (uint64_t *)v11[1];
            }
            while (v11);
            v13 = v12 + 1;
          }
LABEL_16:
          std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v12, v13, v9);
          v9 = v24;
          v25 = v24;
          if (v24)
            v24 = std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::_DetachedTreeCache::__detach_next((uint64_t)v24);
          v14 = (uint64_t *)v10[1];
          if (v14)
          {
            do
            {
              a2 = v14;
              v14 = (uint64_t *)*v14;
            }
            while (v14);
          }
          else
          {
            do
            {
              a2 = (uint64_t *)v10[2];
              v15 = *a2 == (_QWORD)v10;
              v10 = a2;
            }
            while (!v15);
          }
          if (!v9)
            break;
          v10 = a2;
        }
        while (a2 != a3);
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v23);
  }
  if (a2 != a3)
  {
    v16 = v5 + 1;
    do
    {
      v17 = (uint64_t *)operator new(0x40uLL);
      *((_BYTE *)v17 + 32) = *((_BYTE *)a2 + 32);
      std::map<unsigned char,XofGpsQzssEphemeris>::map[abi:ne180100](v17 + 5, (uint64_t)(a2 + 5));
      v18 = *v16;
      v19 = v5 + 1;
      v20 = v5 + 1;
      if (*v16)
      {
        do
        {
          while (1)
          {
            v19 = (uint64_t **)v18;
            if (*((unsigned __int8 *)v17 + 32) >= *((unsigned __int8 *)v18 + 32))
              break;
            v18 = (uint64_t *)*v18;
            v20 = v19;
            if (!*v19)
              goto LABEL_34;
          }
          v18 = (uint64_t *)v18[1];
        }
        while (v18);
        v20 = v19 + 1;
      }
LABEL_34:
      result = (uint64_t **)std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::__insert_node_at(v5, (uint64_t)v19, v20, v17);
      v21 = (uint64_t *)a2[1];
      if (v21)
      {
        do
        {
          v22 = v21;
          v21 = (uint64_t *)*v21;
        }
        while (v21);
      }
      else
      {
        do
        {
          v22 = (uint64_t *)a2[2];
          v15 = *v22 == (_QWORD)a2;
          a2 = v22;
        }
        while (!v15);
      }
      a2 = v22;
    }
    while (v22 != a3);
  }
  return result;
}

void sub_24BBB7EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(v2);
  }
  return a1;
}

void std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(a1[1]);
    std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)(a1 + 5), (_QWORD *)a1[6]);
    operator delete(a1);
  }
}

void XofData::~XofData(XofData *this)
{
  std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*((_QWORD **)this + 123));
  std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*((_QWORD **)this + 120));
  std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*((_QWORD **)this + 117));
  std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*((_QWORD **)this + 114));
  std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*((_QWORD **)this + 111));
  std::__tree<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::map<unsigned char,XofGpsQzssEphemeris>>>>::destroy(*((_QWORD **)this + 108));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 832, *((_QWORD **)this + 105));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 808, *((_QWORD **)this + 102));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 784, *((_QWORD **)this + 99));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 760, *((_QWORD **)this + 96));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 736, *((_QWORD **)this + 93));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 90));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)this + 688, *((_QWORD **)this + 87));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 84));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 81));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 78));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 75));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 72));
  std::__tree<std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssAlmanac>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssAlmanac>>>::destroy(*((_QWORD **)this + 69));
}

void RtiDataCodec::RtiDataCodec(RtiDataCodec *this)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  std::string __p;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  std::string v12;
  __int128 v13;
  void *v14[2];
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  std::string v18;
  __int128 v19;
  void *v20[2];
  uint64_t v21;
  std::string v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  std::string v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(&v26, "formatVersion");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v27, &v26, 3, 3, 0);
  std::string::basic_string[abi:ne180100]<0>(&v22, "fileCreateGPSWeek");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v23, &v22, 0, 0x1FFF, 0);
  std::string::basic_string[abi:ne180100]<0>(&v18, "fileCreateGPSTOW");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)&v19, &v18, 0, 604799, 0);
  std::vector<RtiPayloadCodec::Payload>::vector((RtiPayloadCodec::Payload *)&v16, 7uLL);
  std::string::basic_string[abi:ne180100]<0>(&v12, "reserved");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)&v13, &v12, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&__p, "fileCRC32");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)&v9, &__p, 0, -1, 0);
  *(_OWORD *)((char *)this + 8) = v28;
  *(_OWORD *)((char *)this + 40) = v24;
  v2 = *(_OWORD *)v20;
  *((_OWORD *)this + 4) = v19;
  *((_OWORD *)this + 5) = v2;
  *(_OWORD *)((char *)this + 104) = v16;
  v3 = *(_OWORD *)v14;
  *((_OWORD *)this + 8) = v13;
  *((_OWORD *)this + 9) = v3;
  v4 = v10;
  *(_OWORD *)((char *)this + 168) = v9;
  v5 = v29;
  *(_QWORD *)this = v27;
  v28 = 0uLL;
  v29 = 0;
  v6 = v23;
  v7 = v25;
  *((_QWORD *)this + 3) = v5;
  *((_QWORD *)this + 4) = v6;
  *((_QWORD *)this + 7) = v7;
  v25 = 0;
  v24 = 0uLL;
  *((_QWORD *)this + 12) = v21;
  v20[0] = 0;
  v20[1] = 0;
  v21 = 0;
  *((_QWORD *)this + 15) = v17;
  v16 = 0uLL;
  v17 = 0;
  *((_QWORD *)this + 20) = v15;
  v14[0] = 0;
  v14[1] = 0;
  v15 = 0;
  *((_QWORD *)this + 25) = v11;
  *(_OWORD *)((char *)this + 184) = v4;
  v10 = 0uLL;
  v11 = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v15) < 0)
      operator delete(v14[0]);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  *(_QWORD *)&v13 = &v16;
  std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (SHIBYTE(v21) < 0)
    operator delete(v20[0]);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  if (SHIBYTE(v25) < 0)
    operator delete((void *)v24);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  if (SHIBYTE(v29) < 0)
    operator delete((void *)v28);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
}

void sub_24BBB83C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,char *a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  uint64_t v50;

  if (a14 < 0)
    operator delete(__p);
  if (a33 < 0)
    operator delete(a28);
  if (a25 < 0)
    operator delete(a20);
  a26 = &a34;
  std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)&a26);
  if (a50 < 0)
    operator delete(a45);
  if (a42 < 0)
    operator delete(a37);
  if (*(char *)(v50 - 81) < 0)
    operator delete(*(void **)(v50 - 104));
  if (*(char *)(v50 - 113) < 0)
    operator delete(*(void **)(v50 - 136));
  if (*(char *)(v50 - 25) < 0)
    operator delete(*(void **)(v50 - 48));
  if (*(char *)(v50 - 57) < 0)
    operator delete(*(void **)(v50 - 80));
  _Unwind_Resume(a1);
}

void sub_24BBB84AC()
{
  JUMPOUT(0x24BBB8494);
}

void sub_24BBB84B4()
{
  JUMPOUT(0x24BBB84A4);
}

void std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 112;
        std::allocator<RtiPayloadCodec::Payload>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<RtiPayloadCodec::Payload>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 111) < 0)
    operator delete(*(void **)(a2 + 88));
  if (*(char *)(a2 + 55) < 0)
    operator delete(*(void **)(a2 + 32));
}

void XofHeaderCodec::XofHeaderCodec(XofHeaderCodec *this)
{
  std::string v2;
  _BYTE v3[16];
  void *__p;
  char v5;
  std::string v6;
  _BYTE v7[16];
  void *v8;
  char v9;
  std::string v10;
  _BYTE v11[16];
  void *v12;
  char v13;
  std::string v14;
  _BYTE v15[16];
  void *v16;
  char v17;
  std::string v18;
  __int128 v19[2];
  void *v20;
  char v21;
  _BYTE v22[24];
  std::string v23;
  _BYTE v24[16];
  void *v25;
  char v26;
  std::string v27;
  _BYTE v28[8];
  void *v29;
  char v30;
  std::string v31;
  _BYTE v32[8];
  void *v33;
  char v34;
  std::string v35;
  _BYTE v36[16];
  void *v37;
  char v38;
  std::string v39;
  _BYTE v40[8];
  void *v41;
  char v42;
  std::string v43;
  _BYTE v44[8];
  void *v45;
  char v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(&v43, "formatVersion");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v44, &v43, 3, 3, 0);
  std::string::basic_string[abi:ne180100]<0>(&v39, "fileCreateGPSWeek");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v40, &v39, 0, 0x1FFF, 0);
  std::string::basic_string[abi:ne180100]<0>(&v35, "fileCreateGPSTOW");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v36, &v35, 0, 604800, 0);
  std::string::basic_string[abi:ne180100]<0>(&v31, "reserved1");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v32, &v31, 0, 0xFFFF, 0);
  std::string::basic_string[abi:ne180100]<0>(&v27, "eeStartGPSWeek");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v28, &v27, 0, 0x1FFF, 0);
  std::string::basic_string[abi:ne180100]<0>(&v23, "eeStartGPSTOW");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v24, &v23, 0, 604800, 0);
  std::vector<XofConstellationHeaderCodec::Payload>::vector((XofConstellationHeaderCodec::Payload *)v22, 7uLL);
  std::string::basic_string[abi:ne180100]<0>(&v18, "reserved2");
  XofIntegralType<unsigned long long>::XofIntegralType((uint64_t)v19, &v18, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&v14, "payloadLength");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v15, &v14, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&v10, "payloadCRC32");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v11, &v10, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&v6, "reserved3");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v7, &v6, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&v2, "headerCRC32");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v3, &v2, 0, -1, 0);
  _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3ELm4ELm5ELm6ELm7ELm8ELm9ELm10ELm11EEEEJ15XofIntegralTypeItES4_S3_IjES4_S4_S5_27XofConstellationHeaderCodecS3_IyES5_S5_S5_S5_EEC2B8ne180100IJLm0ELm1ELm2ELm3ELm4ELm5ELm6ELm7ELm8ELm9ELm10ELm11EEJS4_S4_S5_S4_S4_S5_S6_S7_S5_S5_S5_S5_EJEJEJS4_S4_S5_S4_S4_S5_S6_S7_S5_S5_S5_S5_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSB_IJDpT2_EEEDpOT3_((uint64_t)this, (uint64_t)v44, (uint64_t)v40, (uint64_t)v36, (uint64_t)v32, (uint64_t)v28, (uint64_t)v24, (uint64_t)v22, v19, (uint64_t)v15, (uint64_t)v11, (uint64_t)v7, (uint64_t)v3);
  if (v5 < 0)
    operator delete(__p);
  if (SHIBYTE(v2.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v2.__r_.__value_.__l.__data_);
  if (v9 < 0)
    operator delete(v8);
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v6.__r_.__value_.__l.__data_);
  if (v13 < 0)
    operator delete(v12);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  if (v17 < 0)
    operator delete(v16);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v21 < 0)
    operator delete(v20);
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  *(_QWORD *)&v19[0] = v22;
  std::vector<XofConstellationHeaderCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)v19);
  if (v26 < 0)
    operator delete(v25);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
  if (v30 < 0)
    operator delete(v29);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (v34 < 0)
    operator delete(v33);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  if (v38 < 0)
    operator delete(v37);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);
  if (v42 < 0)
    operator delete(v41);
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v39.__r_.__value_.__l.__data_);
  if (v46 < 0)
    operator delete(v45);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
}

void sub_24BBB8A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53,void *a54,uint64_t a55,int a56,__int16 a57,char a58,char a59,uint64_t a60,uint64_t a61,void *a62,uint64_t a63)
{
  char a67;
  void *a68;
  char a72;
  uint64_t a73;
  void *a74;
  char a75;
  char a76;
  void *a77;
  char a78;
  void *a79;
  char a80;
  void *a81;
  char a82;
  void *a83;
  uint64_t v83;

  if (a20 < 0)
    operator delete(__p);
  if (a39 < 0)
    operator delete(a34);
  if (a31 < 0)
    operator delete(a26);
  if (a53 < 0)
    operator delete(a48);
  if (a45 < 0)
    operator delete(a40);
  if (a67 < 0)
    operator delete(a62);
  if (a59 < 0)
    operator delete(a54);
  if (a75 < 0)
    operator delete(a74);
  if (a72 < 0)
    operator delete(a68);
  a73 = (uint64_t)&a76;
  std::vector<XofConstellationHeaderCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)&a73);
  if (a80 < 0)
    operator delete(a79);
  if (a78 < 0)
    operator delete(a77);
  if (SLOBYTE(STACK[0x20F]) < 0)
    operator delete(a83);
  if (a82 < 0)
    operator delete(a81);
  if (*(char *)(v83 - 217) < 0)
    operator delete(*(void **)(v83 - 240));
  if (SLOBYTE(STACK[0x227]) < 0)
    operator delete((void *)STACK[0x210]);
  if (*(char *)(v83 - 153) < 0)
    operator delete(*(void **)(v83 - 176));
  if (*(char *)(v83 - 193) < 0)
    operator delete(*(void **)(v83 - 216));
  if (*(char *)(v83 - 97) < 0)
    operator delete(*(void **)(v83 - 120));
  if (*(char *)(v83 - 129) < 0)
    operator delete(*(void **)(v83 - 152));
  if (*(char *)(v83 - 41) < 0)
    operator delete(*(void **)(v83 - 64));
  if (*(char *)(v83 - 73) < 0)
    operator delete(*(void **)(v83 - 96));
  _Unwind_Resume(a1);
}

void sub_24BBB8BAC()
{
  JUMPOUT(0x24BBB8AD4);
}

void sub_24BBB8BB4()
{
  JUMPOUT(0x24BBB8AE4);
}

void sub_24BBB8BBC()
{
  JUMPOUT(0x24BBB8AF4);
}

void sub_24BBB8BC4()
{
  JUMPOUT(0x24BBB8B04);
}

void sub_24BBB8BCC()
{
  JUMPOUT(0x24BBB8B14);
}

void sub_24BBB8BD4()
{
  JUMPOUT(0x24BBB8B24);
}

void sub_24BBB8BDC()
{
  JUMPOUT(0x24BBB8B34);
}

void sub_24BBB8BE4()
{
  JUMPOUT(0x24BBB8B44);
}

void sub_24BBB8BEC()
{
  JUMPOUT(0x24BBB8B54);
}

void sub_24BBB8BF4()
{
  JUMPOUT(0x24BBB8B64);
}

void sub_24BBB8BFC()
{
  JUMPOUT(0x24BBB8B74);
}

void sub_24BBB8C04()
{
  JUMPOUT(0x24BBB8B84);
}

void sub_24BBB8C0C()
{
  JUMPOUT(0x24BBB8B94);
}

void sub_24BBB8C14()
{
  JUMPOUT(0x24BBB8BA4);
}

__n128 _ZNSt3__112__tuple_implINS_15__tuple_indicesIJLm0ELm1ELm2ELm3ELm4ELm5ELm6ELm7ELm8ELm9ELm10ELm11EEEEJ15XofIntegralTypeItES4_S3_IjES4_S4_S5_27XofConstellationHeaderCodecS3_IyES5_S5_S5_S5_EEC2B8ne180100IJLm0ELm1ELm2ELm3ELm4ELm5ELm6ELm7ELm8ELm9ELm10ELm11EEJS4_S4_S5_S4_S4_S5_S6_S7_S5_S5_S5_S5_EJEJEJS4_S4_S5_S4_S4_S5_S6_S7_S5_S5_S5_S5_EEENS1_IJXspT_EEEENS_13__tuple_typesIJDpT0_EEENS1_IJXspT1_EEEENSB_IJDpT2_EEEDpOT3_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
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
  __n128 result;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v13 = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v13;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)a3;
  v14 = *(_OWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a3 + 24);
  *(_OWORD *)(a1 + 40) = v14;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)a4;
  v15 = *(_OWORD *)(a4 + 16);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a4 + 32);
  *(_OWORD *)(a1 + 80) = v15;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)a5;
  v16 = *(_OWORD *)(a5 + 8);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a5 + 24);
  *(_OWORD *)(a1 + 112) = v16;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 8) = 0;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)a6;
  v17 = *(_OWORD *)(a6 + 8);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a6 + 24);
  *(_OWORD *)(a1 + 144) = v17;
  *(_QWORD *)(a6 + 16) = 0;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 8) = 0;
  *(_OWORD *)(a1 + 168) = *(_OWORD *)a7;
  v18 = *(_OWORD *)(a7 + 16);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a7 + 32);
  *(_OWORD *)(a1 + 184) = v18;
  *(_QWORD *)(a7 + 24) = 0;
  *(_QWORD *)(a7 + 32) = 0;
  *(_QWORD *)(a7 + 16) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 224) = 0;
  *(_OWORD *)(a1 + 208) = *(_OWORD *)a8;
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a8 + 16);
  *(_QWORD *)a8 = 0;
  *(_QWORD *)(a8 + 8) = 0;
  *(_QWORD *)(a8 + 16) = 0;
  v19 = *a9;
  *(_OWORD *)(a1 + 248) = a9[1];
  *(_OWORD *)(a1 + 232) = v19;
  v20 = a9[2];
  *(_QWORD *)(a1 + 280) = *((_QWORD *)a9 + 6);
  *(_OWORD *)(a1 + 264) = v20;
  *((_QWORD *)a9 + 5) = 0;
  *((_QWORD *)a9 + 6) = 0;
  *((_QWORD *)a9 + 4) = 0;
  *(_OWORD *)(a1 + 288) = *(_OWORD *)a10;
  v21 = *(_OWORD *)(a10 + 16);
  *(_QWORD *)(a1 + 320) = *(_QWORD *)(a10 + 32);
  *(_OWORD *)(a1 + 304) = v21;
  *(_QWORD *)(a10 + 24) = 0;
  *(_QWORD *)(a10 + 32) = 0;
  *(_QWORD *)(a10 + 16) = 0;
  *(_OWORD *)(a1 + 328) = *(_OWORD *)a11;
  v22 = *(_OWORD *)(a11 + 16);
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a11 + 32);
  *(_OWORD *)(a1 + 344) = v22;
  *(_QWORD *)(a11 + 24) = 0;
  *(_QWORD *)(a11 + 32) = 0;
  *(_QWORD *)(a11 + 16) = 0;
  *(_OWORD *)(a1 + 368) = *(_OWORD *)a12;
  v23 = *(_OWORD *)(a12 + 16);
  *(_QWORD *)(a1 + 400) = *(_QWORD *)(a12 + 32);
  *(_OWORD *)(a1 + 384) = v23;
  *(_QWORD *)(a12 + 24) = 0;
  *(_QWORD *)(a12 + 32) = 0;
  *(_QWORD *)(a12 + 16) = 0;
  *(_OWORD *)(a1 + 408) = *(_OWORD *)a13;
  result = *(__n128 *)(a13 + 16);
  *(_QWORD *)(a1 + 440) = *(_QWORD *)(a13 + 32);
  *(__n128 *)(a1 + 424) = result;
  *(_QWORD *)(a13 + 24) = 0;
  *(_QWORD *)(a13 + 32) = 0;
  *(_QWORD *)(a13 + 16) = 0;
  return result;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofConstellationHeaderCodec,XofIntegralType<unsigned long long>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>>::~__tuple_impl(uint64_t a1)
{
  void **v3[2];

  v3[1] = *(void ***)MEMORY[0x24BDAC8D0];
  if (*(char *)(a1 + 447) < 0)
    operator delete(*(void **)(a1 + 424));
  if (*(char *)(a1 + 407) < 0)
    operator delete(*(void **)(a1 + 384));
  if (*(char *)(a1 + 367) < 0)
    operator delete(*(void **)(a1 + 344));
  if (*(char *)(a1 + 327) < 0)
    operator delete(*(void **)(a1 + 304));
  if (*(char *)(a1 + 287) < 0)
    operator delete(*(void **)(a1 + 264));
  v3[0] = (void **)(a1 + 208);
  std::vector<XofConstellationHeaderCodec::Payload>::__destroy_vector::operator()[abi:ne180100](v3);
  if (*(char *)(a1 + 207) < 0)
    operator delete(*(void **)(a1 + 184));
  if (*(char *)(a1 + 167) < 0)
    operator delete(*(void **)(a1 + 144));
  if (*(char *)(a1 + 135) < 0)
    operator delete(*(void **)(a1 + 112));
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

uint64_t Hal01_01HandleInitReq(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  char DebugFeaturesBitmask;
  char v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void (**v17)(uint64_t, char *);
  void (*v19)(uint64_t, char *);
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  char __str[966];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_INIT_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_01HandleInitReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    g_IsFSMDeInit = 0;
    v3 = *(_DWORD *)(a1 + 24);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "HAL", 73, "Hal01_01HandleInitReq", 1291);
      gnssOsa_PrintLog(__str, 4, 1, 0);
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v5 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
        DebugFeaturesBitmask = Ga05_GetDebugFeaturesBitmask();
        v7 = Ga05_GetDebugFeaturesBitmask();
        v8 = 89;
        if ((v7 & 0x10) != 0)
          v9 = 89;
        else
          v9 = 78;
        if ((DebugFeaturesBitmask & 0x20) == 0)
          v8 = 78;
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: GnssHw,%u, Platform SPI,%c,PCIe,%c\n", v5, "HAL", 73, "Hal01_01HandleInitReq", v3, v8, v9);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
    }
    v10 = (int *)gnssOsa_Calloc("Hal01_01HandleInitReq", 248, 1, 0x48uLL);
    if (v10)
    {
      v11 = v10;
      if (Hal22_InitializeConn())
        goto LABEL_33;
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v12 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "HAL", 73, "Hal01_01HandleInitReq", 1313);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      if (!v3)
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid GnssHw,%u\n");
LABEL_26:
          gnssOsa_PrintLog(__str, 1, 1, 0);
        }
LABEL_27:
        *(_QWORD *)v11 = 0x300000001;
        (*(void (**)(uint64_t, int *))(a1 + 16))(3, v11);
        goto LABEL_33;
      }
      if (v3 != 1)
      {
LABEL_33:
        free(v11);
        return 0;
      }
      if (Hal35_Is_HW_SPI_EN_Default() && (Ga05_GetDebugFeaturesBitmask() & 0x10) == 0)
      {
        Hal35_Set_SPI_InUse(1);
        Hal_Is_BaseBandSPMI_Ack_Enabled();
        Hal35_BaseBandSPMI_GNSSWake();
        if ((v13 & 1) != 0)
        {
          Hal01_Init_SPI(a1, v11, (char *)v11);
          goto LABEL_33;
        }
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPMI wake trigger failed\n");
          goto LABEL_26;
        }
        goto LABEL_27;
      }
      v27 = 3;
      if (Hal34_InitPciGnssDevice(&v27))
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v15 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "HAL", 69, "Hal01_Init_SPI_OR_PCIe", 1293);
          gnssOsa_PrintLog(__str, 1, 1, 0);
        }
        v16 = v27;
        *v11 = 1;
        v11[1] = v16;
        v17 = (void (**)(uint64_t, char *))(a1 + 16);
        goto LABEL_32;
      }
      v19 = *(void (**)(uint64_t, char *))(a1 + 16);
      v17 = (void (**)(uint64_t, char *))(a1 + 16);
      if (!Hal01_GetRevisionInfo((char *)v11, v19))
        goto LABEL_33;
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v20 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "HAL", 73, "Hal01_Init_SPI_OR_PCIe", 1285);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      v21 = v27;
      *v11 = 2;
      v11[1] = v21;
      v22 = (unsigned __int16)word_2579E3EF8;
      v23 = byte_2579E3EF5;
      if (word_2579E3EF8 == 3599 && byte_2579E3EF5 < 2u)
        goto LABEL_32;
      if (word_2579E3EF8 == 3599 && byte_2579E3EF5 >= 2u)
      {
        if ((Ga05_GetDebugFeaturesBitmask() & 0x20) == 0)
        {
LABEL_32:
          (*v17)(3, (char *)v11);
          goto LABEL_33;
        }
        v22 = (unsigned __int16)word_2579E3EF8;
        v23 = byte_2579E3EF5;
      }
      if (v22 != 3599 || v23 < 2 || (Ga05_GetDebugFeaturesBitmask() & 0x20) == 0)
        goto LABEL_33;
      if (Hal35_InitSPI())
      {
        if (!Hal01_GetRevisionInfo((char *)v11, *v17))
          goto LABEL_33;
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(__str, 0x3C6uLL);
          v24 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "HAL", 73, "Hal01_Init_SPI_OR_PCIe", 1285);
          gnssOsa_PrintLog(__str, 4, 1, 0);
        }
        v25 = 2;
      }
      else
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v26 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPI Init failed\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v26), "HAL", 69, "Hal01_Init_SPI_OR_PCIe");
          gnssOsa_PrintLog(__str, 1, 1, 0);
        }
        v25 = 1;
      }
      *v11 = v25;
      v11[1] = v21;
      goto LABEL_32;
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v14 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "HAL", 69, "Hal01_01HandleInitReq", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Hal01_03WriteDataToChip(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char __str[966];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_WRITE_DATA_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 68, "Hal01_03WriteDataToChip");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (g_IsFSMDeInit == 1)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx DeInitState\n");
LABEL_12:
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
  }
  else if (a1)
  {
    Hal22_ZxSendToChip(*(unsigned __int8 **)(a1 + 16), *(unsigned __int16 *)(a1 + 24));
    v3 = *(void **)(a1 + 16);
    if (v3)
      free(v3);
    *(_QWORD *)(a1 + 16) = 0;
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
    goto LABEL_12;
  }
  return 0;
}

uint64_t Hal01_02HandleDeInitReq(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  void *v5;
  BOOL v6;
  void (*v7)(uint64_t, void *);
  uint64_t v8;
  int v9;
  uint64_t v10;
  char __str[966];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_DEINIT_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_02HandleDeInitReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v3 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "HAL", 73, "Hal01_02HandleDeInitReq");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
  }
  if (a1)
  {
    g_IsFSMDeInit = 1;
    v4 = gnssOsa_Calloc("Hal01_02HandleDeInitReq", 331, 1, 0x48uLL);
    if (v4)
    {
      v5 = v4;
      *v4 = 6;
      v6 = word_2579E3EF8 == 3599 && byte_2579E3EF5 >= 2u;
      if (v6 && (Ga05_GetDebugFeaturesBitmask() & 0x20) != 0)
        Hal35_DeInitSPI();
      Hal22_DeInitializeConn();
      v7 = *(void (**)(uint64_t, void *))(a1 + 16);
      if (v7)
        v7(4, v5);
      free(v5);
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v8 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "HAL", 73, "Hal01_02HandleDeInitReq");
        v9 = 4;
LABEL_19:
        gnssOsa_PrintLog(__str, v9, 1, 0);
      }
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v10 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "HAL", 69, "Hal01_02HandleDeInitReq", 517);
    v9 = 1;
    goto LABEL_19;
  }
  return 0;
}

uint64_t Hal01_HandleGnssBBResetReq()
{
  uint64_t v0;
  char __str[966];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v0 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_GNSSBASEBAND_RESET_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "HAL", 73, "Hal01_HandleGnssBBResetReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  Hal_BaseBandSPMI_GNSSTriggerTrap();
  return 0;
}

uint64_t Hal01_HandleSetPowerReport(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char __str[966];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_SET_POWER_RPT_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_HandleSetPowerReport");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    Hal32_SetPowerReport(*(unsigned __int8 *)(a1 + 12), *(void (**)(BOOL))(a1 + 16), *(uint64_t (**)(double, double, double, double))(a1 + 24));
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "HAL", 69, "Hal01_HandleSetPowerReport", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Hal01_HandleTMPulseTrig(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;
  char __str[4];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_TRIG_TIMEMARK_PULSE_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_HandleTMPulseTrig");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (!a1)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
LABEL_10:
    gnssOsa_PrintLog(__str, 1, 1, 0);
    return 0;
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeMarkPulseCb\n");
    goto LABEL_10;
  }
  *(_DWORD *)__str = 0;
  v3 = Hal25_TriggerTimeMarkStrobe((unsigned int *)__str);
  (*(void (**)(_QWORD, _BOOL8))(a1 + 16))(*(unsigned int *)__str, v3);
  return 0;
}

uint64_t Hal01_HandleGNSSWakeReq(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  char __str[966];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:HAL_GNSS_WAKE_REQUEST_MSG\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "HAL", 73, "Hal01_HandleGNSSWakeReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    if (g_IsSPIEnabled)
    {
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v3 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Triggered GNSS wake\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "HAL", 73, "Hal01_HandleGNSSWakeReq");
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      Hal35_BaseBandSPMI_GNSSWake();
      v5 = v4;
      if (Hal15_ReadHwRevision(77))
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPMI Wake failed, trigger GNSS coredump\n");
LABEL_15:
          gnssOsa_PrintLog(__str, 1, 1, 0);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPMI based GNSS Wake, read rev success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "HAL", 73, "Hal01_HandleGNSSWakeReq");
LABEL_21:
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
    }
    else
    {
      if (Hal15_ReadHwRevision(80))
      {
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: CP read rev failed, trigger GNSS coredump\n");
          goto LABEL_15;
        }
LABEL_16:
        Hal_BaseBandSPMI_GNSSTriggerTrap();
        v5 = 0;
        goto LABEL_23;
      }
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v8 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: CP read rev success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "HAL", 73, "Hal01_HandleGNSSWakeReq");
        v5 = 1;
        goto LABEL_21;
      }
      v5 = 1;
    }
LABEL_23:
    v9 = *(void (**)(uint64_t))(a1 + 16);
    if (v9)
      v9(v5);
    return 0;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "HAL", 69, "Hal01_HandleGNSSWakeReq", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Hal01_Init_SPI(uint64_t a1, _QWORD *a2, char *a3)
{
  uint64_t (**v6)(uint64_t, char *);
  void (*v7)(uint64_t, char *);
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  char __str[966];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (Hal35_InitSPI())
  {
    v7 = *(void (**)(uint64_t, char *))(a1 + 16);
    v6 = (uint64_t (**)(uint64_t, char *))(a1 + 16);
    result = Hal01_GetRevisionInfo(a3, v7);
    if (!(_DWORD)result)
      return result;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "HAL", 73, "Hal01_Init_SPI", 1285);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    *a2 = 0x300000002;
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v10 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SPI Init failed\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "HAL", 69, "Hal01_Init_SPI");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    *a2 = 0x300000001;
    v6 = (uint64_t (**)(uint64_t, char *))(a1 + 16);
  }
  return (*v6)(3, a3);
}

uint64_t Hal01_GetRevisionInfo(char *a1, void (*a2)(uint64_t, char *))
{
  uint64_t result;
  char *v5;
  uint64_t v6;
  int v7;
  size_t v8;
  const char *p_p;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  void *__p;
  unint64_t v14;
  unsigned __int8 v15;
  int v16;
  char __str[966];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = 1;
  result = (uint64_t)gnssOsa_Calloc("Hal01_GetRevisionInfo", 81, 1, 0x48uLL);
  if (result)
  {
    v5 = (char *)result;
    if (Hal22_GetHwRevision(&v16))
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        v6 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "HAL", 69, "Hal01_GetRevisionInfo", 1286);
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      v7 = v16;
      *(_DWORD *)a1 = 3;
      *((_DWORD *)a1 + 1) = v7;
      a2(3, a1);
      free(v5);
      return 0;
    }
    else
    {
      *(_DWORD *)v5 = 4;
      *((_DWORD *)v5 + 1) = (unsigned __int16)word_2579E3EF8;
      Hal15_GetGNSSVersionString(&__p);
      if ((char)v15 < 0)
      {
        p_p = (const char *)__p;
        if (v14 >= 0x40)
          v8 = 64;
        else
          v8 = v14;
      }
      else
      {
        if ((v15 & 0xC0) != 0)
          v8 = 64;
        else
          v8 = v15;
        p_p = (const char *)&__p;
      }
      strncpy(v5 + 8, p_p, v8);
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v10 = mach_continuous_time();
        v11 = byte_2579E3EF5 > 1u && word_2579E3EF8 == 3599;
        v12 = 78;
        if (v11)
          v12 = 89;
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s, GNSSHW SPI,%c\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "HAL", 73, "Hal01_GetRevisionInfo", v5 + 8, v12);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      a2(1, v5);
      free(v5);
      if ((char)v15 < 0)
        operator delete(__p);
      return 1;
    }
  }
  return result;
}

void sub_24BBBA5FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t CRCGenerator::GetCRC32(_QWORD *a1, unsigned int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;

  v3 = a3 + a2;
  if (v3 <= a2)
  {
    v10 = 0;
  }
  else
  {
    v4 = a2;
    v5 = -1;
    do
    {
      v6 = __rbit32(*(unsigned __int8 *)(*a1 + v4));
      v7 = 8;
      do
      {
        v8 = v5 ^ v6;
        v9 = 2 * v5;
        v5 = (2 * v5) ^ 0x4C11DB7;
        if (v8 >= 0)
          v5 = v9;
        v6 *= 2;
        --v7;
      }
      while (v7);
      ++v4;
    }
    while (v4 != v3);
    v10 = ~v5;
  }
  return __rbit32(v10);
}

void Geo2ECEF(uint64_t a1, uint64_t a2, double *a3)
{
  double v6;
  __double2 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21[4];

  v21[3] = *(double *)MEMORY[0x24BDAC8D0];
  v6 = *(double *)(a1 + 16);
  v7 = __sincos_stret(*(double *)a1);
  v8 = *(double *)(a2 + 8) / sqrt(-(*(double *)(a2 + 24) * v7.__sinval) * v7.__sinval + 1.0);
  v9 = v7.__cosval * (v6 + v8);
  v10 = cos(*(long double *)(a1 + 8)) * v9;
  *a3 = v10;
  v11 = sin(*(long double *)(a1 + 8)) * v9;
  a3[1] = v11;
  v12 = v7.__sinval * (v6 + v8 * *(double *)(a2 + 40));
  a3[2] = v12;
  if (*(_WORD *)a2)
  {
    v13 = v10 - *(double *)(a2 + 48);
    *a3 = v13;
    v14 = v11 - *(double *)(a2 + 56);
    a3[1] = v14;
    v15 = v12 - *(double *)(a2 + 64);
    a3[2] = v15;
    if (*(_BYTE *)(a2 + 2))
    {
      v16 = 0;
      v17 = (double *)(a2 + 88);
      do
      {
        v18 = v14 * *(v17 - 1) + *(v17 - 2) * v13;
        v19 = *v17;
        v17 += 3;
        v21[v16++] = v18 + v19 * v15;
      }
      while (v16 != 3);
      v20 = v14 - v21[1];
      *a3 = v13 - v21[0];
      a3[1] = v20;
      a3[2] = v15 - v21[2];
    }
  }
}

void GncS04_07SndDbgNmea(char *a1, size_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  char __str[966];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = gnssOsa_Calloc("GncS04_07SndDbgNmea", 211, 1, 0x18uLL);
  if (v4)
  {
    v5 = v4;
    v6 = gnssOsa_Calloc("GncS04_07SndDbgNmea", 220, (unsigned __int16)(a2 + 1), 1uLL);
    v5[2] = v6;
    if (v6)
    {
      memcpy_s("GncS04_07SndDbgNmea", 227, v6, (unsigned __int16)(a2 + 1), a1, a2);
      *((_WORD *)v5 + 6) = a2;
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_NMEA_DATA_IND =>GNM Len,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 73, "GncS04_07SndDbgNmea", *((unsigned __int16 *)v5 + 6));
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      AgpsSendFsmMsg(130, 128, 8521475, v5);
    }
    else
    {
      free(v5);
    }
  }
}

void GncS04_08SndStartPosNmea(uint64_t a1)
{
  __int16 v2;
  uint64_t v3;
  size_t v4;
  uint64_t v5;
  unsigned __int16 v6;
  char __s[966];
  char __str[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = word_2579BA2B8;
  bzero(__str, 0x400uLL);
  v3 = mach_continuous_time();
  v6 = snprintf(__str, 0x400uLL, "$PDPSS,%u,%u,%u,%u,%d,%u,%u,%u,%u,%u", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), *(unsigned __int16 *)(a1 + 2), *(unsigned __int8 *)(a1 + 4), *(unsigned __int8 *)(a1 + 49), *(_DWORD *)(a1 + 20), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), *(unsigned __int16 *)(a1 + 34), *(unsigned __int16 *)(a1 + 36), *(unsigned __int8 *)(a1 + 32));
  if (HswUtil_AddNmeaCS(__str, 0x400u, &v6))
  {
    v4 = v6;
    LbsOsaTrace_PrintAsciiBuf(1u, 4u, 0, (uint64_t)__str, v6);
    if ((v2 & 0x200) != 0)
      GncS04_07SndDbgNmea(__str, v4);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__s, 0x3C6uLL);
    v5 = mach_continuous_time();
    snprintf(__s, 0x3C5uLL, "%10u %s%c %s: #%04hx BytesWritten,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 69, "GncS04_08SndStartPosNmea", 772, v6);
    gnssOsa_PrintLog(__s, 1, 1, 0);
  }
}

void GncS04_20SendUpdateToGncpe(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  __int128 v4;
  char v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  __int16 v11;
  char v12;
  __int16 v13;
  char v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  BYTE8(v4) = 0;
  *(_QWORD *)&v4 = 0;
  BYTE12(v4) = 1;
  HIWORD(v4) = *(_WORD *)(a1 + 2);
  v5 = *(_BYTE *)(a1 + 32) & 3;
  v6 = *(_DWORD *)(a1 + 8);
  v15 = *(_BYTE *)(a1 + 50);
  v1 = *(unsigned __int8 *)(a1 + 4);
  if (*(_BYTE *)(a1 + 4))
    v1 = *(_DWORD *)(a1 + 28);
  v2 = *(_DWORD *)(a1 + 12);
  v7 = v1;
  v8 = v2;
  v3 = *(_DWORD *)(a1 + 34);
  v9 = *(_DWORD *)(a1 + 24);
  v10 = v3;
  v11 = 0;
  v12 = *(_BYTE *)(a1 + 33);
  v13 = 1;
  v14 = *(_BYTE *)(a1 + 49);
  GncS03_07PosEventUpdate(&v4);
}

uint64_t GncS04_29GetRespUpdtStat(uint64_t a1, int a2, _BYTE *a3)
{
  int v6;
  int v7;
  int v8;
  int LatestUpdtOsTime;
  int v10;
  uint64_t v11;
  int v12;
  _BOOL4 v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  int v20;
  uint64_t v21;
  unint64_t v23;
  char __str[966];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (*(unsigned __int8 *)(a1 + 4) - 1 < 2)
    {
      v6 = *(_DWORD *)(a1 + 8);
      v7 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time()) - v6;
      if (a2 == 1 && !*(_BYTE *)(a1 + 48) || (v8 = v7 + 30, (v7 + 30) >= *(_DWORD *)(a1 + 28)))
      {
        v19 = 1;
      }
      else
      {
        LatestUpdtOsTime = GncP_GetLatestUpdtOsTime();
        if (LatestUpdtOsTime)
        {
          v10 = LatestUpdtOsTime;
          v11 = mach_continuous_time();
          v12 = HIWORD(qword_2579BA2B0);
          if ((unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11) - v10 <= HIWORD(qword_2579BA2B0))
          {
            v7 = v10 - *(_DWORD *)(a1 + 8);
            v8 = v7 + 30;
          }
        }
        else
        {
          v12 = HIWORD(qword_2579BA2B0);
        }
        v19 = (v8 + v12) > *(_DWORD *)(a1 + 28);
      }
      v20 = *(unsigned __int8 *)(a1 + 4);
      v13 = v20 == 1 || v19;
      v18 = v20 != 1 || v19;
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v21 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SS ID,%u,Qual,%hhu,IsFinal,%u,SndUpdt,%u,TimeElapsed,%u,RespTime,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 73, "GncS04_29GetRespUpdtStat", *(unsigned __int16 *)(a1 + 2), a2, v13, v18, v7, *(_DWORD *)(a1 + 28));
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      goto LABEL_34;
    }
    if (!*(_BYTE *)(a1 + 4))
    {
      v13 = *(_DWORD *)(a1 + 20) == 1;
      if (*(_DWORD *)(a1 + 16))
      {
        v14 = *(_DWORD *)(a1 + 8);
        v15 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time()) - v14;
        if (HIWORD(qword_2579BA2B0) + v15 + 30 > *(_DWORD *)(a1 + 16))
        {
          if (g_LbsOsaTrace_Config < 4)
          {
            LOBYTE(v13) = 1;
            v18 = 1;
LABEL_34:
            *a3 = v13;
            return v18;
          }
          bzero(__str, 0x3C6uLL);
          v16 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: PeriodicSessStopTm,%u,TimeElapsed,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "GNC", 73, "GncS04_29GetRespUpdtStat", *(_DWORD *)(a1 + 16), v15);
          v13 = 1;
          gnssOsa_PrintLog(__str, 4, 1, 0);
        }
      }
      if (g_LbsOsaTrace_Config < 4)
      {
        v18 = 1;
      }
      else
      {
        bzero(__str, 0x3C6uLL);
        v17 = mach_continuous_time();
        v18 = 1;
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Periodc ID,%u,Qual,%hhu,IsFinal,%u,SndUpdt,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "GNC", 73, "GncS04_29GetRespUpdtStat", *(unsigned __int16 *)(a1 + 2), a2, v13, 1);
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      goto LABEL_34;
    }
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionType,%hhu\n", v23);
      goto LABEL_21;
    }
  }
  else if (g_LbsOsaTrace_Config >= 2)
  {
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
LABEL_21:
    gnssOsa_PrintLog(__str, 2, 1, 0);
  }
  return 0;
}

void GncS04_33SessStopAckTimrExpiry(void)
{
  uint64_t v0;
  char __str[966];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  if (byte_2579E5E60)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v0 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoResp from GNCP\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "GNC", 87, "GncS04_33SessStopAckTimrExpiry");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    byte_2579E5E60 = 0;
    GncS04_31ChkSendPendingStopAck(0);
  }
}

void GncS04_31ChkSendPendingStopAck(int a1)
{
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  char __str[966];
  uint64_t v7;

  v2 = 0;
  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 1;
  do
  {
    v4 = v3;
    if (*((_BYTE *)&g_GncSFGClientData + 52 * v2 + 28) == 3)
    {
      GncS04_21SendStopPosResp(a1, *((unsigned __int16 *)&g_GncSFGClientData + 26 * v2 + 15));
      GncS04_05DeRegClient(v2);
    }
    v3 = 0;
    v2 = 1;
  }
  while ((v4 & 1) != 0);
  if (byte_2579E5E60)
  {
    if (AgpsFsmStopTimer(8523270))
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v5 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 87, "GncS04_31ChkSendPendingStopAck", 1545);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
    }
    byte_2579E5E60 = 0;
  }
}

void GncS04_36SessStartAckTimrExp(void)
{
  uint64_t v0;
  char __str[966];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  if (BYTE8(g_GncSFGClientData))
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v0 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoResp from GNCP\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "GNC", 87, "GncS04_36SessStartAckTimrExp");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    BYTE8(g_GncSFGClientData) = 0;
    GncS04_35ChkSendPendingStartAck(0);
  }
}

void GncS04_35ChkSendPendingStartAck(int a1)
{
  uint64_t v2;
  char v3;
  char v4;
  char *v5;
  _BYTE *v6;
  int v7;
  char *v8;
  __int16 *v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  char __str[20];
  uint64_t v14;
  uint64_t v15;
  _DWORD v16[235];

  v2 = 0;
  *(_QWORD *)&v16[233] = *MEMORY[0x24BDAC8D0];
  v3 = 1;
  do
  {
    v4 = v3;
    v5 = (char *)&g_GncSFGClientData + 52 * v2;
    v7 = v5[28];
    v6 = v5 + 28;
    if (v7 == 2)
    {
      v8 = (char *)&g_GncSFGClientData + 52 * v2;
      v10 = *((unsigned __int16 *)v8 + 15);
      v9 = (__int16 *)(v8 + 30);
      GncS04_22SendStartPosResp(a1, v10);
      if (a1 == 255)
      {
        *v6 = 1;
      }
      else
      {
        v11 = *v9;
        __str[8] = 0;
        *(_QWORD *)__str = 0;
        v15 = 0;
        *(_QWORD *)v16 = 0;
        v14 = 0;
        *(_DWORD *)((char *)&v16[1] + 3) = 0;
        __str[12] = 1;
        *(_WORD *)&__str[14] = v11;
        __str[16] = 0;
        GncS03_07PosEventUpdate((__int128 *)__str);
        GncS04_05DeRegClient(v2);
      }
    }
    v3 = 0;
    v2 = 1;
  }
  while ((v4 & 1) != 0);
  if (BYTE8(g_GncSFGClientData))
  {
    if (AgpsFsmStopTimer(8523014))
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v12 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "GNC", 87, "GncS04_35ChkSendPendingStartAck", 1545);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
    }
    BYTE8(g_GncSFGClientData) = 0;
  }
}

void GncS04_41SendNavData(__int16 a1, char a2, char a3, _DWORD *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  char __s[966];
  char __str[1024];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = gnssOsa_Calloc("GncS04_41SendNavData", 1234, 1, 0x20uLL);
  if (v8)
  {
    v9 = v8;
    v10 = gnssOsa_Calloc("GncS04_41SendNavData", 1240, 1, 0x1740uLL);
    v9[3] = v10;
    if (!v10)
    {
      free(v9);
      return;
    }
    *((_DWORD *)v9 + 3) = *a4;
    *((_WORD *)v9 + 8) = a1;
    *((_BYTE *)v9 + 18) = a2;
    *((_BYTE *)v9 + 19) = a3;
    memcpy(v10, a4 + 2, 0x1740uLL);
    v11 = word_2579BA2B8;
    bzero(__str, 0x400uLL);
    v12 = v9[3];
    v16 = snprintf(__str, 0x400uLL, "$PDPPR,%u,%u,%u,%.9f,%.9f,%f,%.12f,%.12f,%u,%u,%u,%u,%u,%u", *((_DWORD *)v9 + 3), *(_DWORD *)v12, *((unsigned __int16 *)v9 + 8), *(double *)(v12 + 112), *(double *)(v12 + 120), *(double *)(v12 + 136), *(double *)(v12 + 48), *(double *)(v12 + 40), *(unsigned __int8 *)(v12 + 314), *(unsigned __int8 *)(v12 + 315), *(_DWORD *)(v12 + 304), *(unsigned __int8 *)(v12 + 312), *(unsigned __int8 *)(v12 + 297), *(_DWORD *)(v12 + 308));
    if (HswUtil_AddNmeaCS(__str, 0x400u, &v16))
    {
      v13 = v16;
      LbsOsaTrace_PrintAsciiBuf(1u, 4u, 0, (uint64_t)__str, v16);
      if ((v11 & 0x200) != 0)
        GncS04_07SndDbgNmea(__str, v13);
    }
    else
    {
      if (!g_LbsOsaTrace_Config)
      {
LABEL_11:
        AgpsSendFsmMsg(130, 128, 8520707, v9);
        return;
      }
      bzero(__s, 0x3C6uLL);
      v14 = mach_continuous_time();
      snprintf(__s, 0x3C5uLL, "%10u %s%c %s: #%04hx BytesWritten,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "GNC", 69, "GncS04_40SndNavRespNmea", 772, v16);
      gnssOsa_PrintLog(__s, 1, 1, 0);
    }
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v15 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_NAV_DATA_IND =>GNM ID,%u,OSTTick,%u,BBTick,%u,Valid,%u,VSF,%u,SVSignalsInView,%u,SatsUsed,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "GNC", 73, "GncS04_41SendNavData", *((unsigned __int16 *)v9 + 8), *((_DWORD *)v9 + 3), *(_DWORD *)v9[3], *((unsigned __int8 *)v9 + 19), *(unsigned __int8 *)(v9[3] + 297), *(unsigned __int8 *)(v9[3] + 314), *(unsigned __int8 *)(v9[3] + 315));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    goto LABEL_11;
  }
}

uint64_t GncS04_42GetValidNavDataCopy(uint64_t a1, int a2, unsigned int a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  char __str[966];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  GncP_GetNavData(a1);
  if (*(_WORD *)(a1 + 20))
  {
    if ((*(_DWORD *)a1 - a2) >= 0x3E9)
      v6 = a2 - *(_DWORD *)a1;
    else
      v6 = 0;
    if (v6 <= HIWORD(qword_2579BA2B0) + 900)
    {
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        v9 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NavData PosDataAge,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 68, "GncS04_42GetValidNavDataCopy", v6);
        v8 = 1;
        v10 = 5;
LABEL_14:
        gnssOsa_PrintLog(__str, v10, 1, 0);
        return v8;
      }
    }
    else
    {
      if (v6 > a3)
      {
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(__str, 0x3C6uLL);
          v7 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NavData NA PosDataAge,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 73, "GncS04_42GetValidNavDataCopy", v6);
          gnssOsa_PrintLog(__str, 4, 1, 0);
        }
        return 0;
      }
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v11 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NavData AllwdAge,%u,PosDataAge,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "GNC", 73, "GncS04_42GetValidNavDataCopy", a3, v6);
        v8 = 1;
        v10 = 4;
        goto LABEL_14;
      }
    }
    return 1;
  }
  return 0;
}

uint64_t GncS04_71CheckAgeLimitCond(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  uint64_t i;
  char *v6;
  char v7;
  unsigned int v8;
  char *v9;
  _BYTE *v10;
  char v11;
  char *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  char *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  double v26;
  unsigned int v27;
  BOOL v28;
  char *v29;
  __int16 *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v35;
  _DWORD v36[2];
  _DWORD v37[7];
  __int16 v38;
  __int128 v39;
  __int128 v40;
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
  _BYTE v54[30];
  _BYTE v55[1052];
  __int128 v56;
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
  uint64_t v71;
  char v72[966];
  uint64_t v73;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v3 = v2;
  v4 = v1;
  v73 = *MEMORY[0x24BDAC8D0];
  v36[0] = 0;
  *(_QWORD *)v37 = 0;
  *(_DWORD *)((char *)&v37[1] + 3) = 0;
  *(_QWORD *)&v37[5] = 0;
  *(_QWORD *)&v37[3] = 0;
  v38 = 0;
  v53 = 0u;
  memset(v54, 0, sizeof(v54));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  bzero(v55, 0x28CuLL);
  for (i = 964; i != 1348; i += 3)
  {
    v6 = (char *)v36 + i;
    v7 = *((_BYTE *)v36 + i + 2);
    *(_WORD *)v6 = 0;
    v6[2] = v7 & 0xE0;
  }
  v69 = 0u;
  v70 = 0u;
  v8 = v3;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  *(_OWORD *)&v55[1036] = 0u;
  v56 = 0u;
  bzero(&v71, 0x1109uLL);
  v9 = (char *)&g_GncSFGClientData + 52 * v3;
  v11 = v9[60];
  v10 = v9 + 60;
  if ((v11 & 2) != 0)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(v72, 0x3C6uLL);
      v35 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      snprintf(v72, 0x3C5uLL, "%10u %s%c %s: AgeLimit NA ID,%u,PosOutput,%u\n", v35);
LABEL_31:
      v32 = 1;
      goto LABEL_32;
    }
    return 1;
  }
  v12 = (char *)&g_GncSFGClientData + 52 * v8;
  v14 = *((_DWORD *)v12 + 18);
  v13 = (unsigned int *)(v12 + 72);
  if ((GncS04_42GetValidNavDataCopy((uint64_t)v36, v4, v14) & 1) == 0)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(v72, 0x3C6uLL);
      mach_continuous_time();
      snprintf(v72, 0x3C5uLL, "%10u %s%c %s: NavData NA ID,%u\n");
      goto LABEL_31;
    }
    return 1;
  }
  v15 = *v13;
  v16 = (char *)&g_GncSFGClientData + 52 * v8;
  v17 = *((unsigned __int16 *)v16 + 31);
  v18 = *((unsigned __int16 *)v16 + 32);
  if (v17)
    v19 = v17;
  else
    v19 = 100;
  if (v18)
    v20 = v18;
  else
    v20 = 150;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(v72, 0x3C6uLL);
    v21 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v22 = v36[0];
    v23 = mach_continuous_time();
    snprintf(v72, 0x3C5uLL, "%10u %s%c %s: CurrPos Age,%u,VSF,%u,HAcc,%f,VAcc,%f\n", v21, "GNC", 73, "GncS04_70QualifyNavForAgeLimit", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23) - v22, v54[25], *(double *)&v50, *((double *)&v49 + 1));
    gnssOsa_PrintLog(v72, 4, 1, 0);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(v72, 0x3C6uLL);
      v24 = mach_continuous_time();
      snprintf(v72, 0x3C5uLL, "%10u %s%c %s: SessReq Age,%u,HAcc,%u,VAcc,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "GNC", 73, "GncS04_70QualifyNavForAgeLimit", v15, v19, v20);
      gnssOsa_PrintLog(v72, 4, 1, 0);
    }
  }
  v25 = v36[0];
  if (!v36[0])
    goto LABEL_24;
  v26 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
  v27 = (unint64_t)v26 - v25;
  if (v25 - (unint64_t)v26 < 0x3E9)
    v27 = 0;
  v28 = v27 >= v15 || v54[25] == 0;
  if (!v28
    && *(double *)&v50 <= (double)v19
    && *((double *)&v49 + 1) <= (double)v20
    && (v29 = (char *)&g_GncSFGClientData + 52 * v8,
        v31 = *((unsigned __int16 *)v29 + 15),
        v30 = (__int16 *)(v29 + 30),
        GncS04_22SendStartPosResp(255, v31),
        (*v10 & 1) != 0))
  {
    GncS04_41SendNavData(*v30, 1, 1, v36);
    v32 = 0;
  }
  else
  {
LABEL_24:
    v32 = 1;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(v72, 0x3C6uLL);
    v33 = mach_continuous_time();
    snprintf(v72, 0x3C5uLL, "%10u %s%c %s: SendReqGncP,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v33), "GNC", 73, "GncS04_71CheckAgeLimitCond", v32);
LABEL_32:
    gnssOsa_PrintLog(v72, 4, 1, 0);
  }
  return v32;
}

void GncS04_22SendStartPosResp(int a1, int a2)
{
  _BYTE *v4;
  _BYTE *v5;
  uint64_t v6;
  char __str[966];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = gnssOsa_Calloc("GncS04_22SendStartPosResp", 416, 1, 0x10uLL);
  if (v4)
  {
    v5 = v4;
    *((_WORD *)v4 + 6) = a2;
    v4[14] = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_START_POS_RSP =>GNM ID,%hu,Code,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 73, "GncS04_22SendStartPosResp", a2, a1);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    AgpsSendFsmMsg(130, 128, 8519684, v5);
  }
}

void GncS04_72SendUpdates(uint64_t a1)
{
  int v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  char *v6;
  char *v7;
  int v8;
  int v9;
  uint64_t v10;
  char *v11;
  _DWORD *v12;
  int v13;
  char *v14;
  unsigned int v15;
  int *v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  char *v22;
  char v23;
  _BYTE *v24;
  char v25;
  int RespUpdtStat;
  uint64_t i;
  char *v28;
  char v29;
  int ValidNavDataCopy;
  char v31;
  uint64_t v32;
  unsigned __int16 *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  _DWORD *v40;
  _DWORD *v41;
  uint64_t v42;
  int v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  char v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  unsigned int v62;
  unsigned int v63[2];
  char v64;
  char __s[966];
  char __str[8];
  _DWORD v67[7];
  __int16 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[30];
  _BYTE v85[1052];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  _BYTE v102[6];
  unsigned __int8 v103;
  uint64_t v104;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v104 = *MEMORY[0x24BDAC8D0];
  v2 = mach_continuous_time();
  v3 = 0;
  v4 = 0;
  *(_QWORD *)v63 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2);
  do
  {
    v5 = v3;
    v6 = (char *)&g_GncSFGClientData + 52 * v4;
    v9 = v6[28];
    v7 = v6 + 28;
    v8 = v9;
    if (v9)
      v10 = (uint64_t)v7;
    else
      v10 = 0;
    if (v8 == 1)
    {
      v11 = (char *)&g_GncSFGClientData + 52 * v4;
      v13 = *((_DWORD *)v11 + 12);
      v12 = v11 + 48;
      if (!v13)
      {
        if (g_LbsOsaTrace_Config < 4)
          goto LABEL_94;
        bzero(__str, 0x3C6uLL);
        mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoUpdt ID,%u,NumFix,0\n");
LABEL_19:
        v20 = 4;
LABEL_93:
        gnssOsa_PrintLog(__str, v20, 1, 0);
        goto LABEL_94;
      }
      v14 = (char *)&g_GncSFGClientData + 52 * v4;
      v15 = *((_DWORD *)v14 + 10);
      v16 = (int *)(v14 + 36);
      if (v15)
        v17 = v63[0] - *((_DWORD *)v14 + 9) + 30 >= v15;
      else
        v17 = 1;
      if (!v17)
      {
        if (g_LbsOsaTrace_Config < 4)
          goto LABEL_94;
        bzero(__str, 0x3C6uLL);
        v19 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoUpdt ID,%u,Unsol,%c,TmElapsed,%u,StartUpdt,%u\n", v19, "GNC");
        goto LABEL_19;
      }
      if (v1)
      {
        if (g_LbsOsaTrace_Config < 4)
          goto LABEL_24;
        bzero(__str, 0x3C6uLL);
        v18 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updt Unsol ID,%u,Type,%hhu,PrevUpdt,%u\n", v18);
      }
      else
      {
        if (!*((_BYTE *)&g_GncSFGClientData + 52 * v4 + 32))
        {
          if (g_LbsOsaTrace_Config < 4)
            goto LABEL_94;
          bzero(__str, 0x3C6uLL);
          v44 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: NoUpdt ID,%u,Type,%hhu,Unsol,N,PrevUpdt,%u\n", v44);
          goto LABEL_19;
        }
        if (g_LbsOsaTrace_Config < 4)
        {
LABEL_24:
          v22 = (char *)&g_GncSFGClientData + 52 * v4;
          v25 = v22[60];
          v24 = v22 + 60;
          v23 = v25;
          if ((v25 & 1) == 0)
          {
            RespUpdtStat = 0;
            if ((v23 & 2) == 0)
              goto LABEL_68;
            goto LABEL_49;
          }
          v64 = 0;
          *(_DWORD *)__str = 0;
          *(_QWORD *)v67 = 0;
          *(_DWORD *)((char *)&v67[1] + 3) = 0;
          *(_QWORD *)&v67[3] = 0;
          *(_QWORD *)&v67[5] = 0;
          v68 = 0;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          v83 = 0u;
          memset(v84, 0, sizeof(v84));
          bzero(v85, 0x28CuLL);
          for (i = 964; i != 1348; i += 3)
          {
            v28 = &__str[i];
            v29 = __str[i + 2];
            *(_WORD *)v28 = 0;
            v28[2] = v29 & 0xE0;
          }
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v87 = 0u;
          v88 = 0u;
          *(_OWORD *)&v85[1036] = 0u;
          v86 = 0u;
          bzero(&v101, 0x1109uLL);
          ValidNavDataCopy = GncS04_42GetValidNavDataCopy((uint64_t)__str, v63[0], 0);
          v31 = ValidNavDataCopy;
          if (ValidNavDataCopy)
          {
            if (v103 >= 2u)
              v32 = 2;
            else
              v32 = v103;
            if ((_DWORD)v32)
            {
              v33 = (unsigned __int16 *)v102;
              while (*((_BYTE *)v33 - 1) != 1 || *v33 != *(unsigned __int16 *)(v10 + 2))
              {
                v33 += 2;
                if (!--v32)
                  goto LABEL_38;
              }
              v35 = *((unsigned __int8 *)v33 - 2);
LABEL_43:
              RespUpdtStat = GncS04_29GetRespUpdtStat(v10, v35, &v64);
              if (RespUpdtStat)
              {
                GncS04_41SendNavData(*(_WORD *)(v10 + 2), v64, v31, __str);
                if (*(_DWORD *)(v10 + 24) >> 3 >= 0x271u)
                  GncS03_08SessRespSentInd(v63[0], v67[0], *(_WORD *)(v10 + 2), 0);
              }
              else if (g_LbsOsaTrace_Config >= 4)
              {
                bzero(__s, 0x3C6uLL);
                v37 = mach_continuous_time();
                snprintf(__s, 0x3C5uLL, "%10u %s%c %s: NavData NoUpdt ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v37), "GNC", 73, "GncS04_43UpdateNavSvData", *(unsigned __int16 *)(v10 + 2));
                gnssOsa_PrintLog(__s, 4, 1, 0);
              }
              if ((*v24 & 2) == 0)
                goto LABEL_68;
LABEL_49:
              if (!v1)
                goto LABEL_68;
              v38 = gnssOsa_Calloc("GncS04_37UpdateDetailedMeasData", 1143, 1, 0x1B8uLL);
              if (!v38)
                goto LABEL_68;
              v39 = v38;
              if ((GncP_GetDetailedMeasData((uint64_t)v38) & 1) != 0)
              {
                __s[0] = 0;
                GncS04_29GetRespUpdtStat(v10, 1, __s);
                v40 = gnssOsa_Calloc("GncS04_37UpdateDetailedMeasData", 1167, 1, 0x20uLL);
                if (v40)
                {
                  v41 = v40;
                  v40[3] = v63[0];
                  *((_WORD *)v40 + 8) = *(_WORD *)(v10 + 2);
                  *((_BYTE *)v40 + 18) = __s[0];
                  *((_QWORD *)v40 + 3) = v39;
                  if (g_LbsOsaTrace_Config >= 4)
                  {
                    bzero(__str, 0x3C6uLL);
                    v42 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_RAWMEAS_DATA_IND =>GNM ID,%d,OSTTick,%d,Final,%d,NumMeas,%u,NumUsed,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v42), "GNC", 73, "GncS04_37UpdateDetailedMeasData", *((unsigned __int16 *)v41 + 8), v41[3], *((unsigned __int8 *)v41 + 18), *((unsigned __int16 *)v39 + 44), *((unsigned __int16 *)v39 + 164));
                    gnssOsa_PrintLog(__str, 4, 1, 0);
                  }
                  AgpsSendFsmMsg(130, 128, 8520195, v41);
                  if (*v24 == 2)
                  {
                    v43 = RespUpdtStat + 1;
                    goto LABEL_69;
                  }
LABEL_68:
                  v43 = 1;
                  if (!RespUpdtStat)
                  {
                    v43 = 0;
                    v50 = 1;
LABEL_71:
                    v51 = *(unsigned __int8 *)(v10 + 4);
                    if (v51 == 2)
                    {
                      v55 = *v16;
                      if ((unint64_t)(*(double *)&g_MacClockTicksToMsRelation
                                                          * (double)mach_continuous_time())
                         - v55 >= *(_DWORD *)(v10 + 28))
                      {
                        *v12 = 0;
                        if (g_LbsOsaTrace_Config < 4)
                          goto LABEL_94;
                        bzero(__str, 0x3C6uLL);
                        v56 = mach_continuous_time();
                        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ID,%u,RespTime,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v56), "GNC", 73, "GncS04_30UpdateSessionParam", *(unsigned __int16 *)(v10 + 2), *(_DWORD *)(v10 + 28));
                        v57 = 4;
LABEL_89:
                        gnssOsa_PrintLog(__str, v57, 1, 0);
                      }
                    }
                    else
                    {
                      if (v51 != 1)
                      {
                        if (!*(_BYTE *)(v10 + 4))
                        {
                          if (RespUpdtStat && *v12 != -1)
                            --*v12;
                          if (!*(_DWORD *)(v10 + 16))
                            goto LABEL_91;
                          v52 = *v16;
                          v53 = mach_continuous_time();
                          v54 = RespUpdtStat ^ 1;
                          if ((unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v53)
                             - v52
                             + HIWORD(qword_2579BA2B0)
                             + 30 <= *(_DWORD *)(v10 + 16))
                            v54 = 1;
                          if ((v54 & 1) != 0)
                            goto LABEL_91;
                          goto LABEL_90;
                        }
                        if (g_LbsOsaTrace_Config < 2)
                          goto LABEL_94;
                        bzero(__str, 0x3C6uLL);
                        v58 = mach_continuous_time();
                        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v58), "GNC", 87, "GncS04_30UpdateSessionParam", 770, *(unsigned __int8 *)(v10 + 4));
                        v57 = 2;
                        goto LABEL_89;
                      }
                      if (!v50)
                      {
LABEL_90:
                        *v12 = 0;
                        goto LABEL_91;
                      }
                      *(_DWORD *)(v10 + 40) = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation
                                                               * (double)mach_continuous_time());
                    }
LABEL_91:
                    if (g_LbsOsaTrace_Config < 5)
                      goto LABEL_94;
                    bzero(__str, 0x3C6uLL);
                    v59 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ID,%u,UpdtSnt,%u,PrevUpdt,%u,NumFix,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v59), "GNC", 68, "GncS04_30UpdateSessionParam", *(unsigned __int16 *)(v10 + 2), v43, *(_DWORD *)(v10 + 40), *v12);
                    v20 = 5;
                    goto LABEL_93;
                  }
LABEL_69:
                  v49 = mach_continuous_time();
                  v50 = 0;
                  *(_DWORD *)(v10 + 40) = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v49);
                  RespUpdtStat = 1;
                  goto LABEL_71;
                }
              }
              else if (g_LbsOsaTrace_Config >= 2)
              {
                bzero(__str, 0x3C6uLL);
                v45 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: DetailMeas Updt NA ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v45), "GNC", 87, "GncS04_37UpdateDetailedMeasData", *(unsigned __int16 *)(v10 + 2));
                gnssOsa_PrintLog(__str, 2, 1, 0);
              }
              v46 = (void *)v39[12];
              if (v46)
                free(v46);
              v39[12] = 0;
              v47 = (void *)v39[42];
              if (v47)
                free(v47);
              v39[42] = 0;
              v48 = (void *)v39[44];
              if (v48)
                free(v48);
              free(v39);
              goto LABEL_68;
            }
LABEL_38:
            if (g_LbsOsaTrace_Config >= 2)
            {
              bzero(__s, 0x3C6uLL);
              v34 = mach_continuous_time();
              snprintf(__s, 0x3C5uLL, "%10u %s%c %s: NavQual Missing ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v34), "GNC", 87, "GncS04_43UpdateNavSvData", *(unsigned __int16 *)(v10 + 2));
              v35 = 2;
              gnssOsa_PrintLog(__s, 2, 1, 0);
              goto LABEL_43;
            }
          }
          else if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__s, 0x3C6uLL);
            v36 = mach_continuous_time();
            snprintf(__s, 0x3C5uLL, "%10u %s%c %s: NavData NA ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v36), "GNC", 73, "GncS04_43UpdateNavSvData", *(unsigned __int16 *)(v10 + 2));
            gnssOsa_PrintLog(__s, 4, 1, 0);
          }
          v35 = 2;
          goto LABEL_43;
        }
        bzero(__str, 0x3C6uLL);
        v21 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updt ID,%u,Type,%hhu,Unsol,N,TmElapsed,%u,RespTime,%u\n", v21, "GNC");
      }
      gnssOsa_PrintLog(__str, 4, 1, 0);
      goto LABEL_24;
    }
LABEL_94:
    v3 = 1;
    v4 = 1;
  }
  while ((v5 & 1) == 0);
  v60 = 0;
  v61 = 1;
  do
  {
    v62 = *((unsigned __int8 *)&g_GncSFGClientData + 52 * v60 + 28) - 3;
    if ((v61 & 1) == 0)
      break;
    v61 = 0;
    v60 = 1;
  }
  while (v62 < 0xFFFFFFFE);
  if (v62 >= 0xFFFFFFFE && (v1 & 1) == 0)
    GncS04_74UpdateScheduler();
}

void GncS04_74UpdateScheduler(void)
{
  uint64_t v0;
  uint64_t v1;
  signed int v2;
  char v3;
  char v4;
  char *v6;
  int v7;
  unsigned __int8 *v8;
  int v9;
  char *v10;
  int v11;
  int v12;
  _DWORD *v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char __str[966];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if ((_BYTE)g_GncSFGClientData)
  {
    if (AgpsFsmStopTimer(8522758) && g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v0 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "GNC", 87, "GncS04_74UpdateScheduler", 1545);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(g_GncSFGClientData) = 0;
  }
  v1 = 0;
  v2 = 0x7FFFFFFF;
  v3 = 1;
  do
  {
    v4 = v3;
    if (*((_BYTE *)&g_GncSFGClientData + 52 * v1 + 28))
    {
      if (*((unsigned __int8 *)&g_GncSFGClientData + 52 * v1 + 28) <= 2u
        && *((_DWORD *)&g_GncSFGClientData + 13 * v1 + 12) != 0)
      {
        v6 = (char *)&g_GncSFGClientData + 52 * v1;
        v9 = v6[32];
        v8 = (unsigned __int8 *)(v6 + 32);
        v7 = v9;
        if ((v9 - 1) >= 2)
        {
          if (v7 && g_LbsOsaTrace_Config >= 2)
          {
            bzero(__str, 0x3C6uLL);
            v20 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "GNC", 87, "GncS04_27GetUpdateReportInt", 770, *v8);
            v19 = 2;
            goto LABEL_24;
          }
        }
        else
        {
          v10 = (char *)&g_GncSFGClientData + 52 * v1;
          v11 = *((_DWORD *)v10 + 9);
          v12 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time()) - v11;
          v14 = *((_DWORD *)v10 + 10);
          v13 = v10 + 40;
          v15 = v12 + 30;
          v16 = v14 + v13[4];
          v17 = v16 - v12 - 30;
          if (v17 <= 30)
            v17 = 30;
          if (v15 >= v16)
            v17 = 30;
          if (v17 < v2)
            v2 = v17;
          if (g_LbsOsaTrace_Config > 4)
          {
            bzero(__str, 0x3C6uLL);
            v18 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ID,%u,StartTm,%u,RespTime,%u,MinPosTime,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "GNC", 68, "GncS04_27GetUpdateReportInt", *((unsigned __int16 *)&g_GncSFGClientData + 26 * v1 + 15), *v13, v13[4], v2);
            v19 = 5;
LABEL_24:
            gnssOsa_PrintLog(__str, v19, 1, 0);
          }
        }
      }
    }
    v3 = 0;
    v1 = 1;
  }
  while ((v4 & 1) != 0);
  if (v2 == 0x7FFFFFFF)
  {
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FGSess timer Not Req\n");
      goto LABEL_34;
    }
  }
  else
  {
    if (AgpsFsmStartTimer(0x820C06u, v2))
    {
      if (g_LbsOsaTrace_Config < 2)
        return;
      bzero(__str, 0x3C6uLL);
      v21 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Dur,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 87, "GncS04_74UpdateScheduler", 1544, v2);
      v22 = 2;
    }
    else
    {
      LOBYTE(g_GncSFGClientData) = 1;
      if (g_LbsOsaTrace_Config < 5)
        return;
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Scheduler timer,%u\n");
LABEL_34:
      v22 = 5;
    }
    gnssOsa_PrintLog(__str, v22, 1, 0);
  }
}

void GncS04_73FGPosTimerExpiry(void)
{
  uint64_t v0;
  char __str[966];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v0 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FG timer Expired\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "GNC", 68, "GncS04_73FGPosTimerExpiry");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  LOBYTE(g_GncSFGClientData) = 0;
  GncS04_72SendUpdates(0);
}

uint64_t GncS04_75HandleStopPos(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  char i;
  char v6;
  char *v7;
  __int16 *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  char *v17;
  unsigned __int8 *v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int16 v37;
  char __s[966];
  __int128 __str;
  char v40;
  uint64_t v41;
  uint64_t v42;
  _DWORD v43[249];

  *(_QWORD *)&v43[247] = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(&__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_STOP_POS_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 73, "GncS04_75HandleStopPos");
    gnssOsa_PrintLog((char *)&__str, 4, 1, 0);
  }
  if (a1)
  {
    v3 = 0;
    v4 = *(unsigned __int16 *)(a1 + 12);
    for (i = 1; ; i = 0)
    {
      v6 = i;
      v7 = (char *)&g_GncSFGClientData + 52 * v3;
      v9 = *((unsigned __int16 *)v7 + 15);
      v8 = (__int16 *)(v7 + 30);
      if (v9 == v4)
        break;
      v3 = 1;
      if ((v6 & 1) == 0)
      {
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(&__str, 0x3C6uLL);
          v10 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionNotFound ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "GNC", 87, "GncS04_75HandleStopPos", 2052, v4);
          gnssOsa_PrintLog((char *)&__str, 2, 1, 0);
        }
        GncS04_21SendStopPosResp(1, v4);
        return 0;
      }
    }
    v13 = word_2579BA2B8;
    bzero(&__str, 0x400uLL);
    v14 = mach_continuous_time();
    v37 = snprintf((char *)&__str, 0x400uLL, "$PDPST,%u,%u", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), v4);
    if (HswUtil_AddNmeaCS((char *)&__str, 0x400u, &v37))
    {
      v15 = v37;
      LbsOsaTrace_PrintAsciiBuf(1u, 4u, 0, (uint64_t)&__str, v37);
      if ((v13 & 0x200) != 0)
        GncS04_07SndDbgNmea((char *)&__str, v15);
    }
    else if (g_LbsOsaTrace_Config)
    {
      bzero(__s, 0x3C6uLL);
      v16 = mach_continuous_time();
      snprintf(__s, 0x3C5uLL, "%10u %s%c %s: #%04hx BytesWritten,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "GNC", 69, "GncS04_09SndStopPosNmea", 772, v37);
      gnssOsa_PrintLog(__s, 1, 1, 0);
    }
    v17 = (char *)&g_GncSFGClientData + 52 * v3;
    v19 = v17[28];
    v18 = (unsigned __int8 *)(v17 + 28);
    switch(v19)
    {
      case 0:
        goto LABEL_49;
      case 1:
        v20 = *v8;
        BYTE8(__str) = 0;
        *(_QWORD *)&__str = 0;
        v41 = 0;
        *(_QWORD *)v43 = 0;
        v42 = 0;
        *(_DWORD *)((char *)&v43[1] + 3) = 0;
        BYTE12(__str) = 1;
        HIWORD(__str) = v20;
        v40 = 0;
        GncS03_07PosEventUpdate(&__str);
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(&__str, 0x3C6uLL);
          v21 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Stopped ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 73, "GncS04_75HandleStopPos", 2058, v4);
          gnssOsa_PrintLog((char *)&__str, 4, 1, 0);
        }
        if (byte_2579E5E60)
        {
          if (AgpsFsmStopTimer(8523270) && g_LbsOsaTrace_Config >= 2)
          {
            bzero(&__str, 0x3C6uLL);
            v22 = mach_continuous_time();
            snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "GNC", 87, "GncS04_75HandleStopPos", 1545);
            gnssOsa_PrintLog((char *)&__str, 2, 1, 0);
          }
          byte_2579E5E60 = 0;
        }
        *v18 = 3;
        if (AgpsFsmStartTimer(0x820E06u, 0x258u))
        {
          if (g_LbsOsaTrace_Config < 2)
            goto LABEL_39;
          bzero(&__str, 0x3C6uLL);
          v23 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Dur,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "GNC", 87, "GncS04_75HandleStopPos", 1544, 600);
          v24 = 2;
        }
        else
        {
          byte_2579E5E60 = 1;
          if (g_LbsOsaTrace_Config < 5)
            goto LABEL_39;
          bzero(&__str, 0x3C6uLL);
          v30 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: SessStopAck Timer,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "GNC", 68, "GncS04_75HandleStopPos", 600);
          v24 = 5;
        }
        gnssOsa_PrintLog((char *)&__str, v24, 1, 0);
LABEL_39:
        v31 = 0;
        v32 = 1;
        do
        {
          v33 = *((unsigned __int8 *)&g_GncSFGClientData + 52 * v31 + 28) - 3;
          if ((v32 & 1) == 0)
            break;
          v32 = 0;
          v31 = 1;
        }
        while (v33 < 0xFFFFFFFE);
        if (v33 > 0xFFFFFFFD)
        {
          GncS04_74UpdateScheduler();
        }
        else if ((_BYTE)g_GncSFGClientData)
        {
          if (AgpsFsmStopTimer(8522758) && g_LbsOsaTrace_Config >= 2)
          {
            bzero(&__str, 0x3C6uLL);
            v34 = mach_continuous_time();
            snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v34), "GNC", 87, "GncS04_75HandleStopPos", 1545);
            gnssOsa_PrintLog((char *)&__str, 2, 1, 0);
          }
          LOBYTE(g_GncSFGClientData) = 0;
        }
LABEL_49:
        if (g_LbsOsaTrace_Config < 5)
          return 0;
        bzero(&__str, 0x3C6uLL);
        v35 = mach_continuous_time();
        snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v35), "GNC", 68, "GncS04_75HandleStopPos", byte_2579E5E68);
        v12 = 5;
        break;
      case 2:
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(&__str, 0x3C6uLL);
          v27 = mach_continuous_time();
          snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionNotActive ID,%u,State,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "GNC", 87, "GncS04_75HandleStopPos", 2050, v4, *v18);
          gnssOsa_PrintLog((char *)&__str, 2, 1, 0);
        }
        v28 = *v8;
        BYTE8(__str) = 0;
        *(_QWORD *)&__str = 0;
        v41 = 0;
        *(_QWORD *)v43 = 0;
        v42 = 0;
        *(_DWORD *)((char *)&v43[1] + 3) = 0;
        BYTE12(__str) = 1;
        HIWORD(__str) = v28;
        v40 = 0;
        GncS03_07PosEventUpdate(&__str);
        GncS04_05DeRegClient(v3);
        GncS04_21SendStopPosResp(0, v4);
        goto LABEL_49;
      case 3:
        if (g_LbsOsaTrace_Config < 4)
          return 0;
        bzero(&__str, 0x3C6uLL);
        v29 = mach_continuous_time();
        snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: StopAckPending ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "GNC", 73, "GncS04_75HandleStopPos", v4);
        v26 = 4;
        goto LABEL_35;
      default:
        if (g_LbsOsaTrace_Config < 2)
          return 0;
        bzero(&__str, 0x3C6uLL);
        v25 = mach_continuous_time();
        snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "GNC", 87, "GncS04_75HandleStopPos", 770);
        v26 = 2;
LABEL_35:
        gnssOsa_PrintLog((char *)&__str, v26, 1, 0);
        goto LABEL_49;
    }
    goto LABEL_51;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(&__str, 0x3C6uLL);
    v11 = mach_continuous_time();
    snprintf((char *)&__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "GNC", 69, "GncS04_75HandleStopPos", 517);
    v12 = 1;
LABEL_51:
    gnssOsa_PrintLog((char *)&__str, v12, 1, 0);
  }
  return 0;
}

void GncS04_21SendStopPosResp(int a1, int a2)
{
  _BYTE *v4;
  _BYTE *v5;
  uint64_t v6;
  char __str[966];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = gnssOsa_Calloc("GncS04_21SendStopPosResp", 393, 1, 0x10uLL);
  if (v4)
  {
    v5 = v4;
    *((_WORD *)v4 + 6) = a2;
    v4[14] = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_STOP_POS_RSP =>GNM ID,%hu,Code,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 73, "GncS04_21SendStopPosResp", a2, a1);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    AgpsSendFsmMsg(130, 128, 8519940, v5);
  }
}

void GncS04_05DeRegClient(unsigned int a1)
{
  char *v2;
  char *v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  char __str[966];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!byte_2579E5E68)
  {
    if (g_LbsOsaTrace_Config < 2)
      return;
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u\n");
    goto LABEL_13;
  }
  if (a1 >= 2)
  {
    if (g_LbsOsaTrace_Config < 2)
      return;
LABEL_12:
    bzero(__str, 0x3C6uLL);
    v6 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Handle,%u\n", v6);
LABEL_13:
    gnssOsa_PrintLog(__str, 2, 1, 0);
    return;
  }
  v2 = (char *)&g_GncSFGClientData + 52 * a1;
  v4 = v2[28];
  v3 = v2 + 28;
  if (!v4)
  {
    if (g_LbsOsaTrace_Config < 2)
      return;
    goto LABEL_12;
  }
  --byte_2579E5E68;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v5 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u,DeRegSessionID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 73, "GncS04_05DeRegClient", byte_2579E5E68, *((unsigned __int16 *)&g_GncSFGClientData + 26 * a1 + 15));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  *(_DWORD *)(v3 + 47) = 0;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *(_OWORD *)v3 = 0u;
}

uint64_t GncS04_76HandleStartPos(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  char *v10;
  _BYTE *v11;
  int v12;
  uint64_t v13;
  int v14;
  _BYTE *v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  unint64_t v25;
  int v26;
  char *v27;
  _DWORD *v28;
  uint64_t v29;
  int v30;
  char v31;
  int v32;
  char *v33;
  _DWORD *v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  char *v38;
  unsigned __int8 *v39;
  int v40;
  int v41;
  uint64_t v42;
  unsigned int v43;
  int v44;
  char *v45;
  unsigned __int8 *v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  char *v51;
  _DWORD *v52;
  uint64_t v53;
  char *v54;
  unsigned __int16 *v55;
  int v56;
  int v57;
  uint64_t v58;
  char *v59;
  unsigned __int16 *v60;
  int v61;
  int v62;
  uint64_t v63;
  char *v64;
  _DWORD *v65;
  int v66;
  int v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  int v72;
  unsigned int v73;
  char v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  __int16 v78;
  char *v79;
  int v80;
  _DWORD *v81;
  int v82;
  char *v83;
  int v84;
  char *v86;
  int v87;
  int v88;
  unsigned __int8 v89;
  char *v90;
  unsigned __int8 *v91;
  unsigned __int8 *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  unsigned __int16 *v107;
  char __str[966];
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_START_POS_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 73, "GncS04_76HandleStartPos");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (!a1)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
    bzero(__str, 0x3C6uLL);
    v13 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "GNC", 69, "GncS04_76HandleStartPos", 517);
    v14 = 1;
    goto LABEL_14;
  }
  v3 = 0;
  v4 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
  v5 = 1;
  do
  {
    v6 = v5;
    if (*((unsigned __int16 *)&g_GncSFGClientData + 26 * v3 + 15) == *(unsigned __int16 *)(a1 + 12))
    {
      v15 = (char *)&g_GncSFGClientData + 52 * v3 + 28;
      if (*(_BYTE *)(a1 + 14))
      {
        if ((*(_BYTE *)(a1 + 14) & 1) != 0)
        {
          v16 = *(_DWORD *)(a1 + 32);
          if (*(_BYTE *)(a1 + 15) == 2 && v16 > *(_DWORD *)(a1 + 36))
          {
            if (g_LbsOsaTrace_Config >= 2)
            {
              bzero(__str, 0x3C6uLL);
              v17 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx FixInterval,%u,ResponseTime,%u\n", v17);
LABEL_57:
              v37 = 1;
              gnssOsa_PrintLog(__str, 2, 1, 0);
LABEL_107:
              v19 = *(unsigned __int16 *)(a1 + 12);
              v20 = v37;
              goto LABEL_108;
            }
            goto LABEL_58;
          }
          if (v16 - 1 <= 0x62)
          {
            if (g_LbsOsaTrace_Config >= 2)
            {
              bzero(__str, 0x3C6uLL);
              v25 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx FixInterval,%u,MinSupportedInt,%u\n", v25);
              goto LABEL_57;
            }
LABEL_58:
            v37 = 1;
            goto LABEL_107;
          }
        }
        if ((*(_BYTE *)(a1 + 14) & 2) != 0 && *((_BYTE *)&g_GncSFGClientData + 52 * v3 + 32))
        {
          v26 = *(_DWORD *)(a1 + 36);
          if (!v26)
            v26 = 1000;
          v27 = (char *)&g_GncSFGClientData + 52 * v3;
          *((_DWORD *)v27 + 14) = v26;
          v28 = v27 + 56;
          if (g_LbsOsaTrace_Config < 4)
          {
            v30 = 1;
          }
          else
          {
            bzero(__str, 0x3C6uLL);
            v29 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated RespTime,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v28);
            v30 = 1;
            gnssOsa_PrintLog(__str, 4, 1, 0);
          }
        }
        else
        {
          v30 = 0;
        }
        v31 = *(_BYTE *)(a1 + 14);
        if ((v31 & 1) != 0)
        {
          v32 = 1000;
          if (*(_DWORD *)(a1 + 32))
          {
            if (*((_BYTE *)&g_GncSFGClientData + 52 * v3 + 32) == 1)
              v32 = 1000;
            else
              v32 = *(_DWORD *)(a1 + 32);
          }
          v33 = (char *)&g_GncSFGClientData + 52 * v3;
          *((_DWORD *)v33 + 13) = v32;
          v34 = v33 + 52;
          if (g_LbsOsaTrace_Config < 4)
          {
            v30 = 1;
          }
          else
          {
            bzero(__str, 0x3C6uLL);
            v35 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated FixInterval,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v35), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v34);
            v30 = 1;
            gnssOsa_PrintLog(__str, 4, 1, 0);
            v31 = *(_BYTE *)(a1 + 14);
          }
        }
        if ((v31 & 4) != 0)
        {
          v38 = (char *)&g_GncSFGClientData + 52 * v3;
          v40 = v38[60];
          v39 = (unsigned __int8 *)(v38 + 60);
          v41 = *(unsigned __int8 *)(a1 + 48);
          if (v40 != v41)
          {
            *v39 = v41;
            if (g_LbsOsaTrace_Config < 4)
            {
              v30 = 1;
            }
            else
            {
              bzero(__str, 0x3C6uLL);
              v42 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated PosOutput,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v42), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v39);
              v30 = 1;
              gnssOsa_PrintLog(__str, 4, 1, 0);
              v31 = *(_BYTE *)(a1 + 14);
            }
          }
        }
        if ((v31 & 8) != 0)
        {
          v45 = (char *)&g_GncSFGClientData + 52 * v3;
          v47 = v45[61];
          v46 = (unsigned __int8 *)(v45 + 61);
          v48 = *(unsigned __int8 *)(a1 + 50);
          if (v47 != v48)
          {
            *v46 = v48;
            if (g_LbsOsaTrace_Config < 4)
            {
              v30 = 1;
            }
            else
            {
              bzero(__str, 0x3C6uLL);
              v49 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated ConstMask,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v49), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v46);
              v30 = 1;
              gnssOsa_PrintLog(__str, 4, 1, 0);
              v31 = *(_BYTE *)(a1 + 14);
            }
          }
        }
        if ((v31 & 0x10) == 0)
        {
LABEL_85:
          if ((v31 & 0x20) != 0)
          {
            v54 = (char *)&g_GncSFGClientData + 52 * v3;
            v56 = *((unsigned __int16 *)v54 + 31);
            v55 = (unsigned __int16 *)(v54 + 62);
            v57 = *(unsigned __int16 *)(a1 + 44);
            if (v56 != v57)
            {
              *v55 = v57;
              if (g_LbsOsaTrace_Config < 4)
              {
                v30 = 1;
              }
              else
              {
                bzero(__str, 0x3C6uLL);
                v58 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated HorAcc,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v58), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v55);
                v30 = 1;
                gnssOsa_PrintLog(__str, 4, 1, 0);
                v31 = *(_BYTE *)(a1 + 14);
              }
            }
          }
          if ((v31 & 0x40) != 0)
          {
            v59 = (char *)&g_GncSFGClientData + 52 * v3;
            v61 = *((unsigned __int16 *)v59 + 32);
            v60 = (unsigned __int16 *)(v59 + 64);
            v62 = *(unsigned __int16 *)(a1 + 46);
            if (v61 != v62)
            {
              *v60 = v62;
              if (g_LbsOsaTrace_Config < 4)
              {
                v30 = 1;
              }
              else
              {
                bzero(__str, 0x3C6uLL);
                v63 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated VertAcc,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v63), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v60);
                v30 = 1;
                gnssOsa_PrintLog(__str, 4, 1, 0);
                v31 = *(_BYTE *)(a1 + 14);
              }
            }
          }
          if ((v31 & 0x80) == 0)
            goto LABEL_102;
          v64 = (char *)&g_GncSFGClientData + 52 * v3;
          v66 = *((_DWORD *)v64 + 18);
          v65 = v64 + 72;
          v67 = *(_DWORD *)(a1 + 40);
          if (v66 == v67 || !*(_BYTE *)(a1 + 15))
            goto LABEL_102;
          *v65 = v67;
          if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__str, 0x3C6uLL);
            v68 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated AgeLimit,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v68), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v65);
            gnssOsa_PrintLog(__str, 4, 1, 0);
            v67 = *v65;
          }
          if (v67 && !*((_BYTE *)&g_GncSFGClientData + 52 * v3 + 76))
          {
            v74 = GncS04_71CheckAgeLimitCond(v4);
            v75 = (char *)&g_GncSFGClientData + 52 * v3;
            *((_DWORD *)v75 + 9) = v4;
            *((_DWORD *)v75 + 17) = v4;
            if ((v74 & 1) != 0)
              goto LABEL_103;
          }
          else
          {
LABEL_102:
            v69 = (char *)&g_GncSFGClientData + 52 * v3;
            *((_DWORD *)v69 + 9) = v4;
            *((_DWORD *)v69 + 17) = v4;
            if (v30)
            {
LABEL_103:
              if (g_LbsOsaTrace_Config >= 4)
              {
                bzero(__str, 0x3C6uLL);
                v70 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessionUpdted\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v70), "GNC", 73, "GncS04_32HandleSessionModifyReq", 2059);
                gnssOsa_PrintLog(__str, 4, 1, 0);
              }
              GncS04_20SendUpdateToGncpe((uint64_t)v15);
              GncS04_74UpdateScheduler();
            }
          }
          GncS04_08SndStartPosNmea((uint64_t)v15);
          v37 = 255;
          goto LABEL_107;
        }
        v50 = *(unsigned __int16 *)(a1 + 28);
        if (*(_WORD *)(a1 + 28))
        {
          if (!*((_BYTE *)&g_GncSFGClientData + 52 * v3 + 32))
          {
LABEL_82:
            v51 = (char *)&g_GncSFGClientData + 52 * v3;
            *((_DWORD *)v51 + 12) = v50;
            v52 = v51 + 48;
            if (g_LbsOsaTrace_Config < 4)
            {
              v30 = 1;
            }
            else
            {
              bzero(__str, 0x3C6uLL);
              v53 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Updated NumReports,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v53), "GNC", 73, "GncS04_32HandleSessionModifyReq", *v52);
              v30 = 1;
              gnssOsa_PrintLog(__str, 4, 1, 0);
              v31 = *(_BYTE *)(a1 + 14);
            }
            goto LABEL_85;
          }
        }
        else if (!*((_BYTE *)&g_GncSFGClientData + 52 * v3 + 32))
        {
          v50 = -1;
          goto LABEL_82;
        }
        v50 = 1;
        goto LABEL_82;
      }
      if (*v15 != 2)
      {
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          v36 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ID,%u,ReqRcvd,%u\n", v36);
          goto LABEL_57;
        }
        goto LABEL_58;
      }
      if (g_LbsOsaTrace_Config < 4)
        return 0;
      bzero(__str, 0x3C6uLL);
      v21 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx StartAckPending ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 73, "GncS04_76HandleStartPos", 2053, *(unsigned __int16 *)(a1 + 12));
      v14 = 4;
LABEL_14:
      gnssOsa_PrintLog(__str, v14, 1, 0);
      return 0;
    }
    v5 = 0;
    v3 = 1;
  }
  while ((v6 & 1) != 0);
  v7 = 0;
  v8 = 1;
  while (1)
  {
    v9 = v8;
    v10 = (char *)&g_GncSFGClientData + 52 * v7;
    v12 = v10[28];
    v11 = v10 + 28;
    if (!v12)
      break;
    v8 = 0;
    v7 = 1;
    if ((v9 & 1) == 0)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
LABEL_24:
        gnssOsa_PrintLog(__str, 2, 1, 0);
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          v18 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "GNC", 87, "GncS04_76HandleStartPos", 2049);
          gnssOsa_PrintLog(__str, 2, 1, 0);
        }
      }
      goto LABEL_26;
    }
  }
  if (byte_2579E5E68 > 1u)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v100 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u,Max,%lu\n", v100);
      goto LABEL_24;
    }
LABEL_26:
    v19 = *(unsigned __int16 *)(a1 + 12);
    v20 = 0;
    goto LABEL_108;
  }
  ++byte_2579E5E68;
  *v11 = 1;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v22 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: InstanceCount,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "GNC", 73, "GncS04_76HandleStartPos", byte_2579E5E68);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (*(_BYTE *)(a1 + 14))
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      v103 = *(unsigned __int16 *)(a1 + 12);
      v104 = *(unsigned __int8 *)(a1 + 14);
      v102 = 515;
      v24 = "%10u %s%c %s: #%04hx SessionID,%u,ReqType,%u\n";
      goto LABEL_35;
    }
LABEL_37:
    GncS04_05DeRegClient(v7);
    v19 = *(unsigned __int16 *)(a1 + 12);
    v20 = 1;
LABEL_108:
    GncS04_22SendStartPosResp(v20, v19);
    return 0;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    if (g_LbsOsaTrace_Config < 2)
      goto LABEL_37;
    bzero(__str, 0x3C6uLL);
    v101 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx OutputType,%u\n", v101);
    goto LABEL_36;
  }
  v43 = *(_DWORD *)(a1 + 24);
  v44 = *(unsigned __int8 *)(a1 + 15);
  if (!v43)
  {
    v72 = *(unsigned __int8 *)(a1 + 15);
    if (v44 != 2)
      goto LABEL_119;
    v73 = *(_DWORD *)(a1 + 32);
    if (v73 <= *(_DWORD *)(a1 + 36))
    {
      v72 = 2;
      goto LABEL_125;
    }
    if (g_LbsOsaTrace_Config < 2)
      goto LABEL_37;
    bzero(__str, 0x3C6uLL);
    v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v103 = *(unsigned int *)(a1 + 32);
    v104 = *(unsigned int *)(a1 + 36);
    v102 = 514;
    v24 = "%10u %s%c %s: #%04hx FixInterval,%u,ResponseTime,%u\n";
LABEL_35:
    snprintf(__str, 0x3C5uLL, v24, v23, "GNC", 87, "GncS04_23ChkStartPosParams", v102, v103, v104);
LABEL_36:
    gnssOsa_PrintLog(__str, 2, 1, 0);
    goto LABEL_37;
  }
  if (*(_BYTE *)(a1 + 15))
  {
    if (g_LbsOsaTrace_Config < 2)
      goto LABEL_37;
    bzero(__str, 0x3C6uLL);
    v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v103 = *(unsigned __int8 *)(a1 + 15);
    v104 = *(unsigned int *)(a1 + 24);
    v102 = 515;
    v24 = "%10u %s%c %s: #%04hx SessType,%hhu,StopTime,%u\n";
    goto LABEL_35;
  }
  if (v43 <= *(_DWORD *)(a1 + 20))
  {
    if (g_LbsOsaTrace_Config < 2)
      goto LABEL_37;
    bzero(__str, 0x3C6uLL);
    v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v103 = *(unsigned int *)(a1 + 20);
    v104 = *(unsigned int *)(a1 + 24);
    v102 = 515;
    v24 = "%10u %s%c %s: #%04hx StartTime,%u,StopTime,%u\n";
    goto LABEL_35;
  }
  v72 = 0;
LABEL_119:
  v73 = *(_DWORD *)(a1 + 32);
LABEL_125:
  if (v73 - 1 <= 0x62)
  {
    if (g_LbsOsaTrace_Config < 2)
      goto LABEL_37;
    bzero(__str, 0x3C6uLL);
    v23 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v103 = *(unsigned int *)(a1 + 32);
    v104 = 100;
    v102 = 514;
    v24 = "%10u %s%c %s: #%04hx FixInterval,%u,MinSupportedInt,%u\n";
    goto LABEL_35;
  }
  if (!v72 && *(_DWORD *)(a1 + 40))
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v76 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx AgeLimit,%u,SessionType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v76), "GNC", 87, "GncS04_23ChkStartPosParams", 515, *(_DWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 15));
      gnssOsa_PrintLog(__str, 2, 1, 0);
      v44 = *(unsigned __int8 *)(a1 + 15);
    }
    *(_DWORD *)(a1 + 40) = 0;
  }
  if (*(_BYTE *)(a1 + 16) && !v44)
  {
    if (g_LbsOsaTrace_Config < 2)
    {
      v44 = 0;
    }
    else
    {
      bzero(__str, 0x3C6uLL);
      v77 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx WaitToTimeout,%u,SessionType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v77), "GNC", 87, "GncS04_23ChkStartPosParams", 515, *(unsigned __int8 *)(a1 + 16), *(unsigned __int8 *)(a1 + 15));
      gnssOsa_PrintLog(__str, 2, 1, 0);
      v44 = *(unsigned __int8 *)(a1 + 15);
    }
    *(_BYTE *)(a1 + 16) = 0;
  }
  v78 = *(_WORD *)(a1 + 12);
  v79 = (char *)&g_GncSFGClientData + 52 * v7;
  v80 = 1000 * *(_DWORD *)(a1 + 20);
  *((_DWORD *)v79 + 10) = v80;
  v81 = v79 + 40;
  *((_WORD *)v81 - 5) = v78;
  v107 = (unsigned __int16 *)v81 - 5;
  *(v81 - 1) = v4;
  v81[7] = v4;
  *((_BYTE *)v81 - 8) = v44;
  v82 = *(unsigned __int16 *)(a1 + 28);
  if (!*(_WORD *)(a1 + 28))
  {
    if (!v44)
    {
      v82 = -1;
      goto LABEL_144;
    }
LABEL_143:
    v82 = 1;
    goto LABEL_144;
  }
  if (v44)
    goto LABEL_143;
LABEL_144:
  v83 = (char *)&g_GncSFGClientData + 52 * v7;
  v84 = *(_DWORD *)(a1 + 32);
  if (v44 == 1 || v84 == 0)
    v84 = 1000;
  *((_DWORD *)v83 + 13) = v84;
  v86 = v83 + 52;
  *((_DWORD *)v86 - 1) = v82;
  v87 = *(_DWORD *)(a1 + 24);
  if (v87)
  {
    if (!v44)
    {
      *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 11) = 1000 * v87;
      goto LABEL_156;
    }
  }
  else if (!v44)
  {
    goto LABEL_156;
  }
  v88 = *(_DWORD *)(a1 + 36);
  if (v88)
    *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 14) = v88 + v80;
  else
    *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 14) = 1000;
LABEL_156:
  v89 = *(_BYTE *)(a1 + 54);
  v90 = (char *)&g_GncSFGClientData + 52 * v7;
  v90[76] = *(_BYTE *)(a1 + 16);
  v91 = (unsigned __int8 *)(v90 + 76);
  v91[2] = v89;
  *(v91 - 16) = *(_BYTE *)(a1 + 48);
  *(v91 - 15) = *(_BYTE *)(a1 + 50);
  *(_DWORD *)(v91 - 14) = *(_DWORD *)(a1 + 44);
  *((_DWORD *)v91 - 1) = *(_DWORD *)(a1 + 40);
  v92 = v91 - 4;
  v91[1] = *(_BYTE *)(a1 + 49) != 0;
  if (g_LbsOsaTrace_Config >= 4)
  {
    v105 = v86 - 4;
    v106 = v86;
    bzero(__str, 0x3C6uLL);
    v93 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ID,%u,Type,%hhu,NumFix,%d,FixInt,%u,Age,%u,PrefFtaMeasTime,%u,StartTm,%u,StopTm,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v93), "GNC", 73, "GncS04_24StoreSessParams", 2057, *v107, *((unsigned __int8 *)v81 - 8), *(_DWORD *)v105, *(_DWORD *)v106, *((_DWORD *)v91 - 1), v91[2], *v81, *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 11));
    gnssOsa_PrintLog(__str, 4, 1, 0);
    v92 = v91 - 4;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v94 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespTime,%u,HAcc,%u,VAcc,%u,Output,%u,ConstMask,%u,WaitTO,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v94), "GNC", 73, "GncS04_24StoreSessParams", 2057, *((_DWORD *)&g_GncSFGClientData + 13 * v7 + 14), *((unsigned __int16 *)v91 - 7), *((unsigned __int16 *)v91 - 6), *(v91 - 16), *(v91 - 15), *v91);
      gnssOsa_PrintLog(__str, 4, 1, 0);
      v92 = v91 - 4;
    }
  }
  if (!*(_DWORD *)v92 || *v91 || GncS04_71CheckAgeLimitCond(v4))
  {
    *v11 = 2;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v95 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: StartAckPending ID,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v95), "GNC", 73, "GncS04_76HandleStartPos", *v107);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    if (BYTE8(g_GncSFGClientData))
    {
      if (AgpsFsmStopTimer(8523014) && g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v96 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v96), "GNC", 87, "GncS04_76HandleStartPos", 1545);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      BYTE8(g_GncSFGClientData) = 0;
    }
    if (AgpsFsmStartTimer(0x820D06u, 0x1F40u))
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v97 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Dur,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v97), "GNC", 87, "GncS04_76HandleStartPos", 1544, 8000);
        v98 = 2;
        goto LABEL_174;
      }
    }
    else
    {
      BYTE8(g_GncSFGClientData) = 1;
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        v99 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SessStartAck Timer,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v99), "GNC", 68, "GncS04_76HandleStartPos", 8000);
        v98 = 5;
LABEL_174:
        gnssOsa_PrintLog(__str, v98, 1, 0);
      }
    }
    GncS04_20SendUpdateToGncpe((uint64_t)v11);
    GncS04_74UpdateScheduler();
    GncS04_08SndStartPosNmea((uint64_t)v11);
  }
  return 0;
}

uint64_t GncS04_82HandlePosEvntResp(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  char __str[966];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_POS_EVENT_RSP Status,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 73, "GncS04_82HandlePosEvntResp", *(unsigned __int8 *)(a1 + 12));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    switch(*(_BYTE *)(a1 + 12))
    {
      case 1:
      case 3:
        v3 = 255;
        goto LABEL_10;
      case 2:
      case 7:
        return 0;
      case 4:
      case 5:
        v3 = 2;
LABEL_10:
        GncS04_31ChkSendPendingStopAck(v3);
        return 0;
      case 6:
      case 8:
        v6 = 255;
        goto LABEL_15;
      case 9:
        v6 = 0;
LABEL_15:
        GncS04_35ChkSendPendingStartAck(v6);
        return 0;
      default:
        if (g_LbsOsaTrace_Config < 2)
          return 0;
        bzero(__str, 0x3C6uLL);
        v7 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Status,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNC", 87, "GncS04_82HandlePosEvntResp", 770, *(unsigned __int8 *)(a1 + 12));
        v5 = 2;
        break;
    }
    goto LABEL_8;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNC", 69, "GncS04_82HandlePosEvntResp", 517);
    v5 = 1;
LABEL_8:
    gnssOsa_PrintLog(__str, v5, 1, 0);
  }
  return 0;
}

uint64_t GncS04_99DeInitFGClientInstance(void)
{
  uint64_t result;

  if ((_BYTE)g_GncSFGClientData)
    result = AgpsFsmStopTimer(8522758);
  if (byte_2579E5E60)
    result = AgpsFsmStopTimer(8523270);
  if (BYTE8(g_GncSFGClientData))
    return AgpsFsmStopTimer(8523014);
  return result;
}

uint64_t Gnm10_00InitReq(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char __str[966];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_INIT\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_00InitReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    *(_OWORD *)&qword_2579E5EE8 = 0u;
    *(_OWORD *)&qword_2579E5EF8 = 0u;
    *(_OWORD *)&g_GnmCBs = 0u;
    HSW_InitConfiguration(a1);
    qword_2579E2CE8 = 0;
    unk_2579E2CF0 = 0;
    qword_2579E2CF8 = 0;
    g_GnmInstances[0] = 0;
    g_HWStatus = 0u;
    unk_2579E2D5C = 0u;
    xmmword_2579E2D6C = 0u;
    unk_2579E2D7C = 0u;
    unk_2579E2D85 = 0u;
    g_HalStatusInfo = 0;
    qword_2579E3FE0 = 0;
    unk_2579E3FE8 = 0;
    g_Gnm_NVStoreCntxt = 0;
    *(_DWORD *)&byte_2579E3FEF = 0;
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 69, "Gnm10_00InitReq", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

void *Gnm10_01DeinitReq(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  char __str[966];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_DEINIT\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_01DeinitReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    g_IsHwInit = 0;
    Gnm02_24AbortAllNafSessions(7);
    Gnm02_52DeInitializeInstances();
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v3 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx GnmState,Active/Reset->Init\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 73, "Gnm10_01DeinitReq", 261);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    return &a_GnmInitState;
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNM", 69, "Gnm10_01DeinitReq", 517);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    return 0;
  }
}

uint64_t Gnm10_04PositioningReq(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _WORD *v9;
  unint64_t v10;
  _WORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char __str[966];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_REG_POS_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_04PositioningReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    v3 = *(_BYTE *)(a1 + 54) & 2;
    v4 = Gnm02_13ReqNewNafInstn(*(_DWORD *)(a1 + 12), "GNM_REG_POS_REQ");
    if (v4 && (v5 = v4, (v6 = *((_QWORD *)v4 + 1)) != 0) && *((_BYTE *)v4 + 2) == 1)
    {
      v7 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      *(_BYTE *)(v6 + 4) = *(_BYTE *)(a1 + 54);
      *(_QWORD *)(v6 + 72) = *(_QWORD *)(a1 + 64);
      *(_BYTE *)(v6 + 8) = *(_BYTE *)(a1 + 48);
      *(_DWORD *)(v6 + 12) = v7;
      *(_DWORD *)(v6 + 40) = v7;
      *(int32x2_t *)(v6 + 16) = vmul_s32(*(int32x2_t *)(a1 + 36), vdup_n_s32(0x3E8u));
      *(_DWORD *)(v6 + 24) = *(_DWORD *)(a1 + 32);
      *(_DWORD *)(v6 + 36) = v7;
      *(_WORD *)(v6 + 44) = *(_WORD *)(a1 + 44);
      *(_WORD *)(v6 + 52) = *(_WORD *)(a1 + 50);
      *(_WORD *)(v6 + 54) = *(_WORD *)(a1 + 52);
      *(_QWORD *)(v6 + 28) = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(v6 + 56) = *(_QWORD *)(a1 + 16);
      *(_BYTE *)(v6 + 64) = *(_BYTE *)(a1 + 56);
      Hal_StoreCoExConfiguration(*(_QWORD *)(a1 + 72));
      v8 = *((_QWORD *)v5 + 1);
      v9 = gnssOsa_Calloc("Gnm10_27SendPosStart", 464, 1, 0x38uLL);
      if (v9)
      {
        v11 = v9;
        v9[6] = *v5;
        v9[7] = 0;
        if ((*(_BYTE *)(v8 + 4) & 2) != 0)
        {
          v9[14] = *(_WORD *)(v8 + 44);
        }
        else if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          v12 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SessType\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "GNM", 87, "Gnm10_27SendPosStart", 770);
          gnssOsa_PrintLog(__str, 2, 1, 0);
        }
        LODWORD(v10) = *(_DWORD *)(v8 + 16);
        *(double *)&v17 = (double)v10 * 0.001;
        *((_DWORD *)v11 + 5) = *(double *)&v17;
        LODWORD(v17) = *(_DWORD *)(v8 + 20);
        *((_DWORD *)v11 + 6) = ((double)v17 * 0.001);
        *((_DWORD *)v11 + 8) = *(_DWORD *)(v8 + 24);
        v11[22] = *(_WORD *)(v8 + 52);
        v11[23] = *(_WORD *)(v8 + 54);
        *((_BYTE *)v11 + 48) = *(_BYTE *)(v8 + 8);
        *((_BYTE *)v11 + 50) = 115;
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(__str, 0x3C6uLL);
          v18 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SessionId,%u,StartTime,%u,StopTime,%u,NoOfRep,%u,FixInt,%u RespTime,%u,HorAcc,%u,VerAcc,%u,PosOutput,%u,ConstRep,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "GNM", 73, "Gnm10_27SendPosStart", (unsigned __int16)v11[6], *((_DWORD *)v11 + 5), *((_DWORD *)v11 + 6), (unsigned __int16)v11[14], *((_DWORD *)v11 + 8), *((_DWORD *)v11 + 9), (unsigned __int16)v11[22], (unsigned __int16)v11[23], *((unsigned __int8 *)v11 + 48), *((unsigned __int8 *)v11 + 50));
          gnssOsa_PrintLog(__str, 4, 1, 0);
          if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__str, 0x3C6uLL);
            v19 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_START_POS_REQ =>GNCS Id,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "GNM", 73, "Gnm10_27SendPosStart", (unsigned __int16)v11[6]);
            gnssOsa_PrintLog(__str, 4, 1, 0);
          }
        }
        AgpsSendFsmMsg(128, 130, 8519680, v11);
      }
      else
      {
        Gnm11_00ApiStatusCB(11, 1, *(unsigned int *)(a1 + 12), v3);
        Gnm02_21DeleteInstn(v5);
      }
    }
    else
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v13 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "GNM", 87, "Gnm10_04PositioningReq", 2052);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      Gnm11_00ApiStatusCB(3, 1, *(unsigned int *)(a1 + 12), v3);
      v14 = *(void **)(a1 + 64);
      if (v14)
        free(v14);
      *(_QWORD *)(a1 + 64) = 0;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v15 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "GNM", 69, "Gnm10_04PositioningReq", 517);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    Gnm11_00ApiStatusCB(11, 0, 0, 0);
  }
  return 0;
}

uint64_t Gnm10_05DiscardPosReq(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char __str[966];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_REG_POS_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_05DiscardPosReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    Gnm11_00ApiStatusCB(4, 1, *(unsigned int *)(a1 + 12), *(_BYTE *)(a1 + 54) & 2);
    v3 = *(void **)(a1 + 64);
    if (v3)
      free(v3);
    *(_QWORD *)(a1 + 64) = 0;
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 69, "Gnm10_05DiscardPosReq", 517);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    Gnm11_00ApiStatusCB(11, 0, 0, 0);
  }
  return 0;
}

uint64_t Gnm10_06StopPosnReq(uint64_t a1)
{
  uint64_t v2;
  uint64_t InstnFromNafId;
  unsigned __int16 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char __str[966];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_STOP_POSN_REQ\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_06StopPosnReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (!a1)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNM", 69, "Gnm10_06StopPosnReq", 517);
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    v6 = 11;
    goto LABEL_14;
  }
  InstnFromNafId = Gnm02_32GetInstnFromNafId(*(_DWORD *)(a1 + 12));
  if (!InstnFromNafId)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNM", 87, "Gnm10_06StopPosnReq", 2052);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v6 = 3;
LABEL_14:
    Gnm11_00ApiStatusCB(v6, 0, 0, 1);
    return 0;
  }
  v4 = (unsigned __int16 *)InstnFromNafId;
  if ((*(_BYTE *)(*(_QWORD *)(InstnFromNafId + 8) + 4) & 7) == 0 || !Gnm02_23StopNafSession(InstnFromNafId))
  {
    Gnm11_00ApiStatusCB(11, 1, *(unsigned int *)(a1 + 12), 1);
    Gnm02_21DeleteInstn(v4);
  }
  return 0;
}

uint64_t Gnm10_08HandleClearGnss(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char __str[966];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_CLEAR_GNSS_CACHE\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_08HandleClearGnss");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 12);
    if ((v3 - 0x400000) <= 0xFFC00000)
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v4 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx DeleteFields,0x%X\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 87, "Gnm10_08HandleClearGnss", 770, v3);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      v5 = 1;
      goto LABEL_15;
    }
    if (!byte_2579E5F09)
    {
      byte_2579E5F09 = 1;
      Gnm31_04SendClearNv(v3);
      return 0;
    }
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v8 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx PrevReqOngoing\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "GNM", 87, "Gnm10_08HandleClearGnss", 1028);
      v7 = 2;
      goto LABEL_13;
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNM", 69, "Gnm10_08HandleClearGnss", 517);
    v7 = 1;
LABEL_13:
    gnssOsa_PrintLog(__str, v7, 1, 0);
  }
  v5 = 11;
LABEL_15:
  Gnm11_00ApiStatusCB(v5, 0, 0, 16);
  return 0;
}

uint64_t Gnm10_09DisableGnss(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char __str[966];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_DISABLE_GNSS\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_09DisableGnss");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    Gnm02_24AbortAllNafSessions(7);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 69, "Gnm10_09DisableGnss", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Gnm10_10RegisterGnmCBs(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char __str[966];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_REG_CALLBACKS\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_10RegisterGnmCBs");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    if (*(_QWORD *)(a1 + 16))
      g_GnmCBs = *(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
      qword_2579E5EF8 = *(_QWORD *)(a1 + 24);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 69, "Gnm10_10RegisterGnmCBs", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

uint64_t Gnm10_13StopFwActivityRsp(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char __str[966];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCP_STOP_FW_ACTIVE_RSP\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_13StopFwActivityRsp");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v3 = g_LbsOsaTrace_Config;
  if (!a1)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
    bzero(__str, 0x3C6uLL);
    v8 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "GNM", 69, "Gnm10_13StopFwActivityRsp", 517);
    v7 = 1;
LABEL_14:
    gnssOsa_PrintLog(__str, v7, 1, 0);
    return 0;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Activity,%hhu,Resp,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 73, "Gnm10_13StopFwActivityRsp", *(unsigned __int8 *)(a1 + 12), *(unsigned __int8 *)(a1 + 13));
    gnssOsa_PrintLog(__str, 4, 1, 0);
    v3 = g_LbsOsaTrace_Config;
  }
  if (*(_BYTE *)(a1 + 12) != 1 && v3 >= 2)
  {
    bzero(__str, 0x3C6uLL);
    v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx ActivityType,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNM", 87, "Gnm10_13StopFwActivityRsp", 770, *(unsigned __int8 *)(a1 + 12));
    v7 = 2;
    goto LABEL_14;
  }
  return 0;
}

uint64_t Gnm10_15NmeaUpdateReq(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char __str[966];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNM_REG_NMEA_UPDATES\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_15NmeaUpdateReq");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 16);
    if (v3)
    {
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v4 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Registering\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 73, "Gnm10_15NmeaUpdateReq");
        gnssOsa_PrintLog(__str, 4, 1, 0);
        v3 = *(_QWORD *)(a1 + 16);
      }
      qword_2579E5EE8 = v3;
      word_2579BA2B8 = *(_WORD *)(a1 + 24);
    }
    else
    {
      if (g_LbsOsaTrace_Config >= 4)
      {
        bzero(__str, 0x3C6uLL);
        v6 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Deregistering\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNM", 73, "Gnm10_15NmeaUpdateReq");
        gnssOsa_PrintLog(__str, 4, 1, 0);
      }
      qword_2579E5EE8 = 0;
      word_2579BA2B8 = 0;
    }
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v5 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNM", 69, "Gnm10_15NmeaUpdateReq", 517);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  return 0;
}

BOOL Gnm10_28StopPositioning(unsigned __int16 *a1)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  uint64_t v4;
  char __str[966];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned __int16 *)gnssOsa_Calloc("Gnm10_28StopPositioning", 517, 1, 0x10uLL);
  v3 = v2;
  if (v2)
  {
    v2[6] = *a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCS_STOP_POS_REQ =>GNCS Id,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 73, "Gnm10_28StopPositioning", v3[6]);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    AgpsSendFsmMsg(128, 130, 8519936, v3);
  }
  return v3 != 0;
}

uint64_t Gnm10_29SendFwActivity(char a1, int a2)
{
  uint64_t result;
  _BYTE *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  char __str[966];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    result = (uint64_t)gnssOsa_Calloc("Gnm10_29SendFwActivity", 543, 1, 0x10uLL);
    if (!result)
      return result;
    v4 = (_BYTE *)result;
    *(_BYTE *)(result + 12) = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCP_START_FW_ACTIVE_IND =>GNCP Activity,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNM", 73, "Gnm10_29SendFwActivity", v4[12]);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v6 = 8390403;
  }
  else
  {
    result = (uint64_t)gnssOsa_Calloc("Gnm10_29SendFwActivity", 560, 1, 0x10uLL);
    if (!result)
      return result;
    v4 = (_BYTE *)result;
    *(_BYTE *)(result + 12) = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCP_STOP_FW_ACTIVE_REQ =>GNC Activity,%hhu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "GNM", 73, "Gnm10_29SendFwActivity", v4[12]);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v6 = 8390656;
  }
  AgpsSendFsmMsg(128, 132, v6, v4);
  return 1;
}

BOOL Gnm10_31SendMEWakeRsp(int a1)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v4;
  char __str[966];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = gnssOsa_Calloc("Gnm10_31SendMEWakeRsp", 586, 1, 0x10uLL);
  v3 = v2;
  if (v2)
  {
    v2[12] = a1;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: FSM:GNCP_ME_WAKE_RSP =>GNCP Status,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 73, "Gnm10_31SendMEWakeRsp", a1);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    AgpsSendFsmMsg(128, 132, 8390916, v3);
  }
  return v3 != 0;
}

uint64_t Gnm10_zxGnssInitRsp(unsigned __int8 *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char __str[966];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = a1[8];
  if (g_LbsOsaTrace_Config > 3)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Status,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNM", 73, "Gnm10_zxGnssInitRsp", v1);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  if (v1 == 32)
  {
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      v3 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Success response\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNM", 68, "Gnm10_zxGnssInitRsp");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
    Gnm10_31SendMEWakeRsp(1);
    Gnm10_29SendFwActivity(1, 0);
  }
  else if (g_LbsOsaTrace_Config >= 2)
  {
    bzero(__str, 0x3C6uLL);
    v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Status,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "GNM", 87, "Gnm10_zxGnssInitRsp", 770, v1);
    gnssOsa_PrintLog(__str, 2, 1, 0);
  }
  return 0;
}

void XofData::LogSummaryOfDecodedData(XofData *this)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  unsigned __int8 *v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  uint64_t *v13;
  unsigned __int8 *v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  uint64_t *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  double v28;
  void **v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t j;
  unsigned __int8 *v38;
  uint64_t v39;
  unsigned int v40;
  BOOL v41;
  uint64_t *v42;
  unsigned __int8 *v43;
  uint64_t v44;
  unsigned int v45;
  BOOL v46;
  uint64_t *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  double v57;
  void **v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t k;
  unsigned __int8 *v64;
  uint64_t v65;
  unsigned int v66;
  BOOL v67;
  uint64_t *v68;
  unsigned __int8 *v69;
  uint64_t v70;
  unsigned int v71;
  BOOL v72;
  uint64_t *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  double v83;
  void **v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t m;
  unsigned __int8 *v90;
  uint64_t v91;
  unsigned int v92;
  BOOL v93;
  uint64_t *v94;
  unsigned __int8 *v95;
  uint64_t v96;
  unsigned int v97;
  BOOL v98;
  uint64_t *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  double v109;
  void **v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  uint64_t n;
  _QWORD **v116;
  _QWORD *v117;
  _QWORD *v118;
  _QWORD **v119;
  unsigned int v120;
  unsigned __int8 *v121;
  uint64_t v122;
  unsigned int v123;
  BOOL v124;
  uint64_t *v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD *v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  double v135;
  void **v136;
  _QWORD **v137;
  _QWORD *v138[2];
  void *__p[2];
  char v140;
  uint64_t v141;
  uint64_t v142;
  _BYTE v143[48];
  void *v144;
  char v145;
  _BYTE v146[152];
  char __str[8];
  uint64_t v148;
  unsigned __int8 v149;
  uint64_t v150;

  v150 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v2 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Xof File create time [ Week number: %u, TOW: %u ]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 73, "LogSummaryOfDecodedData", *((unsigned __int16 *)this + 1), *((_DWORD *)this + 1));
    gnssOsa_PrintLog(__str, 4, 1, 0);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v3 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Ext. Eph. start time [ Week number: %u, TOW: %u ]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNC", 73, "LogSummaryOfDecodedData", *((unsigned __int16 *)this + 4), *((_DWORD *)this + 3));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
  }
  XofData::LogSummaryOfDecodedConstllationData<std::map<unsigned char,XofGpsQzssEphemeris>,std::map<unsigned char,XofGpsQzssAlmanac>>((uint64_t)this, (uint64_t)this + 688, (uint64_t)this + 544, 0, 1, 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v141);
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  for (i = 1; i != 25; ++i)
  {
    if (*((_BYTE *)this + 209) && *((_QWORD *)this + 72))
    {
      v9 = (unsigned __int8 *)this + 576;
      v10 = *((_QWORD *)this + 72);
      do
      {
        v11 = *(unsigned __int8 *)(v10 + 28);
        v12 = v11 >= i;
        if (v11 >= i)
          v13 = (uint64_t *)v10;
        else
          v13 = (uint64_t *)(v10 + 8);
        if (v12)
          v9 = (unsigned __int8 *)v10;
        v10 = *v13;
      }
      while (*v13);
      if (v9 != (unsigned __int8 *)((char *)this + 576) && v9[28] <= i)
      {
        v5 |= 1 << (i - 1);
        ++v4;
      }
    }
    if (*((_BYTE *)this + 210) && *((_QWORD *)this + 90))
    {
      v14 = (unsigned __int8 *)this + 720;
      v15 = *((_QWORD *)this + 90);
      do
      {
        v16 = *(unsigned __int8 *)(v15 + 28);
        v17 = v16 >= i;
        if (v16 >= i)
          v18 = (uint64_t *)v15;
        else
          v18 = (uint64_t *)(v15 + 8);
        if (v17)
          v14 = (unsigned __int8 *)v15;
        v15 = *v18;
      }
      while (*v18);
      if (v14 != (unsigned __int8 *)((char *)this + 720) && v14[28] <= i)
      {
        v6 |= 1 << (i - 1);
        ++v7;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "GLO");
  if ((v149 & 0x80u) == 0)
    v19 = __str;
  else
    v19 = *(char **)__str;
  if ((v149 & 0x80u) == 0)
    v20 = v149;
  else
    v20 = v148;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)v19, v20);
  if ((char)v149 < 0)
    operator delete(*(void **)__str);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm Bitmask: ", 15);
  v21 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v21 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v21 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v21 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v21 - 24) + 8) |= 0x4000u;
  v22 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v22 + *(_QWORD *)(*v22 - 24) + 8) = *(_DWORD *)((_BYTE *)v22 + *(_QWORD *)(*v22 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Bitmask: ", 15);
  v23 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v23 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v23 - 24) + 8) |= 0x4000u;
  v24 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v24 + *(_QWORD *)(*v24 - 24) + 8) = *(_DWORD *)((_BYTE *)v24 + *(_QWORD *)(*v24 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Sats: ", 11);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Blocks: ", 13);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Bitmask: ", 14);
  v25 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v25 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v25 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v25 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v25 - 24) + 8) |= 0x4000u;
  v26 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v26 + *(_QWORD *)(*v26 - 24) + 8) = *(_DWORD *)((_BYTE *)v26 + *(_QWORD *)(*v26 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v27 = mach_continuous_time();
    v28 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v140 >= 0)
      v29 = __p;
    else
      v29 = (void **)__p[0];
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v28 * (double)v27), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v29);
    if (v140 < 0)
      operator delete(__p[0]);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v30 = *MEMORY[0x24BEDB800];
  v141 = v30;
  v31 = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  *(uint64_t *)((char *)&v141 + *(_QWORD *)(v30 - 24)) = v31;
  v32 = MEMORY[0x24BEDB848];
  v142 = MEMORY[0x24BEDB848] + 16;
  if (v145 < 0)
    operator delete(v144);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD2D78C](v146);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v141);
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  for (j = 1; j != 37; ++j)
  {
    if (*((_BYTE *)this + 161) && *((_QWORD *)this + 75))
    {
      v38 = (unsigned __int8 *)this + 600;
      v39 = *((_QWORD *)this + 75);
      do
      {
        v40 = *(unsigned __int8 *)(v39 + 28);
        v41 = v40 >= j;
        if (v40 >= j)
          v42 = (uint64_t *)v39;
        else
          v42 = (uint64_t *)(v39 + 8);
        if (v41)
          v38 = (unsigned __int8 *)v39;
        v39 = *v42;
      }
      while (*v42);
      if (v38 != (unsigned __int8 *)((char *)this + 600) && v38[28] <= j)
      {
        v34 |= 1 << (j - 1);
        ++v33;
      }
    }
    if (*((_BYTE *)this + 162) && *((_QWORD *)this + 93))
    {
      v43 = (unsigned __int8 *)this + 744;
      v44 = *((_QWORD *)this + 93);
      do
      {
        v45 = *(unsigned __int8 *)(v44 + 28);
        v46 = v45 >= j;
        if (v45 >= j)
          v47 = (uint64_t *)v44;
        else
          v47 = (uint64_t *)(v44 + 8);
        if (v46)
          v43 = (unsigned __int8 *)v44;
        v44 = *v47;
      }
      while (*v47);
      if (v43 != (unsigned __int8 *)((char *)this + 744) && v43[28] <= j)
      {
        v35 |= 1 << (j - 1);
        ++v36;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "GAL");
  if ((v149 & 0x80u) == 0)
    v48 = __str;
  else
    v48 = *(char **)__str;
  if ((v149 & 0x80u) == 0)
    v49 = v149;
  else
    v49 = v148;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)v48, v49);
  if ((char)v149 < 0)
    operator delete(*(void **)__str);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm Bitmask: ", 15);
  v50 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v50 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v50 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v50 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v50 - 24) + 8) |= 0x4000u;
  v51 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v51 + *(_QWORD *)(*v51 - 24) + 8) = *(_DWORD *)((_BYTE *)v51 + *(_QWORD *)(*v51 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Bitmask: ", 15);
  v52 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v52 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v52 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v52 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v52 - 24) + 8) |= 0x4000u;
  v53 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v53 + *(_QWORD *)(*v53 - 24) + 8) = *(_DWORD *)((_BYTE *)v53 + *(_QWORD *)(*v53 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Sats: ", 11);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Blocks: ", 13);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Bitmask: ", 14);
  v54 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v54 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v54 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v54 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v54 - 24) + 8) |= 0x4000u;
  v55 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v55 + *(_QWORD *)(*v55 - 24) + 8) = *(_DWORD *)((_BYTE *)v55 + *(_QWORD *)(*v55 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v56 = mach_continuous_time();
    v57 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v140 >= 0)
      v58 = __p;
    else
      v58 = (void **)__p[0];
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v57 * (double)v56), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v58);
    if (v140 < 0)
      operator delete(__p[0]);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v141 = v30;
  *(uint64_t *)((char *)&v141 + *(_QWORD *)(v30 - 24)) = v31;
  v142 = v32 + 16;
  if (v145 < 0)
    operator delete(v144);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD2D78C](v146);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v141);
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v62 = 0;
  for (k = 1; k != 64; ++k)
  {
    if (*((_BYTE *)this + 257) && *((_QWORD *)this + 81))
    {
      v64 = (unsigned __int8 *)this + 648;
      v65 = *((_QWORD *)this + 81);
      do
      {
        v66 = *(unsigned __int8 *)(v65 + 28);
        v67 = v66 >= k;
        if (v66 >= k)
          v68 = (uint64_t *)v65;
        else
          v68 = (uint64_t *)(v65 + 8);
        if (v67)
          v64 = (unsigned __int8 *)v65;
        v65 = *v68;
      }
      while (*v68);
      if (v64 != (unsigned __int8 *)((char *)this + 648) && v64[28] <= k)
      {
        v60 |= 1 << (k - 1);
        ++v59;
      }
    }
    if (*((_BYTE *)this + 258) && *((_QWORD *)this + 99))
    {
      v69 = (unsigned __int8 *)this + 792;
      v70 = *((_QWORD *)this + 99);
      do
      {
        v71 = *(unsigned __int8 *)(v70 + 32);
        v72 = v71 >= k;
        if (v71 >= k)
          v73 = (uint64_t *)v70;
        else
          v73 = (uint64_t *)(v70 + 8);
        if (v72)
          v69 = (unsigned __int8 *)v70;
        v70 = *v73;
      }
      while (*v73);
      if (v69 != (unsigned __int8 *)((char *)this + 792) && v69[32] <= k)
      {
        v61 |= 1 << (k - 1);
        ++v62;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "BDS");
  if ((v149 & 0x80u) == 0)
    v74 = __str;
  else
    v74 = *(char **)__str;
  if ((v149 & 0x80u) == 0)
    v75 = v149;
  else
    v75 = v148;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)v74, v75);
  if ((char)v149 < 0)
    operator delete(*(void **)__str);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm Bitmask: ", 15);
  v76 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v76 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v76 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v76 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v76 - 24) + 8) |= 0x4000u;
  v77 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v77 + *(_QWORD *)(*v77 - 24) + 8) = *(_DWORD *)((_BYTE *)v77 + *(_QWORD *)(*v77 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Bitmask: ", 15);
  v78 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v78 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v78 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v78 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v78 - 24) + 8) |= 0x4000u;
  v79 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v79 + *(_QWORD *)(*v79 - 24) + 8) = *(_DWORD *)((_BYTE *)v79 + *(_QWORD *)(*v79 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Sats: ", 11);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Blocks: ", 13);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Bitmask: ", 14);
  v80 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v80 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v80 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v80 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v80 - 24) + 8) |= 0x4000u;
  v81 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v81 + *(_QWORD *)(*v81 - 24) + 8) = *(_DWORD *)((_BYTE *)v81 + *(_QWORD *)(*v81 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v82 = mach_continuous_time();
    v83 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v140 >= 0)
      v84 = __p;
    else
      v84 = (void **)__p[0];
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v83 * (double)v82), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v84);
    if (v140 < 0)
      operator delete(__p[0]);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v141 = v30;
  *(uint64_t *)((char *)&v141 + *(_QWORD *)(v30 - 24)) = v31;
  v142 = v32 + 16;
  if (v145 < 0)
    operator delete(v144);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD2D78C](v146);
  XofData::LogSummaryOfDecodedConstllationData<std::map<unsigned char,XofGpsQzssEphemeris>,std::map<unsigned char,XofGpsQzssAlmanac>>((uint64_t)this, (uint64_t)this + 760, (uint64_t)this + 616, 2u, 193, 10);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v141);
  v85 = 0;
  v86 = 0;
  v87 = 0;
  v88 = 0;
  for (m = 1; m != 15; ++m)
  {
    if (*((_BYTE *)this + 305) && *((_QWORD *)this + 84))
    {
      v90 = (unsigned __int8 *)this + 672;
      v91 = *((_QWORD *)this + 84);
      do
      {
        v92 = *(unsigned __int8 *)(v91 + 28);
        v93 = v92 >= m;
        if (v92 >= m)
          v94 = (uint64_t *)v91;
        else
          v94 = (uint64_t *)(v91 + 8);
        if (v93)
          v90 = (unsigned __int8 *)v91;
        v91 = *v94;
      }
      while (*v94);
      if (v90 != (unsigned __int8 *)((char *)this + 672) && v90[28] <= m)
      {
        v86 |= 1 << (m - 1);
        ++v85;
      }
    }
    if (*((_BYTE *)this + 306) && *((_QWORD *)this + 105))
    {
      v95 = (unsigned __int8 *)this + 840;
      v96 = *((_QWORD *)this + 105);
      do
      {
        v97 = *(unsigned __int8 *)(v96 + 28);
        v98 = v97 >= m;
        if (v97 >= m)
          v99 = (uint64_t *)v96;
        else
          v99 = (uint64_t *)(v96 + 8);
        if (v98)
          v95 = (unsigned __int8 *)v96;
        v96 = *v99;
      }
      while (*v99);
      if (v95 != (unsigned __int8 *)((char *)this + 840) && v95[28] <= m)
      {
        v87 |= 1 << (m - 1);
        ++v88;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "NVC");
  if ((v149 & 0x80u) == 0)
    v100 = __str;
  else
    v100 = *(char **)__str;
  if ((v149 & 0x80u) == 0)
    v101 = v149;
  else
    v101 = v148;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)v100, v101);
  if ((char)v149 < 0)
    operator delete(*(void **)__str);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm Bitmask: ", 15);
  v102 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v102 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v102 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v102 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v102 - 24) + 8) |= 0x4000u;
  v103 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v103 + *(_QWORD *)(*v103 - 24) + 8) = *(_DWORD *)((_BYTE *)v103 + *(_QWORD *)(*v103 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Bitmask: ", 15);
  v104 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v104 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v104 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v104 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v104 - 24) + 8) |= 0x4000u;
  v105 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v105 + *(_QWORD *)(*v105 - 24) + 8) = *(_DWORD *)((_BYTE *)v105 + *(_QWORD *)(*v105 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Sats: ", 11);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Blocks: ", 13);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Bitmask: ", 14);
  v106 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v106 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v106 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v106 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v106 - 24) + 8) |= 0x4000u;
  v107 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v107 + *(_QWORD *)(*v107 - 24) + 8) = *(_DWORD *)((_BYTE *)v107 + *(_QWORD *)(*v107 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v108 = mach_continuous_time();
    v109 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v140 >= 0)
      v110 = __p;
    else
      v110 = (void **)__p[0];
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v109 * (double)v108), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v110);
    if (v140 < 0)
      operator delete(__p[0]);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v141 = v30;
  *(uint64_t *)((char *)&v141 + *(_QWORD *)(v30 - 24)) = v31;
  v142 = v32 + 16;
  if (v145 < 0)
    operator delete(v144);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD2D78C](v146);
  v138[0] = 0;
  v138[1] = 0;
  v137 = v138;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v141);
  v111 = 0;
  v112 = 0;
  v113 = 0;
  v114 = 0;
  for (n = 120; n != 159; ++n)
  {
    if (*((_BYTE *)this + 65) && v138[0])
    {
      v116 = v138;
      v117 = v138[0];
      do
      {
        v118 = v117;
        v119 = v116;
        v120 = *((unsigned __int8 *)v117 + 28);
        if (v120 >= n)
          v116 = (_QWORD **)v117;
        else
          ++v117;
        v117 = (_QWORD *)*v117;
      }
      while (v117);
      if (v116 != v138)
      {
        if (v120 < n)
          v118 = v119;
        if (*((unsigned __int8 *)v118 + 28) <= n)
        {
          v112 |= 1 << (n - 120);
          ++v111;
        }
      }
    }
    if (*((_BYTE *)this + 66) && *((_QWORD *)this + 102))
    {
      v121 = (unsigned __int8 *)this + 816;
      v122 = *((_QWORD *)this + 102);
      do
      {
        v123 = *(unsigned __int8 *)(v122 + 28);
        v124 = v123 >= n;
        if (v123 >= n)
          v125 = (uint64_t *)v122;
        else
          v125 = (uint64_t *)(v122 + 8);
        if (v124)
          v121 = (unsigned __int8 *)v122;
        v122 = *v125;
      }
      while (*v125);
      if (v121 != (unsigned __int8 *)((char *)this + 816) && v121[28] <= n)
      {
        v113 |= 1 << (n - 120);
        ++v114;
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "SBA");
  if ((v149 & 0x80u) == 0)
    v126 = __str;
  else
    v126 = *(char **)__str;
  if ((v149 & 0x80u) == 0)
    v127 = v149;
  else
    v127 = v148;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)v126, v127);
  if ((char)v149 < 0)
    operator delete(*(void **)__str);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", Alm Bitmask: ", 15);
  v128 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v128 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v128 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v128 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v128 - 24) + 8) |= 0x4000u;
  v129 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v129 + *(_QWORD *)(*v129 - 24) + 8) = *(_DWORD *)((_BYTE *)v129 + *(_QWORD *)(*v129 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Sats: ", 12);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", BCE Bitmask: ", 15);
  v130 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v130 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v130 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v130 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v130 - 24) + 8) |= 0x4000u;
  v131 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v131 + *(_QWORD *)(*v131 - 24) + 8) = *(_DWORD *)((_BYTE *)v131 + *(_QWORD *)(*v131 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Sats: ", 11);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Blocks: ", 13);
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v141, (uint64_t)", EE Bitmask: ", 14);
  v132 = v141;
  *(_QWORD *)&v143[*(_QWORD *)(v141 - 24)] = 15;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v132 - 24) + 8) = *(_DWORD *)((_BYTE *)&v141 + *(_QWORD *)(v132 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v132 - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)&v141 + *(_QWORD *)(v132 - 24) + 8) |= 0x4000u;
  v133 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v133 + *(_QWORD *)(*v133 - 24) + 8) = *(_DWORD *)((_BYTE *)v133 + *(_QWORD *)(*v133 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v134 = mach_continuous_time();
    v135 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v140 >= 0)
      v136 = __p;
    else
      v136 = (void **)__p[0];
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v135 * (double)v134), "GNC", 73, "LogSummaryOfDecodedConstllationData", (const char *)v136);
    if (v140 < 0)
      operator delete(__p[0]);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v141 = v30;
  *(uint64_t *)((char *)&v141 + *(_QWORD *)(v30 - 24)) = v31;
  v142 = v32 + 16;
  if (v145 < 0)
    operator delete(v144);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x24BD2D78C](v146);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&v137, v138[0]);
}

void sub_24BBC2C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, _QWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *__p,uint64_t a55,int a56,__int16 a57,char a58,char a59)
{
  std::ostringstream::~ostringstream((uint64_t)&a21);
  std::__tree<std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,XofGpsQzssEphemeris>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,XofGpsQzssEphemeris>>>::destroy((uint64_t)&a15, a16);
  _Unwind_Resume(a1);
}

uint64_t XofData::LogSummaryOfDecodedConstllationData<std::map<unsigned char,XofGpsQzssEphemeris>,std::map<unsigned char,XofGpsQzssAlmanac>>(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  BOOL v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  BOOL v34;
  uint64_t *v35;
  char *v36;
  void **v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  void *v49;
  char v50;
  _QWORD v51[11];
  char v52;
  uint64_t v53;
  void *__p[2];
  unsigned __int8 v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v51);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = a1 + 16 + 48 * a4;
  v19 = *(_QWORD *)(a3 + 8);
  v18 = a3 + 8;
  v17 = v19;
  v20 = *(unsigned __int8 *)(v16 + 1);
  v21 = *(unsigned __int8 *)(v16 + 2);
  v24 = *(_QWORD *)(a2 + 8);
  v23 = a2 + 8;
  v22 = v24;
  v25 = a5;
  do
  {
    if (v20 && v17)
    {
      v26 = v18;
      v27 = v17;
      do
      {
        v28 = *(unsigned __int8 *)(v27 + 28);
        v29 = v28 >= v25;
        if (v28 >= v25)
          v30 = (uint64_t *)v27;
        else
          v30 = (uint64_t *)(v27 + 8);
        if (v29)
          v26 = v27;
        v27 = *v30;
      }
      while (*v30);
      if (v26 != v18 && *(unsigned __int8 *)(v26 + 28) <= v25)
      {
        v13 |= 1 << (v25 - a5);
        ++v12;
      }
    }
    if (v21 && v22)
    {
      v31 = v23;
      v32 = v22;
      do
      {
        v33 = *(unsigned __int8 *)(v32 + 28);
        v34 = v33 >= v25;
        if (v33 >= v25)
          v35 = (uint64_t *)v32;
        else
          v35 = (uint64_t *)(v32 + 8);
        if (v34)
          v31 = v32;
        v32 = *v35;
      }
      while (*v35);
      if (v31 != v23 && *(unsigned __int8 *)(v31 + 28) <= v25)
      {
        v14 |= 1 << (v25 - a5);
        ++v15;
      }
    }
    ++v25;
  }
  while (v25 < a6 + a5);
  if (a4 > 2)
    v36 = "   ";
  else
    v36 = off_251CDCE80[a4];
  std::string::basic_string[abi:ne180100]<0>(__p, v36);
  if ((v55 & 0x80u) == 0)
    v37 = __p;
  else
    v37 = (void **)__p[0];
  if ((v55 & 0x80u) == 0)
    v38 = v55;
  else
    v38 = (uint64_t)__p[1];
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)v37, v38);
  if ((char)v55 < 0)
    operator delete(__p[0]);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", Alm sats: ", 12);
  *(_QWORD *)((char *)&v51[3] + *(_QWORD *)(v51[0] - 24)) = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", Alm Bitmask: ", 15);
  v39 = v51[0];
  *(_QWORD *)((char *)&v51[3] + *(_QWORD *)(v51[0] - 24)) = 15;
  *(_DWORD *)((char *)&v51[1] + *(_QWORD *)(v39 - 24)) = *(_DWORD *)((_BYTE *)&v51[1] + *(_QWORD *)(v39 - 24)) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v51[1] + *(_QWORD *)(v39 - 24)) |= 0x200u;
  *(_DWORD *)((char *)&v51[1] + *(_QWORD *)(v39 - 24)) |= 0x4000u;
  v40 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v40 + *(_QWORD *)(*v40 - 24) + 8) = *(_DWORD *)((_BYTE *)v40 + *(_QWORD *)(*v40 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", BCE Sats: ", 12);
  *(_QWORD *)((char *)&v51[3] + *(_QWORD *)(v51[0] - 24)) = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", BCE Bitmask: ", 15);
  v41 = v51[0];
  *(_QWORD *)((char *)&v51[3] + *(_QWORD *)(v51[0] - 24)) = 15;
  *(_DWORD *)((char *)&v51[1] + *(_QWORD *)(v41 - 24)) = *(_DWORD *)((_BYTE *)&v51[1] + *(_QWORD *)(v41 - 24)) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v51[1] + *(_QWORD *)(v41 - 24)) |= 0x200u;
  *(_DWORD *)((char *)&v51[1] + *(_QWORD *)(v41 - 24)) |= 0x4000u;
  v42 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v42 + *(_QWORD *)(*v42 - 24) + 8) = *(_DWORD *)((_BYTE *)v42 + *(_QWORD *)(*v42 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", EE Sats: ", 11);
  *(_QWORD *)((char *)&v51[3] + *(_QWORD *)(v51[0] - 24)) = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", EE Blocks: ", 13);
  *(_QWORD *)((char *)&v51[3] + *(_QWORD *)(v51[0] - 24)) = 2;
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)", EE Bitmask: ", 14);
  v43 = v51[0];
  *(_QWORD *)((char *)&v51[3] + *(_QWORD *)(v51[0] - 24)) = 15;
  *(_DWORD *)((char *)&v51[1] + *(_QWORD *)(v43 - 24)) = *(_DWORD *)((_BYTE *)&v51[1] + *(_QWORD *)(v43 - 24)) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)&v51[1] + *(_QWORD *)(v43 - 24)) |= 0x200u;
  *(_DWORD *)((char *)&v51[1] + *(_QWORD *)(v43 - 24)) |= 0x4000u;
  v44 = (_QWORD *)std::ostream::operator<<();
  *(_DWORD *)((char *)v44 + *(_QWORD *)(*v44 - 24) + 8) = *(_DWORD *)((_BYTE *)v44 + *(_QWORD *)(*v44 - 24) + 8) & 0xFFFFFFB5 | 2;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__p, 0x3C6uLL);
    v45 = mach_continuous_time();
    v46 = *(double *)&g_MacClockTicksToMsRelation;
    std::stringbuf::str();
    if (v50 >= 0)
      v47 = (const char *)&v49;
    else
      v47 = (const char *)v49;
    snprintf((char *)__p, 0x3C5uLL, "%10u %s%c %s: %s\n", (unint64_t)(v46 * (double)v45), "GNC", 73, "LogSummaryOfDecodedConstllationData", v47);
    if (v50 < 0)
      operator delete(v49);
    gnssOsa_PrintLog((char *)__p, 4, 1, 0);
  }
  v51[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v51 + *(_QWORD *)(v51[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v51[1] = MEMORY[0x24BEDB848] + 16;
  if (v52 < 0)
    operator delete((void *)v51[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x24BD2D78C](&v53);
}

void sub_24BBC32F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  std::ostringstream::~ostringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

uint64_t XofData::Decode(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int CRC32;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  std::string::size_type v23;
  uint64_t v24;
  int v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  _DWORD *v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL4 v41;
  uint64_t v42;
  char *v43;
  double v44;
  const char *v45;
  __int16 v46;
  int v47;
  int v48;
  char v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _DWORD *v69;
  _BYTE v70[32];
  std::string v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  int v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  int v85;
  __int128 v86;
  uint64_t v87;
  _BYTE __p[32];
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  std::string::size_type v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  std::string v96;
  uint64_t v97;
  std::string v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  uint64_t v105;
  std::string v106;
  uint64_t v107;
  int v108;
  __int128 v109;
  uint64_t v110;
  int v111;
  __int128 v112;
  uint64_t v113;
  int v114;
  __int128 v115;
  uint64_t v116;
  int v117;
  __int128 v118;
  uint64_t v119;
  int data;
  __int128 v121;
  uint64_t v122;
  int v123;
  __int128 v124;
  uint64_t v125;
  int v126;
  __int128 v127;
  uint64_t v128;
  int v129;
  __int128 v130;
  uint64_t v131;
  unsigned int v132[3];
  int v133;
  void *v134;
  char v135;
  std::string v136;
  std::string v137;
  std::string v138;
  uint64_t v139;
  std::string v140;
  uint64_t v141;
  __int128 v142;
  uint64_t v143;
  std::string v144;
  uint64_t v145;
  __int128 v146;
  uint64_t v147;
  std::string v148;
  _BYTE v149[32];
  uint64_t v150;
  std::string v151;
  std::string v152;
  std::string v153;
  uint64_t v154;
  std::string v155;
  std::string v156;
  uint64_t v157;
  char __str[968];
  uint64_t v159;

  v159 = *MEMORY[0x24BDAC8D0];
  v108 = 372;
  std::string::basic_string[abi:ne180100]<0>(__p, "xofHeaderCRC");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v132, (const std::string *)__p, 0, -1, 0);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (XofIntegralType<unsigned int>::DecodeFromHexData(v132, (_QWORD *)a2, &v108) == 1)
  {
    v6 = 0;
    v7 = -1;
    do
    {
      v8 = __rbit32(*(unsigned __int8 *)(*(_QWORD *)a2 + v6));
      v9 = 8;
      do
      {
        v10 = v7 ^ v8;
        v11 = 2 * v7;
        v7 = (2 * v7) ^ 0x4C11DB7;
        if (v10 >= 0)
          v7 = v11;
        v8 *= 2;
        --v9;
      }
      while (v9);
      ++v6;
    }
    while (v6 != 372);
    if (v133 == __rbit32(~v7))
    {
      v12 = 1;
      v13 = 1;
    }
    else
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v15 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid header CRC in the XOF file!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "GNC", 87, "VerifyHeaderCRC");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      v12 = 0;
      v13 = 2;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v14 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode XOF header CRC!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "GNC", 87, "VerifyHeaderCRC");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v12 = 0;
    v13 = 5;
  }
  if (v135 < 0)
  {
    operator delete(v134);
    if (!v12)
      return v13;
  }
  else if (!v12)
  {
    return v13;
  }
  v108 = 364;
  std::string::basic_string[abi:ne180100]<0>(__p, "xofPayloadCRC");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v132, (const std::string *)__p, 0, -1, 0);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (XofIntegralType<unsigned int>::DecodeFromHexData(v132, (_QWORD *)a2, &v108) == 1)
  {
    CRC32 = CRCGenerator::GetCRC32((_QWORD *)a2, 0x178u, *(_DWORD *)(a2 + 8) - *(_DWORD *)a2 - 376);
    if (v133 == CRC32)
    {
      v17 = 1;
      v13 = 1;
    }
    else
    {
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v19 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF file has invalid Payload CRC!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "GNC", 87, "VerifyPayloadCRC");
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      v17 = 0;
      v13 = 3;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v18 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode XOF payload CRC!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "GNC", 87, "VerifyPayloadCRC");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v17 = 0;
    v13 = 5;
  }
  if (v135 < 0)
  {
    operator delete(v134);
    if (!v17)
      return v13;
  }
  else if (!v17)
  {
    return v13;
  }
  XofHeaderCodec::XofHeaderCodec((XofHeaderCodec *)v132);
  if (XofHeaderCodec::Decode((uint64_t)v132, (_QWORD *)a2, a3))
  {
    XofHeader::XofHeader((uint64_t)__str, (uint64_t)v132);
    memcpy((void *)a1, __str, 0x16CuLL);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v20 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF Header decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "GNC", 73, "Decode", *a3);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    if (*(_QWORD *)(a2 + 8) - (*(_QWORD *)a2 + *a3) == *(_DWORD *)(a1 + 352))
    {
      std::string::basic_string[abi:ne180100]<0>(&v138, "sa0");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)__str, &v138, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v155, "sa1");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)__p, &v155, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v152, "sa2");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)v70, &v152, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v151, "sa3");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)v149, &v151, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v148, "sb0");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)&v156, &v148, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v144, "sb1");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)&v153, &v144, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v140, "sb2");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)&v145, &v140, -128, 127, 0);
      std::string::basic_string[abi:ne180100]<0>(&v137, "sb3");
      XofIntegralType<signed char>::XofIntegralType((uint64_t)&v141, &v137, -128, 127, 0);
      v108 = *(_DWORD *)__str;
      v109 = *(_OWORD *)&__str[8];
      v110 = *(_QWORD *)&__str[24];
      memset(&__str[8], 0, 24);
      v111 = *(_DWORD *)__p;
      v112 = *(_OWORD *)&__p[8];
      v113 = *(_QWORD *)&__p[24];
      memset(&__p[8], 0, 24);
      v114 = *(_DWORD *)v70;
      v116 = *(_QWORD *)&v70[24];
      v115 = *(_OWORD *)&v70[8];
      memset(&v70[8], 0, 24);
      v117 = *(_DWORD *)v149;
      v119 = *(_QWORD *)&v149[24];
      v118 = *(_OWORD *)&v149[8];
      memset(&v149[8], 0, 24);
      data = (int)v156.__r_.__value_.__l.__data_;
      v122 = v157;
      v121 = *(_OWORD *)&v156.__r_.__value_.__r.__words[1];
      *(_OWORD *)&v156.__r_.__value_.__r.__words[1] = 0uLL;
      v157 = 0;
      v123 = (int)v153.__r_.__value_.__l.__data_;
      v125 = v154;
      v124 = *(_OWORD *)&v153.__r_.__value_.__r.__words[1];
      *(_OWORD *)&v153.__r_.__value_.__r.__words[1] = 0uLL;
      v154 = 0;
      v126 = v145;
      v128 = v147;
      v127 = v146;
      v146 = 0uLL;
      v147 = 0;
      v129 = v141;
      v131 = v143;
      v130 = v142;
      v142 = 0uLL;
      v143 = 0;
      if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v137.__r_.__value_.__l.__data_);
        if (SHIBYTE(v147) < 0)
          operator delete((void *)v146);
      }
      if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v140.__r_.__value_.__l.__data_);
      if (SHIBYTE(v154) < 0)
        operator delete((void *)v153.__r_.__value_.__l.__size_);
      if (SHIBYTE(v144.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v144.__r_.__value_.__l.__data_);
      if (SHIBYTE(v157) < 0)
        operator delete((void *)v156.__r_.__value_.__l.__size_);
      if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v148.__r_.__value_.__l.__data_);
      if ((v149[31] & 0x80000000) != 0)
        operator delete(*(void **)&v149[8]);
      if (SHIBYTE(v151.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v151.__r_.__value_.__l.__data_);
      if ((v70[31] & 0x80000000) != 0)
        operator delete(*(void **)&v70[8]);
      if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v152.__r_.__value_.__l.__data_);
      if ((__p[31] & 0x80000000) != 0)
        operator delete(*(void **)&__p[8]);
      if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v155.__r_.__value_.__l.__data_);
      if (__str[31] < 0)
        operator delete(*(void **)&__str[8]);
      if (SHIBYTE(v138.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v138.__r_.__value_.__l.__data_);
      if (XofIonosphericModelCodec::Decode((char *)&v108, (_QWORD *)a2, a3))
      {
        *(_QWORD *)(a1 + 368) = HIBYTE(v108) | ((unint64_t)HIBYTE(v111) << 8) | ((unint64_t)HIBYTE(v114) << 16) | ((unint64_t)HIBYTE(v117) << 24) | ((unint64_t)HIBYTE(data) << 32) | ((unint64_t)HIBYTE(v123) << 40) | ((unint64_t)HIBYTE(v126) << 48) | ((unint64_t)HIBYTE(v129) << 56);
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(__str, 0x3C6uLL);
          v21 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IonoSpheric Model decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "GNC", 73, "Decode", *a3);
          gnssOsa_PrintLog(__str, 4, 1, 0);
        }
        std::string::basic_string[abi:ne180100]<0>(&v155, "a1");
        XofIntegralType<int>::XofIntegralType((uint64_t)__str, &v155, -8388608, 0x7FFFFF, 0);
        std::string::basic_string[abi:ne180100]<0>(&v152, "a0");
        XofIntegralType<int>::XofIntegralType((uint64_t)v70, &v152, 0x80000000, 0x7FFFFFFF, 0);
        std::string::basic_string[abi:ne180100]<0>(&v151, "tot");
        XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v149, &v151, 0, 255, 0);
        std::string::basic_string[abi:ne180100]<0>(&v148, "wNt");
        XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v156, &v148, 0, 255, 0);
        std::string::basic_string[abi:ne180100]<0>(&v144, "deltaTls");
        XofIntegralType<short>::XofIntegralType((uint64_t)&v153, &v144, -128, 127, 0);
        std::string::basic_string[abi:ne180100]<0>(&v140, "wnLsf");
        XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v145, &v140, 0, 255, 0);
        std::string::basic_string[abi:ne180100]<0>(&v137, "dn");
        XofIntegralType<short>::XofIntegralType((uint64_t)&v141, &v137, 1, 7, 0);
        std::string::basic_string[abi:ne180100]<0>(&v136, "deltaTLsf");
        XofIntegralType<short>::XofIntegralType((uint64_t)&v138, &v136, -128, 127, 0);
        *(_OWORD *)__p = *(_OWORD *)__str;
        *(_OWORD *)&__p[16] = *(_OWORD *)&__str[16];
        v90 = *(_OWORD *)v70;
        v22 = *(_QWORD *)&__str[32];
        memset(&__str[16], 0, 24);
        v91 = *(_OWORD *)&v70[16];
        v23 = v71.__r_.__value_.__r.__words[0];
        v89 = v22;
        *(_QWORD *)&v70[24] = 0;
        v71.__r_.__value_.__r.__words[0] = 0;
        *(_QWORD *)&v70[16] = 0;
        v24 = *(_QWORD *)&v149[24];
        v92 = v23;
        v93 = *(_QWORD *)v149;
        v94 = *(_OWORD *)&v149[8];
        memset(&v149[8], 0, 24);
        v95 = v24;
        v96 = v156;
        v97 = v157;
        *(_OWORD *)&v156.__r_.__value_.__r.__words[1] = 0uLL;
        v157 = 0;
        v98 = v153;
        v99 = v154;
        *(_OWORD *)&v153.__r_.__value_.__r.__words[1] = 0uLL;
        v154 = 0;
        v100 = v145;
        v102 = v147;
        v101 = v146;
        v146 = 0uLL;
        v147 = 0;
        v103 = v141;
        v105 = v143;
        v104 = v142;
        v142 = 0uLL;
        v143 = 0;
        v106 = v138;
        v107 = v139;
        *(_OWORD *)&v138.__r_.__value_.__r.__words[1] = 0uLL;
        v139 = 0;
        if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v136.__r_.__value_.__l.__data_);
          if (SHIBYTE(v143) < 0)
            operator delete((void *)v142);
        }
        if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v137.__r_.__value_.__l.__data_);
        if (SHIBYTE(v147) < 0)
          operator delete((void *)v146);
        if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v140.__r_.__value_.__l.__data_);
        if (SHIBYTE(v154) < 0)
          operator delete((void *)v153.__r_.__value_.__l.__size_);
        if (SHIBYTE(v144.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v144.__r_.__value_.__l.__data_);
        if (SHIBYTE(v157) < 0)
          operator delete((void *)v156.__r_.__value_.__l.__size_);
        if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v148.__r_.__value_.__l.__data_);
        if ((v149[31] & 0x80000000) != 0)
          operator delete(*(void **)&v149[8]);
        if (SHIBYTE(v151.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v151.__r_.__value_.__l.__data_);
        if (v71.__r_.__value_.__s.__data_[7] < 0)
          operator delete(*(void **)&v70[16]);
        if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v152.__r_.__value_.__l.__data_);
        if (__str[39] < 0)
          operator delete(*(void **)&__str[16]);
        if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v155.__r_.__value_.__l.__data_);
        if (XofUtcModelCodec::Decode((int *)__p, (_QWORD *)a2, a3))
        {
          v25 = HIDWORD(v90);
          v26 = HIWORD(v93);
          v27 = HIWORD(v96.__r_.__value_.__r.__words[0]);
          v28 = HIWORD(v98.__r_.__value_.__r.__words[0]);
          v29 = HIWORD(v100);
          v30 = HIWORD(v103);
          v31 = HIWORD(v106.__r_.__value_.__r.__words[0]);
          *(_DWORD *)(a1 + 376) = *(_DWORD *)&__p[12];
          *(_DWORD *)(a1 + 380) = v25;
          *(_WORD *)(a1 + 384) = v26;
          *(_WORD *)(a1 + 386) = v27;
          *(_WORD *)(a1 + 388) = v28;
          *(_WORD *)(a1 + 390) = v29;
          *(_WORD *)(a1 + 392) = v30;
          *(_WORD *)(a1 + 394) = v31;
          if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__str, 0x3C6uLL);
            v32 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: UTC Model decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v32), "GNC", 73, "Decode", *a3);
            gnssOsa_PrintLog(__str, 4, 1, 0);
          }
          v68 = a1;
          if (*(_BYTE *)(a1 + 210) || *(_BYTE *)(a1 + 209) || *(_BYTE *)(a1 + 211))
          {
            v33 = 0;
            while (1)
            {
              std::string::basic_string[abi:ne180100]<0>(&v156, "svId");
              XofIntegralType<unsigned char>::XofIntegralType((uint64_t)__str, &v156, 0, 24, 0);
              std::string::basic_string[abi:ne180100]<0>(&v153, "channelNo");
              XofIntegralType<signed char>::XofIntegralType((uint64_t)v149, &v153, -7, 6, 99);
              *(_OWORD *)&v70[8] = *(_OWORD *)&__str[8];
              *(_QWORD *)&v70[24] = *(_QWORD *)&__str[24];
              memset(&__str[8], 0, 24);
              *(_DWORD *)v70 = *(_DWORD *)__str;
              LODWORD(v71.__r_.__value_.__l.__data_) = *(_DWORD *)v149;
              *(_OWORD *)&v71.__r_.__value_.__r.__words[1] = *(_OWORD *)&v149[8];
              v72 = *(_QWORD *)&v149[24];
              memset(&v149[8], 0, 24);
              if (SHIBYTE(v153.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v153.__r_.__value_.__l.__data_);
                if (__str[31] < 0)
                  operator delete(*(void **)&__str[8]);
              }
              if (SHIBYTE(v156.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v156.__r_.__value_.__l.__data_);
              v34 = a3;
              v35 = XofGlonassChannelMapCodec::Decode((uint64_t)v70, (_QWORD *)a2, a3);
              if (v35)
              {
                *(_WORD *)(a1 + 396 + 2 * v33) = v70[3] | (v71.__r_.__value_.__s.__data_[3] << 8);
              }
              else if (g_LbsOsaTrace_Config >= 2)
              {
                bzero(__str, 0x3C6uLL);
                v36 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Glonass channel map decode failure, Sat Id = [ %d ]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v36), "GNC", 87, "Decode", v33 + 1);
                gnssOsa_PrintLog(__str, 2, 1, 0);
              }
              if (SHIBYTE(v72) < 0)
                operator delete((void *)v71.__r_.__value_.__l.__size_);
              if ((v70[31] & 0x80000000) != 0)
                operator delete(*(void **)&v70[8]);
              if (!v35)
                break;
              ++v33;
              a3 = v34;
              if (v33 == 24)
                goto LABEL_124;
            }
          }
          else
          {
LABEL_124:
            if (g_LbsOsaTrace_Config >= 4)
            {
              bzero(__str, 0x3C6uLL);
              v37 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Glonass Channel map decoded, bytes decoded = [%u] \n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v37), "GNC", 73, "Decode", *a3);
              gnssOsa_PrintLog(__str, 4, 1, 0);
            }
            v69 = a3;
            v38 = 0;
            v39 = 0;
            v40 = 67;
            while (1)
            {
              if (*(_BYTE *)(a1 + v40 - 1) || *(_BYTE *)(a1 + v40 - 2) || *(_BYTE *)(a1 + v40))
              {
                std::string::basic_string[abi:ne180100]<0>(&v155, "sRefTime");
                XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v156, &v155, 0, 0xFFFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v152, "refWeekNo");
                XofIntegralType<unsigned short>::XofIntegralType((uint64_t)&v153, &v152, 0, 0x1FFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v151, "sTA0");
                XofIntegralType<int>::XofIntegralType((uint64_t)__str, &v151, 0x80000000, 0x7FFFFFFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v148, "sTA1");
                XofIntegralType<int>::XofIntegralType((uint64_t)v149, &v148, -8388608, 0x7FFFFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v144, "sTA2");
                XofIntegralType<signed char>::XofIntegralType((uint64_t)&v145, &v144, -64, 63, 0);
                std::string::basic_string[abi:ne180100]<0>(&v140, "sTA0_Corr");
                XofIntegralType<short>::XofIntegralType((uint64_t)&v141, &v140, -32768, 0x7FFF, 0);
                std::string::basic_string[abi:ne180100]<0>(&v137, "reserved");
                XofIntegralType<unsigned char>::XofIntegralType((uint64_t)&v138, &v137, 0, 255, 0);
                *(std::string *)v70 = v156;
                *(_QWORD *)&v70[24] = v157;
                *(_OWORD *)&v156.__r_.__value_.__r.__words[1] = 0uLL;
                v157 = 0;
                v71 = v153;
                v72 = v154;
                v154 = 0;
                *(_OWORD *)&v153.__r_.__value_.__r.__words[1] = 0uLL;
                v73 = *(_OWORD *)__str;
                v75 = *(_QWORD *)&__str[32];
                v74 = *(_OWORD *)&__str[16];
                memset(&__str[16], 0, 24);
                v76 = *(_OWORD *)v149;
                v78 = v150;
                v77 = *(_OWORD *)&v149[16];
                *(_QWORD *)&v149[16] = 0;
                *(_QWORD *)&v149[24] = 0;
                v150 = 0;
                v79 = v145;
                v81 = v147;
                v80 = v146;
                v146 = 0uLL;
                v147 = 0;
                v82 = v141;
                v84 = v143;
                v83 = v142;
                v142 = 0uLL;
                v143 = 0;
                v85 = (int)v138.__r_.__value_.__l.__data_;
                v87 = v139;
                v86 = *(_OWORD *)&v138.__r_.__value_.__r.__words[1];
                *(_OWORD *)&v138.__r_.__value_.__r.__words[1] = 0uLL;
                v139 = 0;
                if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
                {
                  operator delete(v137.__r_.__value_.__l.__data_);
                  if (SHIBYTE(v143) < 0)
                    operator delete((void *)v142);
                }
                if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v140.__r_.__value_.__l.__data_);
                if (SHIBYTE(v147) < 0)
                  operator delete((void *)v146);
                if (SHIBYTE(v144.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v144.__r_.__value_.__l.__data_);
                if (SHIBYTE(v150) < 0)
                  operator delete(*(void **)&v149[16]);
                if (SHIBYTE(v148.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v148.__r_.__value_.__l.__data_);
                if (__str[39] < 0)
                  operator delete(*(void **)&__str[16]);
                if (SHIBYTE(v151.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v151.__r_.__value_.__l.__data_);
                if (SHIBYTE(v154) < 0)
                  operator delete((void *)v153.__r_.__value_.__l.__size_);
                if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v152.__r_.__value_.__l.__data_);
                if (SHIBYTE(v157) < 0)
                  operator delete((void *)v156.__r_.__value_.__l.__size_);
                if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v155.__r_.__value_.__l.__data_);
                v41 = XofGenericCodec::Decode<0ul,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<signed char>,XofIntegralType<short>,XofIntegralType<unsigned char>>((uint64_t)v70, (_QWORD *)a2, v69);
                if (v41)
                {
                  if (g_LbsOsaTrace_Config >= 4)
                  {
                    bzero(__str, 0x3C6uLL);
                    v42 = mach_continuous_time();
                    v43 = "   ";
                    if (v39 <= 5)
                      v43 = off_251CDCE98[v39];
                    v44 = *(double *)&g_MacClockTicksToMsRelation;
                    std::string::basic_string[abi:ne180100]<0>(v149, v43);
                    v45 = v149;
                    if (v149[23] < 0)
                      v45 = *(const char **)v149;
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Time Model for [ %s ] is decoded, bytes decoded = [%u]\n", (unint64_t)(v44 * (double)v42), "GNC", 73, "Decode", v45, *v69);
                    if ((v149[23] & 0x80000000) != 0)
                      operator delete(*(void **)v149);
                    gnssOsa_PrintLog(__str, 4, 1, 0);
                    a1 = v68;
                  }
                  v46 = HIWORD(v71.__r_.__value_.__r.__words[0]);
                  v47 = HIDWORD(v73);
                  v48 = HIDWORD(v76);
                  v49 = HIBYTE(v79);
                  v50 = HIWORD(v82);
                  v51 = a1 + v38;
                  *(_WORD *)(v51 + 444) = *(_WORD *)&v70[6];
                  *(_WORD *)(v51 + 446) = v46;
                  *(_DWORD *)(v51 + 448) = v47;
                  *(_DWORD *)(v51 + 452) = v48;
                  *(_BYTE *)(v51 + 456) = v49;
                  *(_WORD *)(v51 + 458) = v50;
                }
                else if (g_LbsOsaTrace_Config >= 2)
                {
                  bzero(__str, 0x3C6uLL);
                  v52 = mach_continuous_time();
                  v53 = "   ";
                  if (v39 <= 5)
                    v53 = off_251CDCE98[v39];
                  v54 = *(double *)&g_MacClockTicksToMsRelation;
                  std::string::basic_string[abi:ne180100]<0>(v149, v53);
                  if (v149[23] >= 0)
                    v55 = v149;
                  else
                    v55 = *(const char **)v149;
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Time Model decode failure, constellation Id = [ %s ]\n", (unint64_t)(v54 * (double)v52), "GNC", 87, "Decode", v55);
                  if ((v149[23] & 0x80000000) != 0)
                    operator delete(*(void **)v149);
                  gnssOsa_PrintLog(__str, 2, 1, 0);
                  a1 = v68;
                }
                if (SHIBYTE(v87) < 0)
                  operator delete((void *)v86);
                if (SHIBYTE(v84) < 0)
                  operator delete((void *)v83);
                if (SHIBYTE(v81) < 0)
                  operator delete((void *)v80);
                if (SHIBYTE(v78) < 0)
                  operator delete((void *)v77);
                if (SHIBYTE(v75) < 0)
                  operator delete((void *)v74);
                if (SHIBYTE(v72) < 0)
                  operator delete((void *)v71.__r_.__value_.__l.__size_);
                if ((v70[31] & 0x80000000) != 0)
                  operator delete(*(void **)&v70[8]);
                if (!v41)
                  break;
              }
              ++v39;
              v38 += 16;
              v40 += 48;
              if (v39 == 6)
              {
                if (XofAlmanacData::Decode((uint64_t **)(a1 + 544), (_QWORD *)a2, v69, (unsigned __int8 *)a1) == 1)
                {
                  if (g_LbsOsaTrace_Config >= 4)
                  {
                    bzero(__str, 0x3C6uLL);
                    v56 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Almanac decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v56), "GNC", 73, "Decode", *v69);
                    gnssOsa_PrintLog(__str, 4, 1, 0);
                  }
                  if (XofBrdcstEph::Decode(a1 + 688) == 1)
                  {
                    if (g_LbsOsaTrace_Config >= 4)
                    {
                      bzero(__str, 0x3C6uLL);
                      v57 = mach_continuous_time();
                      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Broadcast Ephemeris decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v57), "GNC", 73, "Decode", *v69);
                      gnssOsa_PrintLog(__str, 4, 1, 0);
                    }
                    if (XofExtEph::Decode(a1 + 856) == 1)
                    {
                      if (g_LbsOsaTrace_Config >= 4)
                      {
                        bzero(__str, 0x3C6uLL);
                        v58 = mach_continuous_time();
                        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Extended Ephemeris decoded, bytes decoded = [%u]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v58), "GNC", 73, "Decode", *v69);
                        gnssOsa_PrintLog(__str, 4, 1, 0);
                      }
                      if (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2 == *v69)
                      {
                        XofData::LogSummaryOfDecodedData((XofData *)a1);
                        v13 = 1;
                      }
                      else
                      {
                        if (g_LbsOsaTrace_Config)
                        {
                          bzero(__str, 0x3C6uLL);
                          v67 = mach_continuous_time();
                          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Buffer is not fully decoded. Invalid data length!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v67), "GNC", 69, "Decode");
                          gnssOsa_PrintLog(__str, 1, 1, 0);
                        }
                        v13 = 9;
                      }
                      goto LABEL_213;
                    }
                    if (g_LbsOsaTrace_Config >= 2)
                    {
                      bzero(__str, 0x3C6uLL);
                      v66 = mach_continuous_time();
                      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Extended Ephemeris decode failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v66), "GNC", 87, "Decode");
                      gnssOsa_PrintLog(__str, 2, 1, 0);
                    }
                  }
                  else if (g_LbsOsaTrace_Config >= 2)
                  {
                    bzero(__str, 0x3C6uLL);
                    v65 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Broadcast Ephemeris decode failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v65), "GNC", 87, "Decode");
                    gnssOsa_PrintLog(__str, 2, 1, 0);
                  }
                }
                else if (g_LbsOsaTrace_Config >= 2)
                {
                  bzero(__str, 0x3C6uLL);
                  v64 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Almanac decode failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v64), "GNC", 87, "Decode");
                  gnssOsa_PrintLog(__str, 2, 1, 0);
                }
                break;
              }
            }
          }
        }
        else if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          v62 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: UTC Model decode failure!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v62), "GNC", 87, "Decode");
          gnssOsa_PrintLog(__str, 2, 1, 0);
        }
        v13 = 5;
LABEL_213:
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<short>>::~__tuple_impl((uint64_t)__p);
      }
      else
      {
        if (g_LbsOsaTrace_Config >= 2)
        {
          bzero(__str, 0x3C6uLL);
          v61 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Ionosphere model decode failure!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v61), "GNC", 87, "Decode");
          gnssOsa_PrintLog(__str, 2, 1, 0);
        }
        v13 = 5;
      }
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>>::~__tuple_impl((uint64_t)&v108);
    }
    else
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        v60 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid payload length!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v60), "GNC", 69, "Decode");
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      v13 = 9;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v59 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: XOF Header data decode Failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v59), "GNC", 73, "Decode");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v13 = 5;
  }
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofConstellationHeaderCodec,XofIntegralType<unsigned long long>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>>::~__tuple_impl((uint64_t)v132);
  return v13;
}

void sub_24BBC4EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<short>>::~__tuple_impl((uint64_t)&a59);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>>::~__tuple_impl((uint64_t)&STACK[0x2A8]);
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul,8ul,9ul,10ul,11ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<unsigned int>,XofConstellationHeaderCodec,XofIntegralType<unsigned long long>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>,XofIntegralType<unsigned int>>::~__tuple_impl((uint64_t)&STACK[0x3A8]);
  _Unwind_Resume(a1);
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<signed char>,XofIntegralType<short>,XofIntegralType<unsigned char>>::~__tuple_impl(uint64_t a1)
{
  if (*(char *)(a1 + 239) < 0)
    operator delete(*(void **)(a1 + 216));
  if (*(char *)(a1 + 207) < 0)
    operator delete(*(void **)(a1 + 184));
  if (*(char *)(a1 + 175) < 0)
    operator delete(*(void **)(a1 + 152));
  if (*(char *)(a1 + 143) < 0)
    operator delete(*(void **)(a1 + 120));
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<short>>::~__tuple_impl(uint64_t a1)
{
  if (*(char *)(a1 + 271) < 0)
    operator delete(*(void **)(a1 + 248));
  if (*(char *)(a1 + 239) < 0)
    operator delete(*(void **)(a1 + 216));
  if (*(char *)(a1 + 207) < 0)
    operator delete(*(void **)(a1 + 184));
  if (*(char *)(a1 + 175) < 0)
    operator delete(*(void **)(a1 + 152));
  if (*(char *)(a1 + 143) < 0)
    operator delete(*(void **)(a1 + 120));
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  return a1;
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul,4ul,5ul,6ul,7ul>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>,XofIntegralType<signed char>>::~__tuple_impl(uint64_t a1)
{
  if (*(char *)(a1 + 255) < 0)
    operator delete(*(void **)(a1 + 232));
  if (*(char *)(a1 + 223) < 0)
    operator delete(*(void **)(a1 + 200));
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  if (*(char *)(a1 + 159) < 0)
    operator delete(*(void **)(a1 + 136));
  if (*(char *)(a1 + 127) < 0)
    operator delete(*(void **)(a1 + 104));
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
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

void sub_24BBC579C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x24BD2D78C](v1);
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
  MEMORY[0x24BD2D78C](a1 + 112);
  return a1;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  size_t v16;
  std::locale::__imp *p_b;
  uint64_t v18;
  uint64_t v19;
  std::locale *v20;
  uint64_t v21;
  _BYTE v23[16];
  std::locale __b;
  size_t v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BD2D684](v23, a1);
  if (v23[0])
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&__b, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20)
      v12 = a2 + a3;
    else
      v12 = a2;
    if (!v7)
      goto LABEL_29;
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8)
        std::string::__throw_length_error[abi:ne180100]();
      if (v16 >= 0x17)
      {
        v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17)
          v18 = v16 | 7;
        v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        v25 = v16;
        v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((_BYTE *)p_b + v16) = 0;
      v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(_QWORD *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0)
        operator delete(__b.__locale_);
      if (v21 != v16)
        goto LABEL_29;
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((_QWORD *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x24BD2D690](v23);
  return a1;
}

void sub_24BBC5ACC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _QWORD *v16;

  if (a2)
  {
    if (a16 < 0)
      operator delete(__p);
    MEMORY[0x24BD2D690](&a9);
    __cxa_begin_catch(exception_object);
    std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v16 + *(_QWORD *)(*v16 - 24)));
    __cxa_end_catch();
    JUMPOUT(0x24BBC5A80);
  }
  _Unwind_Resume(exception_object);
}

BOOL XofGenericCodec::Decode<0ul,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<signed char>,XofIntegralType<short>,XofIntegralType<unsigned char>>(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  return XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)a1, a2, a3) == 1
      && XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 32), a2, a3) == 1
      && XofIntegralType<int>::DecodeFromHexData((int *)(a1 + 64), a2, a3) == 1
      && XofIntegralType<int>::DecodeFromHexData((int *)(a1 + 104), a2, a3) == 1
      && XofIntegralType<signed char>::DecodeFromHexData((char *)(a1 + 144), a2, a3) == 1
      && XofIntegralType<short>::DecodeFromHexData((__int16 *)(a1 + 176), a2, a3) == 1
      && XofIntegralType<unsigned char>::DecodeFromHexData((unsigned __int8 *)(a1 + 208), a2, a3) == 1;
}

BOOL XofUtcModelCodec::Decode(int *a1, _QWORD *a2, _DWORD *a3)
{
  return XofIntegralType<int>::DecodeFromHexData(a1, a2, a3) == 1
      && XofGenericCodec::Decode<1ul,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<short>>((uint64_t)a1, a2, a3);
}

BOOL XofGenericCodec::Decode<1ul,XofIntegralType<int>,XofIntegralType<int>,XofIntegralType<unsigned short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<unsigned short>,XofIntegralType<short>,XofIntegralType<short>>(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  return XofIntegralType<int>::DecodeFromHexData((int *)(a1 + 40), a2, a3) == 1
      && XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 80), a2, a3) == 1
      && XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 112), a2, a3) == 1
      && XofIntegralType<short>::DecodeFromHexData((__int16 *)(a1 + 144), a2, a3) == 1
      && XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 176), a2, a3) == 1
      && XofIntegralType<short>::DecodeFromHexData((__int16 *)(a1 + 208), a2, a3) == 1
      && XofIntegralType<short>::DecodeFromHexData((__int16 *)(a1 + 240), a2, a3) == 1;
}

_BYTE *NK_Set_Fix_Type(_BYTE *result, double *a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, double a9, double a10, int a11, char a12, int a13, int a14, _BYTE *a15, _DWORD *a16, unsigned int *a17, _DWORD *a18, int *a19, int *a20)
{
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  double v24;
  unsigned int v25;
  _BOOL4 v26;
  _BOOL4 v27;
  int v28;
  _BOOL4 v29;
  int v30;
  int v31;
  int v32;
  _BOOL4 v34;
  int v35;
  int v36;
  int v37;
  char v38;
  int v39;
  int v40;
  BOOL v41;
  int v42;
  char v43;
  int v44;
  unsigned int v45;
  int v46;
  unsigned int v47;
  int v48;
  _BOOL4 v49;
  char v50;
  char v51;
  int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  char v57;
  char v58;

  if (a8 > 8)
    v20 = 100000000.0;
  else
    v20 = dbl_24BC0D100[a8];
  v21 = sqrt(a2[6] + a2[7]);
  v22 = sqrt(a2[9] + a2[10]);
  v23 = 1000 * a11 / a5;
  v24 = sqrt(v20);
  if (!a13 || (v25 = *a17, *a17 >= v23))
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
    LOBYTE(v26) = 0;
    *(_DWORD *)(a4 + 20) = 0;
    goto LABEL_33;
  }
  if (*(_DWORD *)(a4 + 16) > v25)
  {
    v26 = *(_DWORD *)(a3 + 48) == 2
       || *(_DWORD *)(a3 + 68) == 2
       || *(_DWORD *)(a3 + 72) == 2
       || *(_DWORD *)(a3 + 76) == 2
       || *(_DWORD *)(a3 + 80) == 2
       || *(_DWORD *)(a3 + 84) == 2
       || *(_DWORD *)(a3 + 88) == 2;
    v27 = (*(_DWORD *)(a3 + 92) == 2 || *(_DWORD *)(a3 + 96) == 2) && a8 - 3 < 6;
    v28 = a9 < 1000000.0 && *(_DWORD *)(a3 + 56) == 2 || *(_DWORD *)(a3 + 36) == 2 || v26;
LABEL_29:
    v29 = v22 < v24 + (double)((v25 * a5 / 0x1F4) & 0xFFFFFE) && v21 < 400.0;
    ++*(_DWORD *)(a4 + 20);
    goto LABEL_33;
  }
  if (a8 - 4 > 4)
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
    LOBYTE(v26) = 0;
    goto LABEL_33;
  }
  LOBYTE(v26) = 0;
  v28 = 0;
  v27 = 0;
  v29 = 0;
  if (*(unsigned __int8 *)(a3 + 2) <= 1u)
    goto LABEL_29;
LABEL_33:
  v31 = *(_DWORD *)(a3 + 60);
  v30 = *(_DWORD *)(a3 + 64);
  v32 = *(_DWORD *)(a3 + 56);
  v34 = a10 < 500000.0 && v31 == 2;
  if (v32 != 1)
    a9 = 1.0e16;
  if (v31 != 1)
    a10 = 1.0e16;
  *a19 = 0;
  v35 = result[6];
  if (!result[6] || *(_BYTE *)a4)
  {
    v36 = 1;
LABEL_46:
    if (*a17 < 0x1869F)
      ++*a17;
    *a16 = 0;
    if (v35)
      v37 = 0;
    else
      v37 = v36;
    if ((v37 & v29) == 1 && *a17 <= v23 && *(unsigned __int8 *)(a3 + 2) <= 1u)
      *a19 = 1;
    goto LABEL_109;
  }
  if (v21 >= 400.0 && (a6 > 0x7CF || *a15 || v21 >= 1000.0))
  {
    v38 = a12 ^ 1;
    v36 = 1;
    if (a6 < 0x186A0)
      v38 = 0;
    if ((v38 & 1) != 0 || !*a15)
      goto LABEL_46;
  }
  v39 = *(_DWORD *)(a3 + 36);
  if (a14 > 8 || (v40 = v39 == 1, a14 >= 7) && result[5])
  {
    if (v39 == 1)
      v40 = 2;
    else
      v40 = 1;
  }
  if (((v28 | v34) & 1) != 0
    || (v45 = *(unsigned __int8 *)(a3 + 1), v42 = 5, 5 - v40 > v45)
    && (4 - v40 > v45 || (v42 = 5, a10 >= 160000.0) && a9 >= 160000.0))
  {
    if (v30 == 2)
      v34 = 1;
    if ((v28 & 1) != 0
      || (v21 < 400.0 ? (v41 = !v34) : (v41 = 1), v41 || (v42 = 4, 4 - v40 > *(unsigned __int8 *)(a3 + 1))))
    {
      if (a8 > 1)
        v43 = 1;
      else
        v43 = v28;
      if ((v43 & 1) == 0 && 2 - v40 <= *(unsigned __int8 *)(a3 + 1))
      {
        v44 = 3;
        goto LABEL_167;
      }
      if (v29)
      {
        if (v32 == 1
          || *(_DWORD *)(a3 + 92) == 1
          && (*(_DWORD *)(a3 + 68) == 1
           || *(_DWORD *)(a3 + 72) == 1
           || *(_DWORD *)(a3 + 76) == 1
           || *(_DWORD *)(a3 + 80) == 1
           || *(_DWORD *)(a3 + 84) == 1
           || *(_DWORD *)(a3 + 88) == 1)
          || *(_DWORD *)(a3 + 96) == 1
          && (*(_DWORD *)(a3 + 68) == 1
           || *(_DWORD *)(a3 + 72) == 1
           || *(_DWORD *)(a3 + 76) == 1
           || *(_DWORD *)(a3 + 80) == 1
           || *(_DWORD *)(a3 + 84) == 1
           || *(_DWORD *)(a3 + 88) == 1))
        {
          v44 = 2;
LABEL_167:
          v36 = 0;
          *a19 = v44;
          goto LABEL_46;
        }
      }
      else
      {
        v36 = 1;
        if (1 - v40 > *(unsigned __int8 *)(a3 + 1) || !(v27 | v28))
          goto LABEL_46;
      }
      v44 = 1;
      goto LABEL_167;
    }
  }
  *a19 = v42;
  if (*a16 < 0x1869Fu)
    ++*a16;
  *a17 = 0;
  *a18 = 0;
  if (!a13 && *a16 >= 3u)
    *a16 = 2;
LABEL_109:
  if (!*a15)
  {
LABEL_112:
    v46 = 1;
    goto LABEL_113;
  }
  if (*a16 > 4u)
    goto LABEL_111;
  v46 = 0;
  if (a6 > 0x12B || !v35 || v21 >= 400.0)
    goto LABEL_113;
  if (*(unsigned __int8 *)(a3 + 1) >= 6u)
  {
LABEL_111:
    *a15 = 0;
    goto LABEL_112;
  }
  v46 = 0;
LABEL_113:
  *a20 = 0;
  if (a8 - 5 >= 4)
    v47 = 30;
  else
    v47 = 100;
  if (result[9] && !*(_BYTE *)a4 && (!v46 || v47 > a7 && v22 < v24))
  {
    v48 = *(_DWORD *)(a3 + 48);
    v49 = v48 == 1;
    v50 = v30 == 2 || v26;
    if ((v50 & 1) != 0)
    {
      v51 = v30 != 2 || v26;
      if ((v51 & 1) == 0 && (v49 ^ 3u) <= *(unsigned __int8 *)(a3 + 5))
      {
        v52 = 4;
LABEL_169:
        *a20 = v52;
        return result;
      }
    }
    else
    {
      v53 = *(unsigned __int8 *)(a3 + 5);
      if (v48 == 1)
        v54 = 3;
      else
        v54 = 4;
      if (v54 <= v53 || (v49 ^ 3u) <= v53 && v30 == 1)
      {
        v52 = 5;
        goto LABEL_169;
      }
    }
    if (a8 > 1)
      LOBYTE(v26) = 1;
    if (!v26)
    {
      v55 = v48 == 1 ? 1 : 2;
      if (v55 <= *(unsigned __int8 *)(a3 + 5))
      {
        v52 = 3;
        goto LABEL_169;
      }
    }
    if (*(_DWORD *)(a3 + 76) == 1)
    {
      v52 = 2;
      goto LABEL_169;
    }
    v56 = *(_DWORD *)(a3 + 68);
    v57 = v56 == 1 || v29;
    if (v56 == 1)
      v52 = 2;
    else
      v52 = 1;
    if ((v57 & 1) != 0)
      goto LABEL_169;
    v58 = v50 ^ 1;
    if (!v49 > *(unsigned __int8 *)(a3 + 5))
      v58 = 1;
    if ((v58 & 1) == 0)
    {
      v52 = 1;
      goto LABEL_169;
    }
  }
  return result;
}

double *NK_Correct_State(double *result, _BYTE *a2, double *a3)
{
  uint64_t i;
  uint64_t v4;
  double v5;
  double *v6;
  double *v7;

  if (*a2)
    a3[15] = a3[15] + *result * -0.00000000333564095;
  if (a2[1])
    a3[16] = a3[16] + result[1] * -0.00000000333564095;
  if (a2[2])
    a3[17] = a3[17] + result[2] * -0.00000000333564095;
  if (a2[3])
    a3[18] = a3[18] + result[3] * -0.00000000333564095;
  if (a2[4])
    a3[19] = a3[19] + result[4] * -0.00000000333564095;
  if (a2[6] && a2[7] && a2[8])
  {
    for (i = 0; i != 3; ++i)
      a3[i + 6] = a3[i + 6] - result[i + 6];
  }
  if (a2[9] && a2[10] && a2[11])
  {
    v4 = 0;
    v5 = a3[5];
    v6 = result + 9;
    do
    {
      v7 = &a3[v4];
      v7[9] = a3[v4 + 9] - v6[v4];
      v7[12] = -v6[v4++] / v5;
    }
    while (v4 != 3);
  }
  if (a2[5])
    a3[20] = a3[20] - result[5];
  return result;
}

BOOL Is_GPS_BinEph_Real(uint64_t a1)
{
  return *(_DWORD *)(a1 + 12)
      || *(_DWORD *)(a1 + 16)
      || *(_DWORD *)(a1 + 20)
      || *(_DWORD *)(a1 + 24)
      || *(_BYTE *)(a1 + 34)
      || *(_WORD *)(a1 + 40)
      || *(unsigned __int16 *)(a1 + 45) << 8
      || *(unsigned __int16 *)(a1 + 53) << 8
      || *(unsigned __int16 *)(a1 + 61) << 8
      || *(unsigned __int16 *)(a1 + 73) << 8
      || *(unsigned __int16 *)(a1 + 81) << 8
      || *(unsigned __int16 *)(a1 + 89) << 8
      || *(_DWORD *)(a1 + 96)
      || (*(_WORD *)(a1 + 100) & 0xFFFC) != 0;
}

void Hal_StoreCoExConfiguration(uint64_t a1)
{
  uint64_t v1;
  char __str[966];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  g_GNSSCoExConfigSWRequest = a1;
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v1 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #CoexConfig bitmask 0x%llx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v1), "HAL", 73, "Hal_StoreCoExConfiguration", g_GNSSCoExConfigSWRequest);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
}

uint64_t Hal_SetCoexConfig(void)
{
  __int16 v0;
  uint64_t i;
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t j;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char __str[966];
  unsigned __int8 v15[8];
  _WORD v16[24];
  uint64_t v17;

  v0 = 0;
  v17 = *MEMORY[0x24BDAC8D0];
  memset((char *)v16 + 1, 0, 40);
  *(_QWORD *)v15 = 0x1900284D6242787ALL;
  LOBYTE(v16[0]) = 71;
  for (i = 8; i != 46; ++i)
    v0 += v15[i];
  v16[19] = v0;
  LOBYTE(v16[20]) = 10;
  g_HalState = 7;
  qword_257A4EFF8 = 0;
  if ((int)Hal22_ZxSendToChip(v15, 0x31uLL) <= 0)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
    goto LABEL_26;
  }
  v2 = gnssOsa_SemWaitTimeOut(g_HandleAckSem, 0xC8u);
  if (v2 == 1)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
    goto LABEL_23;
  }
  if (v2)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
LABEL_23:
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx err\n");
LABEL_26:
    gnssOsa_PrintLog(__str, 1, 1, 0);
    if (!g_LbsOsaTrace_Config)
      return 0;
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Get Coex config failed\n");
LABEL_28:
    gnssOsa_PrintLog(__str, 1, 1, 0);
    return 0;
  }
  if (_MergedGlobals_8 != 32)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
    bzero(__str, 0x3C6uLL);
    v12 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx err,%u\n", v12);
    goto LABEL_26;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "HAL", 73, "Hal_GetCoexConfiguration");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  memset(&v16[1], 0, 39);
  *(_QWORD *)v15 = 0x1900284D6242787ALL;
  v16[0] = 339;
  HIBYTE(v16[1]) = g_GNSSCoExConfigSWRequest & 1;
  HIBYTE(v16[2]) = (g_GNSSCoExConfigSWRequest & 4) != 0;
  HIBYTE(v16[3]) = (g_GNSSCoExConfigSWRequest & 8) != 0;
  HIBYTE(v16[4]) = (g_GNSSCoExConfigSWRequest & 2) != 0;
  HIBYTE(v16[5]) = (g_GNSSCoExConfigSWRequest & 0x10) != 0;
  HIBYTE(v16[6]) = (g_GNSSCoExConfigSWRequest & 0x20) != 0;
  Hal_PrintCoExConfig("Setting CoEx Config", g_GNSSCoExConfigSWRequest);
  v4 = 0;
  qword_257A4EFF8 = 0;
  for (j = 8; j != 46; ++j)
    v4 += v15[j];
  v16[19] = v4;
  LOBYTE(v16[20]) = 10;
  g_HalState = 6;
  if ((int)Hal22_ZxSendToChip(v15, 0x31uLL) <= 0)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n");
    goto LABEL_28;
  }
  v6 = gnssOsa_SemWaitTimeOut(g_HandleAckSem, 0xC8u);
  if (v6 == 1)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
    goto LABEL_36;
  }
  if (v6)
  {
    if (!g_LbsOsaTrace_Config)
      return 0;
LABEL_36:
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx err\n");
    goto LABEL_28;
  }
  if (_MergedGlobals_8 == 83)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v11 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SetCoex,session ongoing\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "HAL", 87, "Hal_SetCoexConfig");
      v8 = 1;
      v9 = 2;
      goto LABEL_39;
    }
    return 1;
  }
  if (_MergedGlobals_8 == 32)
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "HAL", 73, "Hal_SetCoexConfig");
      v8 = 1;
      v9 = 4;
LABEL_39:
      gnssOsa_PrintLog(__str, v9, 1, 0);
      return v8;
    }
    return 1;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v13 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx err,%u\n", v13);
    goto LABEL_28;
  }
  return 0;
}

void Hal_PrintCoExConfig(const char *a1, unsigned int a2)
{
  uint64_t v4;
  char __str[966];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %s: 2G,%u, NR,%u, LTEB13,%u, LTEB14,%u, EAssist,%u, STW,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "HAL", 73, "Hal_PrintCoExConfig", a1, a2 & 1, (a2 >> 1) & 1, (a2 >> 2) & 1, (a2 >> 3) & 1, (a2 >> 4) & 1, (a2 >> 5) & 1);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
}

void Hal_CoexConfigRespone(unsigned __int8 *a1)
{
  unsigned int v1;
  unint64_t v2;
  const char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char __str[966];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (!g_LbsOsaTrace_Config)
      return;
    bzero(__str, 0x3C6uLL);
    v7 = 513;
    v6 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v3 = "%10u %s%c %s: #%04hx data\n";
    goto LABEL_17;
  }
  if (a1[2] != 66 || a1[3] != 66)
  {
    if (!g_LbsOsaTrace_Config)
      return;
    bzero(__str, 0x3C6uLL);
    v2 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx MC,%u,MID,%u,MIDEx,%u\n", v2, "HAL");
    goto LABEL_18;
  }
  _MergedGlobals_8 = a1[8];
  v1 = qword_257A4EFF8 | a1[11] | (2 * a1[17]) | (4 * a1[13]) | (8 * a1[15]) | (16 * a1[19]) | (32 * a1[21]);
  qword_257A4EFF8 |= a1[11] | (2 * a1[17]) | (4 * a1[13]) | (8 * a1[15]) | (16 * a1[19]) | (32 * a1[21]);
  if (g_HalState == 6)
  {
    Hal_PrintCoExConfig("FWCoEx Set Response", v1);
    if (g_GNSSCoExConfigSWRequest != qword_257A4EFF8)
    {
      _MergedGlobals_8 = 71;
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v4 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Config mismatch SW,0x%llx,FW,0x%llx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "HAL", 87, "Hal_CoexConfigRespone", g_GNSSCoExConfigSWRequest, qword_257A4EFF8);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
    }
  }
  else if (g_HalState == 7)
  {
    Hal_PrintCoExConfig("FWCoEx Get Response", v1);
  }
  if (!gnssOsa_SemRelease((dispatch_semaphore_t)g_HandleAckSem) && g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v5 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v7 = 1542;
    v8 = *__error();
    v6 = v5;
    v3 = "%10u %s%c %s: #%04hx HandleAckSem err,%d\n";
LABEL_17:
    snprintf(__str, 0x3C5uLL, v3, v6, "HAL", 69, "Hal_CoexConfigRespone", v7, v8);
LABEL_18:
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

BOOL Is_NVIC_IntEph_Real(uint64_t a1)
{
  return *(_DWORD *)(a1 + 60)
      || *(_WORD *)(a1 + 30)
      || *(_DWORD *)(a1 + 56)
      || *(_WORD *)(a1 + 64)
      || *(_WORD *)(a1 + 66)
      || *(_WORD *)(a1 + 68)
      || *(_WORD *)(a1 + 70)
      || *(_WORD *)(a1 + 72)
      || *(_WORD *)(a1 + 74)
      || *(_BYTE *)(a1 + 26)
      || *(_WORD *)(a1 + 28) != 0;
}

uint64_t GNB_Debug_Flush_Check(void)
{
  int v0;
  uint64_t result;

  v0 = qword_257A47958 - qword_257A47950;
  if (dword_257A47948 - (int)g_CB_GDbg > 0)
    v0 = 0;
  if ((v0 + dword_257A47948 - g_CB_GDbg) <= 0x1FF)
    return GNSS_GNB_Debug_Ctl((uint64_t)&g_CB_GDbg);
  return result;
}

char *GNB_Debug_BlockMove(char *__src, int a2)
{
  int v2;
  char *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned int v21;
  int v22;
  void *v23;
  int v24;
  int v25;

  if (g_Logging_Cfg >= 4)
  {
    v2 = a2;
    v3 = __src;
    v4 = (void *)g_CB_GDbg;
    v5 = qword_257A47958;
    v6 = qword_257A47958 - qword_257A47950;
    if (dword_257A47948 - (int)g_CB_GDbg > 0)
      v6 = 0;
    if (v6 + dword_257A47948 - (int)g_CB_GDbg <= a2)
    {
      GNSS_GNB_Debug_Ctl((uint64_t)&g_CB_GDbg);
      v10 = (void *)g_CB_GDbg;
      v11 = qword_257A47958;
      v12 = qword_257A47958 - qword_257A47950;
      if (dword_257A47948 - (int)g_CB_GDbg > 0)
        v12 = 0;
      v13 = v12 + dword_257A47948 - g_CB_GDbg;
      if (v2 > 1023)
      {
        if (v13 == 1024)
        {
          do
          {
            v16 = 1023;
            do
            {
              v17 = v16;
              v18 = v16-- != 0;
            }
            while (v18 && v3[v17] != 10);
            v19 = v16 + 2;
            if (v17)
              v20 = v19;
            else
              v20 = 1024;
            v21 = GN_GPS_Write_GNB_Debug(v20, v3);
            if (!v21)
            {
              LbsOsaTrace_PrintAsciiBuf(0, 4u, 1, (uint64_t)"<OVERFLOW>\n", 12);
              return (char *)GNB_Debug_Flush_Check();
            }
            v3 += v21;
            v2 -= v21;
          }
          while (v2 > 1023);
          if (v2 >= 1)
          {
            v22 = qword_257A47958;
            v23 = (void *)g_CB_GDbg;
            do
            {
              v24 = v22 - (_DWORD)v23;
              if (v2 >= v24)
                v25 = v24;
              else
                v25 = v2;
              memcpy(v23, v3, v25);
              v23 = (void *)(g_CB_GDbg + v25);
              g_CB_GDbg = (uint64_t)v23;
              v22 = qword_257A47958;
              if ((unint64_t)v23 >= qword_257A47958)
              {
                v23 = (void *)qword_257A47950;
                g_CB_GDbg = qword_257A47950;
              }
              v3 += v25;
              v9 = __OFSUB__(v2, v25);
              v2 -= v25;
            }
            while (!((v2 < 0) ^ v9 | (v2 == 0)));
          }
        }
      }
      else if (v13 > v2)
      {
        do
        {
          v14 = v11 - (_DWORD)v10;
          if (v2 >= v14)
            v15 = v14;
          else
            v15 = v2;
          memcpy(v10, v3, v15);
          v10 = (void *)(g_CB_GDbg + v15);
          g_CB_GDbg = (uint64_t)v10;
          v11 = qword_257A47958;
          if ((unint64_t)v10 >= qword_257A47958)
          {
            v10 = (void *)qword_257A47950;
            g_CB_GDbg = qword_257A47950;
          }
          v3 += v15;
          v9 = __OFSUB__(v2, v15);
          v2 -= v15;
        }
        while (!((v2 < 0) ^ v9 | (v2 == 0)));
      }
    }
    else
    {
      do
      {
        v7 = v5 - (_DWORD)v4;
        if (v2 >= v7)
          v8 = v7;
        else
          v8 = v2;
        memcpy(v4, v3, v8);
        v4 = (void *)(g_CB_GDbg + v8);
        g_CB_GDbg = (uint64_t)v4;
        v5 = qword_257A47958;
        if ((unint64_t)v4 >= qword_257A47958)
        {
          v4 = (void *)qword_257A47950;
          g_CB_GDbg = qword_257A47950;
        }
        v3 += v8;
        v9 = __OFSUB__(v2, v8);
        v2 -= v8;
      }
      while (!((v2 < 0) ^ v9 | (v2 == 0)));
    }
    return (char *)GNB_Debug_Flush_Check();
  }
  return __src;
}

double BDS_EphInt2Real(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int64x2_t v4;
  float64x2_t v5;
  int64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  double v9;
  double result;

  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a2 + 12) = *(_DWORD *)(a1 + 12);
  *(_WORD *)(a2 + 16) = *(_WORD *)(a1 + 16);
  *(int32x2_t *)(a2 + 20) = vmul_s32(*(int32x2_t *)(a1 + 20), vdup_n_s32(0x12Cu));
  *(_DWORD *)(a2 + 28) = 300 * *(_DWORD *)(a1 + 28);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4.i64[0] = (int)v2;
  v4.i64[1] = SHIDWORD(v2);
  v5 = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)xmmword_24BC0D150);
  v4.i64[0] = (int)v3;
  v4.i64[1] = SHIDWORD(v3);
  *(float64x2_t *)(a2 + 32) = v5;
  *(float64x2_t *)(a2 + 48) = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)xmmword_24BC0D160);
  v6 = *(int64x2_t *)(a1 + 48);
  *(_QWORD *)&v7.f64[0] = *(_OWORD *)&vcvtq_f64_s64(v6);
  v7.f64[1] = vcvtq_f64_u64(*(uint64x2_t *)&v6).f64[1];
  v8 = vmulq_f64(vcvtq_f64_s64(*(int64x2_t *)(a1 + 64)), (float64x2_t)vdupq_n_s64(0x3E0921FB54442D28uLL));
  *(float64x2_t *)(a2 + 64) = vmulq_f64(v7, (float64x2_t)xmmword_24BC0D170);
  *(float64x2_t *)(a2 + 80) = v8;
  v8.f64[0] = (double)*(int *)(a1 + 88) * 1.78578867e-13;
  *(double *)(a2 + 96) = (double)*(uint64_t *)(a1 + 80) * 7.3145904e-10;
  *(float64_t *)(a2 + 104) = v8.f64[0];
  v8.f64[0] = (double)*(__int16 *)(a1 + 94) * 9.31322575e-10;
  *(double *)(a2 + 112) = (double)*(__int16 *)(a1 + 92) * 1.78578867e-13;
  *(float64_t *)(a2 + 120) = v8.f64[0];
  *(double *)(a2 + 128) = (double)*(__int16 *)(a1 + 96) * 9.31322575e-10;
  v6.i64[0] = *(_QWORD *)(a1 + 100);
  v4.i64[0] = v6.i32[0];
  v4.i64[1] = v6.i32[1];
  *(float64x2_t *)(a2 + 136) = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)vdupq_n_s64(0x3F70000000000000uLL));
  v6.i64[0] = *(_QWORD *)(a1 + 108);
  v4.i64[0] = v6.i32[0];
  v4.i64[1] = v6.i32[1];
  *(float64x2_t *)(a2 + 152) = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)vdupq_n_s64(0x3E10000000000000uLL));
  v6.i64[0] = *(_QWORD *)(a1 + 116);
  v4.i64[0] = v6.i32[0];
  v4.i64[1] = v6.i32[1];
  *(float64x2_t *)(a2 + 168) = vmulq_f64(vcvtq_f64_s64(v4), (float64x2_t)xmmword_24BC0D180);
  *(double *)(a2 + 184) = (double)*(__int16 *)(a1 + 124) * 1.35525272e-20;
  *(_WORD *)(a2 + 192) = *(_WORD *)(a1 + 126);
  *(_DWORD *)(a2 + 194) = *(_DWORD *)(a1 + 128);
  *(double *)(a2 + 200) = (double)*(__int16 *)(a1 + 132) * 5.82076609e-11;
  *(double *)v6.i64 = (double)*(__int16 *)(a1 + 134) * 5.82076609e-11;
  v9 = (double)*(__int16 *)(a1 + 138);
  *(double *)(a2 + 216) = (double)*(__int16 *)(a1 + 136) * 5.82076609e-11;
  *(double *)(a2 + 224) = v9 * 5.82076609e-11;
  *(_DWORD *)(a2 + 232) = *(_DWORD *)(a1 + 140);
  *(_BYTE *)(a2 + 236) = *(_BYTE *)(a1 + 144);
  *(_WORD *)(a2 + 237) = *(_WORD *)(a1 + 145);
  result = *(double *)v6.i64 + (double)*(char *)(a1 + 147) * 2.32830644e-10;
  *(double *)(a2 + 208) = result;
  return result;
}

_WORD *GPS_To_UTC_Time(_WORD *result, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int16 *a5, unsigned __int16 *a6, unsigned __int16 *a7, __int16 a8, double a9, double a10)
{
  double i;
  int v11;
  double v12;
  int v13;
  unsigned __int16 v14;
  int v15;
  int v16;
  int v17;
  signed int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  int v25;
  BOOL v26;
  int v27;
  unsigned __int16 v28;

  for (i = 0.0005 - a10 + a9; i >= 604800.0; ++a8)
    i = i + -604800.0;
  while (i < 0.0)
  {
    i = i + 604800.0;
    --a8;
  }
  v11 = (int)i;
  v12 = (i - (double)(int)i) * 1000.0;
  v13 = (int)v12;
  if (v12 < -2147483650.0)
    LOWORD(v13) = 0;
  if (v12 <= 2147483650.0)
    v14 = v13;
  else
    v14 = -1;
  *a7 = v14;
  v15 = v11 / 86400;
  v16 = v11 % 86400;
  *a4 = v16 / 3600;
  v16 %= 3600;
  *a5 = v16 / 60;
  *a6 = v16 % 60;
  v17 = v15 - a8 + 8 * a8;
  v18 = v17 + 6;
  if (v17 < 1456)
  {
    LOWORD(v20) = 1980;
  }
  else
  {
    if (v18 >= 2922)
      v18 = 2922;
    v19 = v17 - v18 + 1466;
    v18 = v17 - 1461 * (v19 / 0x5B5) - 1455;
    v20 = 4 * (v19 / 0x5B5) + 1984;
  }
  if (v18 >= 367)
  {
    do
    {
      if ((v20 & 3) != 0)
        v21 = -365;
      else
        v21 = -366;
      v18 += v21;
      LOWORD(v20) = v20 + 1;
    }
    while (v18 > 0x16E);
  }
  v22 = 0;
  if ((v20 & 3) != 0)
    v23 = v20 + 1;
  else
    v23 = v20;
  if ((v20 & 3) != 0)
    v24 = 1;
  else
    v24 = 366;
  if (v18 == 366)
    LOWORD(v20) = v23;
  else
    v24 = v18;
  *result = v20;
  while (1)
  {
    v25 = Days_in_Month[v22];
    v26 = __OFSUB__(v24, v25);
    v27 = v24 - v25;
    if ((v27 < 0) ^ v26 | (v27 == 0))
    {
      *a3 = v24;
      v28 = v22 + 1;
      goto LABEL_40;
    }
    if (v22 == 1 && (v20 & 3) == 0)
      break;
LABEL_36:
    ++v22;
    v24 = v27;
    if (v22 == 12)
      return result;
  }
  if (v27 >= 2)
  {
    --v27;
    goto LABEL_36;
  }
  *a3 = 29;
  v28 = 2;
LABEL_40:
  *a2 = v28;
  return result;
}

uint64_t GPS_To_UTC_DOY(int *a1, __int16 a2, double a3, double a4)
{
  uint64_t result;
  unsigned int v6;
  unint64_t v7;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  unsigned __int16 v26;
  unsigned __int16 v27[2];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v27 = 0;
  v26 = 0;
  result = (uint64_t)GPS_To_UTC_Time(&v27[1], v27, &v26, &v25, &v24, &v23, &v22, a2, a3, a4);
  HIDWORD(v7) = -1030792151 * v27[1];
  LODWORD(v7) = HIDWORD(v7);
  v6 = v7 >> 2;
  LODWORD(v7) = HIDWORD(v7);
  if ((v7 >> 4) < 0xA3D70B || v6 > 0x28F5C28)
    v9 = 32;
  else
    v9 = 31;
  if ((v27[1] & 3) != 0)
    v10 = 31;
  else
    v10 = v9;
  if (v27[0] - 13 >= 0xFFFFFFF4)
  {
    v12 = 0;
    v13 = 31;
    v14 = 28;
    v15 = 59;
    v16 = 89;
    v17 = 120;
    v18 = 150;
    v19 = 181;
    result = 212;
    v20 = 242;
    v21 = 273;
    switch(v27[0])
    {
      case 1u:
        goto LABEL_24;
      case 2u:
        goto LABEL_23;
      case 3u:
        goto LABEL_22;
      case 4u:
        goto LABEL_21;
      case 5u:
        goto LABEL_20;
      case 6u:
        goto LABEL_19;
      case 7u:
        goto LABEL_18;
      case 8u:
        goto LABEL_17;
      case 9u:
        goto LABEL_16;
      case 0xAu:
        goto LABEL_15;
      case 0xBu:
        goto LABEL_14;
      case 0xCu:
        v21 = 303;
LABEL_14:
        v20 = v21;
LABEL_15:
        result = v20;
LABEL_16:
        v19 = result;
LABEL_17:
        v18 = v19;
LABEL_18:
        v17 = v18;
LABEL_19:
        v16 = v17;
LABEL_20:
        v15 = v16;
LABEL_21:
        v14 = v15;
LABEL_22:
        v13 = v14 + v10;
LABEL_23:
        v12 = v13;
LABEL_24:
        v11 = v12 + v26;
        break;
      default:
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    v11 = -1;
  }
  *a1 = v11;
  return result;
}

char **ds_NK_Crude_Apx_Pos(char **result, uint64_t a2, uint64_t a3)
{
  char **v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned __int8 *v8;
  char *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  char *v16;
  char v17;
  char *v18;
  char v19;
  uint64_t v20;
  char *v21;
  char v22;
  uint64_t v23;
  char *v24;
  unsigned int v25;
  char *v26;
  char *v27;
  char v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  char *v34;
  char v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  char *v42;
  char v43;
  int v44;
  unsigned int v45;
  char *v46;
  char v47;
  uint64_t v48;
  int v49;
  unsigned int v50;
  char *v51;
  char v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char v57;
  const char *v58;
  char v59;
  unsigned __int8 *v60;
  int v61;
  uint64_t v62;
  char v63;
  char *v64;
  char v65;
  uint64_t v66;
  int v67;
  int v68;
  unsigned int v69;
  unsigned int v70;
  long double v71;
  double v72;
  __double2 v73;
  double v74;
  long double v75;
  signed int v76;
  char *v77;
  unsigned int i;
  unsigned int v79;
  const char *v80;
  const char *v81;
  const char *v82;
  char v83;
  unsigned __int8 *v84;
  int v85;
  int v86;
  unsigned int v87;
  char *v88;
  _BYTE v89[15];
  uint64_t v90;

  v4 = result;
  v90 = *MEMORY[0x24BDAC8D0];
  v5 = a3 + 68208;
  if (*(unsigned __int8 *)(a3 + 68257) <= 2u && !*(_BYTE *)(a3 + 68256))
    return result;
  v6 = (int)*(double *)(a2 + 32) + 604800 * *(__int16 *)(a2 + 26) - *(_DWORD *)(a3 + 272);
  v7 = v6 >= 0
     ? (int)*(double *)(a2 + 32) + 604800 * *(__int16 *)(a2 + 26) - *(_DWORD *)(a3 + 272)
     : *(_DWORD *)(a3 + 272) - ((int)*(double *)(a2 + 32) + 604800 * *(__int16 *)(a2 + 26));
  if (*(_BYTE *)(a2 + 1864) && v7 >= 0xA && !*(_BYTE *)(a3 + 68256))
    return result;
  v8 = (unsigned __int8 *)(a3 + 20104);
  v9 = *result;
  if (g_Logging_Cfg >= 4)
  {
    v10 = 0;
    v11 = 67;
    do
    {
      *result = v9 + 1;
      *v9 = v11;
      v9 = *result;
      if (*result >= result[3])
      {
        v9 = result[2];
        *result = v9;
      }
      v11 = aCapSrch[++v10];
    }
    while (v10 != 8);
    sprintf_5d(result, gDebug);
    sprintf_5d(v4, DWORD1(gDebug));
    sprintf_5d(v4, xmmword_2579E5F80);
    sprintf_5d(v4, DWORD1(xmmword_2579E5F80));
    sprintf_5d(v4, DWORD2(xmmword_2579E5F80));
    v12 = 0;
    v13 = *v4;
    v14 = 32;
    do
    {
      *v4 = v13 + 1;
      *v13 = v14;
      v13 = *v4;
      if (*v4 >= v4[3])
      {
        v13 = v4[2];
        *v4 = v13;
      }
      v14 = aEll[++v12];
    }
    while (v12 != 4);
    sprintf_7f((uint64_t)v4, (int)(*(double *)&xmmword_2579E5F58 * 180.0 * 100.0 / 3.14159265), 3);
    sprintf_7f((uint64_t)v4, (int)(*((double *)&xmmword_2579E5F58 + 1) * 180.0 * 100.0 / 3.14159265), 3);
    sprintf_7d(v4, (int)(*(double *)&xmmword_2579E5F40 / 1000.0));
    sprintf_7d(v4, (int)(*((double *)&xmmword_2579E5F40 + 1) / 1000.0));
    sprintf_4d(v4, (int)*(double *)&qword_2579E5F50);
    v15 = 0;
    v16 = *v4;
    v17 = 32;
    do
    {
      *v4 = v16 + 1;
      *v16 = v17;
      v16 = *v4;
      if (*v4 >= v4[3])
      {
        v16 = v4[2];
        *v4 = v16;
      }
      v17 = aLsq[++v15];
    }
    while (v15 != 4);
    sprintf_2d(v4, dword_2579E5F6C);
    sprintf_2d(v4, dword_2579E5F68);
    sprintf_2d(v4, byte_2579E5F7D);
    sprintf_2d(v4, byte_2579E5F7E);
    v18 = *v4;
    v19 = 32;
    v20 = 1u;
    do
    {
      *v4 = v18 + 1;
      *v18 = v19;
      v18 = *v4;
      if (*v4 >= v4[3])
      {
        v18 = v4[2];
        *v4 = v18;
      }
      v19 = aIter[v20++];
    }
    while (v20 != 6);
    sprintf_3d(v4, byte_2579E5F70);
    sprintf_3d(v4, byte_2579E5F71);
    sprintf_3d(v4, byte_2579E5F72);
    v21 = *v4;
    v22 = 32;
    v23 = 1u;
    do
    {
      *v4 = v21 + 1;
      *v21 = v22;
      v21 = *v4;
      if (*v4 >= v4[3])
      {
        v21 = v4[2];
        *v4 = v21;
      }
      v22 = aSrchprls[v23++];
    }
    while (v23 != 10);
    sprintf_2d(v4, byte_2579E5F73);
    sprintf_4d(v4, byte_2579E5F74);
    sprintf_2d(v4, byte_2579E5F7C);
    v24 = (*v4)++;
    *v24 = 32;
    if (*v4 >= v4[3])
      *v4 = v4[2];
    if (dword_2579E5F78 >= 0)
      v25 = dword_2579E5F78;
    else
      v25 = -dword_2579E5F78;
    sprintf1da(v4, v25, v89, 0, dword_2579E5F78 >> 31);
    v26 = (*v4)++;
    *v26 = 10;
    v27 = *v4;
    if (*v4 >= v4[3])
      v27 = v4[2];
    v28 = 67;
    v29 = 1u;
    do
    {
      *v4 = v27 + 1;
      *v27 = v28;
      v27 = *v4;
      if (*v4 >= v4[3])
      {
        v27 = v4[2];
        *v4 = v27;
      }
      v28 = aCapVv[v29++];
    }
    while (v29 != 7);
    v30 = dword_2579E5F90;
    if (dword_2579E5F90 >= 9999)
      v30 = 9999;
    if (v30 <= -9999)
      v31 = -9999;
    else
      v31 = v30;
    sprintf_5d(v4, v31);
    v32 = dword_2579E5F98;
    if (dword_2579E5F98 >= 9999)
      v32 = 9999;
    if (v32 <= -9999)
      v33 = -9999;
    else
      v33 = v32;
    sprintf_5d(v4, v33);
    v34 = *v4;
    v35 = 32;
    v36 = 1u;
    do
    {
      *v4 = v34 + 1;
      *v34 = v35;
      v34 = *v4;
      if (*v4 >= v4[3])
      {
        v34 = v4[2];
        *v4 = v34;
      }
      v35 = aHv[v36++];
    }
    while (v36 != 4);
    v37 = HIDWORD(xmmword_2579E5F80);
    if (SHIDWORD(xmmword_2579E5F80) >= 9999)
      v37 = 9999;
    if (v37 <= -9999)
      v38 = -9999;
    else
      v38 = v37;
    sprintf_5d(v4, v38);
    v39 = dword_2579E5F94;
    if (dword_2579E5F94 >= 9999)
      v39 = 9999;
    if (v39 <= -9999)
      v40 = -9999;
    else
      v40 = v39;
    sprintf_5d(v4, v40);
    v41 = 0;
    v42 = *v4;
    v43 = 32;
    do
    {
      *v4 = v42 + 1;
      *v42 = v43;
      v42 = *v4;
      if (*v4 >= v4[3])
      {
        v42 = v4[2];
        *v4 = v42;
      }
      v43 = aA_0[++v41];
    }
    while (v41 != 2);
    v44 = dword_2579E5F9C;
    if (dword_2579E5F9C >= 9999)
      v44 = 9999;
    if (v44 <= -9999)
      v45 = -9999;
    else
      v45 = v44;
    sprintf_5d(v4, v45);
    v46 = *v4;
    v47 = 32;
    v48 = 1u;
    do
    {
      *v4 = v46 + 1;
      *v46 = v47;
      v46 = *v4;
      if (*v4 >= v4[3])
      {
        v46 = v4[2];
        *v4 = v46;
      }
      v47 = aR2[v48++];
    }
    while (v48 != 4);
    v49 = dword_2579E5F38;
    if (dword_2579E5F38 >= 9999)
      v49 = 9999;
    if (v49 <= -9999)
      v50 = -9999;
    else
      v50 = v49;
    sprintf_5d(v4, v50);
    v51 = (*v4)++;
    *v51 = 10;
    if (*v4 >= v4[3])
      *v4 = v4[2];
    xmmword_2579E5F80 = 0u;
    *(_OWORD *)&dword_2579E5F90 = 0u;
    *(__int128 *)((char *)&xmmword_2579E5F58 + 8) = 0u;
    *(_OWORD *)&byte_2579E5F70 = 0u;
    xmmword_2579E5F40 = 0u;
    *(_OWORD *)&qword_2579E5F50 = 0u;
    gDebug = 0u;
    unk_2579E5F30 = 0u;
    v9 = *v4;
    if (g_Logging_Cfg >= 4)
    {
      v52 = 67;
      v53 = 1u;
      do
      {
        *v4 = v9 + 1;
        *v9 = v52;
        v9 = *v4;
        if (*v4 >= v4[3])
        {
          v9 = v4[2];
          *v4 = v9;
        }
        v52 = aCapSv[v53++];
      }
      while (v53 != 7);
      sprintf_2d(v4, *(unsigned __int8 *)(v5 + 52));
      sprintf_2d(v4, *(unsigned __int8 *)(v5 + 53));
      sprintf_2d(v4, *(unsigned __int8 *)(v5 + 54));
      sprintf_2d(v4, *(unsigned __int8 *)(v5 + 55));
      v54 = (*v4)++;
      *v54 = 32;
      v55 = *v4;
      if (*v4 >= v4[3])
        v55 = v4[2];
      *v4 = v55 + 1;
      *v55 = 10;
      v9 = *v4;
      if (*v4 >= v4[3])
        v9 = v4[2];
    }
  }
  v56 = 0;
  v57 = 67;
  do
  {
    *v4 = v9 + 1;
    *v9 = v57;
    v9 = *v4;
    if (*v4 >= v4[3])
    {
      v9 = v4[2];
      *v4 = v9;
    }
    v57 = aCap[++v56];
  }
  while (v56 != 4);
  v58 = "pass";
  if (!*(_BYTE *)(v5 + 64))
    v58 = "fail";
  v59 = *v58;
  if (*v58)
  {
    v60 = (unsigned __int8 *)(v58 + 1);
    do
    {
      *v4 = v9 + 1;
      *v9 = v59;
      v9 = *v4;
      if (*v4 >= v4[3])
      {
        v9 = v4[2];
        *v4 = v9;
      }
      v61 = *v60++;
      v59 = v61;
    }
    while (v61);
  }
  v62 = 0;
  v63 = 32;
  do
  {
    *v4 = v9 + 1;
    *v9 = v63;
    v9 = *v4;
    if (*v4 >= v4[3])
    {
      v9 = v4[2];
      *v4 = v9;
    }
    v63 = aSv_0[++v62];
  }
  while (v62 != 4);
  sprintf_3d(v4, *(unsigned __int8 *)(v5 + 49));
  v64 = *v4;
  v65 = 32;
  v66 = 1u;
  do
  {
    *v4 = v64 + 1;
    *v64 = v65;
    v64 = *v4;
    if (*v4 >= v4[3])
    {
      v64 = v4[2];
      *v4 = v64;
    }
    v65 = aMs[v66++];
  }
  while (v66 != 6);
  sprintf_5d(v4, *(unsigned __int16 *)(v5 + 50));
  v68 = *(_DWORD *)(v5 + 56);
  v67 = *(_DWORD *)(v5 + 60);
  if (*(_QWORD *)(v5 + 56))
  {
    v69 = (5729 * v68) >> 15;
    v70 = (5729 * v67) >> 15;
    v71 = (double)v67 * 0.0000305175781 - *(double *)v5;
    v72 = *(double *)(v5 + 16);
    v73 = __sincos_stret((double)v68 * 0.0000305175781);
    v74 = v73.__cosval * *(double *)(v5 + 24);
    v75 = cos(v71) * v74 + v72 * v73.__sinval;
    if (fabs(v75) < 1.0)
    {
      v76 = (int)(acos(v75) * 6378.137);
      goto LABEL_118;
    }
  }
  else
  {
    v69 = 0;
    v70 = 0;
  }
  v76 = 0;
LABEL_118:
  sprintf_7f((uint64_t)v4, v69, 3);
  sprintf_7f((uint64_t)v4, v70, 3);
  sprintf_6d(v4, v76);
  v77 = *v4;
  for (i = 5; i > 1; --i)
  {
    *v4 = v77 + 1;
    *v77 = 32;
    v77 = *v4;
    if (*v4 >= v4[3])
    {
      v77 = v4[2];
      *v4 = v77;
    }
  }
  if (*(int *)(a2 + 20) >= 4 && (v79 = *(unsigned __int8 *)(v5 + 49), v79 >= 3))
  {
    v81 = "BAD ";
    if (v76 < 151)
      v81 = "GOOD";
    v82 = "bad ";
    if (v76 < 901)
      v82 = "good";
    if (v79 == 3)
      v80 = v82;
    else
      v80 = v81;
    if (!*(_BYTE *)(v5 + 64))
      v80 = "FAIL";
  }
  else
  {
    v80 = "SKIP";
  }
  v83 = *v80;
  if (*v80)
  {
    v84 = (unsigned __int8 *)(v80 + 1);
    do
    {
      *v4 = v77 + 1;
      *v77 = v83;
      v77 = *v4;
      if (*v4 >= v4[3])
      {
        v77 = v4[2];
        *v4 = v77;
      }
      v85 = *v84++;
      v83 = v85;
    }
    while (v85);
  }
  if (v6 >= 99)
    v86 = 99;
  else
    v86 = v6;
  if (v86 <= -99)
    v87 = -99;
  else
    v87 = v86;
  sprintf_5d(v4, v87);
  sprintf_3d(v4, *v8);
  result = (char **)sprintf1da(v4, v8[1], v89, 0, 0);
  v88 = (*v4)++;
  *v88 = 10;
  if (*v4 >= v4[3])
    *v4 = v4[2];
  return result;
}

void WGS84_ECEF2Geo(long double *a1, double *a2)
{
  double v3;
  long double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;

  v4 = *a1;
  v3 = a1[1];
  v5 = a1[2];
  v6 = v3 * v3 + v4 * v4;
  v7 = v5 * v5 * 2.45817226e-14;
  v9 = 3;
  v10 = 0.00669437999;
  do
  {
    v8 = v7 * 0.99330562;
    v10 = v10
        - (v10 * -0.0000896294469
         + v10 * v10 * (v6 * 2.45817226e-14 + v7 * 0.99330562 + -0.0000448147235 + (v8 + v8) * v10 + v8 * (v10 * v10))
         + -0.0000448147235)
        / ((v6 * 2.45817226e-14
          + v7 * 0.99330562
          + -0.0000448147235
          + v6 * 2.45817226e-14
          + v7 * 0.99330562
          + -0.0000448147235)
         * v10
         + v7 * 0.99330562 * 4.0 * (v10 * v10) * ((v8 + v8) * 3.0 + v10)
         + -0.0000896294469);
    --v9;
  }
  while (v9);
  v11 = v10 + 1.0;
  if (fabs(v4) >= 0.001 || fabs(v3) >= 0.001)
  {
    a2[1] = atan2(v3, v4);
  }
  else
  {
    a2[1] = 0.0;
    v12 = 0.0;
    if (fabs(v5) < 0.001)
      goto LABEL_9;
  }
  v12 = atan2(v5 * v11, sqrt(v6));
LABEL_9:
  *a2 = v12;
  a2[2] = (v10 * -148.379032 + 1.0) * sqrt(v7 + v6 * 2.45817226e-14 / (v11 * v11)) * 6378137.0;
}

uint64_t GncP11_01ConvertGnssID(int a1)
{
  uint64_t result;
  uint64_t v3;
  char __str[966];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  result = 1;
  switch(a1)
  {
    case 0:
      if (g_LbsOsaTrace_Config >= 2)
      {
        bzero(__str, 0x3C6uLL);
        v3 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx GNSSId,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "GNC", 87, "GncP11_01ConvertGnssID", 770, 0);
        gnssOsa_PrintLog(__str, 2, 1, 0);
      }
      result = 0;
      break;
    case 2:
      result = 2;
      break;
    case 3:
      result = 3;
      break;
    case 4:
      result = 4;
      break;
    case 5:
      result = 5;
      break;
    case 6:
      result = 6;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GncP11_05ConvertGnssSignalID(uint64_t a1)
{
  uint64_t result;
  unsigned int v3;
  int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  BOOL v8;

  result = 17;
  if ((int)a1 > 64)
  {
    if ((int)a1 > 81)
    {
      if ((_DWORD)a1 == 98)
        v4 = 114;
      else
        v4 = 17;
      if ((_DWORD)a1 == 97)
        v5 = 113;
      else
        v5 = v4;
      if ((_DWORD)a1 == 83)
        v6 = 99;
      else
        v6 = 17;
      if ((_DWORD)a1 == 82)
        v7 = 98;
      else
        v7 = v6;
      if ((int)a1 <= 96)
        return v7;
      else
        return v5;
    }
    else
    {
      switch((int)a1)
      {
        case 'A':
          result = 81;
          break;
        case 'B':
          result = 82;
          break;
        case 'C':
          result = 83;
          break;
        case 'D':
          result = 84;
          break;
        default:
          v8 = (_DWORD)a1 == 81;
          LODWORD(a1) = 97;
LABEL_33:
          if (v8)
            result = a1;
          else
            result = 17;
          break;
      }
    }
  }
  else if ((int)a1 <= 19)
  {
    if ((_DWORD)a1 == 19)
      v3 = 19;
    else
      v3 = 17;
    if ((_DWORD)a1 == 18)
      v3 = 18;
    if ((_DWORD)a1)
      return v3;
    else
      return 0;
  }
  else
  {
    switch((int)a1)
    {
      case '!':
      case '"':
      case '#':
      case '$':
      case '1':
      case '2':
      case '3':
      case '4':
        result = a1;
        break;
      case '%':
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '+':
      case ',':
      case '-':
      case '.':
      case '/':
      case '0':
        return result;
      default:
        v8 = (_DWORD)a1 == 20;
        goto LABEL_33;
    }
  }
  return result;
}

uint64_t GncP11_23ConvertUsrState(unsigned int a1)
{
  unsigned int v1;
  uint64_t v2;
  char __str[966];
  uint64_t v5;

  v1 = a1;
  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 6)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx UsrState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 87, "GncP11_23ConvertUsrState", 770, v1);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(v1) = 0;
  }
  return v1;
}

uint64_t GncP11_24ConvertGnssContent(unsigned int a1)
{
  unsigned int v1;
  uint64_t v2;
  char __str[966];
  uint64_t v5;

  v1 = a1;
  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 5)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx GnssCntnt,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 87, "GncP11_24ConvertGnssContent", 770, v1);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(v1) = 0;
  }
  return v1;
}

uint64_t GncP11_25ConvertReliab(unsigned int a1)
{
  unsigned int v1;
  uint64_t v2;
  char __str[966];
  uint64_t v5;

  v1 = a1;
  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 5)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Reliab,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 87, "GncP11_25ConvertReliab", 770, v1);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(v1) = 0;
  }
  return v1;
}

BOOL GncP11_30CheckUtcValidity(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  uint64_t v7;
  unint64_t v9;
  uint64_t v10;
  char __str[966];
  uint64_t v13;

  v7 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  if (a3 && a4 <= 0x17 && a5 <= 0x3B && a6 <= 0x3C && a7 <= 0x3E7)
  {
    if (a2 <= 0xC)
    {
      if (((1 << a2) & 0x15AA) != 0)
        return a3 <= 0x1F;
      if (((1 << a2) & 0xA50) != 0)
        return a3 <= 0x1E;
      if (a2 == 2)
      {
        if ((a1 & 3) == 0
          && ((HIDWORD(v9) = -1030792151 * a1, LODWORD(v9) = -1030792151 * a1, (v9 >> 2) > 0x28F5C28)
           || a1 == 400 * ((10737419 * (unint64_t)a1) >> 32)))
        {
          if (a3 > 0x1D)
            return 0;
        }
        else if (a3 > 0x1C)
        {
          return 0;
        }
        return 1;
      }
    }
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v10 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Month,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v10), "GNC", 87, "GncP11_30CheckUtcValidity", 770, a2);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    return 0;
  }
  return v7;
}

uint64_t GncP11_32ConvertEstimatedTech(unsigned int a1)
{
  unsigned int v1;
  uint64_t v2;
  char __str[966];
  uint64_t v5;

  v1 = a1;
  v5 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 4)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v2 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EstimTech,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v2), "GNC", 87, "GncP11_32ConvertEstimatedTech", 770, v1);
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    LOBYTE(v1) = 0;
  }
  return v1;
}

double GLON_RealAlm2RefState(__int16 a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  double result;
  float64x2_t v16;
  double v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)(a5 + 175) = 0u;
  *(_OWORD *)(a5 + 144) = 0u;
  *(_OWORD *)(a5 + 160) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  if (a3 >= 1)
    v10 = -1;
  else
    v10 = 86399;
  *(_OWORD *)(a5 + 80) = 0uLL;
  *(_OWORD *)(a5 + 96) = 0uLL;
  *(_OWORD *)(a5 + 48) = 0uLL;
  *(_OWORD *)(a5 + 64) = 0uLL;
  *(_OWORD *)(a5 + 32) = 0uLL;
  *(_OWORD *)a5 = 0uLL;
  *(_OWORD *)(a5 + 16) = 0uLL;
  GLON_RealAlm2ECEF((uint64_t)v18, (uint64_t)&v16, (double *)a4, v10 + a3, (__int16)(a2 - (a3 < 1)));
  GLON_RealAlm2ECEF(a5, a5 + 24, (double *)a4, a3, a2);
  *(float64x2_t *)(a5 + 48) = vsubq_f64(*(float64x2_t *)(a5 + 24), v16);
  *(double *)(a5 + 64) = *(double *)(a5 + 40) - v17;
  *(double *)(a5 + 96) = -*(double *)(a4 + 72);
  *(_QWORD *)(a5 + 104) = 0;
  *(_DWORD *)(a5 + 168) = a3;
  *(_WORD *)(a5 + 172) = a2;
  *(_WORD *)(a5 + 174) = a1;
  *(_DWORD *)(a5 + 176) = 2;
  *(_DWORD *)(a5 + 180) = *(_DWORD *)(a4 + 4);
  *(_WORD *)(a5 + 166) = 123;
  *(_BYTE *)(a5 + 188) = *(_BYTE *)(a4 + 10);
  *(_DWORD *)(a5 + 184) = 2;
  v11 = a2 - *(unsigned __int16 *)(a4 + 8);
  v12 = v11 + 1461;
  if (v11 >= -730)
    v12 = a2 - *(unsigned __int16 *)(a4 + 8);
  if (v11 <= 730)
    v13 = v12;
  else
    v13 = v11 - 1461;
  if (v13 < 0)
    v13 = -v13;
  if (v13 >= 0x281)
    v14 = 65500;
  else
    v14 = 100 * v13 + 1500;
  result = (double)(v14 * v14);
  *(double *)(a5 + 112) = result;
  return result;
}

uint64_t DD_Assist_GPS_Data(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  _BOOL4 v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  unsigned __int8 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  int v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  int v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  unsigned int v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  _OWORD *v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  int v65;
  uint64_t v66;
  __int128 *v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  __int16 v74;
  int v75;
  __int128 *v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int16 v82;
  int v83;
  __int128 *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int16 v89;
  int v90;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  _DWORD v96[2];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[17];
  int v101;
  char v102;
  __int128 v103;
  _OWORD v104[2];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[20];
  uint64_t v109;

  v5 = a2;
  v6 = 0;
  v109 = *MEMORY[0x24BDAC8D0];
  v94 = result + 224;
  v95 = result;
  v92 = result + 192;
  v93 = a2 - 241;
  do
  {
    if (*(_BYTE *)(*(_QWORD *)(a3 + 64) + v6)
      && *(int *)(a3 + 116 * v6 + 124) >= 6
      && (v93 - *(_DWORD *)(a3 + 116 * v6 + 120)) > 0xFFFFF806)
    {
      goto LABEL_39;
    }
    v107 = 0u;
    memset(v108, 0, 19);
    v105 = 0u;
    v106 = 0u;
    memset(v104, 0, sizeof(v104));
    v103 = 0u;
    result = Core_Get_GPS_Eph((v6 + 1), v5, (int *)&v103);
    if (!(_DWORD)result)
      goto LABEL_39;
    v7 = *(_QWORD *)(a3 + 64);
    if (*(_BYTE *)(v7 + v6))
    {
      v8 = *(_DWORD *)(a3 + 116 * v6 + 124);
      if (SDWORD1(v103) <= v8)
      {
        v9 = *(_DWORD *)(a3 + 116 * v6 + 120);
        v10 = (int)v103 > v9 && DWORD1(v103) == v8;
        if (!v10 && (int)v5 - v9 > -1801)
          goto LABEL_39;
      }
    }
    v11 = v5;
    v12 = DWORD2(v103);
    v13 = v108[12];
    v14 = v108[12] == 0;
    if (*(_BYTE *)(v7 + v6))
    {
      v15 = a3 + 116 * v6;
      v17 = *(_DWORD *)(v15 + 120);
      v16 = (_DWORD *)(v15 + 120);
      if ((int)v103 - v17 <= 10799)
      {
        v18 = v108[12] == 0;
        v19 = *(_QWORD *)(a3 + 64);
        result = Is_GPS_BinEph_Real((uint64_t)v16);
        v7 = v19;
        v14 = v18;
        if ((_DWORD)result)
        {
          result = Is_GPS_BinEph_Real((uint64_t)&v103);
          v7 = v19;
          v14 = v18;
          if ((result & 1) == 0)
          {
            v5 = v11;
            *v16 = v11;
            goto LABEL_39;
          }
        }
      }
    }
    v20 = 0xE4FE7F3uLL >> ((v12 >> 2) & 0x1F);
    v21 = v20 & 1;
    v22 = *(_OWORD **)a3;
    if (*(_BYTE *)(*(_QWORD *)a3 + v6) || !(v20 & 1 | (v13 == 0)))
    {
      v5 = v11;
    }
    else
    {
      v23 = *(_QWORD *)(a3 + 80);
      v5 = v11;
      if (*(_BYTE *)(v23 + v6))
      {
        v24 = a3 + 44 * v6;
        v25 = 0xE4FE7F3uLL >> (*(_DWORD *)(v24 + 7564) & 0x1F);
        v26 = *(_DWORD *)(v24 + 7544);
        v27 = v6 + 1;
        if ((v25 & 1) != 0 || v26 + 3600 <= (int)v11)
        {
          if (v26 + 100 < (int)v11)
          {
            *(_BYTE *)(*(_QWORD *)(a3 + 40) + v6) = 0;
            *(_BYTE *)(v23 + v6) = 0;
            *(_BYTE *)(v92 + v6) = -1;
            v7 = *(_QWORD *)(a3 + 64);
            v22 = *(_OWORD **)a3;
          }
        }
        else
        {
          v21 = 0;
          v14 = 0;
        }
        goto LABEL_25;
      }
    }
    v27 = v6 + 1;
LABEL_25:
    v28 = v107;
    v29 = a3 + 116 * v6;
    *(_OWORD *)(v29 + 184) = v106;
    *(_OWORD *)(v29 + 200) = v28;
    *(_OWORD *)(v29 + 216) = *(_OWORD *)v108;
    v30 = v104[0];
    *(_OWORD *)(v29 + 120) = v103;
    *(_OWORD *)(v29 + 136) = v30;
    v31 = v105;
    *(_OWORD *)(v29 + 152) = v104[1];
    *(_DWORD *)(v29 + 232) = *(_DWORD *)&v108[16];
    *(_OWORD *)(v29 + 168) = v31;
    *(_BYTE *)(*(_QWORD *)(a3 + 32) + v6) = 1;
    *(_BYTE *)(v7 + v6) = 1;
    *((_BYTE *)v22 + v6) = v21;
    if (v21)
      v32 = 1;
    else
      v32 = 2;
    v33 = *(_QWORD *)(a3 + 16);
    if (*(_DWORD *)(v29 + 124) == 5)
    {
      *(_DWORD *)(v33 + 20 * v6 + 8) = v32;
      *(_BYTE *)(*(_QWORD *)(a3 + 8) + v6) = v14;
      if (v14)
        v34 = 1;
      else
        v34 = 2;
      *(_DWORD *)(*(_QWORD *)(a3 + 24) + 20 * v6 + 8) = v34;
    }
    else
    {
      *(_DWORD *)(v33 + 20 * v6 + 12) = v32;
    }
    if ((int)v5 >= 1)
    {
      *(_BYTE *)(*(_QWORD *)(a3 + 88) + v6) = 1;
      result = Core_Save_GPS_Eph(v27, 0, (__int128 *)(v29 + 120));
      v22 = *(_OWORD **)a3;
    }
    v35 = 0;
    LODWORD(v36) = 0;
    v37 = p_NV;
    v38 = v22[1];
    *(_OWORD *)(p_NV + 100) = *v22;
    *(_OWORD *)(v37 + 116) = v38;
    v39 = v37 + 96;
    v40 = -9871;
    do
    {
      v41 = *(unsigned __int8 *)(v39 + v35) ^ HIBYTE(v40);
      v40 = -12691 * (v40 + (*(unsigned __int8 *)(v39 + v35) ^ HIBYTE(v40))) + 22719;
      v36 = (v36 + v41);
      ++v35;
    }
    while (v35 != 40);
    *(_QWORD *)(v37 + 88) = v36;
    v42 = v95 + 6 * v6;
    *(_DWORD *)v42 = 16777472;
    *(_WORD *)(v42 + 4) = 256;
    *(_WORD *)(v94 + 2 * v6) = 256;
LABEL_39:
    ++v6;
  }
  while (v6 != 32);
  v43 = a4;
  if ((int)v5 >= 1)
  {
    for (i = 0; i != 32; ++i)
    {
      if (*(_BYTE *)(*(_QWORD *)a3 + i)
        && !*(_BYTE *)(*(_QWORD *)(v43 + 1592) + i)
        && (!*(_BYTE *)(*(_QWORD *)(a3 + 72) + i) || (int)v5 - *(_DWORD *)(a3 + 116 * i + 3832) >= 241))
      {
        v107 = 0u;
        memset(v108, 0, 19);
        v105 = 0u;
        v106 = 0u;
        memset(v104, 0, sizeof(v104));
        v103 = 0u;
        result = EE_Get_GPS_BinEph((XofSvcsIf *)(i + 1), v5, (uint64_t)&v103);
        v45 = *(_QWORD *)(a3 + 72);
        if (!(_DWORD)result || (v46 = v103, *(_BYTE *)(v45 + i)) && (int)v103 <= *(_DWORD *)(a3 + 116 * i + 3832))
        {
          *(_BYTE *)(v45 + i) = 0;
        }
        else
        {
          v47 = a3 + 116 * i;
          *(_DWORD *)(v47 + 3944) = *(_DWORD *)&v108[16];
          v48 = v104[0];
          *(_OWORD *)(v47 + 3832) = v103;
          *(_OWORD *)(v47 + 3848) = v48;
          v49 = v105;
          *(_OWORD *)(v47 + 3864) = v104[1];
          *(_OWORD *)(v47 + 3880) = v49;
          v50 = *(_OWORD *)v108;
          v51 = v106;
          *(_OWORD *)(v47 + 3912) = v107;
          *(_OWORD *)(v47 + 3928) = v50;
          *(_OWORD *)(v47 + 3896) = v51;
          *(_BYTE *)(*(_QWORD *)(a3 + 32) + i) = 1;
          *(_BYTE *)(v45 + i) = 1;
          v52 = v95 + 6 * i;
          *(_DWORD *)v52 = 16777472;
          *(_WORD *)(v52 + 4) = 256;
          *(_WORD *)(v94 + 2 * i) = 256;
          v99 = 0u;
          *(_OWORD *)v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          v96[0] = v46;
          v96[1] = DWORD1(v103);
          LOBYTE(v97) = BYTE8(v103);
          v53 = 21;
          v54 = 11;
          v55 = (char *)v104 + 8;
          *(_WORD *)((char *)&v97 + 1) = *(_WORD *)((char *)&v103 + 9);
          do
          {
            v56 = (char *)v96 + v54;
            *v56 = *v55;
            *(_WORD *)(v56 + 1) = *(_WORD *)(v55 + 1);
            v55 += 4;
            --v53;
            v54 += 3;
          }
          while (v53 > 1);
          *(_WORD *)&v100[15] = *(_WORD *)&v108[12];
          v101 = *(_DWORD *)&v108[14];
          v102 = v108[18];
          result = Debug_Log_GPS_Eph(2, (int)i + 1, (uint64_t)v96);
        }
        v43 = a4;
      }
    }
  }
  v57 = 0;
  v103 = 0u;
  memset(v104, 0, 28);
  while (2)
  {
    if (!*(_BYTE *)(*(_QWORD *)(a3 + 80) + v57) || (int)v5 - *(_DWORD *)(a3 + 44 * v57 + 7544) >= 1801)
    {
      *(_OWORD *)((unint64_t)&v103 | 0xC) = 0u;
      *(_OWORD *)(((unint64_t)&v103 | 0xC) + 0x10) = 0u;
      result = Core_Get_GPS_Alm((v57 + 1), v5, (uint64_t)&v103);
      if ((_DWORD)result)
      {
        v58 = *(_QWORD *)(a3 + 80);
        if (!*(_BYTE *)(v58 + v57) || (int)v103 > *(_DWORD *)(a3 + 44 * v57 + 7544))
        {
          v59 = (0xE4FE7F3uLL >> (BYTE4(v104[0]) & 0x1F)) & 1;
          v60 = *(_OWORD **)a3;
          if (*(_BYTE *)(*(_QWORD *)a3 + v57))
            v61 = 1;
          else
            v61 = v59 == 0;
          if (!v61)
          {
            v62 = *(_QWORD *)(a3 + 64);
            if (*(_BYTE *)(v62 + v57))
            {
              v63 = a3 + 116 * v57;
              v64 = 0xE4FE7F3uLL >> (((unint64_t)*(unsigned int *)(v63 + 128) >> 2) & 0x1F);
              v65 = *(_DWORD *)(v63 + 120);
              if ((v64 & 1) == 0 && v65 + 3600 > (int)v5)
              {
                LOBYTE(v59) = 0;
                goto LABEL_76;
              }
              if (v65 + 100 < (int)v5)
              {
                *(_BYTE *)(*(_QWORD *)(a3 + 32) + v57) = 0;
                *(_BYTE *)(v62 + v57) = 0;
                v66 = v95 + 6 * v57;
                *(_DWORD *)v66 = 16777472;
                *(_WORD *)(v66 + 4) = 256;
                *(_WORD *)(v94 + 2 * v57) = 256;
              }
            }
            LOBYTE(v59) = 1;
          }
LABEL_76:
          v67 = (__int128 *)(a3 + 44 * v57 + 7544);
          v68 = v104[0];
          *v67 = v103;
          v67[1] = v68;
          *(__int128 *)((char *)v67 + 28) = *(_OWORD *)((char *)v104 + 12);
          *(_BYTE *)(*(_QWORD *)(a3 + 40) + v57) = 1;
          *(_BYTE *)(v58 + v57) = 1;
          *((_BYTE *)v60 + v57) = v59;
          if ((int)v5 >= 1)
          {
            result = Core_Save_GPS_Alm((v57 + 1), 0, v67);
            v60 = *(_OWORD **)a3;
          }
          v69 = 0;
          LODWORD(v70) = 0;
          v71 = p_NV;
          v72 = v60[1];
          *(_OWORD *)(p_NV + 100) = *v60;
          *(_OWORD *)(v71 + 116) = v72;
          v73 = v71 + 96;
          v74 = -9871;
          do
          {
            v75 = *(unsigned __int8 *)(v73 + v69) ^ HIBYTE(v74);
            v74 = -12691 * (v74 + (*(unsigned __int8 *)(v73 + v69) ^ HIBYTE(v74))) + 22719;
            v70 = (v70 + v75);
            ++v69;
          }
          while (v69 != 40);
          *(_QWORD *)(v71 + 88) = v70;
          *(_BYTE *)(v92 + v57) = -1;
        }
      }
    }
    if (++v57 != 32)
      continue;
    break;
  }
  v103 = 0uLL;
  v76 = (__int128 *)(a3 + 8952);
  if ((*(_DWORD *)(a3 + 8956) - 4) > 2 || (int)v5 - *(_DWORD *)v76 >= 1801)
  {
    result = Core_Get_GPS_Klob(v5, &v103);
    v77 = *(_DWORD *)(a3 + 8956);
    if ((_DWORD)result)
    {
      if ((v77 - 4) > 2 || (int)v103 > *(_DWORD *)v76)
      {
        *v76 = v103;
        if ((int)v5 >= 1 && *(_DWORD *)(a3 + 8956) != 3)
        {
          v78 = 0;
          LODWORD(v79) = 0;
          v80 = p_NV;
          *(_OWORD *)(p_NV + 144) = v103;
          v81 = v80 + 144;
          v82 = -9871;
          do
          {
            v83 = *(unsigned __int8 *)(v81 + v78) ^ HIBYTE(v82);
            v82 = -12691 * (v82 + (*(unsigned __int8 *)(v81 + v78) ^ HIBYTE(v82))) + 22719;
            v79 = (v79 + v83);
            ++v78;
          }
          while (v78 != 16);
          *(_QWORD *)(v80 + 136) = v79;
        }
      }
    }
    else if ((int)v5 >= 901 && !v77)
    {
      *(_DWORD *)(a3 + 8952) = v5 - 1209600;
      *(_QWORD *)(a3 + 8960) = 0xFAFF0427FFFF0205;
      *(_DWORD *)(a3 + 8956) = 1;
      result = (uint64_t)EvLog("DD_Assist_GPS_Ion:  Iono Model missing, default used.");
    }
  }
  v103 = 0uLL;
  *(_QWORD *)&v104[0] = 0;
  v84 = (__int128 *)(a3 + 8968);
  if ((*(_DWORD *)(a3 + 8972) - 4) > 2 || (int)v5 - *(_DWORD *)v84 >= 1801)
  {
    result = Core_Get_GPS_UTC(v5, (uint64_t)&v103);
    if ((_DWORD)result)
    {
      if ((*(_DWORD *)(a3 + 8972) - 4) > 2 || (int)v103 > *(_DWORD *)v84)
      {
        *v84 = v103;
        *(_QWORD *)(a3 + 8984) = *(_QWORD *)&v104[0];
        if ((int)v5 >= 1 && *(_DWORD *)(a3 + 8972) != 3)
        {
          v85 = 0;
          LODWORD(v86) = 0;
          v87 = p_NV;
          *(_OWORD *)(p_NV + 168) = v103;
          *(_QWORD *)(v87 + 184) = *(_QWORD *)&v104[0];
          v88 = v87 + 168;
          v89 = -9871;
          do
          {
            v90 = *(unsigned __int8 *)(v88 + v85) ^ HIBYTE(v89);
            v89 = -12691 * (v89 + (*(unsigned __int8 *)(v88 + v85) ^ HIBYTE(v89))) + 22719;
            v86 = (v86 + v90);
            ++v85;
          }
          while (v85 != 24);
          *(_QWORD *)(v87 + 160) = v86;
        }
      }
    }
  }
  return result;
}

uint64_t EE_Get_GPS_BinEph(XofSvcsIf *a1, int a2, uint64_t a3)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  int v7;
  char v8;
  int v9;
  char v10;
  __int16 v11;
  char v12;
  __int128 v13;
  uint64_t v14;
  __int16 v15;
  __int128 v16;
  __int128 v17;
  __int16 v18;
  int v19;
  _DWORD v20[3];
  char v21;
  __int16 v22;
  char v23;
  __int128 v24;
  uint64_t v25;
  __int16 v26;
  __int128 v27;
  __int128 v28;
  __int16 v29;
  int v30;
  char v31[24];
  uint64_t v32;

  v4 = (int)a1;
  v32 = *MEMORY[0x24BDAC8D0];
  strcpy(v31, "GN_EE_Get_GPS_Eph_El: ");
  if (((_BYTE)a1 + 53) > 0xF5u || ((_BYTE)a1 - 33) > 0xDFu)
  {
    result = GN_EE_Get_GPS_Eph_El(a1, (unsigned __int16)(((1861606989 * a2) >> 50) + ((unint64_t)(1861606989 * a2) >> 63)), a2- 604800* (unsigned __int16)(((1861606989 * a2) >> 50)+ ((unint64_t)(1861606989 * a2) >> 63)), (uint64_t)&v8);
    if ((_DWORD)result)
    {
      v20[2] = v9;
      v21 = v10;
      v22 = v11;
      v23 = v12;
      v24 = v13;
      v25 = v14;
      v26 = v15;
      v27 = v16;
      v28 = v17;
      v29 = v18;
      v30 = v19;
      v6 = *(_QWORD *)(p_api + 48);
      if (*(_BYTE *)(v6 + 16) && *(int *)v6 >= 3)
        v7 = (int)*(double *)(v6 + 32) + 604800 * *(__int16 *)(v6 + 28);
      else
        v7 = 0;
      v20[0] = v7;
      v20[1] = 6;
      if (g_Logging_Cfg < 5)
        EvLog_v("%s  %d", v31, v4);
      else
        EvLog_GPS_IntEph(v31, v4, (uint64_t)v20);
      result = Is_GPS_IntEph_Valid((uint64_t)v31, v4, (uint64_t)v20);
      if ((_DWORD)result)
      {
        GPS_EphInt2Bin((uint64_t)v20, a3);
        return 1;
      }
    }
  }
  else
  {
    EvCrt_v("EE_Get_GLON_GPS_BinEph:  FAILED:  SV = %d, Out of range !", (_DWORD)a1);
    return 0;
  }
  return result;
}

uint64_t EE_Get_GLON_GPS_BinEph(XofSvcsIf *a1, int a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  uint64_t v6;
  int v7;
  char v8;
  int v9;
  char v10;
  __int16 v11;
  char v12;
  __int128 v13;
  uint64_t v14;
  __int16 v15;
  __int128 v16;
  __int128 v17;
  _DWORD v18[3];
  char v19;
  __int16 v20;
  char v21;
  __int128 v22;
  uint64_t v23;
  __int16 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  __int16 v28;
  char v29[40];
  uint64_t v30;

  v3 = (int)a1;
  v30 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  v27 = 0;
  strcpy(v29, "GN_EE_Get_GLON_GPS_Eph_El: ");
  if (((_BYTE)a1 - 25) > 0xE7u)
  {
    result = GN_EE_Get_GLON_GPS_Eph_El(a1, (unsigned __int16)(((1861606989 * a2) >> 50) + ((unint64_t)(1861606989 * a2) >> 63)), a2- 604800* (unsigned __int16)(((1861606989 * a2) >> 50)+ ((unint64_t)(1861606989 * a2) >> 63)), (uint64_t)&v8);
    if ((_DWORD)result)
    {
      v18[2] = v9;
      v19 = v10;
      v20 = v11;
      v21 = v12;
      v22 = v13;
      v23 = v14;
      v24 = v15;
      v25 = v16;
      v26 = v17;
      v6 = *(_QWORD *)(p_api + 48);
      if (*(_BYTE *)(v6 + 16) && *(int *)v6 >= 3)
        v7 = (int)*(double *)(v6 + 32) + 604800 * *(__int16 *)(v6 + 28);
      else
        v7 = 0;
      v18[0] = v7;
      v18[1] = 6;
      if (g_Logging_Cfg < 5)
        EvLog_v("%s  %d", v29, v3);
      else
        EvLog_GPS_IntEph(v29, v3, (uint64_t)v18);
      result = Is_GPS_IntEph_Valid((uint64_t)v29, v3, (uint64_t)v18);
      if ((_DWORD)result)
      {
        GPS_EphInt2Bin((uint64_t)v18, a3);
        return 1;
      }
    }
  }
  else
  {
    EvCrt_v("EE_Get_GLON_GPS_BinEph:  FAILED:  SV = %d < %d || > %d, Out of range !", (_DWORD)a1, 1, 24);
    return 0;
  }
  return result;
}

uint64_t EE_Get_GAL_IntEph(XofSvcsIf *a1, int a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  __int128 v22;
  uint64_t v23;
  int v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  __int16 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  uint64_t v32;

  v3 = (int)a1;
  v32 = *MEMORY[0x24BDAC8D0];
  if (((_BYTE)a1 - 37) <= 0xDBu)
  {
    EvCrt_v("EE_Get_GAL_IntEph:  FAILED:  SV = %d, Out of range !");
    return 0;
  }
  if (a2 < 619315200)
    return 0;
  result = GN_EE_Get_GAL_Eph_El(a1, (unsigned __int16)(a2 / 0x93A80u - 1024), a2 % 0x93A80u, (uint64_t)&v20);
  if (!(_DWORD)result)
    return result;
  if (g_Logging_Cfg < 5)
    EvLog_d("GN_EE_Get_GAL_Eph_El: ", v3);
  else
    EvLog_nd("GN_EE_Get_GAL_Eph_El: ", 34, SHIWORD(v25), v20, WORD2(v20), BYTE6(v20), HIBYTE(v20), (unsigned __int16)v21, HIWORD(v21), v22, DWORD1(v22), DWORD2(v22), HIDWORD(v22), v23, HIDWORD(v23), v24, (__int16)v25, SWORD1(v25), SWORD2(v25),
      SWORD3(v25),
      SWORD4(v25),
      SWORD5(v25),
      SWORD6(v25),
      SHIWORD(v25),
      WORD1(v27),
      v26,
      HIDWORD(v26),
      (__int16)v27,
      SWORD2(v27),
      SHIWORD(v27),
      v28,
      BYTE1(v28),
      BYTE2(v28),
      HIBYTE(v28),
      v29,
      HIBYTE(v29),
      v30,
      (__int16)v25,
      HIWORD(v21),
      (unsigned __int16)v21,
      HIBYTE(v20),
      BYTE6(v20),
      WORD2(v20));
  v6 = BYTE6(v20) - 37;
  v7 = v6 < 0xFFFFFFDC;
  if (v6 <= 0xFFFFFFDB)
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  SVid = %d, Out of range !", BYTE6(v20));
  if (v20 > 0x93A7F)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  WeekNo = %d >= 604800, Out of range !", v20);
    v7 = 1;
  }
  if (WORD2(v20) >= 0x1000u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  WeekNo = %d >= 4096, Out of range !", WORD2(v20));
    v7 = 1;
  }
  v8 = BYTE6(v20);
  if (BYTE6(v20) >= 0x41u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  SVid = %d > 2^6, Out of range !", BYTE6(v20));
    v8 = BYTE6(v20);
    v7 = 1;
  }
  if (v8 >= 0x25)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  SVid = %d > 36, Unrealistic value !", v8);
    v7 = 1;
  }
  if (WORD1(v27) >> 5 >= 0x13Bu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  toc = %d > 10079, Out of range !", WORD1(v27));
    v7 = 1;
  }
  if (HIWORD(v21) >> 5 >= 0x13Bu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  toe = %d > 10079, Out of range !", HIWORD(v21));
    v7 = 1;
  }
  if ((unsigned __int16)v21 >= 0x400u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  IODnav = %d > 1023, Out of range !", (unsigned __int16)v21);
    v7 = 1;
  }
  HIDWORD(v9) = 1067366481;
  if (((BYTE6(v20) - 14) & 0xFB) != 0)
    v10 = 0.03;
  else
    v10 = 0.25;
  LODWORD(v9) = DWORD1(v22);
  v11 = (double)v9;
  v12 = v11 * 1.16415322e-10;
  if (v11 * 1.16415322e-10 < 0.0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  e = %g  < %g, Unrealistic value !", v11 * 1.16415322e-10, 0.0);
    v7 = 1;
  }
  if (v12 > v10)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  e = %g  > %g, Unrealistic value !", v12, v10);
    v7 = 1;
  }
  LODWORD(v11) = DWORD2(v22);
  v13 = (double)*(unint64_t *)&v11 * 0.00000190734863;
  if (v13 < 4800.0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  sqrtA = %g  < %g, Unrealistic value !", v13, 4800.0);
    v7 = 1;
  }
  if (v13 > 5800.0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  sqrtA = %g  > %g, Unrealistic value !", v13, 5800.0);
    v7 = 1;
  }
  if ((v24 - 0x800000) >> 24 != 255)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  OmegaDot = %d < -2^23 || >= 2^23, Out of range !");
LABEL_43:
    v7 = 1;
    goto LABEL_44;
  }
  v14 = (double)v24 * 3.57157734e-13;
  if (v14 < -0.00000198862815)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  OmegaDot = %e  < %e rad/s, Unrealistic value !");
    goto LABEL_43;
  }
  if (v14 > 0.0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  OmegaDot = %e  > %e rad/s, Unrealistic value !");
    goto LABEL_43;
  }
LABEL_44:
  if ((unsigned __int16)((unsigned __int16)(v25 - 0x2000) >> 14) <= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  IDOT = %d < -2^13 || >= 2^13, Out of range !", (__int16)v25);
    v7 = 1;
  }
  if ((int)v26 - 0x40000000 >= 0)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  af0 = %d < -2^30 || >= 2^30, Out of range !", v26);
    v7 = 1;
  }
  if ((HIDWORD(v26) - 0x100000) >> 21 != 2047)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  af1 = %d < -2^20 || >= 2^20, Out of range !", HIDWORD(v26));
    v7 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(v27 - 32) >> 6) <= 0x3FEu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  af2 = %d < -2^5 || >= 2^5, Out of range !", (__int16)v27);
    v7 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(WORD2(v27) - 512) >> 10) <= 0x3Eu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  bgdE1E5b = %d < -2^9 || >= 2^9, Out of range !", SWORD2(v27));
    v7 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(HIWORD(v27) - 512) >> 10) <= 0x3Eu)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  bgdE1E5a = %d < -2^9 || >= 2^9, Out of range !", SHIWORD(v27));
    v7 = 1;
  }
  if (v28 >= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  Model_ID = %d < 0 || > 1, Out of range !", v28);
    v7 = 1;
  }
  if (BYTE1(v28) >= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E5a_Nav_DVS = %d < 0 || > 1, Out of range !", BYTE1(v28));
    v7 = 1;
  }
  if (BYTE2(v28) >= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:   E5b_Nav_DVS = %d < 0 || > 1, Out of range !", BYTE2(v28));
    v7 = 1;
  }
  if (HIBYTE(v28) >= 2u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E1B_Nav_DVS = %d < 0 || > 1, Out of range !", HIBYTE(v28));
    v7 = 1;
  }
  if (v29 >= 4u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E5a_Sig_HS = %d < 0 || > 3, Out of range !", v29);
    v7 = 1;
  }
  if (HIBYTE(v29) >= 4u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E5b_Sig_HS = %d < 0 || > 3, Out of range !", HIBYTE(v29));
    v7 = 1;
  }
  v15 = v30;
  if (v30 > 3u)
  {
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  E1B_Sig_HS = %d < 0 || > 1, Out of range !", v30);
    if (v31 < 7u)
      return 0;
    goto LABEL_72;
  }
  v16 = v31;
  if (v31 > 6u)
  {
LABEL_72:
    EvCrt_v("GN_EE_Get_GAL_Eph_El:  FAILED:  Fit_hours = %d > 6, Out of range !");
    return 0;
  }
  if (v7)
    return 0;
  v17 = *(_QWORD *)(p_api + 48);
  if (*(_BYTE *)(v17 + 16) && *(int *)v17 >= 3)
    v18 = (int)*(double *)(v17 + 32) + 604800 * *(__int16 *)(v17 + 28);
  else
    v18 = 0;
  *(_DWORD *)a3 = v18;
  *(_DWORD *)(a3 + 4) = 6;
  *(_QWORD *)(a3 + 8) = v20;
  *(_DWORD *)(a3 + 16) = v21;
  *(_OWORD *)(a3 + 20) = v22;
  *(_QWORD *)(a3 + 36) = v23;
  *(_DWORD *)(a3 + 44) = v24;
  *(_OWORD *)(a3 + 48) = v25;
  v19 = v27;
  *(_QWORD *)(a3 + 64) = v26;
  *(_QWORD *)(a3 + 72) = v19;
  *(_DWORD *)(a3 + 80) = v28;
  *(_WORD *)(a3 + 84) = v29;
  *(_BYTE *)(a3 + 86) = v15;
  result = 1;
  *(_BYTE *)(a3 + 87) = v16;
  return result;
}

uint64_t EE_Get_BDS_CNAV_IntEph(XofSvcsIf *a1, unsigned int a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  unsigned int v6;
  __int16 v7;
  unsigned int v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  unsigned __int8 v13;
  char v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  int v18;
  __int128 v19;
  int v20;
  unsigned int v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  unsigned __int16 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  int v30;
  __int16 v31;
  int v32;
  __int128 v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  int v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  char v41;
  char v42;
  uint64_t v43;

  v3 = (int)a1;
  v43 = *MEMORY[0x24BDAC8D0];
  if (((_BYTE)a1 - 64) <= 0xC0u)
  {
    EvCrt_v("EE_Get_BDS_CNAV_IntEph:  FAILED:  SV = %d, Out of range !");
    return 0;
  }
  if ((int)a2 < 820713600)
    return 0;
  v6 = a2 % 0x93A80;
  if (a2 % 0x93A80 < 0xE)
    v7 = -1357;
  else
    v7 = -1356;
  if (v6 < 0xE)
    v6 = a2 % 0x93A80 + 604800;
  result = GN_EE_Get_BDS_CNAV_Eph_El(a1, (unsigned __int16)(v7 + a2 / 0x93A80), v6 - 14, (uint64_t)&v20);
  if (!(_DWORD)result)
    return result;
  if (g_Logging_Cfg < 5)
    EvLog_d("GN_EE_Get_BDS_CNAV_Eph_El: ", v3);
  else
    EvLog_v("%s %2u %2u %1u %1u %6u  %4u %4u %4u %4u  %9d %8d  %6d %8d  %11D %11U %11D %11D %11D  %7d %6d  %6d %6d %8d %8d %8d %8d   %9d %8d %5d %5u  %2u %1u %1u %2u  %5d %5d %5d %5d  %1u %1u %1u %1u %1u %1u  %1d  %4d", "GN_EE_Get_BDS_CNAV_Eph_El: ", v20, BYTE1(v20), BYTE2(v20), HIBYTE(v20), v21, v22, v23, v24, v25, v26, DWORD1(v26), DWORD2(v26), HIDWORD(v26), v27, v28, v29,
      v30,
      v31,
      (__int16)v32,
      SHIWORD(v32),
      v33,
      DWORD1(v33),
      DWORD2(v33),
      HIDWORD(v33),
      v34,
      HIDWORD(v34),
      (__int16)v35,
      HIWORD(v35),
      v36,
      BYTE1(v36),
      BYTE2(v36),
      HIBYTE(v36),
      (__int16)v37,
      SWORD1(v37),
      SWORD2(v37),
      SHIWORD(v37),
      v38,
      BYTE1(v38),
      BYTE2(v38),
      HIBYTE(v38),
      v39,
      v40,
      v41,
      v42,
      HIWORD(v35),
      (__int16)v35,
      SHIWORD(v32),
      (__int16)v32,
      v31,
      v29,
      v25,
      v24,
      v23,
      v22,
      HIBYTE(v20),
      BYTE2(v20),
      BYTE1(v20),
      v20);
  v8 = v20 - 64;
  v9 = v8 < 0xFFFFFFC1;
  if (v8 <= 0xFFFFFFC0)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El:  FAILED:  SVid = %d, Out of range !", v20);
    if (v20 - 64 <= 0xFFFFFFC0)
      EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SVid = %d <1 or >%d, Out of range!", v20, 63);
  }
  if (BYTE1(v20) >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SatH1 = %d >1, Out of range!", BYTE1(v20));
    v9 = 1;
  }
  if (BYTE2(v20) >= 4u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SV_type = %d >3, Out of range!", BYTE2(v20));
    v9 = 1;
  }
  if (HIBYTE(v20) >= 7u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Fit_hours = %d >6, Out of range!", HIBYTE(v20));
    v9 = 1;
  }
  if (v21 >> 7 >= 0x627)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: sSOW = %d >201599, Out of range!", v21);
    v9 = 1;
  }
  if (v22 >= 0x2000u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Week = %d >=8191, Out of range!", v22);
    v9 = 1;
  }
  if (v23 >= 0x83Bu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: toe = %d >2106, Out of range!", v23);
    v9 = 1;
  }
  if (v24 >= 0x83Bu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: toc = %d >2106, Out of range!", v24);
    v9 = 1;
  }
  if (v25 >= 0x83Bu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: top = %d >2106, Out of range!", v25);
    v9 = 1;
  }
  if ((v26 - 0x2000000) >> 26 != 63)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: delta_A = %d <-2^25 or >=2^25, Out of range!", (_DWORD)v26);
    v9 = 1;
  }
  if ((DWORD1(v26) - 0x1000000) >> 25 != 127)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: A_dot = %d <-2^24 or >=2^24, Out of range!", DWORD1(v26));
    v9 = 1;
  }
  if ((DWORD2(v26) - 0x2000000) >> 26 != 63)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: dN = %d <-2^25 or >=2^25, Out of range!", DWORD2(v26));
    v9 = 1;
  }
  if ((HIDWORD(v26) - 0x400000) >> 23 != 511)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: dN_dot = %d <-2^22 or >=2^22, Out of range!", HIDWORD(v26));
    v9 = 1;
  }
  if ((unint64_t)(v27 - 0x100000000) <= 0xFFFFFFFDFFFFFFFFLL)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: M0 = %d <-2^32 or >=2^32, Out of range!", (_DWORD)v27);
    v9 = 1;
  }
  if (*((_QWORD *)&v27 + 1) >> 33)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: e = %d >=2^33, Out of range!");
LABEL_50:
    v9 = 1;
    goto LABEL_51;
  }
  v10 = dbl_24BC094D0[v20 - 6 < 0x35];
  v11 = (double)*((unint64_t *)&v27 + 1) * 5.82076609e-11;
  if (v11 < 0.0)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: e = %g < %g, Unrealistic value!", (double)*((unint64_t *)&v27 + 1) * 5.82076609e-11, 0.0);
    v9 = 1;
  }
  if (v11 > v10)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: e = %g > %g, Unrealistic value!");
    goto LABEL_50;
  }
LABEL_51:
  if ((unint64_t)(v28 - 0x100000000) <= 0xFFFFFFFDFFFFFFFFLL)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: w = %d <-2^32 or >=2^32, Out of range!", (_DWORD)v28);
    v9 = 1;
  }
  if ((unint64_t)(*((_QWORD *)&v28 + 1) - 0x100000000) <= 0xFFFFFFFDFFFFFFFFLL)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Omega0 = %d <-2^32 or >=2^32, Out of range!", DWORD2(v28));
    v9 = 1;
  }
  if ((unint64_t)(v29 - 0x100000000) <= 0xFFFFFFFDFFFFFFFFLL)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: i0 = %d <-2^32 or >=2^32, Out of range!", v29);
    v9 = 1;
  }
  if ((v30 - 0x40000) <= 0xFFF7FFFF)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Omega_dot = %d <-2^18 or >=2^18, Out of range!");
LABEL_63:
    v9 = 1;
    goto LABEL_64;
  }
  v12 = (double)v30 * 1.78578867e-13;
  if (v12 < -0.00000198862815)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Omega_dot = %e < %e, Unrealistic value!");
    goto LABEL_63;
  }
  if (v12 > 0.000000314159265)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Omega_dot = %e > %e, Unrealistic value!");
    goto LABEL_63;
  }
LABEL_64:
  if (((v31 - 0x4000) & 0x8000) == 0)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: i_dot = %d <-2^14 or >=2^14, Out of range!", v31);
    v9 = 1;
  }
  if ((v33 - 0x800000) >> 24 != 255)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Crs = %d <-2^23 or >=2^23, Out of range!", (_DWORD)v33);
    v9 = 1;
  }
  if ((DWORD1(v33) - 0x800000) >> 24 != 255)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Crc = %d <-2^23 or >=2^23, Out of range!", DWORD1(v33));
    v9 = 1;
  }
  if ((DWORD2(v33) - 0x100000) >> 21 != 2047)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Cus = %d <-2^20 or >=2^20, Out of range!", DWORD2(v33));
    v9 = 1;
  }
  if ((HIDWORD(v33) - 0x100000) >> 21 != 2047)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: Cuc = %d <-2^20 or >=2^20, Out of range!", HIDWORD(v33));
    v9 = 1;
  }
  if ((v34 - 0x1000000) >> 25 != 127)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: af0 = %d <-2^24 or >=2^24, Out of range!", v34);
    v9 = 1;
  }
  if ((HIDWORD(v34) - 0x200000) >> 22 != 1023)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: af1 = %d <-2^21 or >=2^21, Out of range!", HIDWORD(v34));
    v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(v35 - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: af2 = %d <-2^10 or >=2^10, Out of range!", (__int16)v35);
    v9 = 1;
  }
  if (v36 >= 0x20u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SISA_Ocb = %d >31, Out of range!", v36);
    v9 = 1;
  }
  if (BYTE1(v36) >= 8u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SISA_Oc1 = %d >7, Out of range!", BYTE1(v36));
    v9 = 1;
  }
  if (BYTE2(v36) >= 8u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SISA_Oc2 = %d >7, Out of range!", BYTE2(v36));
    v9 = 1;
  }
  if (HIBYTE(v36) >= 0x20u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: SISA_Oce = %d >31, Out of range!", HIBYTE(v36));
    v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(v37 - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: TGD_B1C_p = %d <-2^10 or >=2^10, Out of range!", (__int16)v37);
    v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(WORD1(v37) - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: TGD_B2a_p = %d <-2^10 or >=2^10, Out of range!", SWORD1(v37));
    v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(WORD2(v37) - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: ISC_B1C_d = %d <-2^10 or >=2^10, Out of range!", SWORD2(v37));
    v9 = 1;
  }
  if ((unsigned __int16)((unsigned __int16)(HIWORD(v37) - 1024) >> 11) <= 0x1Eu)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: ISC_B2a_d = %d <-2^10 or >=2^10, Out of range!", SHIWORD(v37));
    v9 = 1;
  }
  if (v38 >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: dif_B1C = %d >1, Out of range!", v38);
    v9 = 1;
  }
  if (BYTE1(v38) >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: sif_B1C = %d >1, Out of range!", BYTE1(v38));
    v9 = 1;
  }
  if (BYTE2(v38) >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: aif_B1C = %d >1, Out of range!", BYTE2(v38));
    v9 = 1;
  }
  if (HIBYTE(v38) >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: dif_B2a = %d >1, Out of range!", HIBYTE(v38));
    v9 = 1;
  }
  if (v39 >= 2u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: sif_B2a = %d >1, Out of range!", v39);
    v9 = 1;
  }
  v13 = v40;
  if (v40 > 1u)
  {
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: aif_B2a = %d >1, Out of range!", v40);
    if ((v41 - 16) > 0xDFu)
      return 0;
    goto LABEL_110;
  }
  v14 = v41;
  if ((v41 - 16) < 0xE0u)
  {
LABEL_110:
    EvCrt_v("GN_EE_Get_BDS_CNAV_Eph_El: FAILED: URAI = %d <-16 or >15, Out of range!");
    return 0;
  }
  if (v9)
    return 0;
  v15 = *(_QWORD *)(p_api + 48);
  if (*(_BYTE *)(v15 + 16) && *(int *)v15 >= 3)
    v16 = (int)*(double *)(v15 + 32) + 604800 * *(__int16 *)(v15 + 28);
  else
    v16 = 0;
  *(_DWORD *)a3 = v16;
  *(_DWORD *)(a3 + 4) = 6;
  v17 = v21;
  *(_DWORD *)(a3 + 8) = v20;
  *(_DWORD *)(a3 + 12) = v17;
  *(_WORD *)(a3 + 16) = v22;
  v18 = v24;
  *(_DWORD *)(a3 + 20) = v23;
  *(_DWORD *)(a3 + 24) = v18;
  *(_DWORD *)(a3 + 28) = v25;
  v19 = v27;
  *(_OWORD *)(a3 + 32) = v26;
  *(_OWORD *)(a3 + 48) = v19;
  *(_OWORD *)(a3 + 64) = v28;
  *(_QWORD *)(a3 + 80) = v29;
  *(_DWORD *)(a3 + 88) = v30;
  *(_WORD *)(a3 + 92) = v31;
  *(_DWORD *)(a3 + 94) = v32;
  *(_OWORD *)(a3 + 100) = v33;
  *(_QWORD *)(a3 + 116) = v34;
  *(_DWORD *)(a3 + 124) = v35;
  *(_DWORD *)(a3 + 128) = v36;
  *(_QWORD *)(a3 + 132) = v37;
  *(_DWORD *)(a3 + 140) = v38;
  *(_BYTE *)(a3 + 144) = v39;
  *(_BYTE *)(a3 + 145) = v13;
  *(_BYTE *)(a3 + 146) = v14;
  result = 1;
  *(_BYTE *)(a3 + 147) = v42;
  return result;
}

uint64_t EE_Get_BDS_Leg_IntEph(int a1)
{
  if ((a1 - 64) <= 0xFFFFFFC0)
    EvCrt_v("EE_Get_BDS_IntEph:  FAILED:  SV = %d, Out of range !", a1);
  return 0;
}

uint64_t EE_Get_NVIC_IntEph(XofSvcsIf *a1, int a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  unint64_t v6;
  unsigned int v7;
  BOOL v8;
  double v9;
  double v10;
  int v11;
  double v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  v3 = (int)a1;
  v25 = *MEMORY[0x24BDAC8D0];
  if (((_BYTE)a1 - 15) <= 0xF1u)
  {
    EvCrt_v("EE_Get_NVIC_IntEph:  FAILED:  SV = %d, Out of range !");
    return 0;
  }
  if (a2 < 619920000)
    return 0;
  result = GN_EE_Get_NVIC_Eph_El(a1, (unsigned __int16)(a2 / 0x93A80u - 1024), a2 % 0x93A80u, (uint64_t)&v15);
  if ((_DWORD)result)
  {
    if (g_Logging_Cfg < 5)
      EvLog_d("GN_EE_Get_NVIC_Eph_El: ", v3);
    else
      EvLog_v("%s %2u %1u %1u %1u %3u %3d  %4u %5d %5d %8d %6d %4d  %1d  %6d  %5d %10u %10u %11d %11d %11d %11d %6d %8d  %6d %6d %6d %6d %6d %6d", "GN_EE_Get_NVIC_Eph_El:  ", v15, BYTE1(v15), BYTE2(v15), HIBYTE(v15), v16, SBYTE1(v16), WORD1(v16), WORD2(v16), HIWORD(v16), v17, SWORD2(v17), SBYTE6(v17), HIBYTE(v17), (__int16)v18, SHIWORD(v18), (_DWORD)v19,
        DWORD1(v19),
        DWORD2(v19),
        HIDWORD(v19),
        v20,
        HIDWORD(v20),
        v21,
        v22,
        (__int16)v23,
        SWORD1(v23),
        SWORD2(v23),
        SHIWORD(v23),
        (__int16)v24,
        SHIWORD(v24));
    v7 = v15 - 15;
    v8 = v7 < 0xFFFFFFF2;
    if (v7 <= 0xFFFFFFF1)
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  SVid = %d, Out of range !", v15);
    if (BYTE1(v15) >= 2u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  Alert_Flag = %d > 1, Out of range !", BYTE1(v15));
      v8 = 1;
    }
    if (BYTE2(v15) >= 2u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  L5_Health_Flag = %d > 1, Out of range !", BYTE2(v15));
      v8 = 1;
    }
    if (HIBYTE(v15) >= 2u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  S_Health_Flag = %d > 1, Out of range !", HIBYTE(v15));
      v8 = 1;
    }
    if ((BYTE1(v16) - 16) <= 0xE0u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  URAI = %d > 1, Out of range !", SBYTE1(v16));
      v8 = 1;
    }
    if (WORD1(v16) >= 0x1000u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  WeekNo = %d > 4095 Out of range !", WORD1(v16));
      v8 = 1;
    }
    if (WORD2(v16) >= 0x93A8u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  toc = %d > 37799, Out of range !", WORD2(v16));
      v8 = 1;
    }
    if (HIWORD(v16) >= 0x93A8u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  toe = %d > 37799, Out of range !", HIWORD(v16));
      v8 = 1;
    }
    if ((v17 - 0x2000000) >> 26 != 63)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  af0 = %d < -2^25 || >= 2^25, Out of range !", v17);
      v8 = 1;
    }
    if (HIBYTE(v17) >= 7u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  Fit_hours = %d > 6, Out of range !", HIBYTE(v17));
      v8 = 1;
    }
    if ((unsigned __int16)((unsigned __int16)(HIWORD(v18) - 0x2000) >> 14) <= 2u)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  i_dot = %d < -2^13 || >= 2^13, Out of range !", SHIWORD(v18));
      v8 = 1;
    }
    if ((v21 - 0x800000) >> 24 != 255)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  delta_N = %d < -2^23 || >= 2^23, Out of range !", v21);
      v8 = 1;
    }
    if ((v22 - 0x800000) >> 24 != 255)
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El:  FAILED:  Omega_dot = %d < -2^23 || >= 2^23, Out of range !", v22);
      v8 = 1;
    }
    LODWORD(v6) = v19;
    v9 = (double)v6 * 0.00000190734863;
    if (v9 >= *(double *)"")
    {
      if (v9 <= 6700.0)
        goto LABEL_42;
      EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: sqrt_A = %g > %g, Unrealistic value!");
    }
    else
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: sqrt_A = %g < %g, Unrealistic value!");
    }
    v8 = 1;
LABEL_42:
    LODWORD(v9) = DWORD1(v19);
    v10 = (double)*(unint64_t *)&v9 * 1.16415322e-10;
    if (v10 >= 0.0)
    {
      if (v10 <= 0.03)
      {
LABEL_47:
        v11 = v22;
        v12 = (double)v22 * 3.57157734e-13;
        if (v12 < -0.00000198862815)
        {
          EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: Omega_dot = %e < %e, Unrealistic value!");
          return 0;
        }
        if (v12 > 0.000000314159265)
        {
          EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: Omega_dot = %e > %e, Unrealistic value!");
          return 0;
        }
        if (v8)
          return 0;
        v13 = *(_QWORD *)(p_api + 48);
        if (*(_BYTE *)(v13 + 16) && *(int *)v13 >= 3)
          v14 = (int)*(double *)(v13 + 32) + 604800 * *(__int16 *)(v13 + 28);
        else
          v14 = 0;
        *(_DWORD *)a3 = v14;
        *(_DWORD *)(a3 + 4) = 6;
        *(_DWORD *)(a3 + 8) = v15;
        *(_QWORD *)(a3 + 12) = v16;
        *(_QWORD *)(a3 + 20) = v17;
        *(_DWORD *)(a3 + 28) = v18;
        *(_OWORD *)(a3 + 32) = v19;
        *(_QWORD *)(a3 + 48) = v20;
        *(_DWORD *)(a3 + 56) = v21;
        *(_DWORD *)(a3 + 60) = v11;
        *(_QWORD *)(a3 + 64) = v23;
        result = 1;
        *(_DWORD *)(a3 + 72) = v24;
        return result;
      }
      EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: e = %g > %g, Unrealistic value!");
    }
    else
    {
      EvCrt_v("GN_EE_Get_NVIC_Eph_El: FAILED: e = %g < %g, Unrealistic value!");
    }
    v8 = 1;
    goto LABEL_47;
  }
  return result;
}

uint64_t GNS_Initialize(void)
{
  uint64_t result;

  if (g_GnsInit)
    return 1;
  g_CbList = Gnm_ReceiveData;
  unk_2579E3E60 = Hal00_06ReadBufNtf;
  qword_2579E3E68 = (uint64_t)GncP02_10DataIndFromMECB;
  unk_2579E3E70 = GnssDbgMgr_WriteLog;
  result = AgpsSpawnFsm((uint64_t)&g_AgpsFsmTable, 6);
  g_GnsInit = result;
  return result;
}

BOOL NK_Crude_Apx_Pos_Core(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int8x16_t *v6;
  __int16 *v7;
  __int16 *v8;
  int *v9;
  uint64_t v10;
  __int16 (*v11)[3];
  uint64_t v12;
  int (*v13)[3];
  int *v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  int *v20;
  int v21;
  uint64_t v22;
  int32x4_t v23;
  uint32x4_t v24;
  int v25;
  double *v26;
  uint64_t v27;
  int v28;
  int *v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  int (*v34)[3];
  unsigned int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __double2 v42;
  __double2 v43;
  uint64_t v44;
  double *v45;
  int *v46;
  uint64_t v47;
  int64x2_t v48;
  double v49;
  double v50;
  int v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  double v55;
  double v56;
  double *v57;
  uint64_t v58;
  double v59;
  _BOOL4 v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  double v64;
  BOOL v65;
  _BOOL4 v66;
  int v67;
  int v68;
  _BOOL4 v69;
  _BOOL4 v70;
  int v71;
  int v72;
  int v73;
  unint64_t v74;
  uint64_t v75;
  float64x2_t *v76;
  int *v77;
  int64x2_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  double v84;
  _DWORD *v85;
  int v86;
  uint64_t v87;
  int32x4_t v88;
  int v89;
  uint64_t v90;
  int32x4_t v91;
  __double2 v92;
  __double2 v93;
  uint64_t v94;
  double *v95;
  __int128 v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  BOOL v102;
  uint64_t v103;
  int32x4_t v104;
  _BOOL8 v105;
  uint64_t v106;
  size_t v107;
  uint64_t v108;
  __int16 *v109;
  int *v110;
  int v111;
  int v112;
  int v113;
  double v114;
  double *v115;
  double v116;
  int v117;
  double v118;
  double *v119;
  double v120;
  double v121;
  double v122;
  unsigned int v123;
  double v124;
  __double2 v125;
  __double2 v126;
  uint64_t v127;
  double v128;
  _OWORD *v129;
  int8x16_t *v130;
  double v131;
  uint64_t v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double *v152;
  double v153;
  uint64_t v154;
  double *v155;
  int v156;
  uint64_t v157;
  double v158;
  double v159;
  double v160;
  int v161;
  BOOL v162;
  double v163;
  float64x2_t *v164;
  uint64_t v165;
  double v166;
  int v167;
  int v168;
  uint64_t v169;
  _OWORD *v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  double v174;
  double v175;
  uint64_t v176;
  unint64_t v177;
  double v178;
  double v179;
  uint64_t v180;
  unint64_t v181;
  int v182;
  int v183;
  uint64_t v184;
  int v185;
  unint64_t v186;
  unint64_t v187;
  unsigned int v188;
  uint64_t v189;
  unsigned int v190;
  int v191;
  int v192;
  uint64_t v193;
  int v194;
  unint64_t v195;
  unsigned int v196;
  double v197;
  unsigned int v198;
  double v199;
  unsigned int v200;
  unsigned int v201;
  int v202;
  uint64_t v203;
  unsigned int v204;
  unsigned int v205;
  unsigned int v206;
  double v207;
  unsigned int v208;
  double v209;
  uint64_t v210;
  int32x4_t v211;
  int v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  uint64_t v222;
  unsigned int v223;
  int32x2_t *v224;
  uint64_t v225;
  int v226;
  unsigned __int8 v227;
  double *v228;
  _OWORD *v229;
  int (*v230)[3];
  uint64_t v231;
  uint64_t i;
  int v233;
  int v234;
  uint64_t v235;
  int v236;
  double v237;
  uint64_t v238;
  int v239;
  int v240;
  char v241;
  unsigned int v242;
  uint64_t v243;
  double v244;
  double v245;
  unint64_t v246;
  const double *v247;
  BOOL v248;
  uint64_t v249;
  char v250;
  uint64_t v251;
  int (*v252)[3];
  int *v253;
  uint64_t v254;
  unint64_t v255;
  int v256;
  int v257;
  int v258;
  unint64_t v259;
  int v260;
  int v261;
  int v262;
  int v263;
  int v264;
  int v265;
  int v266;
  _BOOL4 v267;
  uint64_t v268;
  char v269;
  uint64_t v270;
  int *v271;
  float64x2_t *v272;
  uint64_t v273;
  int64x2_t v274;
  int v275;
  uint64_t v276;
  double *v277;
  int *v278;
  int v279;
  int v280;
  uint64_t v281;
  uint64_t v282;
  int *v283;
  __int8 *v284;
  _DWORD *v285;
  int *v286;
  double *v287;
  uint64_t v288;
  int v289;
  int v290;
  int v291;
  int v292;
  int v293;
  uint64_t v294;
  unsigned int v295;
  double v296;
  unsigned int v297;
  uint64_t v298;
  int v299;
  int (*v300)[3];
  uint64_t v301;
  unsigned int v302;
  int v303;
  signed int v304;
  unsigned int v305;
  signed int v306;
  int v307;
  unsigned int v308;
  signed int v309;
  _BOOL4 v311;
  char v312;
  int v313;
  int v314;
  int v315;
  uint64_t v316;
  char *v317;
  int v318;
  int v319;
  uint64_t v320;
  double *v321;
  char v322;
  char v323;
  double v324;
  double v325;
  double v326;
  double v327;
  int v328;
  uint32x4_t v329;
  uint32x4_t v330;
  int v331;
  double v332;
  int v333;
  double v334;
  int v335;
  double v336;
  double v337;
  int v338;
  int v339;
  int v340;
  int v341;
  int v342;
  int v343;
  int v344;
  int v345;
  uint64_t v346;
  unsigned int v347;
  int v348;
  int v349;
  unsigned int v350;
  int v351;
  uint64_t v352;
  int v353;
  unsigned int v354;
  BOOL v355;
  int v356;
  signed int v357;
  uint64_t v358;
  unsigned int v359;
  int v360;
  unsigned int v361;
  unint64_t v362;
  unsigned int v363;
  int v364;
  int v365;
  uint64_t v366;
  int v367;
  uint64_t v368;
  uint64_t v369;
  int v370;
  int v371;
  signed int v372;
  int v373;
  signed int v374;
  _DWORD *v375;
  int v376;
  int v377;
  int v378;
  int v379;
  int v380;
  unsigned int v381;
  int v382;
  unsigned int v383;
  unsigned int v384;
  int v385;
  unsigned int v386;
  __int32 v387;
  uint64_t v388;
  unsigned int v389;
  _DWORD *v390;
  unsigned int v391;
  uint64_t v392;
  int v393;
  int v394;
  uint64_t v395;
  __int32 *v396;
  unsigned int v397;
  unsigned int *v398;
  uint64_t v399;
  int v400;
  uint32x4_t v401;
  uint32x4_t *v402;
  uint32x4_t v403;
  uint32x4_t v404;
  uint32x4_t v405;
  uint64_t v406;
  uint32x4_t v407;
  uint32x4_t v408;
  uint32x4_t v409;
  int v410;
  uint64_t v411;
  __int32 v412;
  __int32 *v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  float64x2_t *v417;
  uint64_t v418;
  int v419;
  signed int v420;
  uint64_t v423;
  char *v424;
  __int32 *v425;
  unsigned int v426;
  _DWORD *v427;
  int64x2_t v428;
  int v429;
  double *v430;
  int *v431;
  char *v432;
  uint64_t v433;
  int v434;
  int v435;
  int v436;
  int32x2_t v437;
  unsigned int v438;
  unint64_t v439;
  unsigned int *v440;
  uint64_t v441;
  unsigned int *v442;
  uint64_t v443;
  int v444;
  unsigned int v445;
  __int32 *v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  uint32x4_t v450;
  __int32 *v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  uint64_t j;
  unsigned int v463;
  int v465;
  uint64_t v466;
  uint64_t v467;
  int v468;
  char v469;
  int (*v470)[3];
  uint64_t v471;
  unsigned int v472;
  int v473;
  int v474;
  int v475;
  int v476;
  int v477;
  unsigned int v478;
  uint64_t v479;
  char v480;
  int v481;
  int v482;
  int v483;
  int v484;
  int v485;
  __int32 v486;
  __int32 v487;
  unsigned int v488;
  int v489;
  int64x2_t v490;
  uint64_t v491;
  uint64_t v492;
  int v493;
  __double2 v494;
  __double2 v495;
  double v496;
  int v497;
  BOOL v498;
  uint64_t v499;
  int32x4_t v500;
  double *v501;
  char v502;
  uint64_t v503;
  int32x4_t v504;
  uint64_t v505;
  __double2 v506;
  uint64_t v507;
  __double2 v508;
  uint64_t v509;
  double *v510;
  __int128 v511;
  double v512;
  double v513;
  double v514;
  double v515;
  int v516;
  double v517;
  double v518;
  unsigned __int8 v520;
  int v521;
  int v522;
  int8x16_t *v523;
  __int16 *v524;
  __int16 (*v525)[3];
  int32x4_t v526;
  int v527;
  int v528;
  int32x4_t v529;
  int (*v530)[3];
  int v531;
  int v532;
  int v533;
  int v534;
  int v535;
  int *v536;
  int v537;
  unsigned int v538;
  int v539;
  int v540;
  int v541;
  int v542;
  int v543;
  char v544;
  int v545;
  int v546;
  int v547;
  int v548;
  int v549;
  int v550;
  int v551;
  uint64_t v552;
  int v553;
  int v554;
  unsigned __int8 *v555;
  char *v556;
  int v557;
  __int8 *v558;
  signed int v559;
  char *v560;
  unsigned int v561;
  int *v562;
  double *v563;
  unsigned int v564;
  uint64_t v565;
  signed int v566;
  int v567;
  int v568;
  signed int v569;
  BOOL v570;
  unsigned int v571;
  int v572;
  unsigned int v573[4];
  unsigned int v574;
  uint64_t v575;
  uint64_t v576;
  float64x2_t v577;
  int v578;
  int v579;
  int v580;
  float64x2_t v581;
  __int128 v582;
  uint64_t v583;
  int v584[2];
  unsigned int v585[4];
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  uint64_t v590;
  int8x16_t __x;
  double v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  _BYTE v596[32];
  __int128 v597;
  double v598[3];
  double v599;
  double cosval;
  uint64_t v601;
  double v602;
  double v603;
  double v604;
  uint64_t v605;
  double v606[4];
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  float64x2_t v637;
  double v638;
  float64x2_t v639;
  double v640;
  float64x2_t v641;
  uint64_t v642;
  float64x2_t v643;
  double v644;
  _QWORD v645[2];
  int v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  float64x2_t v650;
  double v651;
  uint32x4_t v652;
  uint32x4_t v653;
  uint32x4_t v654;
  uint32x4_t v655;
  uint32x4_t v656;
  uint32x4_t v657;
  uint32x4_t v658;
  uint32x4_t v659;
  uint32x4_t v660;
  uint64_t v661;
  unsigned int v662;
  float64x2_t *v663;
  _QWORD *v664;
  uint32x4_t v665;
  uint32x4_t v666;
  __int128 v667;
  __int128 v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  __int128 v672;
  __int128 v673;
  __int32 v674;
  int8x16_t v675;
  _DWORD v676[33];
  _DWORD v677[2];
  unsigned int v678;
  _OWORD v679[7];
  _OWORD v680[22];
  uint64_t v681;
  uint64_t v682;
  char v683;
  uint64_t v684;
  uint64_t v685;
  char v686;
  unint64_t v687;
  int v688;
  __int128 *v689;
  double *v690;
  double *v691;
  uint32x4_t *v692;
  float64x2_t *v693;
  __int128 v694;
  __int128 v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  _OWORD v728[2];
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  __int128 v733;
  __int128 v734;
  double v735[128];
  __int128 v736;
  __int128 v737;
  uint32x4_t v738;
  uint32x4_t v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  uint64_t v744;

  v4 = MEMORY[0x24BDAC7A8](a1);
  v523 = v6;
  v8 = v7;
  v536 = v9;
  v552 = v10;
  v525 = v11;
  v576 = v12;
  v13 = (int (*)[3])v4;
  v744 = *MEMORY[0x24BDAC8D0];
  v582 = 0uLL;
  *(double *)&v583 = 0.0;
  __x = 0uLL;
  v592 = 0.0;
  v590 = 0;
  v588 = 0u;
  v589 = 0u;
  v529 = 0u;
  v14 = (int *)&unk_257A47000;
  v15 = (double *)&unk_2579E2000;
  v555 = v5;
  if (g_Logging_Cfg >= 4)
  {
    v16 = mach_continuous_time();
    v5 = v555;
    v529 = vdupq_n_s32((unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16));
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = &(*v13)[2];
  do
  {
    if (v5[v17] == 3)
      ++v19;
    if (*(v20 - 2) && *(v20 - 1) && *v20)
      ++v18;
    ++v17;
    v20 += 3;
  }
  while (v17 != 128);
  v522 = v18;
  v530 = v13;
  v21 = Centroid_SV_Pos(v13, 0x80u, (double *)v596);
  if (v21)
  {
    *(_QWORD *)&v596[24] = 0;
    v597 = 0uLL;
    v593 = *(_OWORD *)v596;
    v594 = *(unint64_t *)&v596[16];
    v595 = 0uLL;
  }
  else
  {
    v594 = 0u;
    v595 = 0u;
    v593 = 0u;
  }
  v526 = v529;
  if (g_Logging_Cfg >= 5)
  {
    v22 = mach_continuous_time();
    v23 = v529;
    v23.i32[1] = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22);
    v526 = v23;
  }
  v24 = 0uLL;
  xmmword_2579E5F80 = 0u;
  *(_OWORD *)&dword_2579E5F90 = 0u;
  *(__int128 *)((char *)&xmmword_2579E5F58 + 8) = 0u;
  *(_OWORD *)&byte_2579E5F70 = 0u;
  xmmword_2579E5F40 = 0u;
  *(_OWORD *)&qword_2579E5F50 = 0u;
  if (v19 > 2)
    v25 = v21;
  else
    v25 = 0;
  gDebug = 0uLL;
  unk_2579E5F30 = 0uLL;
  v524 = v8;
  if (v25 == 1)
  {
    byte_2579E5F7E = 1;
    *(_OWORD *)v585 = *(_OWORD *)v596;
    v586 = *(_OWORD *)&v596[16];
    v587 = v597;
    bzero(v606, 0x1C00uLL);
    v27 = 0;
    v28 = 0;
    v683 = 0;
    memset(v679, 0, sizeof(v679));
    memset(v680, 0, 345);
    v685 = 0;
    v682 = 0;
    v684 = 0;
    v696 = 0u;
    v697 = 0u;
    v698 = 0u;
    v699 = 0u;
    v700 = 0u;
    v701 = 0u;
    v702 = 0u;
    v703 = 0u;
    v704 = 0u;
    v705 = 0u;
    v706 = 0u;
    v707 = 0u;
    v708 = 0u;
    v709 = 0u;
    v710 = 0u;
    v711 = 0u;
    v712 = 0u;
    v713 = 0u;
    v714 = 0u;
    v715 = 0u;
    v716 = 0u;
    v717 = 0u;
    v718 = 0u;
    v719 = 0u;
    v720 = 0u;
    v721 = 0u;
    v722 = 0u;
    v723 = 0u;
    v724 = 0u;
    v725 = 0u;
    v726 = 0u;
    v727 = 0u;
    v688 = 1;
    v690 = (double *)&v675;
    v689 = &v736;
    v691 = v735;
    v692 = &v665;
    v693 = &v650;
    v687 = 0xFFFFFFFF00000000;
    v694 = 0u;
    v695 = 0u;
    v686 = 1;
    v681 = 0;
    dword_2579E5F68 = 0;
    v736 = 0u;
    v737 = 0u;
    v738 = 0u;
    v739 = 0u;
    v740 = 0u;
    v741 = 0u;
    v742 = 0u;
    v743 = 0u;
    *(_QWORD *)&v731 = 0;
    v730 = 0u;
    v729 = 0u;
    v29 = &(*v13)[2];
    v30 = -1;
    v31 = 592;
    memset(v728, 0, sizeof(v728));
    do
    {
      v735[v27] = 1.0;
      if (v555[v27] == 3 && *(v29 - 2) && *(v29 - 1) && *v29)
      {
        *((_BYTE *)&v736 + v27) = 1;
        *((_BYTE *)v679 + v31) = 1;
        ++v28;
        *(_BYTE *)(v576 + v27) = 1;
      }
      else if (v30 == -1)
      {
        HIDWORD(v687) = v27;
        v30 = v27;
      }
      ++v27;
      v31 += 4;
      v29 += 3;
    }
    while (v27 != 128);
    *(_DWORD *)((char *)&v684 + 3) = -1;
    LODWORD(v684) = -16645888;
    v32 = 3;
    HIBYTE(v684) = 3;
    if ((_BYTE)v28)
    {
      BYTE3(v684) = 3;
      v32 = 4;
      HIBYTE(v684) = 4;
    }
    LODWORD(v685) = 2;
    if (v28 >= 3)
    {
      v35 = 0;
      v36 = 0.0;
      v569 = v32;
      while (1)
      {
        v37 = *(double *)v596;
        v38 = *(double *)&v596[8];
        v598[0] = *(double *)v596;
        v598[1] = *(double *)&v596[8];
        v39 = *(double *)&v596[16];
        v598[2] = *(double *)&v596[16];
        ECEF2Geo(v598, (uint64_t)&WGS84_Datum, (uint64_t)&v643);
        v40 = v643.f64[1];
        v41 = -6.28318531;
        if (v643.f64[1] >= 3.14159265 || (v41 = 6.28318531, v643.f64[1] < -3.14159265))
        {
          v40 = v643.f64[1] + v41;
          v643.f64[1] = v643.f64[1] + v41;
        }
        v42 = __sincos_stret(v643.f64[0]);
        v43 = __sincos_stret(v40);
        v44 = 0;
        *(double *)v728 = -(v42.__sinval * v43.__cosval);
        *((double *)v728 + 1) = -(v42.__sinval * v43.__sinval);
        *(double *)&v728[1] = v42.__cosval;
        *((double *)&v728[1] + 1) = -v43.__sinval;
        v729 = *(unint64_t *)&v43.__cosval;
        *(double *)&v730 = -(v42.__cosval * v43.__cosval);
        *((double *)&v730 + 1) = -(v42.__cosval * v43.__sinval);
        *(double *)&v731 = -v42.__sinval;
        v46 = &(*v13)[2];
        v45 = &v606[2];
        do
        {
          if (*((_BYTE *)v689 + v44))
          {
            v47 = *((_QWORD *)v46 - 1);
            v48.i64[0] = (int)v47;
            v48.i64[1] = SHIDWORD(v47);
            v637 = vcvtq_f64_s64(v48);
            v638 = (double)*v46;
            v639.f64[0] = v37;
            v639.f64[1] = v38;
            v640 = v39;
            v49 = Comp_SVrange_Sag_Corr(&v641, (double *)v584, &v639, &v637);
            *((float64x2_t *)v45 - 1) = v641;
            *(_QWORD *)v45 = v642;
            v50 = 0.0;
            switch(*(_BYTE *)(v576 + v44))
            {
              case 1:
              case 3:
              case 5:
                v51 = SBYTE3(v684);
                goto LABEL_45;
              case 2:
                v51 = SBYTE4(v684);
LABEL_45:
                if (v51 > 0)
                  goto LABEL_46;
                break;
              case 4:
                LOBYTE(v51) = BYTE5(v684);
                if (SBYTE5(v684) < 1)
                  break;
LABEL_46:
                v50 = *(double *)&v596[8 * v51];
                break;
              default:
                break;
            }
            v690[v44] = (double)v536[v44] - v49 - v50;
          }
          ++v44;
          v45 += 7;
          v46 += 3;
        }
        while (v44 != 128);
        if (v28 > 4)
        {
          HIDWORD(v687) = -1;
        }
        else
        {
          v52 = SHIDWORD(v687);
          *((_BYTE *)v689 + SHIDWORD(v687)) = 1;
          v53 = v690;
          LODWORD(v641.f64[0]) = 0;
          LODWORD(v639.f64[0]) = 0;
          LODWORD(v637.f64[0]) = 0;
          v584[0] = 0;
          v598[0] = v37;
          v598[1] = v38;
          v598[2] = v39;
          ECEF2Geo(v598, (uint64_t)&WGS84_Datum, (uint64_t)&v643);
          v55 = v643.f64[1];
          v56 = -6.28318531;
          if (v643.f64[1] >= 3.14159265 || (v56 = 6.28318531, v643.f64[1] < -3.14159265))
          {
            v55 = v643.f64[1] + v56;
            v643.f64[1] = v643.f64[1] + v56;
          }
          v57 = &v606[7 * (int)v52];
          LODWORD(v54) = vcvtd_n_s64_f64(v643.f64[0], 0xFuLL);
          v58 = Taylor_sin_cos(v54, (int *)&v641, (int *)&v639);
          LODWORD(v58) = vcvtd_n_s64_f64(v55, 0xFuLL);
          Taylor_sin_cos(v58, (int *)&v637, v584);
          v59 = (double)(LODWORD(v637.f64[0]) * LODWORD(v639.f64[0]));
          *v57 = (double)(LODWORD(v639.f64[0]) * v584[0]) * 9.31322575e-10;
          v57[1] = v59 * 9.31322575e-10;
          v57[2] = (double)SLODWORD(v641.f64[0]) * 0.0000305175781;
          v53[v52] = v644;
          if (v28 == 4)
            v691[SHIDWORD(v687)] = 1000000.0;
        }
        v60 = NK_Least_Squares_Core(v606, (double (*)[3])v728, v569, 0, 0, (uint64_t)v645, (uint64_t)&v652, &v605, (uint64_t)v679);
        v61 = 0;
        v62 = 0.0;
        do
        {
          if ((*((char *)&v684 + v61) & 0x80000000) == 0)
          {
            v63 = *((unsigned __int8 *)&v684 + v61);
            v64 = *((double *)v679 + v63);
            *(double *)&v596[8 * v63] = *(double *)&v596[8 * v63] + v64;
            v62 = v62 + v64 * v64;
          }
          ++v61;
        }
        while (v61 != 7);
        v65 = v62 - v36 <= 2500.0 || v35 == 0;
        v66 = v65 && v60;
        ++byte_2579E5F70;
        if (!v66)
          break;
        v67 = v35 + 1;
        if (v35 <= 8)
        {
          ++v35;
          v36 = v62;
          if (v62 > 10000.0)
            continue;
        }
        goto LABEL_75;
      }
      v67 = v35;
LABEL_75:
      v69 = v67 > 9 && v66;
      v70 = v62 > 90000.0 && v69;
      v71 = !v70;
      if (v70 || !v66)
      {
        if (v70)
          v72 = 1;
        else
          v72 = 2;
        dword_2579E5F68 = v72;
      }
      v73 = v66 & v71;
      v14 = (int *)&unk_257A47000;
      v8 = v524;
      if (SHIDWORD(v687) >= 1)
        *((_BYTE *)&v736 + HIDWORD(v687)) = 0;
      if (!v73)
      {
        v33 = 0;
        goto LABEL_108;
      }
      v74 = 0;
      v75 = (char)v684;
      v76 = (float64x2_t *)&v596[8 * (char)v684];
      while (1)
      {
        if (*((_BYTE *)&v736 + v74))
        {
          v77 = v13[v74];
          v78.i64[0] = (int)*(_QWORD *)v77;
          v78.i64[1] = (int)HIDWORD(*(_QWORD *)v77);
          v643 = vcvtq_f64_s64(v78);
          v644 = (double)v77[2];
          v79 = 2;
          do
          {
            v598[v79] = v643.f64[v79] - v76->f64[v79];
            v80 = v79-- + 1;
          }
          while (v80 > 1);
          v81 = 0;
          v82 = 0.0;
          do
          {
            v82 = v82 + v76->f64[v81] * v598[v81];
            ++v81;
          }
          while (v81 != 3);
          if (v82 < 0.0)
          {
            v33 = 0;
            v85 = &unk_2579E5000;
            v86 = 3;
            goto LABEL_107;
          }
        }
        if (v74 >= 0x7F)
          break;
        ++v74;
      }
      v83 = 0;
      v84 = 0.0;
      do
      {
        if (*((_BYTE *)&v736 + v83))
          v84 = v84 + *(double *)&v665.i64[v83] * *(double *)&v665.i64[v83];
        ++v83;
      }
      while (v83 != 128);
      if (v84 > 225000000.0)
      {
        v33 = 0;
        v85 = (_DWORD *)&unk_2579E5000;
        v86 = 4;
LABEL_107:
        v85[986] = v86;
        goto LABEL_108;
      }
      v643 = *v76;
      v492 = 8 * v75 + 16;
      v644 = *(double *)&v596[v492];
      ECEF2Geo(v643.f64, (uint64_t)&WGS84_Datum, (uint64_t)&__x);
      v493 = (int)v592;
      dword_2579E5F9C = (int)v592;
      v494 = __sincos_stret(*(double *)__x.i64);
      v495 = __sincos_stret(*(double *)&__x.i64[1]);
      v598[0] = -(v494.__sinval * v495.__cosval);
      v598[1] = -(v494.__sinval * v495.__sinval);
      v598[2] = v494.__cosval;
      v599 = -v495.__sinval;
      cosval = v495.__cosval;
      v601 = 0;
      v602 = -(v494.__cosval * v495.__cosval);
      v603 = -(v494.__cosval * v495.__sinval);
      v604 = -v494.__sinval;
      Comp_NEDvar_UDU((uint64_t)v680, HIBYTE(v684), v75, (double (*)[3])v598, (double *)&v679[3] + v75 + 1);
      v496 = *(double *)((char *)&v679[3] + v492 + 8);
      if (v496 >= 100000000.0
        || ((v497 = U4sqrt((int)v496), -500 - 1000 * v497 < v493) ? (v498 = 1000 * v497 + 18000 <= v493) : (v498 = 1),
            v498))
      {
        v33 = 0;
        dword_2579E5F68 = 5;
      }
      else
      {
        v33 = 1;
      }
    }
    else
    {
      v33 = 0;
    }
    v13 = v530;
LABEL_108:
    if (g_Logging_Cfg >= 5)
    {
      v87 = mach_continuous_time();
      v88 = v526;
      v88.i32[2] = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v87);
      v526 = v88;
    }
    if (v33)
      v89 = CompVelDoLs(v13, v525, v8, (double *)v596, (BOOL)&v588, v26);
    else
      v89 = 0;
    if (g_Logging_Cfg >= 5)
    {
      v90 = mach_continuous_time();
      v91 = v526;
      v91.i32[3] = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v90);
      v526 = v91;
    }
    if (v89)
    {
      v92 = __sincos_stret(*(double *)__x.i64);
      v93 = __sincos_stret(*(double *)&__x.i64[1]);
      v94 = 0;
      v606[0] = -(v92.__sinval * v93.__cosval);
      v606[1] = -(v92.__sinval * v93.__sinval);
      v95 = &v606[2];
      v606[2] = v92.__cosval;
      v606[3] = -v93.__sinval;
      v607 = *(unint64_t *)&v93.__cosval;
      *(double *)&v608 = -(v92.__cosval * v93.__cosval);
      *((double *)&v608 + 1) = -(v92.__cosval * v93.__sinval);
      *(double *)&v609 = -v92.__sinval;
      v96 = v588;
      v97 = *(double *)&v589;
      do
      {
        v98 = *(v95 - 1) * *((double *)&v96 + 1) + *(v95 - 2) * *(double *)&v96;
        v99 = *v95;
        v95 += 3;
        *(double *)((char *)v679 + v94) = v98 + v99 * v97;
        v94 += 8;
      }
      while (v94 != 24);
      v100 = *((double *)v679 + 1) * *((double *)v679 + 1) + *(double *)v679 * *(double *)v679;
      v101 = fabs(*(double *)&v679[1]);
      v102 = v101 < 10.0 && v100 < 4556.25;
      HIDWORD(xmmword_2579E5F80) = (int)sqrt(v100);
      dword_2579E5F90 = (int)v101;
      v34 = v530;
      if (!v102)
        dword_2579E5F68 = 6;
    }
    else
    {
      v102 = 0;
      v34 = v530;
    }
    if (g_Logging_Cfg >= 5)
    {
      v103 = mach_continuous_time();
      v104 = v529;
      v104.i32[0] = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v103);
      v529 = v104;
    }
    if (v102)
    {
      *v523 = __x;
      v105 = 1;
      byte_2579E5F7D = 1;
      goto LABEL_624;
    }
    *(_OWORD *)v596 = *(_OWORD *)v585;
    *(_OWORD *)&v596[16] = v586;
    v597 = v587;
    v24 = 0uLL;
    v588 = 0u;
    v589 = 0u;
    v590 = 0;
    v592 = 0.0;
    __x = 0uLL;
    dword_2579E5F6C = dword_2579E5F68;
    goto LABEL_129;
  }
  if (!v21)
  {
    v68 = 0;
    goto LABEL_211;
  }
  v34 = v13;
LABEL_129:
  v106 = 0;
  v107 = 0;
  v108 = 0;
  v661 = 0;
  v660 = v24;
  v659 = v24;
  v658 = v24;
  v657 = v24;
  v656 = v24;
  v655 = v24;
  v654 = v24;
  v663 = &v650;
  v664 = v645;
  v109 = &(*v525)[2];
  v662 = -1;
  v110 = &(*v34)[2];
  v653 = v24;
  v652 = v24;
  while (1)
  {
    v111 = *(v110 - 2);
    v112 = *(v110 - 1);
    v113 = *v110;
    if (!*((_QWORD *)v110 - 1))
      break;
LABEL_133:
    v110 += 3;
    v114 = (double)v111;
    v115 = (double *)((char *)v679 + v106 * 8);
    *v115 = v114;
    v115[1] = (double)v112;
    v116 = (double)v113;
    v115[2] = (double)v113;
    v117 = *(v109 - 2);
    v735[v108] = (double)v8[v108];
    v118 = (double)v117;
    v119 = (double *)&v675.i64[v106];
    v120 = (double)*(v109 - 1);
    v121 = (double)v112 * (double)v112 + v114 * v114 + v116 * v116;
    v122 = (double)*v109;
    *(double *)&v665.i64[v108++] = v121;
    *v119 = v118;
    v119[1] = v120;
    v119[2] = v122;
    v107 += 8;
    v106 += 3;
    v109 += 3;
    if (v108 == 128)
    {
      memset_pattern16(v645, &unk_24BC0D290, 0x400uLL);
LABEL_135:
      v570 = 0;
      goto LABEL_136;
    }
  }
  if (v113)
  {
    v112 = 0;
    goto LABEL_133;
  }
  v570 = (_DWORD)v108 == 0;
  if (!(_DWORD)v108)
  {
    v662 = 0;
    goto LABEL_586;
  }
  memset_pattern16(v645, &unk_24BC0D290, v107);
  if (v108 >= 0x80)
    goto LABEL_135;
  v662 = v108;
  if ((_DWORD)v108 == 5)
  {
    v570 = 0;
    v649 = 0x3FF9000000000000;
    LODWORD(v108) = 5;
    goto LABEL_136;
  }
  if ((_DWORD)v108 == 4)
  {
    v570 = 0;
    v648 = 0x3F647AE147AE147CLL;
    LODWORD(v108) = 4;
    goto LABEL_136;
  }
  if ((_DWORD)v108 != 3)
  {
    if (v108 > 7)
    {
      v570 = 0;
      v491 = 0x4039000000000000;
      goto LABEL_587;
    }
LABEL_586:
    v491 = 0x4019000000000000;
LABEL_587:
    v645[v108] = v491;
    goto LABEL_136;
  }
  v570 = 0;
  v647 = 0x3F647AE147AE147CLL;
  LODWORD(v108) = 3;
LABEL_136:
  v728[0] = *(_OWORD *)v596;
  *(_QWORD *)&v728[1] = *(_QWORD *)&v596[16];
  WGS84_ECEF2Geo((long double *)v728, (double *)__x.i64);
  v123 = 0;
  *(int8x16_t *)&v596[8] = __x;
  *(_QWORD *)v596 = 0x415854A640000000;
  *(_QWORD *)&v596[24] = 0;
  do
  {
    v574 = v123;
    v124 = *(double *)v596;
    v125 = __sincos_stret(*(double *)&v596[8]);
    v126 = __sincos_stret(*(double *)&v596[16]);
    *(double *)&v736 = v125.__cosval * v126.__cosval;
    *((double *)&v736 + 1) = v125.__cosval * v126.__sinval;
    *(double *)&v737 = v125.__sinval;
    *((double *)&v737 + 1) = -(v125.__sinval * v126.__cosval);
    *(double *)v738.i64 = -(v125.__sinval * v126.__sinval);
    v738.i64[1] = *(_QWORD *)&v125.__cosval;
    *(double *)v739.i64 = -(v125.__cosval * v126.__sinval);
    *(double *)&v739.i64[1] = v125.__cosval * v126.__cosval;
    *(_QWORD *)&v740 = 0;
    if (!v570)
    {
      v127 = 0;
      v128 = -v124;
      v129 = v679;
      v130 = &v675;
      v131 = *(double *)&v596[24];
      do
      {
        v132 = 0;
        v133 = 0.0;
        v134 = 0.0;
        v135 = 0.0;
        v136 = 0.0;
        v137 = 0.0;
        v138 = 0.0;
        v139 = 0.0;
        do
        {
          v140 = *(double *)((char *)&v736 + v132 * 8);
          v141 = *(double *)&v130->i64[v132];
          v139 = v139 + v140 * v141;
          v142 = *(double *)((char *)&v737 + v132 * 8 + 8);
          v137 = v137 + v142 * v141;
          v143 = *(double *)&v739.i64[v132];
          v135 = v135 + v143 * v141;
          v144 = *(double *)((char *)v129 + v132 * 8);
          v138 = v138 + v140 * v144;
          v136 = v136 + v142 * v144;
          v134 = v134 + v143 * v144;
          v133 = v133 + v144 * v141;
          ++v132;
        }
        while (v132 != 3);
        v145 = *(double *)&v665.i64[v127] + v124 * v124 + v124 * -2.0 * v138;
        v146 = sqrt(v145);
        v147 = v145 * v146;
        v148 = 1.0 / v146;
        v149 = -(v133 - v139 * v124);
        v150 = v149 / v147;
        v151 = -((v124 - v138) * v150 + -v139 * v148);
        v152 = &v606[3 * v127];
        v153 = -(v150 * v124);
        *v152 = v151;
        v152[1] = -(v136 * v153 + v148 * v128 * v137);
        v152[2] = -(v134 * v153 + v148 * v128 * v135);
        v650.f64[v127] = v735[v127] - (v131 - v149 * v148);
        ++v127;
        v129 = (_OWORD *)((char *)v129 + 24);
        v130 = (int8x16_t *)((char *)v130 + 24);
      }
      while (v127 != v108);
    }
    v154 = v662;
    if ((v662 & 0x80000000) == 0)
    {
      v155 = &v606[3 * v662];
      v155[1] = 0.0;
      v155[2] = 0.0;
      *v155 = -1.0;
      v650.f64[v154] = -(v124
                       + sqrt((v125.__cosval * v125.__cosval + v125.__sinval * v125.__sinval * 0.986656055)/ (v125.__cosval * v125.__cosval + v125.__sinval * v125.__sinval * 0.99330562))* -6378137.0);
    }
    v156 = CAP_LSQ4_Core((uint64_t)v606, v108, (uint64_t)&v652);
    v157 = 0;
    ++byte_2579E5F71;
    v158 = 0.0;
    do
    {
      v159 = *(double *)&v652.i64[v157];
      v160 = *(double *)&v596[8 * v157] + v159;
      *(double *)&v596[8 * v157] = v160;
      if ((v157 - 1) > 1)
      {
        v158 = v158 + v159 * v159;
      }
      else
      {
        if (v160 > 3.14159265)
        {
          do
            v160 = v160 + -6.28318531;
          while (v160 > 3.14159265);
          *(double *)&v596[8 * v157] = v160;
        }
        if (v160 < -3.14159265)
        {
          do
            v160 = v160 + 6.28318531;
          while (v160 < -3.14159265);
          *(double *)&v596[8 * v157] = v160;
        }
        v158 = v158 + v159 * v159 * 1.0e10;
      }
      ++v157;
    }
    while (v157 != 4);
    if (v158 > 40000.0)
      v161 = v156;
    else
      v161 = 0;
    v162 = v161 != 1 || v574 >= 0xE;
    v123 = v574 + 1;
  }
  while (!v162);
  if (v156)
  {
    v163 = 0.0;
    v14 = (int *)&unk_257A47000;
    v8 = v524;
    v15 = (double *)&unk_2579E2000;
    if (!v570)
    {
      v164 = &v650;
      v165 = v108;
      do
      {
        v166 = v164->f64[0];
        v164 = (float64x2_t *)((char *)v164 + 8);
        v163 = v163 + v166 * v166;
        --v165;
      }
      while (v165);
    }
    if (v163 / (double)(int)v108 > 10000.0)
    {
      v167 = 4;
      goto LABEL_170;
    }
    v168 = 1;
  }
  else
  {
    v167 = 2;
    v14 = (_DWORD *)&unk_257A47000;
    v8 = v524;
    v15 = (double *)&unk_2579E2000;
LABEL_170:
    v168 = 0;
    dword_2579E5F68 = v167;
  }
  __x = *(int8x16_t *)&v596[8];
  v592 = 0.0;
  Geo2ECEF((uint64_t)&__x, (uint64_t)&WGS84_Datum, (double *)v728);
  *(_OWORD *)v596 = v728[0];
  *(_QWORD *)&v596[16] = *(_QWORD *)&v728[1];
  if ((_DWORD)v108 && v168)
  {
    v169 = 0;
    v170 = v679;
    while (1)
    {
      v171 = 2;
      do
      {
        *((double *)&v736 + v171) = *((double *)v170 + v171) - *(double *)&v596[8 * v171];
        v172 = v171-- + 1;
      }
      while (v172 > 1);
      v173 = 0;
      v174 = 0.0;
      do
      {
        v174 = v174 + *(double *)&v596[v173] * *(double *)((char *)&v736 + v173);
        v173 += 8;
      }
      while (v173 != 24);
      v175 = 0.0;
      v176 = 2;
      do
      {
        v175 = v175 + *(double *)&v596[8 * v176] * *(double *)&v596[8 * v176];
        v177 = v176-- + 1;
      }
      while (v177 > 1);
      v178 = v174 / sqrt(v175);
      if (v178 < 0.0)
      {
        v179 = 0.0;
        v180 = 2;
        do
        {
          v179 = v179 + *((double *)&v736 + v180) * *((double *)&v736 + v180);
          v181 = v180-- + 1;
        }
        while (v181 > 1);
        if (v178 / sqrt(v179) < -0.087155743)
          break;
      }
      ++v169;
      v170 = (_OWORD *)((char *)v170 + 24);
      if (v169 == v108)
        goto LABEL_194;
    }
    dword_2579E5F68 = 3;
LABEL_210:
    v68 = 0;
    __x = 0uLL;
    v1 = 0.0;
    v2 = 0.0;
    v3 = 0.0;
    v592 = 0.0;
  }
  else
  {
    if (!v168)
      goto LABEL_210;
LABEL_194:
    v182 = 1;
    v183 = 6;
    v184 = 2;
    v185 = 6;
    v186 = 1;
    do
    {
      v187 = v186 - 1;
      v188 = v186 + v186 * v186;
      v189 = v186 + (v188 >> 1);
      v190 = v188 >> 1;
      v191 = v183;
      v192 = v185;
      v193 = v184;
      v194 = v182;
      v195 = v186;
      do
      {
        v196 = v195 + v195 * v195;
        if (v186 == v195)
        {
          v197 = *(double *)&v654.i64[v189];
          v198 = v196 >> 1;
        }
        else
        {
          v198 = v196 >> 1;
          v199 = *(double *)&v654.i64[v195 + (v196 >> 1)];
          v200 = v186 + (v196 >> 1);
          if (v186 >= v195)
            v200 = v190 + v195;
          v197 = v199 * *(double *)&v654.i64[v200];
        }
        v201 = v191;
        v202 = v192;
        v203 = v193;
        v204 = v194;
        do
        {
          v205 = v204 + 1;
          v206 = (v204 + 2) * (v204 + 1);
          v207 = *(double *)&v654.i64[v203 + ((unint64_t)v201 >> 1)]
               * *(double *)&v654.i64[v186 + (v206 >> 1)];
          v208 = v195 + (v206 >> 1);
          if (v205 <= v195)
            v208 = v205 + v198;
          v197 = v197 + v207 * *(double *)&v654.i64[v208];
          ++v203;
          v201 += v202;
          v202 += 2;
          v204 = v205;
        }
        while (v205 < 3);
        *((double *)&v736 + 2 * v187 + v195 - 1) = v197;
        *((double *)&v736 + 2 * v195 + v187 - 2) = v197;
        ++v194;
        ++v193;
        v191 += v192;
        v192 += 2;
        v65 = v195 == 2;
        v195 = 2;
      }
      while (!v65);
      ++v184;
      ++v182;
      v183 += v185;
      v185 += 2;
      v186 = 2;
    }
    while ((_DWORD)v184 != 4);
    v209 = cos(*(long double *)__x.i64);
    v1 = *(double *)&v736 * 4.06806316e13;
    v2 = *((double *)&v737 + 1) * (v209 * v209 * 4.06806316e13);
    v3 = fabs(v209) * 4.06806316e13 * *((double *)&v736 + 1);
    v68 = 1;
  }
LABEL_211:
  if (v14[692] >= 5)
  {
    v210 = mach_continuous_time();
    v211 = v529;
    v211.i32[1] = (unint64_t)(v15[455] * (double)v210);
    v529 = v211;
  }
  if (!v68)
  {
    *(_OWORD *)v596 = v593;
    *(_OWORD *)&v596[16] = v594;
    v597 = v595;
LABEL_263:
    v246 = 0;
    *(_OWORD *)v598 = xmmword_24BC0D280;
    v247 = (const double *)v596;
    do
    {
      v606[0] = 0.0;
      v248 = R8_EQ(v247, v606);
      if (v246 > 3)
        break;
      ++v246;
      ++v247;
    }
    while (v248);
    v249 = 0;
    v250 = 0;
    v251 = 0;
    v636 = 0u;
    v635 = 0u;
    v634 = 0u;
    v633 = 0u;
    v632 = 0u;
    v631 = 0u;
    v630 = 0u;
    v629 = 0u;
    v628 = 0u;
    v627 = 0u;
    v626 = 0u;
    v625 = 0u;
    v624 = 0u;
    v622 = 0u;
    v623 = 0u;
    v620 = 0u;
    v621 = 0u;
    v618 = 0u;
    v619 = 0u;
    v616 = 0u;
    v617 = 0u;
    v614 = 0u;
    v615 = 0u;
    v612 = 0u;
    v613 = 0u;
    v610 = 0u;
    v611 = 0u;
    v608 = 0u;
    v609 = 0u;
    v607 = 0u;
    memset(v606, 0, sizeof(v606));
    v645[1] = 0;
    v645[0] = 0;
    v646 = 0;
    memset(v728, 0, 20);
    v252 = v530;
    v253 = &(*v530)[2];
    do
    {
      if (*(v253 - 2) && *(v253 - 1) && *v253)
      {
        v254 = (v251 + 1);
        if ((int)v251 <= 4)
          v250 |= *(_BYTE *)(v576 + v249) == 2;
      }
      else
      {
        v254 = v251;
      }
      ++v249;
      v253 += 3;
      v251 = v254;
    }
    while (v249 != 128);
    if ((int)v254 < 1)
      goto LABEL_300;
    v255 = 0;
    v256 = 0;
    v257 = 0;
    v258 = 1;
    v259 = v254;
    while (1)
    {
      v260 = v555[v255];
      if (v260 == 1)
        break;
      if (v260 == 2)
      {
        v263 = *v555;
        if (v263 == 3)
          goto LABEL_284;
        if (v263 == 2)
        {
          v263 = 6;
LABEL_284:
          *((_DWORD *)v606 + v255) = v263;
        }
        ++v256;
LABEL_293:
        if (v255 >= 5)
          goto LABEL_298;
LABEL_296:
        v262 = 5;
        v261 = 2;
LABEL_297:
        *((_DWORD *)v645 + v255) = v261;
        v258 *= v262;
        goto LABEL_298;
      }
      if (v260 == 3)
      {
        ++v257;
        *((_DWORD *)v606 + v255) = 0;
        if (v255 < 5)
        {
          v261 = 0;
          v262 = 1;
          goto LABEL_297;
        }
      }
      else
      {
        *((_DWORD *)v606 + v255) = 22;
        if (v255 <= 4)
          goto LABEL_296;
      }
LABEL_298:
      if (v254 == ++v255)
      {
        if ((int)v254 < 4)
        {
LABEL_300:
          v267 = 0;
          goto LABEL_602;
        }
        if ((int)v254 >= 5)
          v268 = 5;
        else
          v268 = v254;
        v269 = v257 + v256 >= (int)v268 || v248;
        v544 = v250;
        v548 = v254;
        v547 = v258;
        v553 = v257;
        v571 = v268;
        if ((v269 & 1) != 0)
        {
LABEL_308:
          v652 = 0uLL;
          v653.i32[0] = 0;
        }
        else
        {
          v466 = 0;
          *(int32x2_t *)v675.i8 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)v596));
          v675.i32[2] = (int)*(double *)&v596[16];
          do
          {
            *(_DWORD *)((char *)v679 + v466 * 4) = v675.i32[v466] / 1000;
            ++v466;
          }
          while (v466 != 3);
          v467 = 0;
          v468 = 0;
          v469 = 1;
          v470 = v530;
          do
          {
            v471 = 0;
            v472 = 0;
            do
            {
              v473 = (*v470)[v471] / 1000 - *(_DWORD *)((char *)v679 + v471 * 4);
              v472 += v473 * v473;
              ++v471;
            }
            while (v471 != 3);
            v474 = v536[v467] / -1000;
            v475 = U4sqrt(v472);
            if (!v467)
            {
              v652.i32[0] = 0;
              v468 = v474 + v475;
            }
            v476 = *((_DWORD *)v606 + v467);
            if (v476 < 1)
            {
              v477 = 0;
            }
            else
            {
              v477 = (437 * (v474 + v475 - v468) + 65550) >> 17;
              if (v477 >= 0)
                v478 = (437 * (v474 + v475 - v468) + 65550) >> 17;
              else
                v478 = -v477;
              v469 &= v478 <= v476;
            }
            v252 = v530;
            v652.i32[v467++] = v477;
            ++v470;
          }
          while (v467 != v268);
          if ((v469 & 1) == 0)
          {
            LODWORD(v254) = v548;
            if (g_Logging_Cfg >= 5)
              EvLog_VecI4("SearchPrLs: CheckFit   FAIL , Unused msCorr_Fit: ", v268, v652.i32);
            goto LABEL_308;
          }
          LODWORD(v254) = v548;
          if (g_Logging_Cfg >= 5)
            EvLog_VecI4("SearchPrLs: CheckFit    OK , msCorr_Fit: ", v268, v652.i32);
          v479 = 0;
          v480 = 0;
          do
          {
            v481 = v652.i32[v479];
            if (v481 >= 0)
              v482 = v652.i32[v479];
            else
              v482 = -v481;
            v483 = *(_DWORD *)((char *)v645 + v479 * 4);
            v484 = v482 + v483;
            v485 = *(_DWORD *)((char *)v606 + v479 * 4);
            if (v484 > v485)
            {
              v486 = v483 - v485;
              v487 = v485 - v483;
              if (v481 > 0)
                v486 = v487;
              v652.i32[v479] = v486;
              v480 = 1;
            }
            ++v479;
          }
          while (v268 != v479);
          if ((v480 & (g_Logging_Cfg > 4)) == 1)
            EvLog_VecI4("SearchPrLs: CheckFit    OK ADJ , msCorr_Fit: ", v268, v652.i32);
        }
        v270 = 0;
        v575 = (v268 - 1);
        v271 = &(*v252)[2];
        do
        {
          v272 = (float64x2_t *)((char *)v679 + v270);
          v273 = *((_QWORD *)v271 - 1);
          v274.i64[0] = (int)v273;
          v274.i64[1] = SHIDWORD(v273);
          *v272 = vcvtq_f64_s64(v274);
          v275 = *v271;
          v271 += 3;
          v272[1].f64[0] = (double)v275;
          v270 += 24;
        }
        while (24 * v268 != v270);
        v736 = 0uLL;
        LODWORD(v737) = 0;
        if (v257 >= 1)
        {
          if (v257 >= (int)v268)
            v276 = v268;
          else
            v276 = v257;
          v277 = v735;
          v278 = v536;
          do
          {
            v279 = *v278++;
            *v277++ = (double)v279;
            --v276;
          }
          while (v276);
        }
        v578 = 0;
        v280 = 0;
        v563 = &v735[v257];
        v565 = v268 - v257;
        v560 = (char *)v728 + 4 * v257;
        v562 = &v536[v257];
        v556 = (char *)&v736 + 4 * v257;
        v558 = &v652.i8[4 * v257];
        v281 = v257;
        v550 = v645[0];
        v282 = *(_QWORD *)&v596[24];
        while (2)
        {
          LODWORD(v643.f64[0]) = 0;
          LODWORD(v641.f64[0]) = 0;
          if (v257 < (int)v268)
          {
            v283 = (int *)v556;
            v284 = v558;
            v285 = v560;
            v286 = v562;
            v287 = v563;
            v288 = v565;
            do
            {
              v290 = *v283++;
              v289 = v290;
              v291 = *(_DWORD *)v284;
              v284 += 4;
              v292 = v291 + v289;
              *v285++ = v292;
              v293 = *v286++;
              *v287++ = (double)(v293 + 299792 * v292);
              --v288;
            }
            while (v288);
          }
          ++v578;
          v666.i64[1] = v282;
          v665 = *(uint32x4_t *)v596;
          v666.i64[0] = *(_QWORD *)&v596[16];
          if (!CompPr_LSQ4((double (*)[3])v679, v735, v268, (double *)v665.i64, (int *)&v643, (unsigned int *)&v641, v650.f64))
          {
            v312 = 0;
            goto LABEL_355;
          }
          v567 = v280;
          if (v254 >= 6)
          {
            v294 = 0;
            v295 = 0;
            v296 = *(double *)v665.i64;
            v585[0] = (int)*(double *)v665.i64 / 1000;
            v585[1] = (int)*(double *)&v665.i64[1] / 1000;
            v585[2] = (int)*(double *)v666.i64 / 1000;
            do
            {
              v297 = (*v252)[v294] / 1000 - v585[v294];
              v295 += v297 * v297;
              ++v294;
            }
            while (v294 != 3);
            v298 = 0;
            v299 = *v536 / 1000 - U4sqrt(v295);
            v300 = v252;
            do
            {
              v301 = 0;
              v302 = 0;
              v304 = *((_DWORD *)v606 + v298);
              do
              {
                v305 = (*v300)[v301] / 1000 - v585[v301];
                v302 += v305 * v305;
                ++v301;
              }
              while (v301 != 3);
              v303 = v536[v298];
              v306 = v299 + v303 / -1000 + U4sqrt(v302);
              if (v306 < 0)
                v306 = -v306;
              if (v306 < 0x97)
              {
                v309 = 0;
              }
              else
              {
                if (v306 >= 450)
                  v307 = 450;
                else
                  v307 = v306;
                v308 = v306 - v307 + 299;
                v306 = v306 - 300 * (v308 / 0x12C) - 300;
                v309 = v308 / 0x12C + 1;
              }
              v252 = v530;
              if (v306 < 0)
                v306 = -v306;
              v311 = v309 > v304 || v306 > 0xF;
              if (++v298 >= v259)
                break;
              ++v300;
            }
            while (!v311);
            if (v311)
            {
              EvLog_v("SearchPrLs:  BAD %d %d %d  %g %g %g   ClkB %g   ResSq %d", v298, v578, v547, v650.f64[0] * 57.2957795, v650.f64[1] * 57.2957795, v651, v296, LODWORD(v641.f64[0]));
              v312 = 0;
              LODWORD(v254) = v548;
              v257 = v553;
              LODWORD(v268) = v571;
              goto LABEL_354;
            }
            LODWORD(v254) = v548;
            v257 = v553;
            LODWORD(v268) = v571;
          }
          v313 = LODWORD(v641.f64[0]);
          if (LODWORD(v641.f64[0]) <= 0x57E3)
          {
            dword_2579E5F78 = LODWORD(v641.f64[0]);
            if (g_Logging_Cfg >= 5)
            {
              EvLog_v("SearchPrLs: GOOD %d %d %d  %g %g %g   ClkB %g  ResSq %d", v268, v578, v547, v650.f64[0] * 57.2957795, v650.f64[1] * 57.2957795, v651, *(double *)v665.i64, LODWORD(v641.f64[0]));
              EvLog_VecI4("SearchPrLs: GOOD msCorr", v268, (int *)v728);
            }
            __x = (int8x16_t)v650;
            v592 = v651;
            v312 = 1;
LABEL_354:
            v280 = v567;
LABEL_355:
            v314 = LODWORD(v643.f64[0]);
            v315 = (*((_DWORD *)&v736 + v575) < 1) - *((_DWORD *)&v736 + v575);
            *((_DWORD *)&v736 + v575) = v315;
            if ((int)v575 > v257)
            {
              v316 = v575;
              do
              {
                if (v315 <= *((_DWORD *)v645 + v316))
                  break;
                v317 = (char *)&v736 + 4 * v316;
                v315 = (*((_DWORD *)v317 - 1) < 1) - *((_DWORD *)v317 - 1);
                *(_QWORD *)(v317 - 4) = v315;
                --v316;
              }
              while (v316 > v281);
            }
            v280 += v314;
            if (v257)
            {
              if (v257 >= (int)v268)
                goto LABEL_380;
              v318 = *((_DWORD *)&v736 + v281);
              v319 = *((_DWORD *)v645 + v281);
            }
            else
            {
              v318 = v736;
              v319 = v550;
            }
            if (v312 & 1 | (v318 > v319) || v280 > 149)
            {
LABEL_380:
              if ((v312 & 1) != 0)
              {
                v322 = v280;
                v267 = 1;
                v14 = (_DWORD *)&unk_257A47000;
                v8 = v524;
                v15 = (double *)&unk_2579E2000;
                v323 = v544;
              }
              else
              {
                if ((int)v254 >= 5)
                  v488 = 250000 * v268;
                else
                  v488 = 22500;
                dword_2579E5F78 = LODWORD(v598[0]);
                v14 = (int *)&unk_257A47000;
                v8 = v524;
                v15 = (double *)&unk_2579E2000;
                v323 = v544;
                if (LODWORD(v598[0]) >= v488)
                {
                  v322 = v280;
                  if (g_Logging_Cfg >= 5)
                    EvLog_v("SearchPrLs: FAIL %d %d %d", v578, v547, v280);
                  v267 = 0;
                }
                else
                {
                  v322 = v280;
                  __x = v675;
                  v592 = *(double *)v676;
                  if (g_Logging_Cfg >= 5)
                    EvLog_v("SearchPrLs:   OK %d %d %d  %g %g %g   ClkB %g  ResSq %d", v571, v578, v547, *(double *)__x.i64 * 57.2957795, *(double *)&__x.i64[1] * 57.2957795, v592, *(double *)v665.i64, LODWORD(v598[0]));
                  v267 = 1;
                }
              }
              byte_2579E5F7C = v323 & 1;
              byte_2579E5F73 = v267;
              byte_2579E5F74 = v322;
              goto LABEL_602;
            }
            continue;
          }
          break;
        }
        if (LODWORD(v641.f64[0]) < LODWORD(v598[0]))
        {
          v320 = 0;
          goto LABEL_372;
        }
        if (LODWORD(v641.f64[0]) < HIDWORD(v598[0]))
        {
          v320 = 1;
          goto LABEL_372;
        }
        if (LODWORD(v641.f64[0]) >= LODWORD(v598[1]))
        {
          if (LODWORD(v641.f64[0]) >= HIDWORD(v598[1]))
          {
            v312 = 0;
            v280 = v567;
            goto LABEL_355;
          }
          v320 = 3;
        }
        else
        {
          v320 = 2;
LABEL_372:
          memmove(&v676[6 * v320 + 2], (char *)&v675 + 24 * v320, 24 * (v320 ^ 3));
          memmove((void *)(((unint64_t)v598 | (4 * v320)) + 4), (const void *)((unint64_t)v598 | (4 * v320)), 4 * (v320 ^ 3));
          v252 = v530;
        }
        v321 = (double *)&v675.i64[3 * v320];
        *(float64x2_t *)v321 = v650;
        v321[2] = v651;
        *(_DWORD *)((unint64_t)v598 | (4 * v320)) = v313;
        if (g_Logging_Cfg < 5)
        {
          v312 = 0;
          LODWORD(v268) = v571;
        }
        else
        {
          LODWORD(v268) = v571;
          EvLog_v("SearchPrLs: WAIT %d %d %d  %g %g %g   ClkB %g  ResSq %d", v571, v578, v547, v650.f64[0] * 57.2957795, v650.f64[1] * 57.2957795, v651, *(double *)v665.i64, LODWORD(v598[0]));
          EvLog_VecI4("SearchPrLs: WAIT msCorr", v571, (int *)v728);
          v312 = 0;
        }
        v280 = v567;
        v257 = v553;
        goto LABEL_355;
      }
    }
    v264 = *v555;
    if (v264 == 2)
      v265 = 14;
    else
      v265 = 22;
    if (v264 == 3)
      v266 = 11;
    else
      v266 = v265;
    *((_DWORD *)v606 + v255) = v266;
    goto LABEL_293;
  }
  Comp_ErrorEllipse(v1, v2, v3, (double *)&v582, (double *)&v582 + 1, (double *)&v583);
  xmmword_2579E5F58 = (__int128)__x;
  if (v522 >= 5)
    v212 = 5;
  else
    v212 = v522;
  if (v212 <= 3)
    v212 = 3;
  v213 = User_Velocity_Compensation[v212 - 3];
  v214 = *(double *)&v582 * v213;
  v215 = v213 * *((double *)&v582 + 1);
  *(double *)&v582 = v214;
  *((double *)&v582 + 1) = v215;
  v216 = v214 * 0.00000320473867;
  v217 = v214 * 0.00000320473867 * v215;
  if (v522 >= 8)
  {
    v218 = v217 * 0.0016;
    v219 = 2.0;
    if (v217 * 0.0016 <= 2500.0 && v218 * 4.0 >= 2500.0)
      v219 = sqrt(2500.0 / v218);
    v214 = v214 * v219;
    *(double *)&v582 = v214;
    v220 = v215 * v219;
    goto LABEL_227;
  }
  v220 = 200000.0;
  if (v214 < 200000.0)
  {
    *(_QWORD *)&v582 = 0x41086A0000000000;
    v220 = 200000.0;
    v214 = 200000.0;
    goto LABEL_227;
  }
  if (v215 < 200000.0 && v217 < 1562500.0)
  {
    if (v216 * 200000.0 > 1562500.0)
      v220 = 1562500.0 / v216;
LABEL_227:
    *((double *)&v582 + 1) = v220;
    v215 = v220;
  }
  if (v215 * (v214 * 3.14159265) * 0.000001 > 1562500.0)
    goto LABEL_263;
  v577 = (float64x2_t)__x;
  memset(v598, 0, sizeof(v598));
  v221 = *(double *)&v583;
  bzero(&v675, 0x4A0uLL);
  v222 = 0;
  v734 = 0u;
  v733 = 0u;
  v732 = 0u;
  v731 = 0u;
  v730 = 0u;
  v729 = 0u;
  v223 = -83886080;
  memset(v728, 0, sizeof(v728));
  do
  {
    v224 = (int32x2_t *)&v675.i8[v222];
    *v224 = 0;
    v224[1] = vdup_n_s32(v223);
    v222 += 148;
    v223 += 0x10000;
  }
  while (v222 != 1184);
  v225 = 0;
  v226 = 0;
  v227 = 0;
  v546 = 0;
  v228 = v606;
  v229 = v679;
  v230 = v530;
  do
  {
    v231 = v530[v225][0];
    if ((_DWORD)v231)
    {
      v231 = v530[v225][1];
      if ((_DWORD)v231)
      {
        v231 = v530[v225][2];
        if ((_DWORD)v231)
        {
          for (i = 0; i != 3; ++i)
          {
            v233 = (*v230)[i];
            if (v233 > 0)
              v234 = 500;
            else
              v234 = -500;
            *((_DWORD *)v229 + i) = (v234 + v233) / 1000;
            v228[i] = (double)v233;
          }
          v235 = 274877907 * (v536[v225] + 500);
          *((_DWORD *)v645 + v225) = (v235 >> 38) + ((unint64_t)v235 >> 63);
          if (*(_DWORD *)(v552 + 4 * v225) == 1)
          {
            ++v227;
            v236 = 250000;
          }
          else
          {
            v236 = 2250000;
          }
          v226 += v236;
          v231 = ++v546;
        }
      }
    }
    ++v225;
    v228 += 3;
    v229 = (_OWORD *)((char *)v229 + 12);
    ++v230;
  }
  while (v225 != 128);
  v237 = v221 * 0.0174532925;
  if (v546 >= 1)
  {
    v238 = 0;
    while (1)
    {
      v239 = v555[v238];
      if (v239 == 1)
        break;
      if (v239 == 3)
      {
        v241 = 0;
        goto LABEL_256;
      }
      if (v239 != 2)
        break;
      v240 = *v555;
      if (v240 == 3)
      {
        v241 = 2;
        goto LABEL_256;
      }
      if (v240 == 2)
      {
        v241 = 4;
LABEL_256:
        *((_BYTE *)v728 + v238) = v241;
      }
      if (v546 == ++v238)
        goto LABEL_258;
    }
    v241 = 22;
    goto LABEL_256;
  }
LABEL_258:
  *(int32x2_t *)&v598[0] = vmovn_s64(vcvtq_n_s64_f64(v577, 0xFuLL));
  v242 = LODWORD(v598[0]);
  if (SLODWORD(v598[0]) < 0)
    v242 = -LODWORD(v598[0]);
  LODWORD(v231) = vcvtd_n_s64_f64(v237, 0xFuLL);
  LODWORD(v598[1]) = ((40839 * (v242 >> 1)) >> 14) + 6335439;
  HIDWORD(v598[1]) = v231;
  Taylor_sin_cos(v231, (int *)&v598[2], (int *)&v598[2] + 1);
  v243 = HIDWORD(v598[1]);
  v520 = v227;
  v521 = v226;
  if (v237 < 0.785398163 || v237 > 2.35619449)
  {
    v244 = -v237;
    v243 = (HIDWORD(v598[1]) - 51472);
    v245 = v215;
  }
  else
  {
    v244 = 1.57079633 - v237;
    v245 = v214;
    v214 = v215;
  }
  Taylor_sin_cos(v243, (int *)&v598[2], (int *)&v598[2] + 1);
  v324 = v214 * v214;
  v325 = v214 * v214 / (v245 * v245);
  v326 = tan(v244);
  v327 = v325 + v326 * v326;
  v328 = (int)(v245 * sqrt(v327));
  *(double *)v329.i64 = cos(v244);
  v331 = v546;
  if (v328 >= 1)
  {
    v528 = (int)(25000.0 / fabs(*(double *)v329.i64));
    v527 = v328 - v528;
    v532 = SLODWORD(v598[1]) >> 6;
    v533 = LODWORD(v598[2]);
    v332 = v324 * v327;
    v333 = HIDWORD(v598[2]);
    v531 = HIDWORD(v598[2]);
    v334 = v598[0];
    v541 = xmmword_2579E5F80;
    v542 = DWORD2(xmmword_2579E5F80);
    v543 = DWORD1(xmmword_2579E5F80);
    v540 = DWORD1(gDebug);
    v568 = gDebug;
    v335 = 0;
    v554 = v328;
    do
    {
      v336 = (double)v335;
      v337 = v332 + -(v336 * v336) * v325;
      if (v337 < 0.0)
        v337 = 0.0;
      v338 = (int)(v326 * (1.0 / v327) * v336);
      v339 = (int)(1.0 / v327 * sqrt(v337));
      v534 = v339;
      v535 = -v335;
      v340 = 1;
      v539 = v335;
      while (1)
      {
        LODWORD(v641.f64[0]) = 0;
        LODWORD(v639.f64[0]) = 0;
        v538 = v340;
        if (v340 == 2)
          v341 = -v338;
        else
          v341 = v338;
        v342 = v339 - v341;
        if (v340 == 2)
          v335 = v535;
        v343 = v342 >> 9;
        v344 = (v335 + (int)(v326 * (double)(v339 - v341))) >> 9;
        v345 = LODWORD(v334) + 8 * ((v333 * (v342 >> 9) - v344 * v533) / v532);
        LODWORD(v346) = 102944 - v345;
        if (v345 <= 51472)
          LODWORD(v346) = LODWORD(v334) + 8 * ((v333 * (v342 >> 9) - v344 * v533) / v532);
        v346 = v345 >= -51472 ? v346 : (-102944 - v345);
        v347 = (int)v346 >= 0 ? v346 : -(int)v346;
        if (v347 >> 8 > 0xC8)
          break;
        v537 = v341;
        v348 = -v339 - v341;
        v579 = v335 + (int)(v326 * (double)v348);
        v545 = v346;
        Taylor_sin_cos(v346, (int *)&v641, (int *)&v639);
        v349 = LODWORD(v639.f64[0]);
        v551 = LODWORD(v639.f64[0]);
        if (SLODWORD(v639.f64[0]) < 0)
          v349 = -LODWORD(v639.f64[0]);
        v350 = ((99658 * v349) >> 15) * (((17965 * v347) >> 23) | 0x8000);
        v351 = 8 * ((v533 * v343 + v344 * v333) / (int)(v350 >> 15));
        LODWORD(v352) = HIDWORD(v334) + v351;
        v353 = (v533 * (v348 >> 9) + (v579 >> 9) * v333) / (int)(v350 >> 15);
        v354 = HIDWORD(v334) + 8 * v353;
        v355 = v351 <= 8 * v353;
        if (v351 <= 8 * v353)
          v356 = HIDWORD(v334) + 8 * v353;
        else
          v356 = HIDWORD(v334) + v351;
        if (v355)
          v352 = v352;
        else
          v352 = v354;
        v357 = 102944;
        v358 = 4294864352;
        if (v356 - (int)v352 <= 205887)
        {
          if ((int)v352 >= -205887)
          {
            if (v356 <= 205886)
            {
              v357 = v356;
              v358 = v352;
            }
            else
            {
              v357 = v356 % 0x3243Fu;
              v358 = v352 - 205887 * (v356 / 0x3243Fu);
            }
          }
          else
          {
            v359 = -(int)v352 % 0x3243Fu;
            v358 = -v359;
            v357 = v356 - v352 - v359;
          }
        }
        v360 = LODWORD(v641.f64[0]);
        v361 = 0x18EA2312 / U4sqrt(~(4 * v360 * v360 / 0x95u));
        if (v331 >= 1)
        {
          v362 = v546 + 1;
          do
          {
            v363 = v362 - 2;
            v364 = *((_DWORD *)v679 + 3 * (v362 - 2) + 2)
                 - ((int)((v361 - ((112313 * v361 + 0x1000000) >> 24)) * v360) >> 15);
            v665.i32[v363] = v364 * v360;
            *((_DWORD *)v735 + v363) = v364 * v364;
            --v362;
          }
          while (v362 > 1);
        }
        v365 = v554;
        if ((int)v358 <= v357)
        {
          v366 = v358;
          v564 = v345 - 51473;
          v549 = (int)(v361 * v551 + 0x8000) >> 15;
          v561 = 0x30D40000 / (v350 >> 9);
          v559 = v357 - v561;
          v566 = v357;
          while (1)
          {
            v585[0] = 0;
            LODWORD(v643.f64[0]) = 0;
            v743 = 0u;
            v742 = 0u;
            v741 = 0u;
            v740 = 0u;
            v739 = 0u;
            v738 = 0u;
            v367 = 205887;
            v737 = 0u;
            v736 = 0u;
            if ((int)v366 < -102944 || (v367 = -205887, v368 = v366, (int)v366 > 102943))
              v368 = (v367 + v366);
            if (v564 < 0xFFFE6DDF)
            {
              if ((v368 & 0x80000000) != 0)
                v368 = (v368 + 102944);
              else
                v368 = (v368 - 102944);
            }
            Taylor_sin_cos(v368, (int *)v585, (int *)&v643);
            v572 = v366;
            if (v331 < 1)
            {
              v386 = 0;
              v387 = 0;
LABEL_452:
              v388 = 0;
              v389 = 1000000 * v386;
              v390 = v676;
              while (1)
              {
                v391 = HIBYTE(v675.i32[37 * v388 + 2]);
                if (v331 < 1 || v391 > 0xFA)
                  break;
                v392 = 0;
                do
                {
                  v393 = *((unsigned __int8 *)v390 + v392);
                  v394 = *((unsigned __int8 *)&v736 + v392++);
                }
                while (v392 < v546 && v393 == v394);
                if (v393 == v394)
                  goto LABEL_463;
                ++v388;
                v390 += 37;
                if (v388 == 8)
                  goto LABEL_473;
              }
              if (v391 < 0xFB)
              {
LABEL_463:
                if ((v388 & 0x80000000) == 0)
                {
                  v395 = v388;
                  v396 = &v675.i32[37 * v388];
                  v398 = (unsigned int *)(v396 + 2);
                  v397 = v396[2];
                  if (v389 < v397)
                    v397 = v389;
                  *v398 = v397 >> 1;
                  if (!(_DWORD)v388)
                  {
                    v365 = v554;
                    goto LABEL_491;
                  }
                  v399 = 0;
                  v400 = v566;
                  do
                  {
                    if (*v398 >= v675.i32[37 * v399 + 2])
                    {
                      ++v399;
                    }
                    else
                    {
                      v401 = *((uint32x4_t *)v396 + 7);
                      v402 = (uint32x4_t *)((char *)&v675 + 148 * v399);
                      v658 = *((uint32x4_t *)v396 + 6);
                      v659 = v401;
                      v660 = *((uint32x4_t *)v396 + 8);
                      LODWORD(v661) = v396[36];
                      v403 = *((uint32x4_t *)v396 + 3);
                      v654 = *((uint32x4_t *)v396 + 2);
                      v655 = v403;
                      v404 = *((uint32x4_t *)v396 + 5);
                      v656 = *((uint32x4_t *)v396 + 4);
                      v657 = v404;
                      v405 = *((uint32x4_t *)v396 + 1);
                      v406 = v399 + 1;
                      v652 = *(uint32x4_t *)v396;
                      v653 = v405;
                      memmove((char *)v402[9].i64 + 4, v402, 148 * (v395 - v399));
                      v407 = v659;
                      v402[6] = v658;
                      v402[7] = v407;
                      v402[8] = v660;
                      v402[9].i32[0] = v661;
                      v408 = v655;
                      v402[2] = v654;
                      v402[3] = v408;
                      v409 = v657;
                      v402[4] = v656;
                      v402[5] = v409;
                      v329 = v652;
                      v330 = v653;
                      v399 = v406;
                      *v402 = v652;
                      v402[1] = v330;
                    }
                  }
                  while (v399 != v395);
                  v365 = v554;
                  v410 = v572;
                  goto LABEL_492;
                }
              }
LABEL_473:
              v411 = 0;
              v412 = v545;
              while (v389 >= v675.i32[v411 + 2])
              {
                v411 += 37;
                if (v411 == 296)
                  goto LABEL_491;
              }
              if (v411 != 259)
              {
                memmove(&v677[v411], &v675.i8[v411 * 4], 1036 - v411 * 4);
                v412 = v545;
              }
              v413 = &v675.i32[v411];
              v413[1] = v368;
              v413[2] = v389;
              *v413 = v412;
              v414 = v741;
              *((_OWORD *)v413 + 5) = v740;
              *((_OWORD *)v413 + 6) = v414;
              v415 = v743;
              *((_OWORD *)v413 + 7) = v742;
              *((_OWORD *)v413 + 8) = v415;
              v416 = v737;
              *((_OWORD *)v413 + 1) = v736;
              *((_OWORD *)v413 + 2) = v416;
              v329 = v738;
              v330 = v739;
              *((uint32x4_t *)v413 + 3) = v738;
              *((uint32x4_t *)v413 + 4) = v330;
              v413[36] = v387;
              goto LABEL_491;
            }
            v557 = v368;
            v369 = 0;
            v370 = 0;
            v371 = 0;
            v580 = (LODWORD(v643.f64[0]) * v549) >> 15;
            v372 = (signed int)(v585[0] * v549) >> 15;
            v373 = (LODWORD(v643.f64[0]) * v551) >> 15;
            v374 = (signed int)(v585[0] * v551) >> 15;
            v375 = (_DWORD *)v679 + 1;
            do
            {
              v376 = *(v375 - 1) - v580;
              v377 = *v375 - v372;
              v378 = v665.i32[v369] + v376 * v373 + v377 * v374;
              v379 = U4sqrt(v376 * v376 + v377 * v377 + *((_DWORD *)v735 + v369));
              if (v378 < 0 && v378 / v379 <= -2857)
              {
                DWORD1(gDebug) = ++v540;
                v331 = v546;
                v365 = v554;
LABEL_491:
                v400 = v566;
                v410 = v572;
                goto LABEL_492;
              }
              if (!v369)
                v370 = LODWORD(v645[0]) - v379;
              v380 = *((_DWORD *)v645 + v369) - v379 - v370;
              v381 = *((unsigned __int8 *)v728 + v369);
              if (*((_BYTE *)v728 + v369))
              {
                v382 = (437 * v380 + 65550) >> 17;
                if (v382 >= 0)
                  v383 = (437 * v380 + 65550) >> 17;
                else
                  v383 = -v382;
                *((_BYTE *)&v736 + v369) = v382;
                if (v383 > v381)
                {
                  DWORD2(xmmword_2579E5F80) = ++v542;
LABEL_481:
                  v331 = v546;
                  v365 = v554;
                  goto LABEL_491;
                }
                v380 -= (613975 * v382) >> 11;
              }
              *((_DWORD *)v650.f64 + v369) = v380;
              if (v380 >= 0)
                v384 = v380;
              else
                v384 = -v380;
              if (v384 >= 0x1A)
              {
                DWORD1(xmmword_2579E5F80) = ++v543;
                goto LABEL_481;
              }
              v375 += 3;
              v371 += v380;
              ++v369;
            }
            while (v546 != v369);
            v331 = v546;
            if (v546 >= 15)
              v385 = v371 / v546;
            else
              v385 = (v371 * num_SV_Div_Table[v546]) >> 15;
            v365 = v554;
            v410 = v572;
            LODWORD(v368) = v557;
            v386 = 0;
            v387 = v385 + v370;
            v417 = &v650;
            v418 = v546;
            v400 = v566;
            do
            {
              v419 = LODWORD(v417->f64[0]);
              v417 = (float64x2_t *)((char *)v417 + 4);
              v386 += (v419 - v385) * (v419 - v385);
              if (v386 > 225 * v546)
              {
                LODWORD(xmmword_2579E5F80) = ++v541;
                goto LABEL_492;
              }
              --v418;
            }
            while (v418);
            if (v386 <= 0x1072)
              goto LABEL_452;
LABEL_492:
            ++v568;
            v420 = v559;
            if (v410 >= v400 || v410 <= v559)
              v420 = v410;
            v366 = v420 + v561;
            if ((int)v366 > v400)
            {
              LODWORD(gDebug) = v568;
              break;
            }
          }
        }
        v335 = v539;
        v333 = v531;
        v338 = v537;
        v339 = v534;
        if (v539)
        {
          v340 = v538 + 1;
          v335 = v539;
          if (v538 < 2)
            continue;
        }
        goto LABEL_504;
      }
      EvLog_d("SearchEllipse: Stop Candidate search near the poles - ", v346);
      v541 = xmmword_2579E5F80;
      v542 = DWORD2(xmmword_2579E5F80);
      v543 = DWORD1(xmmword_2579E5F80);
      v365 = v554;
      v540 = DWORD1(gDebug);
      v568 = gDebug;
      v335 = v554;
LABEL_504:
      if (v335 < v365 && v335 > v527)
        v335 = v527;
      v335 += v528;
    }
    while (v335 < v365);
  }
  if (v675.i32[2] < 0xFB000000)
  {
    v423 = 0;
    v424 = (char *)v676;
    v329 = (uint32x4_t)vdupq_n_s64(0x3F00000000000000uLL);
    *(uint32x4_t *)v573 = v329;
    do
    {
      v425 = &v675.i32[37 * v423];
      v427 = v425 + 2;
      v426 = v425[2];
      if (v426 >= 0xFB000000)
        break;
      v585[0] = 0;
      v428.i64[0] = (int)*(_QWORD *)v425;
      v428.i64[1] = (int)HIDWORD(*(_QWORD *)v425);
      v581 = vcvtq_f64_s64(v428);
      v650 = vmulq_f64(v581, *(float64x2_t *)v573);
      v651 = 0.0;
      Geo2ECEF((uint64_t)&v650, (uint64_t)&WGS84_Datum, (double *)v652.i64);
      v429 = 1000 * v676[37 * v423 + 32];
      v665 = v652;
      *(double *)&v666.i64[1] = (double)v429;
      v666.i64[0] = v653.i64[0];
      EvLog_v("SearchEllipse: Best Points: %d  %g %g  %u", v546, 0.00174852843 * v581.f64[0], vmuld_lane_f64(0.00174852843, v581, 1), v426);
      if (v546 >= 1)
      {
        v430 = v735;
        v431 = v536;
        v432 = v424;
        v433 = v546;
        do
        {
          v435 = *v431++;
          v434 = v435;
          v436 = *v432++;
          *v430++ = (double)(v434 - 299792 * v436);
          --v433;
        }
        while (v433);
      }
      if (CompPr_LSQ4((double (*)[3])v606, v735, v546, (double *)v665.i64, (int *)&v736, v585, v650.f64))
      {
        v437 = vmovn_s64(vcvtq_n_s64_f64(v650, 0xFuLL));
        *(int32x2_t *)v425 = v437;
        v438 = v585[0];
        *v427 = v585[0];
        EvLog_v("SearchEllipse: LSQ Upd %d %d   ResSq %d", v437.i32[0], v437.i32[1], v438);
      }
      else
      {
        *v427 = -83886080;
        EvDbg_v("SearchEllipse: ERROR DID NOT CONVERGE!");
      }
      ++v423;
      v424 += 148;
    }
    while (v423 != 8);
  }
  v439 = 0;
  v440 = &v678;
  v441 = -7;
  v14 = (_DWORD *)&unk_257A47000;
  v8 = v524;
  v15 = (double *)&unk_2579E2000;
  do
  {
    if (v439 > 6)
    {
      v444 = v439;
    }
    else
    {
      v442 = v440;
      v443 = v441;
      v444 = v439;
      do
      {
        v445 = *v442;
        v442 += 37;
        if (v445 < v675.i32[37 * v444 + 2])
          v444 = v443 + 8;
        v162 = __CFADD__(v443++, 1);
      }
      while (!v162);
    }
    if (v439 != v444)
    {
      v446 = &v675.i32[37 * v439];
      v447 = *((_OWORD *)v446 + 7);
      v671 = *((_OWORD *)v446 + 6);
      v672 = v447;
      v673 = *((_OWORD *)v446 + 8);
      v674 = v446[36];
      v448 = *((_OWORD *)v446 + 3);
      v667 = *((_OWORD *)v446 + 2);
      v668 = v448;
      v449 = *((_OWORD *)v446 + 5);
      v669 = *((_OWORD *)v446 + 4);
      v670 = v449;
      v450 = *((uint32x4_t *)v446 + 1);
      v665 = *(uint32x4_t *)v446;
      v666 = v450;
      v451 = &v675.i32[37 * v444];
      v452 = *((_OWORD *)v451 + 1);
      *(_OWORD *)v446 = *(_OWORD *)v451;
      *((_OWORD *)v446 + 1) = v452;
      v453 = *((_OWORD *)v451 + 2);
      v454 = *((_OWORD *)v451 + 3);
      v455 = *((_OWORD *)v451 + 5);
      *((_OWORD *)v446 + 4) = *((_OWORD *)v451 + 4);
      *((_OWORD *)v446 + 5) = v455;
      *((_OWORD *)v446 + 2) = v453;
      *((_OWORD *)v446 + 3) = v454;
      v456 = *((_OWORD *)v451 + 6);
      v457 = *((_OWORD *)v451 + 7);
      v458 = *((_OWORD *)v451 + 8);
      v446[36] = v451[36];
      *((_OWORD *)v446 + 7) = v457;
      *((_OWORD *)v446 + 8) = v458;
      *((_OWORD *)v446 + 6) = v456;
      v459 = v672;
      *((_OWORD *)v451 + 6) = v671;
      *((_OWORD *)v451 + 7) = v459;
      *((_OWORD *)v451 + 8) = v673;
      v451[36] = v674;
      v460 = v668;
      *((_OWORD *)v451 + 2) = v667;
      *((_OWORD *)v451 + 3) = v460;
      v461 = v670;
      *((_OWORD *)v451 + 4) = v669;
      *((_OWORD *)v451 + 5) = v461;
      v329 = v665;
      v330 = v666;
      *(uint32x4_t *)v451 = v665;
      *((uint32x4_t *)v451 + 1) = v330;
    }
    ++v439;
    ++v441;
    v440 += 37;
  }
  while (v439 != 8);
  for (j = 0; j != 296; j += 37)
  {
    if (v675.i32[j + 2] >= 0xFB000000)
      break;
    EvLog_v("SearchEllipse: Best Points Upd: %d  %g %g  %u", v546, (double)v675.i32[j] * 0.00174852843, (double)v675.i32[j + 1] * 0.00174852843, v675.i32[j + 2]);
  }
  v463 = v675.u32[2];
  if (v678 < 0xFB000000 && v546 <= 4)
  {
    v252 = v530;
    if (v546 == v520 && (v465 = 10000 * v546, v675.i32[2] < (10000 * v546)))
    {
      if (v675.i32[2] >= (1089 * v546))
        v465 = 90000 * v546;
    }
    else
    {
      v465 = 1000000 * v546;
    }
    if (v678 < v465 + v675.i32[2])
    {
      EvLog_v("Ellipse Candidate INVALID as not better than the next: 0 %g %g %d   %d %g %g  %d   %d", (double)v675.i32[0] * 0.00174852843, (double)v675.i32[1] * 0.00174852843, v675.i32[2], 1, (double)v677[0] * 0.00174852843, (double)v677[1] * 0.00174852843, v678, v546);
      v463 = -83886080;
    }
  }
  else
  {
    v252 = v530;
  }
  v489 = 16000000 * v546;
  if (v546 <= 5)
    v489 = 0;
  v329.i32[0] = v463;
  v330.i32[0] = v521 + v489;
  dword_2579E5F38 = v463 / v546;
  v490.i64[0] = v675.i32[0];
  v490.i64[1] = v675.i32[1];
  v267 = v463 < v521 + v489;
  __x = vandq_s8((int8x16_t)vmulq_f64(vcvtq_f64_s64(v490), (float64x2_t)vdupq_n_s64(0x3F00000000000000uLL)), (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_u32(v330, v329), 0));
  v592 = 0.0;
LABEL_602:
  if (v14[692] >= 5)
  {
    v499 = mach_continuous_time();
    v500 = v529;
    v500.i32[2] = (unint64_t)(v15[455] * (double)v499);
    v529 = v500;
  }
  if (v267)
  {
    Geo2ECEF((uint64_t)&__x, (uint64_t)&WGS84_Datum, (double *)v679);
    *(_OWORD *)v596 = v679[0];
    *(_QWORD *)&v596[16] = *(_QWORD *)&v679[1];
    v502 = CompVelDoLs(v252, v525, v8, (double *)v596, (BOOL)&v588, v501);
  }
  else
  {
    v502 = 0;
  }
  if (v14[692] >= 5)
  {
    v503 = mach_continuous_time();
    v504 = v529;
    v504.i32[3] = (unint64_t)(v15[455] * (double)v503);
    v529 = v504;
  }
  v505 = __x.i64[0];
  if ((v502 & 1) != 0)
  {
    v506 = __sincos_stret(*(double *)__x.i64);
    v507 = __x.i64[1];
    v508 = __sincos_stret(*(double *)&__x.i64[1]);
    v509 = 0;
    v606[0] = -(v506.__sinval * v508.__cosval);
    v606[1] = -(v506.__sinval * v508.__sinval);
    v510 = &v606[2];
    v606[2] = v506.__cosval;
    v606[3] = -v508.__sinval;
    v607 = *(unint64_t *)&v508.__cosval;
    *(double *)&v608 = -(v506.__cosval * v508.__cosval);
    *((double *)&v608 + 1) = -(v506.__cosval * v508.__sinval);
    *(double *)&v609 = -v506.__sinval;
    v511 = v588;
    v512 = *(double *)&v589;
    do
    {
      v513 = *(v510 - 1) * *((double *)&v511 + 1) + *(v510 - 2) * *(double *)&v511;
      v514 = *v510;
      v510 += 3;
      *(double *)&v675.i64[v509++] = v513 + v514 * v512;
    }
    while (v509 != 3);
    v515 = *(double *)&v675.i64[1] * *(double *)&v675.i64[1] + *(double *)v675.i64 * *(double *)v675.i64;
    if (v522 >= 5)
      v516 = 5;
    else
      v516 = v522;
    if (v516 <= 3)
      v516 = 3;
    v517 = fabs(*(double *)v676);
    if (v517 < 10.0)
    {
      v518 = User_Velocity_Compensation[v516 - 3] * 1.5;
      v105 = v515 < v518 * v518;
    }
    else
    {
      v105 = 0;
    }
    dword_2579E5F94 = (int)sqrt(v515);
    dword_2579E5F98 = (int)v517;
    if (!v105)
      dword_2579E5F68 = 6;
  }
  else
  {
    v105 = 0;
    v507 = __x.i64[1];
  }
  v523->i64[0] = v505;
  v523->i64[1] = v507;
  xmmword_2579E5F40 = v582;
  qword_2579E5F50 = v583;
LABEL_624:
  if (v14[692] >= 5)
    EvLog_v("CAP Time Waypoints %u %d %d %d %d %d %d %d", v526.i32[0], v526.i32[1] - v526.i32[0], v526.i32[2] - v526.i32[0], v526.i32[3] - v526.i32[0], v529.i32[0] - v526.i32[0], v529.i32[1] - v526.i32[0], v529.i32[2] - v526.i32[0], v529.i32[3] - v526.i32[0]);
  return v105;
}

uint64_t CompVelDoLs(int (*a1)[3], __int16 (*a2)[3], __int16 *a3, double *a4, BOOL a5, double *a6)
{
  uint64_t v6;
  double *v7;
  double *v8;
  __int128 *v9;
  __int128 *v10;
  __int16 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _DWORD *v17;
  int v18;
  uint64_t result;
  double *v20;
  double v21;
  double v22;
  double v23;
  __double2 v24;
  __double2 v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  unsigned int v29;
  double v30;
  unsigned int v31;
  uint64_t v32;
  double *v33;
  int *v34;
  __int16 *v35;
  __int16 *v36;
  double *v37;
  int v38;
  int v39;
  int v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double *v52;
  double v53;
  double v54;
  BOOL v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  double v59;
  BOOL v61;
  uint64_t v62;
  double *v63;
  double *v64;
  int *v65;
  __int16 *v66;
  _DWORD *v67;
  int v68;
  int v69;
  int v70;
  double v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  double v76;
  double v77;
  int v78;
  __int16 *v79;
  int v80[2];
  char v81;
  char v82;
  _BYTE v83[128];
  _QWORD v84[128];
  char v85;
  _QWORD v86[60];
  char v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  int v92;
  _BYTE *v93;
  double *v94;
  _QWORD *v95;
  char *v96;
  char *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  double v132[4];
  __int128 v133;
  __int128 v134;
  double v135;
  uint64_t v136;
  double v137;
  double v138;
  __int128 v139;
  uint64_t v140;
  double v141[2];
  uint64_t v142;
  int v143[4];
  double v144;
  uint64_t v145;

  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = v7;
  v10 = v9;
  v79 = v11;
  v13 = v12;
  v14 = v6;
  v145 = *MEMORY[0x24BDAC8D0];
  bzero(v141, 0x1C00uLL);
  v15 = 0;
  v16 = 0;
  v87 = 0;
  memset(v86, 0, 457);
  v89 = 0;
  v86[59] = 0;
  v88 = 0;
  v90 = 0;
  v91 = 0;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v92 = 2;
  v94 = (double *)&v85;
  v93 = v83;
  v95 = v84;
  v96 = &v82;
  v97 = &v81;
  v86[58] = 0;
  v86[54] = 0;
  v98 = 0u;
  v99 = 0u;
  dword_2579E5F68 = 0;
  memset(v83, 0, sizeof(v83));
  v135 = 0.0;
  v134 = 0u;
  v133 = 0u;
  v17 = (_DWORD *)(v14 + 8);
  v18 = -1;
  memset(v132, 0, sizeof(v132));
  do
  {
    v84[v15] = 0x3FF0000000000000;
    if (*(v17 - 2) && *(v17 - 1) && *v17)
    {
      v83[v15] = 1;
      ++v16;
    }
    else if (v18 == -1)
    {
      v18 = v15;
    }
    v17 += 3;
    ++v15;
  }
  while (v15 != 128);
  HIDWORD(v91) = v18;
  if (v16 < 3)
    return 0;
  if (v18 == -1)
    goto LABEL_18;
  v20 = &v141[7 * v18];
  v143[0] = 0;
  LODWORD(v136) = 0;
  *(_QWORD *)v80 = 0;
  v139 = *v10;
  v140 = *((_QWORD *)v10 + 2);
  ECEF2Geo((double *)&v139, (uint64_t)&WGS84_Datum, (uint64_t)&v137);
  v21 = v138;
  if (v138 >= 3.14159265)
  {
    v22 = -6.28318531;
    goto LABEL_16;
  }
  if (v138 < -3.14159265)
  {
    v22 = 6.28318531;
LABEL_16:
    v21 = v138 + v22;
    v138 = v138 + v22;
  }
  v23 = v137;
  v24 = __sincos_stret(v137);
  v25 = __sincos_stret(v21);
  v132[0] = -(v24.__sinval * v25.__cosval);
  v132[1] = -(v24.__sinval * v25.__sinval);
  v132[2] = v24.__cosval;
  v132[3] = -v25.__sinval;
  v133 = *(unint64_t *)&v25.__cosval;
  *(double *)&v134 = -(v24.__cosval * v25.__cosval);
  *((double *)&v134 + 1) = -(v24.__cosval * v25.__sinval);
  v135 = -v24.__sinval;
  LODWORD(v26) = vcvtd_n_s64_f64(v23, 0xFuLL);
  v27 = Taylor_sin_cos(v26, v143, (int *)&v136);
  LODWORD(v27) = vcvtd_n_s64_f64(v21, 0xFuLL);
  Taylor_sin_cos(v27, &v80[1], v80);
  v28 = (double)(v80[1] * (int)v136);
  *v20 = (double)((int)v136 * v80[0]) * 9.31322575e-10;
  v20[1] = v28 * 9.31322575e-10;
  v20[2] = (double)v143[0] * 0.0000305175781;
LABEL_18:
  v29 = 0;
  *(_DWORD *)((char *)&v88 + 3) = -1;
  LODWORD(v88) = 50462976;
  HIBYTE(v88) = 4;
  LODWORD(v89) = 1;
  v30 = 0.0;
  do
  {
    v31 = v29;
    v32 = 0x1FFFFFFFFFFFFC80;
    v33 = v94;
    v34 = (int *)(v14 + 4);
    v35 = (__int16 *)(v13 + 4);
    v36 = v79;
    v37 = v94;
    do
    {
      v38 = *(v34 - 1);
      v39 = *v34;
      v40 = v34[1];
      if (!*(_QWORD *)(v34 - 1))
      {
        if (!v40)
          break;
        v39 = 0;
      }
      v41 = &v141[v32];
      v34 += 3;
      v42 = (double)v38 - *(double *)v10;
      v43 = (double)v39 - *((double *)v10 + 1);
      v44 = (double)v40 - *((double *)v10 + 2);
      v45 = 1.0 / sqrt(v43 * v43 + v42 * v42 + v44 * v44);
      v46 = *v36++;
      *v37++ = (double)v46 * 0.190293673
             - v45
             * (v43 * -(v8[1] - (double)*(v35 - 1) * 0.190293673)
              + v42 * -(*v8 - (double)*(v35 - 2) * 0.190293673)
              + v44 * -(v8[2] - (double)*v35 * 0.190293673))
             - v8[3];
      v41[896] = v42 * v45;
      v41[897] = v43 * v45;
      v41[898] = v44 * v45;
      v35 += 3;
      v32 += 7;
    }
    while (v32 * 8);
    if (v16 <= 4)
    {
      v47 = 0;
      v48 = SHIDWORD(v91);
      v93[SHIDWORD(v91)] = 1;
      v49 = *v8;
      v50 = v8[1];
      v51 = v8[2];
      v52 = &v132[2];
      do
      {
        v53 = *(v52 - 1) * v50 + *(v52 - 2) * v49;
        v54 = *v52;
        v52 += 3;
        *(double *)&v143[v47] = v53 + v54 * v51;
        v47 += 2;
      }
      while (v47 != 6);
      v33[v48] = -v144;
    }
    v55 = NK_Least_Squares_Core(v141, (double (*)[3])v132, 4, 0, 0, (uint64_t)&v139, (uint64_t)&v137, &v136, (uint64_t)v86);
    v56 = 0;
    v57 = 0.0;
    do
    {
      if ((*((char *)&v88 + v56) & 0x80000000) == 0)
      {
        v58 = *((unsigned __int8 *)&v88 + v56);
        v59 = *(double *)&v86[v58];
        v8[v58] = v8[v58] + v59;
        v57 = v57 + v59 * v59;
      }
      ++v56;
    }
    while (v56 != 7);
    v61 = (v57 <= v30 || v31 == 0) && v55;
    ++byte_2579E5F72;
    if (!v61)
    {
      if (v31 > 9)
        v78 = 1;
      else
        v78 = 2;
      goto LABEL_59;
    }
    if (v31 > 8)
      break;
    v29 = v31 + 1;
    v30 = v57;
  }
  while (v57 > 1.0);
  if (v31 > 8)
  {
    v78 = 1;
LABEL_59:
    v67 = &unk_2579E5000;
    goto LABEL_60;
  }
  v62 = 0;
  v63 = v94;
  v64 = (double *)&v142;
  v65 = (int *)(v14 + 8);
  v66 = (__int16 *)(v13 + 4);
  v67 = (_DWORD *)&unk_2579E5000;
  do
  {
    v68 = *(v65 - 2);
    v69 = *(v65 - 1);
    v70 = *v65;
    if (!*((_QWORD *)v65 - 1))
    {
      if (!v70)
        break;
      v69 = 0;
    }
    v65 += 3;
    v71 = (double)v68 - *(double *)v10;
    v72 = (double)v69 - *((double *)v10 + 1);
    v73 = (double)v70 - *((double *)v10 + 2);
    v74 = 1.0 / sqrt(v72 * v72 + v71 * v71 + v73 * v73);
    v63[v62] = (double)v79[v62] * 0.190293673
             - v74
             * (v72 * -(v8[1] - (double)*(v66 - 1) * 0.190293673)
              + v71 * -(*v8 - (double)*(v66 - 2) * 0.190293673)
              + v73 * -(v8[2] - (double)*v66 * 0.190293673))
             - v8[3];
    *(v64 - 2) = v71 * v74;
    *(v64 - 1) = v72 * v74;
    *v64 = v73 * v74;
    v64 += 7;
    ++v62;
    v66 += 3;
  }
  while (v62 != 128);
  v75 = 0;
  v76 = 0.0;
  do
  {
    if (v83[v75])
      v76 = v76 + v63[v75] * v63[v75];
    ++v75;
  }
  while (v75 != 128);
  v77 = (double)v16 * 4.0;
  if (v16 >= 5)
    v77 = 400.0;
  if (v76 > v77)
  {
    v78 = 4;
LABEL_60:
    result = 0;
    v67[986] = v78;
    return result;
  }
  return 1;
}

uint64_t CAP_LSQ4_Core(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v12;
  double v13;
  __int128 v14;
  uint64_t v15;
  double v16[4];
  double v17[4];
  double v18[5];
  float64x2_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a3 + 32) = 0x426D1A94A2000000;
  v4 = a3 + 32;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 72) = 0u;
  *(_OWORD *)(a3 + 104) = 0u;
  *(_OWORD *)(a3 + 136) = 0u;
  *(_OWORD *)(a3 + 120) = 0u;
  *(_OWORD *)(a3 + 88) = 0u;
  *(_OWORD *)(a3 + 56) = 0u;
  *(_QWORD *)(a3 + 48) = 0x426D1A94A2000000;
  *(_QWORD *)(a3 + 72) = 0x426D1A94A2000000;
  *(_QWORD *)(a3 + 104) = 0x426D1A94A2000000;
  v5 = a2 + (*(_DWORD *)(a3 + 152) >= 0);
  if ((int)v5 >= 1)
  {
    v6 = 0;
    v15 = 0;
    v7 = (double *)(a1 + 16);
    do
    {
      if (v6 == *(_DWORD *)(a3 + 152))
        v8 = 0.0;
      else
        v8 = 1.0;
      v19 = vnegq_f64(*(float64x2_t *)(v7 - 2));
      v9 = *v7;
      v7 += 3;
      v20 = -v9;
      v21 = v8;
      v10 = *(_QWORD *)(a3 + 168);
      v22 = *(_QWORD *)(*(_QWORD *)(a3 + 160) + 8 * v6);
      umeas(v4, 4u, *(double *)(v10 + 8 * v6++), v19.f64, v18, v17, (double *)&v15, 1.0e20);
    }
    while (v5 != v6);
  }
  ud2var(v4, 4u, 1, 4u, v16);
  if (v16[0] > 1000000000.0)
    return 0;
  v12 = 1;
  while (v12 != 4)
  {
    v13 = v16[v12++];
    if (v13 > 1000000000.0)
    {
      if ((unint64_t)(v12 - 2) < 3)
        return 0;
      break;
    }
  }
  v14 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)a3 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a3 + 16) = v14;
  return 1;
}

uint64_t CompPr_LSQ4(double (*a1)[3], double *a2, int a3, double *a4, int *a5, unsigned int *a6, double *a7)
{
  uint64_t v7;
  int v8;
  _DWORD *v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  double *v18;
  double v19;
  uint64_t v20;
  double v21;
  float64x2_t v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  float64x2_t v27;
  float64x2_t v28;
  double v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  double v34;
  double v35;
  int v36;
  unsigned int v37;
  double v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  double v42;
  double v43;
  double *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  unsigned int v56;
  double *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  double *v66;
  double v67;
  double v68;
  double v69;
  double *v70;
  unint64_t v71;
  double v72;
  int v74;
  uint64_t result;
  unsigned int v76;
  double v77;
  double v78;
  __double2 v79;
  __double2 v80;
  unint64_t v81;
  char v82;
  uint64_t v83;
  unint64_t v84;
  double v85;
  double v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  _DWORD *v96;
  double *v97;
  unsigned int *v98;
  double v99;
  int v100;
  double *v101;
  int v102;
  unsigned int v103;
  int v104[2];
  int v105[2];
  _BYTE v106[24];
  double __b[128];
  double v108[128];
  __int128 v109;
  __int128 v110;
  _OWORD v111[7];
  uint64_t v112;
  unsigned int v113;
  double *v114;
  double *v115;
  double v116[4];
  __int128 v117;
  __int128 v118;
  double v119;
  _QWORD v120[384];
  double v121;
  double v122;
  double v123;
  uint64_t v124;

  v7 = MEMORY[0x24BDAC7A8](a1);
  v96 = v9;
  v98 = v10;
  v12 = v11;
  v13 = v8;
  v15 = v14;
  v16 = v7;
  v124 = *MEMORY[0x24BDAC8D0];
  v112 = 0;
  memset(v111, 0, sizeof(v111));
  v110 = 0u;
  v109 = 0u;
  v114 = v108;
  v115 = __b;
  v113 = -1;
  dword_2579E5F68 = 0;
  memset(v116, 0, sizeof(v116));
  v17 = v8;
  v117 = 0u;
  v118 = 0u;
  v119 = 0.0;
  v100 = v8;
  v97 = v18;
  if (v8 < 1)
  {
    __b[v8] = 5.0;
    v113 = v8;
    v36 = v8;
  }
  else
  {
    memset_pattern16(__b, &unk_24BC0A170, 8 * v8);
    v19 = 5.0;
    if (v13 < 5 || (v19 = 25.0, v13 < 9))
    {
      __b[v17] = v19;
      v113 = v13;
    }
    v20 = 0;
    v21 = *(double *)v12;
    v22 = *(float64x2_t *)(v12 + 8);
    v23 = *(double *)(v12 + 24);
    do
    {
      v24 = v16 + 24 * v20;
      v25 = *(double *)v24;
      v26 = *(double *)v24 - v21;
      *(double *)v106 = v26;
      v27 = *(float64x2_t *)(v24 + 8);
      v28 = vsubq_f64(v27, v22);
      *(float64x2_t *)&v106[8] = v28;
      v29 = 0.0;
      v30 = 2;
      do
      {
        v29 = v29 + *(double *)&v106[8 * v30] * *(double *)&v106[8 * v30];
        v31 = v30-- + 1;
      }
      while (v31 > 1);
      v32 = 0;
      v33 = &v120[3 * v20];
      v34 = sqrt(v29);
      *(double *)v33 = v26 / v34;
      *(float64x2_t *)(v33 + 1) = vdivq_f64(v28, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v34, 0));
      v121 = -0.0000729211515 * v27.f64[0];
      v122 = v25 * 0.0000729211515;
      v123 = 0.0;
      v35 = 0.0;
      do
      {
        v35 = v35 + *(double *)((char *)&v121 + v32) * *(double *)&v106[v32];
        v32 += 8;
      }
      while (v32 != 24);
      v108[v20] = *(double *)(v15 + 8 * v20) - (v34 + v35 * -0.00000000333564095) - v23;
      ++v20;
    }
    while (v20 != v17);
    v36 = v100;
  }
  v37 = 0;
  v102 = 0;
  v99 = (double)v36 * 25.0;
  v38 = 0.0;
  while (1)
  {
    v103 = v37;
    v39 = v113;
    if ((v113 & 0x80000000) == 0)
    {
      v40 = v114;
      *(_QWORD *)v104 = 0;
      *(_QWORD *)v105 = 0;
      *(_OWORD *)v106 = *(_OWORD *)v12;
      *(_QWORD *)&v106[16] = *(_QWORD *)(v12 + 16);
      ECEF2Geo((double *)v106, (uint64_t)&WGS84_Datum, (uint64_t)&v121);
      v42 = v122;
      v43 = -6.28318531;
      v101 = v40;
      if (v122 >= 3.14159265 || (v43 = 6.28318531, v122 < -3.14159265))
      {
        v42 = v122 + v43;
        v122 = v122 + v43;
      }
      v44 = (double *)&v120[3 * v39];
      LODWORD(v41) = vcvtd_n_s64_f64(v121, 0xFuLL);
      v45 = Taylor_sin_cos(v41, &v105[1], v105);
      LODWORD(v45) = vcvtd_n_s64_f64(v42, 0xFuLL);
      Taylor_sin_cos(v45, &v104[1], v104);
      v46 = (double)(v104[1] * v105[0]);
      *v44 = (double)(v105[0] * v104[0]) * 9.31322575e-10;
      v44[1] = v46 * 9.31322575e-10;
      v44[2] = (double)v105[1] * 0.0000305175781;
      v36 = v100;
      v101[v39] = v123;
    }
    if ((CAP_LSQ4_Core((uint64_t)v120, v36, (uint64_t)&v109) & 1) == 0)
    {
      result = 0;
      *v98 = v103 + 1;
      dword_2579E5F68 = 2;
      return result;
    }
    v47 = *((double *)&v109 + 1);
    v48 = *(double *)&v110;
    if (*((double *)&v110 + 1) > 1.0e10
      || *(double *)&v109 > 1.0e10
      || *((double *)&v109 + 1) > 1.0e10
      || *(double *)&v110 > 1.0e10)
    {
      EvLog_v("CompPR_LSQ4: StateVec Innovation Out Of Range! %f %f %f %f", *((double *)&v110 + 1), *(double *)&v109, *((double *)&v109 + 1), *(double *)&v110);
      return 0;
    }
    v49 = *(double *)(v12 + 16);
    v50 = *((double *)&v110 + 1) + *(double *)(v12 + 24);
    v51 = *(double *)(v12 + 8);
    v52 = *(double *)&v109 + *(double *)v12;
    v53 = *((double *)&v109 + 1) + v51;
    *(double *)v12 = v52;
    *(double *)(v12 + 8) = v47 + v51;
    v54 = v48 + v49;
    *(double *)(v12 + 16) = v48 + v49;
    *(double *)(v12 + 24) = v50;
    if (v36 >= 1)
      break;
    v69 = 0.0;
    v56 = v103;
    if (v103)
      goto LABEL_36;
LABEL_46:
    v76 = v56 + 1;
    if (v56 <= 3)
    {
      v37 = v56 + 1;
      v38 = v69;
      if (v102 != 2)
        continue;
    }
    goto LABEL_51;
  }
  v55 = 0;
  v56 = v103;
  do
  {
    v57 = (double *)(v16 + 24 * v55);
    v58 = *v57;
    v59 = v57[1];
    v60 = *v57 - v52;
    *(double *)v106 = v60;
    *(double *)&v106[8] = v59 - v53;
    v61 = v57[2] - v54;
    *(double *)&v106[16] = v61;
    v62 = 0.0;
    v63 = 2;
    do
    {
      v62 = v62 + *(double *)&v106[8 * v63] * *(double *)&v106[8 * v63];
      v64 = v63-- + 1;
    }
    while (v64 > 1);
    v65 = 0;
    v66 = (double *)&v120[3 * v55];
    v67 = sqrt(v62);
    *v66 = v60 / v67;
    v66[1] = (v59 - v53) / v67;
    v66[2] = v61 / v67;
    v121 = v59 * -0.0000729211515;
    v122 = v58 * 0.0000729211515;
    v123 = 0.0;
    v68 = 0.0;
    do
    {
      v68 = v68 + *(double *)((char *)&v121 + v65) * *(double *)&v106[v65];
      v65 += 8;
    }
    while (v65 != 24);
    v108[v55] = *(double *)(v15 + 8 * v55) - (v67 + v68 * -0.00000000333564095) - v50;
    ++v55;
  }
  while (v55 != v17);
  v69 = 0.0;
  v70 = v108;
  v71 = v17;
  do
  {
    v72 = *v70++;
    v69 = v69 + v72 * v72;
    --v71;
  }
  while (v71);
  if (!v103)
    goto LABEL_46;
LABEL_36:
  if (v69 >= v99 && v69 * 8.0 <= v38)
  {
    if (v69 * 128.0 > v38)
    {
      if (v102 == 1)
        v74 = 2;
      else
        v74 = 1;
      v102 = v74;
    }
    goto LABEL_46;
  }
  v76 = v56 + 1;
LABEL_51:
  *v98 = v76;
  v121 = v52;
  v122 = v53;
  v123 = v54;
  ECEF2Geo(&v121, (uint64_t)&WGS84_Datum, (uint64_t)v97);
  v77 = v97[1];
  if (v77 >= 3.14159265)
  {
    v78 = -6.28318531;
LABEL_55:
    v77 = v77 + v78;
    v97[1] = v77;
  }
  else if (v77 < -3.14159265)
  {
    v78 = 6.28318531;
    goto LABEL_55;
  }
  v79 = __sincos_stret(*v97);
  v80 = __sincos_stret(v77);
  v116[0] = -(v79.__sinval * v80.__cosval);
  v116[1] = -(v79.__sinval * v80.__sinval);
  v116[2] = v79.__cosval;
  v116[3] = -v80.__sinval;
  v117 = *(unint64_t *)&v80.__cosval;
  *(double *)&v118 = -(v79.__cosval * v80.__cosval);
  *((double *)&v118 + 1) = -(v79.__cosval * v80.__sinval);
  v119 = -v79.__sinval;
  if (v100 < 1)
  {
    v82 = 1;
    v89 = 1;
  }
  else
  {
    v81 = 0;
    v82 = 1;
    do
    {
      v83 = 2;
      do
      {
        *(double *)&v106[8 * v83] = *(double *)(v16 + 8 * v83) - *(double *)(v12 + 8 * v83);
        v84 = v83-- + 1;
      }
      while (v84 > 1);
      v85 = -(v79.__cosval * v80.__sinval) * *(double *)&v106[8]
          + -(v79.__cosval * v80.__cosval) * *(double *)v106
          + -v79.__sinval * *(double *)&v106[16];
      if (v85 > 0.0)
      {
        v86 = 0.0;
        v87 = 2;
        do
        {
          v86 = v86 + *(double *)&v106[8 * v87] * *(double *)&v106[8 * v87];
          v88 = v87-- + 1;
        }
        while (v88 > 1);
        if (-v85 / sqrt(v86) < -0.087155743)
          v82 = 0;
      }
      v89 = v82;
      if ((v82 & 1) == 0)
        break;
      ++v81;
      v16 += 24;
    }
    while (v81 < v17);
  }
  v90 = v82 & 1;
  if ((v89 & (v69 > 225000000.0)) != 0)
    v91 = 0;
  else
    v91 = v90;
  if (v100 <= 5 && v91)
  {
    Comp_NEDvar_UDU((uint64_t)v111, 4u, 0, (double (*)[3])v116, (double *)v106);
    v92 = 0;
    if (*(double *)&v106[16] < 100000000.0)
    {
      v93 = (int)v97[2];
      v94 = 1000 * U4sqrt((int)*(double *)&v106[16]);
      if (v94 <= 500)
        v94 = 500;
      if (v94 + 18000 > v93 && -500 - v94 < v93)
        v92 = v91;
      else
        v92 = 0;
    }
    v91 = v92;
  }
  if (v91)
  {
    *v96 = v69;
    return 1;
  }
  return 0;
}

void *GNSS_Init_p_list(void)
{
  g_GN_GPS_Data_p_list = 0u;
  xmmword_257A47B78 = 0u;
  *((_QWORD *)&g_GN_GPS_Data_p_list + 1) = &g_DB_BB_TTick;
  qword_257A47AE8 = (uint64_t)&g_DB_Raw_Meas;
  qword_257A47AF0 = (uint64_t)&g_DB_SV_Subframes;
  unk_257A47AF8 = &g_DB_SV_AzEl;
  qword_257A47B00 = (uint64_t)&g_DB_Acq_Aid_Table;
  qword_257A47B08 = (uint64_t)&g_DB_Time_Sync;
  qword_257A47B10 = (uint64_t)&g_DB_SV_Nav_Mess;
  *(_QWORD *)&xmmword_257A47B18 = &g_DB_Chan_Reset;
  *((_QWORD *)&xmmword_257A47B18 + 1) = &g_DB_Sys_Status;
  qword_257A47B28 = (uint64_t)&g_DB_Nav_Soln;
  qword_257A47B30 = (uint64_t)&g_DB_SV_State_Table;
  *(_QWORD *)&xmmword_257A47B38 = &g_DB_Track_Meas;
  *((_QWORD *)&xmmword_257A47B38 + 1) = &g_DB_Sensor;
  qword_257A47B48 = (uint64_t)&g_G5K_ME_SD;
  qword_257A47B50 = (uint64_t)&g_SV_Gen_Meas_SD;
  *(_QWORD *)&xmmword_257A47B58 = &g_Nav_Kalman_SD;
  *((_QWORD *)&xmmword_257A47B58 + 1) = &g_SV_Data_Decode_SD;
  unk_257A47B68 = &g_SV_State_Update_SD;
  qword_257A47B70 = (uint64_t)&g_Pre_Positioning_SD;
  *((_QWORD *)&xmmword_257A47B78 + 1) = &g_Nav_Kalman_WD;
  unk_257A47B88 = &g_SV_Data_Decode_WD;
  qword_257A47B90 = (uint64_t)&g_SV_State_Update_WD;
  unk_257A47B98 = 0;
  qword_257A47BA0 = (uint64_t)&g_GNSS_Debug_Data;
  qword_257A47BA8 = (uint64_t)&g_GN_GNSS_IntVersion;
  qword_257A47BB0 = (uint64_t)&g_GN_GNSS_Config;
  qword_257A47BB8 = (uint64_t)&g_GN_GNSS_Nav_Data;
  qword_257A47BC0 = (uint64_t)&g_GN_GNSS_Dbg_Data;
  qword_257A47BC8 = (uint64_t)&g_NV_Ram;
  qword_257A478F0 = (uint64_t)&g_CBuff_Meas;
  unk_257A478F8 = &g_CBuff_Ctrl;
  g_CB_Meas = (uint64_t)&g_CBuff_Meas;
  *(_QWORD *)algn_257A478E8 = &g_CBuff_Meas;
  qword_257A47BD0 = (uint64_t)&g_NA_Ram;
  qword_257A47BD8 = (uint64_t)&g_CB_Meas;
  qword_257A47910 = (uint64_t)&g_CBuff_Ctrl;
  unk_257A47918 = &g_CBuff_NMEA;
  g_CB_Ctrl = (uint64_t)&g_CBuff_Ctrl;
  *(_QWORD *)algn_257A47908 = &g_CBuff_Ctrl;
  qword_257A47930 = (uint64_t)&g_CBuff_NMEA;
  unk_257A47938 = (char *)&g_CBuff_NMEA + 14336;
  g_CB_NMEA = (uint64_t)&g_CBuff_NMEA;
  *(_QWORD *)algn_257A47928 = &g_CBuff_NMEA;
  qword_257A47BE0 = (uint64_t)&g_CB_Ctrl;
  qword_257A47BE8 = (uint64_t)&g_CB_NMEA;
  qword_257A47AC0 = (uint64_t)&g_CBuff_NDbg;
  qword_257A47AC8 = (uint64_t)&g_CBuff_ELog;
  g_CB_NDbg = (uint64_t)&g_CBuff_NDbg;
  *(_QWORD *)&dword_257A47AB8 = &g_CBuff_NDbg;
  qword_257A47AA0 = (uint64_t)&g_CBuff_ELog;
  qword_257A47AA8 = (uint64_t)&g_CBuff_GDbg;
  g_CB_ELog = (uint64_t)&g_CBuff_ELog;
  *(_QWORD *)&dword_257A47A98 = &g_CBuff_ELog;
  qword_257A47BF0 = (uint64_t)&g_CB_NDbg;
  qword_257A47BF8 = (uint64_t)&g_CB_ELog;
  qword_257A47950 = (uint64_t)&g_CBuff_GDbg;
  qword_257A47958 = (uint64_t)&g_CB_Meas;
  g_CB_GDbg = (uint64_t)&g_CBuff_GDbg;
  *(_QWORD *)&dword_257A47948 = &g_CBuff_GDbg;
  qword_257A47C00 = (uint64_t)&g_CB_GDbg;
  LODWORD(g_GN_GPS_Data_p_list) = 2;
  p_api = (uint64_t)&g_GN_GPS_Data_p_list;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  p_NA = (uint64_t)&g_NA_Ram;
  return memcpy(&GN_GPS_Data_p_list_reference, &g_GN_GPS_Data_p_list, 0x130uLL);
}

void *GNSS_Clear_DataAreas(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  __int128 v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  _OWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char *v37;
  char *v38;
  __int128 v39;
  char *v40;
  __int128 v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char *v56;
  uint64_t v57;
  char *v58;
  _OWORD *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  char *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  char *v71;
  uint64_t v72;
  char *v73;
  _OWORD *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _DWORD *v78;
  _OWORD *v79;
  __int128 v80;
  char *v81;
  __int128 v82;
  __int128 v83;
  char *v84;
  _OWORD *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  char *v91;
  uint64_t v92;
  char *v93;
  char *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD *v100;
  char *v101;
  _OWORD *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 *v110;
  char *v111;
  int v112;
  char *v113;
  char *v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  char *v120;
  char *v121;
  char *v122;
  char *v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  char *v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  __int128 *v149;
  __int128 *v150;
  _DWORD *v151;
  _DWORD *v152;
  _DWORD *v153;
  __int128 v155;
  _DWORD v156[3991];
  _BYTE v157[322];
  __int128 v158;
  __int16 v159;
  _BYTE v160[788];
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _OWORD v164[16];
  _QWORD v165[2];
  _OWORD v166[46];
  __int128 v167;
  _OWORD v168[3];
  _OWORD v169[11];
  __int128 v170;
  _OWORD v171[4];
  __int128 v172;
  _OWORD v173[22];
  __int128 v174;
  _OWORD v175[4];
  __int128 v176;
  _OWORD v177[7];
  __int128 v178;
  _OWORD v179[4];
  __int128 v180;
  _OWORD v181[4];
  __int128 v182;
  _OWORD v183[4];
  __int128 v184;
  _BYTE v185[20];
  _BYTE v186[14904];
  _BYTE v187[14904];
  _BYTE v188[4620];
  _DWORD v189[165];
  _BYTE v190[1291];
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _OWORD v201[2];
  _OWORD v202[4332];
  uint64_t v203;

  MEMORY[0x24BDAC7A8](a1);
  v203 = *MEMORY[0x24BDAC8D0];
  bzero(v202, 0x6E48uLL);
  v1 = 560;
  do
  {
    v2 = (char *)v202 + v1;
    *(_QWORD *)v2 = 0;
    *((_WORD *)v2 + 4) = 0;
    *(_QWORD *)(v2 + 12) = 0;
    *((_QWORD *)v2 + 6) = 0;
    *((_QWORD *)v2 + 3) = 0;
    *((_QWORD *)v2 + 4) = 0;
    v1 += 56;
    *(_QWORD *)(v2 + 38) = 0;
  }
  while (v2 + 56 != (char *)&v202[483]);
  v3 = -4608;
  do
  {
    v4 = (char *)v202 + v3;
    *((_OWORD *)v4 + 772) = 0uLL;
    *((_OWORD *)v4 + 771) = 0uLL;
    *((_BYTE *)&v202[773] + v3) = 0;
    v3 += 36;
  }
  while (v3);
  v5 = -15872;
  do
  {
    v6 = (_OWORD *)((char *)v202 + v5);
    v6[1769] = 0uLL;
    v6[1768] = 0uLL;
    v6[1767] = 0uLL;
    v6[1766] = 0uLL;
    v6[1765] = 0uLL;
    v6[1764] = 0uLL;
    v6[1763] = 0uLL;
    *(_OWORD *)((char *)&v202[1769] + v5 + 9) = 0uLL;
    v5 += 124;
  }
  while (v5);
  *(_QWORD *)((char *)&v202[1764] + 4) = 0;
  HIDWORD(v202[1764]) = 0;
  memset(&v202[1763], 0, 18);
  memcpy(&g_G5K_ME_SD, v202, 0x6E50uLL);
  qword_257A19DB0 = (uint64_t)&g_G5K_ME_SD;
  bzero(&g_SV_Gen_Meas_SD, 0xC70uLL);
  bzero(v202, 0xBBA8uLL);
  v7 = 5580;
  do
  {
    v8 = (char *)v202 + v7;
    *(_QWORD *)v8 = 0;
    *((_WORD *)v8 + 4) = 0;
    *((_DWORD *)v8 + 3) = 0;
    v8[16] = 0;
    *((_DWORD *)v8 + 5) = 0;
    v7 += 28;
    v8[24] = 0;
  }
  while (v8 + 28 != (char *)&v202[373] + 4);
  *(_OWORD *)((char *)&v202[397] + 4) = 0u;
  *(_OWORD *)((char *)&v202[398] + 4) = 0u;
  *(_OWORD *)((char *)&v202[395] + 4) = 0u;
  *(_OWORD *)((char *)&v202[396] + 4) = 0u;
  *(_OWORD *)((char *)&v202[393] + 4) = 0u;
  *(_OWORD *)((char *)&v202[394] + 4) = 0u;
  *(_OWORD *)((char *)&v202[391] + 4) = 0u;
  *(_OWORD *)((char *)&v202[392] + 4) = 0u;
  *(_OWORD *)((char *)&v202[389] + 4) = 0u;
  *(_OWORD *)((char *)&v202[390] + 4) = 0u;
  *(_OWORD *)((char *)&v202[387] + 4) = 0u;
  *(_OWORD *)((char *)&v202[388] + 4) = 0u;
  *(_OWORD *)((char *)&v202[385] + 4) = 0u;
  *(_OWORD *)((char *)&v202[386] + 4) = 0u;
  *(_OWORD *)((char *)&v202[383] + 4) = 0u;
  *(_OWORD *)((char *)&v202[384] + 4) = 0u;
  *(_OWORD *)((char *)&v202[381] + 4) = 0u;
  *(_OWORD *)((char *)&v202[382] + 4) = 0u;
  *(_OWORD *)((char *)&v202[379] + 4) = 0u;
  *(_OWORD *)((char *)&v202[380] + 4) = 0u;
  *(_OWORD *)((char *)&v202[377] + 4) = 0u;
  *(_OWORD *)((char *)&v202[378] + 4) = 0u;
  *(_OWORD *)((char *)&v202[375] + 4) = 0u;
  *(_OWORD *)((char *)&v202[376] + 4) = 0u;
  *(_OWORD *)((char *)&v202[373] + 4) = 0u;
  *(_OWORD *)((char *)&v202[374] + 4) = 0u;
  *(_OWORD *)((char *)&v202[398] + 15) = 0u;
  memset(&v202[400], 0, 245);
  bzero((char *)&v202[415] + 6, 0xA1B0uLL);
  memcpy(&g_SV_Data_Decode_SD, v202, 0xBBA6uLL);
  bzero(v202, 0x10EC0uLL);
  *(_QWORD *)((char *)&v202[1] + 4) = 0x500000002;
  *(_QWORD *)((char *)&v202[8] + 12) = 0;
  *(_OWORD *)((char *)&v202[9] + 4) = 0u;
  *(_OWORD *)((char *)&v202[10] + 8) = 0u;
  *(_QWORD *)((char *)&v202[11] + 5) = 0;
  memset(&v202[19], 0, 20);
  *(_OWORD *)((char *)&v202[20] + 8) = 0u;
  DWORD2(v202[21]) = 0;
  memset(&v202[2], 0, 105);
  memset(&v202[12], 0, 54);
  *(_OWORD *)((char *)&v202[16] + 8) = 0u;
  *(_OWORD *)((char *)&v202[17] + 8) = 0u;
  DWORD2(v202[18]) = 0;
  *(_OWORD *)((char *)&v202[15] + 8) = 0u;
  bzero(&v202[22], 0x54CuLL);
  memset(&v202[107], 0, 24);
  DWORD2(v202[108]) = -1;
  *(_OWORD *)((char *)&v202[109] + 8) = 0u;
  *(_QWORD *)((char *)&v202[110] + 5) = 0;
  *(_QWORD *)&v202[109] = 0;
  memset(&v202[111], 0, 65);
  LODWORD(v202[116]) = -1;
  *(_OWORD *)((char *)&v202[116] + 8) = 0u;
  *(_OWORD *)((char *)&v202[117] + 8) = 0u;
  *(_OWORD *)((char *)&v202[118] + 8) = 0u;
  *(_DWORD *)((char *)&v202[119] + 7) = 0;
  v9 = 1920;
  do
  {
    v10 = (char *)v202 + v9;
    *(_DWORD *)v10 = 0;
    *(_OWORD *)(v10 + 8) = 0uLL;
    *(_OWORD *)(v10 + 24) = 0uLL;
    v9 += 40;
  }
  while (v10 + 40 != (char *)&v202[440]);
  v11 = 7040;
  do
  {
    v12 = (char *)v202 + v11;
    *(_DWORD *)v12 = 0;
    *(_OWORD *)(v12 + 8) = 0uLL;
    *(_OWORD *)(v12 + 24) = 0uLL;
    v11 += 40;
  }
  while (v12 + 40 != (char *)&v202[760]);
  DWORD2(v202[963]) = 0;
  *(_QWORD *)&v202[964] = 0;
  DWORD2(v202[964]) = 0;
  *(_QWORD *)&v202[965] = 0;
  DWORD2(v202[965]) = 0;
  *(_QWORD *)&v202[1257] = 0;
  BYTE8(v202[1257]) = 0;
  *(_QWORD *)&v202[1258] = 0;
  BYTE8(v202[1258]) = 0;
  *(_QWORD *)&v202[1701] = 0;
  DWORD2(v202[1701]) = 0;
  *(_QWORD *)&v202[1708] = 0;
  DWORD2(v202[1708]) = 0;
  *((_QWORD *)&v202[1725] + 1) = 0;
  LOBYTE(v202[1726]) = 0;
  memset(&v202[1721], 0, 65);
  *((_QWORD *)&v202[1731] + 1) = 0;
  LOBYTE(v202[1732]) = 0;
  DWORD2(v202[1726]) = 0;
  memset(&v202[1727], 0, 65);
  BYTE8(v202[1732]) = 0;
  BYTE8(v202[4255]) = 0;
  *(_QWORD *)((char *)&v202[4260] + 4) = 0;
  *(_QWORD *)((char *)&v202[4267] + 4) = 0;
  bzero(&v202[4268], 0x400uLL);
  bzero(&v202[760], 0xCB5uLL);
  memset(&v202[966], 0, 156);
  bzero(&v202[976], 0x118BuLL);
  bzero(&v202[1259], 0x1B5CuLL);
  memset(&v202[1697], 0, 25);
  *(_OWORD *)((char *)&v202[1698] + 12) = 0u;
  *(_OWORD *)((char *)&v202[1699] + 12) = 0u;
  memset(&v202[1702], 0, 19);
  *(_OWORD *)((char *)&v202[1703] + 4) = 0u;
  *(_QWORD *)((char *)&v202[1704] + 2) = 0;
  *(_QWORD *)((char *)&v202[1704] + 12) = 0;
  *(_OWORD *)((char *)&v202[1705] + 4) = 0u;
  *(_OWORD *)((char *)&v202[1706] + 8) = 0u;
  BYTE8(v202[1707]) = 0;
  memset(&v202[1709], 0, 188);
  bzero((char *)&v202[1732] + 12, 0x9D68uLL);
  *((_QWORD *)&v202[4251] + 1) = 0;
  memset(&v202[4252], 0, 17);
  memset(&v202[4254], 0, 21);
  *((_QWORD *)&v202[4253] + 1) = 0;
  memset(&v202[4256], 0, 65);
  memset(&v202[4261], 0, 97);
  g_Nav_Kalman_SD = v202[0];
  dword_2579BE620 = v202[1];
  unk_2579BE624 = *(_QWORD *)((char *)&v202[1] + 4);
  memcpy(&unk_2579BE62C, (char *)&v202[1] + 12, 0x10EA4uLL);
  g_SV_State_Update_SD = 0u;
  unk_257A2D2A8 = 0u;
  xmmword_257A2D2B8 = 0u;
  unk_257A2D2C8 = 0u;
  xmmword_257A2D2D8 = 0u;
  unk_257A2D2E8 = 0u;
  xmmword_257A2D2F8 = 0u;
  unk_257A2D308 = 0u;
  xmmword_257A2D318 = 0u;
  unk_257A2D328 = 0u;
  xmmword_257A2D338 = 0u;
  unk_257A2D348 = 0u;
  xmmword_257A2D358 = 0u;
  unk_257A2D368 = 0u;
  xmmword_257A2D378 = 0u;
  unk_257A2D388 = 0u;
  xmmword_257A2D398 = 0u;
  unk_257A2D3A8 = 0u;
  xmmword_257A2D3B8 = 0u;
  unk_257A2D3C8 = 0u;
  xmmword_257A2D3D8 = 0u;
  unk_257A2D3E8 = 0u;
  xmmword_257A2D3F8 = 0u;
  unk_257A2D408 = 0u;
  xmmword_257A2D418 = 0u;
  *(_DWORD *)((char *)&xmmword_257A2D418 + 15) = 0;
  byte_257A2D460 = 0;
  xmmword_257A2D440 = 0u;
  unk_257A2D450 = 0u;
  g_Pre_Positioning_SD = 0u;
  g_SV_Data_Decode_WD = 0u;
  unk_257A2D478 = 0u;
  xmmword_257A2D488 = 0u;
  unk_257A2D498 = 0u;
  xmmword_257A2D4A8 = 0u;
  unk_257A2D4B8 = 0u;
  xmmword_257A2D4C8 = 0u;
  unk_257A2D4D8 = 0u;
  xmmword_257A2D4E8 = 0u;
  unk_257A2D4F8 = 0u;
  xmmword_257A2D508 = 0u;
  *(_DWORD *)((char *)&xmmword_257A2D508 + 15) = 0;
  memset(v201, 0, 28);
  v200 = 0u;
  v199 = 0u;
  v198 = 0u;
  v197 = 0u;
  v196 = 0u;
  v195 = 0u;
  v194 = 0u;
  v193 = 0u;
  v192 = 0u;
  v191 = 0u;
  bzero(v190, 0x50BuLL);
  memset(&v189[152], 0, 52);
  memset(&v189[116], 0, 135);
  memset(&v189[72], 0, 171);
  memset(v189, 0, 273);
  bzero(v188, 0x120BuLL);
  bzero(v187, 0x3A38uLL);
  bzero(v186, 0x3A38uLL);
  bzero(v202, 0x5B68uLL);
  memset(v185, 0, sizeof(v185));
  LOWORD(v184) = 0;
  BYTE2(v184) = 0;
  memset(v183, 0, 56);
  LOWORD(v182) = 0;
  BYTE2(v182) = 0;
  memset(v181, 0, 56);
  BYTE2(v180) = 0;
  LOWORD(v180) = 0;
  memset(v179, 0, 56);
  BYTE2(v178) = 0;
  LOWORD(v178) = 0;
  memset(v177, 0, sizeof(v177));
  BYTE2(v176) = 0;
  LOWORD(v176) = 0;
  memset(v175, 0, 56);
  BYTE2(v174) = 0;
  LOWORD(v174) = 0;
  memset(&v173[15], 0, 104);
  memset((char *)&v173[14] + 4, 0, 12);
  memset(&v173[10], 0, 53);
  memset((char *)&v173[9] + 4, 0, 12);
  memset(&v173[5], 0, 53);
  memset((char *)&v173[4] + 4, 0, 12);
  memset(v173, 0, 61);
  BYTE2(v172) = 0;
  LOWORD(v172) = 0;
  memset(v171, 0, 56);
  BYTE2(v170) = 0;
  LOWORD(v170) = 0;
  memset(&v169[7], 0, 56);
  memset((char *)&v169[6] + 4, 0, 12);
  memset(&v169[2], 0, 61);
  v169[0] = 0uLL;
  *(_QWORD *)((char *)&v169[1] + 5) = 0;
  *(_QWORD *)&v169[1] = 0;
  memset(v168, 0, 36);
  BYTE2(v167) = 0;
  LOWORD(v167) = 0;
  memset(&v166[39], 0, 112);
  memset((char *)&v166[38] + 4, 0, 12);
  memset(&v166[31], 0, 102);
  memset(v166, 0, 495);
  LOWORD(v165[0]) = 0;
  memset(&v164[2], 0, 217);
  memset(v157, 0, sizeof(v157));
  *(_DWORD *)((char *)v156 + 3) = 0;
  v156[0] = 0;
  memset(&v189[117], 0, 131);
  *((_QWORD *)&v184 + 1) = 0;
  *(_QWORD *)((char *)&v184 + 3) = 0;
  *((_QWORD *)&v182 + 1) = 0;
  *(_QWORD *)((char *)&v182 + 3) = 0;
  *((_QWORD *)&v180 + 1) = 0;
  *(_QWORD *)((char *)&v180 + 3) = 0;
  *((_QWORD *)&v178 + 1) = 0;
  *(_QWORD *)((char *)&v178 + 3) = 0;
  *((_QWORD *)&v176 + 1) = 0;
  *(_QWORD *)((char *)&v176 + 3) = 0;
  *((_QWORD *)&v174 + 1) = 0;
  *(_QWORD *)((char *)&v174 + 3) = 0;
  *((_QWORD *)&v172 + 1) = 0;
  *(_QWORD *)((char *)&v172 + 3) = 0;
  *((_QWORD *)&v170 + 1) = 0;
  *(_QWORD *)((char *)&v170 + 3) = 0;
  *((_QWORD *)&v167 + 1) = 0;
  *(_QWORD *)((char *)&v167 + 3) = 0;
  v155 = 0uLL;
  HIBYTE(v155) = 0;
  memset(v164, 0, 25);
  v163 = 0u;
  v162 = 0u;
  v161 = 0u;
  v191 = 0uLL;
  DWORD2(v192) = 0;
  *(_QWORD *)&v192 = 0;
  v193 = 0u;
  v194 = 0u;
  v195 = 0u;
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  memset(v201, 0, 25);
  bzero(&v190[2], 0x509uLL);
  memset((char *)&v189[153] + 3, 0, 45);
  memset((char *)&v189[72] + 2, 0, 160);
  *(_OWORD *)((char *)&v189[110] + 3) = 0u;
  *(_OWORD *)((char *)&v189[64] + 1) = 0u;
  *(_OWORD *)((char *)v189 + 3) = 0u;
  *(_OWORD *)((char *)&v189[4] + 3) = 0u;
  *(_OWORD *)((char *)&v189[8] + 3) = 0u;
  *(_OWORD *)((char *)&v189[12] + 3) = 0u;
  *(_OWORD *)((char *)&v189[16] + 3) = 0u;
  *(_OWORD *)((char *)&v189[20] + 3) = 0u;
  *(_OWORD *)((char *)&v189[24] + 3) = 0u;
  *(_OWORD *)((char *)&v189[28] + 3) = 0u;
  *(_OWORD *)((char *)&v189[32] + 3) = 0u;
  *(_OWORD *)((char *)&v189[36] + 3) = 0u;
  *(_OWORD *)((char *)&v189[40] + 3) = 0u;
  *(_OWORD *)((char *)&v189[44] + 3) = 0u;
  *(_OWORD *)((char *)&v189[48] + 3) = 0u;
  *(_OWORD *)((char *)&v189[52] + 3) = 0u;
  *(_OWORD *)((char *)&v189[56] + 3) = 0u;
  *(_OWORD *)((char *)&v189[60] + 3) = 0u;
  bzero(&v188[6], 0x1205uLL);
  bzero(&v187[3], 0x3A35uLL);
  bzero(&v186[3], 0x3A35uLL);
  bzero((char *)v202 + 3, 0x5B65uLL);
  memset(&v185[1], 0, 19);
  memset((char *)v183 + 3, 0, 48);
  *(_QWORD *)&v183[3] = 0;
  memset((char *)v181 + 3, 0, 48);
  *(_QWORD *)&v181[3] = 0;
  memset((char *)v179 + 3, 0, 48);
  *(_QWORD *)&v179[3] = 0;
  memset((char *)v177 + 3, 0, 96);
  v177[6] = 0u;
  memset((char *)v175 + 3, 0, 53);
  memset((char *)&v173[18] + 3, 0, 48);
  *(_QWORD *)&v173[21] = 0;
  memset((char *)&v173[16] + 15, 0, 17);
  memset((char *)&v173[15] + 7, 0, 17);
  memset((char *)&v173[10] + 4, 0, 49);
  memset((char *)&v173[5] + 4, 0, 49);
  memset((char *)v173 + 4, 0, 57);
  memset((char *)v171 + 3, 0, 53);
  memset((char *)&v169[7] + 3, 0, 53);
  memset((char *)&v169[2] + 4, 0, 57);
  *(_OWORD *)((char *)v169 + 12) = 0uLL;
  *(_QWORD *)((char *)v169 + 4) = 0;
  BYTE12(v169[1]) = 0;
  *(_OWORD *)((char *)v168 + 7) = 0uLL;
  *(_QWORD *)((char *)&v168[1] + 12) = 0;
  *(_QWORD *)((char *)&v168[1] + 7) = 0;
  memset((char *)&v166[39] + 3, 0, 109);
  memset((char *)&v166[31] + 4, 0, 98);
  *(_OWORD *)((char *)&v166[29] + 15) = 0u;
  *(_OWORD *)((char *)&v166[29] + 5) = 0u;
  WORD1(v165[1]) = 0;
  *(_QWORD *)((char *)v165 + 2) = 0;
  bzero(v160, 0x314uLL);
  v159 = 0;
  v158 = 0uLL;
  bzero((char *)&v156[1] + 3, 0x3E51uLL);
  xmmword_2579CF550 = v199;
  unk_2579CF560 = v200;
  xmmword_2579CF570 = v201[0];
  *(__int128 *)((char *)&xmmword_2579CF570 + 12) = *(_OWORD *)((char *)v201 + 12);
  xmmword_2579CF510 = v195;
  unk_2579CF520 = v196;
  xmmword_2579CF530 = v197;
  unk_2579CF540 = v198;
  g_Nav_Kalman_WD = v191;
  unk_2579CF4E0 = v192;
  xmmword_2579CF4F0 = v193;
  unk_2579CF500 = v194;
  word_2579CF594 = 0;
  unk_2579CF58C = 0;
  memcpy(&unk_2579CF596, v190, 0x50BuLL);
  xmmword_2579CFAA1 = *(_OWORD *)&v189[152];
  unk_2579CFAB1 = *(_OWORD *)&v189[156];
  xmmword_2579CFAC1 = *(_OWORD *)&v189[160];
  dword_2579CFAD1 = v189[164];
  byte_2579CFAD5 = 0;
  word_2579CFAD6 = 0;
  dword_2579CFAD8 = 0;
  xmmword_2579CFB3C = *(_OWORD *)&v189[140];
  unk_2579CFB4C = *(_OWORD *)&v189[144];
  unk_2579CFB5B = *(_QWORD *)((char *)&v189[147] + 3);
  xmmword_2579CFAFC = *(_OWORD *)&v189[124];
  unk_2579CFB0C = *(_OWORD *)&v189[128];
  xmmword_2579CFB1C = *(_OWORD *)&v189[132];
  unk_2579CFB2C = *(_OWORD *)&v189[136];
  xmmword_2579CFADC = *(_OWORD *)&v189[116];
  *(_OWORD *)algn_2579CFAEC = *(_OWORD *)&v189[120];
  *(_DWORD *)((char *)&qword_2579CFB63 + 7) = 0;
  qword_2579CFB63 = 0;
  xmmword_2579CFBEE = *(_OWORD *)&v189[104];
  unk_2579CFBFE = *(_OWORD *)&v189[108];
  unk_2579CFC09 = *(_OWORD *)((char *)&v189[110] + 3);
  xmmword_2579CFBAE = *(_OWORD *)&v189[88];
  unk_2579CFBBE = *(_OWORD *)&v189[92];
  xmmword_2579CFBCE = *(_OWORD *)&v189[96];
  unk_2579CFBDE = *(_OWORD *)&v189[100];
  xmmword_2579CFB6E = *(_OWORD *)&v189[72];
  unk_2579CFB7E = *(_OWORD *)&v189[76];
  xmmword_2579CFB8E = *(_OWORD *)&v189[80];
  unk_2579CFB9E = *(_OWORD *)&v189[84];
  memcpy(&unk_2579CFC19, v189, 0x111uLL);
  memcpy(&unk_2579CFD2A, v188, 0x120BuLL);
  memcpy((char *)&g_Nav_Kalman_WD + 6757, v187, 0x3A38uLL);
  memcpy((char *)&g_Nav_Kalman_WD + 21661, v186, 0x3A38uLL);
  memcpy((char *)&g_Nav_Kalman_WD + 36565, v202, 0x5B68uLL);
  v13 = (char *)&g_Nav_Kalman_WD + 59965;
  *(_OWORD *)v13 = *(_OWORD *)v185;
  *((_DWORD *)v13 + 4) = *(_DWORD *)&v185[16];
  *(__int128 *)((char *)&g_Nav_Kalman_WD + 59985) = v184;
  v14 = (char *)&g_Nav_Kalman_WD + 60001;
  v15 = v183[1];
  *(_OWORD *)v14 = v183[0];
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = v183[2];
  *((_QWORD *)v14 + 6) = *(_QWORD *)&v183[3];
  *(__int128 *)((char *)&g_Nav_Kalman_WD + 60057) = v182;
  v16 = (char *)&g_Nav_Kalman_WD + 60073;
  v17 = v181[0];
  v18 = v181[1];
  v19 = v181[2];
  *((_QWORD *)v16 + 6) = *(_QWORD *)&v181[3];
  *((_OWORD *)v16 + 1) = v18;
  *((_OWORD *)v16 + 2) = v19;
  *(__int128 *)((char *)&g_Nav_Kalman_WD + 60129) = v180;
  *(_OWORD *)v16 = v17;
  v20 = (char *)&g_Nav_Kalman_WD + 60145;
  *((_QWORD *)v20 + 6) = *(_QWORD *)&v179[3];
  v21 = v179[2];
  v22 = v179[0];
  *((_OWORD *)v20 + 1) = v179[1];
  *((_OWORD *)v20 + 2) = v21;
  *(_OWORD *)v20 = v22;
  *(__int128 *)((char *)&g_Nav_Kalman_WD + 60201) = v178;
  v23 = (__int128 *)((char *)&g_Nav_Kalman_WD + 60217);
  v24 = v177[1];
  *v23 = v177[0];
  v23[1] = v24;
  v25 = v177[2];
  v26 = v177[3];
  v27 = v177[6];
  v28 = v177[4];
  v23[5] = v177[5];
  v23[6] = v27;
  v23[3] = v26;
  v23[4] = v28;
  v23[2] = v25;
  *(__int128 *)((char *)&g_Nav_Kalman_WD + 60329) = v176;
  v29 = (char *)&g_Nav_Kalman_WD + 60345;
  v30 = v175[0];
  v31 = v175[1];
  v32 = v175[2];
  *((_QWORD *)v29 + 6) = *(_QWORD *)&v175[3];
  *((_OWORD *)v29 + 1) = v31;
  *((_OWORD *)v29 + 2) = v32;
  *(__int128 *)((char *)&g_Nav_Kalman_WD + 60401) = v174;
  *(_OWORD *)v29 = v30;
  v33 = (char *)&g_Nav_Kalman_WD + 60417;
  v34 = v173[18];
  v35 = v173[19];
  v36 = v173[20];
  *((_QWORD *)v33 + 6) = *(_QWORD *)&v173[21];
  *((_OWORD *)v33 + 1) = v35;
  *((_OWORD *)v33 + 2) = v36;
  *(_OWORD *)v33 = v34;
  v37 = (char *)&g_Nav_Kalman_WD + 60473;
  v37[2] = 0;
  *(_WORD *)v37 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15119) = 0;
  *((_BYTE *)&g_Nav_Kalman_WD + 60480) = 0;
  v38 = (char *)&g_Nav_Kalman_WD + 60481;
  v39 = *(_OWORD *)((char *)&v173[16] + 8);
  *((_QWORD *)v38 + 2) = *((_QWORD *)&v173[17] + 1);
  *(_OWORD *)v38 = v39;
  v40 = (char *)&g_Nav_Kalman_WD + 60505;
  v41 = v173[15];
  *((_QWORD *)v40 + 2) = *(_QWORD *)&v173[16];
  *(_OWORD *)v40 = v41;
  v42 = (char *)&g_Nav_Kalman_WD + 60529;
  v43 = *(_QWORD *)((char *)&v173[14] + 4);
  *((_DWORD *)v42 + 2) = HIDWORD(v173[14]);
  *(_QWORD *)v42 = v43;
  v44 = (char *)&g_Nav_Kalman_WD + 60541;
  v44[2] = 0;
  *(_WORD *)v44 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15136) = 0;
  v45 = (char *)&g_Nav_Kalman_WD + 60548;
  v46 = v173[10];
  v47 = v173[11];
  v48 = v173[12];
  *(_QWORD *)(v45 + 45) = *(_QWORD *)((char *)&v173[12] + 13);
  *((_OWORD *)v45 + 1) = v47;
  *((_OWORD *)v45 + 2) = v48;
  *(_OWORD *)v45 = v46;
  v49 = (char *)&g_Nav_Kalman_WD + 60601;
  v50 = *(_QWORD *)((char *)&v173[9] + 4);
  *((_DWORD *)v49 + 2) = HIDWORD(v173[9]);
  *(_QWORD *)v49 = v50;
  v51 = (char *)&g_Nav_Kalman_WD + 60613;
  v51[2] = 0;
  *(_WORD *)v51 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15154) = 0;
  v52 = (char *)&g_Nav_Kalman_WD + 60620;
  v53 = v173[5];
  v54 = v173[6];
  v55 = v173[7];
  *(_QWORD *)(v52 + 45) = *(_QWORD *)((char *)&v173[7] + 13);
  *((_OWORD *)v52 + 1) = v54;
  *((_OWORD *)v52 + 2) = v55;
  *(_OWORD *)v52 = v53;
  v56 = (char *)&g_Nav_Kalman_WD + 60673;
  v57 = *(_QWORD *)((char *)&v173[4] + 4);
  *((_DWORD *)v56 + 2) = HIDWORD(v173[4]);
  *(_QWORD *)v56 = v57;
  v58 = (char *)&g_Nav_Kalman_WD + 60685;
  v58[2] = 0;
  *(_WORD *)v58 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15172) = 0;
  v59 = (__int128 *)((char *)&g_Nav_Kalman_WD + 60692);
  v60 = v173[0];
  v61 = v173[1];
  v62 = v173[2];
  *(_OWORD *)((char *)v59 + 45) = *(_OWORD *)((char *)&v173[2] + 13);
  v59[1] = v61;
  v59[2] = v62;
  *v59 = v60;
  *(__int128 *)((char *)&g_Nav_Kalman_WD + 60753) = v172;
  v63 = (char *)&g_Nav_Kalman_WD + 60769;
  v64 = v171[0];
  v65 = v171[1];
  v66 = v171[2];
  *((_QWORD *)v63 + 6) = *(_QWORD *)&v171[3];
  *((_OWORD *)v63 + 1) = v65;
  *((_OWORD *)v63 + 2) = v66;
  *(_OWORD *)v63 = v64;
  *(__int128 *)((char *)&g_Nav_Kalman_WD + 60825) = v170;
  v67 = (char *)&g_Nav_Kalman_WD + 60841;
  v68 = v169[7];
  v69 = v169[8];
  v70 = v169[9];
  *((_QWORD *)v67 + 6) = *(_QWORD *)&v169[10];
  *((_OWORD *)v67 + 1) = v69;
  *((_OWORD *)v67 + 2) = v70;
  *(_OWORD *)v67 = v68;
  v71 = (char *)&g_Nav_Kalman_WD + 60897;
  v72 = *(_QWORD *)((char *)&v169[6] + 4);
  *((_DWORD *)v71 + 2) = HIDWORD(v169[6]);
  *(_QWORD *)v71 = v72;
  v73 = (char *)&g_Nav_Kalman_WD + 60909;
  v73[2] = 0;
  *(_WORD *)v73 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15228) = 0;
  v74 = (__int128 *)((char *)&g_Nav_Kalman_WD + 60916);
  v75 = v169[2];
  v76 = v169[3];
  v77 = v169[4];
  *(_OWORD *)((char *)v74 + 45) = *(_OWORD *)((char *)&v169[4] + 13);
  v74[1] = v76;
  v74[2] = v77;
  *v74 = v75;
  v78 = (_DWORD *)((char *)&g_Nav_Kalman_WD + 60977);
  *(_DWORD *)((char *)v78 + 3) = 0;
  *v78 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15246) = 0;
  v79 = (__int128 *)((char *)&g_Nav_Kalman_WD + 60988);
  v80 = v169[0];
  *(_OWORD *)((char *)v79 + 13) = *(_OWORD *)((char *)v169 + 13);
  *v79 = v80;
  v81 = (char *)&g_Nav_Kalman_WD + 61017;
  v82 = v168[0];
  v83 = v168[1];
  *((_DWORD *)v81 + 8) = v168[2];
  *(_OWORD *)v81 = v82;
  *((_OWORD *)v81 + 1) = v83;
  v84 = (char *)&g_Nav_Kalman_WD + 61053;
  v84[2] = 0;
  *((_BYTE *)&g_Nav_Kalman_WD + 61056) = 0;
  *(__int128 *)((char *)&g_Nav_Kalman_WD + 61057) = v167;
  *(_WORD *)v84 = 0;
  v85 = (__int128 *)((char *)&g_Nav_Kalman_WD + 61073);
  v86 = v166[40];
  *v85 = v166[39];
  v85[1] = v86;
  v87 = v166[41];
  v88 = v166[42];
  v89 = v166[45];
  v90 = v166[43];
  v85[5] = v166[44];
  v85[6] = v89;
  v85[3] = v88;
  v85[4] = v90;
  v85[2] = v87;
  v91 = (char *)&g_Nav_Kalman_WD + 61185;
  v92 = *(_QWORD *)((char *)&v166[38] + 4);
  *((_DWORD *)v91 + 2) = HIDWORD(v166[38]);
  *(_QWORD *)v91 = v92;
  v93 = (char *)&g_Nav_Kalman_WD + 61197;
  v93[2] = 0;
  *(_WORD *)v93 = 0;
  *((_DWORD *)&g_Nav_Kalman_WD + 15300) = 0;
  v94 = (char *)&g_Nav_Kalman_WD + 61204;
  v95 = v166[32];
  *(_OWORD *)v94 = v166[31];
  *((_OWORD *)v94 + 1) = v95;
  v96 = v166[33];
  v97 = v166[34];
  v98 = v166[35];
  v99 = v166[36];
  *(_QWORD *)(v94 + 94) = *(_QWORD *)((char *)&v166[36] + 14);
  *((_OWORD *)v94 + 4) = v98;
  *((_OWORD *)v94 + 5) = v99;
  *((_OWORD *)v94 + 2) = v96;
  *((_OWORD *)v94 + 3) = v97;
  v100 = (_QWORD *)((char *)&g_Nav_Kalman_WD + 61306);
  *(_QWORD *)((char *)v100 + 6) = 0;
  *v100 = 0;
  v101 = (char *)&g_Nav_Kalman_WD + 61304;
  *(_DWORD *)(v101 + 31) = 0;
  *((_OWORD *)v101 + 1) = v155;
  memcpy((char *)&g_Nav_Kalman_WD + 61339, v166, 0x1EFuLL);
  v102 = (__int128 *)((char *)&g_Nav_Kalman_WD + 61846);
  v103 = v164[13];
  v102[10] = v164[12];
  v102[11] = v103;
  v102[12] = v164[14];
  *(_OWORD *)((char *)v102 + 201) = *(_OWORD *)((char *)&v164[14] + 9);
  v104 = v164[9];
  v102[6] = v164[8];
  v102[7] = v104;
  v105 = v164[11];
  v102[8] = v164[10];
  v102[9] = v105;
  v106 = v164[5];
  v102[2] = v164[4];
  v102[3] = v106;
  v107 = v164[7];
  v102[4] = v164[6];
  v102[5] = v107;
  v108 = v164[3];
  *v102 = v164[2];
  v102[1] = v108;
  v109 = v161;
  xmmword_2579DE750 = v162;
  xmmword_2579DE760 = v163;
  xmmword_2579DE770 = v164[0];
  v110 = &g_Nav_Kalman_WD + 3877;
  *(__int128 *)((char *)v110 + 89) = *(_OWORD *)((char *)v164 + 9);
  v111 = (char *)&g_Nav_Kalman_WD + 61834;
  *(_QWORD *)v111 = v165[0];
  v112 = v165[1];
  *((_BYTE *)&g_Nav_Kalman_WD + 62063) = 0;
  *((_DWORD *)v111 + 2) = v112;
  xmmword_2579DE740 = v109;
  v113 = (char *)&g_Nav_Kalman_WD + 62137;
  *(_WORD *)v113 = 0;
  v113[2] = 0;
  *((_BYTE *)v110 + 108) = 0;
  v114 = (char *)&g_Nav_Kalman_WD + 62141;
  v114[2] = 0;
  *(_WORD *)v114 = 0;
  *((_DWORD *)v110 + 28) = 0;
  *((_BYTE *)v110 + 116) = 0;
  v115 = (char *)&g_Nav_Kalman_WD + 62149;
  *(_WORD *)v115 = 0;
  v115[2] = 0;
  *((_DWORD *)v110 + 30) = 0;
  *((_BYTE *)v110 + 124) = 0;
  v116 = (char *)&g_Nav_Kalman_WD + 62157;
  *(_WORD *)v116 = 0;
  v116[2] = 0;
  *((_DWORD *)v110 + 32) = 0;
  *((_BYTE *)v110 + 132) = 0;
  v117 = (char *)&g_Nav_Kalman_WD + 62165;
  v117[2] = 0;
  *(_WORD *)v117 = 0;
  *((_DWORD *)v110 + 34) = 0;
  *((_BYTE *)v110 + 140) = 0;
  v118 = (char *)&g_Nav_Kalman_WD + 62173;
  v118[2] = 0;
  *(_WORD *)v118 = 0;
  *((_DWORD *)v110 + 36) = 0;
  *((_BYTE *)v110 + 148) = 0;
  v119 = (char *)&g_Nav_Kalman_WD + 62181;
  v119[2] = 0;
  *(_WORD *)v119 = 0;
  *((_DWORD *)v110 + 38) = 0;
  *((_BYTE *)v110 + 156) = 0;
  v120 = (char *)&g_Nav_Kalman_WD + 62189;
  v120[2] = 0;
  *(_WORD *)v120 = 0;
  *((_DWORD *)v110 + 40) = 0;
  *((_BYTE *)v110 + 164) = 0;
  v121 = (char *)&g_Nav_Kalman_WD + 62197;
  v121[2] = 0;
  *(_WORD *)v121 = 0;
  *((_DWORD *)v110 + 42) = 0;
  *((_BYTE *)v110 + 172) = 0;
  v122 = (char *)&g_Nav_Kalman_WD + 62205;
  v122[2] = 0;
  *(_WORD *)v122 = 0;
  *((_DWORD *)v110 + 44) = 0;
  *((_BYTE *)v110 + 180) = 0;
  v123 = (char *)&g_Nav_Kalman_WD + 62213;
  v123[2] = 0;
  *(_WORD *)v123 = 0;
  *((_DWORD *)v110 + 46) = 0;
  *((_BYTE *)v110 + 188) = 0;
  v124 = (char *)&g_Nav_Kalman_WD + 62221;
  v124[2] = 0;
  *(_WORD *)v124 = 0;
  *((_DWORD *)v110 + 48) = 0;
  *((_BYTE *)v110 + 196) = 0;
  v125 = (char *)&g_Nav_Kalman_WD + 62229;
  v125[2] = 0;
  *(_WORD *)v125 = 0;
  *((_DWORD *)v110 + 50) = 0;
  *((_BYTE *)v110 + 204) = 0;
  v126 = (char *)&g_Nav_Kalman_WD + 62237;
  v126[2] = 0;
  *(_WORD *)v126 = 0;
  *((_DWORD *)v110 + 52) = 0;
  *((_BYTE *)v110 + 212) = 0;
  v127 = (char *)&g_Nav_Kalman_WD + 62245;
  v127[2] = 0;
  *(_WORD *)v127 = 0;
  *((_DWORD *)v110 + 54) = 0;
  *((_BYTE *)v110 + 220) = 0;
  v128 = (char *)&g_Nav_Kalman_WD + 62253;
  v128[2] = 0;
  *(_WORD *)v128 = 0;
  *((_DWORD *)v110 + 56) = 0;
  *((_BYTE *)v110 + 228) = 0;
  v129 = (char *)&g_Nav_Kalman_WD + 62261;
  v129[2] = 0;
  *(_WORD *)v129 = 0;
  *((_DWORD *)v110 + 58) = 0;
  *((_BYTE *)v110 + 236) = 0;
  v130 = (char *)&g_Nav_Kalman_WD + 62269;
  v130[2] = 0;
  *(_WORD *)v130 = 0;
  *((_DWORD *)v110 + 60) = 0;
  *((_BYTE *)v110 + 244) = 0;
  v131 = (char *)&g_Nav_Kalman_WD + 62277;
  v131[2] = 0;
  *(_WORD *)v131 = 0;
  *((_DWORD *)v110 + 62) = 0;
  *((_BYTE *)v110 + 252) = 0;
  v132 = (char *)&g_Nav_Kalman_WD + 62285;
  v132[2] = 0;
  *(_WORD *)v132 = 0;
  *((_DWORD *)v110 + 64) = 0;
  *((_BYTE *)v110 + 260) = 0;
  v133 = (char *)&g_Nav_Kalman_WD + 62293;
  v133[2] = 0;
  *(_WORD *)v133 = 0;
  *((_DWORD *)v110 + 66) = 0;
  *((_BYTE *)v110 + 268) = 0;
  v134 = (char *)&g_Nav_Kalman_WD + 62301;
  v134[2] = 0;
  *(_WORD *)v134 = 0;
  *((_DWORD *)v110 + 68) = 0;
  *((_BYTE *)v110 + 276) = 0;
  v135 = (char *)&g_Nav_Kalman_WD + 62309;
  v135[2] = 0;
  *(_WORD *)v135 = 0;
  *((_DWORD *)v110 + 70) = 0;
  *((_BYTE *)v110 + 284) = 0;
  v136 = (char *)&g_Nav_Kalman_WD + 62317;
  v136[2] = 0;
  *(_WORD *)v136 = 0;
  *((_DWORD *)v110 + 72) = 0;
  *((_BYTE *)v110 + 292) = 0;
  v137 = (char *)&g_Nav_Kalman_WD + 62325;
  v137[2] = 0;
  *(_WORD *)v137 = 0;
  *((_DWORD *)v110 + 74) = 0;
  *((_BYTE *)v110 + 300) = 0;
  v138 = (char *)&g_Nav_Kalman_WD + 62333;
  v138[2] = 0;
  *(_WORD *)v138 = 0;
  *((_DWORD *)v110 + 76) = 0;
  *((_BYTE *)v110 + 308) = 0;
  v139 = (char *)&g_Nav_Kalman_WD + 62341;
  v139[2] = 0;
  *(_WORD *)v139 = 0;
  *((_DWORD *)v110 + 78) = 0;
  *((_BYTE *)v110 + 316) = 0;
  v140 = (char *)&g_Nav_Kalman_WD + 62349;
  v140[2] = 0;
  *(_WORD *)v140 = 0;
  *((_DWORD *)v110 + 80) = 0;
  *((_BYTE *)v110 + 324) = 0;
  v141 = (char *)&g_Nav_Kalman_WD + 62357;
  v141[2] = 0;
  *(_WORD *)v141 = 0;
  *((_DWORD *)v110 + 82) = 0;
  *((_BYTE *)v110 + 332) = 0;
  v142 = (char *)&g_Nav_Kalman_WD + 62365;
  v142[2] = 0;
  *(_WORD *)v142 = 0;
  *((_DWORD *)v110 + 84) = 0;
  *((_BYTE *)v110 + 340) = 0;
  v143 = (char *)&g_Nav_Kalman_WD + 62373;
  v143[2] = 0;
  *(_WORD *)v143 = 0;
  *((_DWORD *)v110 + 86) = 0;
  *((_BYTE *)v110 + 348) = 0;
  v144 = (char *)&g_Nav_Kalman_WD + 62381;
  v144[2] = 0;
  *(_WORD *)v144 = 0;
  *((_DWORD *)v110 + 88) = 0;
  *((_BYTE *)v110 + 356) = 0;
  v145 = (char *)&g_Nav_Kalman_WD + 62389;
  v145[2] = 0;
  *(_WORD *)v145 = 0;
  *((_DWORD *)v110 + 90) = 0;
  *((_BYTE *)v110 + 364) = 0;
  v146 = (char *)&g_Nav_Kalman_WD + 62397;
  v146[2] = 0;
  *(_WORD *)v146 = 0;
  *((_DWORD *)v110 + 92) = 0;
  *((_BYTE *)v110 + 372) = 0;
  v147 = (char *)&g_Nav_Kalman_WD + 62405;
  v147[2] = 0;
  *(_WORD *)v147 = 0;
  *((_QWORD *)v110 + 47) = 0;
  memcpy(&g_Nav_Kalman_WD + 3901, v160, 0x314uLL);
  v148 = (char *)&g_Nav_Kalman_WD + 63196;
  *((_QWORD *)v148 + 1) = 0;
  *((_DWORD *)v148 + 4) = 0;
  xmmword_2579DEBC0 = v158;
  v149 = &g_Nav_Kalman_WD + 3952;
  *(_WORD *)v149 = v159;
  memcpy((char *)&g_Nav_Kalman_WD + 63234, v157, 0x142uLL);
  v150 = &g_Nav_Kalman_WD + 3972;
  *(__int128 *)((char *)v150 + 24) = 0u;
  *(__int128 *)((char *)v150 + 40) = 0u;
  *(__int128 *)((char *)v150 + 56) = 0u;
  *(__int128 *)((char *)v150 + 8) = 0u;
  *(__int128 *)((char *)v149 + 424) = 0u;
  *(__int128 *)((char *)v149 + 472) = 0u;
  *(__int128 *)((char *)v149 + 456) = 0u;
  *((_DWORD *)&g_Nav_Kalman_WD + 15889) = 0;
  *((_BYTE *)&unk_2579CF658 + 63232) = 0;
  v151 = (_DWORD *)((char *)&g_Nav_Kalman_WD + 63625);
  *v151 = 0;
  *(_DWORD *)((char *)v151 + 3) = 0;
  *((_QWORD *)&unk_2579CF660 + 7904) = 0;
  *((_BYTE *)&unk_2579CF668 + 63232) = 0;
  v152 = (_DWORD *)((char *)&g_Nav_Kalman_WD + 63641);
  *(_DWORD *)((char *)v152 + 3) = 0;
  *v152 = 0;
  *((_QWORD *)&unk_2579CF670 + 7904) = 0;
  *((_BYTE *)&unk_2579CF6B8 + 63232) = 0;
  *(__int128 *)((char *)v149 + 440) = 0u;
  v153 = (_DWORD *)((char *)&g_Nav_Kalman_WD + 63721);
  *(_DWORD *)((char *)v153 + 3) = 0;
  *v153 = 0;
  *((_QWORD *)&unk_2579CF6C0 + 7904) = 0;
  *((_BYTE *)&unk_2579CF6C8 + 63232) = 0;
  memcpy((char *)&g_Nav_Kalman_WD + 63737, v156, 0x3E58uLL);
  dword_2579E2C21 = 0;
  *(int *)((char *)&dword_2579E2C21 + 3) = 0;
  xmmword_2579E2C28 = xmmword_24BC0A120;
  unk_2579E2C38 = xmmword_24BC0A130;
  qword_2579E2C48 = 0;
  byte_257A2D52C = 0;
  g_SV_State_Update_WD = 0;
  unk_257A2D524 = 0;
  memset(&v156[256], 0, 400);
  *(int *)((char *)&dword_257A2DAC9 + 3) = 0;
  dword_257A2DAC9 = 0;
  dword_257A2DB19 = 0;
  *(int *)((char *)&dword_257A2DB19 + 3) = 0;
  *(_DWORD *)v190 = 0;
  *(_DWORD *)&v190[3] = 0;
  memset(v187, 0, 322);
  dword_257A2DCD1 = 0;
  *(int *)((char *)&dword_257A2DCD1 + 3) = 0;
  dword_257A2DCE1 = 0;
  *(int *)((char *)&dword_257A2DCE1 + 3) = 0;
  dword_257A2DD31 = 0;
  *(int *)((char *)&dword_257A2DD31 + 3) = 0;
  *(_DWORD *)&v160[3] = 0;
  *(_DWORD *)v160 = 0;
  memset(v186, 0, 322);
  *(int *)((char *)&dword_257A2DEE9 + 3) = 0;
  dword_257A2DEE9 = 0;
  dword_257A2DEF9 = 0;
  *(int *)((char *)&dword_257A2DEF9 + 3) = 0;
  dword_257A2DF49 = 0;
  *(int *)((char *)&dword_257A2DF49 + 3) = 0;
  LODWORD(v166[0]) = 0;
  *(_DWORD *)((char *)v166 + 3) = 0;
  memset(v188, 0, 322);
  dword_257A2E101 = 0;
  *(int *)((char *)&dword_257A2E101 + 3) = 0;
  dword_257A2E111 = 0;
  *(int *)((char *)&dword_257A2E111 + 3) = 0;
  *(int *)((char *)&dword_257A2E161 + 3) = 0;
  dword_257A2E161 = 0;
  LODWORD(v202[0]) = 0;
  *(_DWORD *)((char *)v202 + 3) = 0;
  byte_257A2DB18 = 0;
  unk_257A2DB08 = 0u;
  unk_257A2DAF8 = 0u;
  unk_257A2DAE8 = 0u;
  unk_257A2DAD8 = 0u;
  byte_257A2DCD0 = 0;
  xmmword_257A2DCC0 = 0u;
  xmmword_257A2DCB0 = 0u;
  xmmword_257A2DCA0 = 0u;
  xmmword_257A2DC90 = 0u;
  xmmword_257A2DCF0 = 0u;
  xmmword_257A2DD00 = 0u;
  xmmword_257A2DD10 = 0u;
  xmmword_257A2DD20 = 0u;
  byte_257A2DD30 = 0;
  byte_257A2DEE8 = 0;
  unk_257A2DED8 = 0u;
  unk_257A2DEC8 = 0u;
  unk_257A2DEB8 = 0u;
  unk_257A2DEA8 = 0u;
  unk_257A2DF08 = 0u;
  unk_257A2DF18 = 0u;
  unk_257A2DF28 = 0u;
  unk_257A2DF38 = 0u;
  byte_257A2DF48 = 0;
  byte_257A2E100 = 0;
  xmmword_257A2E0F0 = 0u;
  xmmword_257A2E0E0 = 0u;
  xmmword_257A2E0D0 = 0u;
  xmmword_257A2E0C0 = 0u;
  xmmword_257A2E120 = 0u;
  xmmword_257A2E130 = 0u;
  xmmword_257A2E140 = 0u;
  xmmword_257A2E150 = 0u;
  byte_257A2E160 = 0;
  bzero(v156, 0x402uLL);
  memset(&v190[7], 0, 26);
  memset(&v160[7], 0, 26);
  *(_OWORD *)((char *)v166 + 7) = 0uLL;
  *(_QWORD *)((char *)&v166[1] + 7) = 0;
  *(_WORD *)((char *)&v166[1] + 15) = 0;
  bzero((char *)v202 + 7, 0x824uLL);
  memcpy(&g_GNSS_Debug_Data, v156, 0x590uLL);
  qword_257A2DAC0 = 0;
  byte_257A2DAC8 = 0;
  qword_257A2DAD0 = 0;
  qword_257A2DB20 = 0;
  byte_257A2DB28 = 0;
  xmmword_257A2DB29 = *(_OWORD *)v190;
  unk_257A2DB39 = *(_OWORD *)&v190[16];
  byte_257A2DB49 = v190[32];
  memcpy(&unk_257A2DB4A, v187, 0x142uLL);
  dword_257A2DC8C = 0;
  qword_257A2DCD8 = 0;
  byte_257A2DCE0 = 0;
  qword_257A2DCE8 = 0;
  qword_257A2DD38 = 0;
  byte_257A2DD40 = 0;
  xmmword_257A2DD41 = *(_OWORD *)v160;
  unk_257A2DD51 = *(_OWORD *)&v160[16];
  byte_257A2DD61 = v160[32];
  memcpy(&unk_257A2DD62, v186, 0x142uLL);
  dword_257A2DEA4 = 0;
  qword_257A2DEF0 = 0;
  byte_257A2DEF8 = 0;
  qword_257A2DF00 = 0;
  qword_257A2DF50 = 0;
  byte_257A2DF58 = 0;
  xmmword_257A2DF59 = v166[0];
  unk_257A2DF69 = v166[1];
  byte_257A2DF79 = v166[2];
  memcpy(&unk_257A2DF7A, v188, 0x142uLL);
  dword_257A2E0BC = 0;
  qword_257A2E108 = 0;
  byte_257A2E110 = 0;
  qword_257A2E118 = 0;
  qword_257A2E168 = 0;
  byte_257A2E170 = 0;
  return memcpy(&unk_257A2E171, v202, 0x82BuLL);
}

char *GNSS_Log_p_list_Ptr_Mismatch(char *result, const void *a2, const void *a3)
{
  char *v4;
  char v5;
  uint64_t v6;
  char v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  char *v14;
  _QWORD v15[2];
  char *v16;
  uint64_t *v17;
  char v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a2 != a3)
  {
    v4 = v18;
    v16 = v18;
    v17 = &v19;
    v15[1] = v18;
    v5 = 69;
    v6 = 1u;
    do
    {
      v15[0] = v4 + 1;
      *v4 = v5;
      v4 = (char *)v15[0];
      if (v15[0] >= (unint64_t)v17)
      {
        v4 = v16;
        v15[0] = v16;
      }
      v5 = aErrorPListCorr[v6++];
    }
    while (v6 != 30);
    v7 = *result;
    if (*result)
    {
      v8 = (unsigned __int8 *)(result + 1);
      do
      {
        v15[0] = v4 + 1;
        *v4 = v7;
        v4 = (char *)v15[0];
        if (v15[0] >= (unint64_t)v17)
        {
          v4 = v16;
          v15[0] = v16;
        }
        v9 = *v8++;
        v7 = v9;
      }
      while (v9);
    }
    v10 = 0;
    v11 = 58;
    do
    {
      v15[0] = v4 + 1;
      *v4 = v11;
      v4 = (char *)v15[0];
      if (v15[0] >= (unint64_t)v17)
      {
        v4 = v16;
        v15[0] = v16;
      }
      v11 = asc_24BC0723B[++v10];
    }
    while (v10 != 2);
    sprintf_p((uint64_t)v15, (unint64_t)a2);
    v12 = 0;
    v13 = 32;
    v14 = (char *)v15[0];
    do
    {
      v15[0] = v14 + 1;
      *v14 = v13;
      v14 = (char *)v15[0];
      if (v15[0] >= (unint64_t)v17)
      {
        v14 = v16;
        v15[0] = v16;
      }
      v13 = asc_24BC0723E[++v12];
    }
    while (v12 != 4);
    sprintf_p((uint64_t)v15, (unint64_t)a3);
    *(_BYTE *)v15[0] = 0;
    return EvCrt_v("%s", v18);
  }
  return result;
}

const void **GNSS_Validate_p_list(const void **result, const char *a2)
{
  const void **v3;
  const void *v4;
  char __dst[128];
  uint64_t v6;

  v3 = result;
  v6 = *MEMORY[0x24BDAC8D0];
  v4 = result[1];
  if (v4 != (const void *)qword_257A47968
    || result[2] != (const void *)qword_257A47970
    || result[3] != (const void *)qword_257A47978
    || result[4] != (const void *)qword_257A47980
    || result[5] != (const void *)qword_257A47988
    || result[6] != (const void *)qword_257A47990
    || result[7] != (const void *)qword_257A47998
    || result[8] != (const void *)qword_257A479A0
    || result[9] != (const void *)qword_257A479A8
    || result[10] != (const void *)qword_257A479B0
    || result[11] != (const void *)qword_257A479B8
    || result[12] != (const void *)qword_257A479C0
    || result[13] != (const void *)qword_257A479C8
    || result[14] != (const void *)qword_257A479D0
    || result[15] != (const void *)qword_257A479D8
    || result[16] != (const void *)qword_257A479E0
    || result[17] != (const void *)qword_257A479E8
    || result[18] != (const void *)qword_257A479F0
    || result[19] != (const void *)qword_257A479F8
    || result[21] != (const void *)qword_257A47A08
    || result[22] != (const void *)qword_257A47A10
    || result[23] != (const void *)qword_257A47A18
    || result[25] != (const void *)qword_257A47A28
    || result[26] != (const void *)qword_257A47A30
    || result[27] != (const void *)qword_257A47A38
    || result[28] != (const void *)qword_257A47A40
    || result[29] != (const void *)qword_257A47A48
    || result[30] != (const void *)qword_257A47A50
    || result[31] != (const void *)qword_257A47A58
    || result[32] != (const void *)qword_257A47A60
    || result[33] != (const void *)qword_257A47A68
    || result[34] != (const void *)qword_257A47A70
    || result[35] != (const void *)qword_257A47A78
    || result[36] != (const void *)qword_257A47A80
    || result[37] != (const void *)qword_257A47A88)
  {
    GNSS_Log_p_list_Ptr_Mismatch("DBtt", v4, (const void *)qword_257A47968);
    GNSS_Log_p_list_Ptr_Mismatch("DBrm", v3[2], (const void *)qword_257A47970);
    GNSS_Log_p_list_Ptr_Mismatch("DBsf", v3[3], (const void *)qword_257A47978);
    GNSS_Log_p_list_Ptr_Mismatch("DBae", v3[4], (const void *)qword_257A47980);
    GNSS_Log_p_list_Ptr_Mismatch("DBaa", v3[5], (const void *)qword_257A47988);
    GNSS_Log_p_list_Ptr_Mismatch("DBts", v3[6], (const void *)qword_257A47990);
    GNSS_Log_p_list_Ptr_Mismatch("DBnm", v3[7], (const void *)qword_257A47998);
    GNSS_Log_p_list_Ptr_Mismatch("DBcr", v3[8], (const void *)qword_257A479A0);
    GNSS_Log_p_list_Ptr_Mismatch("DBss", v3[9], (const void *)qword_257A479A8);
    GNSS_Log_p_list_Ptr_Mismatch("DBns", v3[10], (const void *)qword_257A479B0);
    GNSS_Log_p_list_Ptr_Mismatch("DBst", v3[11], (const void *)qword_257A479B8);
    GNSS_Log_p_list_Ptr_Mismatch("DBtm", v3[12], (const void *)qword_257A479C0);
    GNSS_Log_p_list_Ptr_Mismatch("DBsn", v3[13], (const void *)qword_257A479C8);
    GNSS_Log_p_list_Ptr_Mismatch("MEsd", v3[14], (const void *)qword_257A479D0);
    GNSS_Log_p_list_Ptr_Mismatch("GMsd", v3[15], (const void *)qword_257A479D8);
    GNSS_Log_p_list_Ptr_Mismatch("NKsd", v3[16], (const void *)qword_257A479E0);
    GNSS_Log_p_list_Ptr_Mismatch("DDsd", v3[17], (const void *)qword_257A479E8);
    GNSS_Log_p_list_Ptr_Mismatch("STsd", v3[18], (const void *)qword_257A479F0);
    GNSS_Log_p_list_Ptr_Mismatch("PPsd", v3[19], (const void *)qword_257A479F8);
    GNSS_Log_p_list_Ptr_Mismatch("NKwd", v3[21], (const void *)qword_257A47A08);
    GNSS_Log_p_list_Ptr_Mismatch("DDwd", v3[22], (const void *)qword_257A47A10);
    GNSS_Log_p_list_Ptr_Mismatch("STwd", v3[23], (const void *)qword_257A47A18);
    GNSS_Log_p_list_Ptr_Mismatch("GNdd", v3[25], (const void *)qword_257A47A28);
    GNSS_Log_p_list_Ptr_Mismatch("Vers", v3[26], (const void *)qword_257A47A30);
    GNSS_Log_p_list_Ptr_Mismatch("GNcf", v3[27], (const void *)qword_257A47A38);
    GNSS_Log_p_list_Ptr_Mismatch("GNnd", v3[28], (const void *)qword_257A47A40);
    GNSS_Log_p_list_Ptr_Mismatch("GNdd", v3[29], (const void *)qword_257A47A48);
    GNSS_Log_p_list_Ptr_Mismatch("NVrm", v3[30], (const void *)qword_257A47A50);
    GNSS_Log_p_list_Ptr_Mismatch("NArm", v3[31], (const void *)qword_257A47A58);
    GNSS_Log_p_list_Ptr_Mismatch("Meas", v3[32], (const void *)qword_257A47A60);
    GNSS_Log_p_list_Ptr_Mismatch("Ctrl", v3[33], (const void *)qword_257A47A68);
    GNSS_Log_p_list_Ptr_Mismatch("NMEA", v3[34], (const void *)qword_257A47A70);
    GNSS_Log_p_list_Ptr_Mismatch("NDbg", v3[35], (const void *)qword_257A47A78);
    GNSS_Log_p_list_Ptr_Mismatch("ELog", v3[36], (const void *)qword_257A47A80);
    GNSS_Log_p_list_Ptr_Mismatch("GDbg", v3[37], (const void *)qword_257A47A88);
    strlcpy(__dst, a2, 0x69uLL);
    strlcat(__dst, ": p_list DB corrupted!", 0x80uLL);
    return (const void **)gn_report_assertion_failure(__dst);
  }
  return result;
}

double Inc_Local_Time(int a1, int a2, double *a3, __int16 *a4)
{
  int v4;
  double v5;
  double v6;
  double v7;
  int v8;
  int v9;
  __int16 v10;
  __int16 v11;
  double result;

  v4 = 1000 * a2;
  v5 = *a3 * 1000.0;
  v6 = -0.5;
  if (v5 > 0.0)
    v6 = 0.5;
  v7 = v5 + v6;
  if (v7 <= 2147483650.0)
  {
    if (v7 >= -2147483650.0)
      v8 = (int)v7;
    else
      v8 = 0x80000000;
  }
  else
  {
    v8 = 0x7FFFFFFF;
  }
  v9 = v8 + a1;
  if (v9 >= v4)
  {
    v10 = *a4;
    do
    {
      v9 -= v4;
      ++v10;
    }
    while (v9 >= v4);
    *a4 = v10;
  }
  if (v9 < 0)
  {
    v11 = *a4;
    do
    {
      v9 += v4;
      --v11;
    }
    while (v9 < 0);
    *a4 = v11;
  }
  result = (double)v9 * 0.001;
  *a3 = result;
  return result;
}

uint64_t RtiPayloadCodec::DecodeFromHexData(RtiPayloadCodec::Payload *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char __str[966];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a2[1] - *a2;
  if (v6 == 112)
  {
    v7 = 6;
  }
  else
  {
    if (v6 != 128)
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        v11 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid RTI file size! Received file size is [%lu]\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "GNC", 69, "DecodeFromHexData", a2[1] - *a2);
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      return 9;
    }
    v7 = 7;
  }
  std::vector<RtiPayloadCodec::Payload>::resize(a1, v7);
  v8 = *(_QWORD *)a1;
  v9 = *((_QWORD *)a1 + 1);
  while (1)
  {
    if (v8 == v9)
      return 1;
    if (XofIntegralType<unsigned long long>::DecodeFromHexData(v8, a2, a3) != 1
      || XofIntegralType<unsigned long long>::DecodeFromHexData(v8 + 56, a2, a3) != 1)
    {
      break;
    }
    v8 += 112;
  }
  return 5;
}

void std::vector<RtiPayloadCodec::Payload>::resize(RtiPayloadCodec::Payload *a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;

  v3 = *((_QWORD *)a1 + 1);
  v4 = 0x6DB6DB6DB6DB6DB7 * ((v3 - *(_QWORD *)a1) >> 4);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<RtiPayloadCodec::Payload>::__append(a1, v6);
  }
  else if (!v5)
  {
    v7 = *(_QWORD *)a1 + 112 * a2;
    while (v3 != v7)
    {
      v3 -= 112;
      std::allocator<RtiPayloadCodec::Payload>::destroy[abi:ne180100]((uint64_t)a1 + 16, v3);
    }
    *((_QWORD *)a1 + 1) = v7;
  }
}

uint64_t RtiDataCodec::Decode(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  char __str[966];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (RtiDataCodec::VerifyCRC(a1, (uint64_t)a2) != 1)
    return 4;
  if (XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)a1, a2, a3) != 1
    || XofIntegralType<unsigned short>::DecodeFromHexData((unsigned __int16 *)(a1 + 32), a2, a3) != 1
    || XofIntegralType<unsigned int>::DecodeFromHexData((unsigned int *)(a1 + 64), a2, a3) != 1
    || RtiPayloadCodec::DecodeFromHexData((RtiPayloadCodec::Payload *)(a1 + 104), a2, a3) != 1
    || XofIntegralType<unsigned int>::DecodeFromHexData((unsigned int *)(a1 + 128), a2, a3) != 1
    || XofIntegralType<unsigned int>::DecodeFromHexData((unsigned int *)(a1 + 168), a2, a3) != 1)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v8 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RTI Data Decode Failure\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "GNC", 87, "Decode");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    return 5;
  }
  if (a2[1] - *a2 != *a3)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid data length!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "GNC", 69, "Decode");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    return 5;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RtiVer,%u,FileGpsWeek,%u,FileGpsTow,%u,FileCRC,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 73, "Decode", *(unsigned __int16 *)(a1 + 6), *(unsigned __int16 *)(a1 + 38), *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 180));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  return 1;
}

uint64_t RtiDataCodec::VerifyCRC(uint64_t a1, uint64_t a2)
{
  int CRC32;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::string __p;
  unsigned int v9[4];
  void *v10;
  char v11;
  int v12;
  char __str[966];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = *(_DWORD *)(a2 + 8) - *(_DWORD *)a2 - 4;
  std::string::basic_string[abi:ne180100]<0>(&__p, "rtiCRC");
  XofIntegralType<unsigned int>::XofIntegralType((uint64_t)v9, &__p, 0, -1, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (XofIntegralType<unsigned int>::DecodeFromHexData(v9, (_QWORD *)a2, &v12) == 1)
  {
    CRC32 = CRCGenerator::GetCRC32((_QWORD *)a2, 0, *(_DWORD *)(a2 + 8) - *(_DWORD *)a2 - 4);
    if (v9[3] == CRC32)
    {
      v4 = 1;
    }
    else
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        v6 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Invalid CRC in the RTI file!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 69, "VerifyCRC");
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      v4 = 4;
    }
  }
  else
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode RTI CRC!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "GNC", 69, "VerifyCRC");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    v4 = 5;
  }
  if (v11 < 0)
    operator delete(v10);
  return v4;
}

void sub_24BBD3600(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t RtiDataCodec::DecodeRtiFormatVersion(uint64_t a1, _QWORD *a2, _WORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v8;
  std::string __p;
  unsigned __int16 v10[4];
  void *v11;
  char v12;
  char __str[966];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (RtiDataCodec::VerifyCRC(a1, (uint64_t)a2) != 1)
    return 5;
  std::string::basic_string[abi:ne180100]<0>(&__p, "formatVersion");
  XofIntegralType<unsigned short>::XofIntegralType((uint64_t)v10, &__p, 1, 3, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v8 = 0;
  if (XofIntegralType<unsigned short>::DecodeFromHexData(v10, a2, &v8) == 1)
  {
    *a3 = v10[3];
    v5 = 1;
  }
  else
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v6 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Could not decode RTI format version!\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "GNC", 87, "DecodeRtiFormatVersion");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    v5 = 5;
  }
  if (v12 < 0)
    operator delete(v11);
  return v5;
}

void sub_24BBD37A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

RtiPayloadCodec::Payload *std::vector<RtiPayloadCodec::Payload>::__append(RtiPayloadCodec::Payload *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  RtiPayloadCodec::Payload *v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int64x2_t v24;
  char *v25;
  char *v26;
  int64x2_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = *((_QWORD *)a1 + 2);
  v4 = (uint64_t)a1 + 16;
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0x6DB6DB6DB6DB6DB7 * ((v6 - v7) >> 4) >= a2)
    return std::vector<RtiPayloadCodec::Payload>::__construct_at_end(a1, a2);
  v8 = 0x6DB6DB6DB6DB6DB7 * ((v7 - *(_QWORD *)a1) >> 4);
  v9 = v8 + a2;
  if (v8 + a2 > 0x249249249249249)
    std::vector<RtiPayloadCodec::Payload>::__throw_length_error[abi:ne180100]();
  v10 = 0x6DB6DB6DB6DB6DB7 * ((v5 - *(_QWORD *)a1) >> 4);
  if (2 * v10 > v9)
    v9 = 2 * v10;
  if (v10 >= 0x124924924924924)
    v11 = 0x249249249249249;
  else
    v11 = v9;
  v29 = v4;
  if (v11)
    v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RtiPayloadCodec::Payload>>(v4, v11);
  else
    v12 = 0;
  v14 = (RtiPayloadCodec::Payload *)&v12[112 * v8];
  v26 = v12;
  v27.i64[0] = (uint64_t)v14;
  v27.i64[1] = (uint64_t)v14;
  v28 = &v12[112 * v11];
  v15 = 112 * a2;
  v16 = (_OWORD *)((char *)v14 + 112 * a2);
  do
  {
    *((_OWORD *)v14 + 5) = 0u;
    *((_OWORD *)v14 + 6) = 0u;
    *((_OWORD *)v14 + 3) = 0u;
    *((_OWORD *)v14 + 4) = 0u;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
    *(_OWORD *)v14 = 0u;
    RtiPayloadCodec::Payload::Payload(v14);
    v14 = (RtiPayloadCodec::Payload *)((char *)v14 + 112);
    v15 -= 112;
  }
  while (v15);
  v17 = *(_QWORD *)a1;
  v18 = *((_QWORD *)a1 + 1);
  v19 = v27.i64[0];
  if (v18 == *(_QWORD *)a1)
  {
    v24 = vdupq_n_s64(v18);
  }
  else
  {
    do
    {
      v20 = *(_OWORD *)(v18 - 96);
      *(_OWORD *)(v19 - 112) = *(_OWORD *)(v18 - 112);
      *(_OWORD *)(v19 - 96) = v20;
      v21 = *(_OWORD *)(v18 - 80);
      *(_QWORD *)(v19 - 64) = *(_QWORD *)(v18 - 64);
      *(_OWORD *)(v19 - 80) = v21;
      *(_QWORD *)(v18 - 72) = 0;
      *(_QWORD *)(v18 - 64) = 0;
      *(_QWORD *)(v18 - 80) = 0;
      v22 = *(_OWORD *)(v18 - 56);
      *(_OWORD *)(v19 - 40) = *(_OWORD *)(v18 - 40);
      *(_OWORD *)(v19 - 56) = v22;
      v23 = *(_OWORD *)(v18 - 24);
      *(_QWORD *)(v19 - 8) = *(_QWORD *)(v18 - 8);
      *(_OWORD *)(v19 - 24) = v23;
      v19 -= 112;
      *(_QWORD *)(v18 - 16) = 0;
      *(_QWORD *)(v18 - 8) = 0;
      *(_QWORD *)(v18 - 24) = 0;
      v18 -= 112;
    }
    while (v18 != v17);
    v24 = *(int64x2_t *)a1;
  }
  *(_QWORD *)a1 = v19;
  *((_QWORD *)a1 + 1) = v16;
  v27 = v24;
  v25 = (char *)*((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v28;
  v28 = v25;
  v26 = (char *)v24.i64[0];
  return (RtiPayloadCodec::Payload *)std::__split_buffer<RtiPayloadCodec::Payload>::~__split_buffer((uint64_t)&v26);
}

void sub_24BBD39F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<RtiPayloadCodec::Payload>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

RtiPayloadCodec::Payload *std::vector<RtiPayloadCodec::Payload>::__construct_at_end(RtiPayloadCodec::Payload *result, uint64_t a2)
{
  RtiPayloadCodec::Payload *v2;
  RtiPayloadCodec::Payload *v3;
  RtiPayloadCodec::Payload *v4;
  uint64_t v5;

  v2 = result;
  v3 = (RtiPayloadCodec::Payload *)*((_QWORD *)result + 1);
  if (a2)
  {
    v4 = (RtiPayloadCodec::Payload *)((char *)v3 + 112 * a2);
    v5 = 112 * a2;
    do
    {
      *((_OWORD *)v3 + 5) = 0u;
      *((_OWORD *)v3 + 6) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *((_OWORD *)v3 + 4) = 0u;
      *((_OWORD *)v3 + 1) = 0u;
      *((_OWORD *)v3 + 2) = 0u;
      *(_OWORD *)v3 = 0u;
      result = RtiPayloadCodec::Payload::Payload(v3);
      v3 = (RtiPayloadCodec::Payload *)((char *)v3 + 112);
      v5 -= 112;
    }
    while (v5);
    v3 = v4;
  }
  *((_QWORD *)v2 + 1) = v3;
  return result;
}

void sub_24BBD3AB0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

RtiPayloadCodec::Payload *RtiPayloadCodec::Payload::Payload(RtiPayloadCodec::Payload *this)
{
  __int128 v2;
  __int128 v3;
  std::string __p;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;
  std::string v9;
  _OWORD v10[2];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(&v9, "L1CADoNotUseBitMask");
  XofIntegralType<unsigned long long>::XofIntegralType((uint64_t)v10, &v9, 0, -1, 0);
  std::string::basic_string[abi:ne180100]<0>(&__p, "L5DoNotUseBitMask");
  XofIntegralType<unsigned long long>::XofIntegralType((uint64_t)v6, &__p, 0, -1, 0);
  v2 = v10[1];
  *(_OWORD *)this = v10[0];
  *((_OWORD *)this + 1) = v2;
  *((_OWORD *)this + 2) = v11;
  v3 = v6[1];
  *(_OWORD *)((char *)this + 56) = v6[0];
  *((_QWORD *)this + 6) = v12;
  v11 = 0uLL;
  v12 = 0;
  *(_OWORD *)((char *)this + 72) = v3;
  *(_OWORD *)((char *)this + 88) = v7;
  *((_QWORD *)this + 13) = v8;
  v7 = 0uLL;
  v8 = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v12) < 0)
      operator delete((void *)v11);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
  return this;
}

void sub_24BBD3BD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 25) < 0)
    operator delete(*(void **)(v28 - 48));
  if (a28 < 0)
    operator delete(a23);
  _Unwind_Resume(exception_object);
}

void std::vector<RtiPayloadCodec::Payload>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RtiPayloadCodec::Payload>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(112 * a2);
}

uint64_t std::__split_buffer<RtiPayloadCodec::Payload>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 16) = i - 112;
    std::allocator<RtiPayloadCodec::Payload>::destroy[abi:ne180100](v4, i - 112);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

RtiPayloadCodec::Payload *std::vector<RtiPayloadCodec::Payload>::vector(RtiPayloadCodec::Payload *a1, unint64_t a2)
{
  *(_QWORD *)a1 = 0;
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
  if (a2)
  {
    std::vector<RtiPayloadCodec::Payload>::__vallocate[abi:ne180100](a1, a2);
    std::vector<RtiPayloadCodec::Payload>::__construct_at_end(a1, a2);
  }
  return a1;
}

void sub_24BBD3DCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<RtiPayloadCodec::Payload>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

char *std::vector<RtiPayloadCodec::Payload>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x24924924924924ALL)
    std::vector<RtiPayloadCodec::Payload>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RtiPayloadCodec::Payload>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[112 * v4];
  return result;
}

void GLON_Alm_Calc_ECEF_PosVel(double *a1, double *a2, double *a3, int a4)
{
  double v8;
  double v9;
  long double v10;
  double v11;
  double v12;
  __double2 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __double2 v18;
  double v19;
  double v20;
  __double2 v21;
  __double2 v22;
  __double2 v23;
  double v24;
  double v25;
  __double2 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;

  v8 = a1[4];
  if (v8 > 3.14159265)
  {
    do
      v8 = v8 + -6.28318531;
    while (v8 > 3.14159265);
    a1[4] = v8;
  }
  if (v8 < -3.14159265)
  {
    do
      v8 = v8 + 6.28318531;
    while (v8 < -3.14159265);
    a1[4] = v8;
  }
  v9 = a1[1];
  v10 = v8;
  do
  {
    v11 = v10;
    v10 = v8 + v9 * sin(v10);
  }
  while (vabdd_f64(v11, v10) > 2.22044605e-15);
  v12 = sqrt(1.0 - v9 * v9);
  v13 = __sincos_stret(v10);
  v14 = atan2(v12 * v13.__sinval, v13.__cosval - v9);
  v15 = v14 + a1[5];
  v16 = (1.0 - v9 * v13.__cosval) * *a1;
  v17 = sqrt(398600.44 / *a1);
  v18 = __sincos_stret(v14);
  v19 = v18.__sinval * (v9 * v17) / v12;
  v20 = (v9 * v18.__cosval + 1.0) * v17 / v12;
  v21 = __sincos_stret(v15);
  v22 = __sincos_stret(a1[2]);
  v23 = __sincos_stret(a1[3]);
  v24 = -(v21.__sinval * v22.__sinval) * v23.__cosval + v21.__cosval * v22.__cosval;
  v25 = v21.__sinval * v22.__cosval * v23.__cosval + v21.__cosval * v22.__sinval;
  *a2 = v16 * v24;
  a2[1] = v16 * v25;
  a2[2] = v16 * v21.__sinval * v23.__sinval;
  *a3 = v19 * v24 - v20 * (v21.__cosval * v22.__sinval * v23.__cosval + v21.__sinval * v22.__cosval);
  a3[1] = v19 * v25 - v20 * (-(v21.__cosval * v22.__cosval) * v23.__cosval + v21.__sinval * v22.__sinval);
  a3[2] = v23.__sinval * (v21.__cosval * v20) + v21.__sinval * v19 * v23.__sinval;
  v26 = __sincos_stret((double)(a4 % 86400 - 10800) * 0.00007292115);
  v27 = a2[1];
  v28 = v26.__sinval * v27 + *a2 * v26.__cosval;
  v29 = v26.__cosval * v27 - *a2 * v26.__sinval;
  *a2 = v28;
  a2[1] = v29;
  v30 = a3[1];
  v31 = v26.__cosval * v30 - *a3 * v26.__sinval;
  *a3 = v26.__sinval * v30 + *a3 * v26.__cosval + v29 * 0.00007292115;
  a3[1] = v31 + v28 * -0.00007292115;
  v32 = 2;
  do
  {
    a2[v32] = a2[v32] * 1000.0;
    v33 = v32-- + 1;
  }
  while (v33 > 1);
  v34 = 2;
  do
  {
    a3[v34] = a3[v34] * 1000.0;
    v35 = v34-- + 1;
  }
  while (v35 > 1);
}

BOOL Hal35_Is_HW_SPI_EN_Default(void)
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  const __CFData *v4;
  const __CFData *v5;
  const UInt8 *BytePtr;
  int v7;
  _BOOL8 v8;
  unsigned __int8 *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  char __str[966];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v0 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "HAL", 73, "Hal35_Is_HW_SPI_EN_Default");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v1 = *MEMORY[0x24BDD8B18];
  v2 = IOServiceNameMatching("baseband");
  MatchingService = IOServiceGetMatchingService(v1, v2);
  if (!MatchingService)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v12 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IOServiceGetMatchingService - failed\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "HAL", 69, "Hal35_Is_HW_SPI_EN_Default");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    return 0;
  }
  v4 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("gnss-comms-interface"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (!v4)
  {
    if (g_LbsOsaTrace_Config >= 2)
    {
      bzero(__str, 0x3C6uLL);
      v13 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: gnss-comms-interface property not found\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "HAL", 87, "Hal35_Is_HW_SPI_EN_Default");
      gnssOsa_PrintLog(__str, 2, 1, 0);
    }
    CFRelease(0);
    return 0;
  }
  v5 = v4;
  BytePtr = CFDataGetBytePtr(v4);
  v7 = *BytePtr;
  v8 = v7 == 2;
  if (g_LbsOsaTrace_Config >= 3)
  {
    v9 = (unsigned __int8 *)BytePtr;
    bzero(__str, 0x3C6uLL);
    v10 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
    v11 = "PCIe";
    if (v7 == 2)
      v11 = "SPI";
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: GNSS Comms Interface property variable %d, %s\n", (unint64_t)v10, "HAL", 77, "Hal35_Is_HW_SPI_EN_Default", *v9, v11);
    gnssOsa_PrintLog(__str, 3, 1, 0);
  }
  CFRelease(v5);
  return v8;
}

void Hal35_Set_SPI_InUse(int a1)
{
  char __str[966];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  g_IsSPIEnabled = a1;
  if (a1)
  {
    if (g_LbsOsaTrace_Config < 3)
      return;
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ******* SPI transport in use **********\n");
  }
  else
  {
    if (g_LbsOsaTrace_Config < 3)
      return;
    bzero(__str, 0x3C6uLL);
    mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ******* PCIe<->NOC transport in use **********\n");
  }
  gnssOsa_PrintLog(__str, 3, 1, 0);
}

BOOL Hal35_InitSPI(void)
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  _BOOL8 v4;
  io_service_t v6;
  const __CFAllocator *v7;
  const __CFUUID *v8;
  const __CFUUID *v9;
  kern_return_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, _QWORD, uint64_t *);
  const __CFUUID *v16;
  CFUUIDBytes v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  SInt32 theScore;
  char __str[966];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v0 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: enter\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v1 = *MEMORY[0x24BDD8B18];
  v2 = IOServiceNameMatching("gnss");
  MatchingService = IOServiceGetMatchingService(v1, v2);
  if (!MatchingService)
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IOServiceGetMatchingService - failed\n");
      goto LABEL_9;
    }
    return 0;
  }
  if (IORegistryEntryGetChildEntry(MatchingService, "IOService", (io_registry_entry_t *)&_MergedGlobals_9))
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IORegistryEntryGetChildEntry - failed\n");
LABEL_9:
      gnssOsa_PrintLog(__str, 1, 1, 0);
      return 0;
    }
    return 0;
  }
  theScore = 0;
  v6 = _MergedGlobals_9;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v8 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x31u, 0x68u, 0xB0u, 0x8Eu, 0xE5u, 0x7Du, 0x4Eu, 4u, 0x92u, 0xC9u, 0xC0u, 0x15u, 0xB8u, 0xB0u, 0xE9u, 0xABu);
  v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v10 = IOCreatePlugInInterfaceForService(v6, v8, v9, (IOCFPlugInInterface ***)&pp_IOCFPluginInterface, &theScore);
  v4 = v10 == 0;
  if (v10)
  {
    if (!g_LbsOsaTrace_Config)
      return v4;
    bzero(__str, 0x3C6uLL);
    v11 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IOCreatePlugInInterfaceForService - failed\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "HAL", 69, "Hal35_InitSPI");
    v12 = 1;
LABEL_25:
    gnssOsa_PrintLog(__str, v12, 1, 0);
    return v4;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v13 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IOCreatePlugInInterfaceForService success\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v14 = pp_IOCFPluginInterface;
  v15 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)pp_IOCFPluginInterface + 8);
  v16 = CFUUIDGetConstantUUIDWithBytes(v7, 0xE8u, 0x77u, 0xCDu, 0x61u, 0x8Du, 0x30u, 0x46u, 0x2Du, 0xA3u, 0xB7u, 0xB0u, 0x11u, 0x5Au, 0x2Cu, 0xF8u, 0xA8u);
  v17 = CFUUIDGetUUIDBytes(v16);
  v15(v14, *(_QWORD *)&v17.byte0, *(_QWORD *)&v17.byte8, &pp_GNSSPassthroughInterface);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v18 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: QueryInterface done\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  (*(void (**)(uint64_t))(*(_QWORD *)pp_IOCFPluginInterface + 24))(pp_IOCFPluginInterface);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v19 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Release done\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  qword_257A4F008 = (uint64_t)dispatch_queue_create("com.gnss.libindusSPI", v20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)pp_GNSSPassthroughInterface + 64))(pp_GNSSPassthroughInterface, qword_257A4F008);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)pp_GNSSPassthroughInterface + 72))(pp_GNSSPassthroughInterface, Hal35_SPI_ReadCallback, 0);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)pp_GNSSPassthroughInterface + 88))(pp_GNSSPassthroughInterface, Hal32_eventCallback, 0);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v21 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Done\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "HAL", 73, "Hal35_InitSPI");
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  Hal35_Set_SPI_InUse(1);
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v22 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Callback set\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "HAL", 73, "Hal35_SetSPIReadCallback");
    v12 = 4;
    goto LABEL_25;
  }
  return v4;
}

void Hal35_SPI_ReadCallback(void *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t v6;
  char __str[966];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (g_LbsOsaTrace_Config > 4)
    {
      bzero(__str, 0x3C6uLL);
      v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: zx%c%c%c %u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "HAL", 68, "Hal35_SPI_ReadCallback", a2[2], a2[3], a2[4], a3);
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
    Hal02_SPI_ReadCb(a2, a3);
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: error\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "HAL", 69, "Hal35_SPI_ReadCallback");
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void Hal32_eventCallback(void *a1, int a2, void *a3)
{
  uint64_t v4;
  char __str[966];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: %d - evnet\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "HAL", 73, "Hal32_eventCallback", a2);
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
}

uint64_t Hal35_DeInitSPI(void)
{
  uint64_t v0;
  char __str[966];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (pp_IOCFPluginInterface)
  {
    IODestroyPlugInInterface((IOCFPlugInInterface **)pp_IOCFPluginInterface);
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v0 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: IODestroyPlugInInterface Done\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v0), "HAL", 73, "Hal35_DeInitSPI");
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
  }
  pp_IOCFPluginInterface = 0;
  pp_GNSSPassthroughInterface = 0;
  Hal35_Set_SPI_InUse(0);
  return 1;
}

uint64_t Hal35_SPIWrite(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char __str[966];
  uint64_t v9;

  v2 = a2;
  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *, _QWORD))(*(_QWORD *)pp_GNSSPassthroughInterface + 80))(pp_GNSSPassthroughInterface, a1, a2))
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v5 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: write error\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "HAL", 69, "Hal35_SPIWrite");
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    return 0xFFFFFFFFLL;
  }
  else if (g_LbsOsaTrace_Config > 4)
  {
    bzero(__str, 0x3C6uLL);
    v6 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: zx%c%c%c %u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v6), "HAL", 68, "Hal35_SPIWrite", a1[2], a1[3], a1[4], v4);
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  return v2;
}

void gnss::GnssAdaptDevice::injectAssistancePosition(uint64_t a1, char a2, int a3, uint64_t a4, int a5, uint64_t *a6, uint64_t a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  uint64_t v25;
  NSObject *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD block[5];
  _BYTE v31[24];
  _BYTE *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  char v44;
  char __str[966];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a7 + 24))
  {
    v25 = *a6;
    v26 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice24injectAssistancePositionEddbdddddNS_11ReliabilityEyNS_18PositionAssistTypeERKNS_20PositionAssistOriginENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_7;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v31, a7);
    v33 = a8;
    v34 = a9;
    v44 = a2;
    v35 = a10;
    v36 = a11;
    v37 = a12;
    v38 = a13;
    v39 = a14;
    v42 = a3;
    v43 = a5;
    v40 = a4;
    v41 = v25;
    dispatch_async(v26, block);
    v27 = v32;
    if (v32 == v31)
    {
      v28 = 4;
      v27 = v31;
    }
    else
    {
      if (!v32)
        return;
      v28 = 5;
    }
    (*(void (**)(void))(*v27 + 8 * v28))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v29 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 69, "injectAssistancePosition", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice24injectAssistancePositionEddbdddddNS_11ReliabilityEyNS_18PositionAssistTypeERKNS_20PositionAssistOriginENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  char v8;
  double v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  double v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  unsigned int v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  double v68;
  double v69;
  double v70;
  __int16 v71;
  char v72;
  double v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  _BYTE v78[24];
  _BYTE *v79;
  _BYTE v80[24];
  _BYTE *v81;
  _BYTE v82[24];
  _BYTE *v83;
  _BYTE v84[24];
  _BYTE *v85;
  _BYTE v86[24];
  _BYTE *v87;
  _BYTE v88[24];
  _BYTE *v89;
  _BYTE v90[24];
  _BYTE *v91;
  _BYTE v92[24];
  _BYTE *v93;
  _BYTE v94[24];
  _BYTE *v95;
  _BYTE v96[24];
  _BYTE *v97;
  _BYTE v98[24];
  _BYTE *v99;
  _BYTE v100[24];
  _BYTE *v101;
  char __str[966];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "injectAssistancePosition_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (!*((_BYTE *)v2 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v100, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v100, (uint64_t)"injectAssistancePosition_block_invoke");
    v12 = v101;
    if (v101 == v100)
    {
      v13 = 4;
      v12 = v100;
    }
    else
    {
      if (!v101)
      {
LABEL_30:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v18 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 69, "injectAssistancePosition_block_invoke", 1302);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v19 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 68, "injectAssistancePosition_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v13 = 5;
    }
    (*(void (**)(void))(*v12 + 8 * v13))();
    goto LABEL_30;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v4 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v5 = 84;
    if (!*(_BYTE *)(a1 + 152))
      v5 = 70;
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Lat,%f,Long,%f,Alt,%f,AltValid,%c,VUncert,%f,SemiMajHUnc,%f,SemiMinHUnc,%f,SemiMajAzmHUnc,%f,MachContTimeNs,%llu,Rel,%d,PosType,%u,mHash,%llu\n", v4, "ADP", 73, "injectAssistancePosition_block_invoke", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v5, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_DWORD *)(a1 + 144), *(_DWORD *)(a1 + 148),
      *(_QWORD *)(a1 + 136));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v6 = *(double *)(a1 + 72);
  if (v6 > 90.0 || v6 < -90.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v98, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v98, (uint64_t)"injectAssistancePosition_block_invoke");
    v14 = v99;
    if (v99 == v98)
    {
      v15 = 4;
      v14 = v98;
    }
    else
    {
      if (!v99)
      {
LABEL_35:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v20 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Lat,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 72));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v21 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 68, "injectAssistancePosition_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_35;
  }
  v7 = *(double *)(a1 + 80);
  if (v7 > 180.0 || v7 < -180.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v96, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v96, (uint64_t)"injectAssistancePosition_block_invoke");
    v16 = v97;
    if (v97 == v96)
    {
      v17 = 4;
      v16 = v96;
    }
    else
    {
      if (!v97)
      {
LABEL_40:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v22 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Long,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 80));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v23 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "ADP", 68, "injectAssistancePosition_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v17 = 5;
    }
    (*(void (**)(void))(*v16 + 8 * v17))();
    goto LABEL_40;
  }
  v8 = *(_BYTE *)(a1 + 152);
  if (v8)
  {
    v9 = *(double *)(a1 + 88);
    if (v9 > 100000.0 || v9 < -100000.0)
    {
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v94, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v94, (uint64_t)"injectAssistancePosition_block_invoke");
      v27 = v95;
      if (v95 == v94)
      {
        v28 = 4;
        v27 = v94;
      }
      else
      {
        if (!v95)
        {
LABEL_61:
          if (g_LbsOsaTrace_Config)
          {
            bzero(__str, 0x3C6uLL);
            v34 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Height,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v34), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 88));
            gnssOsa_PrintLog(__str, 1, 1, 0);
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              v35 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v35), "ADP", 68, "injectAssistancePosition_block_invoke");
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
          }
          return;
        }
        v28 = 5;
      }
      (*(void (**)(void))(*v27 + 8 * v28))();
      goto LABEL_61;
    }
  }
  if (*(double *)(a1 + 96) < 0.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v92, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v92, (uint64_t)"injectAssistancePosition_block_invoke");
    v10 = v93;
    if (v93 == v92)
    {
      v11 = 4;
      v10 = v92;
    }
    else
    {
      if (!v93)
        goto LABEL_56;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_56:
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v32 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx VUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v32), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 96));
      gnssOsa_PrintLog(__str, 1, 1, 0);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        v33 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v33), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
    }
    return;
  }
  v24 = *(double *)(a1 + 104);
  if (v24 < 0.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v90, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v90, (uint64_t)"injectAssistancePosition_block_invoke");
    v25 = v91;
    if (v91 == v90)
    {
      v26 = 4;
      v25 = v90;
    }
    else
    {
      if (!v91)
      {
LABEL_77:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v40 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SemiMajHUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v40), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 104));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v41 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v41), "ADP", 68, "injectAssistancePosition_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v26 = 5;
    }
    (*(void (**)(void))(*v25 + 8 * v26))();
    goto LABEL_77;
  }
  v29 = *(double *)(a1 + 112);
  if (v29 < 0.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v88, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v88, (uint64_t)"injectAssistancePosition_block_invoke");
    v30 = v89;
    if (v89 == v88)
    {
      v31 = 4;
      v30 = v88;
    }
    else
    {
      if (!v89)
      {
LABEL_85:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v44 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SemiMinHUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v44), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 112));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v45 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v45), "ADP", 68, "injectAssistancePosition_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v31 = 5;
    }
    (*(void (**)(void))(*v30 + 8 * v31))();
    goto LABEL_85;
  }
  v36 = *(double *)(a1 + 120);
  if (v36 < 0.0 || v36 > 360.0)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v86, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v86, (uint64_t)"injectAssistancePosition_block_invoke");
    v42 = v87;
    if (v87 == v86)
    {
      v43 = 4;
      v42 = v86;
    }
    else
    {
      if (!v87)
      {
LABEL_93:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v46 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SemiMajAzmHUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v46), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(double *)(a1 + 120));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v47 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v47), "ADP", 68, "injectAssistancePosition_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v43 = 5;
    }
    (*(void (**)(void))(*v42 + 8 * v43))();
    goto LABEL_93;
  }
  v74 = *(double *)(a1 + 96);
  v75 = 0x500000000;
  v76 = 0;
  if (fabs(v7 + 180.0) < 2.22044605e-16)
    v7 = v7 + 360.0;
  *((double *)&v67 + 1) = v6;
  v68 = v7;
  v37 = *(double *)(a1 + 88);
  v72 = v8;
  v73 = v37;
  v69 = v24;
  v70 = v29;
  v38 = v36 + -360.0;
  if (v36 <= 180.0)
    v38 = v36;
  v71 = (int)v38;
  LODWORD(v67) = (*(_QWORD *)(a1 + 128) + 500000) / 0xF4240uLL;
  v39 = *(_DWORD *)(a1 + 144);
  if (v39 <= 24)
  {
    if (v39)
    {
      if (v39 != 10)
        goto LABEL_105;
      v39 = 1;
    }
  }
  else
  {
    switch(v39)
    {
      case 25:
        v39 = 2;
        break;
      case 50:
        v39 = 3;
        break;
      case 75:
        v39 = 4;
        break;
      default:
LABEL_105:
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v84, a1 + 40);
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v84, (uint64_t)"injectAssistancePosition_block_invoke");
        v54 = v85;
        if (v85 == v84)
        {
          v55 = 4;
          v54 = v84;
        }
        else
        {
          if (!v85)
          {
LABEL_131:
            if (g_LbsOsaTrace_Config)
            {
              bzero(__str, 0x3C6uLL);
              v65 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Rel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v65), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(_DWORD *)(a1 + 144));
              gnssOsa_PrintLog(__str, 1, 1, 0);
              if (g_LbsOsaTrace_Config >= 5)
              {
                bzero(__str, 0x3C6uLL);
                v66 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v66), "ADP", 68, "injectAssistancePosition_block_invoke");
                gnssOsa_PrintLog(__str, 5, 1, 0);
              }
            }
            return;
          }
          v55 = 5;
        }
        (*(void (**)(void))(*v54 + 8 * v55))();
        goto LABEL_131;
    }
  }
  LODWORD(v75) = v39;
  if (*(_DWORD *)(a1 + 148) >= 3u)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v82, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v82, (uint64_t)"injectAssistancePosition_block_invoke");
    v52 = v83;
    if (v83 == v82)
    {
      v53 = 4;
      v52 = v82;
    }
    else
    {
      if (!v83)
      {
LABEL_121:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v62 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx PosType,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v62), "ADP", 69, "injectAssistancePosition_block_invoke", 514, *(_DWORD *)(a1 + 148));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v63 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v63), "ADP", 68, "injectAssistancePosition_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v53 = 5;
    }
    (*(void (**)(void))(*v52 + 8 * v53))();
    goto LABEL_121;
  }
  v77 = *(_DWORD *)(a1 + 148);
  v76 = *(_QWORD *)(a1 + 136);
  v48 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
  v49 = a1 + 40;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v80, v49);
  gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v48, (uint64_t)v80);
  v50 = v81;
  if (v81 == v80)
  {
    v51 = 4;
    v50 = v80;
  }
  else
  {
    if (!v81)
      goto LABEL_110;
    v51 = 5;
  }
  (*(void (**)(void))(*v50 + 8 * v51))();
LABEL_110:
  v56 = GNS_EaWgs84RefPos(v48, &v67);
  if (v56 != 1)
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v78, v49);
    gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v56, (uint64_t)v78, "injectAssistancePosition_block_invoke");
    v60 = v79;
    if (v79 == v78)
    {
      v61 = 4;
      v60 = v78;
    }
    else
    {
      if (!v79)
      {
LABEL_126:
        gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v48);
        if (!g_LbsOsaTrace_Config)
          return;
        bzero(__str, 0x3C6uLL);
        v64 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaWgs84RefPos,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v64), "ADP", 69, "injectAssistancePosition_block_invoke", 257, v56);
        gnssOsa_PrintLog(__str, 1, 1, 0);
        if (g_LbsOsaTrace_Config < 5)
          return;
LABEL_115:
        bzero(__str, 0x3C6uLL);
        v59 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v59), "ADP", 68, "injectAssistancePosition_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
        return;
      }
      v61 = 5;
    }
    (*(void (**)(void))(*v60 + 8 * v61))();
    goto LABEL_126;
  }
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v57 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
    v58 = 84;
    if (!v72)
      v58 = 70;
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Lat,%f,Long,%f,Ht,%f,HtPresent,%c,RmsHeight,%f,RmsSemiMaj,%f,RmsSemiMin,%f,RmsSemiMajBrg,%hd,SrcHash,%llu\n", v57, "ADP", 68, "injectAssistancePosition_block_invoke", *((double *)&v67 + 1), v68, v73, v58, v74, v69, v70, v71, v76);
    gnssOsa_PrintLog(__str, 5, 1, 0);
    if (g_LbsOsaTrace_Config >= 5)
      goto LABEL_115;
  }
}

void sub_24BBD6404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  uint64_t v52;
  _QWORD *v54;
  uint64_t v55;

  v54 = (_QWORD *)a52;
  if (a52 == v52)
  {
    v55 = 4;
    v54 = &a49;
  }
  else
  {
    if (!a52)
      goto LABEL_6;
    v55 = 5;
  }
  (*(void (**)(void))(*v54 + 8 * v55))();
LABEL_6:
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::injectAssistanceTime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char __str[966];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a5 + 24))
  {
    v8 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice20injectAssistanceTimeEyyyNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_23;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v13, a5);
    v15 = a2;
    v16 = a3;
    v17 = a4;
    dispatch_async(v8, block);
    v9 = v14;
    if (v14 == v13)
    {
      v10 = 4;
      v9 = v13;
    }
    else
    {
      if (!v14)
        return;
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v11 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "injectAssistanceTime", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice20injectAssistanceTimeEyyyNSt3__18functionIFvNS_6ResultEEEE_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  int v26;
  int v27;
  _BYTE v28[24];
  _BYTE *v29;
  _BYTE v30[24];
  _BYTE *v31;
  _BYTE v32[24];
  _BYTE *v33;
  _BYTE v34[24];
  _BYTE *v35;
  char __str[966];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "injectAssistanceTime_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*(_BYTE *)(v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: GpsTimeNS,%llu,UncNS,%llu,MachContTimeNs,%llu\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "injectAssistanceTime_block_invoke", a1[9], a1[10], a1[11]);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v5 = a1[10];
    if (v5)
    {
      DWORD2(v25) = 0x7FFFFFFF;
      v26 = -1;
      v6 = a1[9];
      WORD6(v25) = v6 / 0x2260FF9290000;
      if (v6 % 0x2260FF9290000 >= 0xF424000000000)
      {
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v30, (uint64_t)(a1 + 5));
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 4, (uint64_t)v30, (uint64_t)"injectAssistanceTime_block_invoke");
        v7 = v31;
        if (v31 == v30)
        {
          v8 = 4;
          v7 = v30;
        }
        else
        {
          if (!v31)
            goto LABEL_35;
          v8 = 5;
        }
        (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_35:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v19 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Calc GpsTow invalid\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 69, "injectAssistanceTime_block_invoke", 515);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v20 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 68, "injectAssistanceTime_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      LODWORD(v25) = v6 % 0x2260FF9290000 / 0xF4240;
      if (v5 < 0xF42400000)
      {
        if (v5 >= 0xF4240)
        {
          WORD2(v25) = v5 / 0xF4240;
        }
        else
        {
          WORD2(v25) = 1;
          if (g_LbsOsaTrace_Config >= 4)
          {
            bzero(__str, 0x3C6uLL);
            v16 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RefTimeUncMs < 1ms\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 73, "injectAssistanceTime_block_invoke");
            gnssOsa_PrintLog(__str, 4, 1, 0);
          }
        }
      }
      else
      {
        WORD2(v25) = -1;
        if (g_LbsOsaTrace_Config >= 4)
        {
          bzero(__str, 0x3C6uLL);
          v13 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: RefTimeUncMs > 65535ms\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 73, "injectAssistanceTime_block_invoke");
          gnssOsa_PrintLog(__str, 4, 1, 0);
        }
      }
      v27 = (a1[11] + 500000) / 0xF4240uLL;
      GNS_AsstGpsRefTime(0, 5, &v25);
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        v21 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Wk,%u,Tow,%u,TowUnc,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 68, "injectAssistanceTime_block_invoke", WORD6(v25), (_DWORD)v25, WORD2(v25));
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v28, (uint64_t)(a1 + 5));
      gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse(v2, 1u, (uint64_t)v28, "injectAssistanceTime_block_invoke");
      v22 = v29;
      if (v29 == v28)
      {
        v23 = 4;
        v22 = v28;
      }
      else
      {
        if (!v29)
          goto LABEL_46;
        v23 = 5;
      }
      (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_46:
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        v24 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 68, "injectAssistanceTime_block_invoke");
        gnssOsa_PrintLog(__str, 5, 1, 0);
      }
      return;
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v32, (uint64_t)(a1 + 5));
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 4, (uint64_t)v32, (uint64_t)"injectAssistanceTime_block_invoke");
    v11 = v33;
    if (v33 == v32)
    {
      v12 = 4;
      v11 = v32;
    }
    else
    {
      if (!v33)
      {
LABEL_30:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v17 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RefTimeUnc\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 69, "injectAssistanceTime_block_invoke", 515);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v18 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 68, "injectAssistanceTime_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
    goto LABEL_30;
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v34, (uint64_t)(a1 + 5));
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 7, (uint64_t)v34, (uint64_t)"injectAssistanceTime_block_invoke");
  v9 = v35;
  if (v35 == v34)
  {
    v10 = 4;
    v9 = v34;
    goto LABEL_21;
  }
  if (v35)
  {
    v10 = 5;
LABEL_21:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v14 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 69, "injectAssistanceTime_block_invoke", 1302);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      v15 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 68, "injectAssistanceTime_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
  }
}

void sub_24BBD6EF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char *a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  char *v34;
  char *v36;
  uint64_t v37;

  v36 = a22;
  if (a22 == v34)
  {
    v37 = 4;
    v36 = &a19;
  }
  else
  {
    if (!a22)
      goto LABEL_6;
    v37 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v36 + 8 * v37))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void gnss::GnssAdaptDevice::setAssistanceAlongTrackVelocity(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;
  double v16;
  double v17;
  char __str[966];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a3 + 24))
  {
    v8 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice31setAssistanceAlongTrackVelocityEyddNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_28_1;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v13, a3);
    v15 = a2;
    v16 = a4;
    v17 = a5;
    dispatch_async(v8, block);
    v9 = v14;
    if (v14 == v13)
    {
      v10 = 4;
      v9 = v13;
    }
    else
    {
      if (!v14)
        return;
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v11 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "setAssistanceAlongTrackVelocity", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice31setAssistanceAlongTrackVelocityEyddNSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  double v27;
  _BYTE v28[24];
  _BYTE *v29;
  _BYTE v30[24];
  _BYTE *v31;
  _BYTE v32[24];
  _BYTE *v33;
  _BYTE v34[24];
  _BYTE *v35;
  char __str[966];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (!*((_BYTE *)v2 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v34, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v34, (uint64_t)"setAssistanceAlongTrackVelocity_block_invoke");
    v15 = v35;
    if (v35 == v34)
    {
      v16 = 4;
      v15 = v34;
    }
    else
    {
      if (!v35)
      {
LABEL_27:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v19 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 69, "setAssistanceAlongTrackVelocity_block_invoke", 1302);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v20 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v16 = 5;
    }
    (*(void (**)(void))(*v15 + 8 * v16))();
    goto LABEL_27;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,VAlongTrack,%f,VAlongTrackUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceAlongTrackVelocity_block_invoke", *(_QWORD *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v5 = *(double *)(a1 + 80);
  if (v5 > 100.0 || v5 < 0.0 || (v6 = *(double *)(a1 + 88), v6 <= 0.0))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v32, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v32, (uint64_t)"setAssistanceAlongTrackVelocity_block_invoke");
    v13 = v33;
    if (v33 == v32)
    {
      v14 = 4;
      v13 = v32;
    }
    else
    {
      if (!v33)
      {
LABEL_22:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v17 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx VAlongTrack,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 69, "setAssistanceAlongTrackVelocity_block_invoke", 514, *(double *)(a1 + 80));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v18 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v14 = 5;
    }
    (*(void (**)(void))(*v13 + 8 * v14))();
    goto LABEL_22;
  }
  v7 = (*(_QWORD *)(a1 + 72) + 500000) / 0xF4240uLL;
  LODWORD(v26) = v7;
  *((double *)&v26 + 1) = v5;
  v27 = v6;
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v8 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,Vel,%f,RmsVel,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v8), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke", v7, v5, v6);
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  v9 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
  v10 = a1 + 40;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v30, v10);
  gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v9, (uint64_t)v30);
  v11 = v31;
  if (v31 == v30)
  {
    v12 = 4;
    v11 = v30;
  }
  else
  {
    if (!v31)
      goto LABEL_32;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_32:
  v21 = GNS_EaAlongTrackVel(v9, &v26);
  if (v21 == 1)
  {
    if (g_LbsOsaTrace_Config < 5)
      return;
    goto LABEL_42;
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v28, v10);
  gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v21, (uint64_t)v28, "setAssistanceAlongTrackVelocity_block_invoke");
  v22 = v29;
  if (v29 == v28)
  {
    v23 = 4;
    v22 = v28;
    goto LABEL_39;
  }
  if (v29)
  {
    v23 = 5;
LABEL_39:
    (*(void (**)(void))(*v22 + 8 * v23))();
  }
  gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v9);
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v24 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx LongTrackVel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 69, "setAssistanceAlongTrackVelocity_block_invoke", 257, v21);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    if (g_LbsOsaTrace_Config >= 5)
    {
LABEL_42:
      bzero(__str, 0x3C6uLL);
      v25 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 68, "setAssistanceAlongTrackVelocity_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
  }
}

void sub_24BBD77C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,char *a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  char *v34;
  char *v36;
  uint64_t v37;

  v36 = a22;
  if (a22 == v34)
  {
    v37 = 4;
    v36 = &a19;
  }
  else
  {
    if (!a22)
      goto LABEL_6;
    v37 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v36 + 8 * v37))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void gnss::GnssAdaptDevice::setAssistanceDem(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  _BYTE v13[24];
  _BYTE *v14;
  uint64_t v15;
  double v16;
  double v17;
  char __str[966];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a3 + 24))
  {
    v8 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice16setAssistanceDemEyddNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_34;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v13, a3);
    v15 = a2;
    v16 = a4;
    v17 = a5;
    dispatch_async(v8, block);
    v9 = v14;
    if (v14 == v13)
    {
      v10 = 4;
      v9 = v13;
    }
    else
    {
      if (!v14)
        return;
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v11 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "setAssistanceDem", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice16setAssistanceDemEyddNSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  int v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  double v30;
  int v31;
  _BYTE v32[24];
  _BYTE *v33;
  _BYTE v34[24];
  _BYTE *v35;
  _BYTE v36[24];
  _BYTE *v37;
  _BYTE v38[24];
  _BYTE *v39;
  _BYTE v40[24];
  _BYTE *v41;
  char __str[966];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceDem_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*((_BYTE *)v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,EllipAlt,%f,AltUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceDem_block_invoke", *(_QWORD *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v5 = *(double *)(a1 + 80);
    if (v5 <= 9000.0 && v5 >= -500.0)
    {
      v6 = *(double *)(a1 + 88);
      if (v6 > 0.0 && v6 <= 9000.0)
      {
        v31 = 0;
        LODWORD(v29) = (*(_QWORD *)(a1 + 72) + 500000) / 0xF4240uLL;
        *((double *)&v29 + 1) = v5;
        v30 = v6;
        v7 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
        v8 = a1 + 40;
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v34, a1 + 40);
        gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v7, (uint64_t)v34);
        v9 = v35;
        if (v35 == v34)
        {
          v10 = 4;
          v9 = v34;
        }
        else
        {
          if (!v35)
            goto LABEL_34;
          v10 = 5;
        }
        (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_34:
        v21 = GNS_EaAltitude(v7, &v29);
        if (v21 == 1)
        {
LABEL_47:
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v27 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,Alt,%f,RmsAlt,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "ADP", 68, "setAssistanceDem_block_invoke", (_DWORD)v29, *((double *)&v29 + 1), v30);
            gnssOsa_PrintLog(__str, 5, 1, 0);
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              v28 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v28), "ADP", 68, "setAssistanceDem_block_invoke");
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
          }
          return;
        }
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v32, v8);
        gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v21, (uint64_t)v32, "setAssistanceDem_block_invoke");
        v22 = v33;
        if (v33 == v32)
        {
          v23 = 4;
          v22 = v32;
        }
        else
        {
          if (!v33)
          {
LABEL_45:
            gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v7);
            if (!g_LbsOsaTrace_Config)
              return;
            bzero(__str, 0x3C6uLL);
            v26 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaAltitude,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v26), "ADP", 69, "setAssistanceDem_block_invoke", 257, v21);
            gnssOsa_PrintLog(__str, 1, 1, 0);
            goto LABEL_47;
          }
          v23 = 5;
        }
        (*(void (**)(void))(*v22 + 8 * v23))();
        goto LABEL_45;
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v36, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v36, (uint64_t)"setAssistanceDem_block_invoke");
      v15 = v37;
      if (v37 == v36)
      {
        v16 = 4;
        v15 = v36;
      }
      else
      {
        if (!v37)
        {
LABEL_40:
          if (g_LbsOsaTrace_Config)
          {
            bzero(__str, 0x3C6uLL);
            v24 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx AltUnc,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 69, "setAssistanceDem_block_invoke", 514, *(double *)(a1 + 88));
            gnssOsa_PrintLog(__str, 1, 1, 0);
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              v25 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 68, "setAssistanceDem_block_invoke");
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
          }
          return;
        }
        v16 = 5;
      }
      (*(void (**)(void))(*v15 + 8 * v16))();
      goto LABEL_40;
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v38, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v38, (uint64_t)"setAssistanceDem_block_invoke");
    v13 = v39;
    if (v39 == v38)
    {
      v14 = 4;
      v13 = v38;
    }
    else
    {
      if (!v39)
      {
LABEL_29:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v19 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EllipAlt,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v19), "ADP", 69, "setAssistanceDem_block_invoke", 514, *(double *)(a1 + 80));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v20 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 68, "setAssistanceDem_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v14 = 5;
    }
    (*(void (**)(void))(*v13 + 8 * v14))();
    goto LABEL_29;
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v40, a1 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v40, (uint64_t)"setAssistanceDem_block_invoke");
  v11 = v41;
  if (v41 == v40)
  {
    v12 = 4;
    v11 = v40;
    goto LABEL_23;
  }
  if (v41)
  {
    v12 = 5;
LABEL_23:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v17 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 69, "setAssistanceDem_block_invoke", 1302);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      v18 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 68, "setAssistanceDem_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
  }
}

void sub_24BBD8170(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char *a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  char *v40;
  char *v42;
  uint64_t v43;

  v42 = a24;
  if (a24 == v40)
  {
    v43 = 4;
    v42 = &a21;
  }
  else
  {
    if (!a24)
      goto LABEL_6;
    v43 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v42 + 8 * v43))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void gnss::GnssAdaptDevice::setAssistanceMapVector(uint64_t a1, uint64_t a2, char a3, char a4, char a5, char a6, char a7, char a8, double a9, double a10, double a11, double a12, double a13, double a14, uint64_t a15)
{
  NSObject *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD block[5];
  _BYTE v33[24];
  _BYTE *v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char __str[966];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a15 + 24))
  {
    v28 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice22setAssistanceMapVectorEyddbddddbbbbbNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_42;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v33, a15);
    v35 = a2;
    v36 = a9;
    v37 = a10;
    v42 = a3;
    v38 = a11;
    v39 = a12;
    v40 = a13;
    v41 = a14;
    v43 = a4;
    v44 = a5;
    v45 = a6;
    v46 = a7;
    v47 = a8;
    dispatch_async(v28, block);
    v29 = v34;
    if (v34 == v33)
    {
      v30 = 4;
      v29 = v33;
    }
    else
    {
      if (!v34)
        return;
      v30 = 5;
    }
    (*(void (**)(void))(*v29 + 8 * v30))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v31 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v31), "ADP", 69, "setAssistanceMapVector", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice22setAssistanceMapVectorEyddbddddbbbbbNSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  int v13;
  double v14;
  double v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  double v43;
  double v44;
  int16x8_t v45;
  int v46;
  int v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  unsigned int v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[24];
  _BYTE *v63;
  _BYTE v64[24];
  _BYTE *v65;
  int v66;
  double v67;
  double v68;
  double v69;
  char v70;
  double v71;
  double v72;
  double v73;
  unsigned __int32 v74;
  char v75;
  _BYTE v76[24];
  _BYTE *v77;
  _BYTE v78[24];
  _BYTE *v79;
  _BYTE v80[24];
  _BYTE *v81;
  _BYTE v82[24];
  _BYTE *v83;
  _BYTE v84[24];
  _BYTE *v85;
  _BYTE v86[24];
  _BYTE *v87;
  _BYTE v88[24];
  _BYTE *v89;
  char __str[966];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceMapVector_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*((_BYTE *)v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v4 = (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time());
      if (*(_BYTE *)(a1 + 133))
        v5 = 84;
      else
        v5 = 70;
      if (*(_BYTE *)(a1 + 132))
        v6 = 84;
      else
        v6 = 70;
      if (*(_BYTE *)(a1 + 131))
        v7 = 84;
      else
        v7 = 70;
      if (*(_BYTE *)(a1 + 130))
        v8 = 84;
      else
        v8 = 70;
      if (*(_BYTE *)(a1 + 129))
        v9 = 84;
      else
        v9 = 70;
      if (*(_BYTE *)(a1 + 128))
        v10 = 84;
      else
        v10 = 70;
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,SegStartLat,%f,SegStartLong,%f,AltValid,%c,SegStartAltWgs84,%f,SegLenM,%f,SegDirDeg,%f,SegWidM,%f,Freeway,%c,Railway,%c,OneWayRoad,%c,Tunnel,%c,Bridge,%c\n", v4, "ADP", 73, "setAssistanceMapVector_block_invoke", *(_QWORD *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v10, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), v9, v8, v7,
        v6,
        v5);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v11 = *(double *)(a1 + 80);
    if (v11 <= 90.0 && v11 >= -90.0)
    {
      v12 = *(double *)(a1 + 88);
      if (v12 <= 180.0 && v12 >= -180.0)
      {
        v13 = *(unsigned __int8 *)(a1 + 128);
        if (!*(_BYTE *)(a1 + 128) || (v14 = *(double *)(a1 + 96), v14 <= 100000.0) && v14 >= -100000.0)
        {
          v15 = *(double *)(a1 + 104);
          if (v15 > 100000.0)
          {
            std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v80, a1 + 40);
            gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v80, (uint64_t)"setAssistanceMapVector_block_invoke");
            v16 = v81;
            if (v81 == v80)
            {
              v17 = 4;
              v16 = v80;
            }
            else
            {
              if (!v81)
                goto LABEL_73;
              v17 = 5;
            }
            (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_73:
            if (g_LbsOsaTrace_Config)
            {
              bzero(__str, 0x3C6uLL);
              v38 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Len,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v38), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 104));
              gnssOsa_PrintLog(__str, 1, 1, 0);
              if (g_LbsOsaTrace_Config >= 5)
              {
                bzero(__str, 0x3C6uLL);
                v39 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v39), "ADP", 68, "setAssistanceMapVector_block_invoke");
                gnssOsa_PrintLog(__str, 5, 1, 0);
              }
            }
            return;
          }
          v30 = *(double *)(a1 + 112);
          if (v30 >= 0.0 && v30 <= 360.0)
          {
            v31 = *(double *)(a1 + 120);
            if (v31 > 100000.0)
            {
              std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v76, a1 + 40);
              gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v76, (uint64_t)"setAssistanceMapVector_block_invoke");
              v32 = v77;
              if (v77 == v76)
              {
                v33 = 4;
                v32 = v76;
              }
              else
              {
                if (!v77)
                {
LABEL_94:
                  if (g_LbsOsaTrace_Config)
                  {
                    bzero(__str, 0x3C6uLL);
                    v53 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Width,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v53), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 120));
                    gnssOsa_PrintLog(__str, 1, 1, 0);
                    if (g_LbsOsaTrace_Config >= 5)
                    {
                      bzero(__str, 0x3C6uLL);
                      v54 = mach_continuous_time();
                      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v54), "ADP", 68, "setAssistanceMapVector_block_invoke");
                      gnssOsa_PrintLog(__str, 5, 1, 0);
                    }
                  }
                  return;
                }
                v33 = 5;
              }
              (*(void (**)(void))(*v32 + 8 * v33))();
              goto LABEL_94;
            }
            v42 = (*(_QWORD *)(a1 + 72) + 500000) / 0xF4240uLL;
            v66 = v42;
            if (fabs(v12 + 180.0) >= 2.22044605e-16)
              v43 = v12;
            else
              v43 = v12 + 360.0;
            v67 = v11;
            v68 = v43;
            v44 = *(double *)(a1 + 96);
            v69 = v44;
            v70 = v13;
            v71 = v30;
            v72 = v15;
            v73 = v31;
            LODWORD(v12) = *(_DWORD *)(a1 + 129);
            v45 = (int16x8_t)vmovl_u8(*(uint8x8_t *)&v12);
            *(int8x8_t *)v45.i8 = vext_s8(*(int8x8_t *)v45.i8, *(int8x8_t *)v45.i8, 6uLL);
            v74 = vmovn_s16(v45).u32[0];
            v46 = *(unsigned __int8 *)(a1 + 133);
            v75 = *(_BYTE *)(a1 + 133);
            v47 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
            v48 = a1 + 40;
            std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v64, v48);
            gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v47, (uint64_t)v64);
            v49 = v65;
            if (v65 == v64)
            {
              v50 = 4;
              v49 = v64;
            }
            else
            {
              if (!v65)
                goto LABEL_99;
              v50 = 5;
            }
            (*(void (**)(void))(*v49 + 8 * v50))();
LABEL_99:
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              v55 = *(double *)&g_MacClockTicksToMsRelation * (double)mach_continuous_time();
              v56 = 84;
              if (!v13)
                v56 = 70;
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,StartLat,%f,StartLong,%f,StartAlt,%f,HtAvail,%c,Dir,%f,Len,%f,Width,%f,Bridge,%d\n", (unint64_t)v55, "ADP", 68, "setAssistanceMapVector_block_invoke", v42, v11, v43, v44, v56, v30, v15, v31, v46);
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
            v57 = GNS_EaMapVectorSeg(v47, (uint64_t)&v66);
            if (v57 == 1)
            {
LABEL_111:
              if (g_LbsOsaTrace_Config >= 5)
              {
                bzero(__str, 0x3C6uLL);
                v61 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v61), "ADP", 68, "setAssistanceMapVector_block_invoke");
                gnssOsa_PrintLog(__str, 5, 1, 0);
              }
              return;
            }
            std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v62, v48);
            gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v57, (uint64_t)v62, "setAssistanceMapVector_block_invoke");
            v58 = v63;
            if (v63 == v62)
            {
              v59 = 4;
              v58 = v62;
            }
            else
            {
              if (!v63)
              {
LABEL_109:
                gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v47);
                if (!g_LbsOsaTrace_Config)
                  return;
                bzero(__str, 0x3C6uLL);
                v60 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaMapVectorSeg,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v60), "ADP", 69, "setAssistanceMapVector_block_invoke", 257, v57);
                gnssOsa_PrintLog(__str, 1, 1, 0);
                goto LABEL_111;
              }
              v59 = 5;
            }
            (*(void (**)(void))(*v58 + 8 * v59))();
            goto LABEL_109;
          }
          std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v78, a1 + 40);
          gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v78, (uint64_t)"setAssistanceMapVector_block_invoke");
          v36 = v79;
          if (v79 == v78)
          {
            v37 = 4;
            v36 = v78;
          }
          else
          {
            if (!v79)
            {
LABEL_89:
              if (g_LbsOsaTrace_Config)
              {
                bzero(__str, 0x3C6uLL);
                v51 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Dir,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v51), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 112));
                gnssOsa_PrintLog(__str, 1, 1, 0);
                if (g_LbsOsaTrace_Config >= 5)
                {
                  bzero(__str, 0x3C6uLL);
                  v52 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v52), "ADP", 68, "setAssistanceMapVector_block_invoke");
                  gnssOsa_PrintLog(__str, 5, 1, 0);
                }
              }
              return;
            }
            v37 = 5;
          }
          (*(void (**)(void))(*v36 + 8 * v37))();
          goto LABEL_89;
        }
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v82, a1 + 40);
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v82, (uint64_t)"setAssistanceMapVector_block_invoke");
        v34 = v83;
        if (v83 == v82)
        {
          v35 = 4;
          v34 = v82;
        }
        else
        {
          if (!v83)
          {
LABEL_78:
            if (g_LbsOsaTrace_Config)
            {
              bzero(__str, 0x3C6uLL);
              v40 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Alt,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v40), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 96));
              gnssOsa_PrintLog(__str, 1, 1, 0);
              if (g_LbsOsaTrace_Config >= 5)
              {
                bzero(__str, 0x3C6uLL);
                v41 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v41), "ADP", 68, "setAssistanceMapVector_block_invoke");
                gnssOsa_PrintLog(__str, 5, 1, 0);
              }
            }
            return;
          }
          v35 = 5;
        }
        (*(void (**)(void))(*v34 + 8 * v35))();
        goto LABEL_78;
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v84, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v84, (uint64_t)"setAssistanceMapVector_block_invoke");
      v22 = v85;
      if (v85 == v84)
      {
        v23 = 4;
        v22 = v84;
      }
      else
      {
        if (!v85)
        {
LABEL_56:
          if (g_LbsOsaTrace_Config)
          {
            bzero(__str, 0x3C6uLL);
            v28 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Long,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v28), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 88));
            gnssOsa_PrintLog(__str, 1, 1, 0);
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              v29 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 68, "setAssistanceMapVector_block_invoke");
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
          }
          return;
        }
        v23 = 5;
      }
      (*(void (**)(void))(*v22 + 8 * v23))();
      goto LABEL_56;
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v86, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v86, (uint64_t)"setAssistanceMapVector_block_invoke");
    v20 = v87;
    if (v87 == v86)
    {
      v21 = 4;
      v20 = v86;
    }
    else
    {
      if (!v87)
      {
LABEL_51:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v26 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Lat,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v26), "ADP", 69, "setAssistanceMapVector_block_invoke", 514, *(double *)(a1 + 80));
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v27 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v27), "ADP", 68, "setAssistanceMapVector_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v21 = 5;
    }
    (*(void (**)(void))(*v20 + 8 * v21))();
    goto LABEL_51;
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v88, a1 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v88, (uint64_t)"setAssistanceMapVector_block_invoke");
  v18 = v89;
  if (v89 == v88)
  {
    v19 = 4;
    v18 = v88;
    goto LABEL_45;
  }
  if (v89)
  {
    v19 = 5;
LABEL_45:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v24 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 69, "setAssistanceMapVector_block_invoke", 1302);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      v25 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 68, "setAssistanceMapVector_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
  }
}

void sub_24BBD91F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v29;
  _QWORD *v31;
  uint64_t v32;

  v31 = (_QWORD *)a29;
  if (a29 == v29)
  {
    v32 = 4;
    v31 = &a26;
  }
  else
  {
    if (!a29)
      goto LABEL_6;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_6:
  _Unwind_Resume(a1);
}

void gnss::GnssAdaptDevice::setAssistanceMotionActivityContext(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6)
{
  NSObject *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[5];
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  char __str[966];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a6 + 24))
  {
    v10 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice34setAssistanceMotionActivityContextEyNS_21MotionActivityContextENS_11MovingStateENS_11ReliabilityENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_49;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v15, a6);
    v17 = a2;
    v18 = a3;
    v19 = a4;
    v20 = a5;
    dispatch_async(v10, block);
    v11 = v16;
    if (v16 == v15)
    {
      v12 = 4;
      v11 = v15;
    }
    else
    {
      if (!v16)
        return;
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v13 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "setAssistanceMotionActivityContext", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice34setAssistanceMotionActivityContextEyNS_21MotionActivityContextENS_11MovingStateENS_11ReliabilityENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unsigned int v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  _BYTE v36[24];
  _BYTE *v37;
  _BYTE v38[24];
  _BYTE *v39;
  _BYTE v40[24];
  _BYTE *v41;
  _BYTE v42[24];
  _BYTE *v43;
  _BYTE v44[24];
  _BYTE *v45;
  _BYTE v46[24];
  _BYTE *v47;
  _BYTE v48[24];
  _BYTE *v49;
  char __str[966];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*((_BYTE *)v2 + 88))
  {
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v4 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,Ctxt,%u,MovState,%u,Rel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceMotionActivityContext_block_invoke", *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 84), *(_DWORD *)(a1 + 88));
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    v35 = 0;
    v34 = (*(_QWORD *)(a1 + 72) + 500000) / 0xF4240uLL;
    v32 = v34;
    v5 = *(int *)(a1 + 80);
    if (v5 >= 9)
    {
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        v9 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Context,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 515, *(_DWORD *)(a1 + 80));
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v46, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v46, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
      v10 = v47;
      if (v47 == v46)
      {
        v11 = 4;
        v10 = v46;
        goto LABEL_48;
      }
    }
    else
    {
      LODWORD(v35) = dword_24BC0D3D0[v5];
      v6 = *(_DWORD *)(a1 + 88);
      if (v6 <= 24)
      {
        if (!v6)
          goto LABEL_32;
        if (v6 == 10)
        {
LABEL_11:
          v6 = 1;
LABEL_32:
          HIDWORD(v35) = v6;
          v33 = v6;
          v15 = *(_DWORD *)(a1 + 84);
          if (v15 < 4)
          {
            HIDWORD(v32) = *(_DWORD *)(a1 + 84);
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              v16 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: ActCtx,%u,MovState,%u,Rel,%u,TimeMs,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke", v35, v15, HIDWORD(v35), v34);
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
            v17 = GNS_EaUsrActCtxt(++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key, (uint64_t *)&v34);
            if (v17 == 1)
            {
              v18 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
              v19 = a1 + 40;
              std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v38, a1 + 40);
              gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v18, (uint64_t)v38);
              v20 = v39;
              if (v39 == v38)
              {
                v21 = 4;
                v20 = v38;
              }
              else
              {
                if (!v39)
                  goto LABEL_52;
                v21 = 5;
              }
              (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_52:
              v25 = GNS_EaDevMovState(v18, &v32);
              if (v25 == 1)
              {
LABEL_65:
                if (g_LbsOsaTrace_Config >= 5)
                {
                  bzero(__str, 0x3C6uLL);
                  v31 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v31), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
                  gnssOsa_PrintLog(__str, 5, 1, 0);
                }
                return;
              }
              std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v36, v19);
              gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v25, (uint64_t)v36, "setAssistanceMotionActivityContext_block_invoke");
              v26 = v37;
              if (v37 == v36)
              {
                v27 = 4;
                v26 = v36;
              }
              else
              {
                if (!v37)
                {
LABEL_63:
                  gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v18);
                  if (!g_LbsOsaTrace_Config)
                    return;
                  bzero(__str, 0x3C6uLL);
                  v30 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaDevMovState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 257, v25);
                  gnssOsa_PrintLog(__str, 1, 1, 0);
                  goto LABEL_65;
                }
                v27 = 5;
              }
              (*(void (**)(void))(*v26 + 8 * v27))();
              goto LABEL_63;
            }
            std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v40, a1 + 40);
            gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v17, (uint64_t)v40, "setAssistanceMotionActivityContext_block_invoke");
            v23 = v41;
            if (v41 == v40)
            {
              v24 = 4;
              v23 = v40;
            }
            else
            {
              if (!v41)
              {
LABEL_58:
                if (g_LbsOsaTrace_Config)
                {
                  bzero(__str, 0x3C6uLL);
                  v28 = mach_continuous_time();
                  snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx EaUsrActCtxt,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v28), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 257, v17);
                  gnssOsa_PrintLog(__str, 1, 1, 0);
                  if (g_LbsOsaTrace_Config >= 5)
                  {
                    bzero(__str, 0x3C6uLL);
                    v29 = mach_continuous_time();
                    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v29), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
                    gnssOsa_PrintLog(__str, 5, 1, 0);
                  }
                }
                return;
              }
              v24 = 5;
            }
            (*(void (**)(void))(*v23 + 8 * v24))();
            goto LABEL_58;
          }
          if (g_LbsOsaTrace_Config)
          {
            bzero(__str, 0x3C6uLL);
            v22 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Moving State,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 515, *(_DWORD *)(a1 + 84));
            gnssOsa_PrintLog(__str, 1, 1, 0);
          }
          std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v42, a1 + 40);
          gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v42, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
          v10 = v43;
          if (v43 != v42)
            goto LABEL_42;
          v11 = 4;
          v10 = v42;
LABEL_48:
          (*(void (**)(void))(*(_QWORD *)v10 + 8 * v11))();
          return;
        }
      }
      else
      {
        switch(v6)
        {
          case 75:
            v6 = 3;
            goto LABEL_32;
          case 50:
            v6 = 2;
            goto LABEL_32;
          case 25:
            goto LABEL_11;
        }
      }
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        v14 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx Rel,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 515, *(_DWORD *)(a1 + 88));
        gnssOsa_PrintLog(__str, 1, 1, 0);
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v44, a1 + 40);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v44, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
      v10 = v45;
      if (v45 == v44)
      {
        v11 = 4;
        v10 = v44;
        goto LABEL_48;
      }
    }
LABEL_42:
    if (!v10)
      return;
    v11 = 5;
    goto LABEL_48;
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v48, a1 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v48, (uint64_t)"setAssistanceMotionActivityContext_block_invoke");
  v7 = v49;
  if (v49 == v48)
  {
    v8 = 4;
    v7 = v48;
    goto LABEL_20;
  }
  if (v49)
  {
    v8 = 5;
LABEL_20:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v12 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 69, "setAssistanceMotionActivityContext_block_invoke", 1302);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      v13 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 68, "setAssistanceMotionActivityContext_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
  }
}

void sub_24BBD9DC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char *a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  char *v48;
  char *v50;
  uint64_t v51;

  v50 = a24;
  if (a24 == v48)
  {
    v51 = 4;
    v50 = &a21;
  }
  else
  {
    if (!a24)
      goto LABEL_6;
    v51 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v50 + 8 * v51))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void gnss::GnssAdaptDevice::setAssistanceMountState(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[5];
  _BYTE v11[24];
  _BYTE *v12;
  uint64_t v13;
  int v14;
  char __str[966];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a4 + 24))
  {
    v6 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice23setAssistanceMountStateEyNS_16DeviceMountStateENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_54;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v11, a4);
    v13 = a2;
    v14 = a3;
    dispatch_async(v6, block);
    v7 = v12;
    if (v12 == v11)
    {
      v8 = 4;
      v7 = v11;
    }
    else
    {
      if (!v12)
        return;
      v8 = 5;
    }
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v9 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 69, "setAssistanceMountState", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice23setAssistanceMountStateEyNS_16DeviceMountStateENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _BYTE v27[24];
  _BYTE *v28;
  _BYTE v29[24];
  _BYTE *v30;
  _BYTE v31[24];
  _BYTE *v32;
  _BYTE v33[24];
  _BYTE *v34;
  char __str[966];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceMountState_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (!*((_BYTE *)v2 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v33, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v33, (uint64_t)"setAssistanceMountState_block_invoke");
    v12 = v34;
    if (v34 == v33)
    {
      v13 = 4;
      v12 = v33;
    }
    else
    {
      if (!v34)
      {
LABEL_20:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v17 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 69, "setAssistanceMountState_block_invoke", 1302);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v18 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 68, "setAssistanceMountState_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v13 = 5;
    }
    (*(void (**)(void))(*v12 + 8 * v13))();
    goto LABEL_20;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,MtState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceMountState_block_invoke", *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 80));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  LODWORD(v25) = (*(_QWORD *)(a1 + 72) + 500000) / 0xF4240uLL;
  v5 = *(int *)(a1 + 80);
  if (v5 < 3)
  {
    v6 = dword_24BC0D3F4[v5];
    v7 = dword_24BC0D400[v5];
    HIDWORD(v25) = v6;
    v26 = v7;
    v8 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
    v9 = a1 + 40;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v29, v9);
    gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v8, (uint64_t)v29);
    v10 = v30;
    if (v30 == v29)
    {
      v11 = 4;
      v10 = v29;
    }
    else
    {
      if (!v30)
        goto LABEL_25;
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_25:
    v19 = GNS_EaFixedInVehicle(v8, &v25);
    if (v19 == 1)
    {
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        v20 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,FivInd,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v20), "ADP", 68, "setAssistanceMountState_block_invoke", v25, HIDWORD(v25));
        gnssOsa_PrintLog(__str, 5, 1, 0);
        if (g_LbsOsaTrace_Config >= 5)
        {
LABEL_39:
          bzero(__str, 0x3C6uLL);
          v24 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v24), "ADP", 68, "setAssistanceMountState_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
          return;
        }
      }
      return;
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v27, v9);
    gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v19, (uint64_t)v27, "setAssistanceMountState_block_invoke");
    v21 = v28;
    if (v28 == v27)
    {
      v22 = 4;
      v21 = v27;
    }
    else
    {
      if (!v28)
      {
LABEL_37:
        gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v8);
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v23 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx FixedInVeh,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "ADP", 69, "setAssistanceMountState_block_invoke", 257, v19);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
            goto LABEL_39;
        }
        return;
      }
      v22 = 5;
    }
    (*(void (**)(void))(*v21 + 8 * v22))();
    goto LABEL_37;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v14 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx MountState,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 69, "setAssistanceMountState_block_invoke", 515, *(_DWORD *)(a1 + 80));
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v31, a1 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v31, (uint64_t)"setAssistanceMountState_block_invoke");
  v15 = v32;
  if (v32 == v31)
  {
    v16 = 4;
    v15 = v31;
  }
  else
  {
    if (!v32)
      return;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
}

void sub_24BBDA66C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, char *a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  char *v29;
  char *v31;
  uint64_t v32;

  v31 = a20;
  if (a20 == v29)
  {
    v32 = 4;
    v31 = &a17;
  }
  else
  {
    if (!a20)
      goto LABEL_6;
    v32 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v31 + 8 * v32))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void gnss::GnssAdaptDevice::setAssistanceSignalEnvironment(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[5];
  _BYTE v9[24];
  _BYTE *v10;
  int v11;
  char __str[966];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a3 + 24))
  {
    v4 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice30setAssistanceSignalEnvironmentENS_21SignalEnvironmentTypeENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_59;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v9, a3);
    v11 = a2;
    dispatch_async(v4, block);
    v5 = v10;
    if (v10 == v9)
    {
      v6 = 4;
      v5 = v9;
    }
    else
    {
      if (!v10)
        return;
      v6 = 5;
    }
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v7 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 69, "setAssistanceSignalEnvironment", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice30setAssistanceSignalEnvironmentENS_21SignalEnvironmentTypeENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[24];
  _BYTE *v25;
  _BYTE v26[24];
  _BYTE *v27;
  _BYTE v28[24];
  _BYTE *v29;
  _BYTE v30[24];
  _BYTE *v31;
  char __str[966];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (!*((_BYTE *)v2 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v30, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v30, (uint64_t)"setAssistanceSignalEnvironment_block_invoke");
    v11 = v31;
    if (v31 == v30)
    {
      v12 = 4;
      v11 = v30;
    }
    else
    {
      if (!v31)
      {
LABEL_20:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v16 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 69, "setAssistanceSignalEnvironment_block_invoke", 1302);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v17 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
    goto LABEL_20;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SigEnv,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceSignalEnvironment_block_invoke", *(_DWORD *)(a1 + 72));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v5 = *(int *)(a1 + 72);
  if (v5 < 7)
  {
    v6 = dword_24BC0D40C[v5];
    v7 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
    v8 = a1 + 40;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v26, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v7, (uint64_t)v26);
    v9 = v27;
    if (v27 == v26)
    {
      v10 = 4;
      v9 = v26;
    }
    else
    {
      if (!v27)
        goto LABEL_25;
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_25:
    v18 = GNS_EaSigEnvSev(v7, v6);
    if (v18 == 1)
    {
LABEL_35:
      if (g_LbsOsaTrace_Config >= 5)
      {
        bzero(__str, 0x3C6uLL);
        v22 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: SESInd,%d\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke", v6);
        gnssOsa_PrintLog(__str, 5, 1, 0);
        if (g_LbsOsaTrace_Config >= 5)
        {
          bzero(__str, 0x3C6uLL);
          v23 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "ADP", 68, "setAssistanceSignalEnvironment_block_invoke");
          gnssOsa_PrintLog(__str, 5, 1, 0);
        }
      }
      return;
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v24, v8);
    gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v18, (uint64_t)v24, "setAssistanceSignalEnvironment_block_invoke");
    v19 = v25;
    if (v25 == v24)
    {
      v20 = 4;
      v19 = v24;
    }
    else
    {
      if (!v25)
      {
LABEL_33:
        gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v7);
        if (!g_LbsOsaTrace_Config)
          return;
        bzero(__str, 0x3C6uLL);
        v21 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SigEnvSev,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v21), "ADP", 69, "setAssistanceSignalEnvironment_block_invoke", 257, v18);
        gnssOsa_PrintLog(__str, 1, 1, 0);
        goto LABEL_35;
      }
      v20 = 5;
    }
    (*(void (**)(void))(*v19 + 8 * v20))();
    goto LABEL_33;
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v13 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SigEnv,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "setAssistanceSignalEnvironment_block_invoke", 515, *(_DWORD *)(a1 + 72));
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v28, a1 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v28, (uint64_t)"setAssistanceSignalEnvironment_block_invoke");
  v14 = v29;
  if (v29 == v28)
  {
    v15 = 4;
    v14 = v28;
  }
  else
  {
    if (!v29)
      return;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
}

void sub_24BBDAE08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, char *a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  char *v30;
  char *v32;
  uint64_t v33;

  v32 = a18;
  if (a18 == v30)
  {
    v33 = 4;
    v32 = &a15;
  }
  else
  {
    if (!a18)
      goto LABEL_6;
    v33 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v32 + 8 * v33))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void gnss::GnssAdaptDevice::setAssistanceSpeedConstraint(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  NSObject *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[5];
  _BYTE v15[24];
  _BYTE *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  char __str[966];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a3 + 24))
  {
    v10 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice28setAssistanceSpeedConstraintEydddNSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_64;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v15, a3);
    v17 = a2;
    v18 = a4;
    v19 = a5;
    v20 = a6;
    dispatch_async(v10, block);
    v11 = v16;
    if (v16 == v15)
    {
      v12 = 4;
      v11 = v15;
    }
    else
    {
      if (!v16)
        return;
      v12 = 5;
    }
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v13 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "setAssistanceSpeedConstraint", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void ___ZN4gnss15GnssAdaptDevice28setAssistanceSpeedConstraintEydddNSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  BOOL v14;
  unint64_t v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  double v30;
  _BYTE v31[24];
  _BYTE *v32;
  _BYTE v33[24];
  _BYTE *v34;
  _BYTE v35[24];
  _BYTE *v36;
  _BYTE v37[24];
  _BYTE *v38;
  char __str[966];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (!*((_BYTE *)v2 + 88))
  {
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v37, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 7, (uint64_t)v37, (uint64_t)"setAssistanceSpeedConstraint_block_invoke");
    v10 = v38;
    if (v38 == v37)
    {
      v11 = 4;
      v10 = v37;
    }
    else
    {
      if (!v38)
      {
LABEL_33:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v22 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v22), "ADP", 69, "setAssistanceSpeedConstraint_block_invoke", 1302);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v23 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v23), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v11 = 5;
    }
    (*(void (**)(void))(*v10 + 8 * v11))();
    goto LABEL_33;
  }
  if (g_LbsOsaTrace_Config >= 4)
  {
    bzero(__str, 0x3C6uLL);
    v4 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: MachContTimeNs,%llu,DurSec,%f,SpeedLwrBound,%f,SpeedUprBound,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v4), "ADP", 73, "setAssistanceSpeedConstraint_block_invoke", *(_QWORD *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    gnssOsa_PrintLog(__str, 4, 1, 0);
  }
  v5 = *(double *)(a1 + 80);
  if (v5 > 86400.0
    || (v6 = *(double *)(a1 + 88), v6 < 0.0)
    || (v13 = *(double *)(a1 + 96), v13 < v6)
    || (v13 >= 0.0 ? (v14 = v13 <= 100.0) : (v14 = 0), !v14))
  {
    if (g_LbsOsaTrace_Config)
    {
      bzero(__str, 0x3C6uLL);
      v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx MachContiTimeNs,%llu,Dur,%f,SpeedLwrBound,%f,SpeedUprBound,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 69, "setAssistanceSpeedConstraint_block_invoke", 514, *(_QWORD *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
      gnssOsa_PrintLog(__str, 1, 1, 0);
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v35, a1 + 40);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse((uint64_t)v2, 4, (uint64_t)v35, (uint64_t)"setAssistanceSpeedConstraint_block_invoke");
    v8 = v36;
    if (v36 == v35)
    {
      v9 = 4;
      v8 = v35;
    }
    else
    {
      if (!v36)
        goto LABEL_18;
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_18:
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      v12 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
    return;
  }
  v15 = (*(_QWORD *)(a1 + 72) + 500000) / 0xF4240uLL;
  v16 = (v5 * 1000.0);
  *(_QWORD *)&v29 = __PAIR64__(v16, v15);
  *((double *)&v29 + 1) = v6;
  v30 = v13;
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v17 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: OsTimeMs,%u,DurMs,%d,SpeedL,%f,SpeedU,%f\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke", v15, v16, v6, v13);
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  v18 = ++gnss::GnssAdaptDevice::Ga07_00GenerateUID(void)::v_Key;
  v19 = a1 + 40;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v33, v19);
  gnss::GnssAdaptDevice::Ga07_13AddRespHndlToGnsLUT((uint64_t)v2, v18, (uint64_t)v33);
  v20 = v34;
  if (v34 == v33)
  {
    v21 = 4;
    v20 = v33;
  }
  else
  {
    if (!v34)
      goto LABEL_39;
    v21 = 5;
  }
  (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_39:
  v24 = GNS_EaSpeedConstraint(v18, &v29);
  if (v24 == 1)
  {
    if (g_LbsOsaTrace_Config < 5)
      return;
LABEL_41:
    bzero(__str, 0x3C6uLL);
    v25 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v25), "ADP", 68, "setAssistanceSpeedConstraint_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
    return;
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v31, v19);
  gnss::GnssAdaptDevice::Ga07_15AdaptGnsEarlyResponse((uint64_t)v2, v24, (uint64_t)v31, "setAssistanceSpeedConstraint_block_invoke");
  v26 = v32;
  if (v32 == v31)
  {
    v27 = 4;
    v26 = v31;
    goto LABEL_46;
  }
  if (v32)
  {
    v27 = 5;
LABEL_46:
    (*(void (**)(void))(*v26 + 8 * v27))();
  }
  gnss::GnssAdaptDevice::Ga07_14RemoveRespHndlFromGnsLut(v2, v18);
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v28 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx SpeedConstraint,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v28), "ADP", 69, "setAssistanceSpeedConstraint_block_invoke", 257, v24);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    if (g_LbsOsaTrace_Config >= 5)
      goto LABEL_41;
  }
}

void sub_24BBDB740(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char *a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  char *v36;
  char *v38;
  uint64_t v39;

  v38 = a24;
  if (a24 == v36)
  {
    v39 = 4;
    v38 = &a21;
  }
  else
  {
    if (!a24)
      goto LABEL_6;
    v39 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v38 + 8 * v39))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void gnss::GnssAdaptDevice::startTimeTransferSession(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD block[5];
  _BYTE v15[24];
  _BYTE *v16;
  _BYTE v17[24];
  _BYTE *v18;
  _BYTE v19[24];
  _BYTE *v20;
  char __str[966];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a3 + 24))
  {
    if (!g_LbsOsaTrace_Config)
      return;
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a4 + 24))
  {
    if (!g_LbsOsaTrace_Config)
      return;
LABEL_7:
    bzero(__str, 0x3C6uLL);
    v11 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "startTimeTransferSession", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    return;
  }
  v6 = *(NSObject **)(a1 + 152);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1174405120;
  block[2] = ___ZN4gnss15GnssAdaptDevice24startTimeTransferSessionENSt3__18functionIFvNS_6ResultENS_16TimeTransferDataEEEENS2_IFvS3_EEES8__block_invoke;
  block[3] = &__block_descriptor_tmp_69;
  block[4] = a1;
  v7 = v15;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v15, a2);
  v8 = v17;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v17, a3);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v19, a4);
  dispatch_async(v6, block);
  v9 = v20;
  if (v20 == v19)
  {
    v10 = 4;
    v9 = v19;
  }
  else
  {
    if (!v20)
      goto LABEL_12;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_12:
  if (v18 == v17)
  {
    v12 = 4;
  }
  else
  {
    if (!v18)
      goto LABEL_17;
    v12 = 5;
    v8 = v18;
  }
  (*(void (**)(_QWORD *))(*v8 + 8 * v12))(v8);
LABEL_17:
  if (v16 == v15)
  {
    v13 = 4;
  }
  else
  {
    if (!v16)
      return;
    v13 = 5;
    v7 = v16;
  }
  (*(void (**)(_QWORD *))(*v7 + 8 * v13))(v7);
}

void sub_24BBDBA48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,_QWORD *a22,uint64_t a23,uint64_t a24,uint64_t a25,_QWORD *a26)
{
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v29;
  uint64_t v30;

  if (a26 == v27)
  {
    v29 = 4;
  }
  else
  {
    if (!a26)
      goto LABEL_6;
    v29 = 5;
    v27 = a26;
  }
  (*(void (**)(_QWORD *))(*v27 + 8 * v29))(v27);
LABEL_6:
  if (a22 == v26)
  {
    v30 = 4;
  }
  else
  {
    if (!a22)
      goto LABEL_11;
    v30 = 5;
    v26 = a22;
  }
  (*(void (**)(_QWORD *))(*v26 + 8 * v30))(v26);
LABEL_11:
  _Unwind_Resume(exception_object);
}

void ___ZN4gnss15GnssAdaptDevice24startTimeTransferSessionENSt3__18functionIFvNS_6ResultENS_16TimeTransferDataEEEENS2_IFvS3_EEES8__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unsigned int started;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[24];
  _BYTE *v35;
  _BYTE v36[24];
  _BYTE *v37;
  _BYTE v38[24];
  _BYTE *v39;
  _BYTE v40[24];
  _BYTE *v41;
  _BYTE v42[24];
  _BYTE *v43;
  _BYTE v44[24];
  _BYTE *v45;
  char __str[24];
  char *v47;
  _QWORD v48[4];

  v48[3] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (g_LbsOsaTrace_Config >= 5)
  {
    bzero(__str, 0x3C6uLL);
    v3 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Entry\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v3), "ADP", 68, "startTimeTransferSession_block_invoke");
    gnssOsa_PrintLog(__str, 5, 1, 0);
  }
  if (*(_QWORD *)(a1 + 64))
  {
    if (*(_BYTE *)(v2 + 88))
    {
      if (*(_BYTE *)(v2 + 92))
      {
        std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v40, a1 + 72);
        gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 0, (uint64_t)v40, (uint64_t)"startTimeTransferSession_block_invoke");
        v4 = v41;
        if (v41 == v40)
        {
          v5 = 4;
          v4 = v40;
        }
        else
        {
          if (!v41)
            goto LABEL_26;
          v5 = 5;
        }
        (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_26:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v15 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeMark\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v15), "ADP", 69, "startTimeTransferSession_block_invoke", 2056);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v16 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v16), "ADP", 68, "startTimeTransferSession_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)__str, a1 + 40);
      v10 = v2 + 296;
      if (__str != (char *)(v2 + 296))
      {
        v11 = v47;
        v12 = *(_QWORD *)(v2 + 320);
        if (v47 == __str)
        {
          if (v12 == v10)
          {
            (*(void (**)(char *, _QWORD *))(*(_QWORD *)__str + 24))(__str, v48);
            (*(void (**)(char *))(*(_QWORD *)v47 + 32))(v47);
            v47 = 0;
            (*(void (**)(_QWORD, char *))(**(_QWORD **)(v2 + 320) + 24))(*(_QWORD *)(v2 + 320), __str);
            (*(void (**)(_QWORD))(**(_QWORD **)(v2 + 320) + 32))(*(_QWORD *)(v2 + 320));
            *(_QWORD *)(v2 + 320) = 0;
            v47 = __str;
            (*(void (**)(_QWORD *, uint64_t))(v48[0] + 24))(v48, v2 + 296);
            (*(void (**)(_QWORD *))(v48[0] + 32))(v48);
          }
          else
          {
            (*(void (**)(char *, uint64_t))(*(_QWORD *)__str + 24))(__str, v2 + 296);
            (*(void (**)(char *))(*(_QWORD *)v47 + 32))(v47);
            v47 = *(char **)(v2 + 320);
          }
          *(_QWORD *)(v2 + 320) = v10;
        }
        else if (v12 == v10)
        {
          (*(void (**)(uint64_t, char *))(*(_QWORD *)v10 + 24))(v2 + 296, __str);
          (*(void (**)(_QWORD))(**(_QWORD **)(v2 + 320) + 32))(*(_QWORD *)(v2 + 320));
          *(_QWORD *)(v2 + 320) = v47;
          v47 = __str;
        }
        else
        {
          v47 = *(char **)(v2 + 320);
          *(_QWORD *)(v2 + 320) = v11;
        }
      }
      v19 = v47;
      if (v47 == __str)
      {
        v20 = 4;
        v19 = __str;
      }
      else
      {
        if (!v47)
          goto LABEL_44;
        v20 = 5;
      }
      (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_44:
      v37 = 0;
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v38, a1 + 104);
      gnss::GnssAdaptDevice::Ga07_10AddRespHndlToGnmLUT(v2, 18, (uint64_t)v36);
      v21 = v39;
      if (v39 == v38)
      {
        v22 = 4;
        v21 = v38;
      }
      else
      {
        if (!v39)
          goto LABEL_49;
        v22 = 5;
      }
      (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_49:
      v23 = v37;
      if (v37 == v36)
      {
        v24 = 4;
        v23 = v36;
      }
      else
      {
        if (!v37)
          goto LABEL_54;
        v24 = 5;
      }
      (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_54:
      started = Gnm_StartTimeMarkSesion((uint64_t)gnss::GnssAdaptDevice::Ga03_03GnssTimeMarkDataCallBack);
      if (started)
      {
        v26 = *(_QWORD *)(v2 + 320);
        *(_QWORD *)(v2 + 320) = 0;
        if (v26 == v10)
        {
          v27 = 4;
        }
        else
        {
          if (!v26)
          {
LABEL_63:
            gnss::GnssAdaptDevice::Ga07_11HandleGnmStatusResponses(v2, started, 0x12u);
            if (g_LbsOsaTrace_Config)
            {
              bzero(__str, 0x3C6uLL);
              v30 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeMark,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v30), "ADP", 69, "startTimeTransferSession_block_invoke", 2049, started);
              gnssOsa_PrintLog(__str, 1, 1, 0);
              if (g_LbsOsaTrace_Config >= 5)
              {
                bzero(__str, 0x3C6uLL);
                v31 = mach_continuous_time();
                snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v31), "ADP", 68, "startTimeTransferSession_block_invoke");
                gnssOsa_PrintLog(__str, 5, 1, 0);
              }
            }
            return;
          }
          v27 = 5;
          v10 = v26;
        }
        (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8 * v27))(v10);
        goto LABEL_63;
      }
      *(_BYTE *)(v2 + 92) = 1;
      std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v34, a1 + 72);
      gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 1, (uint64_t)v34, (uint64_t)"startTimeTransferSession_block_invoke");
      v28 = v35;
      if (v35 == v34)
      {
        v29 = 4;
        v28 = v34;
      }
      else
      {
        if (!v35)
        {
LABEL_68:
          if (g_LbsOsaTrace_Config > 3)
          {
            bzero(__str, 0x3C6uLL);
            v32 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Started\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v32), "ADP", 73, "startTimeTransferSession_block_invoke");
            gnssOsa_PrintLog(__str, 4, 1, 0);
            if (g_LbsOsaTrace_Config >= 5)
            {
              bzero(__str, 0x3C6uLL);
              v33 = mach_continuous_time();
              snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v33), "ADP", 68, "startTimeTransferSession_block_invoke");
              gnssOsa_PrintLog(__str, 5, 1, 0);
            }
          }
          return;
        }
        v29 = 5;
      }
      (*(void (**)(void))(*v28 + 8 * v29))();
      goto LABEL_68;
    }
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v42, a1 + 72);
    gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 0, (uint64_t)v42, (uint64_t)"startTimeTransferSession_block_invoke");
    v8 = v43;
    if (v43 == v42)
    {
      v9 = 4;
      v8 = v42;
    }
    else
    {
      if (!v43)
      {
LABEL_31:
        if (g_LbsOsaTrace_Config)
        {
          bzero(__str, 0x3C6uLL);
          v17 = mach_continuous_time();
          snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v17), "ADP", 69, "startTimeTransferSession_block_invoke", 1302);
          gnssOsa_PrintLog(__str, 1, 1, 0);
          if (g_LbsOsaTrace_Config >= 5)
          {
            bzero(__str, 0x3C6uLL);
            v18 = mach_continuous_time();
            snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v18), "ADP", 68, "startTimeTransferSession_block_invoke");
            gnssOsa_PrintLog(__str, 5, 1, 0);
          }
        }
        return;
      }
      v9 = 5;
    }
    (*(void (**)(void))(*v8 + 8 * v9))();
    goto LABEL_31;
  }
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v44, a1 + 72);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v2, 4, (uint64_t)v44, (uint64_t)"startTimeTransferSession_block_invoke");
  v6 = v45;
  if (v45 == v44)
  {
    v7 = 4;
    v6 = v44;
    goto LABEL_20;
  }
  if (v45)
  {
    v7 = 5;
LABEL_20:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v13 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx DataCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v13), "ADP", 69, "startTimeTransferSession_block_invoke", 258);
    gnssOsa_PrintLog(__str, 1, 1, 0);
    if (g_LbsOsaTrace_Config >= 5)
    {
      bzero(__str, 0x3C6uLL);
      v14 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Exit\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v14), "ADP", 68, "startTimeTransferSession_block_invoke");
      gnssOsa_PrintLog(__str, 5, 1, 0);
    }
  }
}

void sub_24BBDC390(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char *a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  char *v39;
  char *v41;
  uint64_t v42;

  v41 = a19;
  if (a19 == v39)
  {
    v42 = 4;
    v41 = &a16;
  }
  else
  {
    if (!a19)
      goto LABEL_6;
    v42 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v41 + 8 * v42))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void gnss::GnssAdaptDevice::Ga03_03GnssTimeMarkDataCallBack(gnss::GnssAdaptDevice *a1, char *a2)
{
  char v3;
  uint64_t DeviceInstance;
  char v5;
  uint64_t v6;
  char v7;
  __int16 v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  _BYTE v14[7];
  char __str[8];
  uint64_t v16;
  _QWORD *(*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  char v20;
  char v21;
  __int16 v22;
  _BYTE v23[21];
  _BYTE v24[7];
  uint64_t v25;
  int v26;
  char v27;
  _BYTE v28[19];
  char v29;
  _OWORD v30[2];
  _BYTE v31[21];
  uint64_t v32;

  v3 = (char)a1;
  v32 = *MEMORY[0x24BDAC8D0];
  DeviceInstance = gnss::GnssAdaptDevice::Ga00_00GetDeviceInstance(a1);
  if (DeviceInstance)
  {
    v6 = DeviceInstance;
    memset(&v31[4], 0, 17);
    *(_OWORD *)((char *)v30 + 1) = 0uLL;
    *(_WORD *)((char *)&v30[1] + 1) = 0;
    if (a2)
    {
      v7 = *a2;
      v5 = a2[1];
      v8 = *((_WORD *)a2 + 1);
      *(_OWORD *)v31 = *(_OWORD *)(a2 + 4);
      *(_QWORD *)&v31[13] = *(_QWORD *)(a2 + 17);
      *(_DWORD *)v14 = *(_DWORD *)(a2 + 25);
      *(_DWORD *)&v14[3] = *((_DWORD *)a2 + 7);
      v9 = *((_QWORD *)a2 + 4);
      v10 = *((_DWORD *)a2 + 10);
      v11 = a2[44];
      *(_DWORD *)((char *)v30 + 15) = *((_DWORD *)a2 + 15);
      v30[0] = *(_OWORD *)(a2 + 45);
    }
    else
    {
      v7 = g_LbsOsaTrace_Config;
      v9 = 0;
      if (g_LbsOsaTrace_Config)
      {
        bzero(__str, 0x3C6uLL);
        v12 = mach_continuous_time();
        snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx TimeMarkData\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v12), "ADP", 69, "Ga03_02HandleTimeMarkDataCallback", 770);
        gnssOsa_PrintLog(__str, 1, 1, 0);
        v11 = 0;
        v10 = 0;
        v8 = 0;
        v7 = 0;
      }
      else
      {
        v11 = 0;
        v10 = 0;
        v8 = 0;
      }
      v3 = 11;
    }
    v13 = *(NSObject **)(v6 + 152);
    *(_QWORD *)__str = MEMORY[0x24BDAC760];
    v16 = 0x40000000;
    v17 = ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke;
    v18 = &__block_descriptor_tmp_95;
    v19 = v6;
    v29 = v3;
    v20 = v7;
    v21 = v5;
    v22 = v8;
    *(_OWORD *)v23 = *(_OWORD *)v31;
    *(_QWORD *)&v23[13] = *(_QWORD *)&v31[13];
    *(_DWORD *)v24 = *(_DWORD *)v14;
    *(_DWORD *)&v24[3] = *(_DWORD *)&v14[3];
    v25 = v9;
    v26 = v10;
    v27 = v11;
    *(_DWORD *)&v28[15] = *(_DWORD *)((char *)v30 + 15);
    *(_OWORD *)v28 = v30[0];
    dispatch_async(v13, __str);
  }
}

uint64_t __copy_helper_block_e8_40c63_ZTSNSt3__18functionIFvN4gnss6ResultENS1_16TimeTransferDataEEEE72c40_ZTSNSt3__18functionIFvN4gnss6ResultEEEE104c40_ZTSNSt3__18functionIFvN4gnss6ResultEEEE(uint64_t a1, uint64_t a2)
{
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100](a1 + 40, a2 + 40);
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100](a1 + 72, a2 + 72);
  return std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100](a1 + 104, a2 + 104);
}

void sub_24BBDC6F8(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD **)(v2 + 96);
  if (v5 == v3)
  {
    v6 = v3;
    v7 = 4;
  }
  else
  {
    if (!v5)
      goto LABEL_6;
    v7 = 5;
    v6 = *(_QWORD **)(v2 + 96);
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_6:
  v8 = *(_QWORD **)(v2 + 64);
  if (v8 == v1)
  {
    v9 = 4;
    v8 = v1;
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

_QWORD *__destroy_helper_block_e8_40c63_ZTSNSt3__18functionIFvN4gnss6ResultENS1_16TimeTransferDataEEEE72c40_ZTSNSt3__18functionIFvN4gnss6ResultEEEE104c40_ZTSNSt3__18functionIFvN4gnss6ResultEEEE(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;

  v2 = a1 + 9;
  v3 = a1 + 13;
  v4 = (_QWORD *)a1[16];
  if (v4 == v3)
  {
    v5 = 4;
    v4 = v3;
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  v6 = (_QWORD *)a1[12];
  if (v6 == v2)
  {
    v7 = 4;
    v6 = v2;
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_11:
  result = (_QWORD *)a1[8];
  if (result == a1 + 5)
  {
    v9 = 4;
    result = a1 + 5;
  }
  else
  {
    if (!result)
      return result;
    v9 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v9))();
}

void gnss::GnssAdaptDevice::stopTimeTransferSession(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD block[5];
  _BYTE v7[24];
  _BYTE *v8;
  char __str[966];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a2 + 24))
  {
    v2 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN4gnss15GnssAdaptDevice23stopTimeTransferSessionENSt3__18functionIFvNS_6ResultEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_70;
    block[4] = a1;
    std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v7, a2);
    dispatch_async(v2, block);
    v3 = v8;
    if (v8 == v7)
    {
      v4 = 4;
      v3 = v7;
    }
    else
    {
      if (!v8)
        return;
      v4 = 5;
    }
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  else if (g_LbsOsaTrace_Config)
  {
    bzero(__str, 0x3C6uLL);
    v5 = mach_continuous_time();
    snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx RespCB\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v5), "ADP", 69, "stopTimeTransferSession", 513);
    gnssOsa_PrintLog(__str, 1, 1, 0);
  }
}

void sub_24BBDCA78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void gnss::GnssAdaptDevice::Ga03_00RegisterGnsEaStatusResponse(gnss::GnssAdaptDevice *a1, uint64_t a2, int *a3)
{
  int v4;
  uint64_t DeviceInstance;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  NSObject *v14;
  char __str[8];
  uint64_t v16;
  uint64_t *(*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;

  v4 = (int)a1;
  v23 = *MEMORY[0x24BDAC8D0];
  DeviceInstance = gnss::GnssAdaptDevice::Ga00_00GetDeviceInstance(a1);
  if (DeviceInstance)
  {
    v6 = DeviceInstance;
    if (g_LbsOsaTrace_Config >= 4)
    {
      bzero(__str, 0x3C6uLL);
      v7 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Type,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v7), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse", v4);
      gnssOsa_PrintLog(__str, 4, 1, 0);
    }
    if (!a3)
    {
      if (!g_LbsOsaTrace_Config)
        return;
      bzero(__str, 0x3C6uLL);
      v11 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: #%04hx MsgData,%u\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v11), "ADP", 69, "Ga03_01HandleGnsEaStatusResponse", 770, v4);
      v10 = 1;
      goto LABEL_10;
    }
    v8 = a3[1];
    if (v8 == 3)
    {
      if (g_LbsOsaTrace_Config < 4)
        return;
      bzero(__str, 0x3C6uLL);
      v9 = mach_continuous_time();
      snprintf(__str, 0x3C5uLL, "%10u %s%c %s: Resp rcvd for E_gnsEA_DATA_UAC\n", (unint64_t)(*(double *)&g_MacClockTicksToMsRelation * (double)v9), "ADP", 73, "Ga03_01HandleGnsEaStatusResponse");
      v10 = 4;
LABEL_10:
      gnssOsa_PrintLog(__str, v10, 1, 0);
      return;
    }
    v12 = *a3;
    v13 = a3[2];
    v14 = *(NSObject **)(v6 + 152);
    *(_QWORD *)__str = MEMORY[0x24BDAC760];
    v16 = 0x40000000;
    v17 = ___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke;
    v18 = &__block_descriptor_tmp_80;
    v19 = v6;
    v20 = v12;
    v21 = v8;
    v22 = v13;
    dispatch_async(v14, __str);
  }
}

void sub_24BBDD180(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 64);
  if (v3 == (_QWORD *)(v1 - 88))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 88);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN4gnss15GnssAdaptDevice32Ga03_01HandleGnsEaStatusResponseE15e_gnsEA_MsgTypejP17s_gnsEA_ApiStatus_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 64);
  v1 = *(_QWORD *)(a1 + 56);
  if (!v1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *))(*(_QWORD *)v1 + 48))(v1, &v3);
}

void sub_24BBDDAC8(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 120);
  if (v3 == (_QWORD *)(v1 - 144))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 144);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(a1);
}

uint64_t ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  uint64_t v3;
  _OWORD v5[5];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 112);
  v5[2] = *(_OWORD *)(a1 + 96);
  v5[3] = v1;
  v5[4] = *(_OWORD *)(a1 + 128);
  v2 = *(_OWORD *)(a1 + 80);
  v5[0] = *(_OWORD *)(a1 + 64);
  v5[1] = v2;
  v6 = 8;
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *, _OWORD *))(*(_QWORD *)v3 + 48))(v3, &v6, v5);
}

uint64_t __copy_helper_block_e8_32c63_ZTSNSt3__18functionIFvN4gnss6ResultENS1_16TimeTransferDataEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_e8_32c63_ZTSNSt3__18functionIFvN4gnss6ResultENS1_16TimeTransferDataEEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_85(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  uint64_t v3;
  _OWORD v5[5];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 112);
  v5[2] = *(_OWORD *)(a1 + 96);
  v5[3] = v1;
  v5[4] = *(_OWORD *)(a1 + 128);
  v2 = *(_OWORD *)(a1 + 80);
  v5[0] = *(_OWORD *)(a1 + 64);
  v5[1] = v2;
  v6 = 8;
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *, _OWORD *))(*(_QWORD *)v3 + 48))(v3, &v6, v5);
}

uint64_t ___ZN4gnss15GnssAdaptDevice33Ga03_02HandleTimeMarkDataCallbackE11e_Gnm_ErrorP18s_Gnm_TimeMarkData_block_invoke_2_93(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  uint64_t v3;
  _OWORD v5[5];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 112);
  v5[2] = *(_OWORD *)(a1 + 96);
  v5[3] = v1;
  v5[4] = *(_OWORD *)(a1 + 128);
  v2 = *(_OWORD *)(a1 + 80);
  v5[0] = *(_OWORD *)(a1 + 64);
  v5[1] = v2;
  v6 = 1;
  v3 = *(_QWORD *)(a1 + 56);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *, _OWORD *))(*(_QWORD *)v3 + 48))(v3, &v6, v5);
}

uint64_t NK_Reflection_Rejection_Ped(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _BYTE *v7;
  uint64_t v9;
  double v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  _BYTE *v17;
  unsigned int v18;
  uint64_t v19;
  double v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  int v38;
  int v39;
  uint64_t v40;
  unsigned int v41;
  int *v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  unsigned int *v51;
  int v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  BOOL v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  int v68;
  double v69;
  double v70;
  double v71;
  double *v72;
  double v73;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  double *v81;
  int v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  _QWORD *v88;
  double *v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  int *v94;
  int *v95;
  double *v96;
  double *v97;
  _BYTE *v98;
  _BYTE *v99;
  unsigned int v100[2];
  double v101[128];
  _OWORD v102[8];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v4 = a3 + 27136;
  if (a4[468])
  {
    if (*(_DWORD *)v4)
    {
      if (!*((_BYTE *)a4 + 1488)
        && *(double *)(a3 + 27520) <= 6.0
        && (*(_DWORD *)(a3 + 20) - 4) >= 5
        && *((unsigned __int8 *)a4 + 1881) > 0xEu)
      {
        v9 = result;
        if (!*(_WORD *)(result + 240)
          || (v10 = *(double *)(result + 72), v10 >= -10.0) && v10 <= 70.0 && fabs(*(double *)(result + 112)) <= 2.5)
        {
          v97 = (double *)(a4 + 15492);
          v99 = (char *)a4 + 21659;
          v98 = (char *)a4 + 6755;
          v7 = (_BYTE *)(a3 + 27732);
          if (!*(_BYTE *)(a3 + 27732))
          {
            *(_WORD *)(a3 + 27732) = 1;
            bzero((void *)(a3 + 28080), 0x9C00uLL);
            *(_QWORD *)&v11 = -1;
            *((_QWORD *)&v11 + 1) = -1;
            *(_OWORD *)(a3 + 28064) = v11;
            *(_OWORD *)(a3 + 28038) = v11;
            *(_OWORD *)(a3 + 28054) = v11;
            *(_OWORD *)(a3 + 28006) = v11;
            *(_OWORD *)(a3 + 28022) = v11;
            *(_OWORD *)(a3 + 27974) = v11;
            *(_OWORD *)(a3 + 27990) = v11;
            *(_OWORD *)(a3 + 27942) = v11;
            *(_OWORD *)(a3 + 27958) = v11;
            *(_OWORD *)(a3 + 27910) = v11;
            *(_OWORD *)(a3 + 27926) = v11;
            *(_OWORD *)(a3 + 27878) = v11;
            *(_OWORD *)(a3 + 27894) = v11;
            *(_OWORD *)(a3 + 27846) = v11;
            *(_OWORD *)(a3 + 27862) = v11;
            *(_OWORD *)(a3 + 27814) = v11;
            *(_OWORD *)(a3 + 27830) = v11;
            *(_OWORD *)(a3 + 27782) = v11;
            *(_OWORD *)(a3 + 27798) = v11;
            *(_OWORD *)(a3 + 27750) = v11;
            *(_OWORD *)(a3 + 27766) = v11;
            *(_OWORD *)(a3 + 27734) = v11;
          }
          v12 = 0;
          v100[0] = 0;
          *(_QWORD *)&v13 = -1;
          *((_QWORD *)&v13 + 1) = -1;
          v102[6] = v13;
          v102[7] = v13;
          v102[4] = v13;
          v102[5] = v13;
          v14 = a3 + 27952;
          v102[2] = v13;
          v102[3] = v13;
          v102[0] = v13;
          v102[1] = v13;
          while (1)
          {
            v15 = *(_DWORD *)(a2 + 4 * v12 + 88);
            result = Is_Legal(v15);
            if ((_DWORD)result)
              v16 = v15 == 7;
            else
              v16 = 1;
            if (!v16
              && (v15 != 4 || BYTE2(v15) - 59 >= 0xFFFFFFCB)
              && *((_BYTE *)a4 + v12 + 6808)
              && *((_BYTE *)a4 + v12 + 21712)
              && *((_BYTE *)a4 + v12 + 57))
            {
              if (*((_BYTE *)a4 + v12 + 63904) && *((_BYTE *)a4 + v12 + 63776))
              {
                result = GNSS_Id_To_Num_Prn_Idx(v15);
                v17 = (_BYTE *)(a3 + (int)result + 27734);
                v18 = *v17;
                if (v18 == 255)
                {
                  if (*(unsigned __int8 *)(v4 + 597) == 128)
                  {
                    result = (uint64_t)EvLog("NK_Reflection_Rejection_Ped: No space");
LABEL_52:
                    if ((int)v100[0] < 4)
                      goto LABEL_8;
                    VecMedian8(v101, v100[0]);
                    v24 = 0;
                    v26 = -v25;
                    v27 = a3 + 28112;
                    v28 = a3 + 28304;
                    v29 = a3 + 28312;
                    v30 = (_QWORD *)(a3 + 28320);
                    result = 28080;
                    v95 = a4 + 1688;
                    v94 = a4 + 5414;
                    while (2)
                    {
                      v31 = (_BYTE *)(a3 + v24 + 27952);
                      v32 = *v31;
                      if (v32 != 255)
                      {
                        v33 = *((unsigned __int8 *)v102 + v24);
                        if (v33 == 255)
                        {
                          v42 = (int *)(a3 + 312 * v24 + 28080);
                          if (*v42 >= 1
                            && (v43 = (unsigned int *)(a3 + 312 * v24 + 28084), *v43)
                            && *(_DWORD *)(a3 + 312 * v24 + 4 * (*v42 - 1) + 28112)
                            && (v44 = *a4,
                                10 * *(_DWORD *)(v9 + 1652) + 300000 + *(_DWORD *)(a3 + 312 * v24 + 28112) > *a4))
                          {
                            *(double *)(a3 + 312 * v24 + 28104) = *(double *)(a3 + 312 * v24 + 28104)
                                                                + v26 * ((double)(int)(v44 - *v43) * 0.001);
                            *v43 = v44;
                          }
                          else
                          {
                            *(_QWORD *)(a3 + 312 * v24 + 28384) = 0;
                            *(_OWORD *)(a3 + 312 * v24 + 28352) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28368) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28320) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28336) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28288) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28304) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28256) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28272) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28224) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28240) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28192) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28208) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28160) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28176) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28128) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28144) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28096) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28112) = 0uLL;
                            *(_OWORD *)v42 = 0uLL;
                            *(_BYTE *)(a3 + v32 + 27734) = -1;
                            *v31 = -1;
                            --*(_BYTE *)(v4 + 597);
                          }
                        }
                        else
                        {
                          v34 = (unsigned int *)(a3 + 312 * v24 + 28080);
                          v35 = *v34;
                          if (!(_DWORD)v35)
                          {
                            *(_QWORD *)(a3 + 312 * v24 + 28384) = 0;
                            *(_OWORD *)(a3 + 312 * v24 + 28352) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28368) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28320) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28336) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28288) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28304) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28256) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28272) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28224) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28240) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28192) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28208) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28160) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28176) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28128) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28144) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28096) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28112) = 0uLL;
                            *(_OWORD *)v34 = 0uLL;
                            *v34 = 1;
                            v45 = *a4;
                            v46 = a3 + 312 * v24;
                            *(_DWORD *)(v46 + 28084) = *a4;
                            *(_QWORD *)(v46 + 28088) = *(_QWORD *)&a4[2 * v33 + 16040];
                            *(_DWORD *)(v46 + 28112) = v45;
                            *(_QWORD *)(v46 + 28152) = 0;
                            *(_QWORD *)(v46 + 28096) = *(_QWORD *)(a2 + 8 * v33 + 3416);
                            goto LABEL_115;
                          }
                          v36 = (int)v35 - 1;
                          v37 = *a4;
                          v38 = *(_DWORD *)(a3 + 312 * v24 + 4 * v36 + 28112);
                          v39 = *a4 - v38;
                          if (v39 > 300000)
                          {
                            v40 = a3 + 312 * v24;
                            *(_QWORD *)(v40 + 28384) = 0;
                            *(_OWORD *)(v40 + 28352) = 0uLL;
                            *(_OWORD *)(v40 + 28368) = 0uLL;
                            *(_OWORD *)(v40 + 28320) = 0uLL;
                            *(_OWORD *)(v40 + 28336) = 0uLL;
                            *(_OWORD *)(v40 + 28288) = 0uLL;
                            *(_OWORD *)(v40 + 28304) = 0uLL;
                            *(_OWORD *)(v40 + 28256) = 0uLL;
                            *(_OWORD *)(v40 + 28272) = 0uLL;
                            *(_OWORD *)(v40 + 28224) = 0uLL;
                            *(_OWORD *)(v40 + 28240) = 0uLL;
                            *(_OWORD *)(v40 + 28192) = 0uLL;
                            *(_OWORD *)(v40 + 28208) = 0uLL;
                            *(_OWORD *)(v40 + 28160) = 0uLL;
                            *(_OWORD *)(v40 + 28176) = 0uLL;
                            *(_OWORD *)(v40 + 28128) = 0uLL;
                            *(_OWORD *)(v40 + 28144) = 0uLL;
                            *(_OWORD *)(v40 + 28096) = 0uLL;
                            *(_OWORD *)(v40 + 28112) = 0uLL;
                            *(_OWORD *)v34 = 0uLL;
                            *v34 = 1;
                            v41 = *a4;
                            *(_DWORD *)(v40 + 28084) = *a4;
                            *(_QWORD *)(v40 + 28088) = *(_QWORD *)&a4[2 * v33 + 16040];
                            *(_DWORD *)(v40 + 28112) = v41;
                            *(_QWORD *)(v40 + 28152) = 0;
                            *(_QWORD *)(v40 + 28096) = *(_QWORD *)(a2 + 8 * v33 + 3416);
                            goto LABEL_115;
                          }
                          v47 = a2 + 8 * v33;
                          v48 = a3 + 312 * v24;
                          v49 = *(double *)(v48 + 28096);
                          if (vabdd_f64(*(double *)(v47 + 3416), v49) > 149896.229)
                          {
                            *(_QWORD *)(a3 + 312 * v24 + 28384) = 0;
                            *(_OWORD *)(a3 + 312 * v24 + 28352) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28368) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28320) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28336) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28288) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28304) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28256) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28272) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28224) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28240) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28192) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28208) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28160) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28176) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28128) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28144) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28096) = 0uLL;
                            *(_OWORD *)(a3 + 312 * v24 + 28112) = 0uLL;
                            *(_OWORD *)v34 = 0uLL;
                            goto LABEL_115;
                          }
                          v50 = a3 + 312 * v24;
                          v51 = (unsigned int *)(v50 + 28084);
                          v52 = *(_DWORD *)(v50 + 28084);
                          v53 = *(double *)(v50 + 28104) + v26 * ((double)(int)(v37 - v52) * 0.001);
                          *(double *)(v50 + 28104) = v53;
                          if (*(_BYTE *)(v4 + 114))
                          {
                            v54 = 1.5;
                            v55 = 0.15;
                            if (*(double *)(a3 + 27520) > 1.5)
                            {
                              if (*v97 >= 0.15)
                                v55 = *v97;
                              else
                                v55 = 0.15;
                              v54 = *(double *)(a3 + 27520);
                            }
                          }
                          else
                          {
                            v54 = 1.5;
                            v55 = 0.15;
                          }
                          v56 = (double)v39;
                          v57 = (double)v39 * 0.001;
                          v96 = (double *)&a4[2 * v33 + 16040];
                          v58 = v57 * ((*(double *)(v50 + 28088) + *v96) * 0.5);
                          v59 = *(double *)(a3 + 40 * v33 + 1936);
                          v60 = v57 * (v55 * 3.0 + v59 * v54);
                          *(_QWORD *)v100 = v47 + 3416;
                          v61 = *(double *)(v47 + 3416);
                          v62 = v61 - (v49 + v53 + v58 + v60 + 50.0);
                          v63 = v62 >= 1000.0 || v62 <= 0.0;
                          v64 = 2;
                          if (v63)
                            v65 = 0;
                          else
                            v65 = 2;
                          if ((v65 - 1) < 0x1D)
                          {
LABEL_82:
                            *v51 = v37;
                            v95[v33 + 142] = v64;
                            ++v98[1];
                            *((_BYTE *)v95 + v33 + 312) = 0;
                            --*v98;
                            v94[v33 + 142] = v64;
                            ++v99[1];
                            *((_BYTE *)v94 + v33 + 312) = 0;
                            --*v99;
                            goto LABEL_115;
                          }
                          if ((int)v35 <= 1)
                            goto LABEL_113;
                          v66 = 0;
                          v67 = v35 - 1;
                          while (*(_DWORD *)(v27 + 4 * v66) < v37 - 10 * *(_DWORD *)(v9 + 1652))
                          {
                            ++v66;
                            --v67;
                            if (v35 == v66)
                              goto LABEL_98;
                          }
                          if ((int)v36 <= (int)v66)
                          {
                            v68 = 1;
                            v70 = v49;
                          }
                          else
                          {
                            v68 = v35 - v66;
                            v69 = 0.0;
                            v70 = v49;
                            v71 = v49;
                            v72 = (double *)(v28 + 8 * v35);
                            do
                            {
                              v69 = v69 + *(v72 - 10) + *v72;
                              v71 = v71 - *(v72 - 20);
                              v70 = v69 + v70 + v71;
                              --v72;
                              --v67;
                            }
                            while (v67);
                          }
                          v73 = v61 - (50.0 / (double)v68 + v60 + v58 + v53 + v70 / (double)v68 + 20.0);
                          if (v73 < 1000.0 && v73 > 0.0)
                            v65 = 3;
LABEL_98:
                          if ((int)v35 < 6 || v52 != v38 || v65)
                            goto LABEL_108;
                          if (v55 <= 0.75)
                            v75 = 2.25;
                          else
                            v75 = v55 * 3.0;
                          v76 = v53 + v58;
                          v77 = v49 + v53 + v58 - v61;
                          v78 = v77 * v56;
                          v79 = v56 * v56;
                          v80 = v36 - 1;
                          v81 = (double *)(v29 + 8 * v36);
                          v82 = 1;
                          v83 = v49;
                          do
                          {
                            v76 = v76 + *(v81 - 10) + *v81;
                            v84 = (double)(int)(v37 - *(_DWORD *)(a3 + 312 * v24 + 4 * v80 + 28112));
                            v83 = v83 - *(v81 - 20);
                            v85 = v76 + v83 - v61;
                            ++v82;
                            v56 = v56 + v84;
                            v79 = v79 + v84 * v84;
                            v77 = v77 + v85;
                            v78 = v78 + v85 * v84;
                            --v80;
                            --v81;
                          }
                          while ((_DWORD)v35 != v82);
                          v86 = (double)(int)v35 * v79 - v56 * v56;
                          if (v86 > 0.0)
                          {
                            v65 = 4 * ((v77 * -v56 + (double)(int)v35 * v78) * -1000.0 / v86 > v75 + v59 * v54);
LABEL_108:
                            v64 = v65;
                            if ((v65 - 1) <= 0x1C)
                              goto LABEL_82;
                          }
                          if ((_DWORD)v35 == 10)
                          {
                            v87 = 0;
                            v88 = v30;
                            v89 = *(double **)v100;
                            do
                            {
                              *(_DWORD *)(v27 + v87) = *(_DWORD *)(v27 + v87 + 4);
                              *(v88 - 21) = *(v88 - 20);
                              *(v88 - 11) = *(v88 - 10);
                              *(v88 - 1) = *v88;
                              v87 += 4;
                              ++v88;
                            }
                            while (v87 != 36);
                            v37 = *a4;
                            v61 = *v89;
                            LODWORD(v35) = 9;
                          }
                          else
                          {
LABEL_113:
                            v89 = *(double **)v100;
                          }
                          v90 = (_QWORD *)(v50 + 28104);
                          v91 = (_QWORD *)(v50 + 28088);
                          *v34 = v35 + 1;
                          *v51 = v37;
                          v92 = a3 + 312 * v24 + 28080;
                          *(_DWORD *)(v92 + 4 * (int)v35 + 32) = v37;
                          v93 = v92 + 8 * (int)v35;
                          *(double *)(v93 + 72) = v61 - v49;
                          *(double *)(v48 + 28096) = *v89;
                          *(_QWORD *)(v93 + 152) = *v90;
                          *(double *)(v93 + 232) = v58;
                          *v90 = 0;
                          *v91 = *(_QWORD *)v96;
                        }
                      }
LABEL_115:
                      ++v24;
                      v27 += 312;
                      v28 += 312;
                      v29 += 312;
                      v30 += 39;
                      if (v24 == 128)
                        return result;
                      continue;
                    }
                  }
                  v19 = 0;
                  while (*(unsigned __int8 *)(v14 + v19) != 255)
                  {
                    if (++v19 == 128)
                    {
                      result = (uint64_t)EvCrt_v("NK_Reflection_Rejection_Ped: CODING ERROR");
                      goto LABEL_8;
                    }
                  }
                  *(_BYTE *)(v14 + v19) = result;
                  *v17 = v19;
                  ++*(_BYTE *)(v4 + 597);
                  v18 = *v17;
                }
                *((_BYTE *)v102 + v18) = v12;
                if (*(unsigned __int8 *)(a2 + v12 + 1752) >= 0x13u && *(int *)(a3 + 40 * v12 + 1920) >= 45)
                {
                  v20 = *(double *)(a2 + 8 * v12 + 4440) + *(double *)&a4[2 * v12 + 16040];
                  v21 = v100[0];
                  if (v100[0])
                  {
                    if ((int)v100[0] < 1)
                    {
LABEL_45:
                      v21 = v100[0];
                      v101[v100[0]] = v20;
                    }
                    else
                    {
                      v22 = 0;
                      v23 = v100[0];
                      while (v20 >= v101[v22])
                      {
                        if (v100[0] == ++v22)
                          goto LABEL_45;
                      }
                      if ((int)v100[0] > (int)v22)
                      {
                        do
                        {
                          v101[v23] = v101[v23 - 1];
                          --v23;
                        }
                        while (v23 > v22);
                      }
                      v101[v22] = v20;
                      v21 = v100[0];
                    }
                  }
                  else
                  {
                    v101[0] = *(double *)(a2 + 8 * v12 + 4440) + *(double *)&a4[2 * v12 + 16040];
                  }
                  v100[0] = v21 + 1;
                }
              }
              else
              {
                result = (uint64_t)EvLog("NK_Reflection_Rejection_Ped: No SAPE data");
              }
            }
            if (++v12 == 128)
              goto LABEL_52;
          }
        }
      }
    }
  }
  v7 = (_BYTE *)(a3 + 27732);
LABEL_8:
  *v7 = 0;
  return result;
}

const void **SV_Gen_Meas_Update_Wrapper(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char __dst[11776];
  uint64_t v10;
  int v11;
  char v12;
  __int128 v13;
  char v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD v21[529];

  v1 = MEMORY[0x24BDAC7A8](a1);
  v21[528] = *MEMORY[0x24BDAC8D0];
  v2 = -4608;
  do
  {
    v3 = &__dst[v2];
    *((_OWORD *)v3 + 289) = 0uLL;
    *((_OWORD *)v3 + 288) = 0uLL;
    __dst[v2 + 4640] = 0;
    v2 += 36;
  }
  while (v2);
  v4 = 4608;
  do
  {
    v5 = &__dst[v4];
    *(_QWORD *)v5 = 0;
    *((_WORD *)v5 + 4) = 0;
    *(_QWORD *)(v5 + 12) = 0;
    *((_QWORD *)v5 + 6) = 0;
    *((_QWORD *)v5 + 3) = 0;
    *((_QWORD *)v5 + 4) = 0;
    v4 += 56;
    *(_QWORD *)(v5 + 38) = 0;
  }
  while (v5 + 56 != (char *)&v10);
  v10 = 0;
  v6 = 11784;
  do
  {
    v7 = &__dst[v6];
    *(_DWORD *)v7 = 0;
    v7[4] = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = 0;
    v7[24] = 0;
    *(_QWORD *)(v7 + 34) = 0;
    *(_QWORD *)(v7 + 26) = 0;
    v6 += 48;
    *(_DWORD *)(v7 + 42) = 0;
  }
  while (v7 + 48 != (char *)&v11);
  v11 = 0;
  v12 = 0;
  v15 = 0;
  v13 = 0u;
  v14 = 0;
  v19 = 0;
  v16 = 0;
  v18 = 0;
  v17 = 0;
  bzero(&v20, 0x20CuLL);
  bzero(v21, 0x1080uLL);
  GNSS_Validate_p_list((const void **)v1, "SV_Gen_Meas_Update_Wrapper: Entry");
  *(_QWORD *)(v1 + 160) = __dst;
  SV_Gen_Meas(*(_QWORD *)(v1 + 120), __dst, *(int **)(v1 + 200), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 64));
  *(_QWORD *)(v1 + 160) = 0;
  return GNSS_Validate_p_list((const void **)v1, "SV_Gen_Meas_Update_Wrapper:  Exit");
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x24BDD7FD0](interface);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x24BDD88C8](*(_QWORD *)&entry, plane, child);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

uint64_t TelephonyBasebandCreateController()
{
  return MEMORY[0x24BED8D60]();
}

uint64_t TelephonyBasebandDeregisterForEvents()
{
  return MEMORY[0x24BED8D68]();
}

uint64_t TelephonyBasebandGNSSTrapTrigger()
{
  return MEMORY[0x24BED8D78]();
}

uint64_t TelephonyBasebandGNSSWakeTrigger()
{
  return MEMORY[0x24BED8D80]();
}

uint64_t TelephonyBasebandGetReset()
{
  return MEMORY[0x24BED8DA8]();
}

uint64_t TelephonyBasebandRegisterForEvents()
{
  return MEMORY[0x24BED8DD0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
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

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
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
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
  MEMORY[0x24BEDB100](this);
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

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x24BEDB1B0](*(_QWORD *)&__ev, __what_arg);
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
  return off_251CDAD58();
}

void operator delete(void *__p)
{
  off_251CDAD60(__p);
}

uint64_t operator delete()
{
  return off_251CDAD68();
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_251CDAD70(__sz, a2);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251CDAD78(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_251CDAD80(__sz, a2);
}

uint64_t operator new()
{
  return off_251CDAD88();
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

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
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

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x24BDAF858](a1, a2, a3);
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

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x24BDAF9A0](a1, *(_QWORD *)&a2, a3);
}

int sched_get_priority_max(int a1)
{
  return MEMORY[0x24BDAFC58](*(_QWORD *)&a1);
}

int sched_get_priority_min(int a1)
{
  return MEMORY[0x24BDAFC60](*(_QWORD *)&a1);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

