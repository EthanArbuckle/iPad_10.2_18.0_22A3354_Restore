void sub_21071BD10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21071BDC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21071BE80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21071BEEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21071C8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, char a20,_QWORD *a21)
{
  if (__p)
    operator delete(__p);
  std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy((uint64_t)&a20, a21);

  _Unwind_Resume(a1);
}

void std::vector<std::pair<std::pair<int,int>,half>>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<std::pair<std::pair<int,int>,half>>::__append((char **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 12 * a2;
  }
}

char *std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__emplace_unique_key_args<std::pair<int,int>,std::pair<std::pair<int,int>,half>>(uint64_t **a1, int *a2, uint64_t a3)
{
  uint64_t *v5;
  char *v6;
  uint64_t **v7;
  uint64_t v15;

  v5 = std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__find_equal<std::pair<int,int>>((uint64_t)a1, &v15, a2);
  v6 = (char *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (char *)operator new(0x28uLL);
    *(_QWORD *)(v6 + 28) = *(_QWORD *)a3;
    _H0 = *(_WORD *)(a3 + 8);
    __asm { FCVT            S0, H0 }
    *((_DWORD *)v6 + 9) = _S0;
    std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__insert_node_at(a1, v15, v7, (uint64_t *)v6);
  }
  return v6;
}

uint64_t *std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__find_equal<std::pair<int,int>>(uint64_t a1, _QWORD *a2, int *a3)
{
  uint64_t *result;
  uint64_t *v4;
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  int v9;
  int v10;

  v5 = *(uint64_t **)(a1 + 8);
  result = (uint64_t *)(a1 + 8);
  v4 = v5;
  if (v5)
  {
    v6 = *a3;
    v7 = a3[1];
    while (1)
    {
      while (1)
      {
        v8 = v4;
        v9 = *((_DWORD *)v4 + 7);
        if (v6 >= v9)
          break;
LABEL_4:
        v4 = (uint64_t *)*v8;
        result = v8;
        if (!*v8)
          goto LABEL_12;
      }
      if (v9 >= v6)
      {
        v10 = *((_DWORD *)v8 + 8);
        if (v7 < v10)
          goto LABEL_4;
        if (v10 >= v7)
          goto LABEL_12;
      }
      result = v8 + 1;
      v4 = (uint64_t *)v8[1];
      if (!v4)
        goto LABEL_12;
    }
  }
  v8 = result;
LABEL_12:
  *a2 = v8;
  return result;
}

uint64_t *std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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

_QWORD *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>>(uint64_t a1, _QWORD *a2, _QWORD *a3, char **a4)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v14;
  __int16 v15;
  char **v16;

  v4 = a2;
  v16 = a4;
  if (a2 == a3)
    return a2;
  v5 = a3;
  do
  {
    v14 = *(_QWORD *)((char *)v4 + 28);
    _S0 = *((_DWORD *)v4 + 9);
    __asm { FCVT            H0, S0 }
    v15 = _S0;
    std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>::operator=[abi:nn180100](&v16, &v14);
    v11 = (_QWORD *)v4[1];
    if (v11)
    {
      do
      {
        v12 = v11;
        v11 = (_QWORD *)*v11;
      }
      while (v11);
    }
    else
    {
      do
      {
        v12 = (_QWORD *)v4[2];
        _ZF = *v12 == (_QWORD)v4;
        v4 = v12;
      }
      while (!_ZF);
    }
    v4 = v12;
  }
  while (v12 != v5);
  return v5;
}

char ***std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>::operator=[abi:nn180100](char ***a1, uint64_t *a2)
{
  char **v4;
  unint64_t v5;
  char **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  int v23;

  v4 = *a1;
  v5 = (unint64_t)(*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if (v5 >= v9)
  {
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (_QWORD)*v4) >> 2);
    v13 = v12 + 1;
    if (v12 + 1 > 0x1555555555555555)
      abort();
    v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - (_QWORD)*v4) >> 2);
    if (2 * v14 > v13)
      v13 = 2 * v14;
    if (v14 >= 0xAAAAAAAAAAAAAAALL)
      v15 = 0x1555555555555555;
    else
      v15 = v13;
    if (v15)
      v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<std::pair<int,int>,half>>>(v7, v15);
    else
      v16 = 0;
    v17 = &v16[12 * v12];
    v18 = &v16[12 * v15];
    v19 = *a2;
    *((_DWORD *)v17 + 2) = *((_DWORD *)a2 + 2);
    *(_QWORD *)v17 = v19;
    v11 = v17 + 12;
    v21 = *v4;
    v20 = v4[1];
    if (v20 != *v4)
    {
      do
      {
        v22 = *(_QWORD *)(v20 - 12);
        v20 -= 12;
        v23 = *((_DWORD *)v20 + 2);
        *(_QWORD *)(v17 - 12) = v22;
        v17 -= 12;
        *((_DWORD *)v17 + 2) = v23;
      }
      while (v20 != v21);
      v20 = *v4;
    }
    *v4 = v17;
    v4[1] = v11;
    v4[2] = v18;
    if (v20)
      operator delete(v20);
  }
  else
  {
    v10 = *a2;
    *(_DWORD *)(v5 + 8) = *((_DWORD *)a2 + 2);
    *(_QWORD *)v5 = v10;
    v11 = (char *)(v5 + 12);
  }
  v4[1] = v11;
  return a1;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<std::pair<int,int>,half>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(12 * a2);
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,false>(uint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  unint64_t k;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v22;
  uint64_t v23;
  int v24;
  int v28;
  unint64_t v29;
  unint64_t n;
  unint64_t v37;
  int v38;
  int v39;
  __int16 v40;
  BOOL v45;
  int v46;
  int v49;
  int *v54;
  int *m;
  int v57;
  int v58;
  int v59;
  __int16 v60;
  int v69;
  int v70;
  _DWORD *v71;
  BOOL v73;
  uint64_t v74;
  _DWORD *v75;
  _DWORD *v76;
  int v81;
  int v82;
  int v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v89;
  uint64_t v90;
  int v91;
  int64_t v92;
  int64_t v93;
  int64_t v94;
  uint64_t v95;
  unint64_t v96;
  int v101;
  unint64_t v102;
  int v107;
  int v108;
  int v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v117;
  int v120;
  int64_t v121;
  uint64_t v122;
  int v123;
  unsigned int v124;
  __int16 v125;
  unsigned int *v126;
  unsigned int *v127;
  uint64_t v128;
  int64_t v129;
  int v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  int *v138;
  int v143;
  signed int v144;
  unint64_t i;
  uint64_t v148;
  int v153;
  int v154;
  unint64_t j;
  int v156;
  int v158;
  int v159;

  v7 = result;
LABEL_2:
  k = v7;
  while (2)
  {
    v7 = k;
    v9 = a2 - k;
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - k) >> 2);
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        _H0 = *(_WORD *)(a2 - 4);
        _H1 = *(_WORD *)(k + 8);
        __asm
        {
          FCVT            S2, H1
          FCVT            S3, H0
        }
        if (_S3 == _S2)
        {
          v70 = *(_DWORD *)(a2 - 12);
          v69 = *(_DWORD *)k;
          if (v70 >= *(_DWORD *)k && (v69 < v70 || *(_DWORD *)(a2 - 8) >= *(_DWORD *)(k + 4)))
            return result;
        }
        else
        {
          if (_S3 <= _S2)
            return result;
          v69 = *(_DWORD *)k;
          v70 = *(_DWORD *)(a2 - 12);
        }
        *(_DWORD *)k = v70;
        *(_DWORD *)(a2 - 12) = v69;
        v159 = *(_DWORD *)(k + 4);
        *(_DWORD *)(k + 4) = *(_DWORD *)(a2 - 8);
        *(_DWORD *)(a2 - 8) = v159;
        *(_WORD *)(k + 8) = _H0;
        *(_WORD *)(a2 - 4) = _H1;
        return result;
      case 3uLL:
        return (uint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((int *)k, (int *)(k + 12), (int *)(a2 - 12));
      case 4uLL:
        return (uint64_t)std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(k, k + 12, k + 24, a2 - 12);
      case 5uLL:
        return (uint64_t)std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,0>(k, k + 12, k + 24, k + 36, (int *)(a2 - 12));
      default:
        if (v9 <= 287)
        {
          v71 = (_DWORD *)(k + 12);
          v73 = k == a2 || v71 == (_DWORD *)a2;
          if ((a4 & 1) == 0)
          {
            if (v73)
              return result;
            for (i = k + 4; ; i += 12)
            {
              v148 = v7;
              v7 = (uint64_t)v71;
              _H0 = *(_WORD *)(v148 + 20);
              _H1 = *(_WORD *)(v148 + 8);
              __asm
              {
                FCVT            S3, H1
                FCVT            S2, H0
              }
              if (_S2 == _S3)
                break;
              if (_S2 > _S3)
              {
                v153 = *v71;
LABEL_243:
                v154 = *(_DWORD *)(v148 + 16);
                for (j = i; ; j -= 12)
                {
                  v156 = *(_DWORD *)j;
                  *(_DWORD *)(j + 8) = *(_DWORD *)(j - 4);
                  *(_DWORD *)(j + 12) = v156;
                  *(_WORD *)(j + 16) = _H1;
                  _H1 = *(_WORD *)(j - 8);
                  __asm { FCVT            S3, H1 }
                  if (_S2 == _S3)
                  {
                    v158 = *(_DWORD *)(j - 16);
                    if (v153 >= v158 && (v158 < v153 || v154 >= *(_DWORD *)(j - 12)))
                    {
LABEL_251:
                      *(_DWORD *)(j - 4) = v153;
                      *(_DWORD *)j = v154;
                      *(_WORD *)(j + 4) = _H0;
                      break;
                    }
                  }
                  else if (_S2 <= _S3)
                  {
                    goto LABEL_251;
                  }
                }
              }
LABEL_252:
              v71 = (_DWORD *)(v7 + 12);
              if (v7 + 12 == a2)
                return result;
            }
            v153 = *v71;
            if (*v71 >= *(_DWORD *)v148 && (*(_DWORD *)v148 < v153 || *(_DWORD *)(v148 + 16) >= *(_DWORD *)(v148 + 4)))
              goto LABEL_252;
            goto LABEL_243;
          }
          if (v73)
            return result;
          v74 = 0;
          v75 = (_DWORD *)k;
LABEL_141:
          v76 = v75;
          v75 = v71;
          _H0 = *((_WORD *)v76 + 10);
          _H2 = *((_WORD *)v76 + 4);
          __asm
          {
            FCVT            S3, H2
            FCVT            S1, H0
          }
          if (_S1 == _S3)
          {
            v81 = *v71;
            v82 = *v76;
            if (v81 >= *v76 && (v82 < v81 || v76[4] >= v76[1]))
              goto LABEL_159;
          }
          else
          {
            if (_S1 <= _S3)
              goto LABEL_159;
            v81 = *v71;
            v82 = *v76;
          }
          v83 = v76[4];
          v76[3] = v82;
          v75[1] = v76[1];
          *((_WORD *)v75 + 4) = _H2;
          v84 = k;
          if (v76 == (_DWORD *)k)
            goto LABEL_158;
          v85 = v74;
          while (1)
          {
            v86 = k + v85;
            _H2 = *(_WORD *)(k + v85 - 4);
            __asm { FCVT            S3, H2 }
            if (_S1 == _S3)
            {
              v89 = *(_DWORD *)(v86 - 12);
              if (v81 >= v89)
              {
                if (v89 < v81)
                {
                  v84 = k + v85;
LABEL_158:
                  *(_DWORD *)v84 = v81;
                  *(_DWORD *)(v84 + 4) = v83;
                  *(_WORD *)(v84 + 8) = _H0;
LABEL_159:
                  v71 = v75 + 3;
                  v74 += 12;
                  if (v75 + 3 == (_DWORD *)a2)
                    return result;
                  goto LABEL_141;
                }
                if (v83 >= *(_DWORD *)(k + v85 - 8))
                {
LABEL_157:
                  v84 = (unint64_t)v76;
                  goto LABEL_158;
                }
              }
            }
            else
            {
              if (_S1 <= _S3)
                goto LABEL_157;
              v89 = *(_DWORD *)(v86 - 12);
            }
            v90 = k + v85;
            v91 = *(_DWORD *)(k + v85 - 8);
            v76 -= 3;
            *(_DWORD *)v90 = v89;
            *(_DWORD *)(v90 + 4) = v91;
            *(_WORD *)(v90 + 8) = _H2;
            v85 -= 12;
            if (!v85)
            {
              v84 = k;
              goto LABEL_158;
            }
          }
        }
        if (!a3)
        {
          if (k == a2)
            return result;
          v92 = (v10 - 2) >> 1;
          v93 = v92;
          while (1)
          {
            v94 = v93;
            if (v92 < v93)
              goto LABEL_197;
            v95 = (2 * v93) | 1;
            v96 = k + 12 * v95;
            if (2 * v94 + 2 >= (uint64_t)v10)
              goto LABEL_171;
            _H0 = *(_WORD *)(k + 12 * v95 + 8);
            _H1 = *(_WORD *)(v96 + 20);
            __asm
            {
              FCVT            S0, H0
              FCVT            S1, H1
            }
            if (_S0 == _S1)
            {
              v101 = *(_DWORD *)(v96 + 12);
              if (*(_DWORD *)v96 >= v101 && (v101 < *(_DWORD *)v96 || *(_DWORD *)(v96 + 4) >= *(_DWORD *)(v96 + 16)))
                goto LABEL_171;
            }
            else if (_S0 <= _S1)
            {
              goto LABEL_171;
            }
            v96 += 12;
            v95 = 2 * v94 + 2;
LABEL_171:
            v102 = k + 12 * v94;
            _H2 = *(_WORD *)(v96 + 8);
            _H0 = *(_WORD *)(v102 + 8);
            __asm
            {
              FCVT            S1, H0
              FCVT            S3, H2
            }
            if (_S3 == _S1)
            {
              v108 = *(_DWORD *)v96;
              v107 = *(_DWORD *)v102;
              if (*(_DWORD *)v96 < *(_DWORD *)v102 || v107 >= v108 && *(_DWORD *)(v96 + 4) < *(_DWORD *)(v102 + 4))
                goto LABEL_197;
            }
            else
            {
              if (_S3 > _S1)
                goto LABEL_197;
              v107 = *(_DWORD *)v102;
              v108 = *(_DWORD *)v96;
            }
            v109 = *(_DWORD *)(v102 + 4);
            *(_DWORD *)v102 = v108;
            *(_DWORD *)(v102 + 4) = *(_DWORD *)(v96 + 4);
            *(_WORD *)(v102 + 8) = _H2;
            while (1)
            {
              if (v92 < v95)
                goto LABEL_196;
              v110 = v96;
              v111 = 2 * v95;
              v95 = (2 * v95) | 1;
              v96 = k + 12 * v95;
              v112 = v111 + 2;
              if (v112 < (uint64_t)v10)
              {
                _H2 = *(_WORD *)(k + 12 * v95 + 8);
                _H3 = *(_WORD *)(v96 + 20);
                __asm
                {
                  FCVT            S2, H2
                  FCVT            S3, H3
                }
                if (_S2 == _S3)
                {
                  v117 = *(_DWORD *)(v96 + 12);
                  if (*(_DWORD *)v96 < v117 || v117 >= *(_DWORD *)v96 && *(_DWORD *)(v96 + 4) < *(_DWORD *)(v96 + 16))
                  {
LABEL_184:
                    v96 += 12;
                    v95 = v112;
                  }
                }
                else if (_S2 > _S3)
                {
                  goto LABEL_184;
                }
              }
              _H2 = *(_WORD *)(v96 + 8);
              __asm { FCVT            S3, H2 }
              if (_S3 == _S1)
                break;
              if (_S3 > _S1)
                goto LABEL_195;
              v120 = *(_DWORD *)v96;
LABEL_191:
              *(_DWORD *)v110 = v120;
              *(_DWORD *)(v110 + 4) = *(_DWORD *)(v96 + 4);
              *(_WORD *)(v110 + 8) = _H2;
            }
            v120 = *(_DWORD *)v96;
            if (*(_DWORD *)v96 >= v107 && (v107 < v120 || *(_DWORD *)(v96 + 4) >= v109))
              goto LABEL_191;
LABEL_195:
            v96 = v110;
LABEL_196:
            *(_DWORD *)v96 = v107;
            *(_DWORD *)(v96 + 4) = v109;
            *(_WORD *)(v96 + 8) = _H0;
LABEL_197:
            v93 = v94 - 1;
            if (!v94)
            {
              v121 = v9 / 0xCuLL;
              while (1)
              {
                v122 = 0;
                v123 = *(_DWORD *)k;
                v124 = *(_DWORD *)(k + 4);
                v125 = *(_WORD *)(k + 8);
                v126 = (unsigned int *)k;
                do
                {
                  v127 = v126;
                  result = v122 + 1;
                  v126 += 3 * v122 + 3;
                  v128 = 2 * v122;
                  v122 = (2 * v122) | 1;
                  v129 = v128 + 2;
                  if (v129 >= v121)
                    goto LABEL_211;
                  result = (uint64_t)&v127[3 * result];
                  _H1 = *(_WORD *)(result + 8);
                  _H2 = *((_WORD *)v126 + 10);
                  __asm
                  {
                    FCVT            S1, H1
                    FCVT            S2, H2
                  }
                  if (_S1 == _S2)
                  {
                    result = *v126;
                    v134 = v126[3];
                    if ((int)result < v134 || v134 >= (int)result && (result = v126[1], (int)result < (int)v126[4]))
                    {
LABEL_210:
                      v126 += 3;
                      v122 = v129;
                    }
                  }
                  else if (_S1 > _S2)
                  {
                    goto LABEL_210;
                  }
LABEL_211:
                  *v127 = *v126;
                  v127[1] = v126[1];
                  *((_WORD *)v127 + 4) = *((_WORD *)v126 + 4);
                }
                while (v122 <= (uint64_t)((unint64_t)(v121 - 2) >> 1));
                if (v126 == (unsigned int *)(a2 - 12))
                {
                  *v126 = v123;
                  v126[1] = v124;
                  *((_WORD *)v126 + 4) = v125;
                }
                else
                {
                  *v126 = *(_DWORD *)(a2 - 12);
                  v126[1] = *(_DWORD *)(a2 - 8);
                  *((_WORD *)v126 + 4) = *(_WORD *)(a2 - 4);
                  *(_DWORD *)(a2 - 12) = v123;
                  *(_DWORD *)(a2 - 8) = v124;
                  *(_WORD *)(a2 - 4) = v125;
                  v135 = (uint64_t)v126 - k + 12;
                  if (v135 >= 13)
                  {
                    v136 = v135 / 0xCuLL - 2;
                    v137 = v136 >> 1;
                    v138 = (int *)(k + 12 * (v136 >> 1));
                    _H2 = *((_WORD *)v138 + 4);
                    _H0 = *((_WORD *)v126 + 4);
                    __asm
                    {
                      FCVT            S3, H2
                      FCVT            S1, H0
                    }
                    if (_S3 == _S1)
                    {
                      result = *v138;
                      v143 = *v126;
                      if ((int)result < (int)*v126 || v143 >= (int)result && v138[1] < (int)v126[1])
                        goto LABEL_219;
                    }
                    else if (_S3 > _S1)
                    {
                      v143 = *v126;
                      LODWORD(result) = *v138;
LABEL_219:
                      v144 = v126[1];
                      do
                      {
                        while (1)
                        {
                          *v126 = result;
                          result = v138[1];
                          v126[1] = result;
                          *((_WORD *)v126 + 4) = _H2;
                          if (v136 < 2)
                            goto LABEL_228;
                          v126 = (unsigned int *)v138;
                          v136 = v137 - 1;
                          v137 = (v137 - 1) >> 1;
                          v138 = (int *)(k + 12 * v137);
                          _H2 = *((_WORD *)v138 + 4);
                          __asm { FCVT            S3, H2 }
                          if (_S3 == _S1)
                            break;
                          if (_S3 <= _S1)
                            goto LABEL_227;
                          LODWORD(result) = *v138;
                        }
                        result = *v138;
                      }
                      while ((int)result < v143 || v143 >= (int)result && v138[1] < v144);
LABEL_227:
                      v138 = (int *)v126;
LABEL_228:
                      *v138 = v143;
                      v138[1] = v144;
                      *((_WORD *)v138 + 4) = _H0;
                    }
                  }
                }
                a2 -= 12;
                if (v121-- <= 2)
                  return result;
              }
            }
          }
        }
        v11 = v10 >> 1;
        v12 = (int *)(k + 12 * (v10 >> 1));
        if ((unint64_t)v9 < 0x601)
        {
          result = (uint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((int *)(v7 + 12 * (v10 >> 1)), (int *)v7, (int *)(a2 - 12));
        }
        else
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((int *)v7, (int *)(v7 + 12 * (v10 >> 1)), (int *)(a2 - 12));
          v13 = v7 + 12 * v11;
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((int *)(v7 + 12), (int *)(v13 - 12), (int *)(a2 - 24));
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((int *)(v7 + 24), (int *)(v7 + 12 + 12 * v11), (int *)(a2 - 36));
          result = (uint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((int *)(v13 - 12), v12, (int *)(v7 + 12 + 12 * v11));
          v14 = *(_QWORD *)v7;
          *(_QWORD *)v7 = *(_QWORD *)v12;
          *(_QWORD *)v12 = v14;
          LOWORD(v14) = *(_WORD *)(v7 + 8);
          *(_WORD *)(v7 + 8) = *(_WORD *)(v13 + 8);
          *(_WORD *)(v13 + 8) = v14;
        }
        --a3;
        if ((a4 & 1) == 0)
        {
          _H2 = *(_WORD *)(v7 - 4);
          _H0 = *(_WORD *)(v7 + 8);
          __asm
          {
            FCVT            S1, H0
            FCVT            S2, H2
          }
          if (_S2 == _S1)
          {
            v22 = *(_DWORD *)(v7 - 12);
            v15 = *(_DWORD *)v7;
            if (v22 < *(_DWORD *)v7 || v15 >= v22 && *(_DWORD *)(v7 - 8) < *(_DWORD *)(v7 + 4))
              goto LABEL_17;
          }
          else
          {
            v15 = *(_DWORD *)v7;
            if (_S2 > _S1)
              goto LABEL_17;
          }
          v46 = *(_DWORD *)(v7 + 4);
          _H2 = *(_WORD *)(a2 - 4);
          __asm { FCVT            S3, H2 }
          if (_S1 == _S3)
          {
            v49 = *(_DWORD *)(a2 - 12);
            if (v15 < v49 || v49 >= v15 && v46 < *(_DWORD *)(a2 - 8))
            {
LABEL_79:
              for (k = v7 + 12; ; k += 12)
              {
                _H3 = *(_WORD *)(k + 8);
                __asm { FCVT            S3, H3 }
                if (_S1 == _S3)
                {
                  if (v15 < *(_DWORD *)k || *(_DWORD *)k >= v15 && v46 < *(_DWORD *)(k + 4))
                    goto LABEL_96;
                }
                else if (_S1 > _S3)
                {
                  goto LABEL_96;
                }
              }
            }
          }
          else if (_S1 > _S3)
          {
            goto LABEL_79;
          }
          for (k = v7 + 12; k < a2; k += 12)
          {
            _H3 = *(_WORD *)(k + 8);
            __asm { FCVT            S3, H3 }
            if (_S1 == _S3)
            {
              if (v15 < *(_DWORD *)k || *(_DWORD *)k >= v15 && v46 < *(_DWORD *)(k + 4))
                break;
            }
            else if (_S1 > _S3)
            {
              break;
            }
          }
LABEL_96:
          v54 = (int *)a2;
          if (k >= a2)
            goto LABEL_119;
          for (m = (int *)(a2 - 8); ; m -= 3)
          {
            __asm { FCVT            S2, H2 }
            if (_S1 == _S2)
              break;
            if (_S1 <= _S2)
              goto LABEL_105;
LABEL_104:
            _H2 = *((_WORD *)m - 4);
          }
          v57 = *(m - 1);
          if (v15 < v57 || v57 >= v15 && v46 < *m)
            goto LABEL_104;
LABEL_105:
          v54 = m - 1;
LABEL_119:
          while (k < (unint64_t)v54)
          {
            v58 = *(_DWORD *)k;
            *(_DWORD *)k = *v54;
            *v54 = v58;
            v59 = *(_DWORD *)(k + 4);
            *(_DWORD *)(k + 4) = v54[1];
            v54[1] = v59;
            v60 = *(_WORD *)(k + 8);
            *(_WORD *)(k + 8) = *((_WORD *)v54 + 4);
            *((_WORD *)v54 + 4) = v60;
            do
            {
              while (1)
              {
                k += 12;
                _H2 = *(_WORD *)(k + 8);
                __asm { FCVT            S2, H2 }
                if (_S1 == _S2)
                  break;
                if (_S1 > _S2)
                  goto LABEL_117;
              }
            }
            while (v15 >= *(_DWORD *)k && (*(_DWORD *)k < v15 || v46 >= *(_DWORD *)(k + 4)));
            do
            {
LABEL_117:
              while (1)
              {
                v54 -= 3;
                _H2 = *((_WORD *)v54 + 4);
                __asm { FCVT            S2, H2 }
                if (_S1 == _S2)
                  break;
                if (_S1 <= _S2)
                  goto LABEL_119;
              }
            }
            while (v15 < *v54 || *v54 >= v15 && v46 < v54[1]);
          }
          if (k - 12 != v7)
          {
            *(_DWORD *)v7 = *(_DWORD *)(k - 12);
            *(_DWORD *)(v7 + 4) = *(_DWORD *)(k - 8);
            *(_WORD *)(v7 + 8) = *(_WORD *)(k - 4);
          }
          a4 = 0;
          *(_DWORD *)(k - 12) = v15;
          *(_DWORD *)(k - 8) = v46;
          *(_WORD *)(k - 4) = _H0;
          continue;
        }
        v15 = *(_DWORD *)v7;
        _H0 = *(_WORD *)(v7 + 8);
LABEL_17:
        v23 = 0;
        v24 = *(_DWORD *)(v7 + 4);
        while (1)
        {
          _H1 = *(_WORD *)(v7 + v23 + 20);
          __asm
          {
            FCVT            S2, H1
            FCVT            S1, H0
          }
          if (_S2 == _S1)
            break;
          if (_S2 <= _S1)
            goto LABEL_25;
LABEL_24:
          v23 += 12;
        }
        v28 = *(_DWORD *)(v7 + v23 + 12);
        if (v28 < v15 || v15 >= v28 && *(_DWORD *)(v7 + v23 + 16) < v24)
          goto LABEL_24;
LABEL_25:
        v29 = v7 + v23 + 12;
        n = a2 - 12;
        if (v23)
        {
          while (1)
          {
            _H2 = *(_WORD *)(n + 8);
            __asm { FCVT            S2, H2 }
            if (_S2 == _S1)
            {
              if (*(_DWORD *)n < v15 || v15 >= *(_DWORD *)n && *(_DWORD *)(n + 4) < v24)
                goto LABEL_51;
            }
            else if (_S2 > _S1)
            {
              goto LABEL_51;
            }
            n -= 12;
          }
        }
        n = a2;
        if (v29 < a2)
        {
          for (n = a2 - 12; ; n -= 12)
          {
            _H2 = *(_WORD *)(n + 8);
            __asm { FCVT            S2, H2 }
            if (_S2 == _S1)
            {
              if (*(_DWORD *)n < v15)
                break;
              if (v15 >= *(_DWORD *)n)
              {
                if (*(_DWORD *)(n + 4) < v24 || v29 >= n)
                  break;
              }
              else if (v29 >= n)
              {
                break;
              }
            }
            else if (_S2 > _S1 || v29 >= n)
            {
              break;
            }
          }
        }
LABEL_51:
        k = v7 + v23 + 12;
        if (v29 < n)
        {
          v37 = n;
          do
          {
            v38 = *(_DWORD *)k;
            *(_DWORD *)k = *(_DWORD *)v37;
            *(_DWORD *)v37 = v38;
            v39 = *(_DWORD *)(k + 4);
            *(_DWORD *)(k + 4) = *(_DWORD *)(v37 + 4);
            *(_DWORD *)(v37 + 4) = v39;
            v40 = *(_WORD *)(k + 8);
            *(_WORD *)(k + 8) = *(_WORD *)(v37 + 8);
            *(_WORD *)(v37 + 8) = v40;
            do
            {
              while (1)
              {
                k += 12;
                _H2 = *(_WORD *)(k + 8);
                __asm { FCVT            S2, H2 }
                if (_S2 == _S1)
                  break;
                if (_S2 <= _S1)
                  goto LABEL_64;
              }
            }
            while (*(_DWORD *)k < v15 || v15 >= *(_DWORD *)k && *(_DWORD *)(k + 4) < v24);
            do
            {
LABEL_64:
              while (1)
              {
                v37 -= 12;
                _H2 = *(_WORD *)(v37 + 8);
                __asm { FCVT            S2, H2 }
                if (_S2 == _S1)
                  break;
                if (_S2 > _S1)
                  goto LABEL_66;
              }
            }
            while (*(_DWORD *)v37 >= v15 && (v15 < *(_DWORD *)v37 || *(_DWORD *)(v37 + 4) >= v24));
LABEL_66:
            ;
          }
          while (k < v37);
        }
        if (k - 12 != v7)
        {
          *(_DWORD *)v7 = *(_DWORD *)(k - 12);
          *(_DWORD *)(v7 + 4) = *(_DWORD *)(k - 8);
          *(_WORD *)(v7 + 8) = *(_WORD *)(k - 4);
        }
        *(_DWORD *)(k - 12) = v15;
        *(_DWORD *)(k - 8) = v24;
        *(_WORD *)(k - 4) = _H0;
        if (v29 < n)
        {
LABEL_72:
          result = std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,false>(v7, k - 12, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v45 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(v7, k - 12);
        result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(k, a2);
        if (!(_DWORD)result)
        {
          if (v45)
            continue;
          goto LABEL_72;
        }
        a2 = k - 12;
        if (!v45)
          goto LABEL_2;
        return result;
    }
  }
}

int *std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5)
{
  int *result;
  int v19;
  int v20;
  int v21;
  int v26;
  int v27;
  int v28;
  int v33;
  int v34;
  int v35;
  int v40;
  int v41;
  int v42;

  result = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(a1, a2, a3, a4);
  _H0 = *((_WORD *)a5 + 4);
  _H1 = *(_WORD *)(a4 + 8);
  __asm
  {
    FCVT            S2, H1
    FCVT            S3, H0
  }
  if (_S3 == _S2)
  {
    v20 = *a5;
    v19 = *(_DWORD *)a4;
    if (*a5 >= *(_DWORD *)a4 && (v19 < v20 || a5[1] >= *(_DWORD *)(a4 + 4)))
      return result;
  }
  else
  {
    if (_S3 <= _S2)
      return result;
    v19 = *(_DWORD *)a4;
    v20 = *a5;
  }
  *(_DWORD *)a4 = v20;
  *a5 = v19;
  v21 = *(_DWORD *)(a4 + 4);
  *(_DWORD *)(a4 + 4) = a5[1];
  a5[1] = v21;
  *(_WORD *)(a4 + 8) = _H0;
  *((_WORD *)a5 + 4) = _H1;
  _H0 = *(_WORD *)(a4 + 8);
  _H1 = *(_WORD *)(a3 + 8);
  __asm
  {
    FCVT            S2, H1
    FCVT            S3, H0
  }
  if (_S3 == _S2)
  {
    v27 = *(_DWORD *)a4;
    v26 = *(_DWORD *)a3;
    if (*(_DWORD *)a4 >= *(_DWORD *)a3 && (v26 < v27 || *(_DWORD *)(a4 + 4) >= *(_DWORD *)(a3 + 4)))
      return result;
  }
  else
  {
    if (_S3 <= _S2)
      return result;
    v26 = *(_DWORD *)a3;
    v27 = *(_DWORD *)a4;
  }
  *(_DWORD *)a3 = v27;
  *(_DWORD *)a4 = v26;
  v28 = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = *(_DWORD *)(a4 + 4);
  *(_DWORD *)(a4 + 4) = v28;
  *(_WORD *)(a3 + 8) = _H0;
  *(_WORD *)(a4 + 8) = _H1;
  _H0 = *(_WORD *)(a3 + 8);
  _H1 = *(_WORD *)(a2 + 8);
  __asm
  {
    FCVT            S2, H1
    FCVT            S3, H0
  }
  if (_S3 == _S2)
  {
    v34 = *(_DWORD *)a3;
    v33 = *(_DWORD *)a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (v33 < v34 || *(_DWORD *)(a3 + 4) >= *(_DWORD *)(a2 + 4)))
      return result;
  }
  else
  {
    if (_S3 <= _S2)
      return result;
    v33 = *(_DWORD *)a2;
    v34 = *(_DWORD *)a3;
  }
  *(_DWORD *)a2 = v34;
  *(_DWORD *)a3 = v33;
  v35 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = v35;
  *(_WORD *)(a2 + 8) = _H0;
  *(_WORD *)(a3 + 8) = _H1;
  _H0 = *(_WORD *)(a2 + 8);
  _H1 = *(_WORD *)(a1 + 8);
  __asm
  {
    FCVT            S2, H1
    FCVT            S3, H0
  }
  if (_S3 != _S2)
  {
    if (_S3 <= _S2)
      return result;
    v40 = *(_DWORD *)a1;
    v41 = *(_DWORD *)a2;
    goto LABEL_25;
  }
  v41 = *(_DWORD *)a2;
  v40 = *(_DWORD *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1 || v40 >= v41 && *(_DWORD *)(a2 + 4) < *(_DWORD *)(a1 + 4))
  {
LABEL_25:
    *(_DWORD *)a1 = v41;
    *(_DWORD *)a2 = v40;
    v42 = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
    *(_DWORD *)(a2 + 4) = v42;
    *(_WORD *)(a1 + 8) = _H0;
    *(_WORD *)(a2 + 8) = _H1;
  }
  return result;
}

int *std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(int *result, int *a2, int *a3)
{
  int v13;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v26;
  int v27;
  int v28;
  int v29;
  int v32;
  int v33;
  int v34;
  int v35;

  _H1 = *((_WORD *)a2 + 4);
  _H0 = *((_WORD *)result + 4);
  __asm
  {
    FCVT            S2, H0
    FCVT            S4, H1
  }
  if (_S4 == _S2)
  {
    if (*a2 >= *result && (*result < *a2 || a2[1] >= result[1]))
      goto LABEL_10;
LABEL_7:
    _H3 = *((_WORD *)a3 + 4);
    __asm { FCVT            S5, H3 }
    if (_S5 == _S4)
    {
      v13 = *a3;
      v18 = *a2;
      if (*a3 < *a2 || v18 >= v13 && a3[1] < a2[1])
        goto LABEL_14;
    }
    else
    {
      if (_S5 > _S4)
      {
        v13 = *a3;
LABEL_14:
        v19 = *result;
        *result = v13;
        *a3 = v19;
        v20 = result[1];
        result[1] = a3[1];
        a3[1] = v20;
        *((_WORD *)result + 4) = _H3;
        goto LABEL_35;
      }
      v18 = *a2;
    }
    v28 = *result;
    *result = v18;
    *a2 = v28;
    v29 = result[1];
    result[1] = a2[1];
    a2[1] = v29;
    *((_WORD *)result + 4) = _H1;
    *((_WORD *)a2 + 4) = _H0;
    _H1 = *((_WORD *)a3 + 4);
    __asm { FCVT            S3, H1 }
    if (_S3 == _S2)
    {
      v33 = *a3;
      v32 = *a2;
      if (*a3 >= *a2 && (v32 < v33 || a3[1] >= v29))
        return result;
    }
    else
    {
      if (_S3 <= _S2)
        return result;
      v32 = *a2;
      v33 = *a3;
    }
    *a2 = v33;
    *a3 = v32;
    v35 = a2[1];
    a2[1] = a3[1];
    a3[1] = v35;
    *((_WORD *)a2 + 4) = _H1;
LABEL_35:
    *((_WORD *)a3 + 4) = _H0;
    return result;
  }
  if (_S4 > _S2)
    goto LABEL_7;
LABEL_10:
  _H0 = *((_WORD *)a3 + 4);
  __asm { FCVT            S2, H0 }
  if (_S2 == _S4)
  {
    v17 = *a3;
    v16 = *a2;
    if (*a3 >= *a2 && (v16 < v17 || a3[1] >= a2[1]))
      return result;
  }
  else
  {
    if (_S2 <= _S4)
      return result;
    v16 = *a2;
    v17 = *a3;
  }
  *a2 = v17;
  *a3 = v16;
  v21 = a2[1];
  a2[1] = a3[1];
  a3[1] = v21;
  *((_WORD *)a2 + 4) = _H0;
  *((_WORD *)a3 + 4) = _H1;
  _H0 = *((_WORD *)a2 + 4);
  _H1 = *((_WORD *)result + 4);
  __asm
  {
    FCVT            S2, H1
    FCVT            S3, H0
  }
  if (_S3 != _S2)
  {
    if (_S3 <= _S2)
      return result;
    v26 = *result;
    v27 = *a2;
    goto LABEL_30;
  }
  v27 = *a2;
  v26 = *result;
  if (*a2 < *result || v26 >= v27 && a2[1] < result[1])
  {
LABEL_30:
    *result = v27;
    *a2 = v26;
    v34 = result[1];
    result[1] = a2[1];
    a2[1] = v34;
    *((_WORD *)result + 4) = _H0;
    *((_WORD *)a2 + 4) = _H1;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v32;
  uint64_t v33;
  int v34;

  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 2);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      _H0 = *(_WORD *)(a2 - 4);
      _H1 = *(_WORD *)(a1 + 8);
      __asm
      {
        FCVT            S2, H1
        FCVT            S3, H0
      }
      if (_S3 != _S2)
      {
        if (_S3 <= _S2)
          return result;
        v14 = *(_DWORD *)a1;
        v15 = *(_DWORD *)(a2 - 12);
        goto LABEL_36;
      }
      v15 = *(_DWORD *)(a2 - 12);
      v14 = *(_DWORD *)a1;
      if (v15 < *(_DWORD *)a1 || v14 >= v15 && *(_DWORD *)(a2 - 8) < *(_DWORD *)(a1 + 4))
      {
LABEL_36:
        *(_DWORD *)a1 = v15;
        *(_DWORD *)(a2 - 12) = v14;
        v34 = *(_DWORD *)(a1 + 4);
        *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 - 8);
        *(_DWORD *)(a2 - 8) = v34;
        *(_WORD *)(a1 + 8) = _H0;
        *(_WORD *)(a2 - 4) = _H1;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((int *)a1, (int *)(a1 + 12), (int *)(a2 - 12));
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(a1, a1 + 12, a1 + 24, a2 - 12);
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*,0>(a1, a1 + 12, a1 + 24, a1 + 36, (int *)(a2 - 12));
      return 1;
    default:
      v16 = a1 + 24;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((int *)a1, (int *)(a1 + 12), (int *)(a1 + 24));
      v17 = a1 + 36;
      if (a1 + 36 == a2)
        return 1;
      v18 = 0;
      v19 = 0;
      break;
  }
LABEL_7:
  _H0 = *(_WORD *)(v17 + 8);
  _H2 = *(_WORD *)(v16 + 8);
  __asm
  {
    FCVT            S3, H2
    FCVT            S1, H0
  }
  if (_S1 == _S3)
  {
    v24 = *(_DWORD *)v17;
    v25 = *(_DWORD *)v16;
    if (*(_DWORD *)v17 >= *(_DWORD *)v16 && (v25 < v24 || *(_DWORD *)(v17 + 4) >= *(_DWORD *)(v16 + 4)))
      goto LABEL_26;
  }
  else
  {
    if (_S1 <= _S3)
      goto LABEL_26;
    v24 = *(_DWORD *)v17;
    v25 = *(_DWORD *)v16;
  }
  v26 = *(_DWORD *)(v17 + 4);
  *(_DWORD *)v17 = v25;
  *(_DWORD *)(v17 + 4) = *(_DWORD *)(v16 + 4);
  *(_WORD *)(v17 + 8) = _H2;
  v27 = a1;
  if (v16 == a1)
    goto LABEL_25;
  v28 = v18;
  while (1)
  {
    v29 = a1 + v28;
    _H2 = *(_WORD *)(a1 + v28 + 20);
    __asm { FCVT            S3, H2 }
    if (_S1 == _S3)
    {
      v32 = *(_DWORD *)(v29 + 12);
      if (v24 >= v32 && (v32 < v24 || v26 >= *(_DWORD *)(a1 + v28 + 16)))
      {
        v27 = v16;
LABEL_25:
        *(_DWORD *)v27 = v24;
        *(_DWORD *)(v27 + 4) = v26;
        *(_WORD *)(v27 + 8) = _H0;
        if (++v19 == 8)
          return v17 + 12 == a2;
LABEL_26:
        v16 = v17;
        v18 += 12;
        v17 += 12;
        if (v17 == a2)
          return 1;
        goto LABEL_7;
      }
    }
    else
    {
      if (_S1 <= _S3)
      {
        v27 = a1 + v28 + 24;
        goto LABEL_25;
      }
      v32 = *(_DWORD *)(v29 + 12);
    }
    v16 -= 12;
    *(_DWORD *)(v29 + 24) = v32;
    v33 = a1 + v28;
    *(_DWORD *)(v33 + 28) = *(_DWORD *)(a1 + v28 + 16);
    *(_WORD *)(v33 + 32) = _H2;
    v28 -= 12;
    if (v28 == -24)
    {
      v27 = a1;
      goto LABEL_25;
    }
  }
}

int *std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int *result;
  int v17;
  int v18;
  int v19;
  int v24;
  int v25;
  int v26;
  int v31;
  int v32;
  int v33;

  result = std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<half>(half const*,half const*,half const*,half const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,half> const&,std::pair<std::pair<int,int>,half> const&)#1} &,std::pair<std::pair<int,int>,half>*>((int *)a1, (int *)a2, (int *)a3);
  _H0 = *(_WORD *)(a4 + 8);
  _H1 = *(_WORD *)(a3 + 8);
  __asm
  {
    FCVT            S2, H1
    FCVT            S3, H0
  }
  if (_S3 == _S2)
  {
    v18 = *(_DWORD *)a4;
    v17 = *(_DWORD *)a3;
    if (*(_DWORD *)a4 >= *(_DWORD *)a3 && (v17 < v18 || *(_DWORD *)(a4 + 4) >= *(_DWORD *)(a3 + 4)))
      return result;
  }
  else
  {
    if (_S3 <= _S2)
      return result;
    v17 = *(_DWORD *)a3;
    v18 = *(_DWORD *)a4;
  }
  *(_DWORD *)a3 = v18;
  *(_DWORD *)a4 = v17;
  v19 = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = *(_DWORD *)(a4 + 4);
  *(_DWORD *)(a4 + 4) = v19;
  *(_WORD *)(a3 + 8) = _H0;
  *(_WORD *)(a4 + 8) = _H1;
  _H0 = *(_WORD *)(a3 + 8);
  _H1 = *(_WORD *)(a2 + 8);
  __asm
  {
    FCVT            S2, H1
    FCVT            S3, H0
  }
  if (_S3 == _S2)
  {
    v25 = *(_DWORD *)a3;
    v24 = *(_DWORD *)a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (v24 < v25 || *(_DWORD *)(a3 + 4) >= *(_DWORD *)(a2 + 4)))
      return result;
  }
  else
  {
    if (_S3 <= _S2)
      return result;
    v24 = *(_DWORD *)a2;
    v25 = *(_DWORD *)a3;
  }
  *(_DWORD *)a2 = v25;
  *(_DWORD *)a3 = v24;
  v26 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = v26;
  *(_WORD *)(a2 + 8) = _H0;
  *(_WORD *)(a3 + 8) = _H1;
  _H0 = *(_WORD *)(a2 + 8);
  _H1 = *(_WORD *)(a1 + 8);
  __asm
  {
    FCVT            S2, H1
    FCVT            S3, H0
  }
  if (_S3 != _S2)
  {
    if (_S3 <= _S2)
      return result;
    v31 = *(_DWORD *)a1;
    v32 = *(_DWORD *)a2;
    goto LABEL_17;
  }
  v32 = *(_DWORD *)a2;
  v31 = *(_DWORD *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1 || v31 >= v32 && *(_DWORD *)(a2 + 4) < *(_DWORD *)(a1 + 4))
  {
LABEL_17:
    *(_DWORD *)a1 = v32;
    *(_DWORD *)a2 = v31;
    v33 = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
    *(_DWORD *)(a2 + 4) = v33;
    *(_WORD *)(a1 + 8) = _H0;
    *(_WORD *)(a2 + 8) = _H1;
  }
  return result;
}

void std::vector<std::pair<std::pair<int,int>,half>>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  int v21;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-v7] >> 2) >= a2)
  {
    if (a2)
    {
      v13 = v7 + 12 * a2;
      do
      {
        *(_QWORD *)v7 = 0;
        *(_WORD *)(v7 + 8) = 0;
        v7 += 12;
      }
      while (v7 != v13);
      v7 = v13;
    }
    a1[1] = (char *)v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)*a1) >> 2);
    v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555)
      abort();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0xAAAAAAAAAAAAAAALL)
      v11 = 0x1555555555555555;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<std::pair<int,int>,half>>>(v4, v11);
    else
      v12 = 0;
    v14 = &v12[12 * v8];
    v15 = &v14[12 * a2];
    v16 = v14;
    do
    {
      *(_QWORD *)v16 = 0;
      *((_WORD *)v16 + 4) = 0;
      v16 += 12;
    }
    while (v16 != v15);
    v17 = &v12[12 * v11];
    v19 = *a1;
    v18 = a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_QWORD *)(v18 - 12);
        v18 -= 12;
        v21 = *((_DWORD *)v18 + 2);
        *(_QWORD *)(v14 - 12) = v20;
        v14 -= 12;
        *((_DWORD *)v14 + 2) = v21;
      }
      while (v18 != v19);
      v18 = *a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = v17;
    if (v18)
      operator delete(v18);
  }
}

void std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void std::vector<std::pair<std::pair<int,int>,float>>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<std::pair<std::pair<int,int>,float>>::__append((char **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 12 * a2;
  }
}

char *std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__emplace_unique_key_args<std::pair<int,int>,std::pair<std::pair<int,int>,float>>(uint64_t **a1, int *a2, uint64_t a3)
{
  uint64_t *v5;
  char *v6;
  uint64_t **v7;
  uint64_t v9;

  v5 = std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__find_equal<std::pair<int,int>>((uint64_t)a1, &v9, a2);
  v6 = (char *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (char *)operator new(0x28uLL);
    *(_QWORD *)(v6 + 28) = *(_QWORD *)a3;
    *((_DWORD *)v6 + 9) = *(_DWORD *)(a3 + 8);
    std::__tree<std::__value_type<std::pair<int,int>,float>,std::__map_value_compare<std::pair<int,int>,std::__value_type<std::pair<int,int>,float>,std::less<std::pair<int,int>>,true>,std::allocator<std::__value_type<std::pair<int,int>,float>>>::__insert_node_at(a1, v9, v7, (uint64_t *)v6);
  }
  return v6;
}

_QWORD *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::__map_iterator<std::__tree_iterator<std::__value_type<std::pair<int,int>,float>,std::__tree_node<std::__value_type<std::pair<int,int>,float>,void *> *,long>>,std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,float>>>>(uint64_t a1, _QWORD *a2, _QWORD *a3, char **a4)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  uint64_t v10;
  int v11;
  char **v12;

  v4 = a2;
  v12 = a4;
  if (a2 == a3)
    return a2;
  v5 = a3;
  do
  {
    v10 = *(_QWORD *)((char *)v4 + 28);
    v11 = *((_DWORD *)v4 + 9);
    std::back_insert_iterator<std::vector<std::pair<std::pair<int,int>,half>>>::operator=[abi:nn180100](&v12, &v10);
    v6 = (_QWORD *)v4[1];
    if (v6)
    {
      do
      {
        v7 = v6;
        v6 = (_QWORD *)*v6;
      }
      while (v6);
    }
    else
    {
      do
      {
        v7 = (_QWORD *)v4[2];
        v8 = *v7 == (_QWORD)v4;
        v4 = v7;
      }
      while (!v8);
    }
    v4 = v7;
  }
  while (v7 != v5);
  return v5;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,false>(uint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7;
  unint64_t k;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float *v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  int v18;
  uint64_t v19;
  int v20;
  float v21;
  int v22;
  unint64_t v23;
  unint64_t m;
  float v25;
  float v26;
  float *v29;
  float v30;
  int v31;
  int v32;
  float v33;
  float v34;
  BOOL v35;
  int v36;
  float v37;
  int v38;
  float v39;
  float v40;
  float *v41;
  float *v42;
  int v43;
  float v44;
  int v45;
  int v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  int v52;
  _DWORD *v53;
  BOOL v55;
  uint64_t v56;
  _DWORD *v57;
  float *v58;
  float v59;
  float v60;
  int v61;
  int v62;
  int v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  float v67;
  int v68;
  uint64_t v69;
  int v70;
  int64_t v71;
  int64_t v72;
  int64_t v73;
  uint64_t v74;
  unint64_t v75;
  float v76;
  float v77;
  int v78;
  unint64_t v79;
  float v80;
  float v81;
  int v82;
  int v83;
  int v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  float v88;
  float v89;
  int v90;
  float v91;
  int v92;
  int64_t v93;
  uint64_t v94;
  float v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int *v98;
  unsigned int *v99;
  uint64_t v100;
  int64_t v101;
  float v102;
  float v103;
  int v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  float *v108;
  float v109;
  float v110;
  int v111;
  signed int v112;
  unint64_t i;
  uint64_t v115;
  float v116;
  float v117;
  int v118;
  int v119;
  unint64_t j;
  int v121;
  int v122;
  int v123;

  v7 = result;
LABEL_2:
  k = v7;
  while (2)
  {
    v7 = k;
    v9 = a2 - k;
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - k) >> 2);
    switch(v10)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v49 = *(float *)(a2 - 4);
        v50 = *(float *)(k + 8);
        if (v49 == v50)
        {
          v52 = *(_DWORD *)(a2 - 12);
          v51 = *(float *)k;
          if (v52 >= *(_DWORD *)k && (SLODWORD(v51) < v52 || *(_DWORD *)(a2 - 8) >= *(_DWORD *)(k + 4)))
            return result;
        }
        else
        {
          if (v49 <= v50)
            return result;
          v51 = *(float *)k;
          v52 = *(_DWORD *)(a2 - 12);
        }
        *(_DWORD *)k = v52;
        *(float *)(a2 - 12) = v51;
        v123 = *(_DWORD *)(k + 4);
        *(_DWORD *)(k + 4) = *(_DWORD *)(a2 - 8);
        *(_DWORD *)(a2 - 8) = v123;
        *(float *)(k + 8) = v49;
        *(float *)(a2 - 4) = v50;
        return result;
      case 3uLL:
        return (uint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)k, (float *)(k + 12), (float *)(a2 - 12));
      case 4uLL:
        return (uint64_t)std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(k, k + 12, k + 24, a2 - 12);
      case 5uLL:
        return (uint64_t)std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,0>(k, k + 12, k + 24, k + 36, (float *)(a2 - 12));
      default:
        if (v9 <= 287)
        {
          v53 = (_DWORD *)(k + 12);
          v55 = k == a2 || v53 == (_DWORD *)a2;
          if ((a4 & 1) == 0)
          {
            if (v55)
              return result;
            for (i = k + 4; ; i += 12)
            {
              v115 = v7;
              v7 = (uint64_t)v53;
              v116 = *(float *)(v115 + 20);
              v117 = *(float *)(v115 + 8);
              if (v116 == v117)
                break;
              if (v116 > v117)
              {
                v118 = *v53;
LABEL_243:
                v119 = *(_DWORD *)(v115 + 16);
                for (j = i; ; j -= 12)
                {
                  v121 = *(_DWORD *)j;
                  *(_DWORD *)(j + 8) = *(_DWORD *)(j - 4);
                  *(_DWORD *)(j + 12) = v121;
                  *(float *)(j + 16) = v117;
                  v117 = *(float *)(j - 8);
                  if (v116 == v117)
                  {
                    v122 = *(_DWORD *)(j - 16);
                    if (v118 >= v122 && (v122 < v118 || v119 >= *(_DWORD *)(j - 12)))
                    {
LABEL_251:
                      *(_DWORD *)(j - 4) = v118;
                      *(_DWORD *)j = v119;
                      *(float *)(j + 4) = v116;
                      break;
                    }
                  }
                  else if (v116 <= v117)
                  {
                    goto LABEL_251;
                  }
                }
              }
LABEL_252:
              v53 = (_DWORD *)(v7 + 12);
              if (v7 + 12 == a2)
                return result;
            }
            v118 = *v53;
            if (*v53 >= *(_DWORD *)v115 && (*(_DWORD *)v115 < v118 || *(_DWORD *)(v115 + 16) >= *(_DWORD *)(v115 + 4)))
              goto LABEL_252;
            goto LABEL_243;
          }
          if (v55)
            return result;
          v56 = 0;
          v57 = (_DWORD *)k;
LABEL_141:
          v58 = (float *)v57;
          v57 = v53;
          v59 = v58[5];
          v60 = v58[2];
          if (v59 == v60)
          {
            v61 = *v53;
            v62 = *(_DWORD *)v58;
            if (v61 >= *(_DWORD *)v58 && (v62 < v61 || *((_DWORD *)v58 + 4) >= *((_DWORD *)v58 + 1)))
              goto LABEL_159;
          }
          else
          {
            if (v59 <= v60)
              goto LABEL_159;
            v61 = *v53;
            v62 = *(_DWORD *)v58;
          }
          v63 = *((_DWORD *)v58 + 4);
          *((_DWORD *)v58 + 3) = v62;
          v57[1] = *((_DWORD *)v58 + 1);
          *((float *)v57 + 2) = v60;
          v64 = k;
          if (v58 == (float *)k)
            goto LABEL_158;
          v65 = v56;
          while (1)
          {
            v66 = k + v65;
            v67 = *(float *)(k + v65 - 4);
            if (v59 == v67)
            {
              v68 = *(_DWORD *)(v66 - 12);
              if (v61 >= v68)
              {
                if (v68 < v61)
                {
                  v64 = k + v65;
LABEL_158:
                  *(_DWORD *)v64 = v61;
                  *(_DWORD *)(v64 + 4) = v63;
                  *(float *)(v64 + 8) = v59;
LABEL_159:
                  v53 = v57 + 3;
                  v56 += 12;
                  if (v57 + 3 == (_DWORD *)a2)
                    return result;
                  goto LABEL_141;
                }
                if (v63 >= *(_DWORD *)(k + v65 - 8))
                {
LABEL_157:
                  v64 = (unint64_t)v58;
                  goto LABEL_158;
                }
              }
            }
            else
            {
              if (v59 <= v67)
                goto LABEL_157;
              v68 = *(_DWORD *)(v66 - 12);
            }
            v69 = k + v65;
            v70 = *(_DWORD *)(k + v65 - 8);
            v58 -= 3;
            *(_DWORD *)v69 = v68;
            *(_DWORD *)(v69 + 4) = v70;
            *(float *)(v69 + 8) = v67;
            v65 -= 12;
            if (!v65)
            {
              v64 = k;
              goto LABEL_158;
            }
          }
        }
        if (!a3)
        {
          if (k == a2)
            return result;
          v71 = (v10 - 2) >> 1;
          v72 = v71;
          while (1)
          {
            v73 = v72;
            if (v71 < v72)
              goto LABEL_197;
            v74 = (2 * v72) | 1;
            v75 = k + 12 * v74;
            if (2 * v73 + 2 >= (uint64_t)v10)
              goto LABEL_171;
            v76 = *(float *)(k + 12 * v74 + 8);
            v77 = *(float *)(v75 + 20);
            if (v76 == v77)
            {
              v78 = *(_DWORD *)(v75 + 12);
              if (*(_DWORD *)v75 >= v78 && (v78 < *(_DWORD *)v75 || *(_DWORD *)(v75 + 4) >= *(_DWORD *)(v75 + 16)))
                goto LABEL_171;
            }
            else if (v76 <= v77)
            {
              goto LABEL_171;
            }
            v75 += 12;
            v74 = 2 * v73 + 2;
LABEL_171:
            v79 = k + 12 * v73;
            v80 = *(float *)(v75 + 8);
            v81 = *(float *)(v79 + 8);
            if (v80 == v81)
            {
              v83 = *(_DWORD *)v75;
              v82 = *(_DWORD *)v79;
              if (*(_DWORD *)v75 < *(_DWORD *)v79 || v82 >= v83 && *(_DWORD *)(v75 + 4) < *(_DWORD *)(v79 + 4))
                goto LABEL_197;
            }
            else
            {
              if (v80 > v81)
                goto LABEL_197;
              v82 = *(_DWORD *)v79;
              v83 = *(_DWORD *)v75;
            }
            v84 = *(_DWORD *)(v79 + 4);
            *(_DWORD *)v79 = v83;
            *(_DWORD *)(v79 + 4) = *(_DWORD *)(v75 + 4);
            *(float *)(v79 + 8) = v80;
            while (1)
            {
              if (v71 < v74)
                goto LABEL_196;
              v85 = v75;
              v86 = 2 * v74;
              v74 = (2 * v74) | 1;
              v75 = k + 12 * v74;
              v87 = v86 + 2;
              if (v87 < (uint64_t)v10)
              {
                v88 = *(float *)(k + 12 * v74 + 8);
                v89 = *(float *)(v75 + 20);
                if (v88 == v89)
                {
                  v90 = *(_DWORD *)(v75 + 12);
                  if (*(_DWORD *)v75 < v90 || v90 >= *(_DWORD *)v75 && *(_DWORD *)(v75 + 4) < *(_DWORD *)(v75 + 16))
                  {
LABEL_184:
                    v75 += 12;
                    v74 = v87;
                  }
                }
                else if (v88 > v89)
                {
                  goto LABEL_184;
                }
              }
              v91 = *(float *)(v75 + 8);
              if (v91 == v81)
                break;
              if (v91 > v81)
                goto LABEL_195;
              v92 = *(_DWORD *)v75;
LABEL_191:
              *(_DWORD *)v85 = v92;
              *(_DWORD *)(v85 + 4) = *(_DWORD *)(v75 + 4);
              *(float *)(v85 + 8) = v91;
            }
            v92 = *(_DWORD *)v75;
            if (*(_DWORD *)v75 >= v82 && (v82 < v92 || *(_DWORD *)(v75 + 4) >= v84))
              goto LABEL_191;
LABEL_195:
            v75 = v85;
LABEL_196:
            *(_DWORD *)v75 = v82;
            *(_DWORD *)(v75 + 4) = v84;
            *(float *)(v75 + 8) = v81;
LABEL_197:
            v72 = v73 - 1;
            if (!v73)
            {
              v93 = v9 / 0xCuLL;
              while (1)
              {
                v94 = 0;
                v95 = *(float *)k;
                v96 = *(_DWORD *)(k + 4);
                v97 = *(_DWORD *)(k + 8);
                v98 = (unsigned int *)k;
                do
                {
                  v99 = v98;
                  result = v94 + 1;
                  v98 += 3 * v94 + 3;
                  v100 = 2 * v94;
                  v94 = (2 * v94) | 1;
                  v101 = v100 + 2;
                  if (v101 >= v93)
                    goto LABEL_211;
                  result = (uint64_t)&v99[3 * result];
                  v102 = *(float *)(result + 8);
                  v103 = *((float *)v98 + 5);
                  if (v102 == v103)
                  {
                    result = *v98;
                    v104 = v98[3];
                    if ((int)result < v104 || v104 >= (int)result && (result = v98[1], (int)result < (int)v98[4]))
                    {
LABEL_210:
                      v98 += 3;
                      v94 = v101;
                    }
                  }
                  else if (v102 > v103)
                  {
                    goto LABEL_210;
                  }
LABEL_211:
                  *v99 = *v98;
                  v99[1] = v98[1];
                  v99[2] = v98[2];
                }
                while (v94 <= (uint64_t)((unint64_t)(v93 - 2) >> 1));
                if (v98 == (unsigned int *)(a2 - 12))
                {
                  *(float *)v98 = v95;
                  v98[1] = v96;
                  v98[2] = v97;
                }
                else
                {
                  *v98 = *(_DWORD *)(a2 - 12);
                  v98[1] = *(_DWORD *)(a2 - 8);
                  v98[2] = *(_DWORD *)(a2 - 4);
                  *(float *)(a2 - 12) = v95;
                  *(_DWORD *)(a2 - 8) = v96;
                  *(_DWORD *)(a2 - 4) = v97;
                  v105 = (uint64_t)v98 - k + 12;
                  if (v105 >= 13)
                  {
                    v106 = v105 / 0xCuLL - 2;
                    v107 = v106 >> 1;
                    v108 = (float *)(k + 12 * (v106 >> 1));
                    v109 = v108[2];
                    v110 = *((float *)v98 + 2);
                    if (v109 == v110)
                    {
                      result = *(unsigned int *)v108;
                      v111 = *v98;
                      if ((int)result < (int)*v98 || v111 >= (int)result && *((_DWORD *)v108 + 1) < (signed int)v98[1])
                        goto LABEL_219;
                    }
                    else if (v109 > v110)
                    {
                      v111 = *v98;
                      *(float *)&result = *v108;
LABEL_219:
                      v112 = v98[1];
                      do
                      {
                        while (1)
                        {
                          *v98 = result;
                          result = *((unsigned int *)v108 + 1);
                          v98[1] = result;
                          *((float *)v98 + 2) = v109;
                          if (v106 < 2)
                            goto LABEL_228;
                          v98 = (unsigned int *)v108;
                          v106 = v107 - 1;
                          v107 = (v107 - 1) >> 1;
                          v108 = (float *)(k + 12 * v107);
                          v109 = v108[2];
                          if (v109 == v110)
                            break;
                          if (v109 <= v110)
                            goto LABEL_227;
                          *(float *)&result = *v108;
                        }
                        result = *(unsigned int *)v108;
                      }
                      while ((int)result < v111 || v111 >= (int)result && *((_DWORD *)v108 + 1) < v112);
LABEL_227:
                      v108 = (float *)v98;
LABEL_228:
                      *(_DWORD *)v108 = v111;
                      *((_DWORD *)v108 + 1) = v112;
                      v108[2] = v110;
                    }
                  }
                }
                a2 -= 12;
                if (v93-- <= 2)
                  return result;
              }
            }
          }
        }
        v11 = v10 >> 1;
        v12 = (float *)(k + 12 * (v10 >> 1));
        if ((unint64_t)v9 < 0x601)
        {
          result = (uint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)(v7 + 12 * (v10 >> 1)), (float *)v7, (float *)(a2 - 12));
        }
        else
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)v7, (float *)(v7 + 12 * (v10 >> 1)), (float *)(a2 - 12));
          v13 = v7 + 12 * v11;
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)(v7 + 12), (float *)(v13 - 12), (float *)(a2 - 24));
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)(v7 + 24), (float *)(v7 + 12 + 12 * v11), (float *)(a2 - 36));
          result = (uint64_t)std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)(v13 - 12), v12, (float *)(v7 + 12 + 12 * v11));
          v14 = *(_QWORD *)v7;
          *(_QWORD *)v7 = *(_QWORD *)v12;
          *(_QWORD *)v12 = v14;
          LODWORD(v14) = *(_DWORD *)(v7 + 8);
          *(_DWORD *)(v7 + 8) = *(_DWORD *)(v13 + 8);
          *(_DWORD *)(v13 + 8) = v14;
        }
        --a3;
        if ((a4 & 1) == 0)
        {
          v17 = *(float *)(v7 - 4);
          v16 = *(float *)(v7 + 8);
          if (v17 == v16)
          {
            v18 = *(_DWORD *)(v7 - 12);
            v15 = *(float *)v7;
            if (v18 < *(_DWORD *)v7 || SLODWORD(v15) >= v18 && *(_DWORD *)(v7 - 8) < *(_DWORD *)(v7 + 4))
              goto LABEL_17;
          }
          else
          {
            v15 = *(float *)v7;
            if (v17 > v16)
              goto LABEL_17;
          }
          v36 = *(_DWORD *)(v7 + 4);
          v37 = *(float *)(a2 - 4);
          if (v16 == v37)
          {
            v38 = *(_DWORD *)(a2 - 12);
            if (SLODWORD(v15) < v38 || v38 >= SLODWORD(v15) && v36 < *(_DWORD *)(a2 - 8))
            {
LABEL_79:
              for (k = v7 + 12; ; k += 12)
              {
                v39 = *(float *)(k + 8);
                if (v16 == v39)
                {
                  if (SLODWORD(v15) < *(_DWORD *)k || *(_DWORD *)k >= SLODWORD(v15) && v36 < *(_DWORD *)(k + 4))
                    goto LABEL_96;
                }
                else if (v16 > v39)
                {
                  goto LABEL_96;
                }
              }
            }
          }
          else if (v16 > v37)
          {
            goto LABEL_79;
          }
          for (k = v7 + 12; k < a2; k += 12)
          {
            v40 = *(float *)(k + 8);
            if (v16 == v40)
            {
              if (SLODWORD(v15) < *(_DWORD *)k || *(_DWORD *)k >= SLODWORD(v15) && v36 < *(_DWORD *)(k + 4))
                break;
            }
            else if (v16 > v40)
            {
              break;
            }
          }
LABEL_96:
          v41 = (float *)a2;
          if (k >= a2)
            goto LABEL_119;
          v42 = (float *)(a2 - 8);
          while (v16 != v37)
          {
            if (v16 <= v37)
              goto LABEL_105;
LABEL_104:
            v37 = *(v42 - 2);
            v42 -= 3;
          }
          v43 = *((_DWORD *)v42 - 1);
          if (SLODWORD(v15) < v43 || v43 >= SLODWORD(v15) && v36 < *(_DWORD *)v42)
            goto LABEL_104;
LABEL_105:
          v41 = v42 - 1;
LABEL_119:
          while (k < (unint64_t)v41)
          {
            v44 = *(float *)k;
            *(float *)k = *v41;
            *v41 = v44;
            v45 = *(_DWORD *)(k + 4);
            *(float *)(k + 4) = v41[1];
            *((_DWORD *)v41 + 1) = v45;
            v46 = *(_DWORD *)(k + 8);
            *(float *)(k + 8) = v41[2];
            *((_DWORD *)v41 + 2) = v46;
            do
            {
              while (1)
              {
                k += 12;
                v47 = *(float *)(k + 8);
                if (v16 == v47)
                  break;
                if (v16 > v47)
                  goto LABEL_117;
              }
            }
            while (SLODWORD(v15) >= *(_DWORD *)k && (*(_DWORD *)k < SLODWORD(v15) || v36 >= *(_DWORD *)(k + 4)));
            do
            {
LABEL_117:
              while (1)
              {
                v41 -= 3;
                v48 = v41[2];
                if (v16 == v48)
                  break;
                if (v16 <= v48)
                  goto LABEL_119;
              }
            }
            while (SLODWORD(v15) < *(_DWORD *)v41 || *(_DWORD *)v41 >= SLODWORD(v15) && v36 < *((_DWORD *)v41 + 1));
          }
          if (k - 12 != v7)
          {
            *(_DWORD *)v7 = *(_DWORD *)(k - 12);
            *(_DWORD *)(v7 + 4) = *(_DWORD *)(k - 8);
            *(_DWORD *)(v7 + 8) = *(_DWORD *)(k - 4);
          }
          a4 = 0;
          *(float *)(k - 12) = v15;
          *(_DWORD *)(k - 8) = v36;
          *(float *)(k - 4) = v16;
          continue;
        }
        v15 = *(float *)v7;
        v16 = *(float *)(v7 + 8);
LABEL_17:
        v19 = 0;
        v20 = *(_DWORD *)(v7 + 4);
        while (1)
        {
          v21 = *(float *)(v7 + v19 + 20);
          if (v21 == v16)
            break;
          if (v21 <= v16)
            goto LABEL_25;
LABEL_24:
          v19 += 12;
        }
        v22 = *(_DWORD *)(v7 + v19 + 12);
        if (v22 < SLODWORD(v15) || SLODWORD(v15) >= v22 && *(_DWORD *)(v7 + v19 + 16) < v20)
          goto LABEL_24;
LABEL_25:
        v23 = v7 + v19 + 12;
        m = a2 - 12;
        if (v19)
        {
          while (1)
          {
            v25 = *(float *)(m + 8);
            if (v25 == v16)
            {
              if (*(_DWORD *)m < SLODWORD(v15) || SLODWORD(v15) >= *(_DWORD *)m && *(_DWORD *)(m + 4) < v20)
                goto LABEL_51;
            }
            else if (v25 > v16)
            {
              goto LABEL_51;
            }
            m -= 12;
          }
        }
        m = a2;
        if (v23 < a2)
        {
          for (m = a2 - 12; ; m -= 12)
          {
            v26 = *(float *)(m + 8);
            if (v26 == v16)
            {
              if (*(_DWORD *)m < SLODWORD(v15))
                break;
              if (SLODWORD(v15) >= *(_DWORD *)m)
              {
                if (*(_DWORD *)(m + 4) < v20 || v23 >= m)
                  break;
              }
              else if (v23 >= m)
              {
                break;
              }
            }
            else if (v26 > v16 || v23 >= m)
            {
              break;
            }
          }
        }
LABEL_51:
        k = v7 + v19 + 12;
        if (v23 < m)
        {
          v29 = (float *)m;
          do
          {
            v30 = *(float *)k;
            *(float *)k = *v29;
            *v29 = v30;
            v31 = *(_DWORD *)(k + 4);
            *(float *)(k + 4) = v29[1];
            *((_DWORD *)v29 + 1) = v31;
            v32 = *(_DWORD *)(k + 8);
            *(float *)(k + 8) = v29[2];
            *((_DWORD *)v29 + 2) = v32;
            do
            {
              while (1)
              {
                k += 12;
                v33 = *(float *)(k + 8);
                if (v33 == v16)
                  break;
                if (v33 <= v16)
                  goto LABEL_64;
              }
            }
            while (*(_DWORD *)k < SLODWORD(v15) || SLODWORD(v15) >= *(_DWORD *)k && *(_DWORD *)(k + 4) < v20);
            do
            {
LABEL_64:
              while (1)
              {
                v29 -= 3;
                v34 = v29[2];
                if (v34 == v16)
                  break;
                if (v34 > v16)
                  goto LABEL_66;
              }
            }
            while (*(_DWORD *)v29 >= SLODWORD(v15) && (SLODWORD(v15) < *(_DWORD *)v29 || *((_DWORD *)v29 + 1) >= v20));
LABEL_66:
            ;
          }
          while (k < (unint64_t)v29);
        }
        if (k - 12 != v7)
        {
          *(_DWORD *)v7 = *(_DWORD *)(k - 12);
          *(_DWORD *)(v7 + 4) = *(_DWORD *)(k - 8);
          *(_DWORD *)(v7 + 8) = *(_DWORD *)(k - 4);
        }
        *(float *)(k - 12) = v15;
        *(_DWORD *)(k - 8) = v20;
        *(float *)(k - 4) = v16;
        if (v23 < m)
        {
LABEL_72:
          result = std::__introsort<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,false>(v7, k - 12, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v35 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(v7, k - 12);
        result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(k, a2);
        if (!(_DWORD)result)
        {
          if (v35)
            continue;
          goto LABEL_72;
        }
        a2 = k - 12;
        if (!v35)
          goto LABEL_2;
        return result;
    }
  }
}

float *std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,0>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float *a5)
{
  float *result;
  float v11;
  float v12;
  int v13;
  float v14;
  int v15;
  float v16;
  float v17;
  int v18;
  int v19;
  int v20;
  float v21;
  float v22;
  int v23;
  int v24;
  int v25;
  float v26;
  float v27;
  int v28;
  int v29;
  int v30;

  result = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(a1, a2, a3, a4);
  v11 = a5[2];
  v12 = *(float *)(a4 + 8);
  if (v11 == v12)
  {
    v14 = *a5;
    v13 = *(_DWORD *)a4;
    if (*(_DWORD *)a5 >= *(_DWORD *)a4 && (v13 < SLODWORD(v14) || *((_DWORD *)a5 + 1) >= *(_DWORD *)(a4 + 4)))
      return result;
  }
  else
  {
    if (v11 <= v12)
      return result;
    v13 = *(_DWORD *)a4;
    v14 = *a5;
  }
  *(float *)a4 = v14;
  *(_DWORD *)a5 = v13;
  v15 = *(_DWORD *)(a4 + 4);
  *(float *)(a4 + 4) = a5[1];
  *((_DWORD *)a5 + 1) = v15;
  *(float *)(a4 + 8) = v11;
  a5[2] = v12;
  v16 = *(float *)(a4 + 8);
  v17 = *(float *)(a3 + 8);
  if (v16 == v17)
  {
    v19 = *(_DWORD *)a4;
    v18 = *(_DWORD *)a3;
    if (*(_DWORD *)a4 >= *(_DWORD *)a3 && (v18 < v19 || *(_DWORD *)(a4 + 4) >= *(_DWORD *)(a3 + 4)))
      return result;
  }
  else
  {
    if (v16 <= v17)
      return result;
    v18 = *(_DWORD *)a3;
    v19 = *(_DWORD *)a4;
  }
  *(_DWORD *)a3 = v19;
  *(_DWORD *)a4 = v18;
  v20 = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = *(_DWORD *)(a4 + 4);
  *(_DWORD *)(a4 + 4) = v20;
  *(float *)(a3 + 8) = v16;
  *(float *)(a4 + 8) = v17;
  v21 = *(float *)(a3 + 8);
  v22 = *(float *)(a2 + 8);
  if (v21 == v22)
  {
    v24 = *(_DWORD *)a3;
    v23 = *(_DWORD *)a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (v23 < v24 || *(_DWORD *)(a3 + 4) >= *(_DWORD *)(a2 + 4)))
      return result;
  }
  else
  {
    if (v21 <= v22)
      return result;
    v23 = *(_DWORD *)a2;
    v24 = *(_DWORD *)a3;
  }
  *(_DWORD *)a2 = v24;
  *(_DWORD *)a3 = v23;
  v25 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = v25;
  *(float *)(a2 + 8) = v21;
  *(float *)(a3 + 8) = v22;
  v26 = *(float *)(a2 + 8);
  v27 = *(float *)(a1 + 8);
  if (v26 != v27)
  {
    if (v26 <= v27)
      return result;
    v28 = *(_DWORD *)a1;
    v29 = *(_DWORD *)a2;
    goto LABEL_25;
  }
  v29 = *(_DWORD *)a2;
  v28 = *(_DWORD *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1 || v28 >= v29 && *(_DWORD *)(a2 + 4) < *(_DWORD *)(a1 + 4))
  {
LABEL_25:
    *(_DWORD *)a1 = v29;
    *(_DWORD *)a2 = v28;
    v30 = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
    *(_DWORD *)(a2 + 4) = v30;
    *(float *)(a1 + 8) = v26;
    *(float *)(a2 + 8) = v27;
  }
  return result;
}

float *std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(float *result, float *a2, float *a3)
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  int v12;
  int v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int v19;
  float v20;
  float v21;
  float v22;
  int v23;
  int v24;

  v3 = a2[2];
  v4 = result[2];
  if (v3 == v4)
  {
    if (*(_DWORD *)a2 >= *(_DWORD *)result
      && (*(_DWORD *)result < *(_DWORD *)a2 || *((_DWORD *)a2 + 1) >= *((_DWORD *)result + 1)))
    {
      goto LABEL_10;
    }
LABEL_7:
    v5 = a3[2];
    if (v5 == v3)
    {
      v6 = *a3;
      v10 = *a2;
      if (*(_DWORD *)a3 < *(_DWORD *)a2 || SLODWORD(v10) >= SLODWORD(v6) && *((_DWORD *)a3 + 1) < *((_DWORD *)a2 + 1))
        goto LABEL_14;
    }
    else
    {
      if (v5 > v3)
      {
        v6 = *a3;
LABEL_14:
        v11 = *result;
        *result = v6;
        *a3 = v11;
        v12 = *((_DWORD *)result + 1);
        result[1] = a3[1];
        *((_DWORD *)a3 + 1) = v12;
        result[2] = v5;
        goto LABEL_35;
      }
      v10 = *a2;
    }
    v18 = *result;
    *result = v10;
    *a2 = v18;
    v19 = *((_DWORD *)result + 1);
    result[1] = a2[1];
    *((_DWORD *)a2 + 1) = v19;
    result[2] = v3;
    a2[2] = v4;
    v20 = a3[2];
    if (v20 == v4)
    {
      v22 = *a3;
      v21 = *a2;
      if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (SLODWORD(v21) < SLODWORD(v22) || *((_DWORD *)a3 + 1) >= v19))
        return result;
    }
    else
    {
      if (v20 <= v4)
        return result;
      v21 = *a2;
      v22 = *a3;
    }
    *a2 = v22;
    *a3 = v21;
    v24 = *((_DWORD *)a2 + 1);
    a2[1] = a3[1];
    *((_DWORD *)a3 + 1) = v24;
    a2[2] = v20;
LABEL_35:
    a3[2] = v4;
    return result;
  }
  if (v3 > v4)
    goto LABEL_7;
LABEL_10:
  v7 = a3[2];
  if (v7 == v3)
  {
    v9 = *a3;
    v8 = *a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (SLODWORD(v8) < SLODWORD(v9) || *((_DWORD *)a3 + 1) >= *((_DWORD *)a2 + 1)))
      return result;
  }
  else
  {
    if (v7 <= v3)
      return result;
    v8 = *a2;
    v9 = *a3;
  }
  *a2 = v9;
  *a3 = v8;
  v13 = *((_DWORD *)a2 + 1);
  a2[1] = a3[1];
  *((_DWORD *)a3 + 1) = v13;
  a2[2] = v7;
  a3[2] = v3;
  v14 = a2[2];
  v15 = result[2];
  if (v14 != v15)
  {
    if (v14 <= v15)
      return result;
    v16 = *result;
    v17 = *a2;
    goto LABEL_30;
  }
  v17 = *a2;
  v16 = *result;
  if (*(_DWORD *)a2 < *(_DWORD *)result
    || SLODWORD(v16) >= SLODWORD(v17) && *((_DWORD *)a2 + 1) < *((_DWORD *)result + 1))
  {
LABEL_30:
    *result = v17;
    *a2 = v16;
    v23 = *((_DWORD *)result + 1);
    result[1] = a2[1];
    *((_DWORD *)a2 + 1) = v23;
    result[2] = v14;
    a2[2] = v15;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  float v6;
  float v7;
  float v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  float v14;
  float v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  int v23;
  uint64_t v24;
  int v25;

  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 2);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = *(float *)(a2 - 4);
      v7 = *(float *)(a1 + 8);
      if (v6 != v7)
      {
        if (v6 <= v7)
          return result;
        v8 = *(float *)a1;
        v9 = *(_DWORD *)(a2 - 12);
        goto LABEL_36;
      }
      v9 = *(_DWORD *)(a2 - 12);
      v8 = *(float *)a1;
      if (v9 < *(_DWORD *)a1 || SLODWORD(v8) >= v9 && *(_DWORD *)(a2 - 8) < *(_DWORD *)(a1 + 4))
      {
LABEL_36:
        *(_DWORD *)a1 = v9;
        *(float *)(a2 - 12) = v8;
        v25 = *(_DWORD *)(a1 + 4);
        *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 - 8);
        *(_DWORD *)(a2 - 8) = v25;
        *(float *)(a1 + 8) = v6;
        *(float *)(a2 - 4) = v7;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)a1, (float *)(a1 + 12), (float *)(a2 - 12));
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(a1, a1 + 12, a1 + 24, a2 - 12);
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*,0>(a1, a1 + 12, a1 + 24, a1 + 36, (float *)(a2 - 12));
      return 1;
    default:
      v10 = a1 + 24;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)a1, (float *)(a1 + 12), (float *)(a1 + 24));
      v11 = a1 + 36;
      if (a1 + 36 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
LABEL_7:
  v14 = *(float *)(v11 + 8);
  v15 = *(float *)(v10 + 8);
  if (v14 == v15)
  {
    v16 = *(_DWORD *)v11;
    v17 = *(_DWORD *)v10;
    if (*(_DWORD *)v11 >= *(_DWORD *)v10 && (v17 < v16 || *(_DWORD *)(v11 + 4) >= *(_DWORD *)(v10 + 4)))
      goto LABEL_26;
  }
  else
  {
    if (v14 <= v15)
      goto LABEL_26;
    v16 = *(_DWORD *)v11;
    v17 = *(_DWORD *)v10;
  }
  v18 = *(_DWORD *)(v11 + 4);
  *(_DWORD *)v11 = v17;
  *(_DWORD *)(v11 + 4) = *(_DWORD *)(v10 + 4);
  *(float *)(v11 + 8) = v15;
  v19 = a1;
  if (v10 == a1)
    goto LABEL_25;
  v20 = v12;
  while (1)
  {
    v21 = a1 + v20;
    v22 = *(float *)(a1 + v20 + 20);
    if (v14 == v22)
    {
      v23 = *(_DWORD *)(v21 + 12);
      if (v16 >= v23 && (v23 < v16 || v18 >= *(_DWORD *)(a1 + v20 + 16)))
      {
        v19 = v10;
LABEL_25:
        *(_DWORD *)v19 = v16;
        *(_DWORD *)(v19 + 4) = v18;
        *(float *)(v19 + 8) = v14;
        if (++v13 == 8)
          return v11 + 12 == a2;
LABEL_26:
        v10 = v11;
        v12 += 12;
        v11 += 12;
        if (v11 == a2)
          return 1;
        goto LABEL_7;
      }
    }
    else
    {
      if (v14 <= v22)
      {
        v19 = a1 + v20 + 24;
        goto LABEL_25;
      }
      v23 = *(_DWORD *)(v21 + 12);
    }
    v10 -= 12;
    *(_DWORD *)(v21 + 24) = v23;
    v24 = a1 + v20;
    *(_DWORD *)(v24 + 28) = *(_DWORD *)(a1 + v20 + 16);
    *(float *)(v24 + 32) = v22;
    v20 -= 12;
    if (v20 == -24)
    {
      v19 = a1;
      goto LABEL_25;
    }
  }
}

float *std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  float *result;
  float v9;
  float v10;
  float v11;
  int v12;
  int v13;
  float v14;
  float v15;
  float v16;
  float v17;
  int v18;
  float v19;
  float v20;
  float v21;
  float v22;
  int v23;

  result = std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,SIResultStatus copyBoundingBoxList<float>(float const*,float const*,float const*,float const*,NSMutableArray<SIPersonDetectorBoundingBox *> *,unsigned long,unsigned long)::{lambda(std::pair<std::pair<int,int>,float> const&,std::pair<std::pair<int,int>,float> const&)#1} &,std::pair<std::pair<int,int>,float>*>((float *)a1, (float *)a2, (float *)a3);
  v9 = *(float *)(a4 + 8);
  v10 = *(float *)(a3 + 8);
  if (v9 == v10)
  {
    v12 = *(_DWORD *)a4;
    v11 = *(float *)a3;
    if (*(_DWORD *)a4 >= *(_DWORD *)a3 && (SLODWORD(v11) < v12 || *(_DWORD *)(a4 + 4) >= *(_DWORD *)(a3 + 4)))
      return result;
  }
  else
  {
    if (v9 <= v10)
      return result;
    v11 = *(float *)a3;
    v12 = *(_DWORD *)a4;
  }
  *(_DWORD *)a3 = v12;
  *(float *)a4 = v11;
  v13 = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = *(_DWORD *)(a4 + 4);
  *(_DWORD *)(a4 + 4) = v13;
  *(float *)(a3 + 8) = v9;
  *(float *)(a4 + 8) = v10;
  v14 = *(float *)(a3 + 8);
  v15 = *(float *)(a2 + 8);
  if (v14 == v15)
  {
    v17 = *(float *)a3;
    v16 = *(float *)a2;
    if (*(_DWORD *)a3 >= *(_DWORD *)a2 && (SLODWORD(v16) < SLODWORD(v17) || *(_DWORD *)(a3 + 4) >= *(_DWORD *)(a2 + 4)))
      return result;
  }
  else
  {
    if (v14 <= v15)
      return result;
    v16 = *(float *)a2;
    v17 = *(float *)a3;
  }
  *(float *)a2 = v17;
  *(float *)a3 = v16;
  v18 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a3 + 4);
  *(_DWORD *)(a3 + 4) = v18;
  *(float *)(a2 + 8) = v14;
  *(float *)(a3 + 8) = v15;
  v19 = *(float *)(a2 + 8);
  v20 = *(float *)(a1 + 8);
  if (v19 != v20)
  {
    if (v19 <= v20)
      return result;
    v21 = *(float *)a1;
    v22 = *(float *)a2;
    goto LABEL_17;
  }
  v22 = *(float *)a2;
  v21 = *(float *)a1;
  if (*(_DWORD *)a2 < *(_DWORD *)a1 || SLODWORD(v21) >= SLODWORD(v22) && *(_DWORD *)(a2 + 4) < *(_DWORD *)(a1 + 4))
  {
LABEL_17:
    *(float *)a1 = v22;
    *(float *)a2 = v21;
    v23 = *(_DWORD *)(a1 + 4);
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
    *(_DWORD *)(a2 + 4) = v23;
    *(float *)(a1 + 8) = v19;
    *(float *)(a2 + 8) = v20;
  }
  return result;
}

void std::vector<std::pair<std::pair<int,int>,float>>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  int v21;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      v13 = 12 * ((12 * a2 - 12) / 0xC) + 12;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 2);
    v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555)
      abort();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0xAAAAAAAAAAAAAAALL)
      v11 = 0x1555555555555555;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<std::pair<int,int>,half>>>(v4, v11);
    else
      v12 = 0;
    v14 = &v12[12 * v8];
    v15 = &v12[12 * v11];
    v16 = 12 * ((12 * a2 - 12) / 0xC) + 12;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = *a1;
    v18 = a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_QWORD *)(v18 - 12);
        v18 -= 12;
        v21 = *((_DWORD *)v18 + 2);
        *(_QWORD *)(v14 - 12) = v20;
        v14 -= 12;
        *((_DWORD *)v14 + 2) = v21;
      }
      while (v18 != v19);
      v18 = *a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
      operator delete(v18);
  }
}

uint64_t UInt64BitsFromString(void *a1)
{
  id v1;
  int v2;
  uint64_t v4;

  v4 = 0;
  v1 = a1;
  v2 = objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v4, 8, 0, 1, 0, 0, objc_msgSend(v1, "length"), 0);

  if (v2)
    return v4;
  else
    return 0;
}

uint64_t SIBytesPerElement(int a1)
{
  uint64_t v1;
  int v2;

  v1 = 0;
  v2 = 1278226488;
  while (v2 != a1)
  {
    v2 = *(_DWORD *)&FormatList[v1 + 24];
    v1 += 24;
    if (v1 == 312)
      return 0;
  }
  return *(int *)&FormatList[v1 + 16];
}

uint64_t SIMTLPixelFormatFromOSType(int a1)
{
  uint64_t v1;
  int v2;

  v1 = 0;
  v2 = 1278226488;
  while (v2 != a1)
  {
    v2 = *(_DWORD *)&FormatList[v1 + 24];
    v1 += 24;
    if (v1 == 312)
      return 0;
  }
  return *(_QWORD *)&FormatList[v1 + 8];
}

uint64_t SIOSTypeFromMTLPixelFormat(uint64_t a1)
{
  uint64_t v1;

  v1 = 0;
  while (*(_QWORD *)&FormatList[v1 + 8] != a1)
  {
    v1 += 24;
    if (v1 == 312)
      return 0;
  }
  return *(unsigned int *)&FormatList[v1];
}

uint64_t SIImageFormatMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = 0;
  a5[3] = a4;
  *((_DWORD *)a5 + 4) = a3;
  return result;
}

size_t SIImageFormatFromPixelBuffer@<X0>(__CVBuffer *a1@<X0>, uint64_t a2@<X8>)
{
  OSType PixelFormatType;
  size_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_QWORD *)a2 = CVPixelBufferGetWidth(a1);
  result = CVPixelBufferGetHeight(a1);
  v6 = 0;
  *(_QWORD *)(a2 + 8) = result;
  *(_DWORD *)(a2 + 16) = PixelFormatType;
  v7 = 1278226488;
  while (v7 != PixelFormatType)
  {
    v7 = *(_DWORD *)&FormatList[v6 + 24];
    v6 += 24;
    if (v6 == 312)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  v8 = *(_QWORD *)&FormatList[v6 + 8];
LABEL_6:
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

uint64_t SIImageFormatFromSurface@<X0>(__IOSurface *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_QWORD *)a2 = IOSurfaceGetWidth(a1);
  *(_QWORD *)(a2 + 8) = IOSurfaceGetHeight(a1);
  result = IOSurfaceGetPixelFormat(a1);
  *(_DWORD *)(a2 + 16) = result;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

void SIImageFormatFromTexture(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v3 = a1;
  *(_QWORD *)a2 = objc_msgSend(v3, "width");
  *(_QWORD *)(a2 + 8) = objc_msgSend(v3, "height");
  *(_DWORD *)(a2 + 16) = 0;
  v4 = objc_msgSend(v3, "pixelFormat");

  *(_QWORD *)(a2 + 24) = v4;
}

uint64_t SIImageFormatMatch(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint8x8_t v15;
  int16x8_t v16;
  NSObject *v17;
  uint8x8_t v18;
  int16x8_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint8_t *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (*a1 == *a2 && a1[1] == a2[1])
  {
    result = 1;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      v34 = 1025;
      v35 = 123;
      _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: unexpected resolution ***", buf, 0x12u);
    }

    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *a1;
      v8 = a1[1];
      *(_DWORD *)buf = 136381443;
      v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      v34 = 1025;
      v35 = 124;
      v36 = 2049;
      v37 = v7;
      v38 = 2049;
      v39 = v8;
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   expected (%{private}lu x %{private}lu) ***", buf, 0x26u);
    }

    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *a2;
      v11 = a2[1];
      *(_DWORD *)buf = 136381443;
      v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      v34 = 1025;
      v35 = 125;
      v36 = 2048;
      v37 = v10;
      v38 = 2048;
      v39 = v11;
      _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   received (%lu x %lu) ***", buf, 0x26u);
    }

    result = 0;
  }
  v12 = *((_DWORD *)a2 + 4);
  if (v12 && v12 != *((_DWORD *)a1 + 4))
  {
    __SceneIntelligenceLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      v34 = 1025;
      v35 = 130;
      _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: unexpected ostype ***", buf, 0x12u);
    }

    __SceneIntelligenceLogSharedInstance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15.i32[0] = *((_DWORD *)a1 + 4);
      v16 = (int16x8_t)vmovl_u8(v15);
      *(int16x4_t *)v16.i8 = vrev64_s16(*(int16x4_t *)v16.i8);
      *(_DWORD *)buf = vmovn_s16(v16).u32[0];
      LOBYTE(v33) = 0;
      v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      v28 = 1025;
      v29 = 131;
      v30 = 2081;
      v31 = buf;
      _os_log_impl(&dword_21071A000, v14, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   expected %{private}s ***", (uint8_t *)&v26, 0x1Cu);
    }

    __SceneIntelligenceLogSharedInstance();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18.i32[0] = *((_DWORD *)a2 + 4);
      v19 = (int16x8_t)vmovl_u8(v18);
      *(int16x4_t *)v19.i8 = vrev64_s16(*(int16x4_t *)v19.i8);
      *(_DWORD *)buf = vmovn_s16(v19).u32[0];
      LOBYTE(v33) = 0;
      v26 = 136381187;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      v28 = 1025;
      v29 = 132;
      v30 = 2081;
      v31 = buf;
      _os_log_impl(&dword_21071A000, v17, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   received %{private}s ***", (uint8_t *)&v26, 0x1Cu);
    }

    result = 0;
  }
  v20 = a2[3];
  if (v20 && v20 != a1[3])
  {
    __SceneIntelligenceLogSharedInstance();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      v34 = 1025;
      v35 = 136;
      _os_log_impl(&dword_21071A000, v21, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: unexpected pixelFormat ***", buf, 0x12u);
    }

    __SceneIntelligenceLogSharedInstance();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = a1[3];
      *(_DWORD *)buf = 136381187;
      v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      v34 = 1025;
      v35 = 137;
      v36 = 2049;
      v37 = v23;
      _os_log_impl(&dword_21071A000, v22, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   expected %{private}lu ***", buf, 0x1Cu);
    }

    __SceneIntelligenceLogSharedInstance();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = a2[3];
      *(_DWORD *)buf = 136381187;
      v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      v34 = 1025;
      v35 = 138;
      v36 = 2048;
      v37 = v25;
      _os_log_impl(&dword_21071A000, v24, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d ***   received %lu ***", buf, 0x1Cu);
    }

    return 0;
  }
  return result;
}

uint64_t SICheckPixelBuffer(__CVBuffer *a1, _OWORD *a2)
{
  __int128 v3;
  NSObject *v5;
  uint64_t v6[4];
  _BYTE buf[32];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    SIImageFormatFromPixelBuffer(a1, (uint64_t)v6);
    v3 = a2[1];
    *(_OWORD *)buf = *a2;
    *(_OWORD *)&buf[16] = v3;
    return SIImageFormatMatch((uint64_t *)buf, v6);
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 145;
      _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: pixelbuffer is null ***", buf, 0x12u);
    }

    return 0;
  }
}

uint64_t SICheckSurface(__IOSurface *a1, _OWORD *a2)
{
  __int128 v4;
  NSObject *v6;
  uint64_t v7[4];
  _BYTE buf[32];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v7[0] = IOSurfaceGetWidth(a1);
    v7[1] = IOSurfaceGetHeight(a1);
    v7[3] = 0;
    v7[2] = IOSurfaceGetPixelFormat(a1);
    v4 = a2[1];
    *(_OWORD *)buf = *a2;
    *(_OWORD *)&buf[16] = v4;
    return SIImageFormatMatch((uint64_t *)buf, v7);
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 153;
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: surface is null ***", buf, 0x12u);
    }

    return 0;
  }
}

uint64_t SICheckTexture(void *a1, _OWORD *a2)
{
  __int128 v3;
  NSObject *v5;
  uint64_t v6[4];
  _BYTE buf[32];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    SIImageFormatFromTexture(a1, (uint64_t)v6);
    v3 = a2[1];
    *(_OWORD *)buf = *a2;
    *(_OWORD *)&buf[16] = v3;
    return SIImageFormatMatch((uint64_t *)buf, v6);
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIImageFormat.m";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 162;
      _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** ERROR: texture is null ***", buf, 0x12u);
    }

    return 0;
  }
}

void callback(void *a1, void *a2)
{
  free(a2);
}

CVPixelBufferRef SICreateCVPixelBufferFromTexture(void *a1)
{
  id v1;
  const __CFDictionary *pixelBufferAttributes;
  OSType v3;
  uint64_t v4;
  size_t v5;
  void *v6;
  CVReturn v7;
  CGColorSpaceRef v8;
  CVPixelBufferRef v9;
  CVPixelBufferRef v11[6];
  CVPixelBufferRef pixelBufferOut;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  pixelBufferOut = 0;
  if (!objc_msgSend(v1, "iosurface"))
  {
    v13 = *MEMORY[0x24BDC5668];
    v14[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    pixelBufferAttributes = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v3 = SIOSTypeFromMTLPixelFormat(objc_msgSend(v1, "pixelFormat"));
    v4 = objc_msgSend(v1, "width");
    v5 = 4 * v4 * SIBytesPerElement(v3);
    v6 = malloc_type_malloc(objc_msgSend(v1, "height") * v5, 0xF7B039EFuLL);
    memset(v11, 0, 24);
    v11[3] = (CVPixelBufferRef)objc_msgSend(v1, "width");
    v11[4] = (CVPixelBufferRef)objc_msgSend(v1, "height");
    v11[5] = (CVPixelBufferRef)1;
    objc_msgSend(v1, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v6, v5, v11, 0);
    v7 = CVPixelBufferCreateWithBytes(0, objc_msgSend(v1, "width"), objc_msgSend(v1, "height"), v3, v6, v5, (CVPixelBufferReleaseBytesCallback)callback, 0, pixelBufferAttributes, &pixelBufferOut);
    if (v3 == 1380411457 || v3 == 1380410945)
    {
      v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A8]);
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x24BDC5410], v8, kCVAttachmentMode_ShouldNotPropagate);
    }
    if (v7)
    {
      CVPixelBufferRelease(pixelBufferOut);

      goto LABEL_9;
    }

LABEL_11:
    v9 = pixelBufferOut;
    goto LABEL_12;
  }
  if (!CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)objc_msgSend(v1, "iosurface"), 0, &pixelBufferOut))
    goto LABEL_11;
  CVPixelBufferRelease(pixelBufferOut);
LABEL_9:
  v9 = 0;
LABEL_12:

  return v9;
}

void sub_21072187C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL SISaveCGImage(CGImage *a1, NSString *a2, UTType *a3)
{
  UTType *v5;
  const __CFURL *v6;
  id v7;
  const char *v8;
  const __CFString *v9;
  CGImageDestination *v10;
  _BOOL8 v11;

  v5 = a3;
  v6 = (const __CFURL *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a2);
  -[UTType identifier](v5, "identifier");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, 0x8000100u);

  v10 = CGImageDestinationCreateWithURL(v6, v9, 1uLL, 0);
  CFRelease(v9);
  if (v10)
  {
    CGImageDestinationAddImage(v10, a1, 0);
    v11 = CGImageDestinationFinalize(v10);
    CFRelease(v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_210721998(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL SISaveTextureAsPNG(void *a1, void *a2)
{
  id v3;
  NSString *v4;
  __CVBuffer *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  CGImage *v12;
  _BOOL8 v13;

  v3 = a1;
  v4 = a2;
  v5 = SICreateCVPixelBufferFromTexture(v3);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "pixelFormat") == 115 || objc_msgSend(v3, "pixelFormat") == 125)
    {
      objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIGammaAdjust"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x24BDBF960]);
      objc_msgSend(v7, "setValue:forKey:", &unk_24CA643C0, CFSTR("inputPower"));
      objc_msgSend(v7, "outputImage");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "width");
    v11 = objc_msgSend(v3, "height");
    v12 = (CGImage *)objc_msgSend(v9, "createCGImage:fromRect:format:colorSpace:", v6, *MEMORY[0x24BDBF8B8], CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A8]), 0.0, 0.0, (double)v10, (double)v11);
    v13 = SISaveCGImage(v12, v4, (UTType *)*MEMORY[0x24BDF84F8]);
    CGImageRelease(v12);
    CVPixelBufferRelease(v5);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_210721B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL SISaveCGImageAsPNG(CGImage *a1, NSString *a2)
{
  return SISaveCGImage(a1, a2, (UTType *)*MEMORY[0x24BDF84F8]);
}

BOOL SISaveTextureAsTIFF(void *a1, void *a2)
{
  id v3;
  NSString *v4;
  __CVBuffer *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  CGImage *v10;
  _BOOL8 v11;

  v3 = a1;
  v4 = a2;
  v5 = SICreateCVPixelBufferFromTexture(v3);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBF648], "contextWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "width");
    v9 = objc_msgSend(v3, "height");
    v10 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:format:colorSpace:", v6, *MEMORY[0x24BDBF8B8], CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A8]), 0.0, 0.0, (double)v8, (double)v9);
    v11 = SISaveCGImage(v10, v4, (UTType *)*MEMORY[0x24BDF85D0]);
    CGImageRelease(v10);
    CVPixelBufferRelease(v5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_210721CD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL SISaveCGImageAsTIFF(CGImage *a1, NSString *a2)
{
  return SISaveCGImage(a1, a2, (UTType *)*MEMORY[0x24BDF85D0]);
}

BOOL SISavePixelBufferTIFF(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeToTIFF:", v3);

  return v4 != 0;
}

void sub_210721D74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL SISavePixelBufferPNG(__CVBuffer *a1, void *a2)
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGColorSpace *DeviceRGB;
  size_t Width;
  CGImage *v10;
  _BOOL8 v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBF648];
  v13 = *MEMORY[0x24BDBF850];
  v14[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  Width = CVPixelBufferGetWidth(a1);
  v10 = (CGImage *)objc_msgSend(v7, "createCGImage:fromRect:format:colorSpace:", v4, *MEMORY[0x24BDBF8B0], DeviceRGB, 0.0, 0.0, (double)Width, (double)CVPixelBufferGetHeight(a1));
  v11 = SISaveCGImage(v10, v3, (UTType *)*MEMORY[0x24BDF84F8]);
  CGImageRelease(v10);
  CGColorSpaceRelease(DeviceRGB);

  return v11;
}

void sub_210721EF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL SISaveIOSurfacePNG(__IOSurface *a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  CVPixelBufferRef pixelBufferOut;

  v3 = a2;
  pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface(0, a1, 0, &pixelBufferOut);
  v4 = SISavePixelBufferPNG(pixelBufferOut, v3);
  CVPixelBufferRelease(pixelBufferOut);

  return v4;
}

void sub_210721F98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void SIDumpCVPixelBufferToFile(__CVBuffer *a1, void *a2)
{
  char *BaseAddress;
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t v7;
  uint64_t v8;
  char *v9;
  std::locale::id *v10;
  size_t v11;
  char *i;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  const std::locale::facet *v17;
  char *BaseAddressOfPlane;
  char *v19;
  size_t v20;
  size_t BytesPerRowOfPlane;
  size_t v22;
  size_t v23;
  uint64_t v24;
  char *v25;
  size_t v26;
  char *v27;
  char *j;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  const std::locale::facet *v32;
  id v33;
  __CVBuffer *pixelBuffer;
  size_t v35;
  std::locale v36;
  uint64_t v37;
  _BYTE v38[408];
  _QWORD v39[21];

  v39[19] = *MEMORY[0x24BDAC8D0];
  v33 = objc_retainAutorelease(a2);
  objc_msgSend(v33, "UTF8String");
  std::ofstream::basic_ofstream(&v37);
  CVPixelBufferLockBaseAddress(a1, 0);
  pixelBuffer = a1;
  if (CVPixelBufferGetPixelFormatType(a1) == 1111970369)
  {
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
    Width = CVPixelBufferGetWidth(a1);
    Height = CVPixelBufferGetHeight(a1);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    if (Height)
    {
      v7 = BytesPerRow;
      v8 = 0;
      v9 = BaseAddress + 3;
      v10 = (std::locale::id *)MEMORY[0x24BEDB350];
      do
      {
        v11 = Width;
        for (i = v9; v11; --v11)
        {
          v13 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v13, (uint64_t)" ", 1);
          v14 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)" ", 1);
          v15 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)" ", 1);
          v16 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v16, (uint64_t)" ", 1);
          i += 4;
        }
        std::ios_base::getloc((const std::ios_base *)&v38[*(_QWORD *)(v37 - 24) - 8]);
        v17 = std::locale::use_facet(&v36, v10);
        ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
        std::locale::~locale(&v36);
        std::ostream::put();
        std::ostream::flush();
        ++v8;
        v9 += v7;
      }
      while (v8 != Height);
    }
  }
  else if (CVPixelBufferGetPixelFormatType(a1) == 875836518)
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 0);
    v19 = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
    v20 = CVPixelBufferGetWidth(a1);
    v35 = CVPixelBufferGetHeight(a1);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
    v22 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
    if (v35)
    {
      v23 = v22;
      v24 = 0;
      v25 = v19 + 1;
      do
      {
        v26 = v20;
        v27 = v25;
        for (j = BaseAddressOfPlane; v26; --v26)
        {
          ++j;
          v29 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v29, (uint64_t)" ", 1);
          v30 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v30, (uint64_t)" ", 1);
          v31 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v31, (uint64_t)" ", 1);
          v27 += 2;
        }
        std::ios_base::getloc((const std::ios_base *)&v38[*(_QWORD *)(v37 - 24) - 8]);
        v32 = std::locale::use_facet(&v36, MEMORY[0x24BEDB350]);
        ((void (*)(const std::locale::facet *, uint64_t))v32->__vftable[2].~facet_0)(v32, 10);
        std::locale::~locale(&v36);
        std::ostream::put();
        std::ostream::flush();
        ++v24;
        BaseAddressOfPlane += BytesPerRowOfPlane;
        v25 += v23;
      }
      while (v24 != v35);
    }
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&v38[*(_QWORD *)(v37 - 24) - 8], *(_DWORD *)&v38[*(_QWORD *)(v37 - 24) + 24] | 4);
  v37 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)&v38[*(_QWORD *)(v37 - 24) - 8] = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 24);
  MEMORY[0x212BCA33C](v38);
  std::ostream::~ostream();
  MEMORY[0x212BCA3CC](v39);

}

void sub_210722370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, std::locale a13, uint64_t a14)
{
  std::ofstream::~ofstream(&a14);

  _Unwind_Resume(a1);
}

_QWORD *std::ofstream::basic_ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x24BEDB840];
  v3 = MEMORY[0x24BEDB840] + 64;
  a1[52] = MEMORY[0x24BEDB840] + 64;
  v4 = a1 + 1;
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 1);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[52] = v3;
  MEMORY[0x212BCA330](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_2107224B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BCA3CC](v1 + 416);
  _Unwind_Resume(a1);
}

_QWORD *std::ofstream::~ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E8];
  v3 = *MEMORY[0x24BEDB7E8];
  *a1 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x212BCA33C](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x212BCA3CC](a1 + 52);
  return a1;
}

uint64_t SICreateCVPixelBufferFromUrl(void *a1, OSType a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  _BYTE pixelBufferOut[12];
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF660], "imageWithContentsOfURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    __SceneIntelligenceLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)pixelBufferOut = 136381187;
      *(_QWORD *)&pixelBufferOut[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIIOUtility.mm";
      v24 = 1025;
      v25 = 251;
      v26 = 2113;
      v27 = v7;
      _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not load image resource '%{private}@' ***", pixelBufferOut, 0x1Cu);
    }

    goto LABEL_9;
  }
  if (a4)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", v8, 0);
    objc_msgSend(v11, "setValue:forKey:", MEMORY[0x24BDBD1B8], *MEMORY[0x24BDC5668]);

    v8 = v11;
  }
  *(_QWORD *)pixelBufferOut = 0;
  objc_msgSend(v10, "extent");
  v13 = v12;
  objc_msgSend(v10, "extent");
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (unint64_t)v13, (unint64_t)v14, a2, (CFDictionaryRef)v8, (CVPixelBufferRef *)pixelBufferOut);
  if (!*(_QWORD *)pixelBufferOut)
  {
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  v15 = objc_alloc(MEMORY[0x24BDBF648]);
  v21 = *MEMORY[0x24BDBF850];
  v22 = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithOptions:", v16);

  objc_msgSend(v17, "render:toCVPixelBuffer:", v10, *(_QWORD *)pixelBufferOut);
  v18 = *(_QWORD *)pixelBufferOut;
LABEL_10:

  return v18;
}

void sub_210722790(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

_QWORD *std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x212BCA360](v13, a1);
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
    if (!std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x212BCA36C](v13);
  return a1;
}

void sub_210722900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x212BCA36C](&a10);
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

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
      std::string::basic_string[abi:nn180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
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

void sub_210722A48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:nn180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    abort();
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

void sub_210722D14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_210723344(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210723BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  void *v11;

  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_210724268(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2107242F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SISceneUnderstanding;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100](uint64_t a1)
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

void sub_210724788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210724864(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_21072490C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210724D4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210724E58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210725928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  void *v33;
  void *v34;

  if (__p)
    operator delete(__p);
  if (a20)
    operator delete(a20);

  _Unwind_Resume(a1);
}

void sub_210725B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)SIBaseNetworkE5RT;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_210725F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2107260D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2107261AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21072626C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21072632C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2107263EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2107264AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21072656C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21072670C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2107267DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21072689C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21072696C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_210726A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210726AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210726BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210726C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210726D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210726DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210726EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210726F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_210727010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210727378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210728250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string const,std::unordered_set<int>>::~pair(uint64_t a1)
{
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void sub_2107286C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_210728784(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_210728934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  void *v27;

  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a27 < 0)
    operator delete(a22);

  _Unwind_Resume(a1);
}

void sub_210728C40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::unordered_set<int>>::pair[abi:nn180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::unordered_set<int>::unordered_set((uint64_t)&this[1], (uint64_t)a2 + 24);
  return this;
}

void sub_210728DC4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
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
      abort();
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

uint64_t std::unordered_set<int>::unordered_set(uint64_t a1, uint64_t a2)
{
  int *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(int **)(a2 + 16); i; i = *(int **)i)
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(a1, i + 4, i + 4);
  return a1;
}

void sub_210728EC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:nn180100]();
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
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
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
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
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

_QWORD *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(uint64_t a1, int *a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

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
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_210729314(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(uint64_t a1)
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

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(_QWORD *a1, uint64_t a2)
{
  unsigned __int8 *v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 **v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unint64_t v15;
  char v17;

  v2 = (unsigned __int8 *)a2;
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
  v6 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v17, (uint64_t *)a2, v5);
  v7 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v7)
    return 0;
  v8 = v6;
  v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    v11 = v6;
    if (v6 >= *(_QWORD *)&v7)
      v11 = v6 % *(_QWORD *)&v7;
  }
  else
  {
    v11 = (*(_QWORD *)&v7 - 1) & v6;
  }
  v12 = *(unsigned __int8 ***)(*a1 + 8 * v11);
  if (!v12)
    return 0;
  v13 = *v12;
  if (*v12)
  {
    v14 = (uint64_t)(a1 + 4);
    do
    {
      v15 = *((_QWORD *)v13 + 1);
      if (v15 == v8)
      {
        if ((std::equal_to<std::string>::operator()[abi:nn180100](v14, v13 + 16, v2) & 1) != 0)
          return v13;
      }
      else
      {
        if (v10 > 1)
        {
          if (v15 >= *(_QWORD *)&v7)
            v15 %= *(_QWORD *)&v7;
        }
        else
        {
          v15 &= *(_QWORD *)&v7 - 1;
        }
        if (v15 != v11)
          return 0;
      }
      v13 = *(unsigned __int8 **)v13;
    }
    while (v13);
  }
  return v13;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
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
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:nn180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:nn180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:nn180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:nn180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:nn180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:nn180100](_QWORD *a1, uint64_t a2)
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
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:nn180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

_QWORD *std::string::basic_string[abi:nn180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
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

char *std::vector<char const*>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<char const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a2);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  char *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD v30[2];
  char v31;

  v6 = (unsigned __int8 *)a2;
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
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
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
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  v18 = (char *)operator new(0x50uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = v11;
  v19 = *a4;
  v20 = **a4;
  *((_QWORD *)v18 + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  *(_OWORD *)(v18 + 40) = 0u;
  *(_OWORD *)(v18 + 56) = 0u;
  *((_DWORD *)v18 + 18) = 1065353216;
  v31 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    v23 = 1;
    if (v12 >= 3)
      v23 = (v12 & (v12 - 1)) != 0;
    v24 = v23 | (2 * v12);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v27)
  {
    *(_QWORD *)v30[0] = *v27;
    *v27 = v30[0];
  }
  else
  {
    *(_QWORD *)v30[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v30[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v30[0])
    {
      v28 = *(_QWORD *)(*(_QWORD *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12)
          v28 %= v12;
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v30[0];
    }
  }
  i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_210729D60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,0>(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  _QWORD *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD v30[2];
  char v31;

  v6 = (unsigned __int8 *)a2;
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
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
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
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  v18 = operator new(0x30uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *v18 = 0;
  v18[1] = v11;
  v19 = *a4;
  v20 = **a4;
  v18[4] = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  v18[5] = 0;
  v31 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    v23 = 1;
    if (v12 >= 3)
      v23 = (v12 & (v12 - 1)) != 0;
    v24 = v23 | (2 * v12);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v27)
  {
    *(_QWORD *)v30[0] = *v27;
    *v27 = v30[0];
  }
  else
  {
    *(_QWORD *)v30[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v30[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v30[0])
    {
      v28 = *(_QWORD *)(*(_QWORD *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12)
          v28 %= v12;
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v30[0];
    }
  }
  i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_21072A08C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,SIE5RTPort * {__strong}>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,SIE5RTPort * {__strong}>,0>(uint64_t a1)
{

  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void *std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  void **v15;
  void *i;
  unint64_t v17;
  _QWORD *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  _BYTE v31[8];
  uint64_t v32;
  char v33;

  v6 = (unsigned __int8 *)a2;
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
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v31, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
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
    v15 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(void **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, (unsigned __int8 *)i + 16, v6) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  v18 = (_QWORD *)(a1 + 16);
  i = operator new(0x30uLL);
  v32 = a1 + 16;
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v11;
  v19 = *a4;
  v20 = **a4;
  *((_QWORD *)i + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)i + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  *((_QWORD *)i + 5) = 0;
  v33 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    v23 = 1;
    if (v12 >= 3)
      v23 = (v12 & (v12 - 1)) != 0;
    v24 = v23 | (2 * v12);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v27 = *(_QWORD *)a1;
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v28)
  {
    *(_QWORD *)i = *v28;
LABEL_41:
    *v28 = i;
    goto LABEL_42;
  }
  *(_QWORD *)i = *v18;
  *v18 = i;
  *(_QWORD *)(v27 + 8 * v4) = v18;
  if (*(_QWORD *)i)
  {
    v29 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12)
        v29 %= v12;
    }
    else
    {
      v29 &= v12 - 1;
    }
    v28 = (_QWORD *)(*(_QWORD *)a1 + 8 * v29);
    goto LABEL_41;
  }
LABEL_42:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_21072A3A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *> *>>(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  BOOL v9;
  _QWORD *v10;
  BOOL v11;
  _QWORD v12[2];

  v4 = a2;
  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = (_QWORD *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8)
      v9 = a2 == a3;
    else
      v9 = 1;
    if (v9)
    {
      v10 = v8;
    }
    else
    {
      do
      {
        v12[0] = v8 + 2;
        v12[1] = v8 + 5;
        std::pair<std::string &,SIE5RTPort * {__strong}&>::operator=[abi:nn180100]<std::string const,SIE5RTPort * {__strong},(void *)0>((uint64_t)v12, (const std::string *)(v4 + 2));
        v10 = (_QWORD *)*v8;
        std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi(a1, (uint64_t)v8);
        v4 = (uint64_t *)*v4;
        if (v10)
          v11 = v4 == a3;
        else
          v11 = 1;
        v8 = v10;
      }
      while (!v11);
    }
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__deallocate_node((uint64_t)a1, v10);
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_multi<std::pair<std::string const,SIE5RTPort * {__strong}> const&>(a1, (__int128 *)v4 + 1);
    v4 = (uint64_t *)*v4;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  unsigned __int8 *v5;
  unint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 *inserted;
  char v12;

  v4 = *(unsigned __int8 *)(a2 + 39);
  v5 = (unsigned __int8 *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  if ((v4 & 0x80u) == 0)
    v7 = (uint64_t *)(a2 + 16);
  else
    v7 = *(uint64_t **)(a2 + 16);
  if ((v4 & 0x80u) == 0)
    v8 = v4;
  else
    v8 = v6;
  v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v12, v7, v8);
  *(_QWORD *)(a2 + 8) = v9;
  inserted = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi_prepare((uint64_t)a1, v9, v5);
  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi_perform(a1, (_QWORD *)a2, inserted);
  return a2;
}

void std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,SIE5RTPort * {__strong}>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::pair<std::string &,SIE5RTPort * {__strong}&>::operator=[abi:nn180100]<std::string const,SIE5RTPort * {__strong},(void *)0>(uint64_t a1, const std::string *a2)
{
  std::string::operator=(*(std::string **)a1, a2);
  objc_storeStrong(*(id **)(a1 + 8), a2[1].__r_.__value_.__l.__data_);
  return a1;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  uint64_t v6;
  float v7;
  unint64_t v8;
  float v9;
  _BOOL8 v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  unint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  int v22;

  v6 = a1 + 32;
  v7 = *(float *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  if (!v8 || (float)(v7 * (float)v8) < v9)
  {
    v10 = 1;
    if (v8 >= 3)
      v10 = (v8 & (v8 - 1)) != 0;
    v11 = v10 | (2 * v8);
    v12 = vcvtps_u32_f32(v9 / v7);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__rehash<false>(a1, v13);
    v8 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
  v14.i16[0] = vaddlv_u8(v14);
  v15 = v14.u32[0];
  if (v14.u32[0] > 1uLL)
  {
    v16 = a2;
    if (v8 <= a2)
      v16 = a2 % v8;
  }
  else
  {
    v16 = (v8 - 1) & a2;
  }
  v17 = *(unsigned __int8 **)(*(_QWORD *)a1 + 8 * v16);
  if (v17)
  {
    v18 = *(unsigned __int8 **)v17;
    if (*(_QWORD *)v17)
    {
      v19 = 0;
      do
      {
        v20 = *((_QWORD *)v18 + 1);
        if (v15 > 1)
        {
          v21 = *((_QWORD *)v18 + 1);
          if (v20 >= v8)
            v21 = v20 % v8;
        }
        else
        {
          v21 = v20 & (v8 - 1);
        }
        if (v21 != v16)
          break;
        v22 = v20 == a2 ? std::equal_to<std::string>::operator()[abi:nn180100](v6, v18 + 16, a3) : 0;
        if ((v19 & (v22 ^ 1) & 1) != 0)
          break;
        v19 |= v22;
        v17 = *(unsigned __int8 **)v17;
        v18 = *(unsigned __int8 **)v17;
      }
      while (*(_QWORD *)v17);
    }
  }
  return v17;
}

_QWORD *std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi_perform(_QWORD *result, _QWORD *a2, _QWORD *a3)
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

void std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__rehash<false>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__do_rehash<false>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 **v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  void *v11;
  unsigned __int8 *v12;
  unint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  unsigned __int8 *v17;
  unint64_t v18;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:nn180100]();
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
    v7 = *(unsigned __int8 ***)(a1 + 16);
    if (v7)
    {
      v8 = (unint64_t)v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      v10 = v9.u32[0];
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
      v12 = *v7;
      if (*v7)
      {
        v18 = v9.u32[0];
        do
        {
          v13 = *((_QWORD *)v12 + 1);
          if (v10 > 1)
          {
            if (v13 >= a2)
              v13 %= a2;
          }
          else
          {
            v13 &= a2 - 1;
          }
          if (v13 == v8)
          {
            v7 = (unsigned __int8 **)v12;
          }
          else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v13))
          {
            v14 = *(unsigned __int8 **)v12;
            if (*(_QWORD *)v12)
            {
              v15 = v12;
              while (1)
              {
                v16 = std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, v12 + 16, v14 + 16);
                v17 = *(unsigned __int8 **)v15;
                if (!v16)
                  break;
                v14 = *(unsigned __int8 **)v17;
                v15 = *(unsigned __int8 **)v15;
                if (!*(_QWORD *)v17)
                  goto LABEL_32;
              }
              v14 = *(unsigned __int8 **)v15;
              v17 = v15;
LABEL_32:
              v10 = v18;
            }
            else
            {
              v17 = v12;
            }
            *v7 = v14;
            *(_QWORD *)v17 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v13);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v13) = v12;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v13) = v7;
            v7 = (unsigned __int8 **)v12;
            v8 = v13;
          }
          v12 = *v7;
        }
        while (*v7);
      }
    }
  }
  else
  {
    v11 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v11)
      operator delete(v11);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__emplace_multi<std::pair<std::string const,SIE5RTPort * {__strong}> const&>(_QWORD *a1, __int128 *a2)
{
  uint64_t inserted;
  uint64_t v5[3];

  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__construct_node<std::pair<std::string const,SIE5RTPort * {__strong}> const&>((uint64_t)a1, a2, (uint64_t)v5);
  inserted = std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__node_insert_multi(a1, v5[0]);
  v5[0] = 0;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100]((uint64_t)v5, 0);
  return inserted;
}

void sub_21072AB28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

unint64_t std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__construct_node<std::pair<std::string const,SIE5RTPort * {__strong}> const&>@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *v7;
  int v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t result;
  char v12;

  v5 = a1 + 16;
  v6 = (char *)operator new(0x30uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = std::pair<std::string const,SIE5RTPort * {__strong}>::pair[abi:nn180100]((std::string *)(v6 + 16), a2);
  *(_BYTE *)(a3 + 16) = 1;
  v8 = v6[39];
  if (v8 >= 0)
    v9 = (uint64_t *)v7;
  else
    v9 = (uint64_t *)*((_QWORD *)v6 + 2);
  if (v8 >= 0)
    v10 = v6[39];
  else
    v10 = *((_QWORD *)v6 + 3);
  result = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v12, v9, v10);
  *((_QWORD *)v6 + 1) = result;
  return result;
}

void sub_21072ABC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,void *>>>>::reset[abi:nn180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,SIE5RTPort * {__strong}>::pair[abi:nn180100](std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  this[1].__r_.__value_.__r.__words[0] = (std::string::size_type)*((id *)a2 + 3);
  return this;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::find<std::string>(_QWORD *a1, uint64_t a2)
{
  unsigned __int8 *v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 **v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unint64_t v15;
  char v17;

  v2 = (unsigned __int8 *)a2;
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
  v6 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v17, (uint64_t *)a2, v5);
  v7 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v7)
    return 0;
  v8 = v6;
  v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    v11 = v6;
    if (v6 >= *(_QWORD *)&v7)
      v11 = v6 % *(_QWORD *)&v7;
  }
  else
  {
    v11 = (*(_QWORD *)&v7 - 1) & v6;
  }
  v12 = *(unsigned __int8 ***)(*a1 + 8 * v11);
  if (!v12)
    return 0;
  v13 = *v12;
  if (*v12)
  {
    v14 = (uint64_t)(a1 + 4);
    do
    {
      v15 = *((_QWORD *)v13 + 1);
      if (v8 == v15)
      {
        if ((std::equal_to<std::string>::operator()[abi:nn180100](v14, v13 + 16, v2) & 1) != 0)
          return v13;
      }
      else
      {
        if (v10 > 1)
        {
          if (v15 >= *(_QWORD *)&v7)
            v15 %= *(_QWORD *)&v7;
        }
        else
        {
          v15 &= *(_QWORD *)&v7 - 1;
        }
        if (v15 != v11)
          return 0;
      }
      v13 = *(unsigned __int8 **)v13;
    }
    while (v13);
  }
  return v13;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  char *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD v30[2];
  char v31;

  v6 = (unsigned __int8 *)a2;
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
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
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
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  v18 = (char *)operator new(0x80uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = v11;
  v19 = *a4;
  v20 = **a4;
  *((_QWORD *)v18 + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  *(_OWORD *)(v18 + 88) = 0u;
  *(_OWORD *)(v18 + 40) = 0u;
  *(_OWORD *)(v18 + 56) = 0u;
  *(_OWORD *)(v18 + 72) = 0u;
  *((_DWORD *)v18 + 24) = 1065353216;
  *((_QWORD *)v18 + 14) = 0;
  *((_QWORD *)v18 + 15) = 0;
  *((_QWORD *)v18 + 13) = 0;
  v31 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    v23 = 1;
    if (v12 >= 3)
      v23 = (v12 & (v12 - 1)) != 0;
    v24 = v23 | (2 * v12);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v27)
  {
    *(_QWORD *)v30[0] = *v27;
    *v27 = v30[0];
  }
  else
  {
    *(_QWORD *)v30[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v30[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v30[0])
    {
      v28 = *(_QWORD *)(*(_QWORD *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12)
          v28 %= v12;
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v30[0];
    }
  }
  i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_21072B008(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PrewiredFunctionInfo>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,PrewiredFunctionInfo>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,PrewiredFunctionInfo>,0>(uint64_t a1)
{
  void *v2;
  void **v3;

  v3 = (void **)(a1 + 88);
  std::vector<SIE5RTPort * {__strong}>::__destroy_vector::operator()[abi:nn180100](&v3);
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::~__hash_table(a1 + 48);
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::vector<SIE5RTPort * {__strong}>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        v4 -= 8;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_set<int>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_set<int>>,0>(uint64_t a1)
{
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::__split_buffer<SIE5RTPort * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  char *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD v30[2];
  char v31;

  v6 = (unsigned __int8 *)a2;
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
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
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
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  v18 = (char *)operator new(0x50uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = v11;
  v19 = *a4;
  v20 = **a4;
  *((_QWORD *)v18 + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  *(_OWORD *)(v18 + 40) = 0u;
  *(_OWORD *)(v18 + 56) = 0u;
  *((_DWORD *)v18 + 18) = 1065353216;
  v31 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    v23 = 1;
    if (v12 >= 3)
      v23 = (v12 & (v12 - 1)) != 0;
    v24 = v23 | (2 * v12);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v27)
  {
    *(_QWORD *)v30[0] = *v27;
    *v27 = v30[0];
  }
  else
  {
    *(_QWORD *)v30[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v30[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v30[0])
    {
      v28 = *(_QWORD *)(*(_QWORD *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12)
          v28 %= v12;
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v30[0];
    }
  }
  i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_21072B4D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_set<int>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_set<int>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,std::unordered_set<int>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_set<int>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_set<int>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(_QWORD *a1, int *a2)
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

void std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,PrewiredFunctionInfo>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,SIE5RTPort * {__strong}>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::unordered_map<std::string,SIE5RTPort * {__strong}>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SIE5RTPort * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SIE5RTPort * {__strong}>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PrewiredFunctionInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PrewiredFunctionInfo>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_21072C048(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21072C3BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21072CC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIE5RTSurfacePortDescriptor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21072D1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, void (*a14)(char *))
{
  a14(&a12);
  _Unwind_Resume(a1);
}

__CFString *SIGetSemanticLabelStringGlobal(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 > 0x29)
  {
    if (a1 == 255)
      return CFSTR("Invalid");
    else
      return (__CFString *)0;
  }
  else
  {
    objc_msgSend(&unk_24CA65820, "objectAtIndexedSubscript:", a1, v1, v2);
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  }
}

__CFString *SIGetSemanticLabelStringV3(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 > 0x1D)
  {
    if (a1 == 255)
      return CFSTR("Invalid");
    else
      return (__CFString *)0;
  }
  else
  {
    objc_msgSend(&unk_24CA65838, "objectAtIndexedSubscript:", a1, v1, v2);
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  }
}

double SICreateSceneSegmentationV3ToGlobalLabelMapping()
{
  char *v0;
  double result;

  v0 = (char *)malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
  *(_OWORD *)v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  *((_OWORD *)v0 + 3) = 0u;
  *((_OWORD *)v0 + 4) = 0u;
  *((_OWORD *)v0 + 5) = 0u;
  *((_OWORD *)v0 + 6) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  *((_OWORD *)v0 + 8) = 0u;
  *((_OWORD *)v0 + 9) = 0u;
  *((_OWORD *)v0 + 10) = 0u;
  *((_OWORD *)v0 + 11) = 0u;
  *((_OWORD *)v0 + 12) = 0u;
  *((_OWORD *)v0 + 13) = 0u;
  *((_OWORD *)v0 + 14) = 0u;
  *(_OWORD *)(v0 + 239) = 0u;
  v0[29] = 33;
  *(_OWORD *)(v0 + 1) = xmmword_21074BB80;
  *(_QWORD *)(v0 + 17) = 0x1F29152813121110;
  *(_QWORD *)&result = 639902240;
  *(_DWORD *)(v0 + 25) = 639902240;
  v0[255] = -1;
  return result;
}

uint64_t SISceneSegmentationGetLegacyToV2LabelMapping(unint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(&unk_24CA65850, "count") <= a1)
    return 0;
  objc_msgSend(&unk_24CA65850, "objectAtIndexedSubscript:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

uint64_t SISceneSegmentationGetV2ToLegacyLabelMapping(unint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(&unk_24CA65868, "count") <= a1)
    return 0;
  objc_msgSend(&unk_24CA65868, "objectAtIndexedSubscript:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

double SISceneSegmentationGetSupportedResolution(uint64_t a1)
{
  double v1;

  v1 = 256.0;
  if (a1 == 2)
    v1 = 192.0;
  if (a1 == 3)
    v1 = 320.0;
  if (a1 == 4)
    return 256.0;
  else
    return v1;
}

float32x2_t kannalaforw(float32x4_t a1, __n128 a2)
{
  float32x2_t v2;
  float v3;
  float v4;
  float v5;
  float32x2_t v19;
  float v20;

  v2 = *(float32x2_t *)a1.f32;
  v3 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmulq_f32(a1, a1).i32[1]), v2.f32[0], v2.f32[0]));
  v4 = 1.0;
  if (v3 != 0.0)
  {
    v19 = v2;
    v20 = a1.f32[2];
    v5 = atan2f(v3, a1.f32[2]);
    _S3 = (float)(v5 * v5) * (float)(v5 * (float)(v5 * v5));
    _S4 = (float)(v5 * v5) * _S3;
    _S5 = (float)(v5 * v5) * _S4;
    _Q6 = a2;
    __asm
    {
      FMLA            S0, S3, V6.S[1]
      FMLA            S0, S4, V6.S[2]
      FMLA            S0, S5, V6.S[3]
    }
    v2 = v19;
    v4 = (float)(fabsf(v20) * _S0) / v3;
  }
  return vmul_n_f32(v2, v4);
}

float32x2_t kannalarev(float32x4_t a1, float32x4_t a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  int v11;
  float v12;
  float v13;
  float v14;
  float v16;
  float v17;
  float32x2_t v20;

  v20 = *(float32x2_t *)a1.f32;
  v2 = a2.f32[1];
  v3 = a2.f32[2];
  v4 = a2.f32[3];
  v5 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmulq_f32(a1, a1).i32[1]), a1.f32[0], a1.f32[0])) / a1.f32[2];
  v6 = atanf(v5);
  v7 = vmuls_lane_f32(5.0, *(float32x2_t *)a2.f32, 1);
  v8 = vmuls_lane_f32(7.0, a2, 2);
  v9 = vmuls_lane_f32(9.0, a2, 3);
  v10 = 0.0;
  v11 = 9;
  do
  {
    v12 = v6;
    v13 = v6 * v6;
    v6 = v12
       - (float)((float)((float)((float)((float)((float)(v12 + (float)(a2.f32[0] * (float)(v12 * v13)))
                                               + (float)(v2 * (float)(v12 * (float)(v13 * v13))))
                                       + (float)(v3 * (float)(v12 * (float)(v13 * (float)(v13 * v13)))))
                               + (float)(v4 * (float)(v12 * (float)((float)(v13 * v13) * (float)(v13 * v13)))))
                       - v5)
               / (float)((float)((float)((float)((float)((float)(3.0 * a2.f32[0]) * v13) + 1.0)
                                       + (float)(v7 * (float)(v13 * v13)))
                               + (float)(v8 * (float)(v13 * (float)(v13 * v13))))
                       + (float)(v9 * (float)((float)(v13 * v13) * (float)(v13 * v13)))));
    v14 = vabds_f32(v12, v6);
    v10 = v10 + v14;
  }
  while (v14 >= 0.0001 && v11-- != 0);
  v16 = tanf(v6);
  v17 = 1.0;
  if (v5 != 0.0 && v10 <= 1.0)
    v17 = fabsf(v16) / v5;
  return vmul_n_f32(v20, v17);
}

void sub_21072FE44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21072FFC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2107301D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210730D80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210731340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void *std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  void **v15;
  void *i;
  unint64_t v17;
  _QWORD *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  _BYTE v31[8];
  uint64_t v32;
  char v33;

  v6 = (unsigned __int8 *)a2;
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
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v31, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
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
    v15 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(void **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, (unsigned __int8 *)i + 16, v6) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  v18 = (_QWORD *)(a1 + 16);
  i = operator new(0x30uLL);
  v32 = a1 + 16;
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v11;
  v19 = *a4;
  v20 = **a4;
  *((_QWORD *)i + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)i + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  *((_DWORD *)i + 10) = 0;
  v33 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    v23 = 1;
    if (v12 >= 3)
      v23 = (v12 & (v12 - 1)) != 0;
    v24 = v23 | (2 * v12);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v27 = *(_QWORD *)a1;
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v28)
  {
    *(_QWORD *)i = *v28;
LABEL_41:
    *v28 = i;
    goto LABEL_42;
  }
  *(_QWORD *)i = *v18;
  *v18 = i;
  *(_QWORD *)(v27 + 8 * v4) = v18;
  if (*(_QWORD *)i)
  {
    v29 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12)
        v29 %= v12;
    }
    else
    {
      v29 &= v12 - 1;
    }
    v28 = (_QWORD *)(*(_QWORD *)a1 + 8 * v29);
    goto LABEL_41;
  }
LABEL_42:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_2107316D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v11, v10);
  _Unwind_Resume(a1);
}

void sub_210731940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210731A20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210731AB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210731B70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210731CEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210731DE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210731E84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2107320C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_210732164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SIPeopleSegmentation;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21073409C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21073424C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIE5RTTensorPortDescriptor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_210734658(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id __SceneIntelligenceLogSharedInstance()
{
  if (__SceneIntelligenceLogSharedInstance_onceToken != -1)
    dispatch_once(&__SceneIntelligenceLogSharedInstance_onceToken, &__block_literal_global_1);
  return (id)sharedInstance;
}

void sub_21073580C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2107358D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210735A18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210735D3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210735DFC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 33) < 0)
    operator delete(*(void **)(v1 - 56));
  _Unwind_Resume(exception_object);
}

void sub_210736098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);
  operator delete(v15);
  _Unwind_Resume(a1);
}

void sub_21073617C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2107361FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2107362C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_210736358(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2107363E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2107366F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2107367C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073686C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210736918(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210736AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  _Unwind_Resume(a1);
}

void sub_210736B7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210736C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210736CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210736D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210736DE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210736E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210736FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_21073714C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073757C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210737764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210737AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIBaseNetworkEspresso;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_210737B08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210737C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::string,espresso_buffer_t>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unsigned __int8 *v7;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint8x8_t v14;
  unint64_t v15;
  void **v16;
  char *v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  float v26;
  float v27;
  _BOOL8 v28;
  unint64_t v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  _BYTE v36[8];
  uint64_t v37;
  char v38;

  v7 = (unsigned __int8 *)a2;
  v9 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v10 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v10 = v9;
  }
  v11 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v36, (uint64_t *)a2, v10);
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 8);
  if (v13)
  {
    v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    v15 = v14.u32[0];
    if (v14.u32[0] > 1uLL)
    {
      v4 = v11;
      if (v11 >= v13)
        v4 = v11 % v13;
    }
    else
    {
      v4 = (v13 - 1) & v11;
    }
    v16 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v16)
    {
      v17 = (char *)*v16;
      if (*v16)
      {
        do
        {
          v18 = *((_QWORD *)v17 + 1);
          if (v18 == v12)
          {
            if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, (unsigned __int8 *)v17 + 16, v7) & 1) != 0)
              return v17;
          }
          else
          {
            if (v15 > 1)
            {
              if (v18 >= v13)
                v18 %= v13;
            }
            else
            {
              v18 &= v13 - 1;
            }
            if (v18 != v4)
              break;
          }
          v17 = *(char **)v17;
        }
        while (v17);
      }
    }
  }
  v19 = (_QWORD *)(a1 + 16);
  v17 = (char *)operator new(0xD0uLL);
  *((_OWORD *)v17 + 1) = *(_OWORD *)a3;
  v20 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v21 = *(_OWORD *)(a4 + 96);
  *(_OWORD *)(v17 + 152) = *(_OWORD *)(a4 + 112);
  v22 = *(_OWORD *)(a4 + 144);
  *(_OWORD *)(v17 + 168) = *(_OWORD *)(a4 + 128);
  *(_OWORD *)(v17 + 184) = v22;
  v23 = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v17 + 88) = *(_OWORD *)(a4 + 48);
  v24 = *(_OWORD *)(a4 + 80);
  *(_OWORD *)(v17 + 104) = *(_OWORD *)(a4 + 64);
  *(_OWORD *)(v17 + 120) = v24;
  *(_OWORD *)(v17 + 136) = v21;
  v25 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v17 + 40) = *(_OWORD *)a4;
  v37 = a1 + 16;
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = v12;
  *((_QWORD *)v17 + 4) = v20;
  *((_QWORD *)v17 + 25) = *(_QWORD *)(a4 + 160);
  *(_OWORD *)(v17 + 56) = v25;
  *(_OWORD *)(v17 + 72) = v23;
  v38 = 1;
  v26 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v27 = *(float *)(a1 + 32);
  if (!v13 || (float)(v27 * (float)v13) < v26)
  {
    v28 = 1;
    if (v13 >= 3)
      v28 = (v13 & (v13 - 1)) != 0;
    v29 = v28 | (2 * v13);
    v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30)
      v31 = v30;
    else
      v31 = v29;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v31);
    v13 = *(_QWORD *)(a1 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v12 >= v13)
        v4 = v12 % v13;
      else
        v4 = v12;
    }
    else
    {
      v4 = (v13 - 1) & v12;
    }
  }
  v32 = *(_QWORD *)a1;
  v33 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v33)
  {
    *(_QWORD *)v17 = *v33;
LABEL_41:
    *v33 = v17;
    goto LABEL_42;
  }
  *(_QWORD *)v17 = *v19;
  *v19 = v17;
  *(_QWORD *)(v32 + 8 * v4) = v19;
  if (*(_QWORD *)v17)
  {
    v34 = *(_QWORD *)(*(_QWORD *)v17 + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v34 >= v13)
        v34 %= v13;
    }
    else
    {
      v34 &= v13 - 1;
    }
    v33 = (_QWORD *)(*(_QWORD *)a1 + 8 * v34);
    goto LABEL_41;
  }
LABEL_42:
  ++*(_QWORD *)(a1 + 24);
  return v17;
}

void sub_2107380EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v11, v10);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  _QWORD *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD v30[2];
  char v31;

  v6 = (unsigned __int8 *)a2;
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
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
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
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  v18 = operator new(0x40uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *v18 = 0;
  v18[1] = v11;
  v19 = *a4;
  v20 = **a4;
  v18[4] = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  v18[6] = 0;
  v18[7] = 0;
  v18[5] = 0;
  v31 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    v23 = 1;
    if (v12 >= 3)
      v23 = (v12 & (v12 - 1)) != 0;
    v24 = v23 | (2 * v12);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v27)
  {
    *(_QWORD *)v30[0] = *v27;
    *v27 = v30[0];
  }
  else
  {
    *(_QWORD *)v30[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v30[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v30[0])
    {
      v28 = *(_QWORD *)(*(_QWORD *)v30[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v28 >= v12)
          v28 %= v12;
      }
      else
      {
        v28 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v30[0];
    }
  }
  i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_2107383A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<unsigned long>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<unsigned long>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<unsigned long>>,0>(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

char *std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  void **v15;
  char *v16;
  unint64_t v17;
  _QWORD *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  _BYTE v31[8];
  uint64_t v32;
  char v33;

  v6 = (unsigned __int8 *)a2;
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
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v31, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
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
    v15 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      v16 = (char *)*v15;
      if (*v15)
      {
        do
        {
          v17 = *((_QWORD *)v16 + 1);
          if (v17 == v11)
          {
            if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, (unsigned __int8 *)v16 + 16, v6) & 1) != 0)
              return v16;
          }
          else
          {
            if (v14 > 1)
            {
              if (v17 >= v12)
                v17 %= v12;
            }
            else
            {
              v17 &= v12 - 1;
            }
            if (v17 != v4)
              break;
          }
          v16 = *(char **)v16;
        }
        while (v16);
      }
    }
  }
  v18 = (_QWORD *)(a1 + 16);
  v16 = (char *)operator new(0xD0uLL);
  v32 = a1 + 16;
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = v11;
  v19 = *a4;
  v20 = **a4;
  *((_QWORD *)v16 + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v16 + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  *(_OWORD *)(v16 + 40) = 0u;
  *(_OWORD *)(v16 + 56) = 0u;
  *(_OWORD *)(v16 + 72) = 0u;
  *(_OWORD *)(v16 + 88) = 0u;
  *(_OWORD *)(v16 + 104) = 0u;
  *(_OWORD *)(v16 + 120) = 0u;
  *(_OWORD *)(v16 + 136) = 0u;
  *(_OWORD *)(v16 + 152) = 0u;
  *(_OWORD *)(v16 + 168) = 0u;
  *(_OWORD *)(v16 + 184) = 0u;
  *((_QWORD *)v16 + 25) = 0;
  v33 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    v23 = 1;
    if (v12 >= 3)
      v23 = (v12 & (v12 - 1)) != 0;
    v24 = v23 | (2 * v12);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v26);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v27 = *(_QWORD *)a1;
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v28)
  {
    *(_QWORD *)v16 = *v28;
LABEL_41:
    *v28 = v16;
    goto LABEL_42;
  }
  *(_QWORD *)v16 = *v18;
  *v18 = v16;
  *(_QWORD *)(v27 + 8 * v4) = v18;
  if (*(_QWORD *)v16)
  {
    v29 = *(_QWORD *)(*(_QWORD *)v16 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12)
        v29 %= v12;
    }
    else
    {
      v29 &= v12 - 1;
    }
    v28 = (_QWORD *)(*(_QWORD *)a1 + 8 * v29);
    goto LABEL_41;
  }
LABEL_42:
  ++*(_QWORD *)(a1 + 24);
  return v16;
}

void sub_2107386E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v11, v10);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  unsigned __int8 *v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v27[3];

  v6 = (unsigned __int8 *)a2;
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
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v27, (uint64_t *)a2, v9);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
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
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v6) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v11, a4, (uint64_t)v27);
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    v20 = 1;
    if (v12 >= 3)
      v20 = (v12 & (v12 - 1)) != 0;
    v21 = v20 | (2 * v12);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v23);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v24)
  {
    *(_QWORD *)v27[0] = *v24;
    *v24 = v27[0];
  }
  else
  {
    *(_QWORD *)v27[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v27[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v27[0])
    {
      v25 = *(_QWORD *)(*(_QWORD *)v27[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12)
          v25 %= v12;
      }
      else
      {
        v25 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = v27[0];
    }
  }
  i = (unsigned __int8 *)v27[0];
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_210738980(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100]((uint64_t)&a13, __p);
  _Unwind_Resume(exception_object);
}

double std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;
  double result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0xD0uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  *((_QWORD *)v8 + 25) = 0;
  result = 0.0;
  *(_OWORD *)(v8 + 184) = 0u;
  *(_OWORD *)(v8 + 168) = 0u;
  *(_OWORD *)(v8 + 152) = 0u;
  *(_OWORD *)(v8 + 136) = 0u;
  *(_OWORD *)(v8 + 120) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_210738A5C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,void *>>>::operator()[abi:nn180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<unsigned long>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

__CFString *SIResultStatusToString(unint64_t a1)
{
  if (a1 < 6)
    return *(&off_24CA5D190 + a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *SIDeviceOrientationToString(unint64_t a1)
{
  if (a1 < 4)
    return *(&off_24CA5D1C0 + a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *SIComputeEngineTypeToString(unint64_t a1)
{
  if (a1 < 3)
    return *(&off_24CA5D1E0 + a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *SIEarlyExitToString(unint64_t a1)
{
  if (a1 < 5)
    return *(&off_24CA5D1F8 + a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *SIComputeEnginePriorityToString(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("SIComputeEnginePriorityDefault");
  if (a1 == 1)
  {
    v1 = CFSTR("SIComputeEnginePriorityLow");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void make_crc_table()
{
  uint64_t i;
  uint64_t v1;
  unsigned int v2;

  for (i = 0; i != 256; ++i)
  {
    v1 = 8;
    v2 = i;
    do
    {
      if ((v2 & 1) != 0)
        v2 = (v2 >> 1) ^ 0xEDB88320;
      else
        v2 >>= 1;
      --v1;
    }
    while (v1);
    crc_table[i] = v2;
  }
  crc_table_computed = 1;
}

uint64_t update_crc(uint64_t result, char *a2, uint64_t a3)
{
  uint64_t i;
  uint64_t v4;
  unsigned int v5;
  char v6;

  if (crc_table_computed)
  {
    if (!a3)
      return result;
    goto LABEL_12;
  }
  for (i = 0; i != 256; ++i)
  {
    v4 = 8;
    v5 = i;
    do
    {
      if ((v5 & 1) != 0)
        v5 = (v5 >> 1) ^ 0xEDB88320;
      else
        v5 >>= 1;
      --v4;
    }
    while (v4);
    crc_table[i] = v5;
  }
  for (crc_table_computed = 1; a3; --a3)
  {
LABEL_12:
    v6 = *a2++;
    result = crc_table[(v6 ^ result)] ^ (result >> 8);
  }
  return result;
}

uint64_t crc(char *a1, uint64_t a2)
{
  return ~update_crc(0xFFFFFFFFLL, a1, a2);
}

NSObject *si_surface_load_from_data_internal(uint64_t a1, uint64_t *a2)
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t *v12;
  size_t v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  const void *v26;
  size_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v43 = 100;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a1, 0, &v43, &v42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v42;
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("properties"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      if (a2)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v52 = *MEMORY[0x24BDD0FC8];
        v53 = CFSTR("No properties in payload");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sceneintelligence"), 1, v18);
        *a2 = objc_claimAutoreleasedReturnValue();

      }
      __SceneIntelligenceLogSharedInstance();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        v56 = 1025;
        v57 = 90;
        _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** No properties in payload ***", buf, 0x12u);
      }
      v16 = 0;
      goto LABEL_44;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("data_size"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject unsignedIntegerValue](v7, "unsignedIntegerValue");
    if (!v8)
    {
      if (a2)
      {
        v19 = (void *)MEMORY[0x24BDD1540];
        v50 = *MEMORY[0x24BDD0FC8];
        v51 = CFSTR("No data size in payload");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sceneintelligence"), 1, v20);
        *a2 = objc_claimAutoreleasedReturnValue();

      }
      __SceneIntelligenceLogSharedInstance();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        v56 = 1025;
        v57 = 100;
        _os_log_impl(&dword_21071A000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** No data size in payload ***", buf, 0x12u);
      }
      v16 = 0;
      goto LABEL_43;
    }
    v9 = v8;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("compressed_data"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v9);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (uint8_t *)objc_msgSend(v11, "bytes");
      v40 = v11;
      v13 = objc_msgSend(v11, "length");
      v41 = v10;
      v14 = objc_retainAutorelease(v10);
      if (compression_decode_buffer(v12, v13, (const uint8_t *)-[NSObject bytes](v14, "bytes"), -[NSObject length](v14, "length"), 0, COMPRESSION_LZ4) != v9)
      {
        if (a2)
        {
          v29 = (void *)MEMORY[0x24BDD1540];
          v48 = *MEMORY[0x24BDD0FC8];
          v49 = CFSTR("Uncompressing data failed.");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sceneintelligence"), 1, v30);
          *a2 = objc_claimAutoreleasedReturnValue();

        }
        __SceneIntelligenceLogSharedInstance();
        v21 = objc_claimAutoreleasedReturnValue();
        v15 = v40;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136380931;
          v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
          v56 = 1025;
          v57 = 112;
          _os_log_impl(&dword_21071A000, v21, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Uncompressing data failed. ***", buf, 0x12u);
        }
        v16 = 0;
        v10 = v41;
        goto LABEL_42;
      }
      v15 = v11;
      v10 = v41;
    }
    else
    {
      v15 = 0;
    }
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD8DE8]), "initWithProperties:", v6);
    if (v21)
    {
      v22 = objc_msgSend(v15, "length");
      if (v22 == -[NSObject allocationSize](v21, "allocationSize"))
      {
        v23 = objc_retainAutorelease(v21);
        v24 = v10;
        v25 = -[NSObject baseAddress](v23, "baseAddress");
        v15 = objc_retainAutorelease(v15);
        v26 = (const void *)objc_msgSend(v15, "bytes");
        v27 = -[NSObject allocationSize](v23, "allocationSize");
        v28 = (void *)v25;
        v10 = v24;
        memcpy(v28, v26, v27);
        v21 = v23;
        v16 = v21;
LABEL_42:

LABEL_43:
LABEL_44:

        goto LABEL_45;
      }
      if (a2)
      {
        v36 = (void *)MEMORY[0x24BDD1540];
        v44 = *MEMORY[0x24BDD0FC8];
        v45 = CFSTR("Mismatching data sizes for surface.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v37 = v10;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sceneintelligence"), 1, v38);
        *a2 = objc_claimAutoreleasedReturnValue();

        v10 = v37;
      }
      __SceneIntelligenceLogSharedInstance();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_41:

        v16 = 0;
        goto LABEL_42;
      }
      *(_DWORD *)buf = 136380931;
      v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      v56 = 1025;
      v57 = 131;
      v35 = " %{private}s:%{private}d *** Mismatching data sizes for surface. ***";
    }
    else
    {
      if (a2)
      {
        v31 = (void *)MEMORY[0x24BDD1540];
        v46 = *MEMORY[0x24BDD0FC8];
        v47 = CFSTR("Failed to create surface.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v32 = v10;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sceneintelligence"), 1, v33);
        *a2 = objc_claimAutoreleasedReturnValue();

        v10 = v32;
      }
      __SceneIntelligenceLogSharedInstance();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        goto LABEL_41;
      *(_DWORD *)buf = 136380931;
      v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      v56 = 1025;
      v57 = 124;
      v35 = " %{private}s:%{private}d *** Failed to create surface. ***";
    }
    _os_log_impl(&dword_21071A000, v34, OS_LOG_TYPE_ERROR, v35, buf, 0x12u);
    goto LABEL_41;
  }
  if (a2 && v4)
    *a2 = (uint64_t)v4;
  __SceneIntelligenceLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136380931;
    v55 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
    v56 = 1025;
    v57 = 81;
    _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to deserialize plist data ***", buf, 0x12u);
  }
  v16 = 0;
LABEL_45:

  return v16;
}

void *si_surface_load_from_data(void *a1, uint64_t *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t *v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned int *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  size_t v16;
  double v17;
  CVPixelBufferRef v18;
  __CVBuffer *v19;
  void *v20;
  IOSurfaceRef IOSurface;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (_QWORD *)objc_msgSend(v5, "bytes");
  v7 = v6;
  if (*v6 != 0xA1A0A0D474E5089)
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *v7;
      *(_DWORD *)buf = 136381443;
      v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      v30 = 1025;
      v31 = 156;
      v32 = 2048;
      v33 = v12;
      v34 = 2048;
      v35 = 0xA1A0A0D474E5089;
      _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Wrong png header %llu %llu ***", buf, 0x26u);
    }
    goto LABEL_17;
  }
  if (v4 < 9)
    goto LABEL_10;
  v8 = (unsigned int *)(v6 + 1);
  while (1)
  {
    v9 = bswap32(*v8);
    v10 = v8 + 2;
    if (bswap32(v8[1]) == *(_DWORD *)SIPngChunkType)
      break;
    v8 = (unsigned int *)((char *)v10 + v9 + 4);
    if (v8 >= (unsigned int *)((char *)v6 + v4))
      goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = si_surface_load_from_data_internal((uint64_t)v13, a2);

  if (!v14)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x24BDBF660], "imageWithData:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject extent](v11, "extent");
    v16 = (unint64_t)v15;
    -[NSObject extent](v11, "extent");
    v18 = SICreateCVPixelBuffer(v16, (unint64_t)v17, 0x42475241u, 1);
    if (v18)
    {
      v19 = v18;
      objc_msgSend(MEMORY[0x24BDBF648], "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "render:toCVPixelBuffer:", v11, v19);
      IOSurface = CVPixelBufferGetIOSurface(v19);
      v14 = (void *)CFRetain(IOSurface);
      CVPixelBufferRelease(v19);

LABEL_18:
      goto LABEL_19;
    }
    if (a2)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v26 = *MEMORY[0x24BDD0FC8];
      v27 = CFSTR("Failed to load fallback png data");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sceneintelligence"), 1, v23);
      *a2 = objc_claimAutoreleasedReturnValue();

    }
    __SceneIntelligenceLogSharedInstance();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v29 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      v30 = 1025;
      v31 = 197;
      _os_log_impl(&dword_21071A000, v24, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to load fallback png data ***", buf, 0x12u);
    }

LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
LABEL_19:

  return v14;
}

void *si_surface_load_from_url(uint64_t a1, uint64_t *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = si_surface_load_from_data(v3, a2);
  }
  else
  {
    if (a2)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BDD0FC8];
      v15[0] = CFSTR("Failed to load file");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sceneintelligence"), 1, v7);
      *a2 = objc_claimAutoreleasedReturnValue();

    }
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136380931;
      v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      v12 = 1025;
      v13 = 211;
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to load file ***", (uint8_t *)&v10, 0x12u);
    }

    v5 = 0;
  }

  return v5;
}

uint64_t si_surface_save_to_data_internal(__IOSurface *a1)
{
  CFDictionaryRef v2;
  void *v3;
  void *v4;
  void *BaseAddress;
  void *v6;
  id v7;
  uint8_t *v8;
  size_t v9;
  id v10;
  size_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v21;
  _QWORD v22[4];
  _QWORD v23[4];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = IOSurfaceCopyAllValues(a1);
  -[__CFDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", CFSTR("CreationProperties"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDBCE50];
  BaseAddress = IOSurfaceGetBaseAddress(a1);
  objc_msgSend(v4, "dataWithBytes:length:", BaseAddress, IOSurfaceGetAllocSize(a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v6, "length"));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (uint8_t *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  v10 = objc_retainAutorelease(v6);
  v11 = compression_encode_buffer(v8, v9, (const uint8_t *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0, COMPRESSION_LZ4);
  v12 = (void *)MEMORY[0x24BDBCE50];
  v13 = objc_retainAutorelease(v7);
  objc_msgSend(v12, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v13, "bytes"), v11, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v11)
  {
    v23[0] = v14;
    v22[0] = CFSTR("compressed_data");
    v22[1] = CFSTR("data_size");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v16;
    v22[2] = CFSTR("compressed_data_size");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = CFSTR("properties");
    v23[2] = v17;
    v23[3] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v18 = objc_claimAutoreleasedReturnValue();

    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v18, 100, 0, &v21);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381443;
      v25 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
      v26 = 1025;
      v27 = 226;
      v28 = 2048;
      v29 = objc_msgSend(v13, "length");
      v30 = 2048;
      v31 = objc_msgSend(v10, "length");
      _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to compress data! dest length %zu src length %zu ***", buf, 0x26u);
    }
    v19 = 0;
  }

  return v19;
}

id si_surface_png_representation(__IOSurface *a1)
{
  NSObject *v2;
  const __CFDictionary *v4;
  const __CFAllocator *v5;
  NSObject *v6;
  void *v7;
  size_t Width;
  size_t Height;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  OSStatus v14;
  CGColorSpace *v15;
  void *v16;
  CVPixelBufferRef v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  CVPixelBufferRef destinationBuffer;
  CVPixelBufferRef pixelBufferOut;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  uint64_t v27;
  CGColorSpace *v28;
  uint64_t v29;
  CGColorSpace *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  OSStatus v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  pixelTransferSessionOut = 0;
  if (!VTPixelTransferSessionCreate(0, &pixelTransferSessionOut))
  {
    pixelBufferOut = 0;
    v37 = *MEMORY[0x24BDC55F8];
    v38[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, v4, &pixelBufferOut))
    {
      __SceneIntelligenceLogSharedInstance();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        v33 = 1025;
        v34 = 252;
        _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create input pixel buffer ***", buf, 0x12u);
      }

      v7 = 0;
      goto LABEL_18;
    }
    destinationBuffer = 0;
    Width = IOSurfaceGetWidth(a1);
    Height = IOSurfaceGetHeight(a1);
    if (CVPixelBufferCreate(v5, Width, Height, 0x42475241u, 0, &destinationBuffer))
    {
      __SceneIntelligenceLogSharedInstance();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        v33 = 1025;
        v34 = 258;
        v11 = " %{private}s:%{private}d *** Failed to create output pixel buffer ***";
        v12 = v10;
        v13 = 18;
LABEL_15:
        _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      }
    }
    else
    {
      v14 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, destinationBuffer);
      VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
      CFRelease(pixelTransferSessionOut);
      CVPixelBufferRelease(pixelBufferOut);
      if (!v14)
      {
        v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A8]);
        v16 = (void *)MEMORY[0x24BDBF660];
        v17 = destinationBuffer;
        v29 = *MEMORY[0x24BDBF8E8];
        v30 = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "imageWithCVPixelBuffer:options:", v17, v18);
        v10 = objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v19 = (void *)MEMORY[0x24BDBF648];
          v27 = *MEMORY[0x24BDBF858];
          v28 = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "contextWithOptions:", v20);
          v21 = objc_claimAutoreleasedReturnValue();

          v22 = *MEMORY[0x24BDBF868];
          v23 = -[NSObject workingColorSpace](v21, "workingColorSpace");
          -[NSObject PNGRepresentationOfImage:format:colorSpace:options:](v21, "PNGRepresentationOfImage:format:colorSpace:options:", v10, v22, v23, MEMORY[0x24BDBD1B8]);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          CGColorSpaceRelease(v15);
          CVPixelBufferRelease(destinationBuffer);
        }
        else
        {
          __SceneIntelligenceLogSharedInstance();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136380931;
            v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
            v33 = 1025;
            v34 = 278;
            _os_log_impl(&dword_21071A000, v21, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create CIImage ***", buf, 0x12u);
          }
          v7 = 0;
        }

        goto LABEL_17;
      }
      __SceneIntelligenceLogSharedInstance();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
        v33 = 1025;
        v34 = 269;
        v35 = 1024;
        v36 = v14;
        v11 = " %{private}s:%{private}d *** Failed to transfer pixel buffer: %d ***";
        v12 = v10;
        v13 = 24;
        goto LABEL_15;
      }
    }
    v7 = 0;
LABEL_17:

LABEL_18:
    return v7;
  }
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136380931;
    v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SISurface.m";
    v33 = 1025;
    v34 = 243;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create pixel transfer session ***", buf, 0x12u);
  }

  return 0;
}

id si_surface_save_to_data(__IOSurface *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int v20;

  si_surface_png_representation(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)si_surface_save_to_data_internal(a1);
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "length");
      v6 = objc_msgSend(v2, "length");
      objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v5 + v6 + 12);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = (void *)objc_msgSend(v7, "mutableBytes");
      v9 = objc_retainAutorelease(v2);
      memcpy(v8, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length") - 12);
      v10 = objc_retainAutorelease(v4);
      v11 = ~update_crc(0xFFFFFFFFLL, (char *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
      v12 = objc_retainAutorelease(v7);
      v13 = objc_msgSend(v12, "mutableBytes");
      v14 = v13 + objc_msgSend(v9, "length");
      *(_DWORD *)(v14 - 12) = bswap32(objc_msgSend(v10, "length"));
      *(_DWORD *)(v14 - 8) = bswap32(*(unsigned int *)SIPngChunkType);
      v15 = objc_retainAutorelease(v10);
      memcpy((void *)(v14 - 4), (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
      v16 = v14 + v5;
      *(_DWORD *)(v14 + v5 - 4) = bswap32(v11);
      v17 = objc_retainAutorelease(v9);
      v18 = objc_msgSend(v17, "bytes");
      v19 = objc_msgSend(v17, "length");
      v20 = *(_DWORD *)(v18 + v19 - 4);
      *(_QWORD *)v16 = *(_QWORD *)(v18 + v19 - 12);
      *(_DWORD *)(v16 + 8) = v20;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t si_surface_save_to_url(__IOSurface *a1, uint64_t a2)
{
  return objc_msgSend(si_surface_save_to_data(a1), "writeToURL:atomically:", a2, 0);
}

uint64_t si_surface_print_data_to_iterm(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  printf("\x1B]1337;File=[size=%lld;inline=1;preserveAspectRatio=1]:", objc_msgSend(v1, "length"));
  objc_msgSend(v1, "base64EncodedStringWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_retainAutorelease(v2);
  puts((const char *)objc_msgSend(v3, "UTF8String"));

  return puts("\a");
}

BOOL si_surface_print_url_to_iterm(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    si_surface_print_data_to_iterm(v1);

  return v2 != 0;
}

BOOL si_surface_print_surface_to_iterm(__IOSurface *a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  si_surface_png_representation(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  v3 = v1 != 0;
  if (v1)
    si_surface_print_data_to_iterm(v1);

  return v3;
}

uint64_t si_surface_save_raw_png_to_url(__IOSurface *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  si_surface_png_representation(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "writeToURL:atomically:", a2, 0);

  return v4;
}

void sub_21073A528(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_21073A65C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073A6E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21073A778(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21073A890(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21073A978(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21073AA1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073AD60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

float32_t SIWriteBoxCorners(uint64_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6, double a7, float32x4_t a8)
{
  uint64_t v8;
  _DWORD *v9;
  float32x4_t v10;
  float32x4_t v11;

  v8 = 0;
  v9 = (_DWORD *)(a1 + 8);
  v10.i64[0] = 0xBF000000BF000000;
  v10.i64[1] = 0xBF000000BF000000;
  do
  {
    a8.f32[0] = (float)(v8 >> 2);
    a8.f32[1] = (float)((v8 >> 1) & 1);
    a8.f32[2] = (float)(v8 & 1);
    v11 = vmulq_f32(a6, vaddq_f32(a8, v10));
    a8 = vaddq_f32(a5, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v11.f32[0]), a3, *(float32x2_t *)v11.f32, 1), a4, v11, 2));
    *((_QWORD *)v9 - 1) = a8.i64[0];
    *v9 = a8.i32[2];
    ++v8;
    v9 += 3;
  }
  while (v8 != 8);
  return a2.f32[0];
}

float32x4_t SIWriteTransformExtent(uint64_t a1, __n128 *a2, uint64_t a3, double a4, float32x4_t a5)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  char v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  float32x4_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  int v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  int v30;
  uint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD *v38;
  uint64_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  const float *v48;
  float32x4_t v49;
  float32x4_t v50;
  uint64_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t result;
  __int128 v55;
  _OWORD v56[12];
  _OWORD v57[8];
  uint64_t v58;

  v5 = 0;
  v58 = *MEMORY[0x24BDAC8D0];
  v6 = 1;
  memset(v57, 0, sizeof(v57));
  do
  {
    v7 = 0;
    v8 = v6;
    v9 = 1;
    do
    {
      v10 = 0;
      v11 = v9;
      v12 = 1;
      do
      {
        v13 = 0;
        v14 = v12;
        v15 = &v57[4 * v5 + 2 * v7 + v10];
        v16 = *v15;
        v17 = a1 + 48 * v5 + 24 * v7 + 12 * v10;
        do
        {
          v18 = *(_DWORD *)(v17 + 4 * v13);
          v55 = v16;
          *(_DWORD *)((unint64_t)&v55 & 0xFFFFFFFFFFFFFFF3 | (4 * (v13 & 3))) = v18;
          v16 = v55;
          ++v13;
        }
        while (v13 != 3);
        v12 = 0;
        *((_DWORD *)v15 + 2) = DWORD2(v55);
        *(_QWORD *)v15 = v16;
        v10 = 1;
      }
      while ((v14 & 1) != 0);
      v9 = 0;
      v7 = 1;
    }
    while ((v11 & 1) != 0);
    v6 = 0;
    v5 = 1;
  }
  while ((v8 & 1) != 0);
  v19 = 0;
  v20.i32[3] = 0;
  memset(v56, 0, sizeof(v56));
  do
  {
    v21 = 0;
    v22 = v19++;
    if (v19 == 3)
      v23 = 0;
    else
      v23 = v19;
    v24 = v22 - 1;
    if (!v22)
      v24 = 2;
    v25 = 1 << v22;
    v26 = 2 - v22;
    v27 = 1;
    do
    {
      v28 = 0;
      v29 = v27;
      v30 = (_DWORD)v21 << v23;
      v31 = 2 * v21;
      v32 = 1;
      do
      {
        v33 = v32;
        v34 = ((_DWORD)v28 << v24) + v30;
        v35 = a1 + 12 * (v34 + v25);
        v20.i64[0] = *(_QWORD *)v35;
        v20.i32[2] = *(_DWORD *)(v35 + 8);
        v36 = a1 + 12 * v34;
        a5.i64[0] = *(_QWORD *)v36;
        a5.i32[2] = *(_DWORD *)(v36 + 8);
        v20 = vsubq_f32(v20, a5);
        v56[4 * v26 + (v28 | v31)] = v20;
        v28 = 1;
        v32 = 0;
      }
      while ((v33 & 1) != 0);
      v27 = 0;
      v21 = 1;
    }
    while ((v29 & 1) != 0);
  }
  while (v19 != 3);
  v37 = 0;
  v38 = v56;
  __asm { FMOV            V0.4S, #0.25 }
  do
  {
    v44 = 0;
    v45 = 0uLL;
    do
      v45 = vaddq_f32(v45, (float32x4_t)v38[v44++]);
    while (v44 != 4);
    v46 = vmulq_f32(v45, _Q0);
    v47 = vmulq_f32(v46, v46);
    *(float *)(a3 + 4 * v37) = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0]);
    v48 = (const float *)(a3 + 4 * (v37 & 3));
    v49 = vld1q_dup_f32(v48);
    v50 = vdivq_f32(v46, v49);
    v50.i32[3] = 0;
    a2[v37++] = (__n128)v50;
    v38 += 4;
  }
  while (v37 != 3);
  v51 = 0;
  v52 = 0uLL;
  do
    v52 = vaddq_f32(v52, (float32x4_t)v57[v51++]);
  while (v51 != 8);
  v53.i64[0] = 0x3E0000003E000000;
  v53.i64[1] = 0x3E0000003E000000;
  result = vmulq_f32(v52, v53);
  result.i32[3] = 1.0;
  a2[3] = (__n128)result;
  return result;
}

void sub_21073B1CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073B36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21073B3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIVisualLogger;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21073B4F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073B55C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073B66C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21073B720(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073B7F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073BD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  void *v13;
  va_list va;

  va_start(va, a11);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va);

  _Unwind_Resume(a1);
}

void sub_21073C0A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21073C2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, char a11)
{
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v14;

  do
    v14 = __ldaxr(v12);
  while (__stlxr(v14 - 1, v12));
  if (!v14)
    -[SIVisualLogger createDataInfoAt:name:].cold.1(v11);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)&a11);

  _Unwind_Resume(a1);
}

void sub_21073C528(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va1);

  _Unwind_Resume(a1);
}

void sub_21073C78C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va1);

  _Unwind_Resume(a1);
}

void sub_21073CA04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va1);

  _Unwind_Resume(a1);
}

void sub_21073CCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va1);

  _Unwind_Resume(a1);
}

void sub_21073CE88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21073D118(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va);

  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_21073D388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  void *v11;
  void *v12;
  void *v13;

  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)&a9);
  std::shared_ptr<Espresso::abstract_context>::~shared_ptr[abi:nn180100]((uint64_t)&a11);

  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<char const*,VZSubLogger *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,VZSubLogger *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,VZSubLogger *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const*&&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10)
        v4 = v9 % v10;
    }
    else
    {
      v4 = v9 & (v10 - 1);
    }
    v12 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10)
              v14 %= v10;
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v10 || (float)(v16 * (float)v10) < v15)
  {
    v17 = 1;
    if (v10 >= 3)
      v17 = (v10 & (v10 - 1)) != 0;
    v18 = v17 | (2 * v10);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__rehash<true>(a1, v20);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v21 + 8 * v4) = a1 + 16;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v23 >= v10)
        v23 %= v10;
    }
    else
    {
      v23 &= v10 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_21073D660(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<VZFileExportOptions *,`anonymous namespace'::Ref<VZFileExportOptions *>::Ref(VZFileExportOptions *,`anonymous namespace'::FromCreateTag)::{lambda(VZFileExportOptions *)#1},std::allocator<VZFileExportOptions>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BCA3F0);
}

uint64_t std::__shared_ptr_pointer<VZFileExportOptions *,`anonymous namespace'::Ref<VZFileExportOptions *>::Ref(VZFileExportOptions *,`anonymous namespace'::FromCreateTag)::{lambda(VZFileExportOptions *)#1},std::allocator<VZFileExportOptions>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZFileExportOptions *,`anonymous namespace'::Ref<VZFileExportOptions *>::Ref(VZFileExportOptions *,`anonymous namespace'::FromCreateTag)::{lambda(VZFileExportOptions *)#1},std::allocator<VZFileExportOptions>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:nn180100](uint64_t a1, uint64_t a2)
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

void std::__shared_ptr_pointer<VZLogMessageFilter *,`anonymous namespace'::Ref<VZLogMessageFilter *>::Ref(VZLogMessageFilter *,`anonymous namespace'::FromCreateTag)::{lambda(VZLogMessageFilter *)#1},std::allocator<VZLogMessageFilter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BCA3F0);
}

uint64_t std::__shared_ptr_pointer<VZLogMessageFilter *,`anonymous namespace'::Ref<VZLogMessageFilter *>::Ref(VZLogMessageFilter *,`anonymous namespace'::FromCreateTag)::{lambda(VZLogMessageFilter *)#1},std::allocator<VZLogMessageFilter>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZLogMessageFilter *,`anonymous namespace'::Ref<VZLogMessageFilter *>::Ref(VZLogMessageFilter *,`anonymous namespace'::FromCreateTag)::{lambda(VZLogMessageFilter *)#1},std::allocator<VZLogMessageFilter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<VZClientOptions *,`anonymous namespace'::Ref<VZClientOptions *>::Ref(VZClientOptions *,`anonymous namespace'::FromCreateTag)::{lambda(VZClientOptions *)#1},std::allocator<VZClientOptions>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BCA3F0);
}

uint64_t std::__shared_ptr_pointer<VZClientOptions *,`anonymous namespace'::Ref<VZClientOptions *>::Ref(VZClientOptions *,`anonymous namespace'::FromCreateTag)::{lambda(VZClientOptions *)#1},std::allocator<VZClientOptions>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZClientOptions *,`anonymous namespace'::Ref<VZClientOptions *>::Ref(VZClientOptions *,`anonymous namespace'::FromCreateTag)::{lambda(VZClientOptions *)#1},std::allocator<VZClientOptions>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<VZDataInfo *,`anonymous namespace'::Ref<VZDataInfo *>::Ref(VZDataInfo *,`anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo *)#1},std::allocator<VZDataInfo>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BCA3F0);
}

uint64_t std::__shared_ptr_pointer<VZDataInfo *,`anonymous namespace'::Ref<VZDataInfo *>::Ref(VZDataInfo *,`anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo *)#1},std::allocator<VZDataInfo>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZDataInfo *,`anonymous namespace'::Ref<VZDataInfo *>::Ref(VZDataInfo *,`anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo *)#1},std::allocator<VZDataInfo>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<VZDataInfo const*,`anonymous namespace'::Ref<VZDataInfo const*>::Ref(VZDataInfo const*,`anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo const*)#1},std::allocator<VZDataInfo const>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BCA3F0);
}

uint64_t std::__shared_ptr_pointer<VZDataInfo const*,`anonymous namespace'::Ref<VZDataInfo const*>::Ref(VZDataInfo const*,`anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo const*)#1},std::allocator<VZDataInfo const>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZDataInfo const*,`anonymous namespace'::Ref<VZDataInfo const*>::Ref(VZDataInfo const*,`anonymous namespace'::FromCreateTag)::{lambda(VZDataInfo const*)#1},std::allocator<VZDataInfo const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<VZData const*,`anonymous namespace'::Ref<VZData const*>::Ref(VZData const*,`anonymous namespace'::FromCreateTag)::{lambda(VZData const*)#1},std::allocator<VZData const>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BCA3F0);
}

uint64_t std::__shared_ptr_pointer<VZData const*,`anonymous namespace'::Ref<VZData const*>::Ref(VZData const*,`anonymous namespace'::FromCreateTag)::{lambda(VZData const*)#1},std::allocator<VZData const>>::__on_zero_shared()
{
  return VZRelease();
}

uint64_t std::__shared_ptr_pointer<VZData const*,`anonymous namespace'::Ref<VZData const*>::Ref(VZData const*,`anonymous namespace'::FromCreateTag)::{lambda(VZData const*)#1},std::allocator<VZData const>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

id SISimdFloat3ToArray(__n128 a1)
{
  id v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1.n128_f64[0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v3) = a1.n128_u32[1];
  LODWORD(v3) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v4, v5, 0);

  return v6;
}

void sub_21073DCE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id SISimdFloat4ToArray(__n128 a1)
{
  id v1;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1.n128_f64[0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v3) = a1.n128_u32[1];
  LODWORD(v3) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v1, "initWithObjects:", v2, v4, v5, v6, 0);

  return v7;
}

void sub_21073DDE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id SISimdFloat3x3ToArray(__n128 a1, __n128 a2, __n128 a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1.n128_f64[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a2.n128_f64[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a3.n128_f64[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v7) = a1.n128_u32[1];
  LODWORD(v7) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v9) = a2.n128_u32[1];
  LODWORD(v9) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v11) = a3.n128_u32[1];
  LODWORD(v11) = a3.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v8, v10, v12, v13, v14, v15, 0);

  return v16;
}

void sub_21073DF88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  _Unwind_Resume(a1);
}

void sub_21073DFD8()
{
  JUMPOUT(0x21073DFC0);
}

void sub_21073DFE0()
{
  JUMPOUT(0x21073DFC4);
}

void sub_21073DFE8()
{
  JUMPOUT(0x21073DFC8);
}

void sub_21073DFF0()
{
  JUMPOUT(0x21073DFCCLL);
}

id SISimdFloat4x4ToArray(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a1.n128_f64[0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a2.n128_f64[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a3.n128_f64[0]);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a4.n128_f64[0]);
  v7 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v8) = a1.n128_u32[1];
  LODWORD(v8) = a1.n128_u32[1];
  v27 = (void *)v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v10) = a2.n128_u32[1];
  LODWORD(v10) = a2.n128_u32[1];
  v26 = (void *)v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v12) = a3.n128_u32[1];
  LODWORD(v12) = a3.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v14) = a4.n128_u32[1];
  LODWORD(v14) = a4.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  a1.n128_u64[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  a3.n128_u64[0] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v4, "initWithObjects:", v25, v5, a1.n128_u64[0], v27, v26, v11, v13, v24, v23, v22, v15, v21, v16, v20, a3.n128_u64[0], v17, 0);

  return v19;
}

void sub_21073E2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,void *a29,void *a30,void *a31,void *a32,void *a33)
{
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;

  v37 = *(void **)(v36 - 160);
  v41 = v33;
  v38 = *(void **)(v36 - 112);
  v39 = *(void **)(v36 - 128);

  _Unwind_Resume(a1);
}

void sub_21073E398()
{
  JUMPOUT(0x21073E344);
}

void sub_21073E3AC()
{
  JUMPOUT(0x21073E348);
}

void sub_21073E3C0()
{
  JUMPOUT(0x21073E350);
}

void sub_21073E3D4()
{
  JUMPOUT(0x21073E358);
}

void sub_21073E3E8()
{
  JUMPOUT(0x21073E360);
}

void sub_21073E3FC()
{
  JUMPOUT(0x21073E368);
}

void sub_21073E40C()
{
  JUMPOUT(0x21073E370);
}

void sub_21073E418()
{
  JUMPOUT(0x21073E378);
}

void sub_21073E424()
{
  JUMPOUT(0x21073E380);
}

void sub_21073E430()
{
  JUMPOUT(0x21073E384);
}

void sub_21073E438()
{
  JUMPOUT(0x21073E388);
}

__n128 SISimdFloat3FromArray(void *a1)
{
  id v1;
  void *v2;
  unsigned __int32 v3;
  void *v4;
  unsigned __int32 v5;
  void *v6;
  unsigned __int32 v7;
  __n128 result;
  unsigned __int32 v9;
  unsigned __int32 v10;
  unsigned __int32 v11;

  v1 = a1;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v11 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v10 = v5;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v9 = v7;

  result.n128_u32[0] = v11;
  result.n128_u32[1] = v10;
  result.n128_u32[2] = v9;
  return result;
}

void sub_21073E4E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

__n128 SISimdFloat4FromArray(void *a1)
{
  id v1;
  void *v2;
  unsigned int v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  __int128 v9;
  unsigned int v10;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  __int128 v15;

  v1 = a1;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v14 = v3;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v13 = v5;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v12 = v7;
  objc_msgSend(v1, "objectAtIndexedSubscript:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  *(_QWORD *)&v9 = __PAIR64__(v13, v14);
  *((_QWORD *)&v9 + 1) = __PAIR64__(v10, v12);
  v15 = v9;

  return (__n128)v15;
}

void sub_21073E5E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

__n128 SISimdFloat3x3FromArray(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  __n128 result;
  unsigned __int32 v6;
  __n128 v7;
  __n128 v8;

  v1 = a1;
  objc_msgSend(v1, "subarrayWithRange:", 0, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SISimdFloat3FromArray(v2);
  objc_msgSend(v1, "subarrayWithRange:", 3, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SISimdFloat3FromArray(v3);
  objc_msgSend(v1, "subarrayWithRange:", 6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SISimdFloat3FromArray(v4).n128_u32[0];

  result.n128_u64[0] = vzip1q_s32((int32x4_t)v8, (int32x4_t)v7).u64[0];
  result.n128_u32[2] = v6;
  return result;
}

void sub_21073E6F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

__n128 SISimdFloat4x4FromArray(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  int32x4_t v10;

  v1 = a1;
  objc_msgSend(v1, "subarrayWithRange:", 0, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SISimdFloat4FromArray(v2);
  objc_msgSend(v1, "subarrayWithRange:", 4, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SISimdFloat4FromArray(v3);
  objc_msgSend(v1, "subarrayWithRange:", 8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SISimdFloat4FromArray(v4);
  objc_msgSend(v1, "subarrayWithRange:", 12, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = vzip1q_s32(vzip1q_s32((int32x4_t)v9, (int32x4_t)v7), vzip1q_s32((int32x4_t)v8, (int32x4_t)SISimdFloat4FromArray(v5)));

  return (__n128)v10;
}

void sub_21073E824(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

__CVBuffer *SICreateProbabilityFP16ColorizedResult(__CVBuffer *a1)
{
  int Width;
  int Height;
  __CVBuffer *v4;
  char *BaseAddress;
  char *v6;
  size_t BytesPerRow;
  size_t v8;
  uint64_t i;
  char *v10;
  uint64_t v11;
  __int16 *v12;
  __int16 v13;
  int v20;

  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  v4 = SICreateCVPixelBuffer(Width, Height, 0x18u, 1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(v4, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  v6 = (char *)CVPixelBufferGetBaseAddress(v4);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  v8 = CVPixelBufferGetBytesPerRow(v4);
  if (Height >= 1)
  {
    for (i = 0; i != Height; ++i)
    {
      if (Width >= 1)
      {
        v10 = &v6[v8 * i];
        v11 = Width;
        v12 = (__int16 *)BaseAddress;
        do
        {
          v13 = *v12++;
          _H0 = v13;
          __asm { FCVT            S0, H0 }
          v20 = (int)(float)(_S0 * 255.0);
          *v10 = v20;
          v10[1] = v20;
          v10[2] = v20;
          v10 += 3;
          --v11;
        }
        while (v11);
      }
      BaseAddress += 2 * (BytesPerRow >> 1);
    }
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(v4, 0);
  return v4;
}

__CVBuffer *SICreateProbabilityColorizedResult(__CVBuffer *a1)
{
  int Width;
  int Height;
  __CVBuffer *v4;
  float *BaseAddress;
  char *v6;
  size_t BytesPerRow;
  size_t v8;
  uint64_t i;
  char *v10;
  uint64_t v11;
  float *v12;
  float v13;
  int v14;

  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  v4 = SICreateCVPixelBuffer(Width, Height, 0x18u, 1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(v4, 0);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a1);
  v6 = (char *)CVPixelBufferGetBaseAddress(v4);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  v8 = CVPixelBufferGetBytesPerRow(v4);
  if (Height >= 1)
  {
    for (i = 0; i != Height; ++i)
    {
      if (Width >= 1)
      {
        v10 = &v6[v8 * i];
        v11 = Width;
        v12 = BaseAddress;
        do
        {
          v13 = *v12++;
          v14 = (int)(float)(v13 * 255.0);
          *v10 = v14;
          v10[1] = v14;
          v10[2] = v14;
          v10 += 3;
          --v11;
        }
        while (v11);
      }
      BaseAddress += BytesPerRow >> 2;
    }
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(v4, 0);
  return v4;
}

__CVBuffer *SICreateMaterialSegmentationColorizedResult(__CVBuffer *a1)
{
  int Width;
  int Height;
  __CVBuffer *v4;
  unsigned __int8 *BaseAddress;
  size_t BytesPerRow;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CVBuffer *v18;
  __CVBuffer *pixelBuffer;
  size_t v20;
  char *v21;

  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  v4 = SICreateCVPixelBuffer(Width, Height, 0x18u, 1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(v4, 0);
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a1);
  v21 = (char *)CVPixelBufferGetBaseAddress(v4);
  pixelBuffer = a1;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  v18 = v4;
  v20 = CVPixelBufferGetBytesPerRow(v4);
  if (Height >= 1)
  {
    v7 = 0;
    v8 = Height;
    do
    {
      if (Width >= 1)
      {
        v9 = &v21[v20 * v7];
        v10 = Width;
        v11 = BaseAddress;
        do
        {
          v12 = *v11++;
          SIGetMaterialColorByLabel(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *v9 = objc_msgSend(v14, "charValue");

          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v9[1] = objc_msgSend(v15, "charValue");

          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2] = objc_msgSend(v16, "charValue");

          v9 += 3;
          --v10;
        }
        while (v10);
      }
      ++v7;
      BaseAddress += BytesPerRow;
    }
    while (v7 != v8);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferUnlockBaseAddress(v18, 0);
  return v18;
}

void sub_21073EC60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__CVBuffer *SICreateSemanticColorizedResult(__CVBuffer *a1)
{
  int Width;
  int Height;
  __CVBuffer *v4;
  unsigned __int8 *BaseAddress;
  size_t BytesPerRow;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CVBuffer *v18;
  __CVBuffer *pixelBuffer;
  size_t v20;
  char *v21;

  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  v4 = SICreateCVPixelBuffer(Width, Height, 0x18u, 1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(v4, 0);
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a1);
  v21 = (char *)CVPixelBufferGetBaseAddress(v4);
  pixelBuffer = a1;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  v18 = v4;
  v20 = CVPixelBufferGetBytesPerRow(v4);
  if (Height >= 1)
  {
    v7 = 0;
    v8 = Height;
    do
    {
      if (Width >= 1)
      {
        v9 = &v21[v20 * v7];
        v10 = Width;
        v11 = BaseAddress;
        do
        {
          v12 = *v11++;
          SIGetSemanticColorByLabel(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *v9 = objc_msgSend(v14, "charValue");

          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v9[1] = objc_msgSend(v15, "charValue");

          objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2] = objc_msgSend(v16, "charValue");

          v9 += 3;
          --v10;
        }
        while (v10);
      }
      ++v7;
      BaseAddress += BytesPerRow;
    }
    while (v7 != v8);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferUnlockBaseAddress(v18, 0);
  return v18;
}

void sub_21073EE20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t SIGetCameraOrientationFromExtrinsic(uint64_t a1)
{
  float v2;
  float v3;
  float v4;
  __int128 v9;

  LODWORD(v2) = HIDWORD(*(_QWORD *)(a1 + 32));
  if (v2 >= 1.0)
  {
    v3 = atan2f(-*(float *)(a1 + 8), -*(float *)(a1 + 24));
  }
  else if (v2 <= -1.0)
  {
    v3 = atan2f(*(float *)(a1 + 8), *(float *)(a1 + 24));
  }
  else
  {
    v9 = *(_OWORD *)(a1 + 32);
    asinf(-v2);
    atan2f(*(float *)&v9, *((float *)&v9 + 2));
    v3 = atan2f(*(float *)(a1 + 4), *(float *)(a1 + 20));
  }
  v4 = v3 * 57.2957795;
  if (v4 > -45.0 && v4 <= 45.0)
    return 0;
  if (v4 > -135.0 && v4 <= -45.0)
    return 1;
  if (v4 > 135.0 || v4 <= 45.0)
    return 3;
  else
    return 2;
}

vImage_Error SIFloat32ToFloat16(void *a1, void *a2, vImagePixelCount a3)
{
  vImage_Buffer v4;
  vImage_Buffer src;

  src.data = a1;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 4 * a3;
  v4.data = a2;
  v4.height = 1;
  v4.width = a3;
  v4.rowBytes = 2 * (a3 & 0x3FFFFFFFFFFFFFFFLL);
  return vImageConvert_PlanarFtoPlanar16F(&src, &v4, 0);
}

vImage_Error SIFloat16ToFloat32(void *a1, void *a2, vImagePixelCount a3)
{
  vImage_Buffer v4;
  vImage_Buffer src;

  src.data = a1;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 2 * (a3 & 0x3FFFFFFFFFFFFFFFLL);
  v4.data = a2;
  v4.height = 1;
  v4.width = a3;
  v4.rowBytes = 4 * a3;
  return vImageConvert_Planar16FtoPlanarF(&src, &v4, 0);
}

id createE5RTException(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  createE5RTExceptionMessage(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("E5RTRegressorFailure"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id createE5RTExceptionMessage(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s:%d - %s"), a1, a2, e5rt_get_last_error_message());
}

id SIGetSemanticColorByLabel(unsigned int a1)
{
  void *v1;

  if (a1 == 255)
  {
    v1 = &unk_24CA66498;
  }
  else if (objc_msgSend(&unk_24CA661F8, "count") <= (unint64_t)a1)
  {
    v1 = &unk_24CA66498;
  }
  else
  {
    objc_msgSend(&unk_24CA661F8, "objectAtIndexedSubscript:", a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id SIGetMaterialColorByLabel(unsigned int a1)
{
  void *v1;

  if (a1 == 255)
  {
    v1 = &unk_24CA664B0;
  }
  else if (objc_msgSend(&unk_24CA66480, "count") <= (unint64_t)a1)
  {
    v1 = &unk_24CA664B0;
  }
  else
  {
    objc_msgSend(&unk_24CA66480, "objectAtIndexedSubscript:", a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

double translateTransform(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, __n128 a5)
{
  uint64_t v5;
  _OWORD v7[4];
  _OWORD v8[4];

  v5 = 0;
  a5.n128_u32[3] = 1.0;
  v7[2] = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
  v7[3] = a5;
  memset(v8, 0, sizeof(v8));
  do
  {
    v8[v5] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, COERCE_FLOAT(v7[v5])), a2, *(float32x2_t *)&v7[v5], 1), a3, (float32x4_t)v7[v5], 2), a4, (float32x4_t)v7[v5], 3);
    ++v5;
  }
  while (v5 != 4);
  return *(double *)v8;
}

CVPixelBufferRef SICreateCVPixelBuffer(size_t a1, size_t a2, OSType a3, int a4)
{
  return SICreateCVPixelBufferWithCustomStride(a1, a2, a3, 0, a4);
}

id SIPixelFormatToStr(int a1)
{
  _BYTE v2[5];

  v2[0] = HIBYTE(a1);
  v2[1] = BYTE2(a1);
  v2[2] = BYTE1(a1);
  v2[3] = a1;
  v2[4] = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t SIBytesPerElementForPixelFormat(int a1)
{
  NSObject *v1;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 1278226533)
  {
    if (a1 != 1111970369)
    {
      if (a1 == 1278226488)
        return 1;
LABEL_8:
      __SceneIntelligenceLogSharedInstance();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        v3 = 136380931;
        v4 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        v5 = 1025;
        v6 = 68;
        _os_log_impl(&dword_21071A000, v1, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** Unsupported pixel format. Set byte per element as 1 as default ***", (uint8_t *)&v3, 0x12u);
      }

      return 1;
    }
  }
  else
  {
    if (a1 == 1278226742 || a1 == 1278226536)
      return 2;
    if (a1 != 1278226534)
      goto LABEL_8;
  }
  return 4;
}

uint64_t SIPixelBufferHasSameAttr(__CVBuffer *a1, __CVBuffer *a2)
{
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  size_t BytesPerRow;
  _BOOL4 v8;

  Width = CVPixelBufferGetWidth(a1);
  if (Width != CVPixelBufferGetWidth(a2))
    return 0;
  Height = CVPixelBufferGetHeight(a1);
  if (Height != CVPixelBufferGetHeight(a2))
    return 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(a2))
    return 0;
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (BytesPerRow != CVPixelBufferGetBytesPerRow(a2))
    return 0;
  v8 = CVPixelBufferGetIOSurface(a1) == 0;
  return v8 ^ (CVPixelBufferGetIOSurface(a2) != 0);
}

CVPixelBufferRef SICreateCVPixelBufferWithCustomStride(size_t a1, size_t a2, OSType a3, uint64_t a4, int a5)
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  CVPixelBufferRef v18;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  size_t v26;
  __int16 v27;
  size_t v28;
  __int16 v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = v10;
  if (a5)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1B8], *MEMORY[0x24BDC5668]);
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (a3 == 875836518)
    {
      v31[0] = v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 2 * a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDC5600]);

    }
    else
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDC55D0]);
    }

  }
  pixelBufferOut = 0;
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, a2, a3, (CFDictionaryRef)v11, &pixelBufferOut))
  {
    __SceneIntelligenceLogSharedInstance();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      SIPixelFormatToStr(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381699;
      v22 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v23 = 1025;
      v24 = 122;
      v25 = 2048;
      v26 = a1;
      v27 = 2048;
      v28 = a2;
      v29 = 2113;
      v30 = v17;
      _os_log_impl(&dword_21071A000, v16, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Could not create pixel buffer (%zu x %zu) with format %{private}@ ***", buf, 0x30u);

    }
    v18 = 0;
  }
  else
  {
    v18 = pixelBufferOut;
  }

  return v18;
}

uint64_t SIPixelBufferPoolCreate(uint64_t a1, uint64_t a2, uint64_t a3, CVPixelBufferPoolRef *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFDictionary *v11;
  uint64_t v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v15[0] = MEMORY[0x24BDBD1B8];
  v7 = *MEMORY[0x24BDC5708];
  v14[0] = *MEMORY[0x24BDC5668];
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = *MEMORY[0x24BDC5650];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  v14[3] = *MEMORY[0x24BDC56B8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  *a4 = 0;
  v12 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v11, a4);

  return v12;
}

uint64_t SIPixelBufferPoolCreateWithBytePerRowAlignment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CVPixelBufferPoolRef *a5)
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFDictionary *v14;
  uint64_t v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  v18[0] = MEMORY[0x24BDBD1B8];
  v9 = *MEMORY[0x24BDC5708];
  v17[0] = *MEMORY[0x24BDC5668];
  v17[1] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  v17[2] = *MEMORY[0x24BDC5650];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v17[3] = *MEMORY[0x24BDC56B8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v12;
  v17[4] = *MEMORY[0x24BDC55D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  *a5 = 0;
  v15 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v14, a5);

  return v15;
}

uint64_t SITransferPixelBuffer(__CVBuffer *a1, __CVBuffer *a2)
{
  NSObject *v4;
  const char *v5;
  OSStatus v6;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pixelTransferSessionOut = 0;
  if (VTPixelTransferSessionCreate(0, &pixelTransferSessionOut))
  {
    __SceneIntelligenceLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v11 = 1025;
      v12 = 182;
      v5 = " %{private}s:%{private}d *** Failed to create VTPixelTransferSession ***";
LABEL_7:
      _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, v5, buf, 0x12u);
    }
  }
  else
  {
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x24BDF9680], (CFTypeRef)*MEMORY[0x24BDF98F0]);
    v6 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a1, a2);
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
    if (!v6)
      return 0;
    __SceneIntelligenceLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v11 = 1025;
      v12 = 191;
      v5 = " %{private}s:%{private}d *** Failed to perform copy via pixel transfer ***";
      goto LABEL_7;
    }
  }

  return 4294960636;
}

__CVBuffer *SICreateRGBFromBGRAPixelBuffer(__CVBuffer *a1)
{
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  __CVBuffer *v5;
  size_t v6;
  size_t v7;
  size_t BytesPerRow;
  size_t v9;
  char *BaseAddress;
  char *v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  size_t i;
  NSObject *v18;
  int v19;
  void *v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    __SceneIntelligenceLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v22 = 136380931;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v24 = 1025;
      v25 = 200;
      _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** unexpected nil input  ***", (uint8_t *)&v22, 0x12u);
    }
    goto LABEL_14;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1111970369)
  {
    v19 = PixelFormatType;
    __SceneIntelligenceLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      SIPixelFormatToStr(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136381187;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v24 = 1025;
      v25 = 205;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unexpected pixelFormat: %@ ***", (uint8_t *)&v22, 0x1Cu);

    }
LABEL_14:

    return 0;
  }
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  v5 = SICreateCVPixelBufferWithCustomStride(Width, Height, 0x18u, 0, 1);
  if (v5)
  {
    v6 = CVPixelBufferGetHeight(a1);
    v7 = CVPixelBufferGetWidth(a1);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    v9 = CVPixelBufferGetBytesPerRow(v5);
    CVPixelBufferLockBaseAddress(a1, 0);
    CVPixelBufferLockBaseAddress(v5, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
    v11 = (char *)CVPixelBufferGetBaseAddress(v5);
    if (v6)
    {
      v12 = 0;
      v13 = v11 + 2;
      v14 = BaseAddress + 1;
      do
      {
        v15 = v14;
        v16 = v13;
        for (i = v7; i; --i)
        {
          *(v16 - 2) = v15[1];
          *(v16 - 1) = *v15;
          *v16 = *(v15 - 1);
          v16 += 3;
          v15 += 4;
        }
        ++v12;
        v13 += v9;
        v14 += BytesPerRow;
      }
      while (v12 != v6);
    }
    CVPixelBufferUnlockBaseAddress(v5, 0);
    CVPixelBufferUnlockBaseAddress(a1, 0);
  }
  return v5;
}

size_t SIWrapCVPixelBufferAsVImage@<X0>(__CVBuffer *a1@<X0>, void **a2@<X8>)
{
  size_t result;

  *a2 = CVPixelBufferGetBaseAddress(a1);
  a2[1] = (void *)CVPixelBufferGetHeight(a1);
  a2[2] = (void *)CVPixelBufferGetWidth(a1);
  result = CVPixelBufferGetBytesPerRow(a1);
  a2[3] = (void *)result;
  return result;
}

size_t SIWrapCVPixelBufferPlaneAsVImage@<X0>(__CVBuffer *a1@<X0>, size_t a2@<X1>, void **a3@<X8>)
{
  size_t result;

  *a3 = CVPixelBufferGetBaseAddressOfPlane(a1, a2);
  a3[1] = (void *)CVPixelBufferGetHeightOfPlane(a1, a2);
  a3[2] = (void *)CVPixelBufferGetWidthOfPlane(a1, a2);
  result = CVPixelBufferGetBytesPerRowOfPlane(a1, a2);
  a3[3] = (void *)result;
  return result;
}

__CVBuffer *SICreateIOSurfaceBacked420vImageFromBuffers(size_t a1, size_t a2, char *a3, uint64_t a4, char *a5, uint64_t a6)
{
  __CVBuffer *v12;
  __CVBuffer *v13;
  char *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  size_t v16;
  size_t v17;
  char *v18;
  size_t v19;
  size_t v20;
  size_t v21;

  v12 = SICreateCVPixelBufferWithCustomStride(a1, a2, 0x34323076u, 0, 1);
  v13 = v12;
  if (v12)
  {
    CVPixelBufferLockBaseAddress(v12, 0);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v13, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v13, 0);
    if (a2)
    {
      v16 = BytesPerRowOfPlane;
      v17 = a2;
      do
      {
        memcpy(BaseAddressOfPlane, a3, a1);
        a3 += a4;
        BaseAddressOfPlane += v16;
        --v17;
      }
      while (v17);
    }
    v18 = (char *)CVPixelBufferGetBaseAddressOfPlane(v13, 1uLL);
    v19 = CVPixelBufferGetBytesPerRowOfPlane(v13, 1uLL);
    if (a2 >= 2)
    {
      v20 = v19;
      v21 = a2 >> 1;
      do
      {
        memcpy(v18, a5, a1);
        a5 += a6;
        v18 += v20;
        --v21;
      }
      while (v21);
    }
    CVPixelBufferUnlockBaseAddress(v13, 0);
  }
  return v13;
}

__CVBuffer *SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer(size_t a1, size_t a2, char *a3, uint64_t a4, signed int a5)
{
  size_t v8;
  int v10;
  __CVBuffer *v11;
  __CVBuffer *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *BaseAddress;
  size_t BytesPerRow;
  size_t v19;
  size_t v20;

  v8 = a2;
  if (a5 <= 1380410944)
  {
    if (a5 == 843264102)
      goto LABEL_8;
    v10 = 1278226534;
  }
  else
  {
    if (a5 == 1380410945 || a5 == 1717855600)
      goto LABEL_8;
    v10 = 1717856627;
  }
  if (a5 != v10)
    SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer_cold_1();
LABEL_8:
  v11 = SICreateCVPixelBufferWithCustomStride(a1, a2, a5, 0, 1);
  v12 = v11;
  if (v11)
  {
    v13 = 4;
    if (a5 == 843264102)
      v13 = 2;
    if (a5 == 1717856627)
      v14 = 1;
    else
      v14 = v13;
    if (a5 == 1717855600)
      v15 = 1;
    else
      v15 = v14;
    if (a5 == 1278226534)
      v16 = 1;
    else
      v16 = v15;
    CVPixelBufferLockBaseAddress(v11, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(v12);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v12);
    if (v8)
    {
      v19 = BytesPerRow;
      v20 = 4 * a1 * v16;
      do
      {
        memcpy(BaseAddress, a3, v20);
        a3 += a4;
        BaseAddress += v19;
        --v8;
      }
      while (v8);
    }
    CVPixelBufferUnlockBaseAddress(v12, 0);
  }
  return v12;
}

__CVBuffer *SICreateIOSurfaceBackedPackedFloat16ImageFromBuffer(size_t a1, size_t a2, char *a3, uint64_t a4, signed int a5)
{
  size_t v8;
  int v10;
  __CVBuffer *v11;
  __CVBuffer *v12;
  uint64_t v13;
  char *BaseAddress;
  size_t BytesPerRow;
  size_t v16;
  size_t v17;
  NSObject *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v8 = a2;
  v24 = *MEMORY[0x24BDAC8D0];
  if (a5 <= 1380411456)
  {
    if (a5 == 843264104)
      goto LABEL_8;
    v10 = 1278226536;
  }
  else
  {
    if (a5 == 1380411457 || a5 == 1751410032)
      goto LABEL_8;
    v10 = 1751411059;
  }
  if (a5 != v10)
    SICreateIOSurfaceBackedPackedFloat16ImageFromBuffer_cold_1();
LABEL_8:
  v11 = SICreateCVPixelBufferWithCustomStride(a1, a2, a5, 0, 1);
  v12 = v11;
  if (v11)
  {
    v13 = 1;
    if (a5 != 1278226536 && a5 != 1751410032 && a5 != 1751411059)
    {
      if (a5 == 843264104)
        v13 = 2;
      else
        v13 = 4;
    }
    CVPixelBufferLockBaseAddress(v11, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(v12);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v12);
    if (v8)
    {
      v16 = BytesPerRow;
      v17 = 2 * a1 * v13;
      do
      {
        memcpy(BaseAddress, a3, v17);
        a3 += a4;
        BaseAddress += v16;
        --v8;
      }
      while (v8);
    }
    CVPixelBufferUnlockBaseAddress(v12, 0);
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = 136380931;
      v21 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v22 = 1025;
      v23 = 361;
      _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create IOSurfaceBackedPackedFloat16Image ***", (uint8_t *)&v20, 0x12u);
    }

  }
  return v12;
}

__CVBuffer *SICreateIOSurfaceBacked420vTestImage(size_t a1, size_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  char v12;
  size_t v13;
  char *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)v16 - v6;
  if (v8)
  {
    v9 = 0;
    v10 = (char *)v16 - v6;
    do
    {
      if (a1)
      {
        v11 = 0;
        do
        {
          if ((((v11 / v5) + (v9 / v5)) & 1) != 0)
            v12 = -21;
          else
            v12 = 16;
          v10[v11++] = v12;
        }
        while (a1 != v11);
      }
      ++v9;
      v10 += a1;
    }
    while (v9 != a2);
  }
  MEMORY[0x24BDAC7A8](v4);
  v14 = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v14, 128, v13);
  return SICreateIOSurfaceBacked420vImageFromBuffers(a1, a2, v7, a1, v14, a1);
}

__CVBuffer *SICreateIOSurfaceBackedRGBAF32TestImage(uint64_t a1)
{
  size_t v1;
  size_t v2;
  unint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  int32x4_t v16;
  int32x4_t v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v1 = MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v19[-2 * v4];
  v6 = 16 * v1;
  if (v2)
  {
    v7 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    v13 = v5;
    do
    {
      if (v1)
      {
        v14 = 0;
        v15 = v7 / v3;
        do
        {
          v16 = _Q0;
          *(float *)v16.i32 = (float)(((v14 / v3) + (_BYTE)v15) & 1);
          v17 = vzip1q_s32(v16, v16);
          *(float *)&v17.i32[2] = (float)(((v14 / v3) + (_BYTE)v15) & 1);
          *(int32x4_t *)&v13[16 * v14++] = v17;
        }
        while (v1 != v14);
      }
      ++v7;
      v13 += v6;
    }
    while (v7 != v2);
  }
  return SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer(v1, v2, v5, v6, 1380410945);
}

id mcams3CVPixelBufferProperties()
{
  uint64_t v0;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDC55D0];
  v2[0] = *MEMORY[0x24BDC5668];
  v2[1] = v0;
  v3[0] = MEMORY[0x24BDBD1B8];
  v3[1] = &unk_24CA669C0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id mcams4wCVPixelBufferHandMattingProperties()
{
  uint64_t v0;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDC5600];
  v2[0] = *MEMORY[0x24BDC5668];
  v2[1] = v0;
  v3[0] = MEMORY[0x24BDBD1B8];
  v3[1] = &unk_24CA664C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

__CVBuffer *SICreatePixelBufferWithNewFormatFromExistingBuffer(__CVBuffer *a1, OSType a2)
{
  size_t Width;
  size_t Height;
  _BOOL4 v6;
  __CVBuffer *v7;
  NSObject *v8;
  OSType PixelFormatType;
  void *v10;
  OSType v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  v6 = CVPixelBufferGetIOSurface(a1) != 0;
  v7 = SICreateCVPixelBufferWithCustomStride(Width, Height, a2, 0, v6);
  if (SITransferPixelBuffer(a1, v7) == -6660)
  {
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
      SIPixelFormatToStr(PixelFormatType);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CVPixelBufferGetPixelFormatType(v7);
      SIPixelFormatToStr(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136381443;
      v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v16 = 1025;
      v17 = 454;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create new pixelbuffer from %@ to %@ by VideoToolbox transferSession ***", (uint8_t *)&v14, 0x26u);

    }
    CVPixelBufferRelease(v7);
    return 0;
  }
  return v7;
}

uint64_t SIPixelBufferCopy(__CVBuffer *a1, __CVBuffer *a2)
{
  size_t Width;
  size_t v5;
  size_t Height;
  size_t v7;
  OSType PixelFormatType;
  CVReturn v9;
  CVReturn v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  OSType v14;
  void *v15;
  OSType v16;
  void *v17;
  NSObject *v18;
  uint64_t v20;
  CVReturn v21;
  NSObject *v22;
  int IsPlanar;
  int v24;
  NSObject *v25;
  size_t PlaneCount;
  size_t v27;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t v30;
  size_t v31;
  size_t BytesPerRowOfPlane;
  size_t v33;
  size_t v34;
  void *BaseAddressOfPlane;
  void *v36;
  vImage_Error v37;
  size_t BytesPerRow;
  size_t v39;
  size_t v40;
  size_t v41;
  char *BaseAddress;
  char *v43;
  char *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  OSType v48;
  id v49;
  OSType v50;
  void *v51;
  vImage_Buffer v52;
  vImage_Buffer src;
  _QWORD v54[2];
  void (*v55)(uint64_t);
  void *v56;
  __CVBuffer *v57;
  _QWORD v58[2];
  void (*v59)(uint64_t);
  void *v60;
  __CVBuffer *v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  size_t v67;
  __int16 v68;
  size_t v69;
  __int16 v70;
  size_t v71;
  __int16 v72;
  size_t v73;
  __int16 v74;
  size_t v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  size_t v79;
  __int16 v80;
  size_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  Width = CVPixelBufferGetWidth(a1);
  v5 = CVPixelBufferGetWidth(a2);
  Height = CVPixelBufferGetHeight(a1);
  v7 = CVPixelBufferGetHeight(a2);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(a2))
  {
    __SceneIntelligenceLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = CVPixelBufferGetPixelFormatType(a1);
      SIPixelFormatToStr(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CVPixelBufferGetPixelFormatType(a2);
      SIPixelFormatToStr(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136381443;
      v63 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v64 = 1025;
      v65 = 474;
      v66 = 2113;
      v67 = (size_t)v15;
      v68 = 2113;
      v69 = (size_t)v17;
      _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers must have matching pixelbuffer format (src:%{private}@, dst:%{private}@) ***", buf, 0x26u);

    }
    return 2;
  }
  if (Width != v5 || Height != v7)
  {
    __SceneIntelligenceLogSharedInstance();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v63 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v64 = 1025;
      v65 = 479;
      _os_log_impl(&dword_21071A000, v18, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers must have matching dimensions ***", buf, 0x12u);
    }

    return 2;
  }
  v9 = CVPixelBufferLockBaseAddress(a1, 0);
  if (v9)
  {
    v10 = v9;
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      v63 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v64 = 1025;
      v65 = 485;
      v66 = 1024;
      LODWORD(v67) = v10;
      _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Error locking source buffer: %d ***", buf, 0x18u);
    }

    return 4;
  }
  v20 = MEMORY[0x24BDAC760];
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v59 = __SIPixelBufferCopy_block_invoke;
  v60 = &__block_descriptor_40_e5_v8__0l;
  v61 = a1;
  v21 = CVPixelBufferLockBaseAddress(a2, 0);
  if (v21)
  {
    __SceneIntelligenceLogSharedInstance();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      v63 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v64 = 1025;
      v65 = 498;
      v66 = 1024;
      LODWORD(v67) = v21;
      _os_log_impl(&dword_21071A000, v22, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Error locking destination buffer: %d ***", buf, 0x18u);
    }

    v12 = 4;
    goto LABEL_51;
  }
  v54[0] = v20;
  v54[1] = 3221225472;
  v55 = __SIPixelBufferCopy_block_invoke_26;
  v56 = &__block_descriptor_40_e5_v8__0l;
  v57 = a2;
  IsPlanar = CVPixelBufferIsPlanar(a1);
  v24 = CVPixelBufferIsPlanar(a2);
  if ((IsPlanar != 0) != (v24 != 0))
  {
    __SceneIntelligenceLogSharedInstance();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v63 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v64 = 1025;
      v65 = 513;
      _os_log_impl(&dword_21071A000, v25, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Cannot have planar mismatch between source (planar) and destination (non-planar) ***", buf, 0x12u);
    }

    goto LABEL_24;
  }
  if (!IsPlanar || !v24)
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    v39 = CVPixelBufferGetBytesPerRow(a2);
    v40 = v39;
    if (BytesPerRow >= v39)
      v41 = v39;
    else
      v41 = BytesPerRow;
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
    v43 = (char *)CVPixelBufferGetBaseAddress(a2);
    v44 = v43;
    if (BytesPerRow == v40)
    {
      memcpy(v43, BaseAddress, v41 * Height);
    }
    else
    {
      for (; Height; --Height)
      {
        memcpy(v44, BaseAddress, v41);
        v44 += v40;
        BaseAddress += BytesPerRow;
      }
    }
    goto LABEL_49;
  }
  PlaneCount = CVPixelBufferGetPlaneCount(a1);
  if (PlaneCount != CVPixelBufferGetPlaneCount(a2))
  {
    __SceneIntelligenceLogSharedInstance();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v63 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      v64 = 1025;
      v65 = 519;
      _os_log_impl(&dword_21071A000, v45, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers must have the same number of planes ***", buf, 0x12u);
    }

LABEL_46:
    v12 = 2;
    goto LABEL_50;
  }
  if (!PlaneCount)
  {
LABEL_49:
    CVBufferPropagateAttachments(a1, a2);
    v12 = 0;
    goto LABEL_50;
  }
  v27 = 0;
  while (1)
  {
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, v27);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, v27);
    v30 = CVPixelBufferGetWidthOfPlane(a2, v27);
    v31 = CVPixelBufferGetHeightOfPlane(a2, v27);
    if (WidthOfPlane != v30 || HeightOfPlane != v31)
    {
      __SceneIntelligenceLogSharedInstance();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v63 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        v64 = 1025;
        v65 = 532;
        v66 = 2048;
        v67 = v27;
        _os_log_impl(&dword_21071A000, v46, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers match resolution and number of planes but plane %lu within each pixel buffer are different resolutions ***", buf, 0x1Cu);
      }
      goto LABEL_54;
    }
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, v27);
    v33 = CVPixelBufferGetBytesPerRowOfPlane(a2, v27);
    v34 = v33 * HeightOfPlane;
    if (BytesPerRowOfPlane * HeightOfPlane != v33 * HeightOfPlane)
    {
      __SceneIntelligenceLogSharedInstance();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381699;
        v63 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        v64 = 1025;
        v65 = 543;
        v66 = 2048;
        v67 = v27;
        v68 = 2048;
        v69 = BytesPerRowOfPlane * HeightOfPlane;
        v70 = 2048;
        v71 = v34;
        _os_log_impl(&dword_21071A000, v46, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: Source and destination buffers match resolution and number of planes but plane %lu within each pixel buffer has a different number of bytes per row (src: %zu, dst: %zu) ***", buf, 0x30u);
      }
LABEL_54:

      goto LABEL_46;
    }
    if (!(BytesPerRowOfPlane % WidthOfPlane))
      break;
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a2, v27);
    v36 = CVPixelBufferGetBaseAddressOfPlane(a1, v27);
    memcpy(BaseAddressOfPlane, v36, BytesPerRowOfPlane * HeightOfPlane);
LABEL_36:
    if (PlaneCount == ++v27)
      goto LABEL_49;
  }
  memset(&src, 0, sizeof(src));
  SIWrapCVPixelBufferPlaneAsVImage(a1, v27, &src.data);
  memset(&v52, 0, sizeof(v52));
  SIWrapCVPixelBufferPlaneAsVImage(a2, v27, &v52.data);
  v37 = vImageCopyBuffer(&src, &v52, BytesPerRowOfPlane / WidthOfPlane, 0x10u);
  if (!v37)
    goto LABEL_36;
  __SceneIntelligenceLogSharedInstance();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    v48 = CVPixelBufferGetPixelFormatType(a1);
    SIPixelFormatToStr(v48);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v50 = CVPixelBufferGetPixelFormatType(a2);
    SIPixelFormatToStr(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136382979;
    v63 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
    v64 = 1025;
    v65 = 564;
    v66 = 2048;
    v67 = v37;
    v68 = 2048;
    v69 = v27;
    v70 = 2113;
    v71 = (size_t)v49;
    v72 = 2049;
    v73 = WidthOfPlane;
    v74 = 2049;
    v75 = HeightOfPlane;
    v76 = 2113;
    v77 = v51;
    v78 = 2049;
    v79 = WidthOfPlane;
    v80 = 2049;
    v81 = HeightOfPlane;
    _os_log_impl(&dword_21071A000, v47, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIPixelBufferCopy: vImageCopyBuffer error (%zu) for plane %zu copying pixel buffer (format:%{private}@, plane size:%{private}zux%{private}zu) to pixel buffer (format:%{private}@, plane size:%{private}zux%{private}zu) ***", buf, 0x62u);

  }
LABEL_24:
  v12 = 4;
LABEL_50:
  v55((uint64_t)v54);
LABEL_51:
  v59((uint64_t)v58);
  return v12;
}

void sub_2107431AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, void (*a19)(char *), uint64_t a20,uint64_t a21,char a22,uint64_t a23,void (*a24)(char *))
{
  a19(&a17);
  a24(&a22);
  _Unwind_Resume(a1);
}

uint64_t SIGetInputRotateAngleAttrFromLandscapeForOrientation(unint64_t a1)
{
  if (a1 > 3)
    return 0xFFFFFFFFLL;
  else
    return dword_21074C2C0[a1];
}

uint64_t SIGetOutputRotateAngleAttrToLandscapeForOrientation(unint64_t a1)
{
  if (a1 > 3)
    return 0xFFFFFFFFLL;
  else
    return dword_21074C2D0[a1];
}

uint64_t SIRotateAndCopyBuffer(__CVBuffer *a1, __CVBuffer *a2, int a3)
{
  OSType PixelFormatType;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *p_src;
  vImage_Buffer v13;
  vImage_Buffer dest;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  vImage_Buffer v21;
  vImage_Buffer src;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(a2))
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(src.data) = 136380931;
      *(void **)((char *)&src.data + 4) = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuf"
                                          "fer/SIPixelBuffer.m";
      WORD2(src.height) = 1025;
      *(_DWORD *)((char *)&src.height + 6) = 629;
      v10 = " %{private}s:%{private}d *** [SIRotateAndCopyBuffer] Failed to rotate and copy the buffer: pixelformat mismatch ***";
      p_src = (uint8_t *)&src;
LABEL_21:
      _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, v10, p_src, 0x12u);
    }
LABEL_22:

    return 0;
  }
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(a2, 0);
  if (CVPixelBufferGetPixelFormatType(a1) == 875836518)
  {
    src.data = CVPixelBufferGetBaseAddressOfPlane(a1, 0);
    src.height = CVPixelBufferGetHeightOfPlane(a1, 0);
    src.width = CVPixelBufferGetWidthOfPlane(a1, 0);
    src.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
    dest.data = CVPixelBufferGetBaseAddressOfPlane(a2, 0);
    dest.height = CVPixelBufferGetHeightOfPlane(a2, 0);
    dest.width = CVPixelBufferGetWidthOfPlane(a2, 0);
    dest.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
    v21.data = CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
    v21.height = CVPixelBufferGetHeightOfPlane(a1, 1uLL);
    v21.width = CVPixelBufferGetWidthOfPlane(a1, 1uLL);
    v21.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
    v13.data = CVPixelBufferGetBaseAddressOfPlane(a2, 1uLL);
    v13.height = CVPixelBufferGetHeightOfPlane(a2, 1uLL);
    v13.width = CVPixelBufferGetWidthOfPlane(a2, 1uLL);
    v13.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a2, 1uLL);
    if (vImageRotate90_Planar8(&src, &dest, a3, 0, 0x10u))
    {
      __SceneIntelligenceLogSharedInstance();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        v17 = 1025;
        v18 = 660;
        v19 = 1024;
        v20 = a3;
        _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIRotateAndCopyBuffer: Failed to rotate 90*%d degree for YUV planar8 ***", buf, 0x18u);
      }

    }
    if (vImageRotate90_Planar16U(&v21, &v13, a3, 0, 0x10u))
    {
      __SceneIntelligenceLogSharedInstance();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
        v17 = 1025;
        v18 = 665;
        v19 = 1024;
        v20 = a3;
        _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** SIRotateAndCopyBuffer: Failed to rotate 90*%d degree for YUV planar16U ***", buf, 0x18u);
      }

    }
    goto LABEL_24;
  }
  src.data = CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  src.height = CVPixelBufferGetHeightOfPlane(a1, 0);
  src.width = CVPixelBufferGetWidthOfPlane(a1, 0);
  src.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  dest.data = CVPixelBufferGetBaseAddressOfPlane(a2, 0);
  dest.height = CVPixelBufferGetHeightOfPlane(a2, 0);
  dest.width = CVPixelBufferGetWidthOfPlane(a2, 0);
  dest.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226488)
  {
    if (!vImageRotate90_Planar8(&src, &dest, a3, 0, 0x10u))
      goto LABEL_24;
LABEL_19:
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v21.data) = 136380931;
      *(void **)((char *)&v21.data + 4) = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuf"
                                          "fer/SIPixelBuffer.m";
      WORD2(v21.height) = 1025;
      *(_DWORD *)((char *)&v21.height + 6) = 690;
      v10 = " %{private}s:%{private}d *** Failed to rotate buffer. ***";
      p_src = (uint8_t *)&v21;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226536 || CVPixelBufferGetPixelFormatType(a1) == 1751410032)
  {
    if (vImageRotate90_Planar16F(&src, &dest, a3, 0, 0x10u))
      goto LABEL_19;
  }
  else if (vImageRotate90_PlanarF(&src, &dest, a3, 0.0, 0x10u))
  {
    goto LABEL_19;
  }
LABEL_24:
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(a2, 0);
  return 1;
}

void sub_210743BD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210743E94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210744740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_210744A0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_210744A78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_210744D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_210744F10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t SIGetANEDeviceType()
{
  return objc_msgSend(MEMORY[0x24BE086D8], "aneSubType");
}

id SIMLModelAddDeviceVersion(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("m9")) & 1) != 0)
  {
    __SceneIntelligenceLogSharedInstance();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136381443;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
      v11 = 1025;
      v12 = 28;
      v13 = 2113;
      v14 = v3;
      v15 = 2113;
      v16 = v4;
      _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Trying to load model %{private}@. in device: %{private}@ ***", (uint8_t *)&v9, 0x26u);
    }

    v6 = v3;
  }
  else
  {
    objc_msgSend(CFSTR("_"), "stringByAppendingString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

id SIMLModelPath_v2(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BE086D8], "aneSubType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
  {
    SIMLModelAddDeviceVersion(v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:inDirectory:", v6, CFSTR("bundle"), v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 136381443;
      v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
      v13 = 1025;
      v14 = 38;
      v15 = 2113;
      v16 = v4;
      v17 = 2113;
      v18 = v7;
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** Loading the model %{private}@. Path: %{private}@ ***", (uint8_t *)&v11, 0x26u);
    }

  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136381187;
      v12 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
      v13 = 1025;
      v14 = 41;
      v15 = 2113;
      v16 = v4;
      _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Trying to load model %{private}@ on device with no ANE ***", (uint8_t *)&v11, 0x1Cu);
    }

    v7 = v4;
  }

  return v7;
}

__CFString *SIGetDeviceType()
{
  __CFString *v0;

  if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
  {
    objc_msgSend(MEMORY[0x24BE086D8], "aneSubType");
    v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v0 = &stru_24CA5D420;
  }
  return v0;
}

id SIMLModelPath(void *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1, "pathForResource:ofType:", v3, CFSTR("mlmodelc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __SceneIntelligenceLogSharedInstance();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136381443;
    v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
    v9 = 1025;
    v10 = 55;
    v11 = 2113;
    v12 = v3;
    v13 = 2113;
    v14 = v4;
    _os_log_impl(&dword_21071A000, v5, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** Loading the model %{private}@. Path: %{private}@ ***", (uint8_t *)&v7, 0x26u);
  }

  return v4;
}

uint64_t SISupportANE()
{
  if (SISupportANE_onceToken != -1)
    dispatch_once(&SISupportANE_onceToken, &__block_literal_global_3);
  return s_deviceSupportsANE;
}

BOOL SIPerformPreCompilation(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _QWORD v25[10];

  v25[9] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE086D8];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "aneSubType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDD17D8]);
  objc_msgSend(v7, "setLaunchPath:", CFSTR("/usr/local/bin/espressoc"));
  v25[0] = CFSTR("--e5-require-ane-resident=strict");
  v25[1] = CFSTR("-i");
  v25[2] = v5;
  v25[3] = CFSTR("-p");
  v25[4] = v6;
  v25[5] = CFSTR("-o");
  v25[6] = v4;
  v25[7] = CFSTR("--mil-entry-points=*");
  v25[8] = CFSTR("> /dev/null 2>&1");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setArguments:", v8);
  __SceneIntelligenceLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "launchPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arguments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136381443;
    v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
    v19 = 1025;
    v20 = 87;
    v21 = 2113;
    v22 = v10;
    v23 = 2113;
    v24 = v11;
    _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** running %{private}@ with arguments: %{private}@ ***", (uint8_t *)&v17, 0x26u);

  }
  objc_msgSend(v7, "launch");
  objc_msgSend(v7, "waitUntilExit");
  v12 = objc_msgSend(v7, "terminationStatus");
  if (v12)
  {
    __SceneIntelligenceLogSharedInstance();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "launchPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arguments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136381443;
      v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIANETools.m";
      v19 = 1025;
      v20 = 91;
      v21 = 2113;
      v22 = v14;
      v23 = 2113;
      v24 = v15;
      _os_log_impl(&dword_21071A000, v13, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** failed to run %{private}@ with arguments: %{private}@ ***", (uint8_t *)&v17, 0x26u);

    }
  }

  return v12 == 0;
}

uint64_t SICompileE5MLBundle()
{
  return 0;
}

void sub_210746300(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2107463F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2107469C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_210746B64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_210746BE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SIMovReader;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_210746C94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_210746D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_210747100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  void *v32;

  _Unwind_Resume(a1);
}

uint64_t SICopyRawDataToOneComponentIOSurface(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7)
{
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  switch(a6)
  {
    case 4:
      return SICopyDataToOneComponentIOSurface<float>(a1, a2, a3, a4, a5, (uint64_t)a7);
    case 2:
      return SICopyDataToOneComponentIOSurface<half>(a1, a2, a3, a4, a5, (uint64_t)a7);
    case 1:
      return SICopyDataToOneComponentIOSurface<unsigned char>(a1, a2, a3, a4, a5, (uint64_t)a7);
  }
  __SceneIntelligenceLogSharedInstance();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 136381187;
    v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.mm";
    v12 = 1025;
    v13 = 34;
    v14 = 2048;
    v15 = a6;
    _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unsupported bytePerElement in src: %zu ***", (uint8_t *)&v10, 0x1Cu);
  }

  return 4;
}

uint64_t SICopyDataToOneComponentIOSurface<unsigned char>(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OSType PixelFormat;
  int v13;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  PixelFormat = IOSurfaceGetPixelFormat(a1);
  if (PixelFormat == 1278226488)
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,unsigned char>(a1, a2, a3, a4, a5, a6);
  v13 = PixelFormat;
  if (PixelFormat == 1278226536)
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,unsigned char>(a1, a2, a3, a4, a5, a6);
  if (PixelFormat == 1278226534)
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,unsigned char>(a1, a2, a3, a4, a5, a6);
  __SceneIntelligenceLogSharedInstance();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    SIPixelFormatToStr(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136381187;
    v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
    v19 = 1025;
    v20 = 97;
    v21 = 2113;
    v22 = v16;
    _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unsupported surface format: %{private}@ ***", (uint8_t *)&v17, 0x1Cu);

  }
  return 4;
}

void sub_2107475BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SICopyDataToOneComponentIOSurface<float>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OSType PixelFormat;
  int v13;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  PixelFormat = IOSurfaceGetPixelFormat(a1);
  if (PixelFormat == 1278226488)
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,float>(a1, a2, a3, a4, a5, a6);
  v13 = PixelFormat;
  if (PixelFormat == 1278226536)
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,float>(a1, a2, a3, a4, a5, a6);
  if (PixelFormat == 1278226534)
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,float>(a1, a2, a3, a4, a5, a6);
  __SceneIntelligenceLogSharedInstance();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    SIPixelFormatToStr(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136381187;
    v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
    v19 = 1025;
    v20 = 97;
    v21 = 2113;
    v22 = v16;
    _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unsupported surface format: %{private}@ ***", (uint8_t *)&v17, 0x1Cu);

  }
  return 4;
}

void sub_2107477F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SICopyDataToOneComponentIOSurface<half>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OSType PixelFormat;
  int v13;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  PixelFormat = IOSurfaceGetPixelFormat(a1);
  if (PixelFormat == 1278226488)
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,half>(a1, a2, a3, a4, a5, a6);
  v13 = PixelFormat;
  if (PixelFormat == 1278226536)
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,half>(a1, a2, a3, a4, a5, a6);
  if (PixelFormat == 1278226534)
    return SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,half>(a1, a2, a3, a4, a5, a6);
  __SceneIntelligenceLogSharedInstance();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    SIPixelFormatToStr(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136381187;
    v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
    v19 = 1025;
    v20 = 97;
    v21 = 2113;
    v22 = v16;
    _os_log_impl(&dword_21071A000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unsupported surface format: %{private}@ ***", (uint8_t *)&v17, 0x1Cu);

  }
  return 4;
}

void sub_210747A34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,unsigned char>(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BytesPerElement;
  size_t v16;
  char *BaseAddress;
  float v18;
  char *v19;
  NSObject *v20;
  uint64_t v22;
  char *v23;
  size_t v24;
  float *v25;
  char *v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  size_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  size_t v36;
  __int16 v37;
  size_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  Width = IOSurfaceGetWidth(a1);
  Height = IOSurfaceGetHeight(a1);
  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    v19 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 1)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 1)
    {
      if (a4)
      {
        v22 = 0;
        do
        {
          if (a3)
          {
            v23 = &a2[v22 * a5];
            v24 = a3;
            v25 = (float *)&BaseAddress[v22 * BytesPerRow];
            do
            {
              v26 = v23;
              if (a6)
                v26 = (char *)(a6 + *v23);
              LOBYTE(v18) = *v26;
              v18 = (float)LODWORD(v18);
              *v25++ = v18;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else
    {
      for (; a4; --a4)
      {
        memcpy(v19, a2, a3);
        a2 += a5;
        v19 += BytesPerRow;
      }
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v27 = 136381955;
      v28 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      v29 = 1025;
      v30 = 34;
      v31 = 2048;
      v32 = a3;
      v33 = 2048;
      v34 = a4;
      v35 = 2048;
      v36 = Width;
      v37 = 2048;
      v38 = Height;
      _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v27, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,unsigned char>(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BytesPerElement;
  size_t v16;
  char *BaseAddress;
  char *v18;
  NSObject *v19;
  uint64_t v21;
  char *v22;
  size_t v23;
  char *v24;
  char *v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  size_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  size_t v35;
  __int16 v36;
  size_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  Width = IOSurfaceGetWidth(a1);
  Height = IOSurfaceGetHeight(a1);
  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 1)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 1)
    {
      if (a4)
      {
        v21 = 0;
        do
        {
          if (a3)
          {
            v22 = &a2[v21 * a5];
            v23 = a3;
            v24 = &BaseAddress[v21 * BytesPerRow];
            do
            {
              v25 = v22;
              if (a6)
                v25 = (char *)(a6 + *v22);
              *v24++ = *v25;
              ++v22;
              --v23;
            }
            while (v23);
          }
          ++v21;
        }
        while (v21 != a4);
      }
    }
    else
    {
      for (; a4; --a4)
      {
        memcpy(v18, a2, a3);
        a2 += a5;
        v18 += BytesPerRow;
      }
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v26 = 136381955;
      v27 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      v28 = 1025;
      v29 = 34;
      v30 = 2048;
      v31 = a3;
      v32 = 2048;
      v33 = a4;
      v34 = 2048;
      v35 = Width;
      v36 = 2048;
      v37 = Height;
      _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v26, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,unsigned char>(__IOSurface *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BytesPerElement;
  size_t v16;
  char *BaseAddress;
  char *v19;
  NSObject *v20;
  uint64_t v22;
  char *v23;
  size_t v24;
  char *v25;
  char *v26;
  int v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  size_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  size_t v40;
  __int16 v41;
  size_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  Width = IOSurfaceGetWidth(a1);
  Height = IOSurfaceGetHeight(a1);
  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    v19 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 1)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 1)
    {
      if (a4)
      {
        v22 = 0;
        do
        {
          if (a3)
          {
            v23 = &a2[v22 * a5];
            v24 = a3;
            v25 = &BaseAddress[v22 * BytesPerRow];
            do
            {
              v26 = v23;
              if (a6)
                v26 = (char *)(a6 + *v23);
              LOBYTE(_S0) = *v26;
              _S0 = (float)LODWORD(_S0);
              __asm { FCVT            H0, S0 }
              *(_WORD *)v25 = LOWORD(_S0);
              v25 += 2;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else
    {
      for (; a4; --a4)
      {
        memcpy(v19, a2, a3);
        a2 += a5;
        v19 += BytesPerRow;
      }
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v31 = 136381955;
      v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      v33 = 1025;
      v34 = 34;
      v35 = 2048;
      v36 = a3;
      v37 = 2048;
      v38 = a4;
      v39 = 2048;
      v40 = Width;
      v41 = 2048;
      v42 = Height;
      _os_log_impl(&dword_21071A000, v20, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v31, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,float>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BytesPerElement;
  size_t v16;
  char *BaseAddress;
  char *v18;
  NSObject *v19;
  size_t v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  float *v25;
  float v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  size_t v36;
  __int16 v37;
  size_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  Width = IOSurfaceGetWidth(a1);
  Height = IOSurfaceGetHeight(a1);
  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 4)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 4)
    {
      if (a4)
      {
        v22 = 0;
        do
        {
          if (a3)
          {
            v23 = (float *)&a2[v22 * a5];
            v24 = a3;
            v25 = (float *)&BaseAddress[v22 * BytesPerRow];
            do
            {
              v26 = *v23;
              if (a6)
              {
                LOBYTE(v26) = *(_BYTE *)(a6 + (int)v26);
                v26 = (float)LODWORD(v26);
              }
              *v25++ = v26;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      v21 = 4 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v27 = 136381955;
      v28 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      v29 = 1025;
      v30 = 34;
      v31 = 2048;
      v32 = a3;
      v33 = 2048;
      v34 = a4;
      v35 = 2048;
      v36 = Width;
      v37 = 2048;
      v38 = Height;
      _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v27, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,float>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BytesPerElement;
  size_t v16;
  char *BaseAddress;
  char *v18;
  NSObject *v19;
  size_t v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  char *v25;
  int v26;
  int v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  size_t v36;
  __int16 v37;
  size_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  Width = IOSurfaceGetWidth(a1);
  Height = IOSurfaceGetHeight(a1);
  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 4)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 4)
    {
      if (a4)
      {
        v22 = 0;
        do
        {
          if (a3)
          {
            v23 = (float *)&a2[v22 * a5];
            v24 = a3;
            v25 = &BaseAddress[v22 * BytesPerRow];
            do
            {
              v26 = (int)*v23;
              if (a6)
                LOBYTE(v26) = *(_BYTE *)(a6 + v26);
              *v25++ = v26;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      v21 = 4 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v27 = 136381955;
      v28 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      v29 = 1025;
      v30 = 34;
      v31 = 2048;
      v32 = a3;
      v33 = 2048;
      v34 = a4;
      v35 = 2048;
      v36 = Width;
      v37 = 2048;
      v38 = Height;
      _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v27, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,float>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BytesPerElement;
  size_t v16;
  char *BaseAddress;
  char *v18;
  NSObject *v19;
  size_t v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  char *v25;
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  size_t v41;
  __int16 v42;
  size_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  Width = IOSurfaceGetWidth(a1);
  Height = IOSurfaceGetHeight(a1);
  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 4)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 4)
    {
      if (a4)
      {
        v22 = 0;
        do
        {
          if (a3)
          {
            v23 = (float *)&a2[v22 * a5];
            v24 = a3;
            v25 = &BaseAddress[v22 * BytesPerRow];
            do
            {
              _S0 = *v23;
              if (a6)
              {
                LOBYTE(_S0) = *(_BYTE *)(a6 + (int)_S0);
                _S0 = (float)LODWORD(_S0);
              }
              __asm { FCVT            H0, S0 }
              *(_WORD *)v25 = _H0;
              v25 += 2;
              ++v23;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      v21 = 4 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v32 = 136381955;
      v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      v34 = 1025;
      v35 = 34;
      v36 = 2048;
      v37 = a3;
      v38 = 2048;
      v39 = a4;
      v40 = 2048;
      v41 = Width;
      v42 = 2048;
      v43 = Height;
      _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v32, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<float,half>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BytesPerElement;
  size_t v16;
  char *BaseAddress;
  char *v18;
  NSObject *v19;
  size_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  float *v25;
  int v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  size_t v41;
  __int16 v42;
  size_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  Width = IOSurfaceGetWidth(a1);
  Height = IOSurfaceGetHeight(a1);
  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 2)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 2)
    {
      if (a4)
      {
        v22 = 0;
        do
        {
          if (a3)
          {
            v23 = &a2[v22 * a5];
            v24 = a3;
            v25 = (float *)&BaseAddress[v22 * BytesPerRow];
            do
            {
              _H0 = *(_WORD *)v23;
              __asm { FCVT            S0, H0 }
              if (a6)
              {
                LOBYTE(_S0) = *(_BYTE *)(a6 + (int)_S0);
                _S0 = (float)LODWORD(_S0);
              }
              *v25++ = _S0;
              v23 += 2;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      v21 = 2 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v32 = 136381955;
      v33 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      v34 = 1025;
      v35 = 34;
      v36 = 2048;
      v37 = a3;
      v38 = 2048;
      v39 = a4;
      v40 = 2048;
      v41 = Width;
      v42 = 2048;
      v43 = Height;
      _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v32, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<unsigned char,half>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BytesPerElement;
  size_t v16;
  char *BaseAddress;
  char *v18;
  NSObject *v19;
  size_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  int v32;
  int v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  size_t v42;
  __int16 v43;
  size_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  Width = IOSurfaceGetWidth(a1);
  Height = IOSurfaceGetHeight(a1);
  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 2)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 2)
    {
      if (a4)
      {
        v22 = 0;
        do
        {
          if (a3)
          {
            v23 = &a2[v22 * a5];
            v24 = a3;
            v25 = &BaseAddress[v22 * BytesPerRow];
            do
            {
              _H0 = *(_WORD *)v23;
              __asm { FCVT            S0, H0 }
              v32 = (int)_S0;
              if (a6)
                LOBYTE(v32) = *(_BYTE *)(a6 + v32);
              *v25++ = v32;
              v23 += 2;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      v21 = 2 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v33 = 136381955;
      v34 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      v35 = 1025;
      v36 = 34;
      v37 = 2048;
      v38 = a3;
      v39 = 2048;
      v40 = a4;
      v41 = 2048;
      v42 = Width;
      v43 = 2048;
      v44 = Height;
      _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v33, 0x3Au);
    }

    return 4;
  }
}

uint64_t SICopyRawDataToOneComponentIOSurfaceWithPrimitiveType<half,half>(__IOSurface *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t Width;
  size_t Height;
  size_t BytesPerRow;
  size_t BytesPerElement;
  size_t v16;
  char *BaseAddress;
  char *v18;
  NSObject *v19;
  size_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  int v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  size_t v42;
  __int16 v43;
  size_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  Width = IOSurfaceGetWidth(a1);
  Height = IOSurfaceGetHeight(a1);
  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BytesPerElement = IOSurfaceGetBytesPerElement(a1);
  if (Width == a3 && Height == a4)
  {
    v16 = BytesPerElement;
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
    v18 = BaseAddress;
    if (BytesPerRow == a5 && !a6 && v16 == 2)
    {
      memcpy(BaseAddress, a2, a5 * a4);
    }
    else if (a6 || v16 != 2)
    {
      if (a4)
      {
        v22 = 0;
        do
        {
          if (a3)
          {
            v23 = &a2[v22 * a5];
            v24 = a3;
            v25 = &BaseAddress[v22 * BytesPerRow];
            do
            {
              _H0 = *(_WORD *)v23;
              if (a6)
              {
                __asm { FCVT            S0, H0 }
                LOBYTE(_S0) = *(_BYTE *)(a6 + (int)_S0);
                _S0 = (float)LODWORD(_S0);
                __asm { FCVT            H0, S0 }
              }
              *(_WORD *)v25 = _H0;
              v25 += 2;
              v23 += 2;
              --v24;
            }
            while (v24);
          }
          ++v22;
        }
        while (v22 != a4);
      }
    }
    else if (a4)
    {
      v21 = 2 * a3;
      do
      {
        memcpy(v18, a2, v21);
        a2 += a5;
        v18 += BytesPerRow;
        --a4;
      }
      while (a4);
    }
    IOSurfaceUnlock(a1, 0, 0);
    return 0;
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v33 = 136381955;
      v34 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBufferCopyTemplate.h";
      v35 = 1025;
      v36 = 34;
      v37 = 2048;
      v38 = a3;
      v39 = 2048;
      v40 = a4;
      v41 = 2048;
      v42 = Width;
      v43 = 2048;
      v44 = Height;
      _os_log_impl(&dword_21071A000, v19, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** CopyElement failed: size is not identical: (%zu, %zu) <-> (%zu, %zu) ***", (uint8_t *)&v33, 0x3Au);
    }

    return 4;
  }
}

void SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer_cold_1()
{
  __assert_rtn("SICreateIOSurfaceBackedPackedFloat32ImageFromBuffer", "SIPixelBuffer.m", 310, "pixelFormat == kCVPixelFormatType_OneComponent32Float || pixelFormat == kCVPixelFormatType_DepthFloat32 || pixelFormat == kCVPixelFormatType_DisparityFloat32 || pixelFormat == kCVPixelFormatType_TwoComponent32Float || pixelFormat == kCVPixelFormatType_128RGBAFloat");
}

void SICreateIOSurfaceBackedPackedFloat16ImageFromBuffer_cold_1()
{
  __assert_rtn("SICreateIOSurfaceBackedPackedFloat16ImageFromBuffer", "SIPixelBuffer.m", 353, "pixelFormat == kCVPixelFormatType_OneComponent16Half || pixelFormat == kCVPixelFormatType_DepthFloat16 || pixelFormat == kCVPixelFormatType_DisparityFloat16 || pixelFormat == kCVPixelFormatType_TwoComponent16Half || pixelFormat == kCVPixelFormatType_64RGBAHalf");
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x24BDC5160](sourceBuffer, destinationBuffer);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5250](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52F8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5318](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x24BDC5358](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

CFDictionaryRef IOSurfaceCopyAllValues(IOSurfaceRef buffer)
{
  return (CFDictionaryRef)MEMORY[0x24BDD8B40](buffer);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BC0](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x24BDF9148](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
  MEMORY[0x24BDF9150](session);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9158](session, sourceBuffer, destinationBuffer);
}

uint64_t VTPixelRotationSessionRotateSubImage()
{
  return MEMORY[0x24BDF9160]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x24BDF9170](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDF91A8](session, propertyKey, propertyValue);
}

uint64_t VZClientOptionsCreate()
{
  return MEMORY[0x24BEC08B0]();
}

uint64_t VZClientOptionsSetTcpIpAddress()
{
  return MEMORY[0x24BEC08C8]();
}

uint64_t VZDataCreateBlobWithCFData()
{
  return MEMORY[0x24BEC08D8]();
}

uint64_t VZDataCreateDictionaryWithCFDictionary()
{
  return MEMORY[0x24BEC08E0]();
}

uint64_t VZDataCreateImageWithCVPixelBuffer()
{
  return MEMORY[0x24BEC08E8]();
}

uint64_t VZDataCreateImageWithIOSurface()
{
  return MEMORY[0x24BEC08F8]();
}

uint64_t VZDataCreateNumberWithCFNumber()
{
  return MEMORY[0x24BEC0900]();
}

uint64_t VZDataCreateNumbersWithCFData()
{
  return MEMORY[0x24BEC0908]();
}

uint64_t VZDataGetDictionaryDataTypeID()
{
  return MEMORY[0x24BEC0910]();
}

uint64_t VZDataGetMeshDataTypeID()
{
  return MEMORY[0x24BEC0920]();
}

uint64_t VZDataInfoCreate()
{
  return MEMORY[0x24BEC0930]();
}

uint64_t VZDataInfoSetName()
{
  return MEMORY[0x24BEC0948]();
}

uint64_t VZDataInfoSetTimestampMachContinuousNanoseconds()
{
  return MEMORY[0x24BEC0958]();
}

uint64_t VZDestinationCreateWithClient()
{
  return MEMORY[0x24BEC0968]();
}

uint64_t VZDestinationCreateWithFileExporter()
{
  return MEMORY[0x24BEC0970]();
}

uint64_t VZFileExportOptionsAddFilteredStoragePreference()
{
  return MEMORY[0x24BEC0988]();
}

uint64_t VZFileExportOptionsCreate()
{
  return MEMORY[0x24BEC0990]();
}

uint64_t VZFileExportOptionsSetAsyncQueueMaxElementCount()
{
  return MEMORY[0x24BEC09A0]();
}

uint64_t VZLogMessageFilterCreate()
{
  return MEMORY[0x24BEC09B8]();
}

uint64_t VZLogMessageFilterRequireDataTypeIDExact()
{
  return MEMORY[0x24BEC09C8]();
}

uint64_t VZLoggerAddDestination()
{
  return MEMORY[0x24BEC09D0]();
}

uint64_t VZLoggerCreate()
{
  return MEMORY[0x24BEC09E0]();
}

uint64_t VZLoggerEnable()
{
  return MEMORY[0x24BEC0A00]();
}

uint64_t VZLoggerEnabled()
{
  return MEMORY[0x24BEC0A08]();
}

uint64_t VZLoggerGetSubLoggerMutable()
{
  return MEMORY[0x24BEC0A10]();
}

uint64_t VZLoggerLogData()
{
  return MEMORY[0x24BEC0A20]();
}

uint64_t VZLoggerRemoveDestination()
{
  return MEMORY[0x24BEC0A30]();
}

uint64_t VZLoggerResetEnableStates()
{
  return MEMORY[0x24BEC0A38]();
}

uint64_t VZRelease()
{
  return MEMORY[0x24BEC0A40]();
}

uint64_t VZRetain()
{
  return MEMORY[0x24BEC0A50]();
}

uint64_t VZSubLoggerEnable()
{
  return MEMORY[0x24BEC0A58]();
}

uint64_t VZSubLoggerEnabled()
{
  return MEMORY[0x24BEC0A60]();
}

uint64_t VZSubLoggerLogData()
{
  return MEMORY[0x24BEC0A68]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t Espresso::get_internal_context(Espresso *this, void *a2)
{
  return MEMORY[0x24BE2F5F0](this, a2);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
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

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
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

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
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
  off_24CA5C720(__p);
}

uint64_t operator delete()
{
  return off_24CA5C728();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CA5C730(__sz);
}

uint64_t operator new()
{
  return off_24CA5C738();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x24BEDCE60](cls, protocol);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x24BE2F6F8]();
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x24BE2F700]();
}

uint64_t e5rt_buffer_object_get_iosurface()
{
  return MEMORY[0x24BE2F710]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x24BE2F720]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x24BE2F7A0]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x24BE2F7B0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x24BE2F7C0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x24BE2F7D0]();
}

uint64_t e5rt_execution_stream_operation_get_input_names()
{
  return MEMORY[0x24BE2F7F0]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x24BE2F800]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x24BE2F808]();
}

uint64_t e5rt_execution_stream_operation_get_output_names()
{
  return MEMORY[0x24BE2F820]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x24BE2F830]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x24BE2F840]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x24BE2F850]();
}

uint64_t e5rt_execution_stream_prewire_in_use_allocations()
{
  return MEMORY[0x24BE2F860]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x24BE2F870]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x24BE2F888]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x24BE2F8A0]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x24BE2F8A8]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x24BE2F8C0]();
}

uint64_t e5rt_io_port_is_surface()
{
  return MEMORY[0x24BE2F8C8]();
}

uint64_t e5rt_io_port_is_tensor()
{
  return MEMORY[0x24BE2F8D8]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x24BE2F8E8]();
}

uint64_t e5rt_io_port_retain_surface_desc()
{
  return MEMORY[0x24BE2F8F8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x24BE2F908]();
}

uint64_t e5rt_program_library_create()
{
  return MEMORY[0x24BE2F958]();
}

uint64_t e5rt_program_library_get_function_metadata()
{
  return MEMORY[0x24BE2F970]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x24BE2F998]();
}

uint64_t e5rt_surface_desc_get_format()
{
  return MEMORY[0x24BE2F9B0]();
}

uint64_t e5rt_surface_desc_get_height()
{
  return MEMORY[0x24BE2F9C0]();
}

uint64_t e5rt_surface_desc_get_width()
{
  return MEMORY[0x24BE2F9D0]();
}

uint64_t e5rt_surface_desc_release()
{
  return MEMORY[0x24BE2F9E8]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x24BE2FA08]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x24BE2FA18]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x24BE2FA20]();
}

uint64_t e5rt_tensor_desc_create()
{
  return MEMORY[0x24BE2FA30]();
}

uint64_t e5rt_tensor_desc_dtype_create()
{
  return MEMORY[0x24BE2FA38]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x24BE2FA40]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x24BE2FA50]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x24BE2FA60]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x24BE2FA68]();
}

uint64_t e5rt_tensor_desc_get_rank()
{
  return MEMORY[0x24BE2FA78]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x24BE2FA88]();
}

uint64_t e5rt_tensor_desc_get_size()
{
  return MEMORY[0x24BE2FA90]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x24BE2FA98]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x24BE2FAA8]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x24BE2FAB8]();
}

uint64_t e5rt_tensor_utils_cast_from_fp32_to_fp16()
{
  return MEMORY[0x24BE2FAC8]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x24BE2FAE8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x24BE2FAF0]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x24BE2FB68]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x24BE2FBA0]();
}

uint64_t espresso_network_get_version()
{
  return MEMORY[0x24BE2FC28]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x24BE2FC38]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x24BE2FC50]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x24BE2FC88]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

int objc_getClassList(Class *buffer, int bufferCount)
{
  return MEMORY[0x24BEDD098](buffer, *(_QWORD *)&bufferCount);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
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

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

float tanf(float a1)
{
  float result;

  MEMORY[0x24BDB0140](a1);
  return result;
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3730](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB37F8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageCopyBuffer(const vImage_Buffer *src, const vImage_Buffer *dest, size_t pixelSize, vImage_Flags flags)
{
  return MEMORY[0x24BDB38A8](src, dest, pixelSize, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar16F(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_16F backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39B0](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39B8](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39C8](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_F backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39E0](src, dest, rotationConstant, *(_QWORD *)&flags, backColor);
}

