void _TIBeginMockingAssetManager()
{
  TIAssetManagerMock *v0;

  __isMocking = 1;
  v0 = objc_alloc_init(TIAssetManagerMock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB5350], "performSelector:withObject:", sel_setSharedAssetManager_, v0);

}

void _TIEndMockingAssetManager()
{
  if (__isMocking == 1)
  {
    __isMocking = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(MEMORY[0x24BEB5350], "performSelector:withObject:", sel_setSharedAssetManager_, 0);
  }
}

void sub_22FA5885C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22FA58940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_22FA58A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_22FA58D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__split_buffer<std::string> *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void **a21,id a22)
{
  void *v22;
  void *v23;

  a21 = (void **)&a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&a21);

  _Unwind_Resume(a1);
}

void sub_22FA5902C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::destroy(*(_QWORD *)a1);
    std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::destroy(*((_QWORD *)a1 + 1));
    if (a1[55] < 0)
      operator delete(*((void **)a1 + 4));
    operator delete(a1);
  }
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

uint64_t std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, _QWORD *a2)
{
  size_t v2;
  size_t v3;
  size_t v4;
  size_t v5;
  size_t v6;
  int v7;

  v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (_QWORD *)*a1;
    v3 = v2;
  }
  v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (_QWORD *)*a2;
    v5 = v4;
  }
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (v3 == v5)
      return 0;
    if (v3 >= v5)
      return 1;
  }
  return 255;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*,false>(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
  __int128 v23;
  BOOL v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  __int128 v28;
  __int128 *v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void **v37;
  uint64_t v38;
  int64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  __int128 v62;
  BOOL v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  char v71;
  char *v72;
  __int128 *v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  __int128 *v77;
  int64_t v78;
  char v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[15];
  uint64_t v97;
  uint64_t v98;

LABEL_1:
  v10 = a2 - 24;
  v75 = a2;
  v77 = (__int128 *)(a2 - 48);
  v73 = (__int128 *)(a2 - 72);
  v11 = a1;
  while (2)
  {
    a1 = v11;
    v12 = a2 - v11;
    v13 = 0xAAAAAAAAAAAAAAABLL * (v12 >> 3);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
        {
          v89 = *(_QWORD *)(a1 + 16);
          v82 = *(_OWORD *)a1;
          v31 = *(_OWORD *)v10;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v10 + 16);
          *(_OWORD *)a1 = v31;
          *(_QWORD *)(v10 + 16) = v89;
          *(_OWORD *)v10 = v82;
        }
        return;
      case 3uLL:
        std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)v10, a3);
        return;
      case 4uLL:
        std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(a1, a1 + 24, a1 + 48, v10, a3);
        return;
      case 5uLL:
        std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__n128 *)a1, a1 + 24, a1 + 48, a1 + 72, v10, a3);
        return;
      default:
        if (v12 <= 575)
        {
          if ((a5 & 1) != 0)
          {
            if (a1 != a2)
            {
              v32 = a1 + 24;
              if (a1 + 24 != a2)
              {
                v33 = 0;
                do
                {
                  v34 = v32;
                  if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                  {
                    v90 = *(_QWORD *)(v34 + 16);
                    v83 = *(_OWORD *)v34;
                    *(_QWORD *)(v34 + 8) = 0;
                    *(_QWORD *)(v34 + 16) = 0;
                    *(_QWORD *)v34 = 0;
                    v35 = v33;
                    do
                    {
                      v36 = a1 + v35;
                      v37 = (void **)(a1 + v35 + 24);
                      if (*(char *)(a1 + v35 + 47) < 0)
                        operator delete(*v37);
                      *(_OWORD *)v37 = *(_OWORD *)v36;
                      *(_QWORD *)(a1 + v35 + 40) = *(_QWORD *)(v36 + 16);
                      *(_BYTE *)(v36 + 23) = 0;
                      *(_BYTE *)v36 = 0;
                      if (!v35)
                      {
                        v38 = a1;
                        goto LABEL_77;
                      }
                      v35 -= 24;
                    }
                    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
                    v38 = a1 + v35 + 24;
                    if (*(char *)(v38 + 23) < 0)
                      operator delete(*(void **)v38);
LABEL_77:
                    a2 = v75;
                    *(_QWORD *)(v38 + 16) = v90;
                    *(_OWORD *)v38 = v83;
                  }
                  v32 = v34 + 24;
                  v33 += 24;
                }
                while (v34 + 24 != a2);
              }
            }
          }
          else if (a1 != a2)
          {
            v64 = a1 + 24;
            if (a1 + 24 != a2)
            {
              v65 = (char *)(a1 + 47);
              do
              {
                v66 = v64;
                if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                {
                  v93 = *(_QWORD *)(v66 + 16);
                  v86 = *(_OWORD *)v66;
                  *(_QWORD *)(v66 + 8) = 0;
                  *(_QWORD *)(v66 + 16) = 0;
                  *(_QWORD *)v66 = 0;
                  v67 = v65;
                  do
                  {
                    v68 = v67;
                    v69 = v67 - 23;
                    v70 = v67 - 47;
                    if (*v67 < 0)
                      operator delete(*(void **)v69);
                    *(_OWORD *)v69 = *(_OWORD *)v70;
                    *((_QWORD *)v69 + 2) = *((_QWORD *)v70 + 2);
                    *(v68 - 24) = 0;
                    *(v68 - 47) = 0;
                    v71 = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
                    v67 = v68 - 24;
                  }
                  while ((v71 & 1) != 0);
                  v72 = v68 - 47;
                  if (v72[23] < 0)
                    operator delete(*(void **)v72);
                  *((_QWORD *)v72 + 2) = v93;
                  *(_OWORD *)v72 = v86;
                }
                v64 = v66 + 24;
                v65 += 24;
              }
              while (v66 + 24 != a2);
            }
          }
          return;
        }
        if (!a4)
        {
          if (a1 != a2)
          {
            v39 = (v13 - 2) >> 1;
            v78 = v39;
            do
            {
              v40 = v39;
              if (v78 >= v39)
              {
                v41 = (2 * v39) | 1;
                v42 = a1 + 24 * v41;
                if (2 * v39 + 2 < (uint64_t)v13 && (*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                {
                  v42 += 24;
                  v41 = 2 * v40 + 2;
                }
                v43 = a1 + 24 * v40;
                a2 = v75;
                if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
                {
                  v91 = *(_QWORD *)(v43 + 16);
                  v84 = *(_OWORD *)v43;
                  *(_QWORD *)(v43 + 8) = 0;
                  *(_QWORD *)(v43 + 16) = 0;
                  *(_QWORD *)v43 = 0;
                  while (1)
                  {
                    v44 = v42;
                    if (*(char *)(v43 + 23) < 0)
                      operator delete(*(void **)v43);
                    v45 = *(_OWORD *)v42;
                    *(_QWORD *)(v43 + 16) = *(_QWORD *)(v42 + 16);
                    *(_OWORD *)v43 = v45;
                    *(_BYTE *)(v42 + 23) = 0;
                    *(_BYTE *)v42 = 0;
                    if (v78 < v41)
                      break;
                    v46 = (2 * v41) | 1;
                    v42 = a1 + 24 * v46;
                    v41 = 2 * v41 + 2;
                    if (v41 >= (uint64_t)v13)
                    {
                      v41 = v46;
                    }
                    else if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                    {
                      v42 += 24;
                    }
                    else
                    {
                      v41 = v46;
                    }
                    v43 = v44;
                    if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                    {
                      if (*(char *)(v44 + 23) < 0)
                        operator delete(*(void **)v44);
                      break;
                    }
                  }
                  *(_QWORD *)(v44 + 16) = v91;
                  *(_OWORD *)v44 = v84;
                  a2 = v75;
                }
              }
              v39 = v40 - 1;
            }
            while (v40);
            v47 = v12 / 0x18uLL;
            do
            {
              v48 = 0;
              v74 = a2;
              v76 = *(_QWORD *)a1;
              *(_QWORD *)v96 = *(_QWORD *)(a1 + 8);
              *(_QWORD *)&v96[7] = *(_QWORD *)(a1 + 15);
              v79 = *(_BYTE *)(a1 + 23);
              *(_QWORD *)(a1 + 8) = 0;
              *(_QWORD *)(a1 + 16) = 0;
              *(_QWORD *)a1 = 0;
              v49 = v47 - 2;
              if (v47 < 2)
                v49 = v47 - 1;
              v50 = v49 >> 1;
              v51 = a1;
              do
              {
                v52 = v51 + 24 * v48 + 24;
                v53 = 2 * v48;
                v48 = (2 * v48) | 1;
                v54 = v53 + 2;
                if (v53 + 2 < v47 && (*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                {
                  v52 += 24;
                  v48 = v54;
                }
                if (*(char *)(v51 + 23) < 0)
                  operator delete(*(void **)v51);
                v55 = *(_OWORD *)v52;
                *(_QWORD *)(v51 + 16) = *(_QWORD *)(v52 + 16);
                *(_OWORD *)v51 = v55;
                *(_BYTE *)(v52 + 23) = 0;
                *(_BYTE *)v52 = 0;
                v51 = v52;
              }
              while (v48 <= v50);
              if (v52 == v74 - 24)
              {
                v57 = v74 - 24;
                *(_QWORD *)v52 = v76;
                *(_QWORD *)(v52 + 8) = *(_QWORD *)v96;
                *(_QWORD *)(v52 + 15) = *(_QWORD *)&v96[7];
                *(_BYTE *)(v52 + 23) = v79;
              }
              else
              {
                v56 = *(_OWORD *)(v74 - 24);
                v57 = v74 - 24;
                *(_QWORD *)(v52 + 16) = *(_QWORD *)(v74 - 8);
                *(_OWORD *)v52 = v56;
                *(_QWORD *)(v74 - 24) = v76;
                *(_QWORD *)(v74 - 9) = *(_QWORD *)&v96[7];
                *(_QWORD *)(v74 - 16) = *(_QWORD *)v96;
                *(_BYTE *)(v74 - 1) = v79;
                v58 = v52 - a1 + 24;
                if (v58 >= 25)
                {
                  v59 = (unint64_t)(-2 - 0x5555555555555555 * (v58 >> 3)) >> 1;
                  v60 = a1 + 24 * v59;
                  if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
                  {
                    v92 = *(_QWORD *)(v52 + 16);
                    v85 = *(_OWORD *)v52;
                    *(_QWORD *)(v52 + 8) = 0;
                    *(_QWORD *)(v52 + 16) = 0;
                    *(_QWORD *)v52 = 0;
                    while (1)
                    {
                      v61 = v60;
                      if (*(char *)(v52 + 23) < 0)
                        operator delete(*(void **)v52);
                      v62 = *(_OWORD *)v60;
                      *(_QWORD *)(v52 + 16) = *(_QWORD *)(v60 + 16);
                      *(_OWORD *)v52 = v62;
                      *(_BYTE *)(v60 + 23) = 0;
                      *(_BYTE *)v60 = 0;
                      if (!v59)
                        break;
                      v59 = (v59 - 1) >> 1;
                      v60 = a1 + 24 * v59;
                      v52 = v61;
                      if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
                      {
                        if (*(char *)(v61 + 23) < 0)
                          operator delete(*(void **)v61);
                        break;
                      }
                    }
                    *(_QWORD *)(v61 + 16) = v92;
                    *(_OWORD *)v61 = v85;
                  }
                }
              }
              v63 = v47-- <= 2;
              a2 = v57;
            }
            while (!v63);
          }
          return;
        }
        v14 = a1 + 24 * (v13 >> 1);
        if ((unint64_t)v12 < 0xC01)
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__int128 *)(a1 + 24 * (v13 >> 1)), (__int128 *)a1, (__int128 *)v10, a3);
        }
        else
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__int128 *)a1, (__int128 *)(a1 + 24 * (v13 >> 1)), (__int128 *)v10, a3);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__int128 *)(a1 + 24), (__int128 *)(a1 + 24 * (v13 >> 1) - 24), v77, a3);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__int128 *)(a1 + 48), (__int128 *)(a1 + 24 + 24 * (v13 >> 1)), v73, a3);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__int128 *)(a1 + 24 * (v13 >> 1) - 24), (__int128 *)(a1 + 24 * (v13 >> 1)), (__int128 *)(a1 + 24 + 24 * (v13 >> 1)), a3);
          v87 = *(_QWORD *)(a1 + 16);
          v80 = *(_OWORD *)a1;
          v15 = *(_QWORD *)(v14 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v14;
          *(_QWORD *)(a1 + 16) = v15;
          *(_QWORD *)(v14 + 16) = v87;
          *(_OWORD *)v14 = v80;
        }
        --a4;
        a2 = v75;
        if ((a5 & 1) == 0 && ((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
        {
          v98 = *(_QWORD *)(a1 + 16);
          v95 = *(_OWORD *)a1;
          *(_QWORD *)(a1 + 8) = 0;
          *(_QWORD *)(a1 + 16) = 0;
          *(_QWORD *)a1 = 0;
          if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0)
          {
            v11 = a1;
            do
              v11 += 24;
            while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0);
          }
          else
          {
            v25 = a1 + 24;
            do
            {
              v11 = v25;
              if (v25 >= v75)
                break;
              v26 = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
              v25 = v11 + 24;
            }
            while (!v26);
          }
          v27 = v75;
          if (v11 < v75)
          {
            v27 = v75;
            do
              v27 -= 24;
            while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
          }
          while (v11 < v27)
          {
            v88 = *(_QWORD *)(v11 + 16);
            v81 = *(_OWORD *)v11;
            v28 = *(_OWORD *)v27;
            *(_QWORD *)(v11 + 16) = *(_QWORD *)(v27 + 16);
            *(_OWORD *)v11 = v28;
            *(_QWORD *)(v27 + 16) = v88;
            *(_OWORD *)v27 = v81;
            do
              v11 += 24;
            while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
            do
              v27 -= 24;
            while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
          }
          v29 = (__int128 *)(v11 - 24);
          if (v11 - 24 == a1)
          {
            if (*(char *)(v11 - 1) < 0)
              operator delete(*(void **)a1);
          }
          else
          {
            if (*(char *)(a1 + 23) < 0)
              operator delete(*(void **)a1);
            v30 = *v29;
            *(_QWORD *)(a1 + 16) = *(_QWORD *)(v11 - 8);
            *(_OWORD *)a1 = v30;
            *(_BYTE *)(v11 - 1) = 0;
            *(_BYTE *)(v11 - 24) = 0;
          }
          a5 = 0;
          *(_QWORD *)(v11 - 8) = v98;
          *v29 = v95;
          continue;
        }
        v97 = *(_QWORD *)(a1 + 16);
        v94 = *(_OWORD *)a1;
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)a1 = 0;
        v16 = a1;
        do
          v16 += 24;
        while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
        v17 = v75;
        if (v16 - 24 == a1)
        {
          v17 = v75;
          do
          {
            if (v16 >= v17)
              break;
            v17 -= 24;
          }
          while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0);
        }
        else
        {
          do
            v17 -= 24;
          while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
        }
        v11 = v16;
        if (v16 < v17)
        {
          v18 = v17;
          do
          {
            v19 = *(_OWORD *)v11;
            v20 = *(_QWORD *)(v11 + 16);
            v21 = *(_QWORD *)(v18 + 16);
            *(_OWORD *)v11 = *(_OWORD *)v18;
            *(_QWORD *)(v11 + 16) = v21;
            *(_QWORD *)(v18 + 16) = v20;
            *(_OWORD *)v18 = v19;
            do
              v11 += 24;
            while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
            do
              v18 -= 24;
            while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
          }
          while (v11 < v18);
        }
        v22 = (__int128 *)(v11 - 24);
        if (v11 - 24 == a1)
        {
          if (*(char *)(v11 - 1) < 0)
            operator delete(*(void **)a1);
        }
        else
        {
          if (*(char *)(a1 + 23) < 0)
            operator delete(*(void **)a1);
          v23 = *v22;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v11 - 8);
          *(_OWORD *)a1 = v23;
          *(_BYTE *)(v11 - 1) = 0;
          *(_BYTE *)(v11 - 24) = 0;
        }
        *(_QWORD *)(v11 - 8) = v97;
        *v22 = v94;
        if (v16 < v17)
        {
LABEL_33:
          std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*,false>(a1, v11 - 24, a3, a4, a5 & 1);
          a5 = 0;
          continue;
        }
        v24 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(a1, v11 - 24, a3);
        if (!std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(v11, v75, a3))
        {
          if (v24)
            continue;
          goto LABEL_33;
        }
        a2 = v11 - 24;
        if (!v24)
          goto LABEL_1;
        return;
    }
  }
}

void sub_22FA59E40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0)
    operator delete(__p);
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

void std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:nn180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

uint64_t **std::__tree<std::__value_type<std::string,long>,std::__map_value_compare<std::string,std::__value_type<std::string,long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  _QWORD *v8;
  uint64_t **v9;
  _QWORD *v10;
  std::string *v11;
  uint64_t *v12;
  uint64_t *v13;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v6 = (uint64_t **)v5;
        v8 = v5 + 4;
        if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) == 0)
          break;
        v5 = *v6;
        v9 = v6;
        if (!*v6)
          goto LABEL_9;
      }
      if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a2) & 0x80) == 0)
        return v6;
      v9 = v6 + 1;
      v5 = v6[1];
      if (!v5)
        goto LABEL_9;
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_9:
    v10 = operator new(0x40uLL);
    v11 = (std::string *)(v10 + 4);
    if (*(char *)(a3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
    }
    else
    {
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
      v10[6] = *(_QWORD *)(a3 + 16);
    }
    v10[7] = 0;
    *v10 = 0;
    v10[1] = 0;
    v10[2] = v6;
    *v9 = v10;
    v12 = (uint64_t *)**a1;
    v13 = v10;
    if (v12)
    {
      *a1 = v12;
      v13 = *v9;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], v13);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return (uint64_t **)v10;
}

void sub_22FA5A090(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
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

void std::vector<std::string>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(24 * a1);
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

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

uint64_t std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  char v8;
  uint64_t result;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v8 = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
  result = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
  if ((v8 & 1) != 0)
  {
    if ((_DWORD)result)
    {
      v10 = *((_QWORD *)a1 + 2);
      v11 = *a1;
      v12 = *((_QWORD *)a3 + 2);
      *a1 = *a3;
      *((_QWORD *)a1 + 2) = v12;
    }
    else
    {
      v19 = *((_QWORD *)a1 + 2);
      v20 = *a1;
      v21 = *((_QWORD *)a2 + 2);
      *a1 = *a2;
      *((_QWORD *)a1 + 2) = v21;
      *a2 = v20;
      *((_QWORD *)a2 + 2) = v19;
      result = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
      if (!(_DWORD)result)
        return result;
      v10 = *((_QWORD *)a2 + 2);
      v11 = *a2;
      v22 = *((_QWORD *)a3 + 2);
      *a2 = *a3;
      *((_QWORD *)a2 + 2) = v22;
    }
    *a3 = v11;
    *((_QWORD *)a3 + 2) = v10;
  }
  else if ((_DWORD)result)
  {
    v13 = *((_QWORD *)a2 + 2);
    v14 = *a2;
    v15 = *((_QWORD *)a3 + 2);
    *a2 = *a3;
    *((_QWORD *)a2 + 2) = v15;
    *a3 = v14;
    *((_QWORD *)a3 + 2) = v13;
    result = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
    if ((_DWORD)result)
    {
      v16 = *((_QWORD *)a1 + 2);
      v17 = *a1;
      v18 = *((_QWORD *)a2 + 2);
      *a1 = *a2;
      *((_QWORD *)a1 + 2) = v18;
      *a2 = v17;
      *((_QWORD *)a2 + 2) = v16;
    }
  }
  return result;
}

__n128 std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __n128 result;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__int128 *)a1, (__int128 *)a2, (__int128 *)a3, a5);
  if ((*(unsigned int (**)(void))(*(_QWORD *)a5 + 16))())
  {
    v11 = *(_QWORD *)(a3 + 16);
    v12 = *(_OWORD *)a3;
    v13 = *(_QWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_QWORD *)(a3 + 16) = v13;
    *(_OWORD *)a4 = v12;
    *(_QWORD *)(a4 + 16) = v11;
    if ((*(unsigned int (**)(void))(*(_QWORD *)a5 + 16))())
    {
      v14 = *(_QWORD *)(a2 + 16);
      v15 = *(_OWORD *)a2;
      v16 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_QWORD *)(a2 + 16) = v16;
      *(_OWORD *)a3 = v15;
      *(_QWORD *)(a3 + 16) = v14;
      if ((*(unsigned int (**)(void))(*(_QWORD *)a5 + 16))())
      {
        v17 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v18 = *(_QWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v18;
        *(__n128 *)a2 = result;
        *(_QWORD *)(a2 + 16) = v17;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __n128 v12;
  __n128 result;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __n128 v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v12 = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((uint64_t)a1, a2, a3, a4, a6);
  if ((*(unsigned int (**)(__n128))(*(_QWORD *)a6 + 16))(v12))
  {
    v14 = *(_QWORD *)(a4 + 16);
    v15 = *(_OWORD *)a4;
    v16 = *(_QWORD *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_QWORD *)(a4 + 16) = v16;
    *(_OWORD *)a5 = v15;
    *(_QWORD *)(a5 + 16) = v14;
    if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
    {
      v17 = *(_QWORD *)(a3 + 16);
      v18 = *(_OWORD *)a3;
      v19 = *(_QWORD *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_QWORD *)(a3 + 16) = v19;
      *(_OWORD *)a4 = v18;
      *(_QWORD *)(a4 + 16) = v17;
      if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
      {
        v20 = *(_QWORD *)(a2 + 16);
        v21 = *(__n128 *)a2;
        v22 = *(_QWORD *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_QWORD *)(a2 + 16) = v22;
        *(__n128 *)a3 = v21;
        *(_QWORD *)(a3 + 16) = v20;
        if ((*(unsigned int (**)(void))(*(_QWORD *)a6 + 16))())
        {
          v23 = a1[1].n128_u64[0];
          result = *a1;
          v24 = *(_QWORD *)(a2 + 16);
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v24;
          *(__n128 *)a2 = result;
          *(_QWORD *)(a2 + 16) = v23;
        }
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  _BOOL8 result;
  __int128 *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v8 = (__int128 *)(a2 - 24);
      if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
      {
        v9 = *(_QWORD *)(a1 + 16);
        v10 = *(_OWORD *)a1;
        v11 = *(_QWORD *)(a2 - 8);
        *(_OWORD *)a1 = *v8;
        *(_QWORD *)(a1 + 16) = v11;
        *v8 = v10;
        *(_QWORD *)(a2 - 8) = v9;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a2 - 24), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>(a1, a1 + 24, a1 + 48, a2 - 24, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__n128 *)a1, a1 + 24, a1 + 48, a1 + 72, a2 - 24, a3);
      return 1;
    default:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,BOOL({block_pointer} {__strong}&)(std::string const&,std::string const&),std::string*>((__int128 *)a1, (__int128 *)(a1 + 24), (__int128 *)(a1 + 48), a3);
      v12 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v13 = 0;
      v14 = 0;
      break;
  }
  while (1)
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
    {
      v19 = *(_OWORD *)v12;
      v20 = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(v12 + 8) = 0;
      *(_QWORD *)(v12 + 16) = 0;
      *(_QWORD *)v12 = 0;
      v15 = v13;
      do
      {
        v16 = a1 + v15;
        v17 = (void **)(a1 + v15 + 72);
        if (*(char *)(a1 + v15 + 95) < 0)
          operator delete(*v17);
        *(_OWORD *)v17 = *(_OWORD *)(v16 + 48);
        *(_QWORD *)(a1 + v15 + 88) = *(_QWORD *)(v16 + 64);
        *(_BYTE *)(v16 + 71) = 0;
        *(_BYTE *)(v16 + 48) = 0;
        if (v15 == -48)
        {
          v18 = a1;
          goto LABEL_15;
        }
        v15 -= 24;
      }
      while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
      v18 = a1 + v15 + 72;
      if (*(char *)(v18 + 23) < 0)
        operator delete(*(void **)v18);
LABEL_15:
      *(_OWORD *)v18 = v19;
      *(_QWORD *)(v18 + 16) = v20;
      if (++v14 == 8)
        return v12 + 24 == a2;
    }
    v13 += 24;
    v12 += 24;
    if (v12 == a2)
      return 1;
  }
}

void sub_22FA5A8DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_22FA5A998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_22FA5AA64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_22FA5AB34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22FA5AC20(_Unwind_Exception *a1)
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

void sub_22FA5AD70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_22FA5AF1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA5B078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA5B218(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA5B29C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TIBeginMockingUserDictionaryServer()
{
  _TIBeginMockingUserDictionaryServerWithPairs(MEMORY[0x24BDBD1A8]);
}

void _TIBeginMockingUserDictionaryServerWithPairs(void *a1)
{
  id v1;
  TIUserDictionaryServerMock *v2;

  v1 = a1;
  v2 = objc_alloc_init(TIUserDictionaryServerMock);
  -[TIUserDictionaryServerMock setPairs:](v2, "setPairs:", v1);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB5458], "performSelector:withObject:", sel_setSharedInstance_, v2);

}

uint64_t _TIEndMockingUserDictionaryServer()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(MEMORY[0x24BEB5458], "performSelector:withObject:", sel_setSharedInstance_, 0);
  return result;
}

void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0)
    operator delete(this[2]);
}

uint64_t TIRunFailingTests()
{
  return 0;
}

uint64_t TIRunFailingTestsDevice()
{
  return 0;
}

id languageModelFilePathForInputMode()
{
  TINgramModelPathForInputMode();
  return (id)objc_claimAutoreleasedReturnValue();
}

id englishUnigramsFilePath()
{
  UIKeyboardStaticUnigramsFile();
  return (id)objc_claimAutoreleasedReturnValue();
}

void invalidateCurrentTestServiceConnection()
{
  id v0;

  v0 = (id)currentTestServiceConnection;
  if (v0)
    objc_msgSend(v0, "invalidate");

}

void sub_22FA5BCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id ensureTestServiceConnection()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  if (currentTestServiceConnection)
  {
    v0 = (id)currentTestServiceConnection;
  }
  else
  {
    v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.TextInput.TextInputTestService"));
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E4F958);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setRemoteObjectInterface:", v1);

    v2 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3321888768;
    v8[2] = ___ZZ27ensureTestServiceConnectionENK3__0cvU13block_pointerFvvEEv_block_invoke;
    v8[3] = &__block_descriptor_33_ea8_32c40_ZTSKZ27ensureTestServiceConnectionE3__0_e5_v8__0l;
    v3 = (void *)MEMORY[0x2348A8EA4](v8);
    objc_msgSend(v0, "setInvalidationHandler:", v3);

    objc_msgSend(v0, "resume");
    v7[0] = v2;
    v7[1] = 3321888768;
    v7[2] = __ensureTestServiceConnection_block_invoke;
    v7[3] = &__block_descriptor_33_ea8_32c40_ZTSKZ27ensureTestServiceConnectionE3__1_e17_v16__0__NSError_8l;
    objc_msgSend(v0, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v2;
    v6[1] = 3321888768;
    v6[2] = __ensureTestServiceConnection_block_invoke_30;
    v6[3] = &__block_descriptor_33_ea8_32c40_ZTSKZ27ensureTestServiceConnectionE3__2_e5_v8__0l;
    objc_msgSend(v4, "ackWithReply:", v6);
    objc_storeStrong((id *)&currentTestServiceConnection, v0);

  }
  return v0;
}

void sub_22FA5BE08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void ___ZZ27ensureTestServiceConnectionENK3__0cvU13block_pointerFvvEEv_block_invoke()
{
  void *v0;
  void *v1;
  _QWORD v2[5];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v0 = (void *)currentTestServiceConnection;
    currentTestServiceConnection = 0;

  }
  else
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3321888768;
    v2[2] = ___ZZZ27ensureTestServiceConnectionENK3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
    v2[3] = &__block_descriptor_33_ea8_32c53_ZTSKZZ27ensureTestServiceConnectionENK3__0clEvEUlvE__e5_v8__0l;
    v1 = (void *)MEMORY[0x2348A8EA4](v2);
    TIDispatchSync();

  }
}

void __ensureTestServiceConnection_block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  objc_msgSend(a2, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Could not message test service: %@"), v2);

  __break(1u);
}

void sub_22FA5BF10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZZZ27ensureTestServiceConnectionENK3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke()
{
  void *v0;

  v0 = (void *)currentTestServiceConnection;
  currentTestServiceConnection = 0;

}

void __createAndLoadStaticDictionary(KB::StaticDictionary *a1)
{
  _BYTE v2[32];
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  KB::StaticDictionary::create(a1);
  KB::LexiconInfo::LexiconInfo((uint64_t)v2, (uint64_t)a1);
  KB::StaticDictionary::load();
  KB::String::~String((KB::String *)v6);
  KB::String::~String((KB::String *)&v5);
  KB::String::~String((KB::String *)&v4);
  KB::String::~String((KB::String *)&v3);
  KB::String::~String((KB::String *)v2);
}

void sub_22FA5C004(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t *v2;
  va_list va;

  va_start(va, a2);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)va);
  std::unique_ptr<KB::StaticDictionary>::reset[abi:nn180100](v2);
  _Unwind_Resume(a1);
}

uint64_t KB::LexiconInfo::LexiconInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = MEMORY[0x2348A87C0]();
  MEMORY[0x2348A87C0](v4 + 32, a2 + 32);
  MEMORY[0x2348A87C0](a1 + 64, a2 + 64);
  MEMORY[0x2348A87C0](a1 + 96, a2 + 96);
  MEMORY[0x2348A87C0](a1 + 128, a2 + 128);
  v5 = *(_QWORD *)(a2 + 160);
  *(_DWORD *)(a1 + 168) = *(_DWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = v5;
  return a1;
}

void sub_22FA5C0AC(_Unwind_Exception *a1)
{
  KB::String *v1;
  KB::String *v2;
  KB::String *v3;
  KB::String *v4;

  KB::String::~String(v4);
  KB::String::~String(v3);
  KB::String::~String(v2);
  KB::String::~String(v1);
  _Unwind_Resume(a1);
}

void KB::LexiconInfo::~LexiconInfo(KB::LexiconInfo *this)
{
  KB::String::~String((KB::LexiconInfo *)((char *)this + 128));
  KB::String::~String((KB::LexiconInfo *)((char *)this + 96));
  KB::String::~String((KB::LexiconInfo *)((char *)this + 64));
  KB::String::~String((KB::LexiconInfo *)((char *)this + 32));
  KB::String::~String(this);
}

uint64_t std::unique_ptr<KB::StaticDictionary>::reset[abi:nn180100](uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    MEMORY[0x2348A86D0]();
    JUMPOUT(0x2348A8A24);
  }
  return result;
}

void __createAndLoadDynamicDictionary(const KB::LexiconInfo *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  char *v6;
  _QWORD v7[3];
  void **v8;
  _BYTE v9[32];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  KB::DynamicDictionary::create_single(a1);
  v4 = *a2;
  KB::LexiconInfo::LexiconInfo((uint64_t)v9, (uint64_t)a1);
  v5 = (char *)operator new(0xB0uLL);
  v6 = v5 + 176;
  v7[0] = v5;
  v7[2] = v5 + 176;
  KB::LexiconInfo::LexiconInfo((uint64_t)v5, (uint64_t)v9);
  v7[1] = v6;
  (*(void (**)(uint64_t, _QWORD *, _QWORD))(*(_QWORD *)v4 + 40))(v4, v7, 0);
  v8 = (void **)v7;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v8);
  KB::String::~String((KB::String *)v13);
  KB::String::~String((KB::String *)&v12);
  KB::String::~String((KB::String *)&v11);
  KB::String::~String((KB::String *)&v10);
  KB::String::~String((KB::String *)v9);
}

void sub_22FA5C268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t *v5;
  uint64_t v7;
  void **v8;
  va_list va;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v8 = va_arg(va1, void **);
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)va1);
  v7 = *v5;
  *v5 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Unwind_Resume(a1);
}

void std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  KB::LexiconInfo *v2;
  KB::LexiconInfo *v4;
  void *v5;

  v1 = *a1;
  v2 = (KB::LexiconInfo *)**a1;
  if (v2)
  {
    v4 = (KB::LexiconInfo *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 = (KB::LexiconInfo *)((char *)v4 - 176);
        KB::LexiconInfo::~LexiconInfo(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void __createAndLoadMutableLexiconWrapper(NSString *a1, NSString *a2)
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  KB *v6;
  NSString *v7;
  _BYTE v8[32];
  _BYTE v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v5 = a2;
  if (v5)
  {
    UIKeyboardDynamicDictionaryFile();
    v6 = (KB *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  KB::utf8_string((KB *)v3, v4);
  KB::utf8_string(v6, v7);
  KB::MutableLexiconWrapper::create();
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v9);

}

void sub_22FA5C3FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __createAndLoadDictionaryContainerMultiLexicon(NSString *a1@<X0>, NSString *a2@<X1>, float a3@<S0>, NSString *a4@<X2>, void ***a5@<X8>)
{
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char *v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  void **v22[22];
  uint64_t v23;
  _BYTE v24[32];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[32];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[8];

  v33[6] = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a4;
  if (v11)
  {
    UIKeyboardDynamicDictionaryFile();
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  __getLexiconInfo(v9, v12, 1.0 - a3, (uint64_t)v29);
  if (v11)
  {
    UIKeyboardDynamicDictionaryFile();
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  __getLexiconInfo(v10, v13, a3, (uint64_t)v24);
  KB::LexiconInfo::LexiconInfo((uint64_t)v22, (uint64_t)v29);
  KB::LexiconInfo::LexiconInfo((uint64_t)&v23, (uint64_t)v24);
  v20 = 0;
  v14 = (char *)operator new(0x160uLL);
  v15 = 0;
  v16 = 0;
  v19 = v14;
  v21 = v14 + 352;
  do
  {
    v17 = v15;
    v14 = (char *)(KB::LexiconInfo::LexiconInfo((uint64_t)v14, (uint64_t)&v22[22 * v16]) + 176);
    v15 = 1;
    v16 = 1;
  }
  while ((v17 & 1) == 0);
  v20 = v14;
  v18 = 44;
  do
  {
    KB::String::~String((KB::String *)&v22[v18 - 6]);
    KB::String::~String((KB::String *)&v22[v18 - 10]);
    KB::String::~String((KB::String *)&v22[v18 - 14]);
    KB::String::~String((KB::String *)&v22[v18 - 18]);
    KB::String::~String((KB::String *)&v22[v18 - 22]);
    v18 -= 22;
  }
  while (v18 * 8);
  KB::DictionaryContainer::create_multilexicon();
  *a5 = v22[0];
  v22[0] = (void **)&v19;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](v22);
  KB::String::~String((KB::String *)&v28);
  KB::String::~String((KB::String *)&v27);
  KB::String::~String((KB::String *)&v26);
  KB::String::~String((KB::String *)&v25);
  KB::String::~String((KB::String *)v24);

  KB::String::~String((KB::String *)v33);
  KB::String::~String((KB::String *)&v32);
  KB::String::~String((KB::String *)&v31);
  KB::String::~String((KB::String *)&v30);
  KB::String::~String((KB::String *)v29);

}

void sub_22FA5C690(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&STACK[0x230]);

  _Unwind_Resume(a1);
}

void __createAndLoadLanguageModelStub(NSString *a1@<X0>, NSString *a2@<X1>, uint64_t *a3@<X8>)
{
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  _QWORD *v13;
  CFTypeRef v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef v17[2];
  CFTypeRef v18[2];
  __int128 v19;
  __int128 v20;
  int v21;
  CFTypeRef cf;
  CFTypeRef v23;
  CFTypeRef v24;
  CFTypeRef v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doesSupportInlineCompletion");
  KB::LanguageModelConfig::LanguageModelConfig();
  v10 = operator new();
  v14 = cf;
  if (cf)
  {
    CFRetain(cf);
    v14 = cf;
  }
  v15 = v23;
  if (v23)
  {
    CFRetain(v23);
    v15 = v23;
  }
  v16 = v24;
  if (v24)
  {
    CFRetain(v24);
    v16 = v24;
  }
  v11 = *(_OWORD *)v25;
  *(_OWORD *)v25 = 0u;
  *(_OWORD *)v17 = v11;
  v12 = v26;
  v26 = 0u;
  *(_OWORD *)v18 = v12;
  v19 = v27;
  v20 = v28;
  v21 = v29;
  MEMORY[0x2348A8748](v10, &v14);
  *a3 = v10;
  v13 = (_QWORD *)operator new();
  *v13 = &off_24FD483D0;
  v13[1] = 0;
  v13[2] = 0;
  v13[3] = v10;
  a3[1] = (uint64_t)v13;
  if (v18[1])
    CFRelease(v18[1]);
  v18[1] = 0;
  if (v18[0])
    CFRelease(v18[0]);
  v18[0] = 0;
  if (v17[1])
    CFRelease(v17[1]);
  v17[1] = 0;
  if (v17[0])
    CFRelease(v17[0]);
  v17[0] = 0;
  if (v16)
    CFRelease(v16);
  v16 = 0;
  if (v15)
    CFRelease(v15);
  v15 = 0;
  if (v14)
    CFRelease(v14);
  v14 = 0;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v10 + 72))(v10, 1);
  if (*((_QWORD *)&v26 + 1))
    CFRelease(*((CFTypeRef *)&v26 + 1));
  *((_QWORD *)&v26 + 1) = 0;
  if ((_QWORD)v26)
    CFRelease((CFTypeRef)v26);
  *(_QWORD *)&v26 = 0;
  if (v25[1])
    CFRelease(v25[1]);
  v25[1] = 0;
  if (v25[0])
    CFRelease(v25[0]);
  v25[0] = 0;
  if (v24)
    CFRelease(v24);
  v24 = 0;
  if (v23)
    CFRelease(v23);
  v23 = 0;
  if (cf)
    CFRelease(cf);

}

void sub_22FA5CA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CFTypeRef a13, CFTypeRef cf, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  if (cf)
    CFRelease(cf);
  if (a13)
    CFRelease(a13);
  MEMORY[0x2348A8A24](v30, 0x10F1C404047A376);
  KB::LanguageModelConfig::~LanguageModelConfig((KB::LanguageModelConfig *)&a25);

  _Unwind_Resume(a1);
}

void KB::LanguageModelConfig::~LanguageModelConfig(KB::LanguageModelConfig *this)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  v2 = (const void *)*((_QWORD *)this + 6);
  if (v2)
    CFRelease(v2);
  *((_QWORD *)this + 6) = 0;
  v3 = (const void *)*((_QWORD *)this + 5);
  if (v3)
    CFRelease(v3);
  *((_QWORD *)this + 5) = 0;
  v4 = (const void *)*((_QWORD *)this + 4);
  if (v4)
    CFRelease(v4);
  *((_QWORD *)this + 4) = 0;
  v5 = (const void *)*((_QWORD *)this + 3);
  if (v5)
    CFRelease(v5);
  *((_QWORD *)this + 3) = 0;
  v6 = (const void *)*((_QWORD *)this + 2);
  if (v6)
    CFRelease(v6);
  *((_QWORD *)this + 2) = 0;
  v7 = (const void *)*((_QWORD *)this + 1);
  if (v7)
    CFRelease(v7);
  *((_QWORD *)this + 1) = 0;
  if (*(_QWORD *)this)
    CFRelease(*(CFTypeRef *)this);
  *(_QWORD *)this = 0;
}

uint64_t std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](uint64_t a1)
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

void std::__shared_ptr_pointer<KB::LanguageModelImplStub *,std::shared_ptr<KB::LanguageModel>::__shared_ptr_default_delete<KB::LanguageModel,KB::LanguageModelImplStub>,std::allocator<KB::LanguageModelImplStub>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2348A8A24);
}

uint64_t std::__shared_ptr_pointer<KB::LanguageModelImplStub *,std::shared_ptr<KB::LanguageModel>::__shared_ptr_default_delete<KB::LanguageModel,KB::LanguageModelImplStub>,std::allocator<KB::LanguageModelImplStub>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void __createAndLoadLanguageModelContainer(NSString *a1@<X0>, NSString *a2@<X1>, float a3@<S0>, NSString *a4@<X2>, _OWORD *a5@<X8>)
{
  NSString *v9;
  NSString *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  _QWORD *v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  _QWORD v47[6];
  std::__shared_weak_count *v48;
  void *v49;
  std::__shared_weak_count *v50;
  _BYTE v51[40];
  uint64_t v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  void *__p[2];
  _QWORD v57[7];
  _QWORD v58[7];

  v58[6] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a4;
  __createAndLoadLanguageModel(a1, v10, &v54);
  __createAndLoadLanguageModel(v9, v10, &v52);
  v47[5] = v54;
  v48 = v55;
  if (v55)
  {
    p_shared_owners = (unint64_t *)&v55->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup();
  if (v48)
  {
    v13 = &v48->__shared_owners_;
    do
      v14 = __ldaxr((unint64_t *)v13);
    while (__stlxr(v14 - 1, (unint64_t *)v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
      std::__shared_weak_count::__release_weak(v48);
    }
  }
  v43 = v52;
  v44 = v53;
  if (v53)
  {
    v15 = (unint64_t *)&v53->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup();
  if (v44)
  {
    v17 = &v44->__shared_owners_;
    do
      v18 = __ldaxr((unint64_t *)v17);
    while (__stlxr(v18 - 1, (unint64_t *)v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  (*(void (**)(void **__return_ptr))(*(_QWORD *)v54 + 48))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v49, 1.0 - a3);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  (*(void (**)(void **__return_ptr))(*(_QWORD *)v52 + 48))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v45, a3);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  __p[0] = v49;
  __p[1] = v50;
  if (v50)
  {
    v19 = (unint64_t *)&v50->__shared_owners_;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
  }
  std::unordered_map<unsigned int,float>::unordered_map((uint64_t)v57, (uint64_t)v51);
  v57[5] = v45;
  v57[6] = v46;
  if (v46)
  {
    v21 = (unint64_t *)&v46->__shared_owners_;
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  std::unordered_map<unsigned int,float>::unordered_map((uint64_t)v58, (uint64_t)v47);
  v41 = 0;
  v23 = operator new(0x70uLL);
  v24 = 0;
  v25 = 0;
  v40 = v23;
  v42 = v23 + 14;
  do
  {
    v26 = v24;
    v23 = std::construct_at[abi:nn180100]<KB::LanguageModelLexiconGroup,KB::LanguageModelLexiconGroup const&,KB::LanguageModelLexiconGroup*>(v23, &__p[7 * v25])+ 7;
    v24 = 1;
    v25 = 1;
  }
  while ((v26 & 1) == 0);
  v41 = v23;
  v27 = 112;
  do
  {
    std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)&v51[v27 + 32]);
    std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&v51[v27 + 16]);
    v27 -= 56;
  }
  while (v27);
  KB::LanguageModelContainer::create((uint64_t *)__p, (uint64_t)&v40);
  *a5 = *(_OWORD *)__p;
  __p[0] = &v40;
  std::vector<KB::LanguageModelLexiconGroup>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)v47);
  v28 = v46;
  if (v46)
  {
    v29 = (unint64_t *)&v46->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)v51);
  v31 = v50;
  if (v50)
  {
    v32 = (unint64_t *)&v50->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = v53;
  if (v53)
  {
    v35 = (unint64_t *)&v53->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  v37 = v55;
  if (v55)
  {
    v38 = (unint64_t *)&v55->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }

}

void sub_22FA5D050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,char a33,uint64_t a34,void *__p,uint64_t a36)
{
  void *v36;
  void *v37;

  std::vector<KB::LanguageModelLexiconGroup>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)&a17);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a15);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)&a26);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a24);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a31);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a33);

  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<unsigned int,float>::unordered_map(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t **v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  uint64_t **v10;
  uint64_t *i;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  v5 = *(uint64_t ***)(a2 + 16);
  if (v5)
  {
    v6 = (_QWORD *)(a1 + 16);
    v7 = *(_QWORD *)(a1 + 8);
    do
    {
      v8 = *((unsigned int *)v5 + 4);
      if (v7)
      {
        v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
        v9.i16[0] = vaddlv_u8(v9);
        if (v9.u32[0] > 1uLL)
        {
          v2 = *((unsigned int *)v5 + 4);
          if (v7 <= v8)
            v2 = v8 % v7;
        }
        else
        {
          v2 = ((_DWORD)v7 - 1) & v8;
        }
        v10 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v2);
        if (v10)
        {
          for (i = *v10; i; i = (uint64_t *)*i)
          {
            v12 = i[1];
            if (v12 == v8)
            {
              if (*((_DWORD *)i + 4) == (_DWORD)v8)
                goto LABEL_41;
            }
            else
            {
              if (v9.u32[0] > 1uLL)
              {
                if (v12 >= v7)
                  v12 %= v7;
              }
              else
              {
                v12 &= v7 - 1;
              }
              if (v12 != v2)
                break;
            }
          }
        }
      }
      v13 = operator new(0x18uLL);
      *v13 = 0;
      v13[1] = v8;
      v13[2] = v5[2];
      v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
      v15 = *(float *)(a1 + 32);
      if (!v7 || (float)(v15 * (float)v7) < v14)
      {
        v16 = (v7 & (v7 - 1)) != 0;
        if (v7 < 3)
          v16 = 1;
        v17 = v16 | (2 * v7);
        v18 = vcvtps_u32_f32(v14 / v15);
        if (v17 <= v18)
          v19 = v18;
        else
          v19 = v17;
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>(a1, v19);
        v7 = *(_QWORD *)(a1 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v7 <= v8)
            v2 = v8 % v7;
          else
            v2 = v8;
        }
        else
        {
          v2 = ((_DWORD)v7 - 1) & v8;
        }
      }
      v20 = *(_QWORD *)a1;
      v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v2);
      if (v21)
      {
        *v13 = *v21;
      }
      else
      {
        *v13 = *v6;
        *v6 = v13;
        *(_QWORD *)(v20 + 8 * v2) = v6;
        if (!*v13)
          goto LABEL_40;
        v22 = *(_QWORD *)(*v13 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v22 >= v7)
            v22 %= v7;
        }
        else
        {
          v22 &= v7 - 1;
        }
        v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
      }
      *v21 = v13;
LABEL_40:
      ++*(_QWORD *)(a1 + 24);
LABEL_41:
      v5 = (uint64_t **)*v5;
    }
    while (v5);
  }
  return a1;
}

void sub_22FA5D38C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table(uint64_t a1)
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

_QWORD *std::construct_at[abi:nn180100]<KB::LanguageModelLexiconGroup,KB::LanguageModelLexiconGroup const&,KB::LanguageModelLexiconGroup*>(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  std::unordered_map<unsigned int,float>::unordered_map((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  return a1;
}

void sub_22FA5D448(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

void KB::LanguageModelContainer::create(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v7;
  unint64_t v8;
  unint64_t *p_shared_weak_owners;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;

  v4 = operator new();
  MEMORY[0x2348A876C](v4, a2);
  *a1 = v4;
  v5 = (std::__shared_weak_count *)operator new();
  v5->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&off_24FD48838;
  v5->__shared_weak_owners_ = 0;
  v5[1].__vftable = (std::__shared_weak_count_vtbl *)v4;
  a1[1] = (uint64_t)v5;
  v7 = *(std::__shared_weak_count **)(v4 + 16);
  if (v7)
  {
    if (v7->__shared_owners_ != -1)
      return;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v10 = __ldxr(p_shared_weak_owners);
    while (__stxr(v10 + 1, p_shared_weak_owners));
    *(_QWORD *)(v4 + 8) = v4;
    *(_QWORD *)(v4 + 16) = v5;
    std::__shared_weak_count::__release_weak(v7);
  }
  else
  {
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    v12 = (unint64_t *)&v5->__shared_weak_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
    *(_QWORD *)(v4 + 8) = v4;
    *(_QWORD *)(v4 + 16) = v5;
  }
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

void sub_22FA5D588(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::vector<KB::LanguageModelLexiconGroup>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;

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
        v6 = v4 - 56;
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table(v4 - 40);
        std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v6);
        v4 = v6;
      }
      while ((void *)v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__shared_ptr_pointer<KB::LanguageModelContainer *,std::shared_ptr<KB::LanguageModelContainer>::__shared_ptr_default_delete<KB::LanguageModelContainer,KB::LanguageModelContainer>,std::allocator<KB::LanguageModelContainer>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2348A8A24);
}

uint64_t std::__shared_ptr_pointer<KB::LanguageModelContainer *,std::shared_ptr<KB::LanguageModelContainer>::__shared_ptr_default_delete<KB::LanguageModelContainer,KB::LanguageModelContainer>,std::allocator<KB::LanguageModelContainer>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

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
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

void __sentenceContextForWords(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v4;
  std::string *v5;
  std::string *v6;
  std::string *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  std::string *v12;
  std::string *v13;
  void **v14;
  void *__p[2];
  std::string::size_type v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = operator new(8uLL);
  *v4 = 0x100000000;
  std::string::basic_string[abi:nn180100]<0>(__p, "");
  v12 = 0;
  v5 = (std::string *)operator new(0x18uLL);
  v6 = v5;
  v7 = v5 + 1;
  v11 = v5;
  v13 = v5 + 1;
  if (SHIBYTE(v16) < 0)
  {
    std::string::__init_copy_ctor_external(v5, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    v5->__r_.__value_.__r.__words[2] = v16;
  }
  v12 = v7;
  MEMORY[0x2348A8730](a2, v4, 1, v6, 1);
  v14 = &v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v14);
  if (SHIBYTE(v16) < 0)
    operator delete(__p[0]);
  operator delete(v4);
  v8 = *a1;
  v9 = a1[1];
  if (*a1 != v9)
  {
    do
    {
      KB::LanguageModel::id_for_static_word();
      if (*(_WORD *)v8)
      {
        if (*(_QWORD *)(v8 + 8))
          v10 = *(char **)(v8 + 8);
        else
          v10 = (char *)(v8 + 16);
      }
      else
      {
        v10 = "";
      }
      std::string::basic_string[abi:nn180100]<0>(&v11, v10);
      KB::LanguageModelContext::append();
      if (SHIBYTE(v13) < 0)
        operator delete(v11);
      v8 += 32;
    }
    while (v8 != v9);
  }
}

void sub_22FA5DA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  if (a21 < 0)
    operator delete(__p);
  operator delete(v21);
  _Unwind_Resume(a1);
}

void KB::LanguageModelContext::~LanguageModelContext(KB::LanguageModelContext *this)
{
  void *v2;
  void **v3;

  v3 = (void **)((char *)this + 80);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v3);
  language_modeling::v1::LinguisticContext::~LinguisticContext((KB::LanguageModelContext *)((char *)this + 72));
  language_modeling::v1::LinguisticContext::~LinguisticContext((KB::LanguageModelContext *)((char *)this + 64));
  v2 = (void *)*((_QWORD *)this + 2);
  if (v2)
  {
    *((_QWORD *)this + 3) = v2;
    operator delete(v2);
  }
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)this);
}

void __staticWordForDictionaryString(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __staticWordForDictionaryStringLexiconID(a1, 0, a2);
}

void __staticWordForDictionaryStringLexiconID(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  BOOL (*v19)(uint64_t, KB::Word *);
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;

  v23 = 0;
  v24 = 0;
  v25 = 0;
  KB::DictionaryContainer::derive_static_words();
  KB::String::String((KB::String *)a3);
  *(_QWORD *)(a3 + 48) = 0x3F80000000000000;
  *(_WORD *)(a3 + 32) = 0;
  *(_DWORD *)(a3 + 56) = 1065353216;
  KB::String::String((KB::String *)(a3 + 64));
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)(a3 + 96) = _D0;
  *(_DWORD *)(a3 + 104) = 0;
  *(_QWORD *)(a3 + 152) = 0;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_DWORD *)(a3 + 144) = 0;
  KB::String::String((KB::String *)(a3 + 160));
  *(_OWORD *)(a3 + 200) = 0u;
  *(_BYTE *)(a3 + 192) = 0;
  *(_OWORD *)(a3 + 216) = 0u;
  *(_DWORD *)(a3 + 232) = 1065353216;
  v12 = v23;
  v11 = v24;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v19 = ___Z40__staticWordForDictionaryStringLexiconIDRKN2KB6StringERKN3WTF6RefPtrINS_19DictionaryContainerEEEj_block_invoke;
  v20 = &__block_descriptor_44_e10_B16__0r_v8l;
  v21 = a1;
  v22 = a2;
  v13 = v18;
  if (v12 != v11)
  {
    while ((((uint64_t (*)(_QWORD *, uint64_t))v19)(v13, v12) & 1) == 0)
    {
      v12 += 240;
      if (v12 == v11)
      {
        v12 = v11;
        break;
      }
    }
  }

  if (v12 != v24)
  {
    KB::String::operator=();
    KB::ByteString::operator=();
    v14 = *(_QWORD *)(v12 + 48);
    *(_DWORD *)(a3 + 56) = *(_DWORD *)(v12 + 56);
    *(_QWORD *)(a3 + 48) = v14;
    KB::String::operator=();
    v15 = *(_OWORD *)(v12 + 96);
    v16 = *(_OWORD *)(v12 + 112);
    v17 = *(_OWORD *)(v12 + 144);
    *(_OWORD *)(a3 + 128) = *(_OWORD *)(v12 + 128);
    *(_OWORD *)(a3 + 144) = v17;
    *(_OWORD *)(a3 + 96) = v15;
    *(_OWORD *)(a3 + 112) = v16;
    KB::String::operator=();
    *(_BYTE *)(a3 + 192) = *(_BYTE *)(v12 + 192);
    if (v12 != a3)
    {
      *(_DWORD *)(a3 + 232) = *(_DWORD *)(v12 + 232);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<unsigned long long,void *> *>>((_QWORD *)(a3 + 200), *(_QWORD **)(v12 + 216));
    }
  }
  v26 = (void **)&v23;
  std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100](&v26);
}

void sub_22FA5DCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, KB::String *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, char *a20)
{
  KB::String *v20;
  unsigned __int16 *v21;
  uint64_t v23;

  KB::String::~String(a10);
  if (*v21 >= 0xFu)
  {
    v23 = *((_QWORD *)v20 + 5);
    if (v23)
      MEMORY[0x2348A8A0C](v23, 0x1000C8077774924);
  }
  KB::String::~String(v20);
  a20 = &a17;
  std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100]((void ***)&a20);
  _Unwind_Resume(a1);
}

BOOL ___Z40__staticWordForDictionaryStringLexiconIDRKN2KB6StringERKN3WTF6RefPtrINS_19DictionaryContainerEEEj_block_invoke(uint64_t a1, KB::Word *this)
{
  int v4;
  _BOOL8 v5;
  _BYTE v7[32];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  KB::Word::capitalized_string(this);
  if (KB::String::equal((KB::String *)v7, *(const KB::String **)(a1 + 32)))
  {
    v4 = *(_DWORD *)(a1 + 40);
    if (v4)
      v5 = v4 == *((_DWORD *)this + 34);
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  KB::String::~String((KB::String *)v7);
  return v5;
}

void sub_22FA5DE0C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  KB::String::~String((KB::String *)va);
  _Unwind_Resume(a1);
}

void std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<unsigned long long,void *> *>>(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t i;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *inserted;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v4 = a1[1];
  if (!v4)
    goto LABEL_7;
  for (i = 0; i != v4; ++i)
    *(_QWORD *)(*a1 + 8 * i) = 0;
  v6 = (_QWORD *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v6)
  {
    while (a2)
    {
      v7 = a2[2];
      v6[2] = v7;
      v8 = (_QWORD *)*v6;
      v6[1] = v7;
      inserted = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_prepare((uint64_t)a1, v7, v6 + 2);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_perform(a1, v6, inserted);
      a2 = (_QWORD *)*a2;
      v6 = v8;
      if (!v8)
        goto LABEL_7;
    }
    do
    {
      v13 = (_QWORD *)*v6;
      operator delete(v6);
      v6 = v13;
    }
    while (v13);
  }
  else
  {
LABEL_7:
    while (a2)
    {
      v10 = operator new(0x18uLL);
      *v10 = 0;
      v11 = a2[2];
      v10[2] = v11;
      v10[1] = v11;
      v12 = std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_prepare((uint64_t)a1, v11, v10 + 2);
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_perform(a1, v10, v12);
      a2 = (_QWORD *)*a2;
    }
  }
}

void sub_22FA5DF14(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void KB::Word::~Word(KB::Word *this)
{
  uint64_t v2;

  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)this + 200);
  KB::String::~String((KB::Word *)((char *)this + 160));
  KB::String::~String((KB::Word *)((char *)this + 64));
  if (*((unsigned __int16 *)this + 16) >= 0xFu)
  {
    v2 = *((_QWORD *)this + 5);
    if (v2)
      MEMORY[0x2348A8A0C](v2, 0x1000C8077774924);
  }
  KB::String::~String(this);
}

void std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = v2;
    if (v4 != v2)
    {
      do
        KB::Word::~Word((KB::Word *)(v4 - 240));
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  _BOOL8 v9;
  unint64_t v10;
  unint64_t v11;
  int8x8_t prime;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint8x8_t v18;
  unint64_t v19;
  uint8x8_t v20;
  uint64_t v21;
  _QWORD *i;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint8x8_t v26;
  unint64_t v27;
  _QWORD *v28;
  int v29;
  _QWORD *result;
  unint64_t v31;
  unint64_t v32;
  _BOOL4 v33;
  int v34;
  void *v35;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 1;
    if (v6 >= 3)
      v9 = (v6 & (v6 - 1)) != 0;
    v10 = v9 | (2 * v6);
    v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11)
      prime = (int8x8_t)v11;
    else
      prime = (int8x8_t)v10;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v6 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v6)
      goto LABEL_74;
    if (*(_QWORD *)&prime >= v6)
      goto LABEL_43;
    v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (v20 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      v19 = std::__next_prime(v19);
    }
    else
    {
      v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2)
        v19 = v21;
    }
    if (*(_QWORD *)&prime <= v19)
      prime = (int8x8_t)v19;
    if (*(_QWORD *)&prime >= v6)
    {
      v6 = *(_QWORD *)(a1 + 8);
      goto LABEL_43;
    }
    if (prime)
    {
LABEL_74:
      if (*(_QWORD *)&prime >> 61)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v13 = operator new(8 * *(_QWORD *)&prime);
      v14 = *(void **)a1;
      *(_QWORD *)a1 = v13;
      if (v14)
        operator delete(v14);
      v15 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v15++) = 0;
      while (*(_QWORD *)&prime != v15);
      v16 = *(_QWORD **)(a1 + 16);
      if (v16)
      {
        v17 = v16[1];
        v18 = (uint8x8_t)vcnt_s8(prime);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          if (v17 >= *(_QWORD *)&prime)
            v17 %= *(_QWORD *)&prime;
        }
        else
        {
          v17 &= *(_QWORD *)&prime - 1;
        }
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v17) = a1 + 16;
        for (i = (_QWORD *)*v16; *v16; i = (_QWORD *)*v16)
        {
          v23 = i[1];
          if (v18.u32[0] > 1uLL)
          {
            if (v23 >= *(_QWORD *)&prime)
              v23 %= *(_QWORD *)&prime;
          }
          else
          {
            v23 &= *(_QWORD *)&prime - 1;
          }
          if (v23 == v17)
          {
            v16 = i;
          }
          else
          {
            v24 = i;
            if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v23))
            {
              do
              {
                v25 = v24;
                v24 = (_QWORD *)*v24;
              }
              while (v24 && i[2] == v24[2]);
              *v16 = v24;
              *v25 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v23);
              **(_QWORD **)(*(_QWORD *)a1 + 8 * v23) = i;
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v16;
              v16 = i;
              v17 = v23;
            }
          }
        }
      }
      v6 = (unint64_t)prime;
    }
    else
    {
      v35 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v35)
        operator delete(v35);
      v6 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
  }
LABEL_43:
  v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    v27 = a2;
    if (v6 <= a2)
      v27 = a2 % v6;
  }
  else
  {
    v27 = (v6 - 1) & a2;
  }
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v27);
  if (!v28)
    return 0;
  v29 = 0;
  do
  {
    result = v28;
    v28 = (_QWORD *)*v28;
    if (!v28)
      break;
    v31 = v28[1];
    if (v26.u32[0] > 1uLL)
    {
      v32 = v28[1];
      if (v31 >= v6)
        v32 = v31 % v6;
    }
    else
    {
      v32 = v31 & (v6 - 1);
    }
    if (v32 != v27)
      break;
    v33 = v31 == a2 && v28[2] == *a3;
    v34 = v29 & !v33;
    v29 |= v33;
  }
  while (v34 != 1);
  return result;
}

_QWORD *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__node_insert_multi_perform(_QWORD *result, _QWORD *a2, _QWORD *a3)
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

id __createTemporaryDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  __temporaryRootPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (__createDirectoryAtPath(v3))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

void sub_22FA5E4BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id __temporaryRootPath(void)
{
  if (__temporaryRootPath(void)::onceToken != -1)
    dispatch_once(&__temporaryRootPath(void)::onceToken, &__block_literal_global_108);
  return (id)__temporaryRootPath(void)::path;
}

uint64_t __createDirectoryAtPath(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  char v6;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDD0CC8];
  v10[0] = &unk_24FD5F708;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, v3, &v8);
  v5 = v8;

  if (v5)
    v6 = v4;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
    NSLog(CFSTR("Failed to create temporary directory: %@"), v5);

  return v4;
}

void sub_22FA5E634(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void ___ZL19__temporaryRootPathv_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("TextInputTests"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)__temporaryRootPath(void)::path;
  __temporaryRootPath(void)::path = v1;

  if (__remakeDirectoryAtPath((void *)__temporaryRootPath(void)::path))
    v3 = (void *)__temporaryRootPath(void)::path;
  else
    v3 = 0;
  objc_storeStrong((id *)&__temporaryRootPath(void)::path, v3);
}

void sub_22FA5E6CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __remakeDirectoryAtPath(void *a1)
{
  id v1;
  uint64_t DirectoryAtPath;

  v1 = a1;
  __removeTemporaryDirectory(v1);
  DirectoryAtPath = __createDirectoryAtPath(v1);

  return DirectoryAtPath;
}

void sub_22FA5E714(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __removeTemporaryDirectory(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  char v5;
  id v7;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v3 = objc_msgSend(v2, "removeItemAtPath:error:", v1, &v7);
    v4 = v7;

    if (v4)
      v5 = v3;
    else
      v5 = 1;
    if ((v5 & 1) == 0)
      NSLog(CFSTR("Failed to remove temporary directory: %@"), v4);

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

void sub_22FA5E7C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t __installTestResources(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  id v20;
  void *v21;
  id obj;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v23 = a1;
  v20 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("TILanguageSpecificTests")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = objc_claimAutoreleasedReturnValue();

  v19 = (void *)v4;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v20, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v21, 0, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v7 = 0;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    LOBYTE(v10) = 1;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v10 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v7;
          v10 = objc_msgSend(v16, "copyItemAtURL:toURL:error:", v12, v15, &v24);
          v17 = v24;

          v7 = v17;
          if ((v10 & 1) != 0)
            goto LABEL_12;
        }
        else
        {
          v10 = 0;
        }
        if (v7)
          NSLog(CFSTR("Problem installing test resources: %@"), v7);
LABEL_12:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (!v8)
        goto LABEL_16;
    }
  }
  v10 = 1;
LABEL_16:

  return v10;
}

void sub_22FA5EA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

id __pretrainedDynamicModelsPath(void)
{
  void *v0;
  void *v1;

  __temporaryRootPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("PretrainedDynamicModels"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_22FA5EB74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __pretrainDynamicModelsForInputMode(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  AutocorrectionTestHarness *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[8];
  _QWORD v12[9];

  v12[8] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (__pretrainDynamicModelsForInputMode::onceToken != -1)
    dispatch_once(&__pretrainDynamicModelsForInputMode::onceToken, &__block_literal_global);
  v2 = (id)__pretrainDynamicModelsForInputMode::pretrainedInputModes;
  objc_sync_enter(v2);
  if ((objc_msgSend((id)__pretrainDynamicModelsForInputMode::pretrainedInputModes, "containsObject:", v1) & 1) == 0)
  {
    v3 = (void *)MEMORY[0x2348A8D30]();
    v11[0] = CFSTR("INPUT_MODE");
    v11[1] = CFSTR("USE_AUTOCORRECTION");
    v12[0] = v1;
    v12[1] = MEMORY[0x24BDBD1C0];
    v11[2] = CFSTR("USE_RETROCORRECTION");
    v11[3] = CFSTR("USE_AUTOCAPITALIZATION");
    v12[2] = MEMORY[0x24BDBD1C0];
    v12[3] = MEMORY[0x24BDBD1C8];
    v11[4] = CFSTR("WORD_LEARNING_ENABLED");
    v11[5] = CFSTR("KEYBOARD_WIDTH");
    v12[4] = MEMORY[0x24BDBD1C8];
    v12[5] = &unk_24FD5F720;
    v12[6] = CFSTR("Portrait");
    v11[6] = CFSTR("KEYBOARD_ORIENTATION");
    v11[7] = CFSTR("CUSTOM_DYNAMIC_RESOURCE_PATH");
    __pretrainedDynamicModelsPath();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[7] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[AutocorrectionTestHarness initWithAttributes:]([AutocorrectionTestHarness alloc], "initWithAttributes:", v5);
    objc_msgSend(&unk_24FD5FD68, "objectForKey:", v1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = (void *)MEMORY[0x24BDBD1A8];
    if (v7)
      v9 = (void *)v7;
    v10 = v9;

    -[AutocorrectionTestHarness trainWithCorpus:](v6, "trainWithCorpus:", v10);
    LMLanguageModelPerformMaintenance();

    objc_autoreleasePoolPop(v3);
    objc_msgSend((id)__pretrainDynamicModelsForInputMode::pretrainedInputModes, "addObject:", v1);
  }
  objc_sync_exit(v2);

}

void sub_22FA5ED84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void ____pretrainDynamicModelsForInputMode_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__pretrainDynamicModelsForInputMode::pretrainedInputModes;
  __pretrainDynamicModelsForInputMode::pretrainedInputModes = v0;

}

uint64_t __installPretrainedDynamicModels(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)MEMORY[0x24BDBCF48];
  __pretrainedDynamicModelsPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v18, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v6 = 0;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    LOBYTE(v9) = 1;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "stringByAppendingPathComponent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v9 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v6;
          v9 = objc_msgSend(v15, "copyItemAtURL:toURL:error:", v11, v14, &v20);
          v16 = v20;

          v6 = v16;
          if ((v9 & 1) != 0)
            goto LABEL_12;
        }
        else
        {
          v9 = 0;
        }
        if (v6)
          NSLog(CFSTR("Problem installing pretrained dynamic assets: %@"), v6);
LABEL_12:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v7)
        goto LABEL_16;
    }
  }
  v9 = 1;
LABEL_16:

  return v9;
}

void sub_22FA5F044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void __removeTemporaryDynamicDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  id v10;
  id v11;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length"))
  {
    dynamicFilePathForInputMode(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v9 = objc_msgSend(v8, "removeItemAtPath:error:", v5, &v11);
      v10 = v11;

      if ((v9 & 1) == 0)
        NSLog(CFSTR("Failed to remove temporary dynamic dictionary: %@"), v10);

    }
  }

}

void sub_22FA5F1CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void __removeTemporaryDynamicLanguageModel(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
  KB::LanguageModel::clear_dynamic_learning_bundles();

}

void sub_22FA5F250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ____removeTemporaryDynamicLanguageModel_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    NSLog(CFSTR("Failed to remove temproary dynamic learning bundles!"));
}

id __URLWithTextSamplesForInputMode(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("TILanguageSpecificTests")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-corpus.txt"), v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(CFSTR("TestCorpus"), "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:relativeToURL:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_22FA5F35C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

id __URLWithPersonaForPersonaName(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&unk_24FD5FBE8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v4)
        objc_enumerationMutation(&unk_24FD5FBE8);
      v6 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v5);
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLForResource:withExtension:subdirectory:", v1, v6, CFSTR("TestPersonas"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v2, "fileExistsAtPath:", v9);

      if ((v10 & 1) != 0)
        break;

      if (v3 == ++v5)
      {
        v3 = objc_msgSend(&unk_24FD5FBE8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v8 = 0;
  }

  return v8;
}

void sub_22FA5F524(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id __loadTextSamplesAtURL(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;

  v1 = a1;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v1, 4, &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  if (v3)
  {
    objc_msgSend(v1, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Problem opening file with URL %@ : %@"), v4, v3);

  }
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterWithBlock:", &__block_literal_global_99);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_22FA5F648(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t ____loadTextSamplesAtURL_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", &stru_24FD49B78) ^ 1;
}

id __loadTextSamplesForInputMode(NSString *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v15 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-corpus.txt"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(CFSTR("TestCorpus"), "stringByAppendingPathComponent:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:relativeToURL:", v4, v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v5, 4, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if (v7)
  {
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Problem opening file with URL %@ : %@"), v8, v7);

  }
  if (v6)
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqualToString:", &stru_24FD49B78) & 1) == 0)
            objc_msgSend(v1, "addObject:", v13);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

  }
  return v1;
}

void sub_22FA5F8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_22FA6014C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

BOOL isSpace(UTF32Char a1)
{
  const __CFCharacterSet *Predefined;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

uint64_t get_idx(int a1, int a2, int a3)
{
  return (a2 + a3 * a1);
}

id TIOptimalSequenceAlignment(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t (**v7)(id, void *, void *);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v12;
  uint64_t i;
  float v14;
  float v15;
  _WORD *v16;
  float v17;
  uint64_t j;
  float v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float *v32;
  float v33;
  float v34;
  unsigned __int16 v36;
  int v37;
  uint64_t v38;
  int v39;
  unsigned int v40;
  TIAlignedIndexes *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  uint64_t k;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  void *v52;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v52 = v5;
  if ((unint64_t)objc_msgSend(v5, "count") > 0xFFFE
    || (unint64_t)objc_msgSend(v6, "count") > 0xFFFE
    || (v8 = (unsigned __int16)(objc_msgSend(v5, "count") + 1),
        v9 = (unsigned __int16)(objc_msgSend(v6, "count") + 1),
        v8 <= 1)
    && v9 < 2)
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_6;
  }
  v10 = (void *)MEMORY[0x24BDBD1A8];
  if ((_DWORD)v8 && (_DWORD)v9)
  {
    v46 = v8 - 1;
    v49 = malloc_type_malloc(8 * (v9 * v8), 0x100004000313F17uLL);
    *v49 = 0;
    if (v8 >= 2)
    {
      v12 = v49;
      for (i = 1; i != v8; ++i)
      {
        if (i == 1)
          v14 = 1.0;
        else
          v14 = 0.8;
        v15 = v14 + *(float *)v12;
        v12 += v9;
        *(float *)v12 = v15;
        *((_WORD *)v12 + 2) = i;
        *((_WORD *)v12 + 3) = 1;
      }
    }
    if (v9 >= 2)
    {
      v16 = (_WORD *)v49 + 7;
      v17 = *(float *)v49;
      for (j = 1; j != v9; ++j)
      {
        if (j == 1)
          v19 = 1.0;
        else
          v19 = 0.8;
        v17 = v19 + v17;
        *(float *)(v16 - 3) = v17;
        *(v16 - 1) = j;
        *v16 = 2;
        v16 += 4;
      }
      v20 = v8 - 1;
      v21 = v9;
      v50 = 1;
      v51 = v49;
      v47 = v8;
      for (k = v9; k != v50; LODWORD(v9) = k)
      {
        if (v8 >= 2)
        {
          v22 = 0;
          v23 = v51;
          do
          {
            objc_msgSend(v52, "objectAtIndex:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v6;
            objc_msgSend(v6, "objectAtIndex:", v50 - 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v7[2](v7, v24, v26);

            if (v27)
              v28 = 0.0;
            else
              v28 = 1.0;
            v29 = v28 + *(float *)v23;
            if (*((_WORD *)v23 + 7) == 1)
              v30 = 0.8;
            else
              v30 = 1.0;
            v31 = *((float *)v23 + 2) + v30;
            v32 = (float *)&v23[v21];
            if (HIWORD(v23[v21]) == 2)
              v33 = 0.8;
            else
              v33 = 1.0;
            v34 = *(float *)&v23[v21] + v33;
            if (v29 > v31 || v29 > v34)
            {
              if (v31 <= v34)
              {
                v32[2] = v31;
                *((_WORD *)v32 + 6) = *((_WORD *)v23 + 6) + 1;
                *((_WORD *)v32 + 7) = 1;
              }
              else
              {
                v32[2] = v34;
                *((_WORD *)v32 + 6) = WORD2(v23[v21]) + 1;
                *((_WORD *)v32 + 7) = 2;
              }
            }
            else
            {
              v32[2] = v29;
              *((_WORD *)v32 + 6) = *((_WORD *)v23 + 2) + 1;
              *((_WORD *)v32 + 7) = 0;
            }
            v6 = v25;
            ++v22;
            v23 = (_QWORD *)((char *)v23 + v21 * 8);
          }
          while (v20 != v22);
        }
        ++v50;
        ++v51;
        LODWORD(v8) = v47;
      }
    }
    v36 = v9 - 1;
    v37 = v46;
    v38 = WORD2(v49[(v9 - 1 + v9 * v46)]);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_DWORD)v38)
    {
LABEL_55:
      free(v49);
      goto LABEL_6;
    }
    v39 = v9;
    v40 = 0;
    do
    {
      v41 = objc_alloc_init(TIAlignedIndexes);
      objc_msgSend(v10, "addObject:", v41);

      ++v40;
    }
    while (v40 < v38);
    v42 = v38 + 1;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndex:", v42 - 2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      v45 = HIWORD(v49[v39 * (unsigned __int16)v37 + v36]);
      if (v45 == 2)
        break;
      if (v45 == 1)
      {
        objc_msgSend(v43, "setIndex1:", (unsigned __int16)v37 - 1);
        objc_msgSend(v44, "setIndex2:", 0xFFFFLL);
        --v37;
      }
      else if (!HIWORD(v49[v39 * (unsigned __int16)v37 + v36]))
      {
        objc_msgSend(v43, "setIndex1:", (unsigned __int16)v37 - 1);
        objc_msgSend(v44, "setIndex2:", v36 - 1);
        --v37;
LABEL_53:
        --v36;
      }

      if (--v42 <= 1)
        goto LABEL_55;
    }
    objc_msgSend(v43, "setIndex1:", 0xFFFFLL);
    objc_msgSend(v44, "setIndex2:", v36 - 1);
    goto LABEL_53;
  }
LABEL_6:

  return v10;
}

uint64_t nextTokenLocationInRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;

  if (a4 < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v4 = a3 + 16 * a4;
  while (*(_QWORD *)a3 < a1)
  {
    a3 += 16;
    if (a3 >= v4)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (*(_QWORD *)a3 <= a1 + a2)
    return *(_QWORD *)a3;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

void targetKeyRangesForSourceTokens(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  void *v29;
  uint64_t v31;
  id v32;

  v32 = a1;
  v7 = a2;
  v8 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v29 = v8;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v11, v29);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");
      v16 = objc_msgSend(v13, "length");
      while (v15 < v16)
      {
        v17 = v12 + 1;
        objc_msgSend(v7, "objectAtIndex:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "appendString:", v18);

        v15 = objc_msgSend(v14, "length");
        v16 = objc_msgSend(v13, "length");
        v12 = v17;
      }
      v31 = v11;
      v19 = 0;
      v20 = 0x7FFFFFFFFFFFFFFFLL;
      if (v9 < v12)
      {
        do
        {
          objc_msgSend(v32, "objectAtIndex:", v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "index1") == v9)
          {
            v22 = v21;
          }
          else
          {
            do
            {
              objc_msgSend(v32, "objectAtIndex:", ++v10);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              v21 = v22;
            }
            while (objc_msgSend(v22, "index1") != v9);
          }
          v23 = objc_msgSend(v22, "index2");
          v24 = v19 + v20 - v23;
          if (v19 + v20 <= v23)
            v25 = v23 - v20 + 1;
          else
            v25 = v19;
          if (v23 < v20)
            v26 = v23;
          else
            v26 = v20;
          if (v23 >= v20)
            v24 = v25;
          if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            v27 = v23;
          else
            v27 = v26;
          if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            v24 = 1;
          if (v23 != 0xFFFF)
          {
            v20 = v27;
            v19 = v24;
          }

          ++v9;
        }
        while (v9 != v12);
      }
      v28 = (unint64_t *)(a5 + 16 * v31);
      *v28 = v20;
      v28[1] = v19;

      v11 = v31 + 1;
      v8 = v29;
      v9 = v12;
    }
    while (v31 + 1 < (unint64_t)objc_msgSend(v29, "count"));
  }

}

void keyRangesForTokens(void *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  id v17;

  v17 = a1;
  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");
      if (v11 < objc_msgSend(v9, "length"))
      {
        v12 = v6;
        do
        {
          v8 = v12 + 1;
          objc_msgSend(v17, "objectAtIndex:");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appendString:", v13);

          v14 = objc_msgSend(v10, "length");
          v15 = objc_msgSend(v9, "length");
          v12 = v8;
        }
        while (v14 < v15);
      }
      v16 = (_QWORD *)(a3 + 16 * v7);
      *v16 = v6;
      v16[1] = v8 - v6;

      ++v7;
      v6 = v8;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }

}

uint64_t reconcileTargetKeyRangesForSourceTokensAndTargetTokens(uint64_t result, unint64_t a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;

  v4 = (unint64_t)&a3[2 * a4];
  v5 = *(_QWORD *)(v4 - 8) + *(_QWORD *)(v4 - 16);
  if (a2)
  {
    v6 = 0;
    v7 = 0;
    v8 = (unint64_t *)(result + 16);
    v9 = a2 - 1;
    do
    {
      v10 = (unint64_t *)(result + 16 * v6);
      v11 = *v10;
      if (*v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = 0;
        *v10 = v7;
        v10[1] = 0;
        v11 = v7;
      }
      else
      {
        v12 = v10[1];
      }
      v13 = v6 + 1;
      v14 = v9;
      v15 = v8;
      v16 = v5;
      if (v6 + 1 < a2)
      {
        while (1)
        {
          v17 = *v15;
          v15 += 2;
          v16 = v17;
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
            break;
          if (!--v14)
          {
            v16 = v5;
            break;
          }
        }
      }
      v18 = v12 + v11;
      if (v11 != v7)
      {
        *v10 = v7;
        v12 = v18 - v7;
        *(_QWORD *)(result + 16 * v6 + 8) = v18 - v7;
      }
      if (v16 != v18)
      {
        v19 = a3;
        if (a4 < 1)
          goto LABEL_22;
        while (1)
        {
          v20 = *v19;
          if (*v19 >= v18)
            break;
          v19 += 2;
          if ((unint64_t)v19 >= v4)
            goto LABEL_22;
        }
        if (v20 > v16 || v20 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_22:
          v20 = v16;
        v12 = v20 - v7;
        *(_QWORD *)(result + 16 * v6 + 8) = v20 - v7;
      }
      v7 += v12;
      v8 += 2;
      --v9;
      ++v6;
    }
    while (v13 != a2);
  }
  else
  {
    v7 = 0;
  }
  if (v7 < v5)
    *(_QWORD *)(result + 16 * a2 - 8) = v5 - *(_QWORD *)(result + 16 * a2 - 16);
  return result;
}

void TITargetKeyRangesForSourceTokens(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (objc_msgSend(v14, "count"))
  {
    v16 = 0;
    v20 = xmmword_22FAC90B0;
    do
      *(_OWORD *)(a6 + 16 * v16++) = v20;
    while (v16 < objc_msgSend(v14, "count", v20));
  }
  if (objc_msgSend(v14, "count") && objc_msgSend(v15, "count"))
  {
    if (objc_msgSend(v14, "count"))
    {
      v18 = 0;
      v20 = xmmword_22FAC90B0;
      do
        *(_OWORD *)(a6 + 16 * v18++) = v20;
      while (v18 < objc_msgSend(v14, "count", v20));
    }
    targetKeyRangesForSourceTokens(v11, v12, v17, v14, a6);
    objc_msgSend(v15, "count");
    v19 = (unint64_t *)(&v20 - MEMORY[0x24BDAC7A8]());
    keyRangesForTokens(v13, v15, (uint64_t)v19);
    reconcileTargetKeyRangesForSourceTokensAndTargetTokens(a6, objc_msgSend(v14, "count"), v19, objc_msgSend(v15, "count"));
  }

}

uint64_t boundaryErrorForStrings(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length"))
    v5 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
  else
    v5 = 0;
  if (objc_msgSend(v4, "length"))
    v6 = objc_msgSend(v4, "characterAtIndex:", 0);
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "characterIsMember:", v5) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "characterIsMember:", v5) ^ 1;

  }
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "characterIsMember:", v6) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "characterIsMember:", v6) ^ 1;

  }
  return v8 & v11;
}

id alignedSourceTokensAndTargetKeys(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t *v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  void *v21;
  TIAlignedTokens *v22;
  _QWORD *v24;
  id v25;

  v5 = a1;
  v25 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    v24 = (_QWORD *)(a3 + 8);
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      v10 = (unint64_t *)(a3 + 16 * v7);
      v11 = *v10;
      v12 = &stru_24FD49B78;
      if (*v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = v6;
        v14 = a3;
        v15 = v10[1];
        v16 = v25;
        if (v15 + v11 > objc_msgSend(v25, "count"))
        {
          objc_msgSend(MEMORY[0x24BDD16A8], "string");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appendFormat:", CFSTR("WARNING! targetKeyRange [%lu, %lu] for token '%@' is out of bounds."), v11, v15 + v11, v9);
          objc_msgSend(v17, "appendFormat:", CFSTR("\nsourceTokens:\n%@"), v5);
          objc_msgSend(v17, "appendFormat:", CFSTR("\ntargetKeys:\n%@"), v25);
          objc_msgSend(v17, "appendFormat:", CFSTR("\ntargetKeyRangeForSourceTokens = "));
          if (objc_msgSend(v5, "count"))
          {
            v18 = 0;
            v19 = v24;
            do
            {
              objc_msgSend(v17, "appendFormat:", CFSTR("[%lu, %lu]"), *(v19 - 1), *v19 + *(v19 - 1));
              ++v18;
              v19 += 2;
            }
            while (v18 < objc_msgSend(v5, "count"));
          }
          NSLog(CFSTR("%@"), v17);
          v20 = objc_msgSend(v25, "count");
          if (v11 >= v20)
            v11 = v20;
          v15 = objc_msgSend(v25, "count") - v11;

          v16 = v25;
        }
        a3 = v14;
        v6 = v13;
        objc_msgSend(v16, "subarrayWithRange:", v11, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", &stru_24FD49B78);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v22 = objc_alloc_init(TIAlignedTokens);
      -[TIAlignedTokens setSource:](v22, "setSource:", v9);
      -[TIAlignedTokens setTarget:](v22, "setTarget:", v12);
      objc_msgSend(v6, "addObject:", v22);

      ++v7;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }

  return v6;
}

id TITokenAlignmentForKeyAlignment(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  TIAlignedTokens *v17;
  void *v18;
  TIAlignedTokens **v19;
  uint64_t v21;
  TIAlignedTokens *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!objc_msgSend(v12, "count"))
  {
    objc_msgSend(v11, "componentsJoinedByString:", &stru_24FD49B78);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(TIAlignedTokens);
    -[TIAlignedTokens setSource:](v17, "setSource:", &stru_24FD49B78);
    -[TIAlignedTokens setTarget:](v17, "setTarget:", v16);
    v23[0] = v17;
    v18 = (void *)MEMORY[0x24BDBCE30];
    v19 = (TIAlignedTokens **)v23;
LABEL_6:
    objc_msgSend(v18, "arrayWithObjects:count:", v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(v10, "componentsJoinedByString:", &stru_24FD49B78);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(TIAlignedTokens);
    -[TIAlignedTokens setSource:](v17, "setSource:", v16);
    -[TIAlignedTokens setTarget:](v17, "setTarget:", &stru_24FD49B78);
    v22 = v17;
    v18 = (void *)MEMORY[0x24BDBCE30];
    v19 = &v22;
    goto LABEL_6;
  }
  objc_msgSend(v12, "count");
  v14 = &v21 - 2 * MEMORY[0x24BDAC7A8]();
  TITargetKeyRangesForSourceTokens(v9, v10, v11, v12, v13, (uint64_t)v14);
  alignedSourceTokensAndTargetKeys(v12, v11, (uint64_t)v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v15;
}

id TICharSequenceForTokenSequence(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = (void *)MEMORY[0x24BDBCEB8];
  v2 = a1;
  objc_msgSend(v1, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __TICharSequenceForTokenSequence_block_invoke;
  v6[3] = &unk_24FD48698;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

id TIAlignedTypingSequenceForAlignedTokenSequence(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  TIAlignedTyping *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  id v37;
  id v38;
  id v39;
  id v40;

  v11 = a1;
  v12 = a2;
  v40 = a3;
  v39 = a4;
  v38 = a5;
  v37 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v14 = 0;
    v15 = 0;
    while (1)
    {
      objc_msgSend(v11, "objectAtIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "source");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "length"))
        break;
      v18 = objc_msgSend(v12, "count");

      if (v15 >= v18)
        goto LABEL_7;
      v19 = objc_alloc_init(TIAlignedTyping);
      objc_msgSend(v16, "source");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTokens setSource:](v19, "setSource:", v20);

      objc_msgSend(v40, "objectAtIndex:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTyping setTouched:](v19, "setTouched:", v21);

      objc_msgSend(v39, "objectAtIndex:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTyping setPredicted:](v19, "setPredicted:", v22);

      objc_msgSend(v38, "objectAtIndex:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTyping setInlineCompletions:](v19, "setInlineCompletions:", v23);

      objc_msgSend(v37, "objectAtIndex:", v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTyping setDocumentStates:](v19, "setDocumentStates:", v24);

      objc_msgSend(v12, "objectAtIndex:", v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTyping setInserted:](v19, "setInserted:", v25);

      objc_msgSend(v16, "target");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTokens setTarget:](v19, "setTarget:", v26);

      objc_msgSend(v13, "addObject:", v19);
      ++v15;
LABEL_8:

      if (++v14 >= (unint64_t)objc_msgSend(v11, "count"))
        goto LABEL_11;
    }

LABEL_7:
    v19 = objc_alloc_init(TIAlignedTyping);
    objc_msgSend(v16, "source");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAlignedTokens setSource:](v19, "setSource:", v27);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAlignedTyping setTouched:](v19, "setTouched:", v28);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAlignedTyping setDocumentStates:](v19, "setDocumentStates:", v29);

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAlignedTyping setInserted:](v19, "setInserted:", v30);

    objc_msgSend(v16, "target");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIAlignedTokens setTarget:](v19, "setTarget:", v31);

    objc_msgSend(v13, "addObject:", v19);
    goto LABEL_8;
  }
  v15 = 0;
LABEL_11:
  if (v15 == objc_msgSend(v12, "count")
    || v15 == objc_msgSend(v12, "count") - 1
    && (objc_msgSend(v12, "objectAtIndex:", v15),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v32, "componentsJoinedByString:", &stru_24FD49B78),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v34 = objc_msgSend(v33, "isEqualToString:", &stru_24FD49B78),
        v33,
        v32,
        v34))
  {
    v35 = v13;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

id TIConcatenateAlignedTypingAtBoundaryErrors(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TIAlignedTyping *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  TIAlignedTyping *v27;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v1;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        v9 = v2;
        if (*(_QWORD *)v35 != v31)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v10, "target");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = boundaryErrorForStrings(v7, v11);

        if (v12)
        {
          objc_msgSend(v10, "source");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v9;
          objc_msgSend(v9, "appendString:", v13);

          objc_msgSend(v10, "touched");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObjectsFromArray:", v14);

          objc_msgSend(v10, "predicted");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v15);

          objc_msgSend(v10, "inlineCompletions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v16);

          objc_msgSend(v10, "documentStates");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v17);

          objc_msgSend(v10, "inserted");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v18);

          objc_msgSend(v10, "target");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v19);
        }
        else
        {
          v2 = v9;
          if (objc_msgSend(v9, "length") || objc_msgSend(v6, "count") || objc_msgSend(v7, "length"))
          {
            v20 = objc_alloc_init(TIAlignedTyping);
            -[TIAlignedTokens setSource:](v20, "setSource:", v9);
            -[TIAlignedTyping setTouched:](v20, "setTouched:", v33);
            -[TIAlignedTyping setPredicted:](v20, "setPredicted:", v3);
            -[TIAlignedTyping setInlineCompletions:](v20, "setInlineCompletions:", v4);
            -[TIAlignedTyping setDocumentStates:](v20, "setDocumentStates:", v5);
            -[TIAlignedTyping setInserted:](v20, "setInserted:", v6);
            -[TIAlignedTokens setTarget:](v20, "setTarget:", v7);
            objc_msgSend(v29, "addObject:", v20);

          }
          objc_msgSend(v10, "source");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setString:", v21);

          objc_msgSend(v33, "removeAllObjects");
          objc_msgSend(v10, "touched");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addObjectsFromArray:", v22);

          objc_msgSend(v3, "removeAllObjects");
          objc_msgSend(v10, "predicted");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v23);

          objc_msgSend(v4, "removeAllObjects");
          objc_msgSend(v10, "inlineCompletions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v24);

          objc_msgSend(v5, "removeAllObjects");
          objc_msgSend(v10, "documentStates");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v25);

          objc_msgSend(v6, "removeAllObjects");
          objc_msgSend(v10, "inserted");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v26);

          objc_msgSend(v10, "target");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setString:", v19);
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v2, "length") || objc_msgSend(v6, "count") || objc_msgSend(v7, "length"))
  {
    v27 = objc_alloc_init(TIAlignedTyping);
    -[TIAlignedTokens setSource:](v27, "setSource:", v2);
    -[TIAlignedTyping setTouched:](v27, "setTouched:", v33);
    -[TIAlignedTyping setPredicted:](v27, "setPredicted:", v3);
    -[TIAlignedTyping setInlineCompletions:](v27, "setInlineCompletions:", v4);
    -[TIAlignedTyping setDocumentStates:](v27, "setDocumentStates:", v5);
    -[TIAlignedTyping setInserted:](v27, "setInserted:", v6);
    -[TIAlignedTokens setTarget:](v27, "setTarget:", v7);
    objc_msgSend(v29, "addObject:", v27);

  }
  return v29;
}

uint64_t plistFormattedString(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
}

id plistFormattedTouchSequence(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = (void *)MEMORY[0x24BDBCEB8];
  v2 = a1;
  objc_msgSend(v1, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __plistFormattedTouchSequence_block_invoke;
  v6[3] = &unk_24FD48698;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  return v4;
}

void __plistFormattedTouchSequence_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

id plistFormattedPredictionSequence(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id plistFormattedInlineCompletionsSequence(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

const __CFString *TIAutocorrectionTypeForNonAutocorrectedAlignmentEntry(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_msgSend(v6, "isEqualToString:", v7);
  v9 = objc_msgSend(v5, "isEqualToString:", v7);

  v10 = objc_msgSend(v5, "isEqualToString:", v6);
  v11 = objc_msgSend(v6, "containsString:", CFSTR("\\b"));

  v12 = v9 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && !v12)
    return CFSTR("RightInput_NoAutocorrection");
  if (((v8 | v12) & 1) != 0)
  {
    v14 = CFSTR("WrongInput_NoAutocorrection_NoManualCorrection");
    if (v11)
      v14 = CFSTR("WrongInput_NoAutocorrection_WrongManualCorrection");
    if (v8 | v9)
      v15 = CFSTR("UnknownType");
    else
      v15 = v14;
    v16 = CFSTR("RightInput_NoAutocorrection_WrongManualCorrection");
    if (v10)
      v16 = CFSTR("UnknownType");
    if (v11)
      v16 = CFSTR("RightInput_NoAutocorrection_But_WrongResult");
    if (((v8 ^ 1 | v9) & 1) != 0)
      return v15;
    else
      return v16;
  }
  else if (v11)
  {
    return CFSTR("WrongInput_NoAutocorrection_RightManualCorrection");
  }
  else
  {
    return CFSTR("WrongInput_NoAutocorrection_NoManualCorrection");
  }
}

const __CFString *TIAutocorrectionTypeForAutocorrectedAlignmentEntry(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = objc_msgSend(v6, "isEqualToString:", v7);
  v9 = objc_msgSend(v5, "isEqualToString:", v7);

  v10 = objc_msgSend(v5, "isEqualToString:", v6);
  v11 = objc_msgSend(v6, "containsString:", CFSTR("\\b"));

  v12 = v9 ^ 1;
  if (((v8 ^ 1) & 1) == 0 && !v12)
    return CFSTR("RightInput_NoAutocorrection");
  if (((v8 | v12) & 1) != 0)
  {
    v14 = CFSTR("UnknownType");
    v15 = CFSTR("WrongInput_WrongAutocorrection");
    if (v10)
      v15 = CFSTR("WrongInput_NoAutocorrection");
    if (v11)
      v15 = CFSTR("WrongInput_WrongManualCorrection");
    if (((v8 | v9) & 1) != 0)
      v16 = CFSTR("UnknownType");
    else
      v16 = v15;
    if (!v10)
      v14 = CFSTR("RightInput_WrongAutocorrection");
    if (v11)
      v14 = CFSTR("RightInput_WrongAutocorrection_WrongManualCorrection");
    if (((v8 ^ 1 | v9) & 1) != 0)
      return v16;
    else
      return v14;
  }
  else if (v11)
  {
    return CFSTR("WrongInput_WrongAutocorrection_RightManualCorrection");
  }
  else
  {
    return CFSTR("WrongInput_RightAutocorrection");
  }
}

uint64_t TIAutoCorrectionTypeCorrectedIsNotIntended(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("RightInput_WrongAutocorrection");
  v6[1] = CFSTR("RightInput_WrongAutocorrection_WrongManualCorrection");
  v6[2] = CFSTR("WrongInput_NoAutocorrection");
  v6[3] = CFSTR("WrongInput_WrongAutocorrection");
  v6[4] = CFSTR("WrongInput_WrongManualCorrection");
  v6[5] = CFSTR("WrongInput_WrongAutocorrection_RightManualCorrection");
  v1 = (void *)MEMORY[0x24BDBCE30];
  v2 = a1;
  objc_msgSend(v1, "arrayWithObjects:count:", v6, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2);

  return v4;
}

uint64_t TIAutoCorrectionTypeCorrectedIsNotIntendedAndInserted(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("RightInput_WrongAutocorrection");
  v6[1] = CFSTR("WrongInput_WrongAutocorrection");
  v6[2] = CFSTR("RightInput_WrongAutocorrection_WrongManualCorrection");
  v6[3] = CFSTR("WrongInput_WrongAutocorrection_RightManualCorrection");
  v1 = (void *)MEMORY[0x24BDBCE30];
  v2 = a1;
  objc_msgSend(v1, "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2);

  return v4;
}

uint64_t TIAutoCorrectionTypeCorrectedIsNotInserted(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("WrongInput_RightAutocorrection");
  v7 = CFSTR("RightInput_WrongAutocorrection");
  v8 = CFSTR("WrongInput_WrongAutocorrection");
  v9 = CFSTR("RightInput_WrongAutocorrection_WrongManualCorrection");
  v10 = CFSTR("WrongInput_WrongAutocorrection_RightManualCorrection");
  v1 = (void *)MEMORY[0x24BDBCE30];
  v2 = a1;
  objc_msgSend(v1, "arrayWithObjects:count:", &v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2, v6, v7, v8, v9, v10, v11);

  return v4;
}

id TIPlistFormattedAlignedTypingSequence(void *a1, char a2, char a3, char a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  char v17;
  char v18;
  char v19;

  v7 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __TIPlistFormattedAlignedTypingSequence_block_invoke;
  v14[3] = &unk_24FD48518;
  v15 = v7;
  v17 = a3;
  v18 = a2;
  v19 = a4;
  v9 = v8;
  v16 = v9;
  v10 = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

void sub_22FA63680(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA637B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_22FA63C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_22FA63DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)TITransientLexiconManagerMock;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_22FA63E90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA63FCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22FA64068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22FA641E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FA64264(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA642C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA64970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  char *v31;
  uint64_t v32;
  uint64_t v33;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>>>::operator()[abi:nn180100](1, v31);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v32);
  KB::String::~String((KB::String *)&a13);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a11);
  KB::String::~String((KB::String *)&a31);
  KB::String::~String((KB::String *)(v33 - 160));

  KB::String::~String((KB::String *)(v33 - 128));
  _Unwind_Resume(a1);
}

void sub_22FA650E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, char a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  char *v31;
  uint64_t v32;
  uint64_t v33;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>>>::operator()[abi:nn180100](1, v31);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v32);
  KB::String::~String((KB::String *)&a13);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a11);
  KB::String::~String((KB::String *)&a31);
  KB::String::~String((KB::String *)(v33 - 160));

  KB::String::~String((KB::String *)(v33 - 128));
  _Unwind_Resume(a1);
}

void sub_22FA652F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>(_QWORD *a1, _QWORD *a2)
{
  KB::String *v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;

  if (a2[1])
    v4 = (KB::String *)a2[1];
  else
    v4 = (KB::String *)(a2 + 2);
  v5 = KB::String::hash(v4, (const char *)*(unsigned __int16 *)a2);
  v6 = a1[1];
  if (!v6)
    return 0;
  v7 = v5;
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v8.i16[0] = vaddlv_u8(v8);
  v9 = v8.u32[0];
  if (v8.u32[0] > 1uLL)
  {
    v10 = v5;
    if (v6 <= v5)
      v10 = v5 % v6;
  }
  else
  {
    v10 = ((_DWORD)v6 - 1) & v5;
  }
  v11 = *(_QWORD **)(*a1 + 8 * v10);
  if (!v11)
    return 0;
  v12 = (_QWORD *)*v11;
  if (*v11)
  {
    do
    {
      v13 = v12[1];
      if (v13 == v7)
      {
        if (v12 + 2 == a2 || (KB::String::equal((KB::String *)(v12 + 2), (const KB::String *)a2) & 1) != 0)
          return v12;
      }
      else
      {
        if (v9 > 1)
        {
          if (v13 >= v6)
            v13 %= v6;
        }
        else
        {
          v13 &= v6 - 1;
        }
        if (v13 != v10)
          return 0;
      }
      v12 = (_QWORD *)*v12;
    }
    while (v12);
  }
  return v12;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>>>::operator()[abi:nn180100](char a1, char *__p)
{
  if (a1)
  {
    std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)(__p + 48));
    KB::String::~String((KB::String *)(__p + 16));
  }
  if (__p)
    operator delete(__p);
}

uint64_t LexiconLibrary(void)
{
  uint64_t v0;
  void *v2;

  if (LexiconLibraryCore(char **)::frameworkLibrary)
    return LexiconLibraryCore(char **)::frameworkLibrary;
  LexiconLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v0 = LexiconLibraryCore(char **)::frameworkLibrary;
  if (!LexiconLibraryCore(char **)::frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

id getkLXLexiconNameKey(void)
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkLXLexiconNameKeySymbolLoc(void)::ptr;
  v7 = getkLXLexiconNameKeySymbolLoc(void)::ptr;
  if (!getkLXLexiconNameKeySymbolLoc(void)::ptr)
  {
    v1 = (void *)LexiconLibrary();
    v0 = (id *)dlsym(v1, "kLXLexiconNameKey");
    v5[3] = (uint64_t)v0;
    getkLXLexiconNameKeySymbolLoc(void)::ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkLXLexiconLocaleKey(void)
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkLXLexiconLocaleKeySymbolLoc(void)::ptr;
  v7 = getkLXLexiconLocaleKeySymbolLoc(void)::ptr;
  if (!getkLXLexiconLocaleKeySymbolLoc(void)::ptr)
  {
    v1 = (void *)LexiconLibrary();
    v0 = (id *)dlsym(v1, "kLXLexiconLocaleKey");
    v5[3] = (uint64_t)v0;
    getkLXLexiconLocaleKeySymbolLoc(void)::ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t __LXLexiconCreateTransient(const __CFDictionary *a1, __CFError **a2)
{
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getLXLexiconCreateTransientSymbolLoc(void)::ptr;
  v11 = getLXLexiconCreateTransientSymbolLoc(void)::ptr;
  if (!getLXLexiconCreateTransientSymbolLoc(void)::ptr)
  {
    v5 = (void *)LexiconLibrary();
    v4 = dlsym(v5, "LXLexiconCreateTransient");
    v9[3] = (uint64_t)v4;
    getLXLexiconCreateTransientSymbolLoc(void)::ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    dlerror();
    v7 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return ((uint64_t (*)(const __CFDictionary *, __CFError **))v4)(a1, a2);
}

void sub_22FA65A94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  _Unwind_Resume(a1);
}

void sub_22FA65BBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _TIBeginMockingTransientLexiconManagerWithData(void *a1, void *a2)
{
  id v3;
  Class v4;
  TITransientLexiconManagerMock *v5;
  void *v6;
  id v7;

  v7 = a1;
  v3 = a2;
  if ((__missingTransientLexiconManager & 1) == 0)
  {
    v4 = NSClassFromString(CFSTR("TITransientLexiconManager"));
    if (v4)
    {
      v5 = -[TITransientLexiconManagerMock initWithTransientData:namedEntities:]([TITransientLexiconManagerMock alloc], "initWithTransientData:namedEntities:", v7, v3);
      v6 = (void *)__transientLexiconManagerMock;
      __transientLexiconManagerMock = (uint64_t)v5;

      -[objc_class setSharedTITransientLexiconManager:](v4, "setSharedTITransientLexiconManager:", __transientLexiconManagerMock);
    }
    else
    {
      __missingTransientLexiconManager = 1;
    }
  }

}

void sub_22FA65C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t _TISetNewContactCollectionForMockingTransientLexiconManager(uint64_t a1)
{
  return objc_msgSend((id)__transientLexiconManagerMock, "setNewContactCollection:", a1);
}

void _TIEndMockingTransientLexiconManager()
{
  void *v0;

  if ((__missingTransientLexiconManager & 1) == 0)
  {
    -[objc_class setSharedTITransientLexiconManager:](NSClassFromString(CFSTR("TITransientLexiconManager")), "setSharedTITransientLexiconManager:", 0);
    v0 = (void *)__transientLexiconManagerMock;
    __transientLexiconManagerMock = 0;

  }
}

id _TIConvertTIMockContactCollection(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v16;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v19;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v19 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v4);
        v6 = objc_alloc(MEMORY[0x24BE51D10]);
        objc_msgSend(v5, "firstName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "middleName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "nickName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "relevancyScore");
        v12 = (void *)objc_msgSend(v6, "initWithFirstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relations:streets:cities:score:", v7, 0, v8, 0, v9, 0, v11, 0, 0, v10, 0, 0, 0);

        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "setObject:forKey:", v12, v14);

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v2);
  }

  return v1;
}

void sub_22FA65EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t _TIMockingTransientLexiconManagerOfferedCount()
{
  return objc_msgSend((id)__transientLexiconManagerMock, "offeredCount");
}

uint64_t _TIMockingTransientLexiconManagerAcceptedCount()
{
  return objc_msgSend((id)__transientLexiconManagerMock, "acceptedCount");
}

void sub_22FA67774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__675(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__676(uint64_t a1)
{

}

void sub_22FA68898(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v2;
  MEMORY[0x2348A8A24](v3, 0x1020C40FAF5D19FLL);

  _Unwind_Resume(a1);
}

void sub_22FA68A5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348A8A24](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_22FA68B74(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348A8A24](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_22FA68C98(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348A8A24](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_22FA68DC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348A8A24](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_22FA68ED4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348A8A24](v1, 0x1020C40FAF5D19FLL);
  _Unwind_Resume(a1);
}

void sub_22FA690C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,_QWORD *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,_QWORD *a32)
{
  uint64_t v32;

  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(a27);
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(a32);
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(*(_QWORD **)(v32 - 112));
  _Unwind_Resume(a1);
}

void sub_22FA6924C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, _QWORD *a12)
{
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(a12);
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void sub_22FA6941C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_22FA69A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,void *a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,void *a37,void *a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,void *a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *a56,void *a57,void *a58,void *a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a65;
  char a67;
  id a72;
  void *v72;
  uint64_t v73;

  _Block_object_dispose(&a67, 8);
  _Block_object_dispose((const void *)(v73 - 184), 8);

  _Unwind_Resume(a1);
}

void sub_22FA69C80()
{
  JUMPOUT(0x22FA69C08);
}

void sub_22FA69C88()
{
  JUMPOUT(0x22FA69C68);
}

void sub_22FA69C94()
{
  void *v0;

  JUMPOUT(0x22FA69C70);
}

void sub_22FA69CA4()
{
  JUMPOUT(0x22FA69C70);
}

void sub_22FA69D8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__750(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_22FA69FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{

}

void sub_22FA6A084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_22FA6A650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33,char a34)
{
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);

  _Unwind_Resume(a1);
}

void sub_22FA6A7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22FA6ADEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void sub_22FA6B0B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_22FA6B2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__75(uint64_t a1, uint64_t a2)
{
  TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)(a1 + 48), (const TIFitAffineMLLMatrix *)(a2 + 48));
}

void __Block_byref_object_dispose__76(uint64_t a1)
{
  std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(*(_QWORD **)(a1 + 72));
}

void sub_22FA6B480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void sub_22FA6B538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22FA6B610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22FA6B6B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id TITestTyperTokensForString(void *a1, void *a2)
{
  __CFString *v3;
  const __CFLocale *v4;
  void *v5;
  const __CFAllocator *v6;
  __CFStringTokenizer *v7;
  unint64_t v8;
  CFRange CurrentTokenRange;
  uint64_t v10;
  CFIndex v11;
  uint64_t v12;
  CFIndex v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  CFRange v21;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v3, "length"))
  {
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v21.length = -[__CFString length](v3, "length");
    v21.location = 0;
    v7 = CFStringTokenizerCreate(v6, v3, v21, 4uLL, v4);
    v8 = 0;
    while (CFStringTokenizerAdvanceToNextToken(v7))
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v7);
      while (v8 < CurrentTokenRange.location)
      {
        v10 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v3, "rangeOfComposedCharacterSequenceAtIndex:", v8);
        v12 = v10;
        if ((unint64_t)(v10 + v11) <= CurrentTokenRange.location)
          v13 = v11;
        else
          v13 = CurrentTokenRange.location - v10;
        -[__CFString substringWithRange:](v3, "substringWithRange:", v10, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);
        v8 = v13 + v12;

      }
      -[__CFString substringWithRange:](v3, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v15);
      v8 = CurrentTokenRange.location + CurrentTokenRange.length;

    }
    while (v8 < -[__CFString length](v3, "length"))
    {
      v16 = -[__CFString rangeOfComposedCharacterSequenceAtIndex:](v3, "rangeOfComposedCharacterSequenceAtIndex:", v8);
      v18 = v17;
      -[__CFString substringWithRange:](v3, "substringWithRange:", v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v19);
      v8 = v16 + v18;

    }
    CFRelease(v7);
  }

  return v5;
}

uint64_t TITestTyperWritePropertyListToFile(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v22);
  v8 = v22;

  if (!v7)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDD0CF0];
  v24[0] = *MEMORY[0x24BDD0CF8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "createFileAtPath:contents:attributes:", v10, v11, v12);

  if (!v13)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDBCF08], "outputStreamWithURL:append:", v4, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "open");
  objc_msgSend(v14, "streamError");
  v15 = objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = 0;
    v8 = (id)v15;
  }
  else
  {
    v21 = 0;
    v17 = objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v3, v14, 0, &v21);
    v8 = v21;
    v16 = v17 != 0;
  }
  objc_msgSend(v14, "close");

  if (v16 && !v8)
  {
    v18 = 1;
  }
  else
  {
LABEL_9:
    objc_msgSend(v4, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error serializing and writing property list %@, error: %@"), v19, v8);

    v18 = 0;
  }

  return v18;
}

uint64_t TI::CP::ContinuousPathTestCase::ContinuousPathTestCase(uint64_t a1, unsigned int **a2, const std::vector<unsigned int> *a3, uint64_t a4, const KB::LanguageModelContext *a5, uint64_t a6)
{
  unsigned int *v10;
  unsigned int v11;

  v10 = *a2;
  *(_QWORD *)a1 = *a2;
  if (v10)
  {
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 + 1, v10));
  }
  TI::CP::Path::Path((std::vector<unsigned int> *)(a1 + 8), a3);
  MEMORY[0x2348A87C0](a1 + 56, a4);
  KB::LanguageModelContext::LanguageModelContext((KB::LanguageModelContext *)(a1 + 88), a5);
  MEMORY[0x2348A87C0](a1 + 192, a6);
  return a1;
}

void sub_22FA6CAE4(_Unwind_Exception *a1)
{
  unsigned int **v1;
  TI::CP::Path *v2;
  KB::String *v3;
  KB::LanguageModelContext *v4;

  KB::LanguageModelContext::~LanguageModelContext(v4);
  KB::String::~String(v3);
  TI::CP::Path::~Path(v2);
  if (*v1)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(*v1);
  _Unwind_Resume(a1);
}

std::vector<unsigned int> *TI::CP::Path::Path(std::vector<unsigned int> *this, const std::vector<unsigned int> *a2)
{
  unsigned int *end;
  std::vector<unsigned int>::pointer begin;
  int64_t v6;
  std::vector<unsigned int>::pointer v7;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  begin = a2->__begin_;
  end = a2->__end_;
  v6 = (char *)end - (char *)a2->__begin_;
  if (end != a2->__begin_)
  {
    std::vector<TI::CP::PathSample>::__vallocate[abi:nn180100](this, 0xAAAAAAAAAAAAAAABLL * (v6 >> 4));
    v7 = this->__end_;
    memmove(v7, begin, v6);
    this->__end_ = (std::vector<unsigned int>::pointer)((char *)v7 + v6);
  }
  std::vector<unsigned int>::vector(this + 1, a2 + 1);
  return this;
}

void sub_22FA6CBB4(_Unwind_Exception *exception_object)
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

KB::LanguageModelContext *KB::LanguageModelContext::LanguageModelContext(KB::LanguageModelContext *this, const KB::LanguageModelContext *a2)
{
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  int64_t v9;
  char *v10;
  __int128 v11;
  __int128 *v12;
  __int128 *v13;

  v4 = *((_QWORD *)a2 + 1);
  *(_QWORD *)this = *(_QWORD *)a2;
  *((_QWORD *)this + 1) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  v8 = (_BYTE *)*((_QWORD *)a2 + 2);
  v7 = (_BYTE *)*((_QWORD *)a2 + 3);
  v9 = v7 - v8;
  if (v7 != v8)
  {
    std::vector<TITokenID>::__vallocate[abi:nn180100]((_QWORD *)this + 2, v9 >> 3);
    v10 = (char *)*((_QWORD *)this + 3);
    memmove(v10, v8, v9);
    *((_QWORD *)this + 3) = &v10[8 * (v9 >> 3)];
  }
  v11 = *(_OWORD *)((char *)a2 + 40);
  *((_QWORD *)this + 7) = *((_QWORD *)a2 + 7);
  *(_OWORD *)((char *)this + 40) = v11;
  language_modeling::v1::LinguisticContext::LinguisticContext();
  language_modeling::v1::LinguisticContext::LinguisticContext();
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  v13 = (__int128 *)*((_QWORD *)a2 + 10);
  v12 = (__int128 *)*((_QWORD *)a2 + 11);
  if (v12 != v13)
  {
    std::vector<std::string>::__vallocate[abi:nn180100]((_QWORD *)this + 10, 0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)v13) >> 3));
    *((_QWORD *)this + 11) = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(v13, v12, *((std::string **)this + 11));
  }
  return this;
}

void sub_22FA6CCE4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  language_modeling::v1::LinguisticContext *v3;
  language_modeling::v1::LinguisticContext *v4;
  uint64_t v5;
  void *v7;

  *(_QWORD *)(v1 + 88) = v5;
  language_modeling::v1::LinguisticContext::~LinguisticContext(v4);
  language_modeling::v1::LinguisticContext::~LinguisticContext(v3);
  v7 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 24) = v7;
    operator delete(v7);
  }
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

void TI::CP::Path::~Path(TI::CP::Path *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
  v3 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v3;
    operator delete(v3);
  }
}

unsigned int *WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(unsigned int *result)
{
  unsigned int *v1;
  unsigned int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;

  v1 = result;
  v2 = atomic_load(result);
  if (v2 == 1)
  {
    KB::String::~String((KB::String *)(result + 52));
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(*((_QWORD **)v1 + 23));
    std::__tree<std::__value_type<unsigned long,double>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,double>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,double>>>::destroy(*((_QWORD **)v1 + 20));
    v3 = (_QWORD *)*((_QWORD *)v1 + 11);
    while (v3)
    {
      v4 = v3;
      v3 = (_QWORD *)*v3;
      v5 = v4[4];
      if (v5)
        WTF::RefCounted<TI::Favonius::Key>::deref(v5);
      if (*((unsigned __int16 *)v4 + 8) >= 0xFu)
      {
        v6 = v4[3];
        if (v6)
          MEMORY[0x2348A8A0C](v6, 0x1000C8077774924);
      }
      operator delete(v4);
    }
    v7 = (void *)*((_QWORD *)v1 + 9);
    *((_QWORD *)v1 + 9) = 0;
    if (v7)
      operator delete(v7);
    v8 = (_QWORD *)*((_QWORD *)v1 + 6);
    if (v8)
    {
      do
      {
        v9 = (_QWORD *)*v8;
        v10 = v8[3];
        if (v10)
          WTF::RefCounted<TI::Favonius::Key>::deref(v10);
        operator delete(v8);
        v8 = v9;
      }
      while (v9);
    }
    v11 = (void *)*((_QWORD *)v1 + 4);
    *((_QWORD *)v1 + 4) = 0;
    if (v11)
      operator delete(v11);
    v12 = *((_QWORD *)v1 + 1);
    if (v12)
    {
      v13 = *((_QWORD *)v1 + 2);
      v14 = (void *)*((_QWORD *)v1 + 1);
      if (v13 != v12)
      {
        do
        {
          v16 = *(_QWORD *)(v13 - 8);
          v13 -= 8;
          v15 = v16;
          if (v16)
            WTF::RefCounted<TI::Favonius::Key>::deref(v15);
        }
        while (v13 != v12);
        v14 = (void *)*((_QWORD *)v1 + 1);
      }
      *((_QWORD *)v1 + 2) = v12;
      operator delete(v14);
    }
    JUMPOUT(0x2348A8A24);
  }
  do
    v17 = __ldaxr(result);
  while (__stlxr(v17 - 1, result));
  return result;
}

uint64_t WTF::RefCounted<TI::Favonius::Key>::deref(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  unsigned int v4;

  v1 = result;
  v2 = atomic_load((unsigned int *)result);
  if (v2 == 1)
  {
    if (*(unsigned __int16 *)(result + 40) >= 0xFu)
    {
      v3 = *(_QWORD *)(result + 48);
      if (v3)
        MEMORY[0x2348A8A0C](v3, 0x1000C8077774924);
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x2348A8A24);
  }
  do
    v4 = __ldaxr((unsigned int *)result);
  while (__stlxr(v4 - 1, (unsigned int *)result));
  return result;
}

char *std::vector<std::string>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(__int128 *a1, __int128 *a2, std::string *this)
{
  __int128 *v5;
  __int128 v6;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
      }
      else
      {
        v6 = *v5;
        this->__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
        *(_OWORD *)&this->__r_.__value_.__l.__data_ = v6;
      }
      v5 = (__int128 *)((char *)v5 + 24);
      ++this;
    }
    while (v5 != a2);
  }
  return this;
}

char *std::vector<TITokenID>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;

  if (a2 >> 61)
    abort();
  result = (char *)operator new(8 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * a2];
  return result;
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, const std::vector<unsigned int> *__x)
{
  unsigned int *end;
  std::vector<unsigned int>::pointer begin;
  int64_t v5;
  std::vector<unsigned int>::pointer v6;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  begin = __x->__begin_;
  end = __x->__end_;
  v5 = (char *)end - (char *)__x->__begin_;
  if (end != __x->__begin_)
  {
    std::vector<unsigned int>::__vallocate[abi:nn180100](this, v5 >> 2);
    v6 = this->__end_;
    memmove(v6, begin, v5);
    this->__end_ = (std::vector<unsigned int>::pointer)((char *)v6 + v5);
  }
  return this;
}

char *std::vector<unsigned int>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(4 * a1);
}

char *std::vector<TI::CP::PathSample>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  uint64_t v3;
  char *result;

  if (a2 >= 0x555555555555556)
    abort();
  v3 = 3 * a2;
  result = (char *)operator new(48 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v3];
  return result;
}

TI::CP::ContinuousPathTestResult *TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(TI::CP::ContinuousPathTestResult *this, int a2, const KB::String *a3, const KB::CandidateCollection *a4, int a5, char a6)
{
  KB::CandidateCollection *v10;

  *(_DWORD *)this = a2;
  v10 = (TI::CP::ContinuousPathTestResult *)((char *)this + 40);
  MEMORY[0x2348A87C0]((char *)this + 8, a3);
  KB::CandidateCollection::CandidateCollection(v10, a4);
  *((_DWORD *)this + 36) = a5;
  *((_QWORD *)this + 24) = 0;
  *((_QWORD *)this + 23) = 0;
  *((_QWORD *)this + 22) = (char *)this + 184;
  *(int64x2_t *)((char *)this + 200) = vdupq_n_s64(0xFFF0000000000000);
  *((_BYTE *)this + 216) = a6;
  *(_DWORD *)((char *)this + 217) = 0;
  return this;
}

void sub_22FA6D1E8(_Unwind_Exception *a1)
{
  KB::String *v1;

  KB::String::~String(v1);
  _Unwind_Resume(a1);
}

KB::CandidateCollection *KB::CandidateCollection::CandidateCollection(KB::CandidateCollection *this, const KB::CandidateCollection *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  v4 = *(_QWORD *)a2;
  v5 = *((_QWORD *)a2 + 1);
  if (v5 != *(_QWORD *)a2)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100](this, 0x1CAC083126E978D5 * ((v5 - *(_QWORD *)a2) >> 3));
    std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>(this, v4, v5);
  }
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  v6 = *((_QWORD *)a2 + 3);
  v7 = *((_QWORD *)a2 + 4);
  if (v7 != v6)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100]((_QWORD *)this + 3, 0x1CAC083126E978D5 * ((v7 - v6) >> 3));
    std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>((KB::CandidateCollection *)((char *)this + 24), v6, v7);
  }
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  v8 = *((_QWORD *)a2 + 6);
  v9 = *((_QWORD *)a2 + 7);
  if (v9 != v8)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100]((_QWORD *)this + 6, 0x1CAC083126E978D5 * ((v9 - v8) >> 3));
    std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>((KB::CandidateCollection *)((char *)this + 48), v8, v9);
  }
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  v10 = *((_QWORD *)a2 + 9);
  v11 = *((_QWORD *)a2 + 10);
  if (v11 != v10)
  {
    std::vector<KB::Candidate>::__vallocate[abi:nn180100]((_QWORD *)this + 9, 0x1CAC083126E978D5 * ((v11 - v10) >> 3));
    std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>((KB::CandidateCollection *)((char *)this + 72), v10, v11);
  }
  *((_QWORD *)this + 12) = *((_QWORD *)a2 + 12);
  return this;
}

void sub_22FA6D364(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  _Unwind_Resume(a1);
}

void std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](void ***a1)
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
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = MEMORY[0x2348A8820](v4 - 1000);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *std::vector<KB::Candidate>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  uint64_t v3;
  char *result;

  if (a2 >= 0x4189374BC6A7F0)
    abort();
  v3 = 1000 * a2;
  result = (char *)operator new(1000 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[v3];
  return result;
}

KB::Candidate *std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>(KB::Candidate *result, uint64_t a2, uint64_t a3)
{
  KB::Candidate *v3;
  uint64_t v4;
  uint64_t v7;

  v3 = result;
  v4 = *((_QWORD *)result + 1);
  if (a2 != a3)
  {
    v7 = 0;
    do
    {
      result = KB::Candidate::Candidate((KB::Candidate *)(v4 + v7), (const KB::Candidate *)(a2 + v7));
      v7 += 1000;
    }
    while (a2 + v7 != a3);
    v4 += v7;
  }
  *((_QWORD *)v3 + 1) = v4;
  return result;
}

void sub_22FA6D4D0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

KB::Candidate *KB::Candidate::Candidate(KB::Candidate *this, const KB::Candidate *a2)
{
  uint64_t v4;
  unint64_t v5;
  KB::Word *v6;
  const KB::Word *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  const void *v12;
  const void *v13;

  v4 = *(_QWORD *)a2;
  *((_QWORD *)this + 1) = (char *)this + 24;
  *(_QWORD *)this = v4;
  v5 = *((_QWORD *)a2 + 2);
  *((_QWORD *)this + 2) = 3;
  v6 = (KB::Candidate *)((char *)this + 24);
  if (v5 < 4
    || (*((_QWORD *)this + 2) = v5,
        v6 = (KB::Word *)malloc_type_malloc(240 * v5, 0x10B2040DF775671uLL),
        (*((_QWORD *)this + 1) = v6) != 0))
  {
    if (*(_QWORD *)a2)
    {
      v7 = (const KB::Word *)*((_QWORD *)a2 + 1);
      v8 = 240 * *(_QWORD *)a2;
      do
      {
        v6 = (KB::Word *)((char *)KB::Word::Word(v6, v7) + 240);
        v7 = (const KB::Word *)((char *)v7 + 240);
        v8 -= 240;
      }
      while (v8);
    }
  }
  v9 = *(_OWORD *)((char *)a2 + 744);
  v10 = *(_OWORD *)((char *)a2 + 760);
  *((_QWORD *)this + 97) = *((_QWORD *)a2 + 97);
  *(_OWORD *)((char *)this + 744) = v9;
  *(_OWORD *)((char *)this + 760) = v10;
  KB::LanguageModelContext::LanguageModelContext((KB::Candidate *)((char *)this + 784), (const KB::Candidate *)((char *)a2 + 784));
  MEMORY[0x2348A87C0]((char *)this + 888, (char *)a2 + 888);
  if (*((char *)a2 + 943) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 920), *((const std::string::value_type **)a2 + 115), *((_QWORD *)a2 + 116));
  }
  else
  {
    v11 = *(_OWORD *)((char *)a2 + 920);
    *((_QWORD *)this + 117) = *((_QWORD *)a2 + 117);
    *(_OWORD *)((char *)this + 920) = v11;
  }
  KB::ByteString::copy();
  *((_OWORD *)this + 60) = *((_OWORD *)a2 + 60);
  v12 = (const void *)*((_QWORD *)a2 + 122);
  *((_QWORD *)this + 122) = v12;
  if (v12)
  {
    CFRetain(v12);
    *((_QWORD *)this + 122) = v12;
  }
  v13 = (const void *)*((_QWORD *)a2 + 123);
  *((_QWORD *)this + 123) = v13;
  if (v13)
  {
    CFRetain(v13);
    *((_QWORD *)this + 123) = v13;
  }
  *((_DWORD *)this + 248) = *((_DWORD *)a2 + 248);
  return this;
}

void sub_22FA6D650(_Unwind_Exception *a1)
{
  uint64_t *v1;
  KB::LanguageModelContext *v2;
  KB::String *v3;

  KB::String::~String(v3);
  KB::LanguageModelContext::~LanguageModelContext(v2);
  WTF::Vector<KB::Word,3ul>::~Vector(v1);
  _Unwind_Resume(a1);
}

uint64_t *WTF::Vector<KB::Word,3ul>::~Vector(uint64_t *a1)
{
  uint64_t v2;
  KB::Word *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  v2 = *a1;
  if (*a1)
  {
    v3 = (KB::Word *)a1[1];
    v4 = 240 * v2;
    do
    {
      KB::Word::~Word(v3);
      v3 = (KB::Word *)(v5 + 240);
      v4 -= 240;
    }
    while (v4);
    *a1 = 0;
  }
  v6 = (uint64_t *)a1[1];
  if (a1 + 3 != v6)
  {
    a1[1] = 0;
    a1[2] = 0;
    free(v6);
  }
  return a1;
}

KB::Word *KB::Word::Word(KB::Word *this, const KB::Word *a2)
{
  uint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  char v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint8x8_t v15;
  _QWORD *v16;
  _QWORD *i;
  unint64_t v18;
  _QWORD *v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;

  MEMORY[0x2348A87C0]();
  KB::ByteString::copy();
  v4 = *((_QWORD *)a2 + 6);
  *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
  *((_QWORD *)this + 6) = v4;
  v5 = (unint64_t)this + 64;
  MEMORY[0x2348A87C0]((char *)this + 64, (char *)a2 + 64);
  v6 = *((_OWORD *)a2 + 6);
  v7 = *((_OWORD *)a2 + 7);
  v8 = *((_OWORD *)a2 + 9);
  *((_OWORD *)this + 8) = *((_OWORD *)a2 + 8);
  *((_OWORD *)this + 9) = v8;
  *((_OWORD *)this + 6) = v6;
  *((_OWORD *)this + 7) = v7;
  MEMORY[0x2348A87C0]((char *)this + 160, (char *)a2 + 160);
  v9 = *((_BYTE *)a2 + 192);
  *(_OWORD *)((char *)this + 200) = 0u;
  v10 = (uint64_t *)((char *)this + 200);
  *((_BYTE *)this + 192) = v9;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = *((_DWORD *)a2 + 58);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)this + 200, *((_QWORD *)a2 + 26));
  v11 = (_QWORD *)*((_QWORD *)a2 + 27);
  if (v11)
  {
    v12 = (_QWORD *)((char *)this + 216);
    v13 = *((_QWORD *)this + 26);
    do
    {
      v14 = v11[2];
      if (v13)
      {
        v15 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
        v15.i16[0] = vaddlv_u8(v15);
        if (v15.u32[0] > 1uLL)
        {
          v5 = v11[2];
          if (v14 >= v13)
            v5 = v14 % v13;
        }
        else
        {
          v5 = (v13 - 1) & v14;
        }
        v16 = *(_QWORD **)(*v10 + 8 * v5);
        if (v16)
        {
          for (i = (_QWORD *)*v16; i; i = (_QWORD *)*i)
          {
            v18 = i[1];
            if (v18 == v14)
            {
              if (i[2] == v14)
                goto LABEL_41;
            }
            else
            {
              if (v15.u32[0] > 1uLL)
              {
                if (v18 >= v13)
                  v18 %= v13;
              }
              else
              {
                v18 &= v13 - 1;
              }
              if (v18 != v5)
                break;
            }
          }
        }
      }
      v19 = operator new(0x18uLL);
      *v19 = 0;
      v19[1] = v14;
      v19[2] = v11[2];
      v20 = (float)(unint64_t)(*((_QWORD *)this + 28) + 1);
      v21 = *((float *)this + 58);
      if (!v13 || (float)(v21 * (float)v13) < v20)
      {
        v22 = (v13 & (v13 - 1)) != 0;
        if (v13 < 3)
          v22 = 1;
        v23 = v22 | (2 * v13);
        v24 = vcvtps_u32_f32(v20 / v21);
        if (v23 <= v24)
          v25 = v24;
        else
          v25 = v23;
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)this + 200, v25);
        v13 = *((_QWORD *)this + 26);
        if ((v13 & (v13 - 1)) != 0)
        {
          if (v14 >= v13)
            v5 = v14 % v13;
          else
            v5 = v14;
        }
        else
        {
          v5 = (v13 - 1) & v14;
        }
      }
      v26 = *v10;
      v27 = *(_QWORD **)(*v10 + 8 * v5);
      if (v27)
      {
        *v19 = *v27;
      }
      else
      {
        *v19 = *v12;
        *v12 = v19;
        *(_QWORD *)(v26 + 8 * v5) = v12;
        if (!*v19)
          goto LABEL_40;
        v28 = *(_QWORD *)(*v19 + 8);
        if ((v13 & (v13 - 1)) != 0)
        {
          if (v28 >= v13)
            v28 %= v13;
        }
        else
        {
          v28 &= v13 - 1;
        }
        v27 = (_QWORD *)(*v10 + 8 * v28);
      }
      *v27 = v19;
LABEL_40:
      ++*((_QWORD *)this + 28);
LABEL_41:
      v11 = (_QWORD *)*v11;
    }
    while (v11);
  }
  return this;
}

void sub_22FA6DA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, KB::String *a9, unsigned __int16 *a10)
{
  KB::String *v10;
  KB::String *v11;
  uint64_t v12;
  uint64_t v14;

  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table(v12);
  KB::String::~String(v11);
  KB::String::~String(a9);
  if (*a10 >= 0xFu)
  {
    v14 = *((_QWORD *)v10 + 5);
    if (v14)
      MEMORY[0x2348A8A0C](v14, 0x1000C8077774924);
  }
  KB::String::~String(v10);
  _Unwind_Resume(a1);
}

void TI::CP::TestCaseConverter::create_testcase_converter(TI::CP::TestCaseConverter *this@<X0>, NSString *a2@<X1>, std::string **a3@<X8>)
{
  int v3;
  TI::CP::TestCaseConverter *v5;
  KB *v6;
  NSString *v7;
  void *v8;
  KB *v9;
  NSString *v10;
  TI::CP::TestCaseConverter *v11;
  std::string *v12;
  TI::CP::TestCaseConverter *v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::string::size_type v17;
  std::__shared_weak_count *v18;
  void *__p[2];
  char v20;
  _BYTE v21[32];
  _BYTE v22[32];
  _BYTE v23[32];
  _BYTE v24[32];
  _DWORD v25[12];
  uint64_t v26;

  v3 = (int)a2;
  v26 = *MEMORY[0x24BDAC8D0];
  v5 = this;
  KB::String::String((KB::String *)v21);
  KB::String::String((KB::String *)v22);
  KB::String::String((KB::String *)v23);
  KB::String::String((KB::String *)v24);
  KB::String::String((KB::String *)v25);
  UIKeyboardStaticUnigramsFile();
  v6 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v6, v7);
  KB::String::operator=();
  KB::String::~String((KB::String *)__p);

  objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardDeltaLexiconPathForInputMode();
  v9 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v9, v10);
  KB::String::operator=();
  KB::String::~String((KB::String *)__p);

  v11 = objc_retainAutorelease(v5);
  -[TI::CP::TestCaseConverter UTF8String](v11, "UTF8String");
  v25[8] = TILexiconIDForLocaleIdentifier();
  v25[10] = 1065353216;
  __createAndLoadLanguageModel((NSString *)v11, 0, &v17);
  v12 = (std::string *)operator new();
  v13 = objc_retainAutorelease(v11);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[TI::CP::TestCaseConverter UTF8String](v13, "UTF8String"));
  TI::CP::TestCaseConverter::TestCaseConverter(v12, (__int128 *)__p, &v17, v3);
  *a3 = v12;
  if (v20 < 0)
    operator delete(__p[0]);
  v14 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  KB::String::~String((KB::String *)v25);
  KB::String::~String((KB::String *)v24);
  KB::String::~String((KB::String *)v23);
  KB::String::~String((KB::String *)v22);
  KB::String::~String((KB::String *)v21);

}

void sub_22FA6DCC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, char a19)
{
  void *v19;
  uint64_t v20;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x2348A8A24](v20, 0x10B2C406726BE89);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a10);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a19);

  _Unwind_Resume(a1);
}

std::string *TI::CP::TestCaseConverter::TestCaseConverter(std::string *this, __int128 *a2, std::string::size_type *a3, int a4)
{
  __int128 v8;
  std::string::size_type v9;
  unint64_t *v10;
  unint64_t v11;
  unsigned int **v12;
  const std::string::value_type *v13;
  NSString *v14;
  const std::string::value_type *v15;
  unsigned int *v16;
  unsigned int *v18;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v8 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v8;
  }
  this[1].__r_.__value_.__r.__words[0] = *a3;
  v9 = a3[1];
  this[1].__r_.__value_.__l.__size_ = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_OWORD *)&this[1].__r_.__value_.__r.__words[2] = 0u;
  v12 = (unsigned int **)&this[1].__r_.__value_.__r.__words[2];
  this[3].__r_.__value_.__r.__words[0] = 0;
  *(_OWORD *)&this[2].__r_.__value_.__r.__words[1] = 0u;
  LODWORD(this[3].__r_.__value_.__r.__words[1]) = 1065353216;
  if (a4)
  {
    if (*((char *)a2 + 23) >= 0)
      v13 = (const std::string::value_type *)a2;
    else
      v13 = *(const std::string::value_type **)a2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    __createAndLoadDictionaryContainer(v14, 0, &v18);
  }
  else
  {
    if (*((char *)a2 + 23) >= 0)
      v15 = (const std::string::value_type *)a2;
    else
      v15 = *(const std::string::value_type **)a2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    TI::CP::createAndLoadStaticDictionaryContainer((TI::CP *)v14, &v18);
  }
  v16 = *v12;
  *v12 = v18;
  if (v16)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v16);

  return this;
}

void sub_22FA6DEEC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  unsigned int **v4;

  std::__hash_table<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>>>::~__hash_table((uint64_t)(v4 + 1));
  if (*v4)
    WTF::RefCounted<KB::DictionaryContainer>::deref(*v4);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(a1);
}

unsigned int *WTF::RefCounted<KB::DictionaryContainer>::deref(unsigned int *result)
{
  unsigned int v1;
  unsigned int v2;

  v1 = atomic_load(result);
  if (v1 == 1)
  {
    MEMORY[0x2348A8700]();
    JUMPOUT(0x2348A8A24);
  }
  do
    v2 = __ldaxr(result);
  while (__stlxr(v2 - 1, result));
  return result;
}

void TI::CP::createAndLoadStaticDictionaryContainer(TI::CP *this@<X0>, _QWORD *a2@<X8>)
{
  TI::CP *v4;
  KB *v5;
  NSString *v6;
  TI::CP *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  void **v13;
  _BYTE v14[32];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[32];
  _BYTE v20[32];
  _BYTE v21[32];
  _BYTE v22[32];
  _DWORD v23[12];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = this;
  KB::String::String((KB::String *)v19);
  KB::String::String((KB::String *)v20);
  KB::String::String((KB::String *)v21);
  KB::String::String((KB::String *)v22);
  KB::String::String((KB::String *)v23);
  UIKeyboardStaticUnigramsFile();
  v5 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v5, v6);
  KB::String::operator=();
  KB::String::~String((KB::String *)v14);

  v7 = objc_retainAutorelease(v4);
  -[TI::CP UTF8String](v7, "UTF8String");
  v23[8] = TILexiconIDForLocaleIdentifier();
  KB::LexiconInfo::LexiconInfo((uint64_t)v14, (uint64_t)v19);
  v8 = (char *)operator new(0xB0uLL);
  v9 = v8 + 176;
  v11[0] = v8;
  v11[2] = v8 + 176;
  KB::LexiconInfo::LexiconInfo((uint64_t)v8, (uint64_t)v14);
  v11[1] = v9;
  KB::DictionaryContainer::create_multilexicon();
  v10 = v12;
  v12 = 0;
  v13 = (void **)v11;
  *a2 = v10;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v13);
  KB::String::~String((KB::String *)&v18);
  KB::String::~String((KB::String *)&v17);
  KB::String::~String((KB::String *)&v16);
  KB::String::~String((KB::String *)&v15);
  KB::String::~String((KB::String *)v14);
  KB::String::~String((KB::String *)v23);
  KB::String::~String((KB::String *)v22);
  KB::String::~String((KB::String *)v21);
  KB::String::~String((KB::String *)v20);
  KB::String::~String((KB::String *)v19);

}

void sub_22FA6E140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  void *v36;

  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&a13);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a14);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a36);

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>>>::~__hash_table(uint64_t a1)
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
      std::__destroy_at[abi:nn180100]<std::pair<KB::String const,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,0>((KB::String *)(v2 + 2));
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

void std::__destroy_at[abi:nn180100]<std::pair<KB::String const,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,0>(KB::String *this)
{
  unsigned int *v2;

  v2 = (unsigned int *)*((_QWORD *)this + 4);
  if (v2)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v2);
  KB::String::~String(this);
}

std::string *TI::CP::TestCaseConverter::TestCaseConverter(std::string *this, __int128 *a2, std::string::size_type *a3, unsigned int **a4)
{
  __int128 v7;
  std::string::size_type v8;
  unint64_t *v9;
  unint64_t v10;
  unsigned int *v11;
  unsigned int v12;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v7 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
  }
  v8 = a3[1];
  this[1].__r_.__value_.__r.__words[0] = *a3;
  this[1].__r_.__value_.__l.__size_ = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = *a4;
  this[1].__r_.__value_.__r.__words[2] = (std::string::size_type)*a4;
  if (v11)
  {
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 + 1, v11));
  }
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[2].__r_.__value_.__r.__words[2] = 0u;
  LODWORD(this[3].__r_.__value_.__r.__words[1]) = 1065353216;
  return this;
}

uint64_t TI::CP::TestCaseConverter::set_layouts(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = ___ZN2TI2CP17TestCaseConverter11set_layoutsEP7NSArrayIP16TIKeyboardLayoutE_block_invoke;
  v3[3] = &__block_descriptor_40_e33_v32__0__TIKeyboardLayout_8Q16_B24l;
  v3[4] = a1;
  return objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);
}

void ___ZN2TI2CP17TestCaseConverter11set_layoutsEP7NSArrayIP16TIKeyboardLayoutE_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v3;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  KB::String *v11;
  unsigned int v12;
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  uint8x8_t v16;
  unint64_t v17;
  void **v18;
  char *v19;
  unint64_t v20;
  _QWORD *v21;
  float v22;
  float v23;
  _BOOL8 v24;
  unint64_t v25;
  unint64_t v26;
  size_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unsigned int *v31;
  unsigned int *v32;
  unsigned int *v33;
  unsigned int *v34;
  uint64_t v35[2];
  char v36;
  char *v37;
  KB::String *v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(unsigned int **)(v8 + 40);
  v33 = v9;
  if (v9)
  {
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 + 1, v9));
  }
  TI::CP::create_layout(v6, &v33);
  MEMORY[0x2348A87CC](&v37, a3);
  if (v38)
    v11 = v38;
  else
    v11 = (KB::String *)v39;
  v12 = KB::String::hash(v11, (const char *)(unsigned __int16)v37);
  v13 = (uint64_t *)(v8 + 48);
  v14 = v12;
  v15 = *(_QWORD *)(v8 + 56);
  if (v15)
  {
    v16 = (uint8x8_t)vcnt_s8((int8x8_t)v15);
    v16.i16[0] = vaddlv_u8(v16);
    v17 = v16.u32[0];
    if (v16.u32[0] > 1uLL)
    {
      v3 = v12;
      if (v15 <= v12)
        v3 = v12 % v15;
    }
    else
    {
      v3 = ((_DWORD)v15 - 1) & v12;
    }
    v18 = *(void ***)(*v13 + 8 * v3);
    if (v18)
    {
      v19 = (char *)*v18;
      if (*v18)
      {
        do
        {
          v20 = *((_QWORD *)v19 + 1);
          if (v20 == v14)
          {
            if (v19 + 16 == (char *)&v37
              || (KB::String::equal((KB::String *)(v19 + 16), (const KB::String *)&v37) & 1) != 0)
            {
              goto LABEL_46;
            }
          }
          else
          {
            if (v17 > 1)
            {
              if (v20 >= v15)
                v20 %= v15;
            }
            else
            {
              v20 &= v15 - 1;
            }
            if (v20 != v3)
              break;
          }
          v19 = *(char **)v19;
        }
        while (v19);
      }
    }
  }
  v19 = (char *)operator new(0x38uLL);
  v21 = (_QWORD *)(v8 + 64);
  v35[0] = (uint64_t)v19;
  v35[1] = v8 + 64;
  v36 = 0;
  *(_QWORD *)v19 = 0;
  *((_QWORD *)v19 + 1) = v14;
  KB::String::String();
  *((_QWORD *)v19 + 6) = 0;
  v36 = 1;
  v22 = (float)(unint64_t)(*(_QWORD *)(v8 + 72) + 1);
  v23 = *(float *)(v8 + 80);
  if (!v15 || (float)(v23 * (float)v15) < v22)
  {
    v24 = 1;
    if (v15 >= 3)
      v24 = (v15 & (v15 - 1)) != 0;
    v25 = v24 | (2 * v15);
    v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26)
      v27 = v26;
    else
      v27 = v25;
    std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>(v8 + 48, v27);
    v15 = *(_QWORD *)(v8 + 56);
    if ((v15 & (v15 - 1)) != 0)
    {
      if (v15 <= v14)
        v3 = v14 % v15;
      else
        v3 = v14;
    }
    else
    {
      v3 = ((_DWORD)v15 - 1) & v14;
    }
  }
  v28 = *v13;
  v29 = *(_QWORD **)(*v13 + 8 * v3);
  if (v29)
  {
    *(_QWORD *)v19 = *v29;
LABEL_44:
    *v29 = v19;
    goto LABEL_45;
  }
  *(_QWORD *)v19 = *v21;
  *v21 = v19;
  *(_QWORD *)(v28 + 8 * v3) = v21;
  if (*(_QWORD *)v19)
  {
    v30 = *(_QWORD *)(*(_QWORD *)v19 + 8);
    if ((v15 & (v15 - 1)) != 0)
    {
      if (v30 >= v15)
        v30 %= v15;
    }
    else
    {
      v30 &= v15 - 1;
    }
    v29 = (_QWORD *)(*v13 + 8 * v30);
    goto LABEL_44;
  }
LABEL_45:
  v35[0] = 0;
  ++*(_QWORD *)(v8 + 72);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100](v35);
LABEL_46:
  v31 = (unsigned int *)*((_QWORD *)v19 + 6);
  v32 = v34;
  v34 = 0;
  *((_QWORD *)v19 + 6) = v32;
  if (v31)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v31);
  KB::String::~String((KB::String *)&v37);
  if (v34)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v34);
  if (v33)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v33);

}

void sub_22FA6E69C(_Unwind_Exception *a1, unsigned int *a2, unsigned int *a3, ...)
{
  void *v3;
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100]((uint64_t *)va);
  KB::String::~String((KB::String *)va1);
  if (a3)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(a3);
  if (a2)
    WTF::RefCounted<KB::DictionaryContainer>::deref(a2);

  _Unwind_Resume(a1);
}

void TI::CP::create_layout(void *a1, unsigned int **a2)
{
  id v3;
  void *v4;
  unsigned int *v5;
  unsigned int v6;
  _QWORD v7[5];
  unsigned int *v8;
  _QWORD v9[6];
  _QWORD v10[3];

  v3 = a1;
  v4 = v3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x4812000000;
  v9[3] = __Block_byref_object_copy__25;
  v9[4] = __Block_byref_object_dispose__26;
  v9[5] = &unk_22FAD47AA;
  memset(v10, 0, sizeof(v10));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3321888768;
  v7[2] = ___ZN2TI2CP13create_layoutEPK16TIKeyboardLayoutN3WTF6RefPtrIN2KB19DictionaryContainerEEE_block_invoke;
  v7[3] = &unk_24FD487D0;
  v5 = *a2;
  v8 = v5;
  if (v5)
  {
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
  }
  v7[4] = v9;
  objc_msgSend(v3, "enumerateKeysUsingBlock:", v7);
  TI::Favonius::KeyboardLayout::create();
  if (v8)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v8);
  _Block_object_dispose(v9, 8);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(v10);

}

void sub_22FA6E7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int *a8, ...)
{
  void *v8;
  _QWORD *v9;
  va_list va;

  va_start(va, a8);
  if (a8)
    WTF::RefCounted<KB::DictionaryContainer>::deref(a8);
  _Block_object_dispose(va, 8);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(v9);

  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100](uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((_BYTE *)a1 + 16))
      std::__destroy_at[abi:nn180100]<std::pair<KB::String const,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,0>((KB::String *)(v1 + 16));
    operator delete((void *)v1);
  }
}

_QWORD *__Block_byref_object_copy__25(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  result[6] = 0;
  result[7] = 0;
  result[8] = 0;
  v2 = a2[7];
  result[6] = a2[6];
  result[7] = v2;
  a2[6] = 0;
  a2[7] = 0;
  v3 = result[8];
  result[8] = a2[8];
  a2[8] = v3;
  return result;
}

_QWORD *__Block_byref_object_dispose__26(uint64_t a1)
{
  return WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector((_QWORD *)(a1 + 48));
}

void ___ZN2TI2CP13create_layoutEPK16TIKeyboardLayoutN3WTF6RefPtrIN2KB19DictionaryContainerEEE_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int16 v9;
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  MEMORY[0x2348A87B4](v11);
  KB::CollatorWrapper::sortkey_for_string((KB::CollatorWrapper *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 72), (const KB::String *)v11);
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  TI::Favonius::LayoutKey::create();
  v4 = v2 + 6;
  v3 = v2[6];
  if (v3 != v2[8])
  {
    v7 = v2[7];
    goto LABEL_10;
  }
  v5 = v3 + (v3 >> 1);
  if (v3 < 0x100)
    v5 = 2 * v3;
  if (v5 <= v3 + 1)
    v6 = v3 + 1;
  else
    v6 = v5;
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::reserveCapacity(v2 + 6, v6);
  v7 = v2[7];
  if (v7)
  {
    v3 = *v4;
LABEL_10:
    *(_QWORD *)(v7 + 8 * v3) = v8;
    *v4 = v3 + 1;
    goto LABEL_11;
  }
  if (v8)
    WTF::RefCounted<TI::Favonius::Key>::deref(v8);
LABEL_11:
  if (v9 >= 0xFu && v10)
    MEMORY[0x2348A8A0C](v10, 0x1000C8077774924);
  KB::String::~String((KB::String *)v11);
}

void sub_22FA6EA00(_Unwind_Exception *a1, uint64_t a2, unsigned __int16 a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  if (a2)
    WTF::RefCounted<TI::Favonius::Key>::deref(a2);
  if (a3 >= 0xFu)
  {
    if (a4)
      MEMORY[0x2348A8A0C](a4, 0x1000C8077774924);
  }
  KB::String::~String((KB::String *)va);
  _Unwind_Resume(a1);
}

_QWORD *WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;

  if (*a1)
  {
    v2 = (uint64_t *)a1[1];
    v3 = 8 * *a1;
    do
    {
      if (*v2)
        WTF::RefCounted<TI::Favonius::Key>::deref(*v2);
      ++v2;
      v3 -= 8;
    }
    while (v3);
    *a1 = 0;
  }
  v4 = (void *)a1[1];
  a1[1] = 0;
  a1[2] = 0;
  free(v4);
  return a1;
}

uint64_t __copy_helper_block_ea8_40c46_ZTSKN3WTF6RefPtrIN2KB19DictionaryContainerEEE(uint64_t result, uint64_t a2)
{
  unsigned int *v2;
  unsigned int v3;

  v2 = *(unsigned int **)(a2 + 40);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 + 1, v2));
  }
  return result;
}

unsigned int *__destroy_helper_block_ea8_40c46_ZTSKN3WTF6RefPtrIN2KB19DictionaryContainerEEE(uint64_t a1)
{
  unsigned int *result;

  result = *(unsigned int **)(a1 + 40);
  if (result)
    return WTF::RefCounted<KB::DictionaryContainer>::deref(result);
  return result;
}

void WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::reserveCapacity(_QWORD *a1, unint64_t a2)
{
  void *v2;
  void **v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (a1[2] < a2)
  {
    v3 = (void **)(a1 + 1);
    v2 = (void *)a1[1];
    v4 = *a1;
    a1[2] = a2;
    v5 = malloc_type_malloc(8 * a2, 0x2004093837F09uLL);
    *v3 = v5;
    if (v5)
    {
      memcpy(v5, v2, 8 * v4);
      v6 = *v3;
    }
    else
    {
      v6 = 0;
    }
    if (v6 == v2)
    {
      *v3 = 0;
      v3[1] = 0;
    }
    free(v2);
  }
}

void TI::CP::TestCaseConverter::compute_linguistic_context_and_stem(TI::CP::TestCaseConverter *this@<X0>, NSString *a2@<X1>, KB::LanguageModelContext *a3@<X8>)
{
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  KB *v11;
  uint64_t v12;
  NSString *v13;
  NSString *v14;
  const char *v15;
  TI::CP::TestCaseConverter *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  KB *v21;
  uint64_t *v22;
  uint64_t *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  KB *v28;
  id v29;
  NSString *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  __int128 v37;
  __int128 __p;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];
  void **v44[7];

  v44[5] = *(void ***)MEMORY[0x24BDAC8D0];
  v4 = a2;
  v31 = 0;
  v32 = &v31;
  v33 = 0x4012000000;
  v34 = __Block_byref_object_copy__32;
  v35 = (uint64_t (*)(uint64_t))__Block_byref_object_dispose__33;
  v36 = &unk_22FAD47AA;
  v37 = xmmword_22FAC90B0;
  v5 = -[NSString length](v4, "length");
  v44[0] = (void **)MEMORY[0x24BDAC760];
  v44[1] = (void **)3221225472;
  v44[2] = (void **)___ZN2TI2CPL23rangeOfLastWordInStringEP8NSString_block_invoke;
  v44[3] = (void **)&unk_24FD48808;
  v44[4] = (void **)&v31;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 771, v44);
  v7 = v32[6];
  v6 = v32[7];
  _Block_object_dispose(&v31, 8);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v6 + v7 != -[NSString length](v4, "length"))
  {
    v11 = 0;
  }
  else
  {
    -[NSString substringWithRange:](v4, "substringWithRange:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(&unk_24FD5FC78, "containsObject:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v11 = v8;
      -[NSString substringToIndex:](v4, "substringToIndex:", v7);
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (NSString *)v12;
    }

  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x9812000000;
  v34 = __Block_byref_object_copy__982;
  v35 = __Block_byref_object_dispose__983;
  v36 = &unk_22FAD47AA;
  v37 = 0u;
  __p = 0u;
  v39 = 0u;
  v40 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v41);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v42);
  memset(v43, 0, sizeof(v43));
  v28 = v11;
  if (*((_QWORD *)this + 3))
  {
    v14 = objc_retainAutorelease(v4);
    v15 = -[NSString UTF8String](v14, "UTF8String");
    v16 = this;
    if (*((char *)this + 23) < 0)
      v16 = *(TI::CP::TestCaseConverter **)this;
    v17 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localeWithLocaleIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    TILexiconIDForLocaleIdentifier();
    if (-[NSString length](v14, "length"))
    {
      LMStreamTokenizerCreate();
      strlen(v15);
      v29 = v19;
      v30 = v14;
      LMStreamTokenizerPushBytes();
      LMStreamTokenizerRelease();

    }
    else
    {
      MEMORY[0x2348A87B4](v44, "");
      KB::LanguageModelContext::append();
      KB::String::~String((KB::String *)v44);
    }
    v23 = v32;
    KB::utf8_string(v28, v20);
    std::pair<KB::LanguageModelContext,KB::String>::pair[abi:nn180100]<KB::LanguageModelContext&,KB::String,0>(a3, (const KB::LanguageModelContext *)(v23 + 6));
    KB::String::~String((KB::String *)v44);

  }
  else
  {
    v21 = v11;
    v22 = v32;
    KB::utf8_string(v21, v13);
    std::pair<KB::LanguageModelContext,KB::String>::pair[abi:nn180100]<KB::LanguageModelContext&,KB::String,0>(a3, (const KB::LanguageModelContext *)(v22 + 6));
    KB::String::~String((KB::String *)v44);
  }
  _Block_object_dispose(&v31, 8);
  v44[0] = (void **)v43;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](v44);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v42);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v41);
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  v24 = (std::__shared_weak_count *)*((_QWORD *)&v37 + 1);
  if (*((_QWORD *)&v37 + 1))
  {
    v25 = (unint64_t *)(*((_QWORD *)&v37 + 1) + 8);
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }

}

void sub_22FA6EFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  void *v27;
  void *v28;
  uint64_t v29;

  KB::String::~String((KB::String *)(v29 - 152));

  _Block_object_dispose(&a21, 8);
  KB::LanguageModelContext::~LanguageModelContext((KB::LanguageModelContext *)&a27);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__32(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t ___ZN2TI2CPL23rangeOfLastWordInStringEP8NSString_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;

  v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  *(_QWORD *)(v7 + 48) = a3;
  *(_QWORD *)(v7 + 56) = a4;
  *a7 = 1;
  return result;
}

__n128 __Block_byref_object_copy__982(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __n128 result;

  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  v4 = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v4;
  language_modeling::v1::LinguisticContext::LinguisticContext();
  language_modeling::v1::LinguisticContext::LinguisticContext();
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  result = *(__n128 *)(a2 + 128);
  *(__n128 *)(a1 + 128) = result;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a2 + 128) = 0;
  *(_QWORD *)(a2 + 136) = 0;
  *(_QWORD *)(a2 + 144) = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__983(uint64_t a1)
{
  void *v2;
  void **v4;

  v4 = (void **)(a1 + 128);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v4);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 120));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 112));
  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(_QWORD *)(a1 + 72) = v2;
    operator delete(v2);
  }
  return std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](a1 + 48);
}

KB::LanguageModelContext *std::pair<KB::LanguageModelContext,KB::String>::pair[abi:nn180100]<KB::LanguageModelContext&,KB::String,0>(KB::LanguageModelContext *a1, const KB::LanguageModelContext *a2)
{
  KB::LanguageModelContext::LanguageModelContext(a1, a2);
  KB::String::String();
  return a1;
}

void sub_22FA6F220(_Unwind_Exception *a1)
{
  KB::LanguageModelContext *v1;

  KB::LanguageModelContext::~LanguageModelContext(v1);
  _Unwind_Resume(a1);
}

void ___ZNK2TI2CP17TestCaseConverter35compute_linguistic_context_and_stemEP8NSString_block_invoke(uint64_t a1, NSString *a2, uint64_t a3, int a4)
{
  unint64_t v5;
  void *v6;
  unint64_t token_id_for_word;
  _BYTE v8[32];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    LODWORD(v5) = a4;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
    KB::String::String((KB::String *)v8);
    token_id_for_word = KB::LanguageModel::find_token_id_for_word();
    KB::String::~String((KB::String *)v8);

    v5 = HIDWORD(token_id_for_word);
  }
  if ((_DWORD)v5 != 2)
  {
    KB::utf8_string(*(KB **)(a1 + 40), a2);
    KB::LanguageModelContext::append();
    KB::String::~String((KB::String *)v8);
  }
}

void sub_22FA6F354(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  KB::String::~String((KB::String *)va);

  _Unwind_Resume(a1);
}

void TI::CP::TestCaseConverter::convert(TI::CP::TestCaseConverter *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  KB *v20;
  NSString *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  NSString *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  unsigned int v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  unsigned int *v39;
  __int128 v40;
  void *v41[2];
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void **v54;
  __int128 v55;
  void *__p;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[32];
  _BYTE v63[32];
  _BYTE v64[128];
  _QWORD v65[7];
  CGPoint v66;

  v65[4] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "originalWord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348A87CC](v65, objc_msgSend(v6, "layoutID"));

  v7 = (unsigned int *)std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((_QWORD *)a1 + 6, v65)[6];
  if (v7)
  {
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 + 1, v7));
  }
  v52 = 0u;
  v53 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v5, "alignedTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v48 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v13, "location");
        v15 = v14;
        v17 = v16;
        objc_msgSend(v13, "timestamp");
        v19 = v18;
        v66.x = v15;
        v66.y = v17;
        TI::CP::Path::append((TI::CP::Path *)&v51, v66, v19, 0.0, -1.0, 0.0);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v64, 16);
    }
    while (v10);
  }

  objc_msgSend(v5, "expectedString");
  v20 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v20, v21);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  *(_OWORD *)v41 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v44);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v45);
  memset(v46, 0, 24);
  KB::String::String((KB::String *)v62);
  objc_msgSend(v5, "originalWord");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "inputStem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 == 0;

  if (!v24)
  {
    objc_msgSend(v5, "originalWord");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "inputStem");
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    TI::CP::TestCaseConverter::compute_linguistic_context_and_stem(a1, v26, (KB::LanguageModelContext *)&v55);
    KB::LanguageModelContext::operator=((uint64_t)&v40, &v55);
    KB::String::operator=();
    KB::String::~String((KB::String *)&v61);
    v54 = (void **)&v60;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v54);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v59);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v58);
    if (__p)
    {
      v57 = __p;
      operator delete(__p);
    }
    v27 = (std::__shared_weak_count *)*((_QWORD *)&v55 + 1);
    if (*((_QWORD *)&v55 + 1))
    {
      v28 = (unint64_t *)(*((_QWORD *)&v55 + 1) + 8);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }

  }
  v39 = v7;
  if (v7)
  {
    do
      v30 = __ldaxr(v7);
    while (__stlxr(v30 + 1, v7));
  }
  TI::CP::ContinuousPathTestCase::ContinuousPathTestCase(a3, &v39, (const std::vector<unsigned int> *)&v51, (uint64_t)v63, (const KB::LanguageModelContext *)&v40, (uint64_t)v62);
  if (v39)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v39);
  objc_msgSend(v5, "alignedTouches");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count") == 0;

  if (!v32)
  {
    objc_msgSend(v5, "alignedTouches");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timestamp");
    *(_QWORD *)(a3 + 224) = v35;

  }
  KB::String::~String((KB::String *)v62);
  *(_QWORD *)&v55 = v46;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v55);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v45);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v44);
  if (v41[0])
  {
    v41[1] = v41[0];
    operator delete(v41[0]);
  }
  v36 = (std::__shared_weak_count *)*((_QWORD *)&v40 + 1);
  if (*((_QWORD *)&v40 + 1))
  {
    v37 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  KB::String::~String((KB::String *)v63);
  if (*((_QWORD *)&v52 + 1))
  {
    *(_QWORD *)&v53 = *((_QWORD *)&v52 + 1);
    operator delete(*((void **)&v52 + 1));
  }
  if ((_QWORD)v51)
  {
    *((_QWORD *)&v51 + 1) = v51;
    operator delete((void *)v51);
  }
  if (v7)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v7);
  KB::String::~String((KB::String *)v65);

}

void sub_22FA6F7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  void *v62;
  unsigned int *v63;
  TI::CP::ContinuousPathTestCase *v64;
  void *v65;
  void *v66;
  uint64_t v67;

  TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase(v64);
  KB::String::~String((KB::String *)&a58);
  KB::LanguageModelContext::~LanguageModelContext((KB::LanguageModelContext *)&a11);
  KB::String::~String((KB::String *)&a62);
  TI::CP::Path::~Path((TI::CP::Path *)&a33);
  if (v63)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v63);
  KB::String::~String((KB::String *)(v67 - 152));

  _Unwind_Resume(a1);
}

uint64_t KB::LanguageModelContext::operator=(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  __int128 v9;

  v4 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v5 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v4;
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
  v8 = *(void **)(a1 + 16);
  if (v8)
  {
    *(_QWORD *)(a1 + 24) = v8;
    operator delete(v8);
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
  }
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 2) = 0;
  *((_QWORD *)a2 + 3) = 0;
  *((_QWORD *)a2 + 4) = 0;
  v9 = *(__int128 *)((char *)a2 + 40);
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
  *(_OWORD *)(a1 + 40) = v9;
  language_modeling::v1::LinguisticContext::operator=();
  language_modeling::v1::LinguisticContext::operator=();
  std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(a1 + 80));
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *((_QWORD *)a2 + 10) = 0;
  *((_QWORD *)a2 + 11) = 0;
  *((_QWORD *)a2 + 12) = 0;
  return a1;
}

uint64_t std::pair<KB::LanguageModelContext,KB::String>::~pair(uint64_t a1)
{
  void *v2;
  void **v4;

  KB::String::~String((KB::String *)(a1 + 104));
  v4 = (void **)(a1 + 80);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v4);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 72));
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)(a1 + 64));
  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(_QWORD *)(a1 + 24) = v2;
    operator delete(v2);
  }
  return std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](a1);
}

void TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase(TI::CP::ContinuousPathTestCase *this)
{
  void *v2;
  void *v3;
  void *v4;
  void **v5;

  KB::String::~String((TI::CP::ContinuousPathTestCase *)((char *)this + 192));
  v5 = (void **)((char *)this + 168);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v5);
  language_modeling::v1::LinguisticContext::~LinguisticContext((TI::CP::ContinuousPathTestCase *)((char *)this + 160));
  language_modeling::v1::LinguisticContext::~LinguisticContext((TI::CP::ContinuousPathTestCase *)((char *)this + 152));
  v2 = (void *)*((_QWORD *)this + 13);
  if (v2)
  {
    *((_QWORD *)this + 14) = v2;
    operator delete(v2);
  }
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)this + 88);
  KB::String::~String((TI::CP::ContinuousPathTestCase *)((char *)this + 56));
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 1);
  if (v4)
  {
    *((_QWORD *)this + 2) = v4;
    operator delete(v4);
  }
  if (*(_QWORD *)this)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(*(unsigned int **)this);
}

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:nn180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

double TI::CP::TestResultsSummarizer::TestResultsSummarizer(TI::CP::TestResultsSummarizer *this, char a2, char a3, char a4)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 13) = 0;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((_QWORD *)this + 23) = 0;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((_QWORD *)this + 33) = 0;
  *((_QWORD *)this + 35) = 0xC010000000000000;
  *((_QWORD *)this + 36) = 0x4008000000000000;
  *((_QWORD *)this + 37) = 0;
  *((_DWORD *)this + 76) = 0;
  *((_BYTE *)this + 96) = a2;
  *((_BYTE *)this + 128) = a3;
  *((_BYTE *)this + 97) = a4;
  return result;
}

{
  double result;

  result = 0.0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 13) = 0;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((_QWORD *)this + 23) = 0;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((_QWORD *)this + 33) = 0;
  *((_QWORD *)this + 35) = 0xC010000000000000;
  *((_QWORD *)this + 36) = 0x4008000000000000;
  *((_QWORD *)this + 37) = 0;
  *((_DWORD *)this + 76) = 0;
  *((_BYTE *)this + 96) = a2;
  *((_BYTE *)this + 128) = a3;
  *((_BYTE *)this + 97) = a4;
  return result;
}

void TI::CP::TestResultsSummarizer::add_result(TI::CP::TestResultsSummarizer *this, const TI::CP::ContinuousPathTestResult *a2)
{
  unint64_t v2;
  int v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  int v17;
  unint64_t v18;
  char *v19;
  _DWORD *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  BOOL v25;
  unint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  unint64_t v29;
  int v30;
  unsigned int v31;
  id v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint8x8_t v49;
  unint64_t v50;
  void **v51;
  char *v52;
  unint64_t v53;
  _QWORD *v54;
  std::string *v55;
  float v56;
  float v57;
  _BOOL8 v58;
  unint64_t v59;
  unint64_t v60;
  size_t v61;
  uint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  void *v83;
  const std::string::value_type *v84;
  id v85;
  uint64_t *v86;
  void *__p[2];
  uint64_t v88;
  char *v89;
  TI::CP::ContinuousPathTestResult *v90;
  TI::CP::ContinuousPathTestResult *v91;
  unint64_t v92;
  char *v93;

  ++*((_DWORD *)this + 23);
  v5 = *((_DWORD *)a2 + 36);
  if (v5 == -1)
  {
    ++*((_DWORD *)this + 21);
  }
  else if (v5)
  {
    if (v5 > 3)
    {
      if (v5 > 0x27)
        ++*((_DWORD *)this + 22);
      else
        ++*((_DWORD *)this + 20);
    }
    else
    {
      ++*((_DWORD *)this + 19);
    }
  }
  else
  {
    ++*((_DWORD *)this + 18);
  }
  v6 = *((double *)a2 + 19);
  *((double *)this + 15) = v6 + *((double *)this + 15);
  if ((*((_QWORD *)a2 + 20) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    *((double *)this + 13) = v6 - *((double *)a2 + 20) + *((double *)this + 13);
  if ((*((_QWORD *)a2 + 21) & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    *((double *)this + 14) = v6 - *((double *)a2 + 21) + *((double *)this + 14);
  if (*((_BYTE *)this + 128) && *((_DWORD *)a2 + 36))
  {
    v7 = *((_QWORD *)this + 19);
    v8 = *((_QWORD *)this + 18);
    if (v8 >= v7)
    {
      v10 = *((_QWORD *)this + 17);
      v11 = 0x34F72C234F72C235 * ((uint64_t)(v8 - v10) >> 3);
      if ((unint64_t)(v11 + 1) > 0x11A7B9611A7B961)
        goto LABEL_147;
      v12 = 0x34F72C234F72C235 * ((uint64_t)(v7 - v10) >> 3);
      v13 = 2 * v12;
      if (2 * v12 <= v11 + 1)
        v13 = v11 + 1;
      if (v12 >= 0x8D3DCB08D3DCB0)
        v14 = 0x11A7B9611A7B961;
      else
        v14 = v13;
      v93 = (char *)this + 152;
      if (v14)
        v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v14);
      else
        v15 = 0;
      v89 = (char *)v14;
      v90 = (TI::CP::ContinuousPathTestResult *)(v14 + 232 * v11);
      v92 = v14 + 232 * v15;
      TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v90, a2);
      v91 = (TI::CP::ContinuousPathTestResult *)((char *)v90 + 232);
      std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)this + 17, &v89);
      v9 = *((_QWORD *)this + 18);
      std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v89);
    }
    else
    {
      TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*((TI::CP::ContinuousPathTestResult **)this + 18), a2);
      v9 = v8 + 232;
      *((_QWORD *)this + 18) = v8 + 232;
    }
    *((_QWORD *)this + 18) = v9;
  }
  if (*((_BYTE *)a2 + 217))
    ++*((_DWORD *)this + 76);
  if (*((_BYTE *)a2 + 219))
    ++*((_DWORD *)this + 75);
  if (*((_BYTE *)a2 + 218))
    ++*((_DWORD *)this + 74);
  if (v5 == -1)
    v16 = *((double *)this + 35);
  else
    v16 = *((double *)this + 35) * ((double)v5 / (*((double *)this + 36) + (double)v5));
  *((double *)this + 34) = v16 + *((double *)this + 34);
  v17 = *((_DWORD *)a2 + 36);
  v19 = (char *)*((_QWORD *)this + 32);
  v18 = *((_QWORD *)this + 33);
  if ((unint64_t)v19 < v18)
  {
    *(_DWORD *)v19 = v17;
    v20 = v19 + 4;
    goto LABEL_53;
  }
  v21 = (char *)*((_QWORD *)this + 31);
  v22 = (v19 - v21) >> 2;
  v23 = v22 + 1;
  if ((unint64_t)(v22 + 1) >> 62)
LABEL_147:
    abort();
  v24 = v18 - (_QWORD)v21;
  if (v24 >> 1 > v23)
    v23 = v24 >> 1;
  v25 = (unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL;
  v26 = 0x3FFFFFFFFFFFFFFFLL;
  if (!v25)
    v26 = v23;
  if (v26)
  {
    v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v26);
    v21 = (char *)*((_QWORD *)this + 31);
    v19 = (char *)*((_QWORD *)this + 32);
  }
  else
  {
    v27 = 0;
  }
  v28 = (_DWORD *)(v26 + 4 * v22);
  v29 = v26 + 4 * v27;
  *v28 = v17;
  v20 = v28 + 1;
  while (v19 != v21)
  {
    v30 = *((_DWORD *)v19 - 1);
    v19 -= 4;
    *--v28 = v30;
  }
  *((_QWORD *)this + 31) = v28;
  *((_QWORD *)this + 32) = v20;
  *((_QWORD *)this + 33) = v29;
  if (v21)
    operator delete(v21);
LABEL_53:
  *((_QWORD *)this + 32) = v20;
  if (*((_BYTE *)this + 97))
  {
    v31 = *((_DWORD *)a2 + 36);
    if (v31 <= 3)
    {
      v32 = *(id *)(*((_QWORD *)a2 + 5) + 1000 * v31 + 984);
      objc_msgSend(v32, "allKeys");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "count") != 1)
      {
LABEL_145:

        return;
      }
      if (*((_DWORD *)a2 + 36))
        goto LABEL_132;
      v34 = *((_QWORD *)this + 27);
      v35 = *((_QWORD *)this + 26);
      if (v35 >= v34)
      {
        v37 = *((_QWORD *)this + 25);
        v38 = 0x34F72C234F72C235 * ((uint64_t)(v35 - v37) >> 3);
        if ((unint64_t)(v38 + 1) > 0x11A7B9611A7B961)
          goto LABEL_148;
        v39 = 0x34F72C234F72C235 * ((uint64_t)(v34 - v37) >> 3);
        v40 = 2 * v39;
        if (2 * v39 <= v38 + 1)
          v40 = v38 + 1;
        if (v39 >= 0x8D3DCB08D3DCB0)
          v41 = 0x11A7B9611A7B961;
        else
          v41 = v40;
        v93 = (char *)this + 216;
        if (v41)
          v41 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v41);
        else
          v42 = 0;
        v89 = (char *)v41;
        v90 = (TI::CP::ContinuousPathTestResult *)(v41 + 232 * v38);
        v91 = v90;
        v92 = v41 + 232 * v42;
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v90, a2);
        v91 = (TI::CP::ContinuousPathTestResult *)((char *)v91 + 232);
        std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)this + 25, &v89);
        v36 = *((_QWORD *)this + 26);
        std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v89);
      }
      else
      {
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*((TI::CP::ContinuousPathTestResult **)this + 26), a2);
        v36 = v35 + 232;
        *((_QWORD *)this + 26) = v35 + 232;
      }
      *((_QWORD *)this + 26) = v36;
      objc_msgSend(v33, "firstObject");
      v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v85, "UTF8String"));
      v86 = (uint64_t *)((char *)this + 160);
      v43 = SHIBYTE(v88);
      v83 = __p[1];
      v84 = (const std::string::value_type *)__p[0];
      if (v88 >= 0)
        v44 = (uint64_t *)__p;
      else
        v44 = (uint64_t *)__p[0];
      if (v88 >= 0)
        v45 = HIBYTE(v88);
      else
        v45 = (unint64_t)__p[1];
      v46 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v44, v45);
      v47 = v46;
      v48 = *((_QWORD *)this + 21);
      if (v48)
      {
        v49 = (uint8x8_t)vcnt_s8((int8x8_t)v48);
        v49.i16[0] = vaddlv_u8(v49);
        v50 = v49.u32[0];
        if (v49.u32[0] > 1uLL)
        {
          v2 = v46;
          if (v46 >= v48)
            v2 = v46 % v48;
        }
        else
        {
          v2 = (v48 - 1) & v46;
        }
        v51 = *(void ***)(*v86 + 8 * v2);
        if (v51)
        {
          v52 = (char *)*v51;
          if (*v51)
          {
            do
            {
              v53 = *((_QWORD *)v52 + 1);
              if (v53 == v47)
              {
                if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)v52 + 16, (unsigned __int8 *)__p))
                {
                  goto LABEL_117;
                }
              }
              else
              {
                if (v50 > 1)
                {
                  if (v53 >= v48)
                    v53 %= v48;
                }
                else
                {
                  v53 &= v48 - 1;
                }
                if (v53 != v2)
                  break;
              }
              v52 = *(char **)v52;
            }
            while (v52);
          }
        }
      }
      v52 = (char *)operator new(0x40uLL);
      v54 = (_QWORD *)((char *)this + 176);
      v89 = v52;
      v90 = (TI::CP::TestResultsSummarizer *)((char *)this + 176);
      LOBYTE(v91) = 0;
      v55 = (std::string *)(v52 + 16);
      *(_QWORD *)v52 = 0;
      *((_QWORD *)v52 + 1) = v47;
      if (v43 < 0)
      {
        std::string::__init_copy_ctor_external(v55, v84, (std::string::size_type)v83);
      }
      else
      {
        *(_OWORD *)&v55->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
        *((_QWORD *)v52 + 4) = v88;
      }
      *((_QWORD *)v52 + 5) = 0;
      *((_QWORD *)v52 + 6) = 0;
      *((_QWORD *)v52 + 7) = 0;
      LOBYTE(v91) = 1;
      v56 = (float)(unint64_t)(*((_QWORD *)this + 23) + 1);
      v57 = *((float *)this + 48);
      if (!v48 || (float)(v57 * (float)v48) < v56)
      {
        v58 = 1;
        if (v48 >= 3)
          v58 = (v48 & (v48 - 1)) != 0;
        v59 = v58 | (2 * v48);
        v60 = vcvtps_u32_f32(v56 / v57);
        if (v59 <= v60)
          v61 = v60;
        else
          v61 = v59;
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)v86, v61);
        v48 = *((_QWORD *)this + 21);
        if ((v48 & (v48 - 1)) != 0)
        {
          if (v47 >= v48)
            v2 = v47 % v48;
          else
            v2 = v47;
        }
        else
        {
          v2 = (v48 - 1) & v47;
        }
      }
      v62 = *v86;
      v63 = *(_QWORD **)(*v86 + 8 * v2);
      if (v63)
      {
        *(_QWORD *)v52 = *v63;
      }
      else
      {
        *(_QWORD *)v52 = *v54;
        *v54 = v52;
        *(_QWORD *)(v62 + 8 * v2) = v54;
        if (!*(_QWORD *)v52)
          goto LABEL_116;
        v64 = *(_QWORD *)(*(_QWORD *)v52 + 8);
        if ((v48 & (v48 - 1)) != 0)
        {
          if (v64 >= v48)
            v64 %= v48;
        }
        else
        {
          v64 &= v48 - 1;
        }
        v63 = (_QWORD *)(*v86 + 8 * v64);
      }
      *v63 = v52;
LABEL_116:
      v89 = 0;
      ++*((_QWORD *)this + 23);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>>>>::reset[abi:nn180100]((uint64_t)&v89);
LABEL_117:
      v65 = *((_QWORD *)v52 + 7);
      v66 = *((_QWORD *)v52 + 6);
      if (v66 >= v65)
      {
        v68 = *((_QWORD *)v52 + 5);
        v69 = 0x34F72C234F72C235 * ((uint64_t)(v66 - v68) >> 3);
        if ((unint64_t)(v69 + 1) > 0x11A7B9611A7B961)
          abort();
        v70 = 0x34F72C234F72C235 * ((uint64_t)(v65 - v68) >> 3);
        v71 = 2 * v70;
        if (2 * v70 <= v69 + 1)
          v71 = v69 + 1;
        if (v70 >= 0x8D3DCB08D3DCB0)
          v72 = 0x11A7B9611A7B961;
        else
          v72 = v71;
        v93 = v52 + 56;
        if (v72)
          v72 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v72);
        else
          v73 = 0;
        v89 = (char *)v72;
        v90 = (TI::CP::ContinuousPathTestResult *)(v72 + 232 * v69);
        v91 = v90;
        v92 = v72 + 232 * v73;
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v90, a2);
        v91 = (TI::CP::ContinuousPathTestResult *)((char *)v91 + 232);
        std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)v52 + 5, &v89);
        v67 = *((_QWORD *)v52 + 6);
        std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v89);
      }
      else
      {
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*((TI::CP::ContinuousPathTestResult **)v52 + 6), a2);
        v67 = v66 + 232;
        *((_QWORD *)v52 + 6) = v66 + 232;
      }
      *((_QWORD *)v52 + 6) = v67;
      if (SHIBYTE(v88) < 0)
        operator delete(__p[0]);

LABEL_132:
      v74 = *((_QWORD *)this + 30);
      v75 = *((_QWORD *)this + 29);
      if (v75 < v74)
      {
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*((TI::CP::ContinuousPathTestResult **)this + 29), a2);
        v76 = v75 + 232;
        *((_QWORD *)this + 29) = v75 + 232;
LABEL_144:
        *((_QWORD *)this + 29) = v76;
        goto LABEL_145;
      }
      v77 = *((_QWORD *)this + 28);
      v78 = 0x34F72C234F72C235 * ((uint64_t)(v75 - v77) >> 3);
      if ((unint64_t)(v78 + 1) <= 0x11A7B9611A7B961)
      {
        v79 = 0x34F72C234F72C235 * ((uint64_t)(v74 - v77) >> 3);
        v80 = 2 * v79;
        if (2 * v79 <= v78 + 1)
          v80 = v78 + 1;
        if (v79 >= 0x8D3DCB08D3DCB0)
          v81 = 0x11A7B9611A7B961;
        else
          v81 = v80;
        v93 = (char *)this + 240;
        if (v81)
          v81 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v81);
        else
          v82 = 0;
        v89 = (char *)v81;
        v90 = (TI::CP::ContinuousPathTestResult *)(v81 + 232 * v78);
        v91 = v90;
        v92 = v81 + 232 * v82;
        TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v90, a2);
        v91 = (TI::CP::ContinuousPathTestResult *)((char *)v91 + 232);
        std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)this + 28, &v89);
        v76 = *((_QWORD *)this + 29);
        std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v89);
        goto LABEL_144;
      }
LABEL_148:
      abort();
    }
  }
}

void sub_22FA704C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  void *v21;
  void *v22;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>>>>::reset[abi:nn180100]((uint64_t)&a21);
  if (a20 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

TI::CP::ContinuousPathTestResult *TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(TI::CP::ContinuousPathTestResult *this, const TI::CP::ContinuousPathTestResult *a2)
{
  const KB::CandidateCollection *v4;
  KB::CandidateCollection *v5;
  __int128 v6;
  __int128 v7;
  _QWORD *v8;
  const TI::CP::ContinuousPathTestResult *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  char *v13;
  BOOL v14;
  const char *v15;
  const char *v16;
  uint64_t **v17;
  const TI::CP::ContinuousPathTestResult *v18;
  const TI::CP::ContinuousPathTestResult *v19;
  __int128 v20;
  uint64_t *v22[3];
  _QWORD *v23;

  v4 = (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 40);
  *(_DWORD *)this = *(_DWORD *)a2;
  v5 = (TI::CP::ContinuousPathTestResult *)((char *)this + 40);
  MEMORY[0x2348A87C0]((char *)this + 8);
  KB::CandidateCollection::CandidateCollection(v5, v4);
  v6 = *((_OWORD *)a2 + 9);
  v7 = *((_OWORD *)a2 + 10);
  *((_QWORD *)this + 23) = 0;
  v8 = (_QWORD *)((char *)this + 184);
  *((_QWORD *)this + 22) = (char *)this + 184;
  *((_OWORD *)this + 9) = v6;
  *((_OWORD *)this + 10) = v7;
  *((_QWORD *)this + 24) = 0;
  v9 = (const TI::CP::ContinuousPathTestResult *)*((_QWORD *)a2 + 22);
  if (v9 != (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 184))
  {
    do
    {
      v10 = (_QWORD *)*v8;
      v11 = (_QWORD *)((char *)this + 184);
      if (*((_QWORD **)this + 22) == v8)
        goto LABEL_14;
      v12 = (_QWORD *)*v8;
      v13 = (char *)this + 184;
      if (v10)
      {
        do
        {
          v11 = v12;
          v12 = (_QWORD *)v12[1];
        }
        while (v12);
      }
      else
      {
        do
        {
          v11 = (_QWORD *)*((_QWORD *)v13 + 2);
          v14 = *v11 == (_QWORD)v13;
          v13 = (char *)v11;
        }
        while (v14);
      }
      v15 = v11[5] ? (const char *)v11[5] : (const char *)(v11 + 6);
      v16 = *((_QWORD *)v9 + 5) ? (const char *)*((_QWORD *)v9 + 5) : (char *)v9 + 48;
      if (strcmp(v15, v16) < 0)
      {
LABEL_14:
        if (v10)
        {
          v23 = v11;
          v17 = (uint64_t **)(v11 + 1);
        }
        else
        {
          v23 = (_QWORD *)((char *)this + 184);
          v17 = (uint64_t **)((char *)this + 184);
        }
      }
      else
      {
        v17 = (uint64_t **)std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_equal<KB::String>((uint64_t)this + 176, &v23, (uint64_t)v9 + 32);
      }
      if (!*v17)
      {
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__construct_node<std::pair<KB::String const,TI::CP::Path> const&>((uint64_t)v22, (uint64_t)this + 176, (uint64_t)v9 + 32);
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at((uint64_t **)this + 22, (uint64_t)v23, v17, v22[0]);
        v22[0] = 0;
        std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100]((uint64_t *)v22);
      }
      v18 = (const TI::CP::ContinuousPathTestResult *)*((_QWORD *)v9 + 1);
      if (v18)
      {
        do
        {
          v19 = v18;
          v18 = *(const TI::CP::ContinuousPathTestResult **)v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          v19 = (const TI::CP::ContinuousPathTestResult *)*((_QWORD *)v9 + 2);
          v14 = *(_QWORD *)v19 == (_QWORD)v9;
          v9 = v19;
        }
        while (!v14);
      }
      v9 = v19;
    }
    while (v19 != (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 184));
  }
  v20 = *(_OWORD *)((char *)a2 + 200);
  *(_OWORD *)((char *)this + 212) = *(_OWORD *)((char *)a2 + 212);
  *(_OWORD *)((char *)this + 200) = v20;
  return this;
}

void sub_22FA7074C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, KB::String *a9, uint64_t a10)
{
  KB::String::~String(a9);
  _Unwind_Resume(a1);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v72;
  unint64_t v73;

  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      v8 = a1[2];
      v7 = a1[3];
      v9 = __ROR8__(v6 + v7, 52);
      v10 = v6 + a1[1];
      v11 = __ROR8__(v10, 7);
      v12 = v10 + v8;
      v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      v15 = __ROR8__(v14 + v13, 52);
      v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      v17 = __ROR8__(v13, 37);
      v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      v19 = __ROR8__(v18, 7);
      v20 = v16 + __ROR8__(v12, 31);
      v21 = v18 + v5;
      v22 = v21 + v14;
      v23 = 0x9AE16A3B2F90404FLL;
      v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    v4 = 0x9DDFEA08EB382D69;
    v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    v39 = v35 + v37;
    v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    v42 = v36 + a2 + v35 + v32;
    v43 = v42 + v33;
    v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    v46 = v45 + v34 + v37;
    v47 = __ROR8__(v46, 44);
    v48 = v46 + v38;
    v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    v51 = *a1;
    v50 = a1 + 4;
    v52 = v51 - 0x4B6D499041670D8DLL * v33;
    v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      v54 = *(v50 - 3);
      v55 = v52 + v43 + v39 + v54;
      v56 = v50[2];
      v57 = v50[3];
      v58 = v50[1];
      v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      v59 = v41 + v48;
      v60 = *(v50 - 2);
      v61 = *(v50 - 1);
      v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      v63 = v62 + v48 + v61;
      v64 = v62 + v54 + v60;
      v43 = v64 + v61;
      v65 = __ROR8__(v64, 44) + v62;
      v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      v44 = v65 + __ROR8__(v63 + v66, 21);
      v67 = v52 + v49 + *v50;
      v48 = v67 + v58 + v56 + v57;
      v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      v41 = v66;
      v53 += 64;
    }
    while (v53);
    v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    v26 = a1[1];
    v27 = 0xB492B66FBE98F273 * *a1;
    v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    v23 = 0x9DDFEA08EB382D69;
    v30 = 0x9DDFEA08EB382D69 * (v29 ^ (v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)));
    v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      v23 = 0x9DDFEA08EB382D69;
      v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    v4 = 0x9AE16A3B2F90404FLL;
    if (!a2)
      return v4;
    v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL std::equal_to<std::string>::operator()[abi:nn180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;
  BOOL v13;
  _BOOL8 v14;

  v2 = a1[23];
  if ((v2 & 0x80u) == 0)
    v3 = a1[23];
  else
    v3 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v3 != v4)
    return 0;
  if (v5 < 0)
    a2 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80) != 0)
    return memcmp(*(const void **)a1, a2, *((_QWORD *)a1 + 1)) == 0;
  if (!a1[23])
    return 1;
  v6 = v2 - 1;
  do
  {
    v8 = *a1++;
    v7 = v8;
    v10 = *a2++;
    v9 = v10;
    v12 = v6-- != 0;
    v13 = v7 == v9;
    v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>>>>::reset[abi:nn180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<TI::CP::ContinuousPathTestResult>>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<TI::CP::ContinuousPathTestResult>>,0>(uint64_t a1)
{
  void **v2;

  v2 = (void **)(a1 + 24);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](void ***a1)
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
        v4 -= 232;
        std::__destroy_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,0>(uint64_t a1)
{
  void **v2;

  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(*(_QWORD **)(a1 + 184));
  v2 = (void **)(a1 + 112);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  v2 = (void **)(a1 + 88);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  v2 = (void **)(a1 + 64);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  v2 = (void **)(a1 + 40);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  KB::String::~String((KB::String *)(a1 + 8));
}

void std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(*a1);
    std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(a1[1]);
    std::__destroy_at[abi:nn180100]<std::pair<KB::String const,TI::CP::Path>,0>((KB::String *)(a1 + 4));
    operator delete(a1);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<KB::String const,TI::CP::Path>,0>(KB::String *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {
    *((_QWORD *)this + 8) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
  }
  KB::String::~String(this);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(unint64_t a1)
{
  if (a1 >= 0x11A7B9611A7B962)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(232 * a1);
}

uint64_t std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *a1;
  v4 = a1[1];
  result = a2[1];
  while (v4 != v5)
  {
    v4 -= 232;
    result = std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>(result - 232, v4);
  }
  a2[1] = result;
  v7 = *a1;
  *a1 = result;
  a2[1] = v7;
  v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 232;
    std::__destroy_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,0>(i - 232);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  KB::String::String();
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 96) = 0;
  *(_QWORD *)(a2 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a2 + 112) = 0;
  *(_QWORD *)(a2 + 120) = 0;
  *(_QWORD *)(a2 + 128) = 0;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  v4 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v4;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  v5 = (_QWORD *)(a2 + 184);
  v6 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 184) = v6;
  v7 = a1 + 184;
  v8 = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 192) = v8;
  if (v8)
  {
    *(_QWORD *)(v6 + 16) = v7;
    *(_QWORD *)(a2 + 176) = v5;
    *v5 = 0;
    *(_QWORD *)(a2 + 192) = 0;
  }
  else
  {
    *(_QWORD *)(a1 + 176) = v7;
  }
  v9 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 212) = *(_OWORD *)(a2 + 212);
  *(_OWORD *)(a1 + 200) = v9;
  return a1;
}

std::vector<unsigned int> *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__construct_node<std::pair<KB::String const,TI::CP::Path> const&>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  std::vector<unsigned int> *result;

  v5 = a2 + 8;
  v6 = (char *)operator new(0x70uLL);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = 0;
  MEMORY[0x2348A87C0](v6 + 32, a3);
  result = TI::CP::Path::Path((std::vector<unsigned int> *)(v6 + 64), (const std::vector<unsigned int> *)(a3 + 32));
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

void sub_22FA710F8(_Unwind_Exception *a1)
{
  uint64_t *v1;
  KB::String *v2;

  KB::String::~String(v2);
  std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

void std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100](uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((_BYTE *)a1 + 16))
      std::__destroy_at[abi:nn180100]<std::pair<KB::String const,TI::CP::Path>,0>((KB::String *)(v1 + 32));
    operator delete((void *)v1);
  }
}

_QWORD *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_equal<KB::String>(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  const char *v6;
  _QWORD *v7;
  _QWORD *v8;
  const char *v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    if (*(_QWORD *)(a3 + 8))
      v6 = *(const char **)(a3 + 8);
    else
      v6 = (const char *)(a3 + 16);
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = (_QWORD *)v4[5];
        v9 = (const char *)(v8 ? v8 : v7 + 6);
        if ((strcmp(v6, v9) & 0x80000000) == 0)
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_15;
      }
      if ((strcmp(v9, v6) & 0x80000000) == 0)
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
LABEL_15:
  *a2 = v7;
  return v5;
}

uint64_t TI::CP::TestResultsSummarizer::summarize_results(uint64_t a1, const char *a2, const char *a3)
{
  const char *v3;
  const char *v4;
  unsigned int v6;
  unsigned int v7;
  double v8;
  unsigned int v9;
  unsigned int v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  unint64_t v19;
  int *v20;
  int *v21;
  KB::Candidate *v22;
  const char *v23;
  int v24;
  int v25;
  const char *v26;
  const char *v27;
  unsigned int v28;
  double v29;
  unsigned int v30;
  double v31;
  double v32;
  double v33;
  uint64_t result;
  uint64_t *i;
  const char *v36;
  __int16 v37;
  const char *v38;
  _QWORD v39[3];

  v3 = a3;
  v4 = a2;
  v39[2] = *MEMORY[0x24BDAC8D0];
  v6 = *(_DWORD *)(a1 + 72);
  v7 = *(_DWORD *)(a1 + 92);
  v8 = (double)v7;
  v9 = *(_DWORD *)(a1 + 76) + v6;
  v10 = *(_DWORD *)(a1 + 80) + v9;
  *(_DWORD *)(a1 + 76) = v9;
  *(_DWORD *)(a1 + 80) = v10;
  v11 = a3;
  if (a3[23] < 0)
    v11 = *(const char **)a3;
  v12 = (double)v9;
  v13 = a2;
  if (a2[23] < 0)
    v13 = *(const char **)a2;
  v14 = v12 * 100.0;
  printf("%s %s top candidate hit rate: %f%%, %g%% (%d/%d)\n", v11, v13, (double)v6 * 100.0 / v8, 100.0 - (double)v6 * 100.0 / v8, v6, v7);
  v15 = v3;
  if (v3[23] < 0)
    v15 = *(const char **)v3;
  v16 = v4;
  if (v4[23] < 0)
    v16 = *(const char **)v4;
  printf("%s %s top-4 candidate hit rate: %f%%, %g%% (%d/%d)\n", v15, v16, v14 / v8, 100.0 - v14 / v8, *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 92));
  v17 = v3;
  if (v3[23] < 0)
    v17 = *(const char **)v3;
  v18 = v4;
  if (v4[23] < 0)
    v18 = *(const char **)v4;
  printf("%s %s top-40 candidate hit rate: %f%%, %g%% (%d/%d)\n", v17, v18, (double)v10 * 100.0 / v8, 100.0 - (double)v10 * 100.0 / v8, *(_DWORD *)(a1 + 80), *(_DWORD *)(a1 + 92));
  if (*(_BYTE *)(a1 + 96))
  {
    printf("top1 path saved: %g/%g (%g%% of total)\n", *(double *)(a1 + 104), *(double *)(a1 + 120), *(double *)(a1 + 104) * 100.0 / *(double *)(a1 + 120));
    printf("top3 path saved: %g/%g (%g%% of total)\n", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 112) * 100.0 / *(double *)(a1 + 120));
  }
  if (*(_BYTE *)(a1 + 128))
  {
    puts("Failing cases:");
    v20 = *(int **)(a1 + 136);
    v21 = *(int **)(a1 + 144);
    while (v20 != v21)
    {
      v22 = (KB::Candidate *)*((_QWORD *)v20 + 5);
      if (v22 == *((KB::Candidate **)v20 + 6))
        MEMORY[0x2348A87B4](&v37, "(null)");
      else
        KB::Candidate::capitalized_string(v22);
      if (*((_WORD *)v20 + 4))
      {
        v23 = (const char *)*((_QWORD *)v20 + 2);
        if (!v23)
          v23 = (const char *)(v20 + 6);
      }
      else
      {
        v23 = "";
      }
      v25 = *v20;
      v20 += 58;
      v24 = v25;
      v26 = v38;
      if (!v38)
        v26 = (const char *)v39;
      if (v37)
        v27 = v26;
      else
        v27 = "";
      printf("[%d] expected='%s' observed='%s'\n", v24, v23, v27);
      KB::String::~String((KB::String *)&v37);
    }
    putchar(10);
  }
  v28 = *(_DWORD *)(a1 + 304);
  LODWORD(v19) = *(_DWORD *)(a1 + 92);
  v29 = (double)v19;
  v30 = *(_DWORD *)(a1 + 296);
  if (v3[23] < 0)
    v3 = *(const char **)v3;
  v31 = (double)v28 * 100.0 / v29;
  v32 = (double)v30 * 100.0 / v29;
  v33 = (double)*(unsigned int *)(a1 + 300) * 100.0 / v29;
  if (v4[23] < 0)
    v4 = *(const char **)v4;
  result = printf("%s %s Confidence hit rate: %f%% (%d), false-low-conf: %f%% (%d), false-high-conf: %f%% (%d))\n", v3, v4, v31, v28, v32, v30, v33, *(_DWORD *)(a1 + 300));
  if (*(_BYTE *)(a1 + 97))
  {
    for (i = *(uint64_t **)(a1 + 176); i; i = (uint64_t *)*i)
    {
      v36 = (const char *)(i + 2);
      if (*((char *)i + 39) < 0)
        v36 = *(const char **)v36;
      printf("algo: %s, helped: %lu\n", v36, 0x34F72C234F72C235 * ((i[6] - i[5]) >> 3));
    }
    printf("base recognizer index matches top1: %lu\n", 0x34F72C234F72C235 * ((uint64_t)(*(_QWORD *)(a1 + 56) - *(_QWORD *)(a1 + 48)) >> 3));
    printf("base recognizer index is higher than top1: %lu\n", 0x34F72C234F72C235 * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3));
    return printf("top1 not in base recognizer: %lu\n", 0x34F72C234F72C235 * ((uint64_t)(*(_QWORD *)(a1 + 32) - *(_QWORD *)(a1 + 24)) >> 3));
  }
  return result;
}

uint64_t TI::CP::TestResultsSummarizer::dump_match_indices(TI::CP::TestResultsSummarizer *this)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  int v6;

  v1 = (unsigned int *)*((_QWORD *)this + 31);
  v2 = (unsigned int *)*((_QWORD *)this + 32);
  while (v1 != v2)
  {
    v4 = *v1++;
    v3 = v4;
    v5 = v4 + 48;
    if (v4 >= 0xA)
      v5 = 62;
    if (v3 == -1)
      v6 = 109;
    else
      v6 = v5;
    putchar(v6);
  }
  return putchar(10);
}

double TI::CP::TestResultsSummarizer::calculate_total_rank_score(TI::CP::TestResultsSummarizer *this, double a2, double a3)
{
  LODWORD(a3) = *((_DWORD *)this + 23);
  return *((double *)this + 34) / (double)*(unint64_t *)&a3;
}

uint64_t TI::CP::get_touch_stage()
{
  if ((TI::CP::operator==() & 1) != 0)
    return 0;
  if (TI::CP::operator==())
    return 2;
  return 1;
}

unsigned int *TI::CP::make_candidate_refinery(unsigned int **a1, uint64_t a2)
{
  unsigned int *v2;
  unsigned int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unsigned int *result;
  std::__shared_weak_count *v10;
  unsigned int *v11;

  v2 = *a1;
  v11 = *a1;
  if (*a1)
  {
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 + 1, v2));
  }
  v4 = *(std::__shared_weak_count **)(a2 + 8);
  v10 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  KB::NgramCandidateRefinery::create();
  if (v10)
  {
    v7 = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  result = v11;
  if (v11)
    return WTF::RefCounted<KB::DictionaryContainer>::deref(v11);
  return result;
}

void sub_22FA717E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, unsigned int *a12)
{
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a10);
  if (a12)
    WTF::RefCounted<KB::DictionaryContainer>::deref(a12);
  _Unwind_Resume(a1);
}

void TI::CP::createAndLoadDictionaryContainerMultiLexicon(TI::CP *this@<X0>, NSString *a2@<X1>, NSString *a3@<X2>, float a4@<S0>, void ***a5@<X8>)
{
  TI::CP *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char *v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  void **v23[22];
  uint64_t v24;
  _BYTE v25[32];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[32];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[8];

  v34[6] = *MEMORY[0x24BDAC8D0];
  v10 = this;
  v11 = a2;
  v12 = a3;
  if (v12)
  {
    UIKeyboardDynamicDictionaryFile();
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    UIKeyboardDynamicDictionaryFile();
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }
  TI::CP::getLexiconInfo(v10, v13, 1.0 - a4, (uint64_t)v30);
  TI::CP::getLexiconInfo((TI::CP *)v11, v14, a4, (uint64_t)v25);
  KB::LexiconInfo::LexiconInfo((uint64_t)v23, (uint64_t)v30);
  KB::LexiconInfo::LexiconInfo((uint64_t)&v24, (uint64_t)v25);
  v21 = 0;
  v15 = (char *)operator new(0x160uLL);
  v16 = 0;
  v17 = 0;
  v20 = v15;
  v22 = v15 + 352;
  do
  {
    v18 = v16;
    v15 = (char *)(KB::LexiconInfo::LexiconInfo((uint64_t)v15, (uint64_t)&v23[22 * v17]) + 176);
    v16 = 1;
    v17 = 1;
  }
  while ((v18 & 1) == 0);
  v21 = v15;
  v19 = 44;
  do
  {
    KB::String::~String((KB::String *)&v23[v19 - 6]);
    KB::String::~String((KB::String *)&v23[v19 - 10]);
    KB::String::~String((KB::String *)&v23[v19 - 14]);
    KB::String::~String((KB::String *)&v23[v19 - 18]);
    KB::String::~String((KB::String *)&v23[v19 - 22]);
    v19 -= 22;
  }
  while (v19 * 8);
  KB::DictionaryContainer::create_multilexicon();
  *a5 = v23[0];
  v23[0] = (void **)&v20;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](v23);
  KB::String::~String((KB::String *)&v29);
  KB::String::~String((KB::String *)&v28);
  KB::String::~String((KB::String *)&v27);
  KB::String::~String((KB::String *)&v26);
  KB::String::~String((KB::String *)v25);
  KB::String::~String((KB::String *)v34);
  KB::String::~String((KB::String *)&v33);
  KB::String::~String((KB::String *)&v32);
  KB::String::~String((KB::String *)&v31);
  KB::String::~String((KB::String *)v30);

}

void sub_22FA71A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;

  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&a13);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a57);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&STACK[0x230]);

  _Unwind_Resume(a1);
}

void TI::CP::getLexiconInfo(TI::CP *this@<X0>, NSString *a2@<X1>, float a3@<S0>, uint64_t a4@<X8>)
{
  TI::CP *v8;
  KB *v9;
  KB *v10;
  KB *v11;
  KB *v12;
  int v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  TI::CP *v20;

  v8 = this;
  v19 = a2;
  UIKeyboardStaticUnigramsFile();
  v9 = (KB *)objc_claimAutoreleasedReturnValue();
  deltaUnigramsFilePathForInputMode((uint64_t)v8);
  v10 = (KB *)objc_claimAutoreleasedReturnValue();
  phrasesFilePathForInputMode((uint64_t)v8);
  v11 = (KB *)objc_claimAutoreleasedReturnValue();
  dynamicFilePathForInputMode(v8, v19);
  v12 = (KB *)objc_claimAutoreleasedReturnValue();
  v20 = objc_retainAutorelease(v8);
  -[TI::CP UTF8String](v20, "UTF8String");
  v13 = TILexiconIDForLocaleIdentifier();
  KB::utf8_string(v20, v14);
  KB::utf8_string(v9, v15);
  KB::utf8_string(v10, v16);
  KB::utf8_string(v11, v17);
  KB::utf8_string(v12, v18);
  *(_DWORD *)(a4 + 160) = v13;
  *(_BYTE *)(a4 + 164) = 0;
  *(float *)(a4 + 168) = a3;

}

void sub_22FA71C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  KB::String *v9;
  void *v10;
  void *v11;
  void *v12;
  KB::String *v13;
  void *v14;
  void *v15;
  KB::String *v16;
  KB::String *v17;

  KB::String::~String(v9);
  KB::String::~String(v17);
  KB::String::~String(v16);
  KB::String::~String(v13);

  _Unwind_Resume(a1);
}

void TI::CP::createAndLoadLanguageModelContainer(TI::CP *this@<X0>, NSString *a2@<X1>, NSString *a3@<X2>, float a4@<S0>, _OWORD *a5@<X8>)
{
  NSString *v10;
  NSString *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD *v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  uint64_t v46;
  std::__shared_weak_count *v47;
  _QWORD v48[6];
  std::__shared_weak_count *v49;
  void *v50;
  std::__shared_weak_count *v51;
  _BYTE v52[40];
  uint64_t v53;
  std::__shared_weak_count *v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  void *__p[2];
  _QWORD v58[7];
  _QWORD v59[7];

  v59[6] = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  TI::CP::createAndLoadLanguageModel(this, v11, &v55);
  TI::CP::createAndLoadLanguageModel((TI::CP *)v10, v11, &v53);
  v48[5] = v55;
  v49 = v56;
  if (v56)
  {
    p_shared_owners = (unint64_t *)&v56->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup();
  if (v49)
  {
    v14 = &v49->__shared_owners_;
    do
      v15 = __ldaxr((unint64_t *)v14);
    while (__stlxr(v15 - 1, (unint64_t *)v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
  v44 = v53;
  v45 = v54;
  if (v54)
  {
    v16 = (unint64_t *)&v54->__shared_owners_;
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup();
  if (v45)
  {
    v18 = &v45->__shared_owners_;
    do
      v19 = __ldaxr((unint64_t *)v18);
    while (__stlxr(v19 - 1, (unint64_t *)v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  (*(void (**)(void **__return_ptr))(*(_QWORD *)v55 + 48))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v50, 1.0 - a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  (*(void (**)(void **__return_ptr))(*(_QWORD *)v53 + 48))(__p);
  KB::LanguageModelLexiconGroup::set_lexicon_weight((KB::LanguageModelLexiconGroup *)&v46, a4);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  __p[0] = v50;
  __p[1] = v51;
  if (v51)
  {
    v20 = (unint64_t *)&v51->__shared_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  std::unordered_map<unsigned int,float>::unordered_map((uint64_t)v58, (uint64_t)v52);
  v58[5] = v46;
  v58[6] = v47;
  if (v47)
  {
    v22 = (unint64_t *)&v47->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  std::unordered_map<unsigned int,float>::unordered_map((uint64_t)v59, (uint64_t)v48);
  v42 = 0;
  v24 = operator new(0x70uLL);
  v25 = 0;
  v26 = 0;
  v41 = v24;
  v43 = v24 + 14;
  do
  {
    v27 = v25;
    v24 = std::construct_at[abi:nn180100]<KB::LanguageModelLexiconGroup,KB::LanguageModelLexiconGroup const&,KB::LanguageModelLexiconGroup*>(v24, &__p[7 * v26])+ 7;
    v25 = 1;
    v26 = 1;
  }
  while ((v27 & 1) == 0);
  v42 = v24;
  v28 = 112;
  do
  {
    std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)&v52[v28 + 32]);
    std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&v52[v28 + 16]);
    v28 -= 56;
  }
  while (v28);
  KB::LanguageModelContainer::create((uint64_t *)__p, (uint64_t)&v41);
  *a5 = *(_OWORD *)__p;
  __p[0] = &v41;
  std::vector<KB::LanguageModelLexiconGroup>::__destroy_vector::operator()[abi:nn180100]((void ***)__p);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)v48);
  v29 = v47;
  if (v47)
  {
    v30 = (unint64_t *)&v47->__shared_owners_;
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)v52);
  v32 = v51;
  if (v51)
  {
    v33 = (unint64_t *)&v51->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }
  v35 = v54;
  if (v54)
  {
    v36 = (unint64_t *)&v54->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v38 = v56;
  if (v56)
  {
    v39 = (unint64_t *)&v56->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }

}

void sub_22FA720BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,char a33,uint64_t a34,void *__p,uint64_t a36)
{
  void *v36;
  void *v37;

  std::vector<KB::LanguageModelLexiconGroup>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)&a17);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a15);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::~__hash_table((uint64_t)&a26);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a24);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a31);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&a33);

  _Unwind_Resume(a1);
}

void TI::CP::createAndLoadLanguageModel(TI::CP *this@<X0>, NSString *a2@<X1>, _QWORD *a3@<X8>)
{
  TI::CP *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  CFTypeRef v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef v17[2];
  CFTypeRef v18[2];
  __int128 v19;
  __int128 v20;
  int v21;
  CFTypeRef cf;
  CFTypeRef v23;
  CFTypeRef v24;
  CFTypeRef v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = this;
  v7 = a2;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doesSupportInlineCompletion");
  KB::LanguageModelConfig::LanguageModelConfig();
  v11 = operator new();
  v14 = cf;
  if (cf)
  {
    CFRetain(cf);
    v14 = cf;
  }
  v15 = v23;
  if (v23)
  {
    CFRetain(v23);
    v15 = v23;
  }
  v16 = v24;
  if (v24)
  {
    CFRetain(v24);
    v16 = v24;
  }
  v12 = *(_OWORD *)v25;
  *(_OWORD *)v25 = 0u;
  *(_OWORD *)v17 = v12;
  v13 = v26;
  v26 = 0u;
  *(_OWORD *)v18 = v13;
  v19 = v27;
  v20 = v28;
  v21 = v29;
  MEMORY[0x2348A86AC](v11, &v14);
  std::shared_ptr<KB::LanguageModel>::shared_ptr[abi:nn180100]<KB::LanguageModelStr,void>(a3, v11);
  if (v18[1])
    CFRelease(v18[1]);
  v18[1] = 0;
  if (v18[0])
    CFRelease(v18[0]);
  v18[0] = 0;
  if (v17[1])
    CFRelease(v17[1]);
  v17[1] = 0;
  if (v17[0])
    CFRelease(v17[0]);
  v17[0] = 0;
  if (v16)
    CFRelease(v16);
  v16 = 0;
  if (v15)
    CFRelease(v15);
  v15 = 0;
  if (v14)
    CFRelease(v14);
  v14 = 0;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)*a3 + 72))(*a3, 1);
  if (*((_QWORD *)&v26 + 1))
    CFRelease(*((CFTypeRef *)&v26 + 1));
  *((_QWORD *)&v26 + 1) = 0;
  if ((_QWORD)v26)
    CFRelease((CFTypeRef)v26);
  *(_QWORD *)&v26 = 0;
  if (v25[1])
    CFRelease(v25[1]);
  v25[1] = 0;
  if (v25[0])
    CFRelease(v25[0]);
  v25[0] = 0;
  if (v24)
    CFRelease(v24);
  v24 = 0;
  if (v23)
    CFRelease(v23);
  v23 = 0;
  if (cf)
    CFRelease(cf);

}

void sub_22FA724B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CFTypeRef a13, CFTypeRef cf, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;

  if (cf)
    CFRelease(cf);
  if (a13)
    CFRelease(a13);
  MEMORY[0x2348A8A24](v30, 0x10F1C40F828255FLL);
  KB::LanguageModelConfig::~LanguageModelConfig((KB::LanguageModelConfig *)&a25);

  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<KB::LanguageModel>::shared_ptr[abi:nn180100]<KB::LanguageModelStr,void>(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t v8;
  unint64_t *p_shared_weak_owners;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;

  *a1 = a2;
  v4 = (std::__shared_weak_count *)operator new();
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_24FD48E00;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  v6 = (_QWORD *)(a2 + 152);
  if (a2)
  {
    v7 = *(std::__shared_weak_count **)(a2 + 160);
    if (v7)
    {
      if (v7->__shared_owners_ != -1)
        return a1;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
      p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
      do
        v10 = __ldxr(p_shared_weak_owners);
      while (__stxr(v10 + 1, p_shared_weak_owners));
      *v6 = a2;
      *(_QWORD *)(a2 + 160) = v4;
      std::__shared_weak_count::__release_weak(v7);
    }
    else
    {
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
      v12 = (unint64_t *)&v4->__shared_weak_owners_;
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
      *v6 = a2;
      *(_QWORD *)(a2 + 160) = v4;
    }
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

void sub_22FA72690(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<KB::LanguageModelStr *,std::shared_ptr<KB::LanguageModel>::__shared_ptr_default_delete<KB::LanguageModel,KB::LanguageModelStr>,std::allocator<KB::LanguageModelStr>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2348A8A24);
}

uint64_t std::__shared_ptr_pointer<KB::LanguageModelStr *,std::shared_ptr<KB::LanguageModel>::__shared_ptr_default_delete<KB::LanguageModel,KB::LanguageModelStr>,std::allocator<KB::LanguageModelStr>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void TI::CP::createAndLoadDictionaryContainer(TI::CP *this@<X0>, NSString *a2@<X1>, _QWORD *a3@<X8>)
{
  TI::CP *v6;
  NSString *v7;
  NSString *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  void **v14;
  _BYTE v15[32];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[32];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[7];

  v24[6] = *MEMORY[0x24BDAC8D0];
  v6 = this;
  v7 = a2;
  if (v7)
  {
    UIKeyboardDynamicDictionaryFile();
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  TI::CP::getLexiconInfo(v6, v8, 1.0, (uint64_t)v20);
  KB::LexiconInfo::LexiconInfo((uint64_t)v15, (uint64_t)v20);
  v9 = (char *)operator new(0xB0uLL);
  v10 = v9 + 176;
  v12[0] = v9;
  v12[2] = v9 + 176;
  KB::LexiconInfo::LexiconInfo((uint64_t)v9, (uint64_t)v15);
  v12[1] = v10;
  KB::DictionaryContainer::create_multilexicon();
  v11 = v13;
  v13 = 0;
  v14 = (void **)v12;
  *a3 = v11;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v14);
  KB::String::~String((KB::String *)&v19);
  KB::String::~String((KB::String *)&v18);
  KB::String::~String((KB::String *)&v17);
  KB::String::~String((KB::String *)&v16);
  KB::String::~String((KB::String *)v15);
  KB::String::~String((KB::String *)v24);
  KB::String::~String((KB::String *)&v23);
  KB::String::~String((KB::String *)&v22);
  KB::String::~String((KB::String *)&v21);
  KB::String::~String((KB::String *)v20);

}

void sub_22FA7286C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22FA72AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1073(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1074(uint64_t a1)
{

}

void TI::CP::CPTestCaseParamTrainer::~CPTestCaseParamTrainer(TI::CP::CPTestCaseParamTrainer *this)
{
  uint64_t v2;

  *(_QWORD *)this = &off_24FD48910;
  v2 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  TI::CP::CPTrainer::~CPTrainer(this);
}

{
  uint64_t v2;

  *(_QWORD *)this = &off_24FD48910;
  v2 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  TI::CP::CPTrainer::~CPTrainer(this);
  JUMPOUT(0x2348A8A24);
}

void TI::CP::CPTestCaseParamTrainer::evaluate_params(uint64_t a1, int a2, __int128 *a3, uint64_t *a4)
{
  uint64_t v5;
  int v6;
  _BYTE v7[92];

  v5 = *(_QWORD *)(a1 + 80);
  if (*(_QWORD *)(v5 + 192))
  {
    v6 = 0;
    TI::CP::CPTestCaseEval::evaluate_tests(v5, &v6, 0, (uint64_t)a3, 0, (uint64_t)v7);
    TI::CP::TestResultsSummarizer::dump_match_indices((TI::CP::TestResultsSummarizer *)v7);
    TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v7);
  }
  else
  {
    TI::CP::CPTrainer::evaluate_params(a1, a2, a3, a4);
  }
}

void TI::CP::TestResultsSummarizer::~TestResultsSummarizer(TI::CP::TestResultsSummarizer *this)
{
  void *v2;
  void **v3;

  v2 = (void *)*((_QWORD *)this + 31);
  if (v2)
  {
    *((_QWORD *)this + 32) = v2;
    operator delete(v2);
  }
  v3 = (void **)((char *)this + 224);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = (void **)((char *)this + 200);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::~__hash_table((uint64_t)this + 160);
  v3 = (void **)((char *)this + 136);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = (void **)((char *)this + 48);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = (void **)((char *)this + 24);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = (void **)this;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v3);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::~__hash_table(uint64_t a1)
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
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::vector<TI::CP::ContinuousPathTestResult>>,0>((uint64_t)(v2 + 2));
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

void TI::CP::CPTrainer::~CPTrainer(TI::CP::CPTrainer *this)
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;

  *(_QWORD *)this = &off_24FD49160;
  v2 = (char *)this + 48;
  v3 = (char *)*((_QWORD *)this + 9);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
LABEL_6:
  v6 = (void **)((char *)this + 16);
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&v6);
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
}

{
  TI::CP::CPTrainer::~CPTrainer(this);
  JUMPOUT(0x2348A8A24);
}

void std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = v2;
    if (v4 != v2)
    {
      do
        TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase((TI::CP::ContinuousPathTestCase *)(v4 - 240));
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

TI::CP::CPTrainer *TI::CP::CPTestCaseParamTrainer::CPTestCaseParamTrainer(TI::CP::CPTrainer *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  TI::CP::CPTrainer::CPTrainer(a1);
  *(_QWORD *)a1 = &off_24FD48910;
  *((_QWORD *)a1 + 10) = 0;
  v7 = operator new();
  TI::CP::CPTestCaseEval::CPTestCaseEval(v7, v5, v6);
  v8 = *((_QWORD *)a1 + 10);
  *((_QWORD *)a1 + 10) = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);

  return a1;
}

void sub_22FA735DC(_Unwind_Exception *a1)
{
  void *v1;
  TI::CP::CPTrainer *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v5 = v4;
  MEMORY[0x2348A8A24](v5, 0x10F3C40A4669BAFLL);
  v7 = *((_QWORD *)v2 + 10);
  *((_QWORD *)v2 + 10) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  TI::CP::CPTrainer::~CPTrainer(v2);

  _Unwind_Resume(a1);
}

TI::CP::CPTrainer *TI::CP::CPTestCaseParamTrainer::CPTestCaseParamTrainer(TI::CP::CPTrainer *a1, void *a2, void *a3, void *a4)
{
  NSString *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  TI::CP::CPTrainer::CPTrainer(a1);
  *(_QWORD *)a1 = &off_24FD48910;
  *((_QWORD *)a1 + 10) = 0;
  v10 = operator new();
  TI::CP::CPTestCaseEval::CPTestCaseEval(v10, v7, v8, v9);
  v11 = *((_QWORD *)a1 + 10);
  *((_QWORD *)a1 + 10) = v10;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);

  return a1;
}

void sub_22FA736F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  TI::CP::CPTrainer *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v6 = v5;
  MEMORY[0x2348A8A24](v6, 0x10F3C40A4669BAFLL);
  v8 = *((_QWORD *)v3 + 10);
  *((_QWORD *)v3 + 10) = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  TI::CP::CPTrainer::~CPTrainer(v3);

  _Unwind_Resume(a1);
}

double _validateAlpha(double a1)
{
  double v1;
  BOOL v2;
  double result;

  v1 = 1.0;
  if (a1 <= 1.0)
    v1 = a1;
  v2 = a1 < 0.0;
  result = 0.0;
  if (!v2)
    return v1;
  return result;
}

void sub_22FA77890(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA77A54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22FA77CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_22FA782A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,id a41,char a42)
{
  void *v42;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a42, 8);

  _Unwind_Resume(a1);
}

void sub_22FA78778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_22FA78B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i;
  size_t v2;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3;

  i = this->__i_;
  v2 = (i + 1) % 0x270;
  v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return ((_DWORD)i << 15) & 0xEFC60000 ^ i ^ ((((_DWORD)i << 15) & 0xEFC60000 ^ i) >> 18);
}

__n128 __Block_byref_object_copy__1349(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_22FA78E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id conversationToJsonArray(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "toJsonDict", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id conversationFromJsonArray(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        +[TTKConversationMessage fromJsonDict:](TTKConversationMessage, "fromJsonDict:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id conversationTestsFromJsonArray(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        +[TTKConversationTest fromJsonDict:](TTKConversationTest, "fromJsonDict:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id conversationTestsToJsonArray(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "toJsonDict", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

void sub_22FA79B34(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1507(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1508(uint64_t a1)
{

}

void _TIBeginMockingProactiveQuickTypeManager()
{
  TIProactiveQuickTypeManagerMock *v0;

  v0 = objc_alloc_init(TIProactiveQuickTypeManagerMock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB5428], "performSelector:withObject:", sel_setSharedTIProactiveQuickTypeManager_, v0);

}

uint64_t _TIEndMockingProactiveQuickTypeManager()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(MEMORY[0x24BEB5428], "performSelector:withObject:", sel_setSharedTIProactiveQuickTypeManager_, 0);
  return result;
}

uint64_t _TIGetMockLanguageLikelihoodModel()
{
  return objc_msgSend(MEMORY[0x24BEB5488], "sharedLanguageLikelihoodModel");
}

void _TIBeginMockingLanguageLikelihoodModel()
{
  TILanguageLikelihoodModelStub *v0;

  v0 = objc_alloc_init(TILanguageLikelihoodModelStub);
  _TIBeginMockingLanguageLikelihoodModelWithModel(v0);

}

void _TIBeginMockingLanguageLikelihoodModelWithModel(void *a1)
{
  id v1;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB5488], "performSelector:withObject:", sel_setSharedLanguageLikelihoodModel_, v1);

}

uint64_t _TIEndMockingLanguageLikelihoodModel()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(MEMORY[0x24BEB5488], "performSelector:withObject:", sel_setSharedLanguageLikelihoodModel_, 0);
  return result;
}

uint64_t isInputModeAvailable()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  MEMORY[0x2348A84CC]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348A84D8]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        availableInputModes();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = objc_msgSend(v7, "containsObject:", v6, (_QWORD)v9);

        if ((v6 & 1) != 0)
        {
          v3 = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

id read_wordlist(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a1, 4, &v17);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v17;
  if (v1)
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("\n"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isEqualToString:", &stru_24FD49B78, (_QWORD)v13) & 1) == 0)
          {
            +[AutocorrectionTest testWithInput:](AutocorrectionTest, "testWithInput:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id read_unigrams_dictionary(void *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  unigramsPathForInputMode(a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v18 = v2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v2, 4, &v21);
    v4 = objc_claimAutoreleasedReturnValue();
    v16 = v21;
    v17 = (void *)v4;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isAtEnd") & 1) == 0)
    {
      do
      {
        v20 = 0;
        objc_msgSend(v5, "scanUpToString:intoString:", CFSTR(" : "), &v20);
        v6 = v20;
        v19 = 0;
        objc_msgSend(v5, "scanUpToString:intoString:", CFSTR("\n"), &v19);
        v7 = v19;
        v8 = v6;
        v9 = objc_msgSend(v7, "rangeOfString:", CFSTR("s="));
        v11 = v8;
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v7, "substringWithRange:", v9 + 2, objc_msgSend(v7, "length") - (v9 + v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v22[0] = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[AutocorrectionTest testWithInput:expectedOutput:](AutocorrectionTest, "testWithInput:expectedOutput:", v8, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v13);
      }
      while (!objc_msgSend(v5, "isAtEnd"));
    }

    v14 = v17;
    v2 = v18;
  }
  else
  {
    v3 = 0;
    v14 = 0;
  }

  return v3;
}

id read_textfile(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a1, 4, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __read_textfile_block_invoke;
    v6[3] = &unk_24FD48C00;
    v4 = v3;
    v7 = v4;
    objc_msgSend(v2, "enumerateLinesUsingBlock:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id read_typologyInfo(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v30 = (id)v2;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = v1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v8)
    {
      v9 = v8;
      v29 = v1;
      v10 = 0;
      v31 = *(_QWORD *)v33;
      do
      {
        v11 = 0;
        v12 = v10;
        do
        {
          if (*(_QWORD *)v33 != v31)
            objc_enumerationMutation(v7);
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v11));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "objectForKey:", CFSTR("TouchKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqual:", CFSTR(" ")))
          {
            v14 = (void *)objc_msgSend(v4, "copy");
            v15 = (void *)objc_msgSend(v6, "copy");
            +[AutocorrectionTest testWithTouches:expectedOutput:](AutocorrectionTest, "testWithTouches:expectedOutput:", v14, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v30, "addObject:", v16);
            objc_msgSend(v6, "setString:", &stru_24FD49B78);
            objc_msgSend(v4, "removeAllObjects");
          }
          else
          {
            objc_msgSend(v6, "appendString:", v13);
            objc_msgSend(v10, "valueForKeyPath:", CFSTR("TouchPoint.X"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "floatValue");
            v19 = v18;
            objc_msgSend(v10, "valueForKeyPath:", CFSTR("TouchPoint.Y"));
            v20 = v7;
            v21 = v9;
            v22 = v6;
            v23 = v4;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "floatValue");
            +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", v19, v25);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = v23;
            v6 = v22;
            v9 = v21;
            v7 = v20;

            objc_msgSend(v4, "addObject:", v16);
          }

          ++v11;
          v12 = v10;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v9);

      v1 = v29;
    }

    if (objc_msgSend(v4, "count"))
    {
      v36 = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[AutocorrectionTest testWithTouches:expectedOutput:](AutocorrectionTest, "testWithTouches:expectedOutput:", v4, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "addObject:", v27);
    }

  }
  return v30;
}

id read_candidates(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a1, 4, &v33);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v33;
  v3 = v2;
  if (!v1)
  {
    v28 = 0;
    goto LABEL_18;
  }
  v24 = v2;
  v25 = v1;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (!v6)
    goto LABEL_16;
  v7 = v6;
  v8 = &stru_24FD49B78;
  v9 = *(_QWORD *)v30;
  v10 = CFSTR("|");
  v11 = 0x24BDD1000uLL;
  v26 = *(_QWORD *)v30;
  do
  {
    v12 = 0;
    v27 = v7;
    do
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v5);
      v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
      if ((objc_msgSend(v13, "isEqualToString:", v8) & 1) == 0)
      {
        objc_msgSend(*(id *)(v11 + 1192), "characterSetWithCharactersInString:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "count") == 2)
        {
          objc_msgSend(v15, "objectAtIndex:", 0);
          v16 = v8;
          v17 = v5;
          v18 = v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndex:", 1);
          v20 = v11;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[AutocorrectionTest testWithInput:expectedOutput:](AutocorrectionTest, "testWithInput:expectedOutput:", v19, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v20;
          v10 = v18;
          v5 = v17;
          v8 = v16;
          v9 = v26;
          v7 = v27;
          goto LABEL_12;
        }
        if (objc_msgSend(v15, "count") == 1)
        {
          +[AutocorrectionTest testWithInput:expectedOutput:](AutocorrectionTest, "testWithInput:expectedOutput:", CFSTR("\n"), &unk_24FD5FD20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
          objc_msgSend(v28, "addObject:", v22);

        }
      }
      ++v12;
    }
    while (v7 != v12);
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  }
  while (v7);
LABEL_16:

  v3 = v24;
  v1 = v25;
LABEL_18:

  return v28;
}

id availableInputModes()
{
  if (availableInputModes_onceToken != -1)
    dispatch_once(&availableInputModes_onceToken, &__block_literal_global_1830);
  return (id)availableInputModes_modes;
}

void __availableInputModes_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("ja_JP-50On"), CFSTR("ja_JP"), CFSTR("zh_Hant-HWR"), CFSTR("zh_Hans-HWR"), CFSTR("zh_CN"), CFSTR("zh_Hant-Cangjie"), CFSTR("zh_Hans-Wubihua"), CFSTR("zh_Hant-Wubihua"), CFSTR("zh_TW"), 0);
  v1 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v2 = (void *)availableInputModes_modes;
  availableInputModes_modes = (uint64_t)v1;

  objc_msgSend(MEMORY[0x24BEB4D50], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedInputModeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __availableInputModes_block_invoke_2;
  v6[3] = &unk_24FD48C48;
  v7 = v0;
  v5 = v0;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __availableInputModes_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend((id)availableInputModes_modes, "addObject:", v3);

}

void __read_textfile_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a2;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("\t"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v7, "setNumberStyle:", 1);
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberFromString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR("\t"));
        v11 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v11;
LABEL_7:
        v14 = v12;
        +[AutocorrectionTest testWithInput:andCorpusId:](AutocorrectionTest, "testWithInput:andCorpusId:", v12, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

        goto LABEL_8;
      }
    }
    v12 = v14;
    goto LABEL_7;
  }
LABEL_8:

}

id unigramsPathForInputMode(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v17 = a2;
  MEMORY[0x2348A84CC]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348A84D8]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unigrams-%@.words"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "stringByAppendingPathComponent:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

        if (v14)
        {
          v15 = v12;

          v8 = v15;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id read_nefile(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a1, 4, &v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __read_nefile_block_invoke;
  v6[3] = &unk_24FD48C00;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v1, "enumerateLinesUsingBlock:", v6);

  return v4;
}

id read_portrait_nefile(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  FILE *v7;
  const char *v8;
  id v9;
  id v10;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v2, 4, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (!v3)
  {
    v7 = (FILE *)*MEMORY[0x24BDAC8D8];
    v8 = (const char *)objc_msgSend(objc_retainAutorelease(v1), "cStringUsingEncoding:", 4);
    objc_msgSend(v4, "localizedDescription");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v7, "Error: Unable to parse JSON config file '%s': %s\n\n", v8, (const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4));

    exit(1);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE51D18], "filteredNamedEntitiesFromJSONDonations:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

id read_mock_contactsfile(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a1, 4, &v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __read_mock_contactsfile_block_invoke;
  v6[3] = &unk_24FD48C00;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v1, "enumerateLinesUsingBlock:", v6);

  return v4;
}

id read_contactsfile(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a1, 4, &v8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v8;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB5368]), "initWithRelevanceScoreType:", 1);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __read_contactsfile_block_invoke;
  v6[3] = &unk_24FD48C00;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v1, "enumerateLinesUsingBlock:", v6);

  return v4;
}

void __read_contactsfile_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a2;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BEB5360]);
    objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGivenName:", v8);

    objc_msgSend(v6, "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFamilyName:", v9);

    objc_msgSend(v6, "objectAtIndex:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    *(float *)&v11 = v11;
    objc_msgSend(v7, "setRelevancyScore:", v11);

    objc_msgSend(v7, "setHasRelevancyScore:", 1);
    objc_msgSend(*(id *)(a1 + 32), "addContact:", v7);

  }
}

void __read_mock_contactsfile_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  TIMockContact *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a2;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(","));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(TIMockContact);
    objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMockContact setFirstName:](v7, "setFirstName:", v8);

    objc_msgSend(v6, "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMockContact setLastName:](v7, "setLastName:", v9);

    objc_msgSend(v6, "objectAtIndex:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    *(float *)&v11 = v11;
    -[TIMockContact setRelevancyScore:](v7, "setRelevancyScore:", v11);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

void __read_nefile_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a2;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t print_usage()
{
  FILE **v0;

  v0 = (FILE **)MEMORY[0x24BDAC8E8];
  fwrite("Usage: autocorrection_tester [-l language] [-p params_file | -j json_params_file] [-t textfile | -T TTKTestCase_file | -s candidate_sentence_file | -z data_driven_test_file] [-c [threshold]]\n", 0xBFuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8E8]);
  fwrite("-V\tShow version and exit\n\n", 0x1AuLL, 1uLL, *v0);
  fwrite("-j\t", 3uLL, 1uLL, *v0);
  fwrite("\tJSON parameter file. JSON format for config parameters - uses same paramters as -p options:\n\n", 0x5EuLL, 1uLL, *v0);
  fwrite("-p\t", 3uLL, 1uLL, *v0);
  fwrite("\tParameter file. This file can specify any of the following values:\n\n", 0x45uLL, 1uLL, *v0);
  fwrite("Config Options with Overrides:\n", 0x1FuLL, 1uLL, *v0);
  fwrite("-d\t", 3uLL, 1uLL, *v0);
  fwrite("\tDICT: Directory path to TextInput project containing the unigram data files.\n\n", 0x4FuLL, 1uLL, *v0);
  fwrite("-w\t", 3uLL, 1uLL, *v0);
  fwrite("\tWORDS: Path to wordlist file. One word to a line.\n\n", 0x34uLL, 1uLL, *v0);
  fwrite("-t\t", 3uLL, 1uLL, *v0);
  fwrite("\tTEXT: Path to text file. Format may be arbitrary text.\n\n", 0x39uLL, 1uLL, *v0);
  fwrite("-T, --testcase", 0xEuLL, 1uLL, *v0);
  fwrite("\tTESTCASE: Path to test case file or directory. Format is TTKTestCase, or a directory with layout files and subdirectory of test cases.\n\n", 0x89uLL, 1uLL, *v0);
  fwrite("-s\t", 3uLL, 1uLL, *v0);
  fwrite("\tCANDIDATE_SENTENCES: Candidate sentence file. Each line is input and expected output pair, separated by a '|' character.\n\n", 0x7BuLL, 1uLL, *v0);
  fwrite("-l\t", 3uLL, 1uLL, *v0);
  fwrite("\tKEYBOARD_LANGUAGE. If dictionary path is specified, and language is not, the default is all languages.\n\n", 0x69uLL, 1uLL, *v0);
  fwrite("-u\t", 3uLL, 1uLL, *v0);
  fwrite("\tTYPOLOGY: Path to touch file. Format is determined by Typology.\n\n", 0x42uLL, 1uLL, *v0);
  fwrite("-z\t", 3uLL, 1uLL, *v0);
  fwrite("\tPath to data-drvien test file.\n\n", 0x21uLL, 1uLL, *v0);
  fwrite("-c [threshold]\t", 0xFuLL, 1uLL, *v0);
  fwrite("\tUSE_PARTFILE: Serialize intermediate results to disk to reduce memory usage. \n\t\tPass an optional number to override the default serialization threshold PARTFILE_FLUSH_THRESHOLD (500).\n\n", 0xBAuLL, 1uLL, *v0);
  fwrite("-a\t", 3uLL, 1uLL, *v0);
  fwrite("\tADDRESSBOOK: Path to contacts file. Format is comma-separated values with three fields per line - first name, surname, probability.\n\n", 0x86uLL, 1uLL, *v0);
  fwrite("-n\t", 3uLL, 1uLL, *v0);
  fwrite("\tNAMEDENTITIES: Path to name entities file. Format is one named entity per line.\n\n", 0x52uLL, 1uLL, *v0);
  fwrite("\tPORTRAIT_NAMEDENTITIES: Path to name entities json file with portrait metadata (sources, algorithms, creation timestamps).\n\n", 0x7DuLL, 1uLL, *v0);
  fwrite("-P personaName\n", 0xFuLL, 1uLL, *v0);
  fwrite("\tPERSONA: Persona to use to morph keyboard input.\n\n", 0x33uLL, 1uLL, *v0);
  fwrite("-W width\t", 9uLL, 1uLL, *v0);
  fwrite("\tKEYBOARD_WIDTH --\n\t\tKeyboard width (iPhone5 portrait = 320).  Default is 320.\n\n", 0x50uLL, 1uLL, *v0);
  fwrite("-O orientation\t", 0xFuLL, 1uLL, *v0);
  fwrite("\tKEYBOARD_ORIENTATION --\n\t\tKeyboard orientation: 'Portrait' or 'Landscape'.  Default is 'Portrait'.\n\n", 0x65uLL, 1uLL, *v0);
  fwrite("-o\t", 3uLL, 1uLL, *v0);
  fwrite("\tOUTPATH: Output directory\n\n", 0x1CuLL, 1uLL, *v0);
  fwrite("-i\t", 3uLL, 1uLL, *v0);
  fwrite("\tSTART_INDEX: Index of first test case to run. Default is 1 (all test cases).\n\n", 0x4FuLL, 1uLL, *v0);
  fwrite("-N\t", 3uLL, 1uLL, *v0);
  fwrite("\tEND_INDEX: Index of last test case to run. Default is NIL (all test cases).\n\n", 0x4EuLL, 1uLL, *v0);
  fwrite("-f\t", 3uLL, 1uLL, *v0);
  fwrite("\tPRINT_TYPING_TRANSCRIPT: Print each steps action/keytap and resulting text state to stdout.\n\n", 0x5EuLL, 1uLL, *v0);
  fwrite("-C\t", 3uLL, 1uLL, *v0);
  fwrite("\tSHOW_CANDIDATE_BAR: Print the candidate bar before each step to stdout.\n\n", 0x4AuLL, 1uLL, *v0);
  fwrite("-x\t", 3uLL, 1uLL, *v0);
  fwrite("\tTRANSLITERATION_SUMMARIES: For transliteration modes, at the end of each test case, print the Latin stdout, the intended native script text, and the actual native script text to stdout.\n\n", 0xBCuLL, 1uLL, *v0);
  fwrite("-b\t", 3uLL, 1uLL, *v0);
  fwrite("\tPLAYBACK: Path to playback JSON file in keyboardanalytics testcase format.\n\n", 0x4DuLL, 1uLL, *v0);
  fwrite("Conversation Config Options (provide via -j):\n", 0x2EuLL, 1uLL, *v0);
  fwrite("\tCONVERSATIONS_TEST_FILE: Path to conversations file (json format).\n\n", 0x45uLL, 1uLL, *v0);
  fwrite("\tCONVERSATION_SENDERS_TO_TEST: List of senders to test typing for. Only messages from these senders will generate results in the output. Messages from other senders will only influence adaptation.\n\n", 0xC6uLL, 1uLL, *v0);
  fwrite("\tCONVERSATION_ADAPT_TO_SENT_MESSAGES: Adapt to sent messages in conversations. Requires USES_ADAPTATION set to true.\n\n", 0x76uLL, 1uLL, *v0);
  fwrite("\tCONVERSATION_ADAPT_TO_RECEIVED_MESSAGES: Adapt to received messages in conversations. Requires USES_ADAPTATION set to true.\n\n", 0x7EuLL, 1uLL, *v0);
  fwrite("Rest of Config Options:\n", 0x18uLL, 1uLL, *v0);
  fwrite("\t\tNUM_TRIALS --\n\t\tThe number of independent trials to run.  Default is 1.\n\n", 0x4BuLL, 1uLL, *v0);
  fwrite("\t\tSPACE_HORIZONTAL_ERROR_BIAS --\n\t\tIf 0, use the horizontal space key center for touch error calculation. If 1, distribute the horizontal origin along the width of the space bar (with margins equal to 1/2 key height; If 2, bias the horizontal origin to the right "
    "side of the space bar. If 3, bias the horizontal origin to the left side of the space bar. \x13Default is 1.\n"
    "\n",
    0x172uLL,
    1uLL,
    *v0);
  fwrite("\t\tSPACE_VERTICAL_ERROR_BIAS --\n\t\tA bias to be applied to the space bar touch error calculation to simulate suspected user behavior. Expressed as a fraction of the key height (e.g., .5 would bias to the top of the space bar).\n\n", 0xE2uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SPACE_INSTEAD_OF_BOTTOM_ROW --\n\t\tProbability of half-key height added to a bottom key tap in the spacebar direction. Limited by MAX_SPACE_ERRORS_PER_TEST\n\n", 0xA2uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SPACE_REPLACED_BY_BOTTOM_ROW --\n\t\tProbability of half-key height subtracted from a space bar tap in the direction of the bottom key row. Limited by MAX_SPACE_ERRORS_PER_TEST. Use SPACE_HORIZONTAL_ERROR_BIAS=1 to get realistic substitutions.\n\n", 0xF9uLL, 1uLL, *v0);
  fwrite("\t\tMAX_SPACE_ERRORS_PER_TEST --\n\t\t Max count of cumulative errors using PROB_SPACE_INSTEAD_OF_BOTTOM_ROW and PROB_SPACE_REPLACED_BY_BOTTOM_ROW settings. \n\n", 0x9AuLL, 1uLL, *v0);
  fwrite("\t\tWORD_LEARNING_ENABLED --\n\t\tIf nonzero, the keyboard performs online adaptation to typing.  Default is 0.\n\n", 0x6CuLL, 1uLL, *v0);
  fwrite("\t\tNEGATIVE_LEARNING_ENABLED --\n\t\tIf nonzero, the keyboard performs negative learning in response to rejected autocorrections.  Default is 0.\n\n", 0x8EuLL, 1uLL, *v0);
  fwrite("\t\tUSES_ADAPTATION --\n\t\tReplaces deprecated 'USE_WORD_NGRAM_MODEL_ADAPTATION'. If nonzero, adaptation resources are loaded and used in beam search and to compute probabilities. If 'WORD_LEARNING_ENABLED' switch is on, it implies that 'USES_ADAPTATION' switch is on too. Otherwise, default is 0.\n\n", 0x127uLL, 1uLL, *v0);
  fwrite("\t\tUSE_LANGUAGE_MODEL --\n\t\tUse this flag to override UIKeyboardHasWordNgramModel value from InputMode_xx.plist.\n\n", 0x70uLL, 1uLL, *v0);
  fwrite("\t\tUSE_WORD_NGRAM_MODEL --\n\t\tDeprecated, see USE_LANGUAGE_MODEL instead.\n\n", 0x49uLL, 1uLL, *v0);
  fwrite("\t\tTOUCAN_LM_MODE --\n\t\tControls to which extent new generation neural lm with open vocabulary is enabled (requires presence of respective LM assets on the system or passed via custom path). If 0, 'Toucan' lm is disabled. If 1, 'Toucan' lm is enabled for completions/predictions. If 2, 'Toucan' lm is enabled for autocorrections.\n\n", 0x149uLL, 1uLL, *v0);
  fwrite("\t\tMAX_WORDS_PER_PREDICTION --\n\t\tMaximum words predidicted when autocorrection lists enabled.  Default is 1.\n\n", 0x6DuLL, 1uLL, *v0);
  fwrite("\t\tMAX_PREDICTIONS_REPORTED --\n\t\tMaximum prediction to report for every key stroke.  Default is 0, in  which case nothing is reported\n\n", 0x86uLL, 1uLL, *v0);
  fwrite("\t\tMAX_INLINE_COMPLETIONS_REPORTED --\n\t\tMaximum inline completions to report for every key stroke.  Default is 0, in  which case nothing is reported\n\n", 0x95uLL, 1uLL, *v0);
  fwrite("\t\tLOG_DOCUMENT_CONTEXT --\n\t\tInclude document context before each input in the output report.  Default is NO.\n\n", 0x6EuLL, 1uLL, *v0);
  fwrite("\t\tKEYSTROKE_SEGMENTATION_MODE --\n\t\tSpecify mode for segmenting keystrokes according to intended tokens: 'none', 'typinglog', 'alignment'. Default is 'typinglog'.\n\n", 0xA3uLL, 1uLL, *v0);
  fwrite("\t\tWARN_IF_SELECTING_POPUP_VARIANT --\n\t\tIf nonzero, warn when typer selects a popup variant (may indicate keyboard layout mis-configuration).  Default is 0.\n\n", 0x9DuLL, 1uLL, *v0);
  fwrite("\t\tSIRI_MODE --\n\t\tIf nonzero, run in SIRI MODE (aka as if invoked from type-to-siri).  Default is 0.\n\n", 0x65uLL, 1uLL, *v0);
  fwrite("\t\tUSE_AUTOCORRECTION --\n\t\tIf nonzero, enable autocorrection.  Default is 1.\n\n", 0x4DuLL, 1uLL, *v0);
  fwrite("\t\tUSE_RETROCORRECTION --\n\t\tIf nonzero, enable retrocorrection.  Default is 0.\n\n", 0x4FuLL, 1uLL, *v0);
  fwrite("\t\tUSE_AUTOCAPITALIZATION --\n\t\tIf nonzero, use autocapitalization.  Default is 1.\n\n", 0x52uLL, 1uLL, *v0);
  fwrite("\t\tUSE_PREDICTION --\n\t\tIf nonzero, enabled predictions and completions.  Default is 0.\n\n", 0x57uLL, 1uLL, *v0);
  fwrite("\t\tAUTOCORRECTION_LISTS --\n\t\tDEPRECATED in favor of USE_PREDICTION.\n\n", 0x44uLL, 1uLL, *v0);
  fwrite("\t\tMAX_PREDICTIONS --\n\t\tMaximum number of predictions displayed in UI.  Default is 3.\n\n", 0x56uLL, 1uLL, *v0);
  fwrite("\t\tMULTILINGUAL_ENABLED --\n\t\tIf nonzero, enable multilingual keyboards.  Default is 0.\n\n", 0x57uLL, 1uLL, *v0);
  fwrite("\t\tKEYBOARD_SECOND_LANGUAGE --\n\t\t.If multilingual enabled, manually configure second langauge, i.e. 'fr_FR', 'de_DE'. Default is None.\n\n", 0x87uLL, 1uLL, *v0);
  fwrite("\t\tBASE_KEY_FOR_VARIANTS --\n\t\tIf nonzero, type base letter if diacritic variant is not available.  Default is 1.\n\n", 0x71uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_TRANSLITERATION--\n\t\tIf nonzero, typing model user types transliteration and chooses native words from prediction bar. The input is expected in playback or tansliterated formats. Default is 0.\n\n", 0xCBuLL, 1uLL, *v0);
  fwrite("\t\tUSE_PARTIAL_CANDIDATES --\n\t\tIf nonzero, the transliteration model will attempt to select partial candidates if the intended string is not visible. Only valid when transliteration is enabled. Default is 0.\n\n", 0xD0uLL, 1uLL, *v0);
  fwrite("\t\tTEST_SENTENCE_TRANSLITERATION--\n\t\tIf nonzero, the expected input and its transliteration will be combined into a single word with no spaces, so the sentence is just the catentation of its words. Default is 0.\n\n", 0xD4uLL, 1uLL, *v0);
  fwrite("\t\tTRANSLITERATE_WITH_SPACES--\n\t\tSet to 1 when transliterating a language that uses spaces to separate words/syllables (languages other than Chinese/Japanese/Thai).\n\n", 0xA5uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_CONTINUOUS_PATH--\n\t\tIf nonzero, typing model user prefers to enter text using continuous path.  Default is 0.\n\n", 0x79uLL, 1uLL, *v0);
  fwrite("\t\tCONTINUOUS_PATH_ENABLED--\n\t\tIf YES, enable continuous path playback. Default is YES.", 0x56uLL, 1uLL, *v0);
  fwrite("\t\tCONTINUOUS_PATH_GENERATOR--\n\t\tString representing the preferred path generator. Valid values are \"TYPIST\" or \"SIMPLE\". Used only if PREFERS_CONTINUOUS_PATH is non-zero. If not set, then the default SIMPLE generator is used.\n\n", 0xE3uLL, 1uLL, *v0);
  fwrite("\t\tCONTINUOUS_PATH_APPEND_SPACE--\n\t\tIf nonzero, a space is automatically appended to each continuous path conversion. Otherwise, space is prepended prior to conversion, if necessary. Default is 0.\n\n", 0xC5uLL, 1uLL, *v0);
  fwrite("\t\tCONTINUOUS_PATH_ALGORITHMS--\n\t\tA number describing the bitmask of enabled algorithms for continuous path. Fav=1, ML=2, ShapeMatch=4, StoreShapes=8, ChineseML=16. Default is Favonius only.\n\n", 0xBFuLL, 1uLL, *v0);
  fwrite("\t\tENABLE_CONTINUOUS_PATH_RETROCORRECTION--\n\t\tEnable retrocorrection for continuous path input. Default=YES.\n\n", 0x6DuLL, 1uLL, *v0);
  fwrite("\t\tALPHA--\n\t\tfloat value [0.0, 1.0]. The knot parameterization used in TTKTypistContinuousPathGenerator. Used only if CONTINUOUS_PATH_GENERATOR is \"TYPIST\". If not set, then the default centripetal value (0.5) is used.\n\n", 0xDBuLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_PREDICTION_SELECTION --\n\t\tIf nonzero, typing model user prefers to select candidates from prediction bar UI.  Default is 0.\n\n", 0x87uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_AUTOCORRECTION_LISTS --\n\t\tDEPRECATED in favor of PREFERS_PREDICTION_SELECTION.\n\n", 0x5AuLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_SPACEBAR_DOUBLETAP --\n\t\tIf nonzero, typing model prefers spacebar double-tap to end sentence (TODO: Not yet implemented!).  Default is 0.\n\n", 0x95uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_TO_CORRECT_ERRORS --\n\t\tIf nonzero, typer prefers to correct errors by backspacing or rejecting autocorrections.  Default is YES.\n\n", 0x8CuLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_AUTOCORRECT_WITH_REVISION --\n\t\tIf YES, will prefer to use autocorrection but will revise manually if autocorrection is bad. Equivalent to PREFERS_TO_CORRECT_ERRORS=YES, PROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR=1.0, PROB_REJECT_BAD_AUTOCORRECTION=1 and overrides other values.\n\n", 0x122uLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_AUTOCORRECT_FOR_CAPS --\n\t\tIf nonzero, typer prefers to rely on autocorrect for capitalizing words.  Default is 0.\n\n", 0x7DuLL, 1uLL, *v0);
  fwrite("\t\tPREFERS_AUTOCORRECT_FOR_APOSTROPHES --\n\t\tIf nonzero, typer prefers to rely on autocorrect for inserting word-medial apostrophes.  Default is 0.\n\n", 0x93uLL, 1uLL, *v0);
  fwrite("\t\tAVERAGE_KEY_TAPS_PER_SECOND --\n\t\tThe average number of key taps per second.  Default is 5/sec (~60wpm).\n\n", 0x6BuLL, 1uLL, *v0);
  fwrite("\t\tMAX_PRIOR_SEGMENTS_CHECKED_FOR_ERRORS --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the maximum input segments prior to current segment checked by typist for errors.  Default is 2.\n\n", 0xB1uLL, 1uLL, *v0);
  fwrite("\t\tPROB_BEGIN_CORRECTING_AFTER_WORD --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of starting to correct a typo before typing a word terminator.  Default is 0.0.\n\n", 0xABuLL, 1uLL, *v0);
  fwrite("\t\tPROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of starting to correct typos after a word terminator.  Default is 0.0.\n\n", 0xADuLL, 1uLL, *v0);
  fwrite("\t\tPROB_REJECT_BAD_AUTOCORRECTION --\n\t\tIf PREFERS_TO_CORRECT_ERRORS=YES, the probability of rejecting a bad autocorrection if the typed string is the intended text.  Default is 0.0\n\n", 0xB5uLL, 1uLL, *v0);
  fwrite("\t\tPROB_TRANSPOSE_LETTERS --\n\t\tProbability that keystrokes for two letters are transposed.  Default is 0.\n\n", 0x6AuLL, 1uLL, *v0);
  fwrite("\t\tPROB_TRANSPOSE_LETTER_AND_SPACE --\n\t\tProbability that keystrokes for letter and space are transposed.  Default is 0.\n\n", 0x78uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SKIP_LETTER --\n\t\tProbability that non-word-initial letter is skipped.  Default is 0.\n\n", 0x5DuLL, 1uLL, *v0);
  fwrite("\t\tPROB_SKIP_REPEAT_LETTER --\n\t\tProbability that repeated letter is skipped.  Default is 0.\n\n", 0x5CuLL, 1uLL, *v0);
  fwrite("\t\tPROB_SKIP_INITIAL_LETTER --\n\t\tProbability that word-initial letter is skipped.  Default is 0.\n\n", 0x61uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SKIP_SPACE --\n\t\tProbability that space key is skipped.  Default is 0.\n\n", 0x4EuLL, 1uLL, *v0);
  fwrite("\t\tPROB_DOUBLE_TAP_LETTER --\n\t\tProbability that non-word-initial letter is doubled.  Default is 0.\n\n", 0x63uLL, 1uLL, *v0);
  fwrite("\t\tPROB_DOUBLE_TAP_INITIAL_LETTER --\n\t\tProbability that word-initial letter is doubled.  Default is 0.\n\n", 0x67uLL, 1uLL, *v0);
  fwrite("\t\tPROB_SUBSTITUTE_LETTER --\n\t\tProbability that some arbitrary key substitutes for non-word-initial letter.  Default is 0.\n\n", 0x7BuLL, 1uLL, *v0);
  fwrite("\t\tPROB_SUBSTITUTE_INITIAL_LETTER --\n\t\tProbability that some arbitrary key substitutes for word-initial letter.  Default is 0.\n\n", 0x7FuLL, 1uLL, *v0);
  fwrite("\t\tPROB_SUBSTITUTE_SPACE --\n\t\tProbability that some arbitrary key substitutes for space.  Default is 0.\n\n", 0x68uLL, 1uLL, *v0);
  fwrite("\t\tPROB_EXTRANEOUS_KEY --\n\t\tProbability that extraneous keystoke is inserted before non-word-initial letter.  Default is 0.\n\n", 0x7CuLL, 1uLL, *v0);
  fwrite("\t\tPROB_EXTRANEOUS_INITIAL_KEY --\n\t\tProbability that extraneous keystroke is inserted before a word-initial letter.  Default is 0.\n\n", 0x83uLL, 1uLL, *v0);
  fwrite("\t\tPROB_EXTRANEOUS_FINAL_KEY --\n\t\tProbability that extraneous keystroke is inserted after a word-final letter.  Default is 0.\n\n", 0x7EuLL, 1uLL, *v0);
  fwrite("\t\tDECOMPOSE_INPUT_STRING --\n\t\tIf nonzero, input text is decomposed prior to typing keys.  Default is 0.\n\n", 0x69uLL, 1uLL, *v0);
  fwrite("\t\tERROR_GENERATOR --\n\t\tThe subclass of TIErrorGenerator that produces errors for the touch inputs.  Each class has its own parameters, as follows.\n\n", 0x94uLL, 1uLL, *v0);
  fwrite("\t\t\tCommon parameters --\n", 0x18uLL, 1uLL, *v0);
  fwrite("\t\t\t\tRNG_SEED_SALT --\n\t\t\t\tA salt for seeding the random number generator seed. Default is 0.\n\n", 0x5DuLL, 1uLL, *v0);
  fwrite("\t\t\t\tREL_ERROR_NUMBERS_PUNCTATION --\n\t\t\t\tRelative error for typing numbers and punctuation (Default=1)\n\n", 0x67uLL, 1uLL, *v0);
  fwrite("\t\t\t\tREL_ERROR_CONTROL_KEYS --\n\t\t\t\tRelative error for typing control keys (Default=1)\n\n", 0x56uLL, 1uLL, *v0);
  fwrite("\t\t\tTIRadialErrorGenerator --\n\t\t\tEach touch is offset at a random angle and distance, selected from one of two ranges.\n\n", 0x77uLL, 1uLL, *v0);
  fwrite("\t\t\t\tDEFAULT_ERROR_RADIAL_MIN_DISTANCE --\n\t\t\t\tThe minimum radial distance around a key centroid to select an error point. Default is 0.\n\n", 0x88uLL, 1uLL, *v0);
  fwrite("\t\t\t\tDEFAULT_ERROR_RADIAL_MAX_DISTANCE --\n\t\t\t\tThe maximum radial distance around a key centroid to select an error point. Within-keyframe max value is 15.\n\n", 0x9BuLL, 1uLL, *v0);
  fwrite("\t\t\t\tLETTER_ERROR_COUNT --\n\t\t\t\tThe number of randomly selected characters to add geometry errors.\n\n", 0x62uLL, 1uLL, *v0);
  fwrite("\t\t\t\tLETTER_ERROR_RADIAL_MIN_DISTANCE --\n\t\t\t\tThe minimum radial distance around a key centroid to select an error point. Default is 0.\n\n", 0x87uLL, 1uLL, *v0);
  fwrite("\t\t\t\tLETTER_ERROR_RADIAL_MAX_DISTANCE --\n\t\t\t\tThe maximum radial distance around a key centroid to select an error point. Recommended value between 15-25.\n\n", 0x9AuLL, 1uLL, *v0);
  fwrite("\t\t\tTIGaussianErrorGenerator --\n\t\t\t(Default) Each touch is offset using independently generated Gaussian noise.\n\n", 0x70uLL, 1uLL, *v0);
  fwrite("\t\t\t\tGAUSSIAN_ERROR_STDDEV_X --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise in the X dimension\n\n", 0x6CuLL, 1uLL, *v0);
  fwrite("\t\t\t\tGAUSSIAN_ERROR_STDDEV_Y --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise in the Y dimension\n\n", 0x6CuLL, 1uLL, *v0);
  fwrite("\t\t\t\tSKEW_STDDEV_X --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise for the skew in the X dimension\n\n", 0x6FuLL, 1uLL, *v0);
  fwrite("\t\t\t\tSKEW_STDDEV_Y --\n\t\t\t\tThe standard deviation (in mm) of the Gaussian noise for the skew in the Y dimension\n\n", 0x6FuLL, 1uLL, *v0);
  fwrite("\t\t\t\tSCALE_ERROR_UNITS_TO_POINTS --\n\t\t\t\tOptional multiplier to use to convert from the standard deviation values to points\n\n", 0x7BuLL, 1uLL, *v0);
  fwrite("\t\tSTEP_COUNT --\n\t\tThe number of steps each variable's sweep range is broken into.\n\n", 0x53uLL, 1uLL, *v0);
  fwrite("\t\tUSER_DIRECTORY --\n\t\tDirectory to store dynamic data like user dictionary and LMs.  KB user dirtectory is the default\n\n", 0x78uLL, 1uLL, *v0);
  fwrite("\t\tCLEAN_USER_DIRECTORY --\n\t\tIf nonzero, USER_DIRECTORY will be recreated upon startup\n\n", 0x57uLL, 1uLL, *v0);
  fwrite("\t\tSAVE_DEBUG_DATA --\n\t\tIf nonzero debug information will be saved with each run\n\n", 0x51uLL, 1uLL, *v0);
  fwrite("\t\tREPORT_AGGD_STATISTICS --\n\t\tCollect Aggd Statistics for each line of input text\n\n", 0x53uLL, 1uLL, *v0);
  fwrite("\t\tTYPOLOGY_OUTPATH --\n\t\tOutput Typology log for each line of input text to this directory\n\n", 0x5BuLL, 1uLL, *v0);
  fwrite("\t\tPATH SIMULATION --\n\t\tContinious Path simulation parameters:\n\n", 0x3FuLL, 1uLL, *v0);
  fwrite("\t\t\t\tCONTINUOUS_PATH_GENERATOR - 'TYPIST' for generating splines and 'SIMPLE' for generating line segment paths. default 'SIMPLE'\n\n", 0x82uLL, 1uLL, *v0);
  fwrite("\t\t\t\tFINGER_KEY_WIDTH_MULTIPLE - defines thinkness of a finger in multiple of key widths. This option affects overshoot - user is assumed to move his finger until he sees a frame of the key he intends to reach. Default is 0, settig it 1 will make for half key width overshoot\n\n", 0x114uLL, 1uLL, *v0);
  fwrite("\t\t\t\tGENERATE_MIDDLE_POINT - If true will make path generator to wonder to deviate from the line segments that connect target points\n\n", 0x85uLL, 1uLL, *v0);
  fwrite("\t\t\t\tMID_POINT_DEV_KEY_HEIGHT_MULTIPLE - how far a middle point is allowed deviate from line segment in key height multiples. default 2.\n\n", 0x89uLL, 1uLL, *v0);
  fwrite("\t\t\t\tPATH_BETA_PARAMETER - controls simmetrical beta distribution for choosing middle points. default 4. Reducing it to 1 results in uniform distribution, increasing it makes distribution center heavy.\n\n", 0xCAuLL, 1uLL, *v0);
  fwrite("\t\t\t\tPATH_NORMAL_KEY_WIDTH_MULTIPLE - controls how far a user misses intended target. By default it's set to 0. Recommended setting 0.4\n\n", 0x88uLL, 1uLL, *v0);
  fwrite("\t\t\t\tCPPATHGEN_TIMING_ALGORITHM - controls how points are placed on the path. EQUIDISTANT will spread point equally. ANGULAR attempts to mimic user by slowing on sharp turns and gaining speed on longer segments\n\n", 0xD3uLL, 1uLL, *v0);
  fwrite("\t\t\t\tCPPATHGEN_ACCELERATION - used for ANGULAR, defaults to 1.6\n\n", 0x40uLL, 1uLL, *v0);
  fwrite("\t\tCUSTOM_STATIC_DICTIONARY_PATH --\n\t\tProvide a path to a custom Unigrams file.\n\n", 0x50uLL, 1uLL, *v0);
  fwrite("\t\tCUSTOM_LANGUAGE_MODEL_PATH --\n\t\tProvide a path to a custom language model bundle. It will be combined with other lm bundles on the system. To override system resources bump 'priority' field in the bundle's info.plist.\n\n", 0xDDuLL, 1uLL, *v0);
  fwrite("\t\tCUSTOM_DYNAMIC_RESOURCE_PATH --\n\t\tProvide a path to a custom language model bundle.\n\n", 0x57uLL, 1uLL, *v0);
  fwrite("\t\t\t\tUSER_PATH_FILE - if given will process and use user paths found in the file\n\n", 0x51uLL, 1uLL, *v0);
  fwrite("\t\tFAVONIUS_LANGUAGE_MODEL_WEIGHT-\n\t\tfloat value [0.0, 1.0]. Weight of language model, used for rescoring candidates. If not set, then the default k_linguistic_context_power value (0.24) is used.\n\n", 0xC4uLL, 1uLL, *v0);
  return fputc(10, *v0);
}

id parseArgs(int a1, char *const *a2)
{
  void *v5;
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const char **v23;
  int v24;
  FILE *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  void *v31;
  char *__endptr;
  stat v33;
  _QWORD v34[4];
  id v35;
  int v36[3];

  if (a1 <= 1)
  {
    print_usage();
    return 0;
  }
  v36[0] = 0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __parseArgs_block_invoke;
  v34[3] = &unk_24FD48BD0;
  v6 = v5;
  v35 = v6;
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2348A8EA4](v34);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("ADDRESSBOOK"), CFSTR("a"), CFSTR("NAMEDENTITIES"), CFSTR("n"), CFSTR("PORTRAIT_NAMEDENTITIES"), CFSTR("n"), CFSTR("DICTS"), CFSTR("d"), CFSTR("WORDS"), CFSTR("w"), CFSTR("TEXT"), CFSTR("t"), CFSTR("TESTCASE"), CFSTR("T"), CFSTR("TYPOLOGY"), CFSTR("u"), CFSTR("CANDIDATE_SENTENCES"),
                  CFSTR("s"),
                  CFSTR("PLAYBACK"),
                  CFSTR("b"),
                  CFSTR("PARAMS"),
                  CFSTR("p"),
                  CFSTR("JSON_CONFIG"),
                  CFSTR("j"),
                  CFSTR("BAD_SENTENCES_FILE_PATH"),
                  CFSTR("B"),
                  0);
  while (2)
  {
    v36[0] = getopt_long(a1, a2, "Vz:d:w:t:T:r:s:l:o:p:u:c:a:n:j:P:S:W:O:i:N:b:B:fCx", (const option *)&parseArgs_long_options, 0);
    if (v36[0] == -1)
    {
      v30 = v6;
      goto LABEL_45;
    }
    memset(&v33, 0, sizeof(v33));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v36, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    switch(v36[0])
    {
      case ':':
        if (*MEMORY[0x24BDAF280] != 122)
          goto LABEL_9;
        goto LABEL_33;
      case 'B':
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAF270], 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v6;
        v14 = v12;
        v15 = CFSTR("BAD_SENTENCES_FILE_PATH");
        goto LABEL_26;
      case 'C':
        v16 = v6;
        v17 = MEMORY[0x24BDBD1C8];
        v18 = CFSTR("SHOW_CANDIDATE_BAR");
        goto LABEL_34;
      case 'N':
        __endptr = 0;
        v19 = strtol((const char *)*MEMORY[0x24BDAF270], &__endptr, 10);
        if (!*__endptr)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v6;
          v14 = v12;
          v15 = CFSTR("END_INDEX");
LABEL_26:
          objc_msgSend(v13, "setValue:forKey:", v14, v15);
LABEL_27:

LABEL_39:
          continue;
        }
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Error: invalid end index: %s\n");
LABEL_44:

        v30 = 0;
LABEL_45:

        return v30;
      case 'O':
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAF270], 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v6;
        v14 = v12;
        v15 = CFSTR("KEYBOARD_ORIENTATION");
        goto LABEL_26;
      case 'P':
        if (*MEMORY[0x24BDAF270])
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAF270], 4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = 0;
        }
        __URLWithPersonaForPersonaName(v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Error: persona does not exist: %s\n");
          goto LABEL_50;
        }
        v26 = v6;
        v27 = v20;
        v28 = CFSTR("PERSONA");
        goto LABEL_38;
      case 'S':
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAF270], 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v6;
        v14 = v12;
        v15 = CFSTR("SENTENCE");
        goto LABEL_26;
      case 'T':
      case 'a':
      case 'b':
      case 'd':
      case 'j':
      case 'n':
      case 'p':
      case 'r':
      case 's':
      case 't':
      case 'u':
      case 'w':
        v9 = *MEMORY[0x24BDAF270];
        objc_msgSend(v31, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = ((uint64_t (**)(_QWORD, uint64_t, void *))v7)[2](v7, v9, v10);

        if ((v9 & 1) == 0)
          goto LABEL_44;
        goto LABEL_39;
      case 'V':
        puts((const char *)objc_msgSend(CFSTR("1.14"), "UTF8String"));
        exit(0);
      case 'W':
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAF270], 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v6;
        v14 = v12;
        v15 = CFSTR("KEYBOARD_WIDTH");
        goto LABEL_26;
      case 'c':
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAF270], 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("USE_PARTFILE"));
        if (!v12)
          goto LABEL_39;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "integerValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setValue:forKey:", v21, CFSTR("PARTFILE_FLUSH_THRESHOLD"));

        goto LABEL_27;
      case 'f':
        v16 = v6;
        v17 = MEMORY[0x24BDBD1C8];
        v18 = CFSTR("PRINT_TYPING_TRANSCRIPT");
        goto LABEL_34;
      case 'i':
LABEL_9:
        __endptr = 0;
        v11 = strtol((const char *)*MEMORY[0x24BDAF270], &__endptr, 10);
        if (*__endptr)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Error: invalid start index: %s\n");
          goto LABEL_44;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v6;
        v14 = v12;
        v15 = CFSTR("START_INDEX");
        goto LABEL_26;
      case 'l':
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAF270], 4);
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_39;
        v12 = (void *)v22;
        v13 = v6;
        v14 = v12;
        v15 = CFSTR("KEYBOARD_LANGUAGE");
        goto LABEL_26;
      case 'o':
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAF270], 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v6;
        v14 = v12;
        v15 = CFSTR("OUTPATH");
        goto LABEL_26;
      case 'x':
        v16 = v6;
        v17 = MEMORY[0x24BDBD1C8];
        v18 = CFSTR("TRANSLITERATION_SUMMARIES");
        goto LABEL_34;
      case 'z':
        if (*MEMORY[0x24BDAF270])
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", *MEMORY[0x24BDAF270], 4);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("RUN_DSL_TEST"));
          if (v20)
          {
            v23 = (const char **)MEMORY[0x24BDAF270];
            v24 = stat((const char *)*MEMORY[0x24BDAF270], &v33);
            v25 = (FILE *)*MEMORY[0x24BDAC8D8];
            if (v24)
            {
              fprintf(v25, "Error: data driven test file does not exist: %s\n");
LABEL_50:
              exit(1);
            }
            fprintf(v25, "data driven test file path: %s\n", *v23);
            v26 = v6;
            v27 = v20;
            v28 = CFSTR("DSL_TEST_FILE");
LABEL_38:
            objc_msgSend(v26, "setValue:forKey:", v27, v28);

          }
        }
        else
        {
LABEL_33:
          v16 = v6;
          v17 = MEMORY[0x24BDBD1C8];
          v18 = CFSTR("RUN_DSL_TEST");
LABEL_34:
          objc_msgSend(v16, "setValue:forKey:", v17, v18);
        }
        goto LABEL_39;
      default:
        fwrite("Error: invalid paramter.\n", 0x19uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
        goto LABEL_44;
    }
  }
}

BOOL __parseArgs_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  FILE *v8;
  id v9;
  const char *v10;
  stat v12;

  v5 = a3;
  memset(&v12, 0, sizeof(v12));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a2, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = stat(a2, &v12);
  v8 = (FILE *)*MEMORY[0x24BDAC8D8];
  v9 = objc_retainAutorelease(v5);
  v10 = (const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4);
  if (v7)
  {
    fprintf(v8, "Error: %s path does not exist: %s\n", v10, a2);
  }
  else
  {
    fprintf(v8, "%s path: %s\n", v10, a2);
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v6, v9);
  }

  return v7 == 0;
}

id read_params(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  const __CFString *v24;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v2, 4);
      if (v3)
      {
        v27 = v2;
        v28 = v1;
        v26 = v3;
        objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("\n"));
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v4)
        {
          v5 = v4;
          v6 = CFSTR("#");
          v7 = *(_QWORD *)v34;
          v8 = 0x24BDD1000uLL;
          v30 = *(_QWORD *)v34;
          do
          {
            v9 = 0;
            v31 = v5;
            do
            {
              if (*(_QWORD *)v34 != v7)
                objc_enumerationMutation(obj);
              v10 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * v9);
              v11 = objc_msgSend(v10, "rangeOfString:", v6);
              if (v11 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v10, "substringToIndex:", v11);
                v12 = objc_claimAutoreleasedReturnValue();

                v10 = (id)v12;
              }
              objc_msgSend(*(id *)(v8 + 1192), "whitespaceCharacterSet");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v14, "isEqualToString:", &stru_24FD49B78) & 1) == 0)
              {
                v15 = v6;
                objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("="));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectAtIndex:", 0);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectAtIndex:", 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v8 + 1192), "whitespaceCharacterSet");
                v19 = v8;
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(v19 + 1192), "whitespaceCharacterSet");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v22);
                v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

                if (v21)
                {
                  if (v23)
                    v24 = v23;
                  else
                    v24 = CFSTR("0");
                  objc_msgSend(v29, "setObject:forKey:", v24, v21);
                }

                v6 = v15;
                v8 = v19;
                v7 = v30;
                v5 = v31;
              }

              ++v9;
            }
            while (v5 != v9);
            v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v5);
        }

        v2 = v27;
        v1 = v28;
      }
    }

  }
  return v29;
}

id getConfigurationOptions(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  FILE *v20;
  const char *v21;
  size_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  FILE *v29;
  const char *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("PARAMS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    read_params(v2);
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  objc_msgSend(v1, "objectForKey:", CFSTR("JSON_CONFIG"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 4, &v40);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v40;
  if (!v7)
  {
    v29 = (FILE *)*MEMORY[0x24BDAC8D8];
    v30 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "cStringUsingEncoding:", 4);
    objc_msgSend(v8, "localizedDescription");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    fprintf(v29, "Error: Unable to parse JSON config file '%s': %s\n\n", v30, (const char *)objc_msgSend(v31, "cStringUsingEncoding:", 4));

LABEL_35:
    exit(1);
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", v7, 1);

LABEL_7:
  objc_msgSend(v5, "setObject:forKey:", v1, CFSTR("COMMAND_LINE_ARGS"));
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = objc_msgSend(&unk_24FD5FCF0, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(&unk_24FD5FCF0);
        v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v1, "valueForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v5, "setValue:forKey:", v14, v13);

      }
      v10 = objc_msgSend(&unk_24FD5FCF0, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v10);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = objc_msgSend(&unk_24FD5FD08, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (!v15)
  {
LABEL_24:
    v20 = (FILE *)*MEMORY[0x24BDAC8D8];
    v21 = "Error: You must provide a source of test input!\n\n";
    v22 = 49;
LABEL_34:
    fwrite(v21, v22, 1uLL, v20);
    print_usage();
    goto LABEL_35;
  }
  v16 = v15;
  v17 = *(_QWORD *)v33;
LABEL_18:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v33 != v17)
      objc_enumerationMutation(&unk_24FD5FD08);
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v18));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      break;
    if (v16 == ++v18)
    {
      v16 = objc_msgSend(&unk_24FD5FD08, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (!v16)
        goto LABEL_24;
      goto LABEL_18;
    }
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("DICT"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {

  }
  else
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("KEYBOARD_LANGUAGE"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v20 = (FILE *)*MEMORY[0x24BDAC8D8];
      v21 = "Error: You must provide an input language.";
      v22 = 42;
      goto LABEL_34;
    }
  }
  objc_msgSend(v1, "objectForKey:", CFSTR("PARAMS"));
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    objc_msgSend(v1, "objectForKey:", CFSTR("JSON_CONFIG"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v20 = (FILE *)*MEMORY[0x24BDAC8D8];
      v21 = "Error: Use only Text or JSON parameter file but not both.";
      v22 = 57;
      goto LABEL_34;
    }
  }

  return v5;
}

__CFString *keyForEventType(int a1)
{
  if ((a1 - 1) > 9)
    return 0;
  else
    return off_24FD48CA0[a1 - 1];
}

void _TIBeginMockingKeyboardActivityController()
{
  TIKeyboardActivityControllerMock *v0;
  TIKeyboardAssertionManagerMock *v1;

  v1 = objc_alloc_init(TIKeyboardAssertionManagerMock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB53A0], "performSelector:withObject:", sel_setSharedAssertionManager_, v1);
  v0 = objc_alloc_init(TIKeyboardActivityControllerMock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB5398], "performSelector:withObject:", sel_setSharedController_, v0);

}

uint64_t _TIEndMockingKeyboardActivityController()
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB5398], "performSelector:withObject:", sel_setSharedController_, 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(MEMORY[0x24BEB53A0], "performSelector:withObject:", sel_setSharedAssertionManager_, 0);
  return result;
}

void sub_22FA88754(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA8896C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_22FA88B68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA89158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_22FA89660(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id TTKLogFacility()
{
  if (TTKLogFacility_onceToken != -1)
    dispatch_once(&TTKLogFacility_onceToken, &__block_literal_global_2651);
  return (id)TTKLogFacility_logFacility;
}

void TI::CP::CPTestCaseEval::~CPTestCaseEval(void **this)
{
  uint64_t v2;

  *this = off_24FD48DD8;
  if (*((char *)this + 279) < 0)
    operator delete(this[32]);
  if (*((char *)this + 255) < 0)
    operator delete(this[29]);
  if (*((char *)this + 231) < 0)
    operator delete(this[26]);

  v2 = (uint64_t)this[23];
  this[23] = 0;
  if (v2)
    std::default_delete<TI::CP::TTKTestCaseConverter>::operator()[abi:nn180100](v2);
  TI::CP::CPEval::~CPEval((TI::CP::CPEval *)this);
}

{
  uint64_t v2;

  *this = off_24FD48DD8;
  if (*((char *)this + 279) < 0)
    operator delete(this[32]);
  if (*((char *)this + 255) < 0)
    operator delete(this[29]);
  if (*((char *)this + 231) < 0)
    operator delete(this[26]);

  v2 = (uint64_t)this[23];
  this[23] = 0;
  if (v2)
    std::default_delete<TI::CP::TTKTestCaseConverter>::operator()[abi:nn180100](v2);
  TI::CP::CPEval::~CPEval((TI::CP::CPEval *)this);
  JUMPOUT(0x2348A8A24);
}

void TI::CP::CPTestCaseEval::load_language_resources(std::string::size_type *this, NSString *a2, NSString *a3, double a4)
{
  std::string *v5;
  char *v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int *v10;
  void *__p[2];
  char v12;

  TI::CP::CPEval::load_language_resources((TI::CP::CPEval *)this, a2, a3, a4);
  v5 = (std::string *)operator new();
  v6 = (char *)(this + 6);
  if (*((char *)this + 71) < 0)
    v6 = *(char **)v6;
  std::string::basic_string[abi:nn180100]<0>(__p, v6);
  v7 = (unsigned int *)this[9];
  v10 = v7;
  if (v7)
  {
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 + 1, v7));
  }
  TI::CP::TTKTestCaseConverter::TTKTestCaseConverter(v5, (__int128 *)__p, this + 10, &v10);
  v9 = this[23];
  this[23] = (std::string::size_type)v5;
  if (v9)
    std::default_delete<TI::CP::TTKTestCaseConverter>::operator()[abi:nn180100](v9);
  if (v10)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v10);
  if (v12 < 0)
    operator delete(__p[0]);
}

void sub_22FA89AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned int *a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a9)
    WTF::RefCounted<KB::DictionaryContainer>::deref(a9);
  if (a15 < 0)
    operator delete(__p);
  MEMORY[0x2348A8A24](v15, 0x10B2C406726BE89);
  _Unwind_Resume(a1);
}

void std::default_delete<TI::CP::TTKTestCaseConverter>::operator()[abi:nn180100](uint64_t a1)
{
  unsigned int *v2;

  std::__hash_table<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>>>::~__hash_table(a1 + 48);
  v2 = *(unsigned int **)(a1 + 40);
  if (v2)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v2);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  JUMPOUT(0x2348A8A24);
}

void TI::CP::CPEval::~CPEval(TI::CP::CPEval *this)
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int *v10;
  const void *v11;
  const void *v12;

  *(_QWORD *)this = &off_24FD49190;
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)this + 112);
  v2 = (unsigned int *)*((_QWORD *)this + 13);
  if (v2)
  {
    v3 = v2 + 2;
    v4 = atomic_load(v2 + 2);
    if (v4 == 1)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v2 + 8))(v2);
    }
    else
    {
      do
        v5 = __ldaxr(v3);
      while (__stlxr(v5 - 1, v3));
    }
  }
  v6 = (unsigned int *)*((_QWORD *)this + 12);
  if (v6)
  {
    v7 = v6 + 2;
    v8 = atomic_load(v6 + 2);
    if (v8 == 1)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v6 + 40))(v6);
    }
    else
    {
      do
        v9 = __ldaxr(v7);
      while (__stlxr(v9 - 1, v7));
    }
  }
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)this + 80);
  v10 = (unsigned int *)*((_QWORD *)this + 9);
  if (v10)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v10);
  if (*((char *)this + 71) < 0)
    operator delete(*((void **)this + 6));
  v11 = (const void *)*((_QWORD *)this + 4);
  if (v11)
    CFRelease(v11);
  *((_QWORD *)this + 4) = 0;
  v12 = (const void *)*((_QWORD *)this + 3);
  if (v12)
    CFRelease(v12);
  *((_QWORD *)this + 3) = 0;
}

{
  TI::CP::CPEval::~CPEval(this);
  JUMPOUT(0x2348A8A24);
}

uint64_t TI::CP::CPTestCaseEval::CPTestCaseEval(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_QWORD *)a1 = &off_24FD49190;
  *(_OWORD *)(a1 + 168) = 0u;
  TI::CP::ShapeStoreConfiguration::default_config((TI::CP::ShapeStoreConfiguration *)(a1 + 16));
  *(_DWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = xmmword_22FAC90D0;
  *(_DWORD *)(a1 + 144) = 1028443341;
  *(_QWORD *)(a1 + 148) = 0x300000000;
  *(_BYTE *)(a1 + 160) = 1;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0xF00000002;
  *(_QWORD *)a1 = off_24FD48DD8;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_BYTE *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 284) = xmmword_22FAC90E0;
  *(_QWORD *)(a1 + 192) = v5;
  v7 = v5;
  v8 = *(void **)(a1 + 200);
  *(_QWORD *)(a1 + 200) = v6;

  return a1;
}

void sub_22FA89D4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

const void **TI::CP::ShapeStoreConfiguration::default_config(TI::CP::ShapeStoreConfiguration *this)
{
  const void **v2;
  const __CFString *v3;
  CFURLRef v4;
  const void *v5;

  *(_DWORD *)this = 1050253722;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = CFSTR("shapestore.db");
  v2 = (const void **)((char *)this + 16);
  CFRetain(CFSTR("shapestore.db"));
  *v2 = CFSTR("shapestore.db");
  v3 = (const __CFString *)TI_KB_USER_DIRECTORY();
  v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], v3, kCFURLPOSIXPathStyle, 1u);
  v5 = (const void *)*((_QWORD *)this + 1);
  if (v5)
    CFRelease(v5);
  *((_QWORD *)this + 1) = v4;
  return KB::retain_ptr<__CFString const*>::operator=(v2, CFSTR("shapestore.db"));
}

void sub_22FA89DF4(_Unwind_Exception *a1)
{
  TI::CP::ShapeStoreConfiguration *v1;
  const void *v2;

  if (v2)
    CFRelease(v2);
  TI::CP::ShapeStoreConfiguration::~ShapeStoreConfiguration(v1);
  _Unwind_Resume(a1);
}

const void **KB::retain_ptr<__CFString const*>::operator=(const void **a1, CFTypeRef cf)
{
  CFTypeRef v3;

  v3 = *a1;
  if (v3 != cf)
  {
    if (cf)
    {
      CFRetain(cf);
      v3 = *a1;
    }
    if (v3)
      CFRelease(v3);
    *a1 = cf;
  }
  return a1;
}

void TI::CP::ShapeStoreConfiguration::~ShapeStoreConfiguration(TI::CP::ShapeStoreConfiguration *this)
{
  const void *v2;
  const void *v3;

  v2 = (const void *)*((_QWORD *)this + 2);
  if (v2)
    CFRelease(v2);
  *((_QWORD *)this + 2) = 0;
  v3 = (const void *)*((_QWORD *)this + 1);
  if (v3)
    CFRelease(v3);
  *((_QWORD *)this + 1) = 0;
}

uint64_t TI::CP::CPTestCaseEval::CPTestCaseEval(uint64_t a1, NSString *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  TI::CP::CPEval::CPEval((TI::CP::CPEval *)a1, a2);
  *(_QWORD *)a1 = off_24FD48DD8;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_BYTE *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 284) = xmmword_22FAC90E0;
  *(_QWORD *)(a1 + 192) = v7;
  v9 = v7;
  v10 = *(void **)(a1 + 200);
  *(_QWORD *)(a1 + 200) = v8;

  return a1;
}

void sub_22FA89F64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void TI::CP::CPTestCaseEval::evaluate_tests(uint64_t a1@<X0>, int *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, void *a5@<X5>, uint64_t a6@<X8>)
{
  unsigned __int8 v9;
  char v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  int v21;
  unint64_t v22;
  void *v23;
  BOOL v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  TTKTestCaseRecord *v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  BOOL v36;
  int v37;
  TI::CP::CPTestCaseEval *v38;
  int v39;
  _QWORD *v40;
  _QWORD *v41;
  KB::String *v42;
  void *v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  TTKTestCase *v47;
  void *v48;
  TTKTestCase *v49;
  id v50;
  const char *v51;
  void *v52;
  id v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  TIKeyboardInputManagerConfig *v63;
  int v65;
  TI::Favonius::FavoniusStrokeBuildManager *v66;
  TIInputManager *v67;
  const void **v68;
  int64x2_t v69;
  int *v70;
  void *v71;
  void *context;
  int v73;
  void *v74;
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _OWORD v81[2];
  __int128 v82;
  _WORD v83[36];
  __int128 v84;
  _QWORD v85[5];
  int v86;
  __int128 v87;
  _QWORD v88[4];
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  int v93;
  void ***v94;
  void **v95;
  _BYTE v96[32];
  _BYTE v97[24];
  _BYTE v98[24];
  _BYTE v99[24];
  _BYTE v100[32];
  __int128 v101;
  __int128 v102;
  uint64_t *v103;
  _QWORD *v104;
  uint64_t v105;
  int64x2_t v106[2];
  int v107;
  _BYTE v108[32];
  _OWORD v109[3];
  _OWORD v110[3];
  int v111;
  __int128 v112;
  __int128 v113;
  uint64_t *v114;
  _QWORD *v115;
  uint64_t v116;
  int64x2_t v117[2];
  unsigned int *v118[30];
  _BYTE v119[128];
  _OWORD v120[6];
  uint64_t v121;
  std::string v122;
  std::string __p;
  __int16 v124;
  char v125;
  _OWORD v126[12];
  uint64_t v127;
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  v63 = a5;
  v9 = *(_BYTE *)(a1 + 8);
  v10 = *(_BYTE *)(a1 + 280);
  v80 = 0u;
  memset(v81, 0, sizeof(v81));
  v82 = 0u;
  memset(v83, 0, 32);
  memset(&v83[20], 0, 24);
  v84 = 0u;
  memset(v85, 0, sizeof(v85));
  v86 = 1065353216;
  v89 = 0u;
  memset(v88, 0, sizeof(v88));
  v87 = 0u;
  v90 = 0;
  *((_QWORD *)&v91 + 1) = 0xC010000000000000;
  v92 = 0x4008000000000000uLL;
  v93 = 0;
  v83[16] = v9;
  LOBYTE(v83[32]) = v10;
  v70 = a2;
  v11 = *a2;
  if (*a2 != 2)
  {
    if (v11 == 1)
    {
      TI::CP::CPEval::create_favonius((TI::CP::CPEval *)a1, v63, (uint64_t *)v118);
      v66 = (TI::Favonius::FavoniusStrokeBuildManager *)v118[0];
      v67 = 0;
      v68 = 0;
      if ((*(unsigned int (**)(void))(*(_QWORD *)v118[0] + 368))() != *(_DWORD *)(a4 + 100))
        (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(_QWORD *)v66 + 376))(v66);
      goto LABEL_20;
    }
    if (!v11)
    {
      v12 = *(_OWORD *)(a4 + 80);
      v120[4] = *(_OWORD *)(a4 + 64);
      v120[5] = v12;
      v121 = *(_QWORD *)(a4 + 96);
      v13 = *(_OWORD *)(a4 + 16);
      v120[0] = *(_OWORD *)a4;
      v120[1] = v13;
      v14 = *(_OWORD *)(a4 + 32);
      v120[3] = *(_OWORD *)(a4 + 48);
      v120[2] = v14;
      if (*(char *)(a4 + 127) < 0)
        std::string::__init_copy_ctor_external(&v122, *(const std::string::value_type **)(a4 + 104), *(_QWORD *)(a4 + 112));
      else
        v122 = *(std::string *)(a4 + 104);
      if (*(char *)(a4 + 151) < 0)
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a4 + 128), *(_QWORD *)(a4 + 136));
      else
        __p = *(std::string *)(a4 + 128);
      v124 = *(_WORD *)(a4 + 152);
      v125 = *(_BYTE *)(a4 + 154);
      MEMORY[0x2348A87C0](v126, a4 + 160);
      v15 = *(_OWORD *)(a4 + 336);
      v126[10] = *(_OWORD *)(a4 + 320);
      v126[11] = v15;
      v127 = *(_QWORD *)(a4 + 352);
      v16 = *(_OWORD *)(a4 + 272);
      v126[6] = *(_OWORD *)(a4 + 256);
      v126[7] = v16;
      v17 = *(_OWORD *)(a4 + 288);
      v126[9] = *(_OWORD *)(a4 + 304);
      v126[8] = v17;
      v18 = *(_OWORD *)(a4 + 208);
      v126[2] = *(_OWORD *)(a4 + 192);
      v126[3] = v18;
      v19 = *(_OWORD *)(a4 + 224);
      v126[5] = *(_OWORD *)(a4 + 240);
      v126[4] = v19;
      TI::CP::CPEval::create_recognizer_for_config((const std::string *)a1, a3, (uint64_t)v120, (uint64_t *)v118);
      v68 = (const void **)v118[0];
      KB::String::~String((KB::String *)v126);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v122.__r_.__value_.__l.__data_);
      if (v68)
      {
        v66 = 0;
        v67 = 0;
        goto LABEL_20;
      }
    }
LABEL_85:
    TI::CP::TestResultsSummarizer::TestResultsSummarizer((TI::CP::TestResultsSummarizer *)a6, (const TI::CP::TestResultsSummarizer *)&v80);
    goto LABEL_86;
  }
  TI::CP::CPEval::create_input_manager((TI::CP::CPEval *)a1, v63, (uint64_t *)v118);
  v67 = (TIInputManager *)v118[0];
  if (!v118[0])
    goto LABEL_85;
  v66 = 0;
  v68 = 0;
LABEL_20:
  printf("Running test case ");
  objc_msgSend(*(id *)(a1 + 192), "reset");
  objc_msgSend(*(id *)(a1 + 192), "getNextTestCase");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v75 = 0;
  v21 = 0;
  v73 = 0;
  v69 = vdupq_n_s64(0xFFF0000000000000);
  while ((v75 & 1) == 0 && v20)
  {
    context = (void *)MEMORY[0x2348A8D30]();
    ++v73;
    HIDWORD(v22) = -1030792151 * v73;
    LODWORD(v22) = -1030792151 * v73;
    if ((v22 >> 1) <= 0x51EB851)
    {
      printf("%u...", v73);
      fflush((FILE *)*MEMORY[0x24BDAC8E8]);
    }
    objc_msgSend(v20, "intendedText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length") == 0;

    if (!v24)
    {
      +[TTKTestCase convertToIsolatedWordMode:](TTKTestCase, "convertToIsolatedWordMode:", v20);
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        objc_msgSend(v20, "intendedText");
        v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v51 = (const char *)objc_msgSend(v50, "UTF8String");
        objc_msgSend(v20, "metadata");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKey:", CFSTR("recordIdentifier"));
        v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("\nUnexpected failure [#%u] converting to isolated word mode for record %u, string = <%s>, id=<%s>\n", ++v65, v73, v51, (const char *)objc_msgSend(v53, "UTF8String"));

        objc_msgSend(*(id *)(a1 + 192), "getNextTestCase");
        v75 = 0;
        v74 = v20;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_78;
      }
      v26 = (void *)v25;

      v20 = v26;
    }
    v71 = v20;
    if (*(_QWORD *)(a1 + 200))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = 0;
    }
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(v20, "records");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v76, v119, 16);
    if (!v28)
    {
      v75 = 0;
      goto LABEL_73;
    }
    v75 = 0;
    v29 = *(_QWORD *)v77;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v77 != v29)
          objc_enumerationMutation(v27);
        v31 = *(TTKTestCaseRecord **)(*((_QWORD *)&v76 + 1) + 8 * v30);
        v32 = (void *)MEMORY[0x2348A8D30]();
        v33 = *(_DWORD *)(a1 + 292);
        if (v33 < 0 || v21 <= v33)
        {
          if (v21 >= *(_DWORD *)(a1 + 288))
          {
            -[TTKTestCaseRecord touchDataCollection](v31, "touchDataCollection");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "count") == 0;

            if (!v36)
            {
              v37 = v21 + 1;
              if ((v21 - *(_DWORD *)(a1 + 288)) % *(_DWORD *)(a1 + 296))
              {
                v34 = 5;
LABEL_64:
                v21 = v37;
                goto LABEL_65;
              }
              TI::CP::TTKTestCaseConverter::convert(*(TI::CP::TTKTestCaseConverter **)(a1 + 184), v31, (uint64_t)v118);
              v38 = (TI::CP::CPTestCaseEval *)KB::String::String((KB::String *)v108);
              v111 = 0;
              memset(v109, 0, sizeof(v109));
              memset(v110, 0, sizeof(v110));
              v115 = 0;
              v116 = 0;
              v114 = (uint64_t *)&v115;
              v117[0] = v69;
              *(__int32 *)((char *)v117[1].i32 + 1) = 0;
              v39 = *v70;
              if (*v70 == 2)
              {
                TI::CP::CPEval::evaluate_test_case_input_manager((TI::CP::CPEval *)a1, v118, v67, v21, (uint64_t)&v95);
                v107 = (int)v95;
                KB::String::operator=();
              }
              else
              {
                if (v39 != 1)
                {
                  if (v39)
                    goto LABEL_59;
                  TI::CP::CPEval::evaluate_test_case((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v118, (TI::CP::TIPathRecognizerInterface *)v68, v21, (uint64_t)&v95);
                  v107 = (int)v95;
                  KB::String::operator=();
                  KB::CandidateCollection::operator=((uint64_t)v109, (uint64_t)v97);
                  v112 = v101;
                  v113 = v102;
                  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v115);
                  v40 = v104;
                  v114 = v103;
                  v115 = v104;
                  v116 = v105;
                  if (v105)
                  {
                    v104[2] = &v115;
                    v40 = 0;
                    v103 = (uint64_t *)&v104;
                    v104 = 0;
                    v105 = 0;
                  }
                  else
                  {
                    v114 = (uint64_t *)&v115;
                  }
                  v117[0] = v106[0];
                  *(int64x2_t *)((char *)v117 + 12) = *(int64x2_t *)((char *)v106 + 12);
                  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v40);
                  v94 = (void ***)v100;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v94);
                  v94 = (void ***)v99;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v94);
                  v94 = (void ***)v98;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v94);
                  v94 = (void ***)v97;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v94);
                  KB::String::~String((KB::String *)v96);
                  if (a3)
                    goto LABEL_59;
                  MEMORY[0x2348A87B4](&v95, "favonius");
                  v94 = &v95;
                  v44 = std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__emplace_unique_key_args<KB::String,std::piecewise_construct_t const&,std::tuple<KB::String const&>,std::tuple<>>(&v114, (uint64_t)&v95, &v94);
                  TI::CP::Path::operator=((void **)v44 + 8, v68 + 7);
                  v42 = (KB::String *)&v95;
LABEL_56:
                  KB::String::~String(v42);
LABEL_59:
                  if (*(_QWORD *)(a1 + 200) && ((v112 & 0x80000000) != 0 || (int)v112 >= *(_DWORD *)(a1 + 284)))
                  {
                    TI::CP::CPTestCaseEval::create_results_dictionary(v38, (const TI::CP::ContinuousPathTestResult *)&v107, 0x28u);
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    -[TTKTestCaseRecord setAnnotation:forKey:](v31, "setAnnotation:forKey:", v43, CFSTR("cpEvalResults"));
                    objc_msgSend(v74, "addObject:", v31);

                  }
                  TI::CP::TestResultsSummarizer::add_result((TI::CP::TestResultsSummarizer *)&v80, (const TI::CP::ContinuousPathTestResult *)&v107);
                  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v115);
                  v95 = (void **)&v110[1] + 1;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v95);
                  v95 = (void **)v110;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v95);
                  v95 = (void **)&v109[1] + 1;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v95);
                  v95 = (void **)v109;
                  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v95);
                  KB::String::~String((KB::String *)v108);
                  TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase((TI::CP::ContinuousPathTestCase *)v118);
                  v34 = 0;
                  goto LABEL_64;
                }
                TI::CP::CPEval::evaluate_test_case_favonius((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v118, v66, v21, (uint64_t)&v95);
                v107 = (int)v95;
                KB::String::operator=();
              }
              KB::CandidateCollection::operator=((uint64_t)v109, (uint64_t)v97);
              v112 = v101;
              v113 = v102;
              std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v115);
              v41 = v104;
              v114 = v103;
              v115 = v104;
              v116 = v105;
              if (v105)
              {
                v104[2] = &v115;
                v41 = 0;
                v103 = (uint64_t *)&v104;
                v104 = 0;
                v105 = 0;
              }
              else
              {
                v114 = (uint64_t *)&v115;
              }
              v117[0] = v106[0];
              *(int64x2_t *)((char *)v117 + 12) = *(int64x2_t *)((char *)v106 + 12);
              std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v41);
              v94 = (void ***)v100;
              std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v94);
              v94 = (void ***)v99;
              std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v94);
              v94 = (void ***)v98;
              std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v94);
              v94 = (void ***)v97;
              std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v94);
              v42 = (KB::String *)v96;
              goto LABEL_56;
            }
          }
          else
          {
            ++v21;
          }
          v34 = 5;
        }
        else
        {
          v34 = 4;
          v75 = 1;
        }
LABEL_65:
        objc_autoreleasePoolPop(v32);
        if (v34 != 5 && v34)
          goto LABEL_73;
        ++v30;
      }
      while (v28 != v30);
      v45 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v76, v119, 16);
      v28 = v45;
    }
    while (v45);
LABEL_73:

    v46 = v71;
    if (*(_QWORD *)(a1 + 200))
    {
      if (objc_msgSend(v74, "count"))
      {
        v47 = [TTKTestCase alloc];
        objc_msgSend(v71, "metadata");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[TTKTestCase initWithMetadata:records:](v47, "initWithMetadata:records:", v48, v74);

        objc_msgSend(*(id *)(a1 + 200), "pushNextTestCase:", v49);
        v46 = v71;
      }
    }
    objc_msgSend(*(id *)(a1 + 192), "getNextTestCase");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_78:
    objc_autoreleasePoolPop(context);
  }
  putchar(10);
  fflush((FILE *)*MEMORY[0x24BDAC8E8]);
  *(_QWORD *)(a6 + 16) = *(_QWORD *)&v81[0];
  *(_QWORD *)(a6 + 40) = *((_QWORD *)&v81[1] + 1);
  v54 = v85[0];
  *(_QWORD *)(a6 + 64) = *(_QWORD *)v83;
  *(_OWORD *)a6 = v80;
  v80 = 0uLL;
  *(_OWORD *)(a6 + 24) = *(_OWORD *)((char *)v81 + 8);
  memset(v81, 0, sizeof(v81));
  *(_OWORD *)(a6 + 48) = v82;
  *(_QWORD *)v83 = 0;
  v82 = 0uLL;
  v55 = *(_OWORD *)&v83[4];
  v56 = *(_OWORD *)&v83[12];
  v57 = *(_OWORD *)&v83[20];
  *(_OWORD *)(a6 + 113) = *(_OWORD *)((char *)&v83[24] + 1);
  *(_OWORD *)(a6 + 104) = v57;
  *(_OWORD *)(a6 + 88) = v56;
  *(_OWORD *)(a6 + 72) = v55;
  v58 = v84;
  *(_QWORD *)(a6 + 152) = v54;
  v84 = 0uLL;
  v85[0] = 0;
  *(_OWORD *)(a6 + 136) = v58;
  std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::__hash_table(a6 + 160, &v85[1]);
  *(_OWORD *)(a6 + 200) = v87;
  *(_QWORD *)(a6 + 216) = v88[0];
  v88[0] = 0;
  v87 = 0uLL;
  *(_OWORD *)(a6 + 224) = *(_OWORD *)&v88[1];
  v59 = v90;
  *(_QWORD *)(a6 + 240) = v88[3];
  *(_OWORD *)&v88[1] = 0uLL;
  *(_OWORD *)(a6 + 248) = v89;
  *(_QWORD *)(a6 + 264) = v59;
  v88[3] = 0;
  v89 = 0uLL;
  v90 = 0;
  v60 = v91;
  v61 = v92;
  *(_DWORD *)(a6 + 304) = v93;
  *(_OWORD *)(a6 + 272) = v60;
  *(_OWORD *)(a6 + 288) = v61;

  if (v67)
    (*(void (**)(TIInputManager *))(*(_QWORD *)v67 + 8))(v67);
  if (v66)
    (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(_QWORD *)v66 + 8))(v66);
  if (v68)
    (*((void (**)(const void **))*v68 + 1))(v68);
LABEL_86:
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)&v80);

}

void sub_22FA8AB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  if (SLOBYTE(STACK[0x67F]) < 0)
    operator delete((void *)STACK[0x668]);
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)&a57);

  _Unwind_Resume(a1);
}

void TI::CP::EnsembleConfig::~EnsembleConfig(void **this)
{
  KB::String::~String((KB::String *)(this + 20));
  if (*((char *)this + 151) < 0)
    operator delete(this[16]);
  if (*((char *)this + 127) < 0)
    operator delete(this[13]);
}

TI::CP::TestResultsSummarizer *TI::CP::TestResultsSummarizer::TestResultsSummarizer(TI::CP::TestResultsSummarizer *this, const TI::CP::TestResultsSummarizer *a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint8x8_t v23;
  unint64_t v24;
  unsigned __int8 **v25;
  unsigned __int8 *i;
  unint64_t v27;
  char *v28;
  _QWORD *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  _BOOL8 v35;
  unint64_t v36;
  unint64_t v37;
  size_t v38;
  uint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  unint64_t v49;
  _QWORD *v50;
  uint64_t *v51;
  _QWORD v52[2];
  char v53;

  v2 = (unint64_t)a2;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  v4 = *(_QWORD *)a2;
  v5 = *((_QWORD *)a2 + 1);
  if (v5 != *(_QWORD *)a2)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100](this, 0x34F72C234F72C235 * ((v5 - *(_QWORD *)a2) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>(this, v4, v5);
  }
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  v6 = *(_QWORD *)(v2 + 24);
  v7 = *(_QWORD *)(v2 + 32);
  if (v7 != v6)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((_QWORD *)this + 3, 0x34F72C234F72C235 * ((v7 - v6) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 24), v6, v7);
  }
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  v8 = *(_QWORD *)(v2 + 48);
  v9 = *(_QWORD *)(v2 + 56);
  if (v9 != v8)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((_QWORD *)this + 6, 0x34F72C234F72C235 * ((v9 - v8) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 48), v8, v9);
  }
  v10 = *(_OWORD *)(v2 + 72);
  v11 = *(_OWORD *)(v2 + 88);
  v12 = *(_OWORD *)(v2 + 104);
  v13 = *(_OWORD *)(v2 + 113);
  *((_QWORD *)this + 17) = 0;
  *(_OWORD *)((char *)this + 113) = v13;
  *(_OWORD *)((char *)this + 88) = v11;
  *(_OWORD *)((char *)this + 104) = v12;
  *(_OWORD *)((char *)this + 72) = v10;
  *((_QWORD *)this + 18) = 0;
  *((_QWORD *)this + 19) = 0;
  v14 = *(_QWORD *)(v2 + 136);
  v15 = *(_QWORD *)(v2 + 144);
  if (v15 != v14)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((_QWORD *)this + 17, 0x34F72C234F72C235 * ((v15 - v14) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 136), v14, v15);
  }
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_DWORD *)this + 48) = *(_DWORD *)(v2 + 192);
  v51 = (uint64_t *)((char *)this + 160);
  std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)this + 160, *(_QWORD *)(v2 + 168));
  v49 = v2;
  v16 = *(uint64_t **)(v2 + 176);
  if (v16)
  {
    v50 = (_QWORD *)((char *)this + 176);
    do
    {
      v17 = *((char *)v16 + 39);
      if (v17 >= 0)
        v18 = v16 + 2;
      else
        v18 = (uint64_t *)v16[2];
      if (v17 >= 0)
        v19 = *((unsigned __int8 *)v16 + 39);
      else
        v19 = v16[3];
      v20 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v18, v19);
      v21 = v20;
      v22 = *((_QWORD *)this + 21);
      if (v22)
      {
        v23 = (uint8x8_t)vcnt_s8((int8x8_t)v22);
        v23.i16[0] = vaddlv_u8(v23);
        v24 = v23.u32[0];
        if (v23.u32[0] > 1uLL)
        {
          v2 = v20;
          if (v20 >= v22)
            v2 = v20 % v22;
        }
        else
        {
          v2 = (v22 - 1) & v20;
        }
        v25 = *(unsigned __int8 ***)(*v51 + 8 * v2);
        if (v25)
        {
          for (i = *v25; i; i = *(unsigned __int8 **)i)
          {
            v27 = *((_QWORD *)i + 1);
            if (v27 == v21)
            {
              if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)v16 + 16))
                goto LABEL_60;
            }
            else
            {
              if (v24 > 1)
              {
                if (v27 >= v22)
                  v27 %= v22;
              }
              else
              {
                v27 &= v22 - 1;
              }
              if (v27 != v2)
                break;
            }
          }
        }
      }
      v28 = (char *)operator new(0x40uLL);
      v29 = v28;
      v52[0] = v28;
      v52[1] = (char *)this + 176;
      v53 = 0;
      *(_QWORD *)v28 = 0;
      *((_QWORD *)v28 + 1) = v21;
      if (*((char *)v16 + 39) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)(v28 + 16), (const std::string::value_type *)v16[2], v16[3]);
      }
      else
      {
        v30 = *((_OWORD *)v16 + 1);
        *((_QWORD *)v28 + 4) = v16[4];
        *((_OWORD *)v28 + 1) = v30;
      }
      v29[5] = 0;
      v29[6] = 0;
      v29[7] = 0;
      v31 = v16[5];
      v32 = v16[6];
      if (v32 != v31)
      {
        std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100](v29 + 5, 0x34F72C234F72C235 * ((v32 - v31) >> 3));
        std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::ContinuousPathTestResult *)(v29 + 5), v31, v32);
      }
      v53 = 1;
      v33 = (float)(unint64_t)(*((_QWORD *)this + 23) + 1);
      v34 = *((float *)this + 48);
      if (!v22 || (float)(v34 * (float)v22) < v33)
      {
        v35 = (v22 & (v22 - 1)) != 0;
        if (v22 < 3)
          v35 = 1;
        v36 = v35 | (2 * v22);
        v37 = vcvtps_u32_f32(v33 / v34);
        if (v36 <= v37)
          v38 = v37;
        else
          v38 = v36;
        std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)v51, v38);
        v22 = *((_QWORD *)this + 21);
        if ((v22 & (v22 - 1)) != 0)
        {
          if (v21 >= v22)
            v2 = v21 % v22;
          else
            v2 = v21;
        }
        else
        {
          v2 = (v22 - 1) & v21;
        }
      }
      v39 = *v51;
      v40 = *(_QWORD **)(*v51 + 8 * v2);
      if (v40)
      {
        *v29 = *v40;
      }
      else
      {
        *v29 = *v50;
        *v50 = v29;
        *(_QWORD *)(v39 + 8 * v2) = v50;
        if (!*v29)
          goto LABEL_59;
        v41 = *(_QWORD *)(*v29 + 8);
        if ((v22 & (v22 - 1)) != 0)
        {
          if (v41 >= v22)
            v41 %= v22;
        }
        else
        {
          v41 &= v22 - 1;
        }
        v40 = (_QWORD *)(*v51 + 8 * v41);
      }
      *v40 = v29;
LABEL_59:
      v52[0] = 0;
      ++*((_QWORD *)this + 23);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,void *>>>>::reset[abi:nn180100]((uint64_t)v52);
LABEL_60:
      v16 = (uint64_t *)*v16;
    }
    while (v16);
  }
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  *((_QWORD *)this + 27) = 0;
  v42 = *(_QWORD *)(v49 + 200);
  v43 = *(_QWORD *)(v49 + 208);
  if (v43 != v42)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((_QWORD *)this + 25, 0x34F72C234F72C235 * ((v43 - v42) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 200), v42, v43);
  }
  *((_QWORD *)this + 28) = 0;
  *((_QWORD *)this + 29) = 0;
  *((_QWORD *)this + 30) = 0;
  v44 = *(_QWORD *)(v49 + 224);
  v45 = *(_QWORD *)(v49 + 232);
  if (v45 != v44)
  {
    std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100]((_QWORD *)this + 28, 0x34F72C234F72C235 * ((v45 - v44) >> 3));
    std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>((TI::CP::TestResultsSummarizer *)((char *)this + 224), v44, v45);
  }
  std::vector<unsigned int>::vector((std::vector<unsigned int> *)((char *)this + 248), (const std::vector<unsigned int> *)(v49 + 248));
  v46 = *(_OWORD *)(v49 + 272);
  v47 = *(_OWORD *)(v49 + 288);
  *((_DWORD *)this + 76) = *(_DWORD *)(v49 + 304);
  *((_OWORD *)this + 17) = v46;
  *((_OWORD *)this + 18) = v47;
  return this;
}

void sub_22FA8B268(_Unwind_Exception *a1, void **a2, void **a3, void **a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void **v8;
  va_list va;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, void **);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va1);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va1);
  std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::~__hash_table(a7);
  v8 = a2;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  v8 = a3;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  v8 = a4;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t KB::CandidateCollection::operator=(uint64_t a1, uint64_t a2)
{
  std::vector<KB::Candidate>::__vdeallocate((void **)a1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  std::vector<KB::Candidate>::__vdeallocate((void **)(a1 + 24));
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  std::vector<KB::Candidate>::__vdeallocate((void **)(a1 + 48));
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  std::vector<KB::Candidate>::__vdeallocate((void **)(a1 + 72));
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  return a1;
}

uint64_t *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__emplace_unique_key_args<KB::String,std::piecewise_construct_t const&,std::tuple<KB::String const&>,std::tuple<>>(uint64_t **a1, uint64_t a2, _QWORD *a3)
{
  void **v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t v9[2];
  char v10;
  uint64_t v11;

  v5 = (void **)std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_equal<KB::String>((uint64_t)a1, &v11, a2);
  v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (uint64_t *)operator new(0x70uLL);
    v9[0] = (uint64_t)v6;
    v9[1] = (uint64_t)(a1 + 1);
    v10 = 0;
    MEMORY[0x2348A87C0](v6 + 4, *a3);
    *((_OWORD *)v6 + 5) = 0u;
    *((_OWORD *)v6 + 6) = 0u;
    *((_OWORD *)v6 + 4) = 0u;
    v10 = 1;
    std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at(a1, v11, v7, v6);
    v9[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100](v9);
  }
  return v6;
}

void sub_22FA8B480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100](&a9);
  _Unwind_Resume(a1);
}

void **TI::CP::Path::operator=(void **a1, const void **a2)
{
  char *v4;
  char *v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  size_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void **v26;
  char *v27;
  unint64_t v28;
  char *v29;
  void *v30;
  char *v31;

  if (a1 != (void **)a2)
  {
    v4 = (char *)*a2;
    v5 = (char *)a2[1];
    v6 = v5 - (_BYTE *)*a2;
    v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 4);
    v8 = (uint64_t)a1[2];
    v9 = (char *)*a1;
    if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)*a1) >> 4) >= v7)
    {
      v13 = (char *)a1[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v13 - v9) >> 4) < v7)
      {
        v14 = &v4[16 * ((v13 - v9) >> 4)];
        if (v13 != v9)
        {
          memmove(*a1, *a2, v13 - v9);
          v9 = (char *)a1[1];
        }
        v6 = v5 - v14;
        if (v5 == v14)
          goto LABEL_20;
        v15 = v9;
        v16 = v14;
        goto LABEL_19;
      }
    }
    else
    {
      if (v9)
      {
        a1[1] = v9;
        operator delete(v9);
        v8 = 0;
        *a1 = 0;
        a1[1] = 0;
        a1[2] = 0;
      }
      if (v7 > 0x555555555555555)
        goto LABEL_40;
      v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 4);
      v11 = 2 * v10;
      if (2 * v10 <= v7)
        v11 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 4);
      if (v10 >= 0x2AAAAAAAAAAAAAALL)
        v12 = 0x555555555555555;
      else
        v12 = v11;
      std::vector<TI::CP::PathSample>::__vallocate[abi:nn180100](a1, v12);
      v9 = (char *)a1[1];
    }
    if (v5 == v4)
    {
LABEL_20:
      v17 = &v9[v6];
      v18 = (char *)a1[3];
      a1[1] = v17;
      v19 = (char *)a2[3];
      v20 = (char *)a2[4];
      v21 = v20 - v19;
      v22 = (v20 - v19) >> 2;
      v23 = (uint64_t)a1[5];
      if (v22 <= (v23 - (uint64_t)v18) >> 2)
      {
        v26 = a1 + 4;
        v27 = (char *)a1[4];
        v28 = (v27 - v18) >> 2;
        if (v28 < v22)
        {
          v29 = &v19[4 * v28];
          if (v27 != v18)
          {
            memmove(v18, v19, v27 - v18);
            v18 = (char *)*v26;
          }
          v21 = v20 - v29;
          if (v20 == v29)
            goto LABEL_38;
          v30 = v18;
          v31 = v29;
          goto LABEL_37;
        }
LABEL_35:
        if (v20 == v19)
        {
LABEL_38:
          *v26 = &v18[v21];
          return a1;
        }
        v30 = v18;
        v31 = v19;
LABEL_37:
        memmove(v30, v31, v21);
        goto LABEL_38;
      }
      if (v18)
      {
        a1[4] = v18;
        operator delete(v18);
        v23 = 0;
        a1[3] = 0;
        a1[4] = 0;
        a1[5] = 0;
      }
      if ((v21 & 0x8000000000000000) == 0)
      {
        v24 = v23 >> 1;
        if (v23 >> 1 <= v22)
          v24 = (v20 - v19) >> 2;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
          v25 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v25 = v24;
        std::vector<unsigned int>::__vallocate[abi:nn180100](a1 + 3, v25);
        v26 = a1 + 4;
        v18 = (char *)a1[4];
        goto LABEL_35;
      }
LABEL_40:
      abort();
    }
    v15 = v9;
    v16 = v4;
LABEL_19:
    memmove(v15, v16, v6);
    goto LABEL_20;
  }
  return a1;
}

void TI::CP::ContinuousPathTestResult::~ContinuousPathTestResult(TI::CP::ContinuousPathTestResult *this)
{
  void **v2;

  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(*((_QWORD **)this + 23));
  v2 = (void **)((char *)this + 112);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  v2 = (void **)((char *)this + 88);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  v2 = (void **)((char *)this + 64);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  v2 = (void **)((char *)this + 40);
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  KB::String::~String((TI::CP::ContinuousPathTestResult *)((char *)this + 8));
}

id TI::CP::CPTestCaseEval::create_results_dictionary(TI::CP::CPTestCaseEval *this, const TI::CP::ContinuousPathTestResult *a2, unsigned int a3)
{
  void *v3;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const KB::String *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  TI::CP::CPTestCaseEval *v33;
  TI::CP::CPTestCaseEval *v34;
  const TI::CP::ContinuousPathTestResult *v35;
  void *v36;
  const KB::String *v37;
  void *v38;
  const TI::CP::ContinuousPathTestResult *v39;
  const TI::CP::ContinuousPathTestResult *v40;
  BOOL v41;
  id v43;
  void *v44;
  _BYTE v45[32];
  _QWORD v46[5];
  _QWORD v47[6];

  v47[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (const char *)*((_QWORD *)a2 + 2);
  if (!v6)
    v6 = (char *)a2 + 24;
  if (*((_WORD *)a2 + 4))
    v7 = v6;
  else
    v7 = "";
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v8, CFSTR("expected_word"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)a2 + 36));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v9, CFSTR("matched_indx"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v10, CFSTR("test_index"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)a2 + 216));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v11, CFSTR("in_lexicon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)a2 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v12, CFSTR("sources_used"));

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a3;
  if (0x1CAC083126E978D5 * ((uint64_t)(*((_QWORD *)a2 + 6) - *((_QWORD *)a2 + 5)) >> 3) < (unint64_t)a3)
    v13 = 0x1CAC083126E978D5 * ((uint64_t)(*((_QWORD *)a2 + 6) - *((_QWORD *)a2 + 5)) >> 3);
  if (v13)
  {
    v14 = 0;
    v15 = 1000 * v13;
    do
    {
      v16 = *((_QWORD *)a2 + 5);
      v17 = (_QWORD *)(v16 + v14);
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = TILocaleIdentifierForLexiconID();
      if (v19)
        v20 = (const char *)v19;
      else
        v20 = "UNK";
      objc_msgSend(v18, "stringWithUTF8String:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = CFSTR("cand");
      KB::Candidate::capitalized_string((KB::Candidate *)(v16 + v14));
      KB::ns_string((KB *)v45, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v23;
      v47[1] = v21;
      v46[1] = CFSTR("lexicon");
      v46[2] = CFSTR("token_id");
      if (*v17)
        v24 = *(unsigned int *)(*(_QWORD *)(v16 + v14 + 8) + 240 * *v17 - 100);
      else
        v24 = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v47[2] = v25;
      v46[3] = CFSTR("score_info");
      v26 = v16 + v14;
      v27 = *(void **)(v16 + v14 + 984);
      v28 = v27;
      if (!v27)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v3;
      }
      v47[3] = v28;
      v46[4] = CFSTR("final_prob");
      v29 = (void *)MEMORY[0x24BDD16E0];
      *(float *)&v30 = expf(*(float *)(v26 + 744));
      objc_msgSend(v29, "numberWithFloat:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v47[4] = v31;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      KB::String::~String((KB::String *)v45);
      objc_msgSend(v44, "addObject:", v32);

      v14 += 1000;
    }
    while (v15 != v14);
  }
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, CFSTR("candidates_info"));
  if (*((_QWORD *)a2 + 24))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v33 = (TI::CP::CPTestCaseEval *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    v35 = (const TI::CP::ContinuousPathTestResult *)*((_QWORD *)a2 + 22);
    if (v35 != (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 184))
    {
      do
      {
        TI::CP::CPTestCaseEval::serialize_path(v33, (const TI::CP::ContinuousPathTestResult *)((char *)v35 + 64));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        KB::ns_string((const TI::CP::ContinuousPathTestResult *)((char *)v35 + 32), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[TI::CP::CPTestCaseEval setObject:forKey:](v34, "setObject:forKey:", v36, v38);

        v39 = (const TI::CP::ContinuousPathTestResult *)*((_QWORD *)v35 + 1);
        if (v39)
        {
          do
          {
            v40 = v39;
            v39 = *(const TI::CP::ContinuousPathTestResult **)v39;
          }
          while (v39);
        }
        else
        {
          do
          {
            v40 = (const TI::CP::ContinuousPathTestResult *)*((_QWORD *)v35 + 2);
            v41 = *(_QWORD *)v40 == (_QWORD)v35;
            v35 = v40;
          }
          while (!v41);
        }
        v35 = v40;
      }
      while (v40 != (const TI::CP::ContinuousPathTestResult *)((char *)a2 + 184));
    }
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v34, CFSTR("resampled_paths"));

  }
  return v43;
}

void sub_22FA8BB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = *a2;
  *a2 = 0;
  *(_QWORD *)result = v2;
  *(_QWORD *)(result + 8) = a2[1];
  a2[1] = 0;
  v5 = a2[2];
  v3 = a2 + 2;
  v4 = v5;
  *(_QWORD *)(result + 16) = v5;
  v6 = v3[1];
  *(_QWORD *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    v7 = *(_QWORD *)(v4 + 8);
    v8 = *(_QWORD *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v7 %= v8;
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(_QWORD *)(v2 + 8 * v7) = result + 16;
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

id TI::CP::CPTestCaseEval::serialize_path(TI::CP::CPTestCaseEval *this, const TI::CP::Path *a2)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  double *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)((char *)a2 + 8);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 4));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)a2;
  if (*v3 != *(_QWORD *)a2)
  {
    v5 = 0;
    do
    {
      v6 = (double *)(v4 + 48 * v5);
      v15[0] = CFSTR("x");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *v6, v14, CFSTR("x"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v7;
      v15[1] = CFSTR("y");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6[1]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v8;
      v15[2] = CFSTR("force");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(v4 + 48 * v5 + 24));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v9;
      v15[3] = CFSTR("t");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(v4 + 48 * v5 + 16));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[3] = v10;
      v15[4] = CFSTR("inflection");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", TI::CP::Path::is_inflection_point(a2));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[4] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "addObject:", v12);
      ++v5;
      v4 = *(_QWORD *)a2;
    }
    while (v5 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 4));
  }
  return v14;
}

void sub_22FA8BEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void std::vector<KB::Candidate>::__vdeallocate(void **a1)
{
  void *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = v1;
    if ((void *)v3 != v1)
    {
      do
        v3 = MEMORY[0x2348A8820](v3 - 1000);
      while ((void *)v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *std::vector<TI::CP::ContinuousPathTestResult>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x11A7B9611A7B962)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[232 * v4];
  return result;
}

TI::CP::ContinuousPathTestResult *std::vector<TI::CP::ContinuousPathTestResult>::__construct_at_end<TI::CP::ContinuousPathTestResult*,TI::CP::ContinuousPathTestResult*>(TI::CP::ContinuousPathTestResult *result, uint64_t a2, uint64_t a3)
{
  TI::CP::ContinuousPathTestResult *v3;
  uint64_t v4;
  uint64_t v7;

  v3 = result;
  v4 = *((_QWORD *)result + 1);
  if (a2 != a3)
  {
    v7 = 0;
    do
    {
      result = TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)(v4 + v7), (const TI::CP::ContinuousPathTestResult *)(a2 + v7));
      v7 += 232;
    }
    while (a2 + v7 != a3);
    v4 += v7;
  }
  *((_QWORD *)v3 + 1) = v4;
  return result;
}

void sub_22FA8C058(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void TI::CP::CPTestCaseEval::evaluate_recognizers_on_tests(uint64_t a1@<X0>, _DWORD *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, void *a5@<X5>, int a6@<W6>, TI::CP::TestResultsSummarizer **a7@<X8>)
{
  char v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
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
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  BOOL v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  TTKTestCaseRecord *v43;
  void *v44;
  int v45;
  int v46;
  void *v47;
  BOOL v48;
  TI::CP::CPTestCaseEval *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  KB::String *v53;
  uint64_t *v54;
  void *v55;
  TI::CP::ContinuousPathTestResult *v56;
  TI::CP::ContinuousPathTestResult *v57;
  uint64_t v58;
  uint64_t v59;
  TI::CP::ContinuousPathTestResult *v60;
  TI::CP::ContinuousPathTestResult *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  TI::CP::ContinuousPathTestResult *v74;
  TI::CP::ContinuousPathTestResult *v75;
  TI::CP::ContinuousPathTestResult *v76;
  int64x2_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int64x2_t v82;
  unint64_t v83;
  TI::CP::ContinuousPathTestResult *v84;
  TI::CP::ContinuousPathTestResult *v85;
  TI::CP::ContinuousPathTestResult *v86;
  int64x2_t v87;
  unint64_t v88;
  uint64_t v89;
  void *v90;
  TTKTestCase *v91;
  void *v92;
  TTKTestCase *v93;
  id v94;
  const char *v95;
  void *v96;
  id v97;
  uint64_t v98;
  TI::CP::TestResultsSummarizer *v99;
  TI::CP::TestResultsSummarizer *v100;
  TI::CP::TestResultsSummarizer *v101;
  unint64_t v102;
  TI::CP::TestResultsSummarizer **v103;
  TIKeyboardInputManagerConfig *v104;
  TI::CP::TIPathRecognizerInterface *v105;
  int v106;
  TI::Favonius::FavoniusStrokeBuildManager *v108;
  const void **v109;
  _DWORD *v110;
  void *v111;
  void *context;
  int v114;
  int64x2_t v115;
  void *v116;
  char v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _OWORD v122[6];
  char v123;
  char v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;
  int v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  TI::CP::ContinuousPathTestResult *v143[2];
  _OWORD v144[2];
  TI::CP::ContinuousPathTestResult *v145[2];
  _OWORD v146[2];
  char v147;
  char v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  int v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  int v166;
  int64x2_t v167;
  unint64_t v168;
  void ***v169;
  void **v170;
  int64x2_t v171;
  unint64_t v172;
  _OWORD *v173;
  _BYTE v174[24];
  _BYTE v175[24];
  _BYTE v176[24];
  _BYTE v177[32];
  __int128 v178;
  __int128 v179;
  uint64_t *v180;
  _QWORD *v181;
  uint64_t v182;
  int64x2_t v183[2];
  void **v184;
  _BYTE v185[32];
  _OWORD v186[3];
  _OWORD v187[3];
  int v188;
  __int128 v189;
  __int128 v190;
  uint64_t *v191;
  _QWORD *v192;
  uint64_t v193;
  int64x2_t v194[2];
  int v195;
  _BYTE v196[32];
  _OWORD v197[3];
  _OWORD v198[3];
  int v199;
  __int128 v200;
  __int128 v201;
  uint64_t *v202;
  _QWORD *v203;
  uint64_t v204;
  int64x2_t v205[2];
  _BYTE v206[128];
  uint64_t v207[39];
  _OWORD v208[6];
  uint64_t v209;
  std::string v210;
  std::string v211;
  __int16 v212;
  char v213;
  _OWORD v214[12];
  uint64_t v215;
  _OWORD v216[6];
  uint64_t v217;
  std::string v218;
  std::string __p;
  __int16 v220;
  char v221;
  _OWORD v222[12];
  uint64_t v223;
  uint64_t v224;

  v224 = *MEMORY[0x24BDAC8D0];
  v104 = a5;
  v167 = 0uLL;
  v168 = 0;
  v11 = *(_BYTE *)(a1 + 8);
  v12 = *(_BYTE *)(a1 + 280);
  *(_OWORD *)v143 = 0u;
  memset(v144, 0, sizeof(v144));
  *(_OWORD *)v145 = 0u;
  memset(v146, 0, sizeof(v146));
  v151 = 0;
  v149 = 0;
  v150 = 0;
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0;
  v157 = 1065353216;
  v161 = 0u;
  v160 = 0u;
  v159 = 0u;
  v158 = 0u;
  v162 = 0;
  v163 = 0xC010000000000000;
  v164 = 0x4008000000000000;
  v165 = 0;
  v166 = 0;
  v147 = v11;
  v152 = v12;
  v148 = 0;
  memset(v122, 0, sizeof(v122));
  v127 = 0;
  v125 = 0;
  v126 = 0;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0;
  v133 = 1065353216;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0;
  v139 = 0xC010000000000000;
  v140 = 0x4008000000000000;
  v141 = 0;
  v142 = 0;
  v123 = v11;
  v128 = v12;
  v124 = 0;
  v110 = a2;
  if (*a2 == 1)
  {
    TI::CP::CPEval::create_favonius((TI::CP::CPEval *)a1, v104, v207);
    v108 = (TI::Favonius::FavoniusStrokeBuildManager *)v207[0];
    if ((*(unsigned int (**)(void))(*(_QWORD *)v207[0] + 368))() == *(_DWORD *)(a4 + 100))
    {
      v105 = 0;
      v109 = 0;
    }
    else
    {
      v109 = 0;
      v105 = 0;
      (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(_QWORD *)v108 + 376))(v108);
    }
  }
  else
  {
    v105 = 0;
    if (*a2)
      goto LABEL_149;
    v13 = *(_OWORD *)(a4 + 80);
    v216[4] = *(_OWORD *)(a4 + 64);
    v216[5] = v13;
    v217 = *(_QWORD *)(a4 + 96);
    v14 = *(_OWORD *)(a4 + 16);
    v216[0] = *(_OWORD *)a4;
    v216[1] = v14;
    v15 = *(_OWORD *)(a4 + 32);
    v216[3] = *(_OWORD *)(a4 + 48);
    v216[2] = v15;
    v16 = (_OWORD *)(a4 + 104);
    if (*(char *)(a4 + 127) < 0)
    {
      std::string::__init_copy_ctor_external(&v218, *(const std::string::value_type **)(a4 + 104), *(_QWORD *)(a4 + 112));
    }
    else
    {
      *(_OWORD *)&v218.__r_.__value_.__l.__data_ = *v16;
      v218.__r_.__value_.__r.__words[2] = *(_QWORD *)(a4 + 120);
    }
    v17 = (_OWORD *)(a4 + 128);
    if (*(char *)(a4 + 151) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a4 + 128), *(_QWORD *)(a4 + 136));
    }
    else
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *v17;
      __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(a4 + 144);
    }
    v220 = *(_WORD *)(a4 + 152);
    v221 = *(_BYTE *)(a4 + 154);
    MEMORY[0x2348A87C0](v222, a4 + 160);
    v18 = *(_OWORD *)(a4 + 336);
    v222[10] = *(_OWORD *)(a4 + 320);
    v222[11] = v18;
    v223 = *(_QWORD *)(a4 + 352);
    v19 = *(_OWORD *)(a4 + 272);
    v222[6] = *(_OWORD *)(a4 + 256);
    v222[7] = v19;
    v20 = *(_OWORD *)(a4 + 288);
    v222[9] = *(_OWORD *)(a4 + 304);
    v222[8] = v20;
    v21 = *(_OWORD *)(a4 + 208);
    v222[2] = *(_OWORD *)(a4 + 192);
    v222[3] = v21;
    v22 = *(_OWORD *)(a4 + 224);
    v222[5] = *(_OWORD *)(a4 + 240);
    v222[4] = v22;
    TI::CP::CPEval::create_recognizer_for_config((const std::string *)a1, a3, (uint64_t)v216, v207);
    v109 = (const void **)v207[0];
    KB::String::~String((KB::String *)v222);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v218.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v218.__r_.__value_.__l.__data_);
    if (a6 == 4)
    {
      v105 = 0;
    }
    else
    {
      v23 = *(_OWORD *)(a4 + 80);
      v208[4] = *(_OWORD *)(a4 + 64);
      v208[5] = v23;
      v209 = *(_QWORD *)(a4 + 96);
      v24 = *(_OWORD *)(a4 + 16);
      v208[0] = *(_OWORD *)a4;
      v208[1] = v24;
      v25 = *(_OWORD *)(a4 + 32);
      v208[3] = *(_OWORD *)(a4 + 48);
      v208[2] = v25;
      if (*(char *)(a4 + 127) < 0)
      {
        std::string::__init_copy_ctor_external(&v210, *(const std::string::value_type **)(a4 + 104), *(_QWORD *)(a4 + 112));
      }
      else
      {
        *(_OWORD *)&v210.__r_.__value_.__l.__data_ = *v16;
        v210.__r_.__value_.__r.__words[2] = *(_QWORD *)(a4 + 120);
      }
      if (*(char *)(a4 + 151) < 0)
      {
        std::string::__init_copy_ctor_external(&v211, *(const std::string::value_type **)(a4 + 128), *(_QWORD *)(a4 + 136));
      }
      else
      {
        *(_OWORD *)&v211.__r_.__value_.__l.__data_ = *v17;
        v211.__r_.__value_.__r.__words[2] = *(_QWORD *)(a4 + 144);
      }
      v212 = *(_WORD *)(a4 + 152);
      v213 = *(_BYTE *)(a4 + 154);
      MEMORY[0x2348A87C0](v214, a4 + 160);
      v26 = *(_OWORD *)(a4 + 336);
      v214[10] = *(_OWORD *)(a4 + 320);
      v214[11] = v26;
      v215 = *(_QWORD *)(a4 + 352);
      v27 = *(_OWORD *)(a4 + 272);
      v214[6] = *(_OWORD *)(a4 + 256);
      v214[7] = v27;
      v28 = *(_OWORD *)(a4 + 288);
      v214[9] = *(_OWORD *)(a4 + 304);
      v214[8] = v28;
      v29 = *(_OWORD *)(a4 + 208);
      v214[2] = *(_OWORD *)(a4 + 192);
      v214[3] = v29;
      v30 = *(_OWORD *)(a4 + 224);
      v214[5] = *(_OWORD *)(a4 + 240);
      v214[4] = v30;
      TI::CP::CPEval::create_recognizer_for_config((const std::string *)a1, a6, (uint64_t)v208, v207);
      v105 = (TI::CP::TIPathRecognizerInterface *)v207[0];
      KB::String::~String((KB::String *)v214);
      if (SHIBYTE(v211.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v211.__r_.__value_.__l.__data_);
      if (SHIBYTE(v210.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v210.__r_.__value_.__l.__data_);
    }
    if (!v109)
    {
LABEL_149:
      TI::CP::TestResultsSummarizer::TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v207, (const TI::CP::TestResultsSummarizer *)v143);
      *a7 = 0;
      a7[1] = 0;
      a7[2] = 0;
      v100 = (TI::CP::TestResultsSummarizer *)operator new(0x138uLL);
      *a7 = v100;
      a7[1] = v100;
      v101 = (TI::CP::TestResultsSummarizer *)((char *)v100 + 312);
      a7[2] = (TI::CP::TestResultsSummarizer *)((char *)v100 + 312);
      TI::CP::TestResultsSummarizer::TestResultsSummarizer(v100, (const TI::CP::TestResultsSummarizer *)v207);
      a7[1] = v101;
      TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v207);
      v108 = 0;
      v109 = 0;
      goto LABEL_157;
    }
    v108 = 0;
  }
  printf("Running test case ");
  objc_msgSend(*(id *)(a1 + 192), "reset");
  v103 = a7;
  objc_msgSend(*(id *)(a1 + 192), "getNextTestCase");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  v117 = 0;
  v32 = 0;
  v114 = 0;
  v115 = vdupq_n_s64(0xFFF0000000000000);
LABEL_31:
  if ((v117 & 1) == 0 && v31)
  {
    context = (void *)MEMORY[0x2348A8D30]();
    ++v114;
    HIDWORD(v33) = -1030792151 * v114;
    LODWORD(v33) = -1030792151 * v114;
    if ((v33 >> 1) <= 0x51EB851)
    {
      printf("%u...", v114);
      fflush((FILE *)*MEMORY[0x24BDAC8E8]);
    }
    objc_msgSend(v31, "intendedText");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "length") == 0;

    if (!v35)
    {
      +[TTKTestCase convertToIsolatedWordMode:](TTKTestCase, "convertToIsolatedWordMode:", v31);
      v36 = objc_claimAutoreleasedReturnValue();
      if (!v36)
      {
        objc_msgSend(v31, "intendedText");
        v94 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v95 = (const char *)objc_msgSend(v94, "UTF8String");
        objc_msgSend(v31, "metadata");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "objectForKey:", CFSTR("recordIdentifier"));
        v97 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        printf("\nUnexpected failure [#%u] converting to isolated word mode for record %u, string = <%s>, id=<%s>\n", ++v106, v114, v95, (const char *)objc_msgSend(v97, "UTF8String"));

        objc_msgSend(*(id *)(a1 + 192), "getNextTestCase");
        v117 = 0;
        v116 = v31;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_146;
      }
      v37 = (void *)v36;

      v31 = v37;
    }
    v111 = v31;
    if (*(_QWORD *)(a1 + 200))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v116 = 0;
    }
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    objc_msgSend(v31, "records");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v118, v206, 16);
    if (!v39)
    {
      v117 = 0;
      goto LABEL_141;
    }
    v117 = 0;
    v40 = *(_QWORD *)v119;
    while (1)
    {
      v41 = 0;
      v42 = v32;
      do
      {
        if (*(_QWORD *)v119 != v40)
          objc_enumerationMutation(v38);
        v43 = *(TTKTestCaseRecord **)(*((_QWORD *)&v118 + 1) + 8 * v41);
        v44 = (void *)MEMORY[0x2348A8D30]();
        v45 = *(_DWORD *)(a1 + 292);
        if ((v45 & 0x80000000) == 0 && (int)v42 > v45)
        {
          v46 = 4;
          v117 = 1;
LABEL_49:
          v32 = v42;
          goto LABEL_55;
        }
        if ((int)v42 < *(_DWORD *)(a1 + 288))
        {
          v32 = (v42 + 1);
LABEL_54:
          v46 = 5;
          goto LABEL_55;
        }
        -[TTKTestCaseRecord touchDataCollection](v43, "touchDataCollection");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "count") == 0;

        if (v48)
        {
          v46 = 5;
          goto LABEL_49;
        }
        v32 = (v42 + 1);
        if (((int)v42 - *(_DWORD *)(a1 + 288)) % *(_DWORD *)(a1 + 296))
          goto LABEL_54;
        TI::CP::TTKTestCaseConverter::convert(*(TI::CP::TTKTestCaseConverter **)(a1 + 184), v43, (uint64_t)v207);
        KB::String::String((KB::String *)v196);
        v199 = 0;
        memset(v197, 0, sizeof(v197));
        memset(v198, 0, sizeof(v198));
        v203 = 0;
        v204 = 0;
        v202 = (uint64_t *)&v203;
        v205[0] = v115;
        *(__int32 *)((char *)v205[1].i32 + 1) = 0;
        v49 = (TI::CP::CPTestCaseEval *)KB::String::String((KB::String *)v185);
        v188 = 0;
        memset(v186, 0, sizeof(v186));
        memset(v187, 0, sizeof(v187));
        v192 = 0;
        v193 = 0;
        v191 = (uint64_t *)&v192;
        v194[0] = v115;
        *(__int32 *)((char *)v194[1].i32 + 1) = 0;
        if (*v110 == 1)
        {
          TI::CP::CPEval::evaluate_test_case_favonius((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v207, v108, v42, (uint64_t)&v170);
          v195 = (int)v170;
          KB::String::operator=();
          KB::CandidateCollection::operator=((uint64_t)v197, (uint64_t)v174);
          v200 = v178;
          v201 = v179;
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v203);
          v51 = v181;
          v202 = v180;
          v203 = v181;
          v204 = v182;
          if (v182)
          {
            v181[2] = &v203;
            v51 = 0;
            v180 = (uint64_t *)&v181;
            v181 = 0;
            v182 = 0;
          }
          else
          {
            v202 = (uint64_t *)&v203;
          }
          v205[0] = v183[0];
          *(int64x2_t *)((char *)v205 + 12) = *(int64x2_t *)((char *)v183 + 12);
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v51);
          v169 = (void ***)v177;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
          v169 = (void ***)v176;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
          v169 = (void ***)v175;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
          v169 = (void ***)v174;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
          v53 = (KB::String *)&v171;
        }
        else
        {
          if (*v110)
            goto LABEL_77;
          TI::CP::CPEval::evaluate_test_case((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v207, (TI::CP::TIPathRecognizerInterface *)v109, v42, (uint64_t)&v170);
          v195 = (int)v170;
          KB::String::operator=();
          KB::CandidateCollection::operator=((uint64_t)v197, (uint64_t)v174);
          v200 = v178;
          v201 = v179;
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v203);
          v50 = v181;
          v202 = v180;
          v203 = v181;
          v204 = v182;
          if (v182)
          {
            v181[2] = &v203;
            v50 = 0;
            v180 = (uint64_t *)&v181;
            v181 = 0;
            v182 = 0;
          }
          else
          {
            v202 = (uint64_t *)&v203;
          }
          v205[0] = v183[0];
          *(int64x2_t *)((char *)v205 + 12) = *(int64x2_t *)((char *)v183 + 12);
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v50);
          v169 = (void ***)v177;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
          v169 = (void ***)v176;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
          v169 = (void ***)v175;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
          v169 = (void ***)v174;
          std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
          KB::String::~String((KB::String *)&v171);
          if (a6 != 4)
          {
            TI::CP::CPEval::evaluate_test_case((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)v207, v105, v42, (uint64_t)&v170);
            LODWORD(v184) = (_DWORD)v170;
            KB::String::operator=();
            KB::CandidateCollection::operator=((uint64_t)v186, (uint64_t)v174);
            v189 = v178;
            v190 = v179;
            std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v192);
            v52 = v181;
            v191 = v180;
            v192 = v181;
            v193 = v182;
            if (v182)
            {
              v181[2] = &v192;
              v52 = 0;
              v180 = (uint64_t *)&v181;
              v181 = 0;
              v182 = 0;
            }
            else
            {
              v191 = (uint64_t *)&v192;
            }
            v194[0] = v183[0];
            *(int64x2_t *)((char *)v194 + 12) = *(int64x2_t *)((char *)v183 + 12);
            std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v52);
            v169 = (void ***)v177;
            std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
            v169 = (void ***)v176;
            std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
            v169 = (void ***)v175;
            std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
            v169 = (void ***)v174;
            std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
            KB::String::~String((KB::String *)&v171);
          }
          if (a3)
            goto LABEL_77;
          MEMORY[0x2348A87B4](&v170, "favonius");
          v169 = &v170;
          v54 = std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__emplace_unique_key_args<KB::String,std::piecewise_construct_t const&,std::tuple<KB::String const&>,std::tuple<>>(&v202, (uint64_t)&v170, &v169);
          TI::CP::Path::operator=((void **)v54 + 8, v109 + 7);
          v53 = (KB::String *)&v170;
        }
        KB::String::~String(v53);
LABEL_77:
        if (*(_QWORD *)(a1 + 200) && ((v200 & 0x80000000) != 0 || (int)v200 >= *(_DWORD *)(a1 + 284)))
        {
          TI::CP::CPTestCaseEval::create_results_dictionary(v49, (const TI::CP::ContinuousPathTestResult *)&v195, 0x28u);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[TTKTestCaseRecord setAnnotation:forKey:](v43, "setAnnotation:forKey:", v55, CFSTR("cpEvalResults"));
          objc_msgSend(v116, "addObject:", v43);

        }
        TI::CP::TestResultsSummarizer::add_result((TI::CP::TestResultsSummarizer *)v143, (const TI::CP::ContinuousPathTestResult *)&v195);
        if (a6 != 4)
          TI::CP::TestResultsSummarizer::add_result((TI::CP::TestResultsSummarizer *)v122, (const TI::CP::ContinuousPathTestResult *)&v184);
        if (!(_DWORD)v200)
        {
          if ((_DWORD)v189 == -1)
          {
            v58 = *(_QWORD *)&v144[1];
            if (*(_QWORD *)&v144[1] >= *((_QWORD *)&v144[1] + 1))
            {
              v66 = 0x34F72C234F72C235 * ((uint64_t)(*(_QWORD *)&v144[1] - *((_QWORD *)&v144[0] + 1)) >> 3);
              v67 = v66 + 1;
              if ((unint64_t)(v66 + 1) > 0x11A7B9611A7B961)
                goto LABEL_164;
              if (0x69EE58469EE5846ALL * ((uint64_t)(*((_QWORD *)&v144[1] + 1) - *((_QWORD *)&v144[0] + 1)) >> 3) > v67)
                v67 = 0x69EE58469EE5846ALL * ((uint64_t)(*((_QWORD *)&v144[1] + 1) - *((_QWORD *)&v144[0] + 1)) >> 3);
              if ((unint64_t)(0x34F72C234F72C235
                                    * ((uint64_t)(*((_QWORD *)&v144[1] + 1) - *((_QWORD *)&v144[0] + 1)) >> 3)) >= 0x8D3DCB08D3DCB0)
                v68 = 0x11A7B9611A7B961;
              else
                v68 = v67;
              v173 = (_OWORD *)((char *)&v144[1] + 8);
              if (v68)
                v68 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v68);
              else
                v69 = 0;
              v170 = (void **)v68;
              v171.i64[0] = v68 + 232 * v66;
              v171.i64[1] = v171.i64[0];
              v172 = v68 + 232 * v69;
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)v171.i64[0], (const TI::CP::ContinuousPathTestResult *)&v195);
              v79 = v171.i64[0];
              v59 = v171.i64[1] + 232;
              v171.i64[1] += 232;
              v80 = *(_QWORD *)&v144[1];
              v81 = *((_QWORD *)&v144[0] + 1);
              if (*(_QWORD *)&v144[1] == *((_QWORD *)&v144[0] + 1))
              {
                v82 = vdupq_n_s64(*(unint64_t *)&v144[1]);
              }
              else
              {
                do
                {
                  v80 -= 232;
                  v79 = std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>(v79 - 232, v80);
                }
                while (v80 != v81);
                v82 = *(int64x2_t *)((char *)v144 + 8);
                v59 = v171.i64[1];
              }
              *((_QWORD *)&v144[0] + 1) = v79;
              *(_QWORD *)&v144[1] = v59;
              v171 = v82;
              v83 = *((_QWORD *)&v144[1] + 1);
              *((_QWORD *)&v144[1] + 1) = v172;
              v172 = v83;
              v170 = (void **)v82.i64[0];
              std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v170);
            }
            else
            {
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*(TI::CP::ContinuousPathTestResult **)&v144[1], (const TI::CP::ContinuousPathTestResult *)&v195);
              v59 = v58 + 232;
            }
            *(_QWORD *)&v144[1] = v59;
          }
          else if ((int)v189 < 1)
          {
            v60 = v145[1];
            if (v145[1] >= (TI::CP::ContinuousPathTestResult *)*(_QWORD *)&v146[0])
            {
              v70 = 0x34F72C234F72C235 * ((v145[1] - v145[0]) >> 3);
              v71 = v70 + 1;
              if ((unint64_t)(v70 + 1) > 0x11A7B9611A7B961)
LABEL_164:
                abort();
              if (0x69EE58469EE5846ALL * ((uint64_t)(*(_QWORD *)&v146[0] - (unint64_t)v145[0]) >> 3) > v71)
                v71 = 0x69EE58469EE5846ALL * ((uint64_t)(*(_QWORD *)&v146[0] - (unint64_t)v145[0]) >> 3);
              if ((unint64_t)(0x34F72C234F72C235
                                    * ((uint64_t)(*(_QWORD *)&v146[0] - (unint64_t)v145[0]) >> 3)) >= 0x8D3DCB08D3DCB0)
                v72 = 0x11A7B9611A7B961;
              else
                v72 = v71;
              v173 = v146;
              if (v72)
                v72 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v72);
              else
                v73 = 0;
              v170 = (void **)v72;
              v171.i64[0] = v72 + 232 * v70;
              v171.i64[1] = v171.i64[0];
              v172 = v72 + 232 * v73;
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)v171.i64[0], (const TI::CP::ContinuousPathTestResult *)&v195);
              v84 = (TI::CP::ContinuousPathTestResult *)v171.i64[0];
              v61 = (TI::CP::ContinuousPathTestResult *)(v171.i64[1] + 232);
              v171.i64[1] += 232;
              v85 = v145[1];
              v86 = v145[0];
              if (v145[1] == v145[0])
              {
                v87 = vdupq_n_s64((unint64_t)v145[1]);
              }
              else
              {
                do
                {
                  v85 = (TI::CP::ContinuousPathTestResult *)((char *)v85 - 232);
                  v84 = (TI::CP::ContinuousPathTestResult *)std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>((uint64_t)v84 - 232, (uint64_t)v85);
                }
                while (v85 != v86);
                v87 = *(int64x2_t *)v145;
                v61 = (TI::CP::ContinuousPathTestResult *)v171.i64[1];
              }
              v145[0] = v84;
              v145[1] = v61;
              v171 = v87;
              v88 = *(_QWORD *)&v146[0];
              *(_QWORD *)&v146[0] = v172;
              v172 = v88;
              v170 = (void **)v87.i64[0];
              std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v170);
            }
            else
            {
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v145[1], (const TI::CP::ContinuousPathTestResult *)&v195);
              v61 = (TI::CP::ContinuousPathTestResult *)((char *)v60 + 232);
            }
            v145[1] = v61;
          }
          else
          {
            v56 = v143[1];
            if (v143[1] >= (TI::CP::ContinuousPathTestResult *)*(_QWORD *)&v144[0])
            {
              v62 = 0x34F72C234F72C235 * ((v143[1] - v143[0]) >> 3);
              v63 = v62 + 1;
              if ((unint64_t)(v62 + 1) > 0x11A7B9611A7B961)
                goto LABEL_164;
              if (0x69EE58469EE5846ALL * ((uint64_t)(*(_QWORD *)&v144[0] - (unint64_t)v143[0]) >> 3) > v63)
                v63 = 0x69EE58469EE5846ALL * ((uint64_t)(*(_QWORD *)&v144[0] - (unint64_t)v143[0]) >> 3);
              if ((unint64_t)(0x34F72C234F72C235
                                    * ((uint64_t)(*(_QWORD *)&v144[0] - (unint64_t)v143[0]) >> 3)) >= 0x8D3DCB08D3DCB0)
                v64 = 0x11A7B9611A7B961;
              else
                v64 = v63;
              v173 = v144;
              if (v64)
                v64 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v64);
              else
                v65 = 0;
              v170 = (void **)v64;
              v171.i64[0] = v64 + 232 * v62;
              v171.i64[1] = v171.i64[0];
              v172 = v64 + 232 * v65;
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)v171.i64[0], (const TI::CP::ContinuousPathTestResult *)&v195);
              v74 = (TI::CP::ContinuousPathTestResult *)v171.i64[0];
              v57 = (TI::CP::ContinuousPathTestResult *)(v171.i64[1] + 232);
              v171.i64[1] += 232;
              v75 = v143[1];
              v76 = v143[0];
              if (v143[1] == v143[0])
              {
                v77 = vdupq_n_s64((unint64_t)v143[1]);
              }
              else
              {
                do
                {
                  v75 = (TI::CP::ContinuousPathTestResult *)((char *)v75 - 232);
                  v74 = (TI::CP::ContinuousPathTestResult *)std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>((uint64_t)v74 - 232, (uint64_t)v75);
                }
                while (v75 != v76);
                v77 = *(int64x2_t *)v143;
                v57 = (TI::CP::ContinuousPathTestResult *)v171.i64[1];
              }
              v143[0] = v74;
              v143[1] = v57;
              v171 = v77;
              v78 = *(_QWORD *)&v144[0];
              *(_QWORD *)&v144[0] = v172;
              v172 = v78;
              v170 = (void **)v77.i64[0];
              std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v170);
            }
            else
            {
              TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v143[1], (const TI::CP::ContinuousPathTestResult *)&v195);
              v57 = (TI::CP::ContinuousPathTestResult *)((char *)v56 + 232);
            }
            v143[1] = v57;
          }
        }
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v192);
        v170 = (void **)&v187[1] + 1;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v170);
        v170 = (void **)v187;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v170);
        v170 = (void **)&v186[1] + 1;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v170);
        v170 = (void **)v186;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v170);
        KB::String::~String((KB::String *)v185);
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v203);
        v184 = (void **)&v198[1] + 1;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v184);
        v184 = (void **)v198;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v184);
        v184 = (void **)&v197[1] + 1;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v184);
        v184 = (void **)v197;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v184);
        KB::String::~String((KB::String *)v196);
        TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase((TI::CP::ContinuousPathTestCase *)v207);
        v46 = 0;
LABEL_55:
        objc_autoreleasePoolPop(v44);
        if (v46 != 5 && v46)
          goto LABEL_141;
        ++v41;
        v42 = v32;
      }
      while (v41 != v39);
      v89 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v118, v206, 16);
      v39 = v89;
      if (!v89)
      {
LABEL_141:

        v90 = v111;
        if (*(_QWORD *)(a1 + 200))
        {
          if (objc_msgSend(v116, "count"))
          {
            v91 = [TTKTestCase alloc];
            objc_msgSend(v111, "metadata");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = -[TTKTestCase initWithMetadata:records:](v91, "initWithMetadata:records:", v92, v116);

            objc_msgSend(*(id *)(a1 + 200), "pushNextTestCase:", v93);
            v90 = v111;
          }
        }
        objc_msgSend(*(id *)(a1 + 192), "getNextTestCase");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_146:
        objc_autoreleasePoolPop(context);
        goto LABEL_31;
      }
    }
  }
  putchar(10);
  fflush((FILE *)*MEMORY[0x24BDAC8E8]);
  v98 = v167.i64[1];
  if (v167.i64[1] >= v168)
  {
    v99 = (TI::CP::TestResultsSummarizer *)std::vector<TI::CP::TestResultsSummarizer>::__push_back_slow_path<TI::CP::TestResultsSummarizer const&>(&v167, (const TI::CP::TestResultsSummarizer *)v143);
  }
  else
  {
    TI::CP::TestResultsSummarizer::TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v167.i64[1], (const TI::CP::TestResultsSummarizer *)v143);
    v99 = (TI::CP::TestResultsSummarizer *)(v98 + 312);
  }
  v167.i64[1] = (uint64_t)v99;
  if (a6 != 4)
  {
    if ((unint64_t)v99 >= v168)
    {
      v99 = (TI::CP::TestResultsSummarizer *)std::vector<TI::CP::TestResultsSummarizer>::__push_back_slow_path<TI::CP::TestResultsSummarizer const&>(&v167, (const TI::CP::TestResultsSummarizer *)v122);
    }
    else
    {
      TI::CP::TestResultsSummarizer::TestResultsSummarizer(v99, (const TI::CP::TestResultsSummarizer *)v122);
      v99 = (TI::CP::TestResultsSummarizer *)((char *)v99 + 312);
    }
    v167.i64[1] = (uint64_t)v99;
  }
  v102 = v168;
  *v103 = (TI::CP::TestResultsSummarizer *)v167.i64[0];
  v103[1] = v99;
  v103[2] = (TI::CP::TestResultsSummarizer *)v102;
  v168 = 0;
  v167 = 0uLL;

LABEL_157:
  if (v105)
    (*(void (**)(TI::CP::TIPathRecognizerInterface *))(*(_QWORD *)v105 + 8))(v105);
  if (v108)
    (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(_QWORD *)v108 + 8))(v108);
  if (v109)
    (*((void (**)(const void **))*v109 + 1))(v109);
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v122);
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v143);
  v143[0] = (TI::CP::ContinuousPathTestResult *)&v167;
  std::vector<TI::CP::TestResultsSummarizer>::__destroy_vector::operator()[abi:nn180100]((void ***)v143);

}

void sub_22FA8D3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  if (SLOBYTE(STACK[0x95F]) < 0)
    operator delete((void *)STACK[0x948]);
  if (a27)
    (*(void (**)(uint64_t))(*(_QWORD *)a27 + 8))(a27);
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)&a67);
  TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)&STACK[0x310]);
  STACK[0x310] = (unint64_t)&STACK[0x450];
  std::vector<TI::CP::TestResultsSummarizer>::__destroy_vector::operator()[abi:nn180100]((void ***)&STACK[0x310]);

  _Unwind_Resume(a1);
}

uint64_t std::vector<TI::CP::TestResultsSummarizer>::__push_back_slow_path<TI::CP::TestResultsSummarizer const&>(int64x2_t *a1, const TI::CP::TestResultsSummarizer *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  int64x2_t v27;
  char *v28;
  char *v30;
  int64x2_t v31;
  char *v32;
  int64x2_t *v33;

  v2 = 0x6F96F96F96F96F97 * ((a1->i64[1] - a1->i64[0]) >> 3);
  v3 = v2 + 1;
  if ((unint64_t)(v2 + 1) > 0xD20D20D20D20D2)
    abort();
  if (0xDF2DF2DF2DF2DF2ELL * ((a1[1].i64[0] - a1->i64[0]) >> 3) > v3)
    v3 = 0xDF2DF2DF2DF2DF2ELL * ((a1[1].i64[0] - a1->i64[0]) >> 3);
  if ((unint64_t)(0x6F96F96F96F96F97 * ((a1[1].i64[0] - a1->i64[0]) >> 3)) >= 0x69069069069069)
    v6 = 0xD20D20D20D20D2;
  else
    v6 = v3;
  v33 = a1 + 1;
  if (v6)
  {
    if (v6 > 0xD20D20D20D20D2)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v7 = (char *)operator new(312 * v6);
  }
  else
  {
    v7 = 0;
  }
  v30 = v7;
  v31.i64[0] = (uint64_t)&v7[312 * v2];
  v32 = &v7[312 * v6];
  TI::CP::TestResultsSummarizer::TestResultsSummarizer((TI::CP::TestResultsSummarizer *)v31.i64[0], a2);
  v8 = v31.i64[0];
  v9 = v31.i64[0] + 312;
  v31.i64[1] = v31.i64[0] + 312;
  v11 = a1->i64[0];
  v10 = a1->u64[1];
  if (v10 == a1->i64[0])
  {
    v27 = vdupq_n_s64(v10);
  }
  else
  {
    v12 = 0;
    do
    {
      v13 = v8 + v12;
      v14 = (_QWORD *)(v8 + v12 - 312);
      v15 = v10 + v12;
      v16 = v10 + v12 - 312;
      *(_QWORD *)(v8 + v12 - 304) = 0;
      *v14 = 0;
      v14[2] = 0;
      *(_OWORD *)v14 = *(_OWORD *)v16;
      *(_QWORD *)(v8 + v12 - 296) = *(_QWORD *)(v10 + v12 - 296);
      *(_QWORD *)(v10 + v12 - 304) = 0;
      *(_QWORD *)v16 = 0;
      *(_QWORD *)(v16 + 16) = 0;
      v17 = (_QWORD *)(v8 + v12 - 288);
      v18 = v10 + v12 - 288;
      *(_QWORD *)(v8 + v12 - 280) = 0;
      *v17 = 0;
      v17[2] = 0;
      *(_OWORD *)v17 = *(_OWORD *)v18;
      *(_QWORD *)(v8 + v12 - 272) = *(_QWORD *)(v10 + v12 - 272);
      *(_QWORD *)(v10 + v12 - 280) = 0;
      *(_QWORD *)v18 = 0;
      *(_QWORD *)(v18 + 16) = 0;
      v19 = (_QWORD *)(v8 + v12 - 264);
      v20 = (_OWORD *)(v10 + v12 - 264);
      *v19 = 0;
      *(_QWORD *)(v13 - 256) = 0;
      *(_QWORD *)(v13 - 248) = 0;
      *(_OWORD *)v19 = *v20;
      *(_QWORD *)(v13 - 248) = *(_QWORD *)(v10 + v12 - 248);
      *(_QWORD *)v20 = 0;
      *(_QWORD *)(v15 - 256) = 0;
      *(_QWORD *)(v15 - 248) = 0;
      v21 = *(_OWORD *)(v10 + v12 - 240);
      v22 = *(_OWORD *)(v10 + v12 - 224);
      v23 = *(_OWORD *)(v10 + v12 - 208);
      *(_OWORD *)(v13 - 199) = *(_OWORD *)(v10 + v12 - 199);
      *(_OWORD *)(v13 - 224) = v22;
      *(_OWORD *)(v13 - 208) = v23;
      *(_OWORD *)(v13 - 240) = v21;
      *(_QWORD *)(v13 - 168) = 0;
      *(_QWORD *)(v13 - 160) = 0;
      *(_QWORD *)(v13 - 176) = 0;
      *(_OWORD *)(v13 - 176) = *(_OWORD *)(v10 + v12 - 176);
      *(_QWORD *)(v13 - 160) = *(_QWORD *)(v10 + v12 - 160);
      *(_QWORD *)(v15 - 176) = 0;
      *(_QWORD *)(v15 - 168) = 0;
      *(_QWORD *)(v15 - 160) = 0;
      std::__hash_table<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<TI::CP::ContinuousPathTestResult>>>>::__hash_table(v8 + v12 - 152, (uint64_t *)(v10 + v12 - 152));
      *(_QWORD *)(v13 - 112) = 0;
      *(_QWORD *)(v13 - 104) = 0;
      *(_QWORD *)(v13 - 96) = 0;
      *(_OWORD *)(v13 - 112) = *(_OWORD *)(v10 + v12 - 112);
      *(_QWORD *)(v13 - 96) = *(_QWORD *)(v10 + v12 - 96);
      *(_QWORD *)(v15 - 112) = 0;
      *(_QWORD *)(v15 - 104) = 0;
      *(_QWORD *)(v15 - 96) = 0;
      *(_QWORD *)(v13 - 88) = 0;
      *(_QWORD *)(v13 - 80) = 0;
      *(_QWORD *)(v13 - 72) = 0;
      *(_OWORD *)(v13 - 88) = *(_OWORD *)(v10 + v12 - 88);
      *(_QWORD *)(v13 - 72) = *(_QWORD *)(v10 + v12 - 72);
      *(_QWORD *)(v15 - 88) = 0;
      *(_QWORD *)(v15 - 80) = 0;
      *(_QWORD *)(v15 - 72) = 0;
      *(_QWORD *)(v13 - 64) = 0;
      *(_QWORD *)(v13 - 56) = 0;
      *(_QWORD *)(v13 - 48) = 0;
      *(_OWORD *)(v13 - 64) = *(_OWORD *)(v10 + v12 - 64);
      *(_QWORD *)(v13 - 48) = *(_QWORD *)(v10 + v12 - 48);
      *(_QWORD *)(v15 - 64) = 0;
      *(_QWORD *)(v15 - 56) = 0;
      v24 = *(_OWORD *)(v10 + v12 - 40);
      v25 = *(_OWORD *)(v10 + v12 - 24);
      v26 = *(_DWORD *)(v10 + v12 - 8);
      *(_QWORD *)(v15 - 48) = 0;
      *(_DWORD *)(v13 - 8) = v26;
      *(_OWORD *)(v13 - 24) = v25;
      *(_OWORD *)(v13 - 40) = v24;
      v12 -= 312;
    }
    while (v10 + v12 != v11);
    v8 += v12;
    v27 = *a1;
    v9 = v31.i64[1];
  }
  a1->i64[0] = v8;
  a1->i64[1] = v9;
  v31 = v27;
  v28 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v32;
  v32 = v28;
  v30 = (char *)v27.i64[0];
  std::__split_buffer<TI::CP::TestResultsSummarizer>::~__split_buffer((uint64_t)&v30);
  return v9;
}

void sub_22FA8D938(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<TI::CP::TestResultsSummarizer>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<TI::CP::TestResultsSummarizer>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = v2;
    if (v4 != v2)
    {
      do
        TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)(v4 - 312));
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__split_buffer<TI::CP::TestResultsSummarizer>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 312;
    TI::CP::TestResultsSummarizer::~TestResultsSummarizer((TI::CP::TestResultsSummarizer *)(i - 312));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t TI::CP::CPTestCaseEval::set_detail_level(uint64_t this, int a2)
{
  int v2;

  if (a2 >= 2)
  {
    v2 = 2;
LABEL_5:
    *(_DWORD *)(this + 40) = v2;
    return this;
  }
  if (a2 == 1)
  {
    v2 = 1;
    goto LABEL_5;
  }
  *(_DWORD *)(this + 40) = 0;
  return this;
}

void TI::CP::CPTestCaseEval::dump_summary_results_to_dir(TI::CP::CPTestCaseEval *this, const TI::CP::ContinuousPathTestResult **a2, NSString *a3)
{
  NSString *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v25);
  v8 = v25;

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v8, "description");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("[write_detailed_report] Failed: %s\n", (const char *)objc_msgSend(v9, "UTF8String"));
    goto LABEL_7;
  }
  -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", CFSTR("ensembleTop1-baseMatchIndexHigher.json"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  TI::CP::CPTestCaseEval::serialize_results((uint64_t)v9, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v10, 1, &v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;

  if (v12)
  {
    objc_msgSend(v12, "description");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    NSLog(CFSTR("[write_detailed_report] Failed: %s\n"), objc_msgSend(v13, "UTF8String"));
  }
  else
  {
    if ((objc_msgSend(v11, "writeToFile:atomically:", v9, 1) & 1) == 0)
    {
      NSLog(CFSTR("failed to write data to file: %@"), v9);
      v8 = 0;
      goto LABEL_5;
    }
    -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", CFSTR("ensembleTop1-baseMatchIndexSame.json"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    TI::CP::CPTestCaseEval::serialize_results(v15, a2 + 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v16, 1, &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;

    if (v12)
    {
      objc_msgSend(v12, "description");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      NSLog(CFSTR("[write_detailed_report] Failed: %s\n"), objc_msgSend(v13, "UTF8String"));
      v9 = v14;
      v10 = v16;
      v11 = v17;
    }
    else
    {
      if ((objc_msgSend(v17, "writeToFile:atomically:", v14, 1) & 1) == 0)
      {
        v9 = v14;
        v10 = v16;
        v11 = v17;
        NSLog(CFSTR("failed to write data to file: %@"), v14);
        v8 = 0;
        goto LABEL_5;
      }
      -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", CFSTR("ensembleTop1-notInBase.json"));
      v21 = objc_claimAutoreleasedReturnValue();

      TI::CP::CPTestCaseEval::serialize_results(v18, a2 + 3);
      v19 = objc_claimAutoreleasedReturnValue();

      v22 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v19, 1, &v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v22;

      if (!v12)
      {
        if ((objc_msgSend(v20, "writeToFile:atomically:", v21, 1) & 1) != 0)
        {
          v8 = 0;
          v9 = (id)v21;
          v10 = (void *)v19;
          v11 = v20;
        }
        else
        {
          v9 = (id)v21;
          v10 = (void *)v19;
          v11 = v20;
          NSLog(CFSTR("failed to write data to file: %@"), v21);
          v8 = 0;
        }
        goto LABEL_5;
      }
      objc_msgSend(v12, "description");
      v11 = v20;
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      NSLog(CFSTR("[write_detailed_report] Failed: %s\n"), objc_msgSend(v13, "UTF8String"));
      v9 = (id)v21;
      v10 = (void *)v19;
    }
  }

  v8 = v12;
LABEL_5:

LABEL_7:
}

void sub_22FA8DE28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

id TI::CP::CPTestCaseEval::serialize_results(uint64_t a1, const TI::CP::ContinuousPathTestResult **a2)
{
  TI::CP::CPTestCaseEval *v3;
  TI::CP::CPTestCaseEval *v4;
  const TI::CP::ContinuousPathTestResult *v5;
  const TI::CP::ContinuousPathTestResult *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (TI::CP::CPTestCaseEval *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *a2;
  v6 = a2[1];
  while (v5 != v6)
  {
    TI::CP::CPTestCaseEval::create_results_dictionary(v3, v5, 1u);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TI::CP::CPTestCaseEval addObject:](v4, "addObject:", v7);

    v5 = (const TI::CP::ContinuousPathTestResult *)((char *)v5 + 232);
  }
  v10 = CFSTR("summary");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_22FA8DF94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void TI::CP::CPTestCaseEval::write_detailed_report(TI::CP::CPTestCaseEval *this, objc_object *a2, NSString *a3)
{
  objc_object *v5;
  NSString *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  puts("Writing detailed report…");
  if (v5)
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 1, &v23);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v23;
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("[write_detailed_report] Failed: %s\n", (const char *)objc_msgSend(v10, "UTF8String"));
LABEL_16:

      goto LABEL_17;
    }
    if (*((_BYTE *)this + 280))
    {
      v11 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4));
      printf("Detailed results:\n%s\n", (const char *)objc_msgSend(v11, "UTF8String"));

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v14 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v22);
    v9 = v22;

    if ((v14 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "createFileAtPath:contents:attributes:", v16, v17, 0);

      if ((v18 & 1) == 0)
      {
        -[NSString UTF8String](objc_retainAutorelease(v6), "UTF8String");
        printf("[write_detailed_report] Failed to create file %s\n");
        goto LABEL_15;
      }
      objc_msgSend(v10, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v7, "writeToFile:atomically:", v19, 1);

      if ((v20 & 1) == 0)
      {
        -[NSString UTF8String](objc_retainAutorelease(v6), "UTF8String");
        printf("[write_detailed_report] Failed to write to file %s\n");
        goto LABEL_15;
      }
      objc_msgSend(v10, "path");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "UTF8String");
      printf("Detailed report written to: %s\n");
    }
    else
    {
      objc_msgSend(v9, "description");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "UTF8String");
      printf("[write_detailed_report] Failed: %s\n");
    }

LABEL_15:
    goto LABEL_16;
  }
  puts("[write_detailed_report] Failed: no detailed results available.");
LABEL_17:

}

void sub_22FA8E26C(_Unwind_Exception *a1)
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

id TI::CP::CPTestCaseEval::serialize_results_legacy(uint64_t a1, unsigned int **a2, void *a3, signed int a4)
{
  unsigned int *v5;
  unsigned int *v6;
  signed int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id *i;
  id *v14;
  id v15;
  const KB::String *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  id v28;
  id v29;
  unsigned int *v31;
  void *v32;
  void *v33;
  unsigned int *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  const __CFString *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _BYTE v44[128];
  _BYTE v45[32];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *a2;
  v6 = a2[1];
  v31 = v6;
  while (v5 != v6)
  {
    v34 = v5;
    v7 = v5[36];
    if (v7 < 0 || v7 >= a4)
    {
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("test_cases"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", *v34);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKey:", CFSTR("true_word"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = (const __CFString *)v9;
      else
        v11 = &stru_24FD49B78;
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v11, CFSTR("expected_word"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v34[36]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v12, CFSTR("matched_indx"));

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id *)*((_QWORD *)v34 + 5);
      for (i = (id *)*((_QWORD *)v34 + 6); v14 != i; v14 += 125)
      {
        v15 = v14[123];
        KB::Candidate::capitalized_string((KB::Candidate *)v14);
        KB::ns_string((KB *)v45, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        KB::String::~String((KB::String *)v45);
        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allKeys");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "sortedArrayUsingSelector:", sel_compare_);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v21 = v20;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v22)
          {
            v23 = *(_QWORD *)v37;
            do
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v37 != v23)
                  objc_enumerationMutation(v21);
                objc_msgSend(v15, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v25);

              }
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v22);
          }

          v42[0] = CFSTR("cand");
          v42[1] = CFSTR("score_info");
          v43[0] = v17;
          v43[1] = v18;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v40 = CFSTR("cand");
          v41 = v17;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v35, "addObject:", v26);

      }
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("candidates_info"));
      objc_msgSend(v28, "addObject:", v33);

    }
    v5 = v34 + 58;
    v6 = v31;
  }

  return v28;
}

void sub_22FA8E6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void TI::CP::CPTestCaseEval::set_shape_store_config(TI::CP::CPTestCaseEval *this, NSString *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const void *v9;
  NSString *v10;

  v10 = a2;
  v3 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "fileExistsAtPath:", v8))
    objc_msgSend(v6, "removeItemAtPath:error:", v8, 0);
  v9 = (const void *)*((_QWORD *)this + 3);
  if (v9 != v5)
  {
    if (v5)
    {
      CFRetain(v5);
      v9 = (const void *)*((_QWORD *)this + 3);
    }
    if (v9)
      CFRelease(v9);
    *((_QWORD *)this + 3) = v5;
  }
  KB::retain_ptr<__CFString const*>::operator=((const void **)this + 4, v10);

}

void sub_22FA8E8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_22FA8EA00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22FA8EA7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22FA8ED60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22FA8F180(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA8F498(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22FA8F8EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22FA8FA5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL _isNumberPunctationKey(NSString *a1)
{
  NSString *v1;
  uint64_t v2;
  uint64_t v3;
  UChar32 v4;
  _BOOL8 v5;

  v1 = a1;
  v2 = -[NSString _rangeOfLongCharacterAtIndex:](v1, "_rangeOfLongCharacterAtIndex:", 0);
  if (v2 + v3 == -[NSString length](v1, "length"))
  {
    v4 = -[NSString _firstLongCharacter](v1, "_firstLongCharacter");
    if (u_ispunct(v4))
      v5 = 1;
    else
      v5 = u_isdigit(v4) != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_22FA8FBC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _isControlKey(NSString *a1)
{
  NSString *v1;
  uint64_t v2;

  v1 = a1;
  v2 = -[NSString isEqualToString:](v1, "isEqualToString:", CFSTR("Shift"))
    || -[NSString isEqualToString:](v1, "isEqualToString:", CFSTR("More"))
    || -[NSString isEqualToString:](v1, "isEqualToString:", CFSTR("Delete"))
    || -[NSString isEqualToString:](v1, "isEqualToString:", CFSTR("\n"));

  return v2;
}

void sub_22FA8FC58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA8FCD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA8FF10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void TI::CP::make_layout(TI::CP *this@<X0>, const KB::DictionaryContainer *a2@<X1>, _QWORD *a3@<X8>)
{
  const KB::DictionaryContainer *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  KB *v12;
  NSString *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  KB *v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[32];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[KB::DictionaryContainer keys](v6, "keys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_msgSend(v11, "frame");
        objc_msgSend(v11, "string");
        v12 = (KB *)objc_claimAutoreleasedReturnValue();
        KB::utf8_string(v12, v13);

        KB::CollatorWrapper::sortkey_for_string((KB::CollatorWrapper *)(*((_QWORD *)this + 1) + 72), (const KB::String *)v31);
        objc_msgSend(v11, "keyCode");
        TI::Favonius::LayoutKey::create();
        v14 = v28;
        if (v28 != v30)
        {
          v17 = v29;
          goto LABEL_15;
        }
        v15 = v28 + (v28 >> 1);
        if (v28 < 0x100)
          v15 = 2 * v28;
        if (v15 <= v28 + 1)
          v16 = v28 + 1;
        else
          v16 = v15;
        WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::reserveCapacity(&v28, v16);
        v17 = v29;
        if (v29)
        {
          v14 = v28;
LABEL_15:
          *(_QWORD *)(v17 + 8 * v14) = v21;
          v28 = v14 + 1;
          goto LABEL_16;
        }
        if (v21)
          WTF::RefCounted<TI::Favonius::Key>::deref(v21);
LABEL_16:
        if ((unsigned __int16)v22 >= 0xFu && v23)
          MEMORY[0x2348A8A0C](v23, 0x1000C8077774924);
        KB::String::~String((KB::String *)v31);
        ++v10;
      }
      while (v8 != v10);
      v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      v8 = v18;
    }
    while (v18);
  }

  -[KB::DictionaryContainer name](v6, "name");
  v19 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v19, v20);

  TI::Favonius::KeyboardLayout::create();
  KB::String::operator=();
  *a3 = v22;
  KB::String::~String((KB::String *)v31);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(&v28);

}

void sub_22FA902A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  unsigned int *v14;
  uint64_t v16;
  va_list va;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v16 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  if (v14)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v14);
  KB::String::~String((KB::String *)va1);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector((uint64_t *)va);

  _Unwind_Resume(a1);
}

std::string *TI::CP::TTKTestCaseConverter::TTKTestCaseConverter(std::string *this, __int128 *a2, std::string::size_type *a3, unsigned int **a4)
{
  unsigned int *v5;
  unsigned int v6;
  unsigned int *v8;

  v5 = *a4;
  v8 = v5;
  if (v5)
  {
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
  }
  TI::CP::TestCaseConverter::TestCaseConverter(this, a2, a3, &v8);
  if (v8)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v8);
  return this;
}

void sub_22FA903E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned int *a10)
{
  if (a10)
    WTF::RefCounted<KB::DictionaryContainer>::deref(a10);
  _Unwind_Resume(exception_object);
}

void TI::CP::TTKTestCaseConverter::add_layout(TI::CP::TTKTestCaseConverter *this, TTKSimpleKeyboardPlane *a2)
{
  unint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  KB *v9;
  NSString *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  KB *v16;
  NSString *v17;
  unsigned int *v18;
  NSString *v19;
  KB::String *v20;
  unsigned int v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint64_t **v27;
  uint64_t **v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  unsigned int v32;
  float v33;
  float v34;
  _BOOL8 v35;
  unint64_t v36;
  unint64_t v37;
  size_t v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  KB *v42;
  TTKSimpleKeyboardPlane *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[2];
  char v52;
  char *v53;
  KB::String *v54;
  uint64_t v55;
  _BYTE v56[32];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v48 = 0;
  v49 = 0;
  v50 = 0;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v43 = a2;
  -[TTKSimpleKeyboardPlane keys](v43, "keys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v45;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v45 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v7);
        objc_msgSend(v8, "frame");
        objc_msgSend(v8, "string");
        v9 = (KB *)objc_claimAutoreleasedReturnValue();
        KB::utf8_string(v9, v10);

        KB::CollatorWrapper::sortkey_for_string((KB::CollatorWrapper *)(*(_QWORD *)(*((_QWORD *)this + 5) + 8) + 72), (const KB::String *)v56);
        objc_msgSend(v8, "keyCode");
        TI::Favonius::LayoutKey::create();
        v11 = v48;
        if (v48 != v50)
        {
          v14 = v49;
          goto LABEL_15;
        }
        v12 = v48 + (v48 >> 1);
        if (v48 < 0x100)
          v12 = 2 * v48;
        if (v12 <= v48 + 1)
          v13 = v48 + 1;
        else
          v13 = v12;
        WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::reserveCapacity(&v48, v13);
        v14 = v49;
        if (v49)
        {
          v11 = v48;
LABEL_15:
          *(_QWORD *)(v14 + 8 * v11) = v51[0];
          v48 = v11 + 1;
          goto LABEL_16;
        }
        if (v51[0])
          WTF::RefCounted<TI::Favonius::Key>::deref(v51[0]);
LABEL_16:
        if ((unsigned __int16)v53 >= 0xFu && v54)
          MEMORY[0x2348A8A0C](v54, 0x1000C8077774924);
        KB::String::~String((KB::String *)v56);
        ++v7;
      }
      while (v5 != v7);
      v15 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      v5 = v15;
    }
    while (v15);
  }

  -[TTKSimpleKeyboardPlane name](v43, "name");
  v16 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v16, v17);

  TI::Favonius::KeyboardLayout::create();
  v18 = (unsigned int *)v53;
  KB::String::operator=();
  -[TTKSimpleKeyboardPlane name](v43, "name");
  v42 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v42, v19);
  if (v54)
    v20 = v54;
  else
    v20 = (KB::String *)&v55;
  v21 = KB::String::hash(v20, (const char *)(unsigned __int16)v53);
  v22 = (_QWORD *)((char *)this + 48);
  v23 = v21;
  v24 = *((_QWORD *)this + 7);
  if (v24)
  {
    v25 = (uint8x8_t)vcnt_s8((int8x8_t)v24);
    v25.i16[0] = vaddlv_u8(v25);
    v26 = v25.u32[0];
    if (v25.u32[0] > 1uLL)
    {
      v2 = v21;
      if (v24 <= v21)
        v2 = v21 % v24;
    }
    else
    {
      v2 = ((_DWORD)v24 - 1) & v21;
    }
    v27 = *(uint64_t ***)(*v22 + 8 * v2);
    if (v27)
    {
      v28 = (uint64_t **)*v27;
      if (*v27)
      {
        do
        {
          v29 = (unint64_t)v28[1];
          if (v29 == v23)
          {
            if (v28 + 2 == (uint64_t **)&v53
              || (KB::String::equal((KB::String *)(v28 + 2), (const KB::String *)&v53) & 1) != 0)
            {
              goto LABEL_69;
            }
          }
          else
          {
            if (v26 > 1)
            {
              if (v29 >= v24)
                v29 %= v24;
            }
            else
            {
              v29 &= v24 - 1;
            }
            if (v29 != v2)
              break;
          }
          v28 = (uint64_t **)*v28;
        }
        while (v28);
      }
    }
  }
  v30 = operator new(0x38uLL);
  v31 = (uint64_t *)((char *)this + 64);
  v51[0] = (uint64_t)v30;
  v51[1] = (uint64_t)this + 64;
  v52 = 0;
  *v30 = 0;
  v30[1] = v23;
  KB::String::String();
  v30[6] = v18;
  if (v18)
  {
    do
      v32 = __ldaxr(v18);
    while (__stlxr(v32 + 1, v18));
  }
  v52 = 1;
  v33 = (float)(unint64_t)(*((_QWORD *)this + 9) + 1);
  v34 = *((float *)this + 20);
  if (!v24 || (float)(v34 * (float)v24) < v33)
  {
    v35 = 1;
    if (v24 >= 3)
      v35 = (v24 & (v24 - 1)) != 0;
    v36 = v35 | (2 * v24);
    v37 = vcvtps_u32_f32(v33 / v34);
    if (v36 <= v37)
      v38 = v37;
    else
      v38 = v36;
    std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__rehash<true>((uint64_t)this + 48, v38);
    v24 = *((_QWORD *)this + 7);
    if ((v24 & (v24 - 1)) != 0)
    {
      if (v24 <= v23)
        v2 = v23 % v24;
      else
        v2 = v23;
    }
    else
    {
      v2 = ((_DWORD)v24 - 1) & v23;
    }
  }
  v39 = *(uint64_t **)(*v22 + 8 * v2);
  v40 = v51[0];
  if (v39)
  {
    *(_QWORD *)v51[0] = *v39;
LABEL_67:
    *v39 = v40;
    goto LABEL_68;
  }
  *(_QWORD *)v51[0] = *v31;
  *v31 = v40;
  *(_QWORD *)(*v22 + 8 * v2) = v31;
  if (*(_QWORD *)v40)
  {
    v41 = *(_QWORD *)(*(_QWORD *)v40 + 8);
    if ((v24 & (v24 - 1)) != 0)
    {
      if (v41 >= v24)
        v41 %= v24;
    }
    else
    {
      v41 &= v24 - 1;
    }
    v39 = (uint64_t *)(*v22 + 8 * v41);
    goto LABEL_67;
  }
LABEL_68:
  v51[0] = 0;
  ++*((_QWORD *)this + 9);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100](v51);
LABEL_69:
  KB::String::~String((KB::String *)&v53);

  if (v18)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v18);
  KB::String::~String((KB::String *)v56);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(&v48);

}

void sub_22FA908E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__int16 a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  unsigned int *v29;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,WTF::RefPtr<TI::Favonius::KeyboardLayout>>,void *>>>>::reset[abi:nn180100](&a22);
  KB::String::~String((KB::String *)&a25);

  if (v29)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v29);
  KB::String::~String((KB::String *)&a29);
  WTF::Vector<WTF::RefPtr<TI::Favonius::LayoutKey>,0ul>::~Vector(&a19);

  _Unwind_Resume(a1);
}

void TI::CP::TTKTestCaseConverter::convert(TI::CP::TTKTestCaseConverter *this@<X0>, TTKTestCaseRecord *a2@<X1>, uint64_t a3@<X8>)
{
  TTKTestCaseRecord *v5;
  KB *v6;
  NSString *v7;
  unsigned int *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  KB *v25;
  NSString *v26;
  void *v27;
  BOOL v28;
  NSString *v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  unsigned int v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unsigned int *v37;
  __int128 v38;
  void *v39[2];
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void **v52;
  __int128 v53;
  void *__p;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[32];
  _BYTE v61[32];
  _BYTE v62[128];
  _QWORD v63[7];
  CGPoint v64;

  v63[4] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  -[TTKTestCaseRecord layoutName](v5, "layoutName");
  v6 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v6, v7);

  v8 = (unsigned int *)std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((_QWORD *)this + 6, v63)[6];
  if (v8)
  {
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
  }
  -[TTKTestCaseRecord touchDataCollection](v5, "touchDataCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v11, "samples");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v16, "point");
        v18 = v17;
        v20 = v19;
        objc_msgSend(v16, "timeStamp");
        v22 = v21;
        objc_msgSend(v16, "force");
        v24 = v23;
        v64.x = v18;
        v64.y = v20;
        TI::CP::Path::append((TI::CP::Path *)&v49, v64, v22, v24, -1.0, 0.0);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
    }
    while (v13);
  }

  -[TTKTestCaseRecord primaryIntendedText](v5, "primaryIntendedText");
  v25 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v25, v26);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  *(_OWORD *)v39 = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v42);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v43);
  memset(v44, 0, 24);
  KB::String::String((KB::String *)v60);
  -[TTKTestCaseRecord context](v5, "context");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  if (!v28)
  {
    -[TTKTestCaseRecord context](v5, "context");
    v29 = (NSString *)objc_claimAutoreleasedReturnValue();
    TI::CP::TestCaseConverter::compute_linguistic_context_and_stem(this, v29, (KB::LanguageModelContext *)&v53);
    KB::LanguageModelContext::operator=((uint64_t)&v38, &v53);
    KB::String::operator=();
    KB::String::~String((KB::String *)&v59);
    v52 = (void **)&v58;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v52);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v57);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v56);
    if (__p)
    {
      v55 = __p;
      operator delete(__p);
    }
    v30 = (std::__shared_weak_count *)*((_QWORD *)&v53 + 1);
    if (*((_QWORD *)&v53 + 1))
    {
      v31 = (unint64_t *)(*((_QWORD *)&v53 + 1) + 8);
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }

  }
  v37 = v8;
  if (v8)
  {
    do
      v33 = __ldaxr(v8);
    while (__stlxr(v33 + 1, v8));
  }
  TI::CP::ContinuousPathTestCase::ContinuousPathTestCase(a3, &v37, (const std::vector<unsigned int> *)&v49, (uint64_t)v61, (const KB::LanguageModelContext *)&v38, (uint64_t)v60);
  if (v37)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v37);
  KB::String::~String((KB::String *)v60);
  *(_QWORD *)&v53 = v44;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v53);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v43);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v42);
  if (v39[0])
  {
    v39[1] = v39[0];
    operator delete(v39[0]);
  }
  v34 = (std::__shared_weak_count *)*((_QWORD *)&v38 + 1);
  if (*((_QWORD *)&v38 + 1))
  {
    v35 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 8);
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  KB::String::~String((KB::String *)v61);
  if (*((_QWORD *)&v50 + 1))
  {
    *(_QWORD *)&v51 = *((_QWORD *)&v50 + 1);
    operator delete(*((void **)&v50 + 1));
  }
  if ((_QWORD)v49)
  {
    *((_QWORD *)&v49 + 1) = v49;
    operator delete((void *)v49);
  }

  if (v8)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v8);
  KB::String::~String((KB::String *)v63);

}

void sub_22FA90DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  void *v62;
  unsigned int *v63;
  void *v64;
  void *v65;
  uint64_t v66;

  std::pair<KB::LanguageModelContext,KB::String>::~pair((uint64_t)&a41);

  KB::String::~String((KB::String *)&a58);
  KB::LanguageModelContext::~LanguageModelContext((KB::LanguageModelContext *)&a11);
  KB::String::~String((KB::String *)&a62);
  TI::CP::Path::~Path((TI::CP::Path *)&a33);

  if (v63)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v63);
  KB::String::~String((KB::String *)(v66 - 168));

  _Unwind_Resume(a1);
}

void _TIBeginMockingCryptographer()
{
  TICryptographerMock *v0;

  v0 = objc_alloc_init(TICryptographerMock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB5378], "performSelector:withObject:", sel_setSharedCryptographer_, v0);

}

uint64_t _TIEndMockingCryptographer()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(MEMORY[0x24BEB5378], "performSelector:withObject:", sel_setSharedCryptographer_, 0);
  return result;
}

void sub_22FA910C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA9114C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TIBeginMockingContactManagerWithContactCollection(void *a1)
{
  id v1;
  TIContactManagerMock *v2;

  v1 = a1;
  v2 = -[TIContactManagerMock initWithContactCollection:]([TIContactManagerMock alloc], "initWithContactCollection:", v1);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB5370], "performSelector:withObject:", sel_setSharedTIContactManager_, v2);

}

void _TIEndMockingContactManager()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BEB5370], "sharedTIContactManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "observers");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "count");

    if (v1)
    {
      TIBundleForInputMode();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v2, "classNamed:", CFSTR("TIWordSearchKana"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v3, "performSelector:", sel_clearCachedContactObserver);
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 10.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *MEMORY[0x24BDBCA90];
      while (1)
      {
        objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "runMode:beforeDate:", v5, v7);

        objc_msgSend(v11, "observers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "count"))
          break;
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "laterDate:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v4)
          goto LABEL_11;
      }

LABEL_11:
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(MEMORY[0x24BEB5370], "performSelector:withObject:", sel_setSharedTIContactManager_, 0);

  }
}

void sub_22FA914E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22FA915D0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_22FA916D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA917DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA918DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA9194C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA919C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA91A44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA91ABC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA91B34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA91BB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA91CDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA91DE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA91E6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _TIBeginMockingAggdReporter()
{
  Class v0;
  Class v1;
  TIAggdReporterMock *v2;
  void *v3;

  if ((__missingTIAggdReporter & 1) == 0)
  {
    v0 = NSClassFromString(CFSTR("TIAggdReporter"));
    if (v0)
    {
      v1 = v0;
      v2 = objc_alloc_init(TIAggdReporterMock);
      v3 = (void *)__aggdReportMock;
      __aggdReportMock = (uint64_t)v2;

      -[objc_class setSharedAggdReporter:](v1, "setSharedAggdReporter:", __aggdReportMock);
    }
    else
    {
      __missingTIAggdReporter = 1;
    }
  }
}

void _TIEndMockingAggdReporter()
{
  void *v0;

  if ((__missingTIAggdReporter & 1) == 0)
  {
    -[objc_class setSharedAggdReporter:](NSClassFromString(CFSTR("TIAggdReporter")), "setSharedAggdReporter:", 0);
    v0 = (void *)__aggdReportMock;
    __aggdReportMock = 0;

  }
}

uint64_t _TIGetMockingAggdReporterScalar(uint64_t a1)
{
  if ((__missingTIAggdReporter & 1) != 0)
    return 0;
  else
    return objc_msgSend((id)__aggdReportMock, "getScalar:", a1);
}

id _TIGetMockingAggdReporterDistribution(uint64_t a1)
{
  if ((__missingTIAggdReporter & 1) != 0)
    return MEMORY[0x24BDBD1A8];
  objc_msgSend((id)__aggdReportMock, "getDistributionObject:", a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t _TIMockingAggdReporterDictionaryToJSON()
{
  return objc_msgSend((id)__aggdReportMock, "toJsonString");
}

uint64_t _TIMockingAggdReporterDictionary()
{
  return objc_msgSend((id)__aggdReportMock, "toDictionary");
}

uint64_t _TIMockingAggdReporterClear()
{
  return objc_msgSend((id)__aggdReportMock, "clear");
}

id unigramsFilePathForInputMode()
{
  UIKeyboardStaticUnigramsFile();
  return (id)objc_claimAutoreleasedReturnValue();
}

id phrasesFilePathForInputMode(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardPhraseLexiconPathForInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_22FA92054(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id dynamicFilePathForInputMode(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "length");
  v6 = 0;
  if (v4 && v5)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("en_US")) & 1) != 0)
    {
      v7 = CFSTR("dynamic-text.dat");
    }
    else
    {
      TIInputModeGetLanguageWithRegion();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", CFSTR("-dynamic-text.dat"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    if (-[__CFString length](v7, "length"))
    {
      objc_msgSend(v4, "stringByAppendingPathComponent:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

void sub_22FA92130(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id deltaUnigramsFilePathForInputMode(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardDeltaLexiconPathForInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_22FA921AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __createAndLoadDictionaryContainer(NSString *a1@<X0>, NSString *a2@<X1>, _QWORD *a3@<X8>)
{
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  KB *v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void **v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64x2_t v22;
  void **v23;
  NSString *v24;
  KB *v25;
  NSString *v26;
  int v27;
  char v28;
  __int128 v29;
  void **v30;
  _BYTE v31[32];
  _BYTE v32[32];
  _BYTE v33[32];
  _BYTE v34[32];
  _BYTE v35[32];
  void **v36;
  int64x2_t v37;
  void **v38;
  void ***v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[32];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[8];

  v47[6] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if (v6)
  {
    UIKeyboardDynamicDictionaryFile();
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  __getLexiconInfo(v5, v7, 1.0, (uint64_t)v43);
  KB::LexiconInfo::LexiconInfo((uint64_t)&v36, (uint64_t)v43);
  *(_QWORD *)&v29 = operator new(0xB0uLL);
  v30 = (void **)(v29 + 176);
  KB::LexiconInfo::LexiconInfo(v29, (uint64_t)&v36);
  *((_QWORD *)&v29 + 1) = v29 + 176;
  KB::String::~String((KB::String *)&v42);
  KB::String::~String((KB::String *)&v41);
  KB::String::~String((KB::String *)&v40);
  KB::String::~String((KB::String *)&v39);
  KB::String::~String((KB::String *)&v36);
  v8 = objc_retainAutorelease(v5);
  -[NSString UTF8String](v8, "UTF8String");
  if (TIMultilingualDynamicModelEnabled())
  {
    MEMORY[0x2348A87B4](v35, "mul");
    KB::String::String((KB::String *)v34);
    KB::String::String((KB::String *)v33);
    KB::String::String((KB::String *)v32);
    dynamicFilePathForInputMode(CFSTR("mul"), v7);
    v9 = (KB *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    KB::utf8_string(v9, v10);
    v28 = 0;
    v27 = 1;
    v11 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) >= (unint64_t)v30)
    {
      v25 = v9;
      v13 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((_QWORD *)&v29 + 1) - v29) >> 4);
      if ((unint64_t)(v13 + 1) > 0x1745D1745D1745DLL)
        abort();
      v14 = 0x5D1745D1745D1746 * ((uint64_t)((uint64_t)v30 - v29) >> 4);
      if (v14 <= v13 + 1)
        v14 = v13 + 1;
      if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)((uint64_t)v30 - v29) >> 4)) >= 0xBA2E8BA2E8BA2ELL)
        v15 = 0x1745D1745D1745DLL;
      else
        v15 = v14;
      v39 = &v30;
      if (v15)
      {
        if (v15 > 0x1745D1745D1745DLL)
          std::__throw_bad_array_new_length[abi:nn180100]();
        v16 = (void **)operator new(176 * v15);
      }
      else
      {
        v16 = 0;
      }
      v36 = v16;
      v37.i64[0] = (uint64_t)&v16[2 * ((uint64_t)(*((_QWORD *)&v29 + 1) - v29) >> 4)];
      v37.i64[1] = v37.i64[0];
      v38 = &v16[22 * v15];
      std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::String,KB::String,KB::String,KB::String,KB::String,unsigned int const&,BOOL,int,KB::LexiconInfo*>(v37.i64[0], (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31, &v28, &v27);
      v17 = v37.i64[0];
      v12 = v37.i64[1] + 176;
      v37.i64[1] += 176;
      v18 = v29;
      if (*((_QWORD *)&v29 + 1) == (_QWORD)v29)
      {
        v22 = vdupq_n_s64(*((unint64_t *)&v29 + 1));
      }
      else
      {
        v24 = v8;
        v19 = 0;
        do
        {
          KB::String::String();
          KB::String::String();
          KB::String::String();
          KB::String::String();
          v20 = v17 + v19;
          KB::String::String();
          v21 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + v19 - 16);
          *(_DWORD *)(v20 - 8) = *(_DWORD *)(*((_QWORD *)&v18 + 1) + v19 - 8);
          *(_QWORD *)(v20 - 16) = v21;
          v19 -= 176;
        }
        while (*((_QWORD *)&v18 + 1) + v19 != (_QWORD)v18);
        v17 += v19;
        v22 = (int64x2_t)v29;
        v12 = v37.i64[1];
        v8 = v24;
      }
      *(_QWORD *)&v29 = v17;
      *((_QWORD *)&v29 + 1) = v12;
      v37 = v22;
      v23 = v30;
      v30 = v38;
      v38 = v23;
      v36 = (void **)v22.i64[0];
      std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)&v36);
      v9 = v25;
    }
    else
    {
      std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::String,KB::String,KB::String,KB::String,KB::String,unsigned int const&,BOOL,int,KB::LexiconInfo*>(*((uint64_t *)&v29 + 1), (uint64_t)v35, (uint64_t)v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31, &v28, &v27);
      v12 = v11 + 176;
    }
    *((_QWORD *)&v29 + 1) = v12;
    KB::String::~String((KB::String *)v31);

    v7 = v26;
    KB::String::~String((KB::String *)v32);
    KB::String::~String((KB::String *)v33);
    KB::String::~String((KB::String *)v34);
    KB::String::~String((KB::String *)v35);
  }
  KB::DictionaryContainer::create_multilexicon();
  *a3 = v36;
  v36 = (void **)&v29;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v36);
  KB::String::~String((KB::String *)v47);
  KB::String::~String((KB::String *)&v46);
  KB::String::~String((KB::String *)&v45);
  KB::String::~String((KB::String *)&v44);
  KB::String::~String((KB::String *)v43);

}

void sub_22FA925EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,void **a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)&a41);
  KB::String::~String((KB::String *)&a21);

  KB::String::~String((KB::String *)&a25);
  KB::String::~String((KB::String *)&a29);
  KB::String::~String((KB::String *)&a33);
  KB::String::~String((KB::String *)&a37);
  a37 = (void **)&a17;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&a37);
  KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)&a63);

  _Unwind_Resume(a1);
}

void __getLexiconInfo(NSString *a1@<X0>, NSString *a2@<X1>, float a3@<S0>, uint64_t a4@<X8>)
{
  NSString *v7;
  KB *v8;
  KB *v9;
  KB *v10;
  KB *v11;
  int v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;

  v7 = a1;
  v18 = a2;
  UIKeyboardStaticUnigramsFile();
  v8 = (KB *)objc_claimAutoreleasedReturnValue();
  deltaUnigramsFilePathForInputMode((uint64_t)v7);
  v9 = (KB *)objc_claimAutoreleasedReturnValue();
  phrasesFilePathForInputMode((uint64_t)v7);
  v10 = (KB *)objc_claimAutoreleasedReturnValue();
  dynamicFilePathForInputMode(v7, v18);
  v11 = (KB *)objc_claimAutoreleasedReturnValue();
  v19 = objc_retainAutorelease(v7);
  -[NSString UTF8String](v19, "UTF8String");
  v12 = TILexiconIDForLocaleIdentifier();
  KB::utf8_string((KB *)v19, v13);
  KB::utf8_string(v8, v14);
  KB::utf8_string(v9, v15);
  KB::utf8_string(v10, v16);
  KB::utf8_string(v11, v17);
  *(_DWORD *)(a4 + 160) = v12;
  *(_BYTE *)(a4 + 164) = 0;
  *(float *)(a4 + 168) = a3;

}

void sub_22FA92898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  KB::String *v9;
  void *v10;
  void *v11;
  void *v12;
  KB::String *v13;
  void *v14;
  void *v15;
  KB::String *v16;
  KB::String *v17;

  KB::String::~String(v9);
  KB::String::~String(v17);
  KB::String::~String(v16);
  KB::String::~String(v13);

  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::String,KB::String,KB::String,KB::String,KB::String,unsigned int const&,BOOL,int,KB::LexiconInfo*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, int *a8)
{
  KB::String::String();
  KB::String::String();
  KB::String::String();
  KB::String::String();
  KB::String::String();
  *(_DWORD *)(a1 + 160) = -2;
  *(_BYTE *)(a1 + 164) = *a7;
  *(float *)(a1 + 168) = (float)*a8;
  return a1;
}

void sub_22FA929CC(_Unwind_Exception *a1)
{
  KB::String *v1;
  KB::String *v2;
  KB::String *v3;
  KB::String *v4;

  KB::String::~String(v4);
  KB::String::~String(v3);
  KB::String::~String(v2);
  KB::String::~String(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<KB::LexiconInfo>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 176;
    KB::LexiconInfo::~LexiconInfo((KB::LexiconInfo *)(i - 176));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void __createAndLoadLanguageModel(NSString *a1@<X0>, NSString *a2@<X1>, _QWORD *a3@<X8>)
{
  NSString *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef v17;
  CFTypeRef v18[2];
  CFTypeRef v19[2];
  __int128 v20;
  __int128 v21;
  int v22;
  __int128 v23;
  CFTypeRef cf;
  CFTypeRef v25;
  CFTypeRef v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  int v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  *a3 = 0;
  a3[1] = 0;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doesSupportInlineCompletion");
  KB::LanguageModelConfig::LanguageModelConfig();
  v10 = operator new();
  v15 = cf;
  if (cf)
  {
    CFRetain(cf);
    v15 = cf;
  }
  v16 = v25;
  if (v25)
  {
    CFRetain(v25);
    v16 = v25;
  }
  v17 = v26;
  if (v26)
  {
    CFRetain(v26);
    v17 = v26;
  }
  v11 = v27;
  v27 = 0u;
  *(_OWORD *)v18 = v11;
  v12 = v28;
  v28 = 0u;
  *(_OWORD *)v19 = v12;
  v20 = v29;
  v21 = v30;
  v22 = v31;
  MEMORY[0x2348A86AC](v10, &v15);
  std::shared_ptr<KB::LanguageModel>::shared_ptr[abi:nn180100]<KB::LanguageModelStr,void>(&v23, v10);
  v13 = v23;
  v23 = 0uLL;
  v14 = v13;
  *(_OWORD *)a3 = v13;
  if (v19[1])
    CFRelease(v19[1]);
  v19[1] = 0;
  if (v19[0])
    CFRelease(v19[0]);
  v19[0] = 0;
  if (v18[1])
    CFRelease(v18[1]);
  v18[1] = 0;
  if (v18[0])
    CFRelease(v18[0]);
  v18[0] = 0;
  if (v17)
    CFRelease(v17);
  v17 = 0;
  if (v16)
    CFRelease(v16);
  v16 = 0;
  if (v15)
    CFRelease(v15);
  v15 = 0;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v14 + 72))(v14, 1);
  if (*((_QWORD *)&v28 + 1))
    CFRelease(*((CFTypeRef *)&v28 + 1));
  *((_QWORD *)&v28 + 1) = 0;
  if ((_QWORD)v28)
    CFRelease((CFTypeRef)v28);
  *(_QWORD *)&v28 = 0;
  if (*((_QWORD *)&v27 + 1))
    CFRelease(*((CFTypeRef *)&v27 + 1));
  *((_QWORD *)&v27 + 1) = 0;
  if ((_QWORD)v27)
    CFRelease((CFTypeRef)v27);
  *(_QWORD *)&v27 = 0;
  if (v26)
    CFRelease(v26);
  v26 = 0;
  if (v25)
    CFRelease(v25);
  v25 = 0;
  if (cf)
    CFRelease(cf);

}

void sub_22FA92D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, CFTypeRef a15, CFTypeRef cf, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;

  if (cf)
    CFRelease(cf);
  if (a15)
    CFRelease(a15);
  MEMORY[0x2348A8A24](v35, 0x10F1C40F828255FLL);
  KB::LanguageModelConfig::~LanguageModelConfig((KB::LanguageModelConfig *)&a29);

  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v33);
  _Unwind_Resume(a1);
}

void _TIBeginMockingAppAutofillManager()
{
  TIAppAutofillManagerMock *v0;

  v0 = objc_alloc_init(TIAppAutofillManagerMock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB5348], "performSelector:withObject:", sel_setSharedAppAutofillManager_, v0);

}

uint64_t _TIEndMockingAppAutofillManager()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(MEMORY[0x24BEB5348], "performSelector:withObject:", sel_setSharedAppAutofillManager_, 0);
  return result;
}

void _TIBeginMockingAnalyticsService()
{
  Class v0;
  Class v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if ((__missingTIAnalyticsService & 1) == 0)
  {
    v0 = NSClassFromString(CFSTR("TIAnalyticsService"));
    if (v0)
    {
      v1 = v0;
      v2 = objc_alloc(MEMORY[0x24BEB4CE8]);
      v3 = (void *)objc_opt_new();
      v4 = objc_msgSend(v2, "initWithProvider:", v3);
      v5 = (void *)__analyticsServiceMock;
      __analyticsServiceMock = v4;

      -[objc_class setMockInstance:](v1, "setMockInstance:", __analyticsServiceMock);
    }
    else
    {
      __missingTIAnalyticsService = 1;
    }
  }
}

void _TIEndMockingAnalyticsService()
{
  void *v0;

  if ((__missingTIAnalyticsService & 1) == 0)
  {
    -[objc_class setMockInstance:](NSClassFromString(CFSTR("TIAnalyticsService")), "setMockInstance:", 0);
    v0 = (void *)__analyticsServiceMock;
    __analyticsServiceMock = 0;

  }
}

id _TIGetMockingAnalyticsServiceAllEvents()
{
  void *v0;
  void *v1;

  objc_msgSend((id)__analyticsServiceMock, "provider");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "allEvents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id _TIGetMockingAnalyticsServiceEvents(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)__analyticsServiceMock;
  v2 = a1;
  objc_msgSend(v1, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BEB4EE8], "stringByAppendingFormat:", CFSTR(".%@"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "eventsWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _TIGetMockingAnalyticsInputAnalyticsServiceEvents(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)__analyticsServiceMock;
  v2 = a1;
  objc_msgSend(v1, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BEB4EE0], "stringByAppendingFormat:", CFSTR(".%@"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "eventsWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _TIGetMockingAnalyticsServiceEventsForMultipleEventNames(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v1;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    v6 = (void *)*MEMORY[0x24BEB4EE8];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v7);
        objc_msgSend((id)__analyticsServiceMock, "provider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@"), v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "eventsWithName:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16++));
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v14);
        }

        ++v7;
      }
      while (v7 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  return v2;
}

uint64_t _TIGetMockingAnalyticsServiceCountEvent(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)__analyticsServiceMock;
  v2 = a1;
  objc_msgSend(v1, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BEB4EE8], "stringByAppendingFormat:", CFSTR(".%@"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "countEvent:", v4);
  return v5;
}

uint64_t _TIGetMockingAnalyticsServiceCountEventWithPredicate(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)__analyticsServiceMock;
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BEB4EE8], "stringByAppendingFormat:", CFSTR(".%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "countEvent:filteredWithPredicate:", v7, v4);
  return v8;
}

uint64_t _TIGetMockingAnalyticsServiceSumIntegerField(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)__analyticsServiceMock;
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BEB4EE8], "stringByAppendingFormat:", CFSTR(".%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "sumIntegerField:forEvent:", v4, v7);
  return v8;
}

uint64_t _TIGetMockingAnalyticsServiceSumIntegerFieldWithPredicate(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = (void *)__analyticsServiceMock;
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BEB4EE8], "stringByAppendingFormat:", CFSTR(".%@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "sumIntegerField:forEvent:filteredWithPredicate:", v7, v10, v6);
  return v11;
}

double _TIGetMockingAnalyticsServiceSumFloatField(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = (void *)__analyticsServiceMock;
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BEB4EE8], "stringByAppendingFormat:", CFSTR(".%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sumFloatField:forEvent:", v4, v7);
  v9 = v8;

  return v9;
}

double _TIGetMockingAnalyticsServiceSumFloatFieldWithPredicate(void *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v5 = (void *)__analyticsServiceMock;
  v6 = a3;
  v7 = a2;
  v8 = a1;
  objc_msgSend(v5, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BEB4EE8], "stringByAppendingFormat:", CFSTR(".%@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sumFloatField:forEvent:filteredWithPredicate:", v7, v10, v6);
  v12 = v11;

  return v12;
}

void _TIMockingAnalyticsServiceClear()
{
  id v0;

  objc_msgSend((id)__analyticsServiceMock, "provider");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "clear");

}

void sub_22FA961C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA96564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_22FA96710(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA968D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_22FA96CF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA96E04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA97244(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA97478(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

double std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(uint64_t a1, std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, double *a3)
{
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (*(_BYTE *)(a1 + 24))
  {
    *(_BYTE *)(a1 + 24) = 0;
    v5 = *(double *)(a1 + 16);
  }
  else
  {
    do
    {
      do
      {
        v7 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v8 = (v7
            + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
            * 4294967300.0)
           * 5.42101086e-20
           * 2.0
           + -1.0;
        v9 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v10 = (v9
             + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
             * 4294967300.0)
            * 5.42101086e-20
            * 2.0
            + -1.0;
        v11 = v10 * v10 + v8 * v8;
      }
      while (v11 > 1.0);
    }
    while (v11 == 0.0);
    v12 = sqrt(log(v10 * v10 + v8 * v8) * -2.0 / v11);
    *(double *)(a1 + 16) = v10 * v12;
    *(_BYTE *)(a1 + 24) = 1;
    v5 = v8 * v12;
  }
  return *a3 + v5 * a3[1];
}

double std::gamma_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, double *a2)
{
  double v4;
  double v5;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v13;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  long double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v25;
  double v26;
  double v27;
  double v28;

  v4 = *a2;
  if (*a2 == 1.0)
  {
    v5 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
    v6 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
    v7 = -log((v5 + (double)v6 * 4294967300.0) * -5.42101086e-20 + 1.0);
  }
  else if (*a2 <= 1.0)
  {
    v21 = 1.0 - v4;
    do
    {
      while (1)
      {
        v22 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v23 = (v22
             + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
             * 4294967300.0)
            * 5.42101086e-20
            + 0.0;
        v24 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v25 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v26 = -log(1.0 - (v24 + (double)v25 * 4294967300.0) * 5.42101086e-20);
        if (v23 <= v21)
          break;
        v27 = log((1.0 - v23) / v4);
        v7 = pow(v21 - v4 * v27, 1.0 / v4);
        if (v7 <= v26 - v27)
          return v7 * a2[1];
      }
      v28 = pow(v23, 1.0 / v4);
    }
    while (v28 > v26);
    v7 = v28;
  }
  else
  {
    v9 = v4 + -1.0;
    v10 = v4 * 3.0 + -0.75;
    while (1)
    {
      do
      {
        v11 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v12 = (v11
             + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this)
             * 4294967300.0)
            * 5.42101086e-20
            + 0.0;
        v13 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v14 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
        v15 = v12 * (1.0 - v12);
      }
      while (v15 == 0.0);
      v16 = (v12 + -0.5) * sqrt(v10 / v15);
      v7 = v9 + v16;
      if (v9 + v16 >= 0.0)
      {
        v17 = ((double)v13 + (double)v14 * 4294967300.0) * 5.42101086e-20 + 0.0;
        v18 = v17 * (v17 * (v15 * (v15 * (v15 * 64.0))));
        if (v18 <= 1.0 - v16 * (v16 + v16) / v7)
          break;
        v19 = log(v18);
        v20 = log(v7 / v9);
        if (v19 <= -(v16 - v9 * v20) - (v16 - v9 * v20))
          break;
      }
    }
  }
  return v7 * a2[1];
}

void sub_22FA97A74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22FA97CC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA98FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_22FA996C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_22FA998D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA999B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA99C74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v4;

  _Unwind_Resume(a1);
}

void sub_22FA99DC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22FA99E88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA99F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v11;

  _Unwind_Resume(a1);
}

void sub_22FA9A0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22FA9A42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{

  _Unwind_Resume(a1);
}

void sub_22FA9A774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_22FA9AC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_22FA9AE30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA9AEEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22FA9AF5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22FA9B0E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_22FA9B2E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA9B4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22FA9B6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22FA9B968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22FA9BC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22FA9BDEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA9BFA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA9C0B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA9C20C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA9C3A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22FA9C644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22FA9C948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void _TIBeginMockingUserModelDataStore()
{
  TIUserModelDataStoreMock *v0;

  v0 = objc_alloc_init(TIUserModelDataStoreMock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB4EC0], "performSelector:withObject:", sel_setSharedTIUserModelDataStore_, v0);

}

uint64_t _TIEndMockingUserModelDataStore()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(MEMORY[0x24BEB4EC0], "performSelector:withObject:", sel_setSharedUserModelDataStore_, 0);
  return result;
}

void _TIMockingUserModelDataStoreClear()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEB4EC0], "sharedUserModelDataStore");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v0, "performSelector:withObject:", sel_clear, 0);

}

void sub_22FA9DF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TI::CP::CPEval::load_language_resources(TI::CP::CPEval *this, NSString *a2, NSString *a3, double a4)
{
  NSString *v7;
  NSString *v8;
  NSString *v9;
  void **v10;
  float v11;
  unsigned int *v12;
  std::__shared_weak_count *v13;
  unsigned int *v14;
  unsigned int v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unsigned int *v23;
  unsigned int *v24;
  std::__shared_weak_count *v25;
  unsigned int *v26;
  unsigned int v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unsigned int *v35;
  uint64_t v36;
  unsigned int *v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int *v43;
  uint64_t v44;
  unsigned int *v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int v50;
  _QWORD *v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  _QWORD *v55;
  unsigned int *v56;
  unsigned int v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  _QWORD *v61;
  unsigned int *v62;
  unsigned int v63;
  unint64_t *v64;
  std::__shared_weak_count *v65;
  unsigned int *v66;
  std::__shared_weak_count *v67;
  unsigned int *v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v7 = a2;
  v8 = a3;
  v9 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:nn180100]<0>(&v70, (char *)-[NSString UTF8String](v9, "UTF8String"));
  v10 = (void **)((char *)this + 48);
  if (*((char *)this + 71) < 0)
    operator delete(*v10);
  *(_OWORD *)v10 = v70;
  *((_QWORD *)this + 8) = v71;
  v70 = 0uLL;
  if (v8)
  {
    v11 = a4;
    TI::CP::createAndLoadDictionaryContainerMultiLexicon((TI::CP *)v9, v8, 0, v11, (void ***)&v69);
    v12 = (unsigned int *)*((_QWORD *)this + 9);
    *((_QWORD *)this + 9) = v69;
    if (v12)
      WTF::RefCounted<KB::DictionaryContainer>::deref(v12);
    if (*((_BYTE *)this + 160))
    {
      TI::CP::createAndLoadLanguageModelContainer((TI::CP *)v9, v8, 0, v11, &v69);
      v13 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
      v70 = v69;
      v14 = (unsigned int *)*((_QWORD *)this + 9);
      v68 = v14;
      if (v14)
      {
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 + 1, v14));
        v13 = (std::__shared_weak_count *)*((_QWORD *)&v70 + 1);
      }
      v67 = v13;
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v17 = __ldxr(p_shared_owners);
        while (__stxr(v17 + 1, p_shared_owners));
      }
      KB::NgramCandidateRefinery::create();
      std::shared_ptr<KB::CandidateRefinery>::operator=[abi:nn180100]<KB::NgramCandidateRefinery,void>((uint64_t)this + 112, &v69);
      v18 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
      if (*((_QWORD *)&v69 + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      if (v67)
      {
        v21 = (unint64_t *)&v67->__shared_owners_;
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
          std::__shared_weak_count::__release_weak(v67);
        }
      }
      v23 = v68;
      if (!v68)
        goto LABEL_46;
LABEL_45:
      WTF::RefCounted<KB::DictionaryContainer>::deref(v23);
      goto LABEL_46;
    }
    v55 = operator new(0x28uLL);
    v55[1] = 0;
    v55[2] = 0;
    *v55 = &off_24FD48EF8;
    v55[3] = MEMORY[0x24BEB5A68] + 16;
    v56 = (unsigned int *)*((_QWORD *)this + 9);
    v55[4] = v56;
    if (v56)
    {
      do
        v57 = __ldaxr(v56);
      while (__stlxr(v57 + 1, v56));
    }
    *(_QWORD *)&v69 = v55 + 3;
    *((_QWORD *)&v69 + 1) = v55;
    std::shared_ptr<KB::CandidateRefinery>::operator=[abi:nn180100]<KB::NgramCandidateRefinery,void>((uint64_t)this + 112, &v69);
    v58 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
    if (*((_QWORD *)&v69 + 1))
    {
      v59 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
      do
        v60 = __ldaxr(v59);
      while (__stlxr(v60 - 1, v59));
      goto LABEL_79;
    }
  }
  else
  {
    __createAndLoadDictionaryContainer(v9, 0, &v69);
    v24 = (unsigned int *)*((_QWORD *)this + 9);
    *((_QWORD *)this + 9) = v69;
    if (v24)
      WTF::RefCounted<KB::DictionaryContainer>::deref(v24);
    if (*((_BYTE *)this + 160))
    {
      TI::CP::createAndLoadLanguageModel((TI::CP *)v9, 0, &v69);
      v25 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
      v70 = v69;
      v26 = (unsigned int *)*((_QWORD *)this + 9);
      v66 = v26;
      if (v26)
      {
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 + 1, v26));
        v25 = (std::__shared_weak_count *)*((_QWORD *)&v70 + 1);
      }
      v65 = v25;
      if (v25)
      {
        v28 = (unint64_t *)&v25->__shared_owners_;
        do
          v29 = __ldxr(v28);
        while (__stxr(v29 + 1, v28));
      }
      KB::NgramCandidateRefinery::create();
      std::shared_ptr<KB::CandidateRefinery>::operator=[abi:nn180100]<KB::NgramCandidateRefinery,void>((uint64_t)this + 112, &v69);
      v30 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
      if (*((_QWORD *)&v69 + 1))
      {
        v31 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
        do
          v32 = __ldaxr(v31);
        while (__stlxr(v32 - 1, v31));
        if (!v32)
        {
          ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
          std::__shared_weak_count::__release_weak(v30);
        }
      }
      if (v65)
      {
        v33 = (unint64_t *)&v65->__shared_owners_;
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
          std::__shared_weak_count::__release_weak(v65);
        }
      }
      v23 = v66;
      if (v66)
        goto LABEL_45;
    }
    else
    {
      v61 = operator new(0x28uLL);
      v61[1] = 0;
      v61[2] = 0;
      *v61 = &off_24FD48EF8;
      v61[3] = MEMORY[0x24BEB5A68] + 16;
      v62 = (unsigned int *)*((_QWORD *)this + 9);
      v61[4] = v62;
      if (v62)
      {
        do
          v63 = __ldaxr(v62);
        while (__stlxr(v63 + 1, v62));
      }
      *(_QWORD *)&v69 = v61 + 3;
      *((_QWORD *)&v69 + 1) = v61;
      std::shared_ptr<KB::CandidateRefinery>::operator=[abi:nn180100]<KB::NgramCandidateRefinery,void>((uint64_t)this + 112, &v69);
      v58 = (std::__shared_weak_count *)*((_QWORD *)&v69 + 1);
      if (*((_QWORD *)&v69 + 1))
      {
        v64 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 8);
        do
          v60 = __ldaxr(v64);
        while (__stlxr(v60 - 1, v64));
LABEL_79:
        if (!v60)
        {
          ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
          std::__shared_weak_count::__release_weak(v58);
        }
      }
    }
  }
LABEL_46:
  TI::Favonius::UnigramTypingModel::create();
  v35 = (unsigned int *)*((_QWORD *)this + 12);
  v36 = v69;
  *(_QWORD *)&v69 = 0;
  *((_QWORD *)this + 12) = v36;
  if (v35)
  {
    v37 = v35 + 2;
    v38 = atomic_load(v35 + 2);
    if (v38 == 1)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v35 + 40))(v35);
    }
    else
    {
      do
        v39 = __ldaxr(v37);
      while (__stlxr(v39 - 1, v37));
    }
    if ((_QWORD)v69)
    {
      v40 = (unsigned int *)(v69 + 8);
      v41 = atomic_load((unsigned int *)(v69 + 8));
      if (v41 == 1)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)v69 + 40))(v69);
      }
      else
      {
        do
          v42 = __ldaxr(v40);
        while (__stlxr(v42 - 1, v40));
      }
    }
  }
  TI::Favonius::UnigramCandidateGenerator::create();
  v43 = (unsigned int *)*((_QWORD *)this + 13);
  v44 = v69;
  *(_QWORD *)&v69 = 0;
  *((_QWORD *)this + 13) = v44;
  if (v43)
  {
    v45 = v43 + 2;
    v46 = atomic_load(v43 + 2);
    if (v46 == 1)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v43 + 8))(v43);
    }
    else
    {
      do
        v47 = __ldaxr(v45);
      while (__stlxr(v47 - 1, v45));
    }
    if ((_QWORD)v69)
    {
      v48 = (unsigned int *)(v69 + 8);
      v49 = atomic_load((unsigned int *)(v69 + 8));
      if (v49 == 1)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)v69 + 8))(v69);
      }
      else
      {
        do
          v50 = __ldaxr(v48);
        while (__stlxr(v50 - 1, v48));
      }
    }
  }
  v51 = (_QWORD *)((char *)this + 80);
  v52 = (std::__shared_weak_count *)*((_QWORD *)&v70 + 1);
  std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](v51, v70, *((uint64_t *)&v70 + 1));
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

}

void sub_22FA9F774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a11);
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)va);

  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<KB::CandidateRefinery>::operator=[abi:nn180100]<KB::NgramCandidateRefinery,void>(uint64_t a1, __int128 *a2)
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

_QWORD *std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t *v4;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;

  if (a3)
  {
    v4 = (unint64_t *)(a3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = (std::__shared_weak_count *)a1[1];
  *a1 = a2;
  a1[1] = a3;
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
  return a1;
}

void std::__shared_ptr_emplace<KB::UnigramCandidateRefinery>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24FD48EF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::UnigramCandidateRefinery>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24FD48EF8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2348A8A24);
}

uint64_t std::__shared_ptr_emplace<KB::UnigramCandidateRefinery>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

TI::CP::CPEval *TI::CP::CPEval::CPEval(TI::CP::CPEval *this, NSString *a2)
{
  NSString *v3;

  v3 = a2;
  *(_QWORD *)this = &off_24FD49190;
  *((_BYTE *)this + 8) = 0;
  TI::CP::ShapeStoreConfiguration::default_config((TI::CP::CPEval *)((char *)this + 16));
  *((_DWORD *)this + 10) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = xmmword_22FAC90D0;
  *((_DWORD *)this + 36) = 1028443341;
  *(_QWORD *)((char *)this + 148) = 0x300000000;
  *((_BYTE *)this + 160) = 1;
  *((_QWORD *)this + 21) = 0;
  *((_QWORD *)this + 22) = 0xF00000002;
  (*(void (**)(TI::CP::CPEval *, NSString *, _QWORD, double))(*(_QWORD *)this + 16))(this, v3, 0, 0.0);

  return this;
}

void sub_22FA9F9E0(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  TI::CP::ShapeStoreConfiguration *v3;
  uint64_t v4;
  void **v5;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v15;

  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v2 + 112);
  v7 = *(unsigned int **)(v2 + 104);
  if (v7)
  {
    v8 = v7 + 2;
    v9 = atomic_load(v7 + 2);
    if (v9 == 1)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 8))(v7);
    }
    else
    {
      do
        v10 = __ldaxr(v8);
      while (__stlxr(v10 - 1, v8));
    }
  }
  v11 = *(unsigned int **)(v2 + 96);
  if (v11)
  {
    v12 = v11 + 2;
    v13 = atomic_load(v11 + 2);
    if (v13 == 1)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v11 + 40))(v11);
    }
    else
    {
      do
        v14 = __ldaxr(v12);
      while (__stlxr(v14 - 1, v12));
    }
  }
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v4);
  v15 = *(unsigned int **)(v2 + 72);
  if (v15)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v15);
  if (*(char *)(v2 + 71) < 0)
    operator delete(*v5);
  TI::CP::ShapeStoreConfiguration::~ShapeStoreConfiguration(v3);

  _Unwind_Resume(a1);
}

TI::CP::CPEval *TI::CP::CPEval::CPEval(TI::CP::CPEval *this, NSString *a2, NSString *a3, double a4)
{
  NSString *v7;
  NSString *v8;

  v7 = a2;
  v8 = a3;
  *(_QWORD *)this = &off_24FD49190;
  *((_BYTE *)this + 8) = 0;
  TI::CP::ShapeStoreConfiguration::default_config((TI::CP::CPEval *)((char *)this + 16));
  *((_DWORD *)this + 10) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = xmmword_22FAC90D0;
  *((_DWORD *)this + 36) = 1028443341;
  *(_QWORD *)((char *)this + 148) = 0x300000000;
  *((_BYTE *)this + 160) = 1;
  *((_QWORD *)this + 21) = 0;
  *((_QWORD *)this + 22) = 0xF00000002;
  (*(void (**)(TI::CP::CPEval *, NSString *, NSString *, double))(*(_QWORD *)this + 16))(this, v7, v8, a4);

  return this;
}

void sub_22FA9FB94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  TI::CP::ShapeStoreConfiguration *v4;
  uint64_t v5;
  void **v6;
  unsigned int *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;

  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v3 + 112);
  v8 = *(unsigned int **)(v3 + 104);
  if (v8)
  {
    v9 = v8 + 2;
    v10 = atomic_load(v8 + 2);
    if (v10 == 1)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v8 + 8))(v8);
    }
    else
    {
      do
        v11 = __ldaxr(v9);
      while (__stlxr(v11 - 1, v9));
    }
  }
  v12 = *(unsigned int **)(v3 + 96);
  if (v12)
  {
    v13 = v12 + 2;
    v14 = atomic_load(v12 + 2);
    if (v14 == 1)
    {
      (*(void (**)(unsigned int *))(*(_QWORD *)v12 + 40))(v12);
    }
    else
    {
      do
        v15 = __ldaxr(v13);
      while (__stlxr(v15 - 1, v13));
    }
  }
  std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100](v5);
  v16 = *(unsigned int **)(v3 + 72);
  if (v16)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v16);
  if (*(char *)(v3 + 71) < 0)
    operator delete(*v6);
  TI::CP::ShapeStoreConfiguration::~ShapeStoreConfiguration(v4);

  _Unwind_Resume(a1);
}

uint64_t TI::CP::CPEval::is_match(TI::CP::CPEval *this, const KB::Candidate *a2, const KB::String *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  char v14;
  uint64_t v15;
  const void *v16;
  const void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  _BYTE v35[681];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39[8];
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  const void *v43;
  const void *v44;
  int v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  _BYTE v49[720];
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  __int128 __p;
  uint64_t v55;
  __int128 v56;
  CFTypeRef cf;
  CFTypeRef v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  KB::Candidate::Candidate((KB::Candidate *)&v46, a2);
  if (*((_DWORD *)this + 39))
  {
    KB::Candidate::Candidate((KB::Candidate *)&v32, (const KB::Word *)(*((_QWORD *)a2 + 1) + 240 * *(_QWORD *)a2 - 240));
    v6 = v46;
    v7 = v47;
    v8 = v33;
    v46 = v32;
    v32 = v6;
    if (v47 == v49)
    {
      if (v33 == v35)
      {
        for (i = 0; i != 720; ++i)
        {
          v14 = v7[i];
          v7[i] = v8[i];
          v8[i] = v14;
        }
      }
      else
      {
        v9 = 0;
        v47 = v33;
        v33 = v35;
        do
        {
          v10 = v7[v9];
          v7[v9] = v35[v9];
          v35[v9++] = v10;
        }
        while (v9 != 720);
      }
    }
    else if (v33 == v35)
    {
      v11 = 0;
      v33 = v47;
      v47 = v49;
      do
      {
        v12 = v49[v11];
        v49[v11] = v8[v11];
        v8[v11++] = v12;
      }
      while (v11 != 720);
    }
    else
    {
      v47 = v33;
      v33 = v7;
    }
    v15 = v34;
    v34 = v48;
    v50 = v36;
    v51 = v37;
    v48 = v15;
    v52 = v38;
    KB::LanguageModelContext::operator=((uint64_t)&v53, v39);
    KB::String::operator=();
    if (SHIBYTE(v55) < 0)
      operator delete((void *)__p);
    __p = v40;
    v55 = v41;
    HIBYTE(v41) = 0;
    LOBYTE(v40) = 0;
    KB::ByteString::operator=();
    v56 = v42;
    if (cf)
      CFRelease(cf);
    v16 = v43;
    v43 = 0;
    cf = v16;
    if (v58)
      CFRelease(v58);
    v17 = v44;
    v44 = 0;
    v58 = v17;
    v59 = v45;
    MEMORY[0x2348A8820](&v32);
  }
  v18 = *((_DWORD *)this + 44);
  if (!v18)
  {
    KB::Candidate::capitalized_string((KB::Candidate *)&v46);
    if (&v32 == (uint64_t *)a3)
    {
      v21 = 1;
      goto LABEL_28;
    }
    v20 = KB::String::equal(a3, (const KB::String *)&v32);
LABEL_27:
    v21 = v20;
LABEL_28:
    KB::String::~String((KB::String *)&v32);
LABEL_41:
    v25 = 0;
    v30 = 0;
    goto LABEL_42;
  }
  if (v18 != 1)
  {
    if (v18 != 2)
    {
      v21 = 0;
      goto LABEL_41;
    }
    v19 = *(_QWORD *)(*((_QWORD *)this + 9) + 8);
    KB::Candidate::capitalized_string((KB::Candidate *)&v46);
    v20 = KB::CollatorWrapper::sortkey_equal_strings((KB::CollatorWrapper *)(v19 + 72), (const KB::String *)&v32, a3);
    goto LABEL_27;
  }
  v22 = (const char *)*((_QWORD *)a3 + 1);
  if (!v22)
    v22 = (char *)a3 + 16;
  if (*(_WORD *)a3)
    v23 = v22;
  else
    v23 = "";
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lowercaseString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDD17C8];
  KB::Candidate::capitalized_string((KB::Candidate *)&v46);
  v27 = v33;
  if (!v33)
    v27 = (const char *)&v34;
  if ((_WORD)v32)
    v28 = v27;
  else
    v28 = "";
  objc_msgSend(v26, "stringWithUTF8String:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lowercaseString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  KB::String::~String((KB::String *)&v32);
  v21 = objc_msgSend(v25, "isEqualToString:", v30);
LABEL_42:
  MEMORY[0x2348A8820](&v46);

  return v21;
}

void sub_22FA9FFDC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  KB::String::~String((KB::String *)va);
  MEMORY[0x2348A8820](&STACK[0x3F0]);
  _Unwind_Resume(a1);
}

KB::Candidate *KB::Candidate::Candidate(KB::Candidate *this, const KB::Word *a2)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = (char *)this + 24;
  *((_QWORD *)this + 2) = 3;
  *(_OWORD *)((char *)this + 744) = xmmword_22FAC90F0;
  *((_QWORD *)this + 95) = 0xFF8000003F800000;
  *((_QWORD *)this + 105) = 0;
  *(_OWORD *)((char *)this + 776) = 0u;
  *(_OWORD *)((char *)this + 792) = 0u;
  *(_OWORD *)((char *)this + 808) = 0u;
  *(_OWORD *)((char *)this + 824) = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((KB::Candidate *)((char *)this + 848));
  language_modeling::v1::LinguisticContext::LinguisticContext((KB::Candidate *)((char *)this + 856));
  *((_QWORD *)this + 109) = 0;
  *((_QWORD *)this + 108) = 0;
  *((_QWORD *)this + 110) = 0;
  KB::String::String((KB::Candidate *)((char *)this + 888));
  *((_WORD *)this + 472) = 0;
  *((_QWORD *)this + 117) = 0;
  *(_OWORD *)((char *)this + 920) = 0u;
  *((_DWORD *)this + 240) = 0;
  *((_BYTE *)this + 964) = 0;
  *((_OWORD *)this + 61) = 0u;
  *((_DWORD *)this + 248) = 0;
  KB::Candidate::append();
  return this;
}

void sub_22FAA0134(_Unwind_Exception *a1)
{
  uint64_t v1;
  KB::String *v2;
  void **v3;
  const void *v5;
  const void *v6;
  uint64_t v7;

  v5 = *(const void **)(v1 + 984);
  if (v5)
    CFRelease(v5);
  *(_QWORD *)(v1 + 984) = 0;
  v6 = *(const void **)(v1 + 976);
  if (v6)
    CFRelease(v6);
  *(_QWORD *)(v1 + 976) = 0;
  if (*(unsigned __int16 *)(v1 + 944) >= 0xFu)
  {
    v7 = *(_QWORD *)(v1 + 952);
    if (v7)
      MEMORY[0x2348A8A0C](v7, 0x1000C8077774924);
  }
  if (*(char *)(v1 + 943) < 0)
    operator delete(*v3);
  KB::String::~String(v2);
  KB::LanguageModelContext::~LanguageModelContext((KB::LanguageModelContext *)(v1 + 784));
  WTF::Vector<KB::Word,3ul>::~Vector((uint64_t *)v1);
  _Unwind_Resume(a1);
}

uint64_t TI::CP::CPEval::match_index(TI::CP::CPEval *this, const KB::String *a2, const KB::Candidate **a3)
{
  const KB::Candidate *v5;
  const KB::Candidate *v6;
  _BYTE v8[32];
  TI::CP::CPEval *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = *a3;
  v6 = a3[1];
  MEMORY[0x2348A87C0](v8, a2);
  v9 = this;
  if (v5 != v6)
  {
    while ((TI::CP::CPEval::is_match(v9, v5, (const KB::String *)v8) & 1) == 0)
    {
      v5 = (const KB::Candidate *)((char *)v5 + 1000);
      if (v5 == v6)
      {
        v5 = v6;
        break;
      }
    }
  }
  KB::String::~String((KB::String *)v8);
  if (v5 == a3[1])
    return 0xFFFFFFFFLL;
  else
    return 652835029 * ((unint64_t)(v5 - *a3) >> 3);
}

void sub_22FAA0284(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void TI::CP::CPEval::create_recognizer_for_config(const std::string *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int *data;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *size;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  std::string::pointer v32;
  unsigned int *v33;
  unsigned int v34;
  unsigned int *v35;
  unsigned int *v36;
  unsigned int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  std::string::pointer v43;
  unsigned int *v44;
  unsigned int v45;
  uint64_t v46;
  std::string::pointer v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  unsigned int *v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int *v60;
  unsigned int v61;
  unsigned int v62;
  std::string::pointer v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *p_shared_owners;
  unint64_t v68;
  std::string::size_type v69;
  std::__shared_weak_count *v70;
  unsigned int *v71;
  std::string::pointer v72;
  void *v73[2];
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77[2];
  __int128 v78;
  void *v79[2];
  void *v80[2];
  void *v81[6];
  unsigned int *v82;
  unsigned int *v83;
  std::string::pointer v84;
  _OWORD v85[6];
  uint64_t v86;
  std::string v87;
  std::string v88;
  __int16 v89;
  char v90;
  _OWORD v91[12];
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  switch(a2)
  {
    case 0:
      v7 = operator new();
      v8 = v7;
      data = (unsigned int *)a1[4].__r_.__value_.__l.__data_;
      v83 = data;
      if (data)
      {
        v10 = data + 2;
        do
          v11 = __ldaxr(v10);
        while (__stlxr(v11 + 1, v10));
      }
      size = (unsigned int *)a1[4].__r_.__value_.__l.__size_;
      v82 = size;
      if (size)
      {
        v13 = size + 2;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 + 1, v13));
      }
      v74 = 1;
      v76 = 0;
      v73[0] = (void *)0x402E000000000000;
      v73[1] = (void *)1;
      v75 = 0x3FD3333333333333;
      *(_OWORD *)v77 = 0u;
      v78 = 0u;
      *(_OWORD *)v79 = 0u;
      *(_OWORD *)v80 = 0u;
      memset(v81, 0, sizeof(v81));
      MEMORY[0x2348A8898](v7, &v83, &v82, v73);
      v15 = *a4;
      *a4 = v8;
      if (v15)
        (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
      if (v81[1])
      {
        v81[2] = v81[1];
        operator delete(v81[1]);
      }
      if (v80[0])
      {
        v80[1] = v80[0];
        operator delete(v80[0]);
      }
      if (*((_QWORD *)&v78 + 1))
      {
        v79[0] = *((void **)&v78 + 1);
        operator delete(*((void **)&v78 + 1));
      }
      if (v77[0])
      {
        v77[1] = v77[0];
        operator delete(v77[0]);
      }
      if (v82)
      {
        v16 = v82 + 2;
        v17 = atomic_load(v82 + 2);
        if (v17 == 1)
        {
          (*(void (**)(void))(*(_QWORD *)v82 + 8))();
        }
        else
        {
          do
            v18 = __ldaxr(v16);
          while (__stlxr(v18 - 1, v16));
        }
      }
      if (v83)
      {
        v19 = v83 + 2;
        v20 = atomic_load(v83 + 2);
        if (v20 == 1)
        {
          (*(void (**)(void))(*(_QWORD *)v83 + 40))();
        }
        else
        {
          do
            v21 = __ldaxr(v19);
          while (__stlxr(v21 - 1, v19));
        }
      }
      v22 = *a4;
      v23 = *(_OWORD *)(a3 + 216);
      *(_OWORD *)(v22 + 432) = *(_OWORD *)(a3 + 200);
      *(_OWORD *)(v22 + 448) = v23;
      v24 = *(_OWORD *)(a3 + 248);
      v25 = *(_OWORD *)(a3 + 280);
      v26 = *(_OWORD *)(a3 + 232);
      *(_OWORD *)(v22 + 496) = *(_OWORD *)(a3 + 264);
      *(_OWORD *)(v22 + 512) = v25;
      *(_OWORD *)(v22 + 464) = v26;
      *(_OWORD *)(v22 + 480) = v24;
      v27 = *(_OWORD *)(a3 + 344);
      v29 = *(_OWORD *)(a3 + 296);
      v28 = *(_OWORD *)(a3 + 312);
      *(_OWORD *)(v22 + 560) = *(_OWORD *)(a3 + 328);
      *(_OWORD *)(v22 + 576) = v27;
      *(_OWORD *)(v22 + 528) = v29;
      *(_OWORD *)(v22 + 544) = v28;
      goto LABEL_67;
    case 1:
      v41 = operator new();
      v42 = v41;
      v43 = a1[4].__r_.__value_.__l.__data_;
      v84 = v43;
      if (v43)
      {
        v44 = (unsigned int *)(v43 + 8);
        do
          v45 = __ldaxr(v44);
        while (__stlxr(v45 + 1, v44));
      }
      LOBYTE(v73[0]) = 0;
      LOBYTE(v75) = 0;
      MEMORY[0x2348A8844](v41, 0, &v84, &a1[2], v73);
      v46 = *a4;
      *a4 = v42;
      if (v46)
        (*(void (**)(uint64_t))(*(_QWORD *)v46 + 8))(v46);
      if ((_BYTE)v75 && SHIBYTE(v74) < 0)
        operator delete(v73[0]);
      v47 = v84;
      if (!v84)
        break;
      v48 = (unsigned int *)(v84 + 8);
      v49 = atomic_load((unsigned int *)v84 + 2);
      if (v49 == 1)
        goto LABEL_64;
      do
        v50 = __ldaxr(v48);
      while (__stlxr(v50 - 1, v48));
      break;
    case 2:
      v22 = operator new();
      *(_QWORD *)v22 = MEMORY[0x24BEB5A80] + 16;
      *(_QWORD *)(v22 + 8) = 0;
      *(_OWORD *)(v22 + 16) = 0u;
      *(_OWORD *)(v22 + 64) = 0u;
      *(_OWORD *)(v22 + 32) = 0u;
      *(_OWORD *)(v22 + 48) = 0u;
      *(_OWORD *)(v22 + 80) = 0u;
      *(_OWORD *)(v22 + 96) = 0u;
      *(_DWORD *)(v22 + 112) = 7;
      *(_QWORD *)(v22 + 120) = 0x4028000000000000;
      *(_DWORD *)(v22 + 128) = 8;
      *(_OWORD *)(v22 + 136) = 0u;
      *(_OWORD *)(v22 + 152) = 0u;
      *(_OWORD *)(v22 + 168) = 0u;
      *(_OWORD *)(v22 + 184) = 0u;
      *(_QWORD *)(v22 + 200) = 0;
      MEMORY[0x2348A8868](v22 + 208, &a1->__r_.__value_.__r.__words[2]);
      *(_DWORD *)(v22 + 280) = 0;
      *(_OWORD *)(v22 + 288) = 0u;
      *(_OWORD *)(v22 + 304) = 0u;
      *(_DWORD *)(v22 + 320) = 1065353216;
      *(_BYTE *)(v22 + 328) = 0;
      *(_DWORD *)(v22 + 280) = TI::CP::ShapeStore::num_records((TI::CP::ShapeStore *)(v22 + 208));
      *a4 = v22;
      goto LABEL_67;
    case 3:
      v30 = (_OWORD *)(a3 + 104);
      std::string::operator=((std::string *)(a3 + 104), a1 + 2);
      v31 = operator new();
      v32 = a1[4].__r_.__value_.__l.__data_;
      v72 = v32;
      if (v32)
      {
        v33 = (unsigned int *)(v32 + 8);
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 + 1, v33));
      }
      v35 = (unsigned int *)a1[4].__r_.__value_.__l.__size_;
      v71 = v35;
      if (v35)
      {
        v36 = v35 + 2;
        do
          v37 = __ldaxr(v36);
        while (__stlxr(v37 + 1, v36));
      }
      v38 = *(_OWORD *)(a3 + 80);
      v85[4] = *(_OWORD *)(a3 + 64);
      v85[5] = v38;
      v86 = *(_QWORD *)(a3 + 96);
      v39 = *(_OWORD *)(a3 + 16);
      v85[0] = *(_OWORD *)a3;
      v85[1] = v39;
      v40 = *(_OWORD *)(a3 + 48);
      v85[2] = *(_OWORD *)(a3 + 32);
      v85[3] = v40;
      if (*(char *)(a3 + 127) < 0)
      {
        std::string::__init_copy_ctor_external(&v87, *(const std::string::value_type **)(a3 + 104), *(_QWORD *)(a3 + 112));
      }
      else
      {
        *(_OWORD *)&v87.__r_.__value_.__l.__data_ = *v30;
        v87.__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 120);
      }
      if (*(char *)(a3 + 151) < 0)
        std::string::__init_copy_ctor_external(&v88, *(const std::string::value_type **)(a3 + 128), *(_QWORD *)(a3 + 136));
      else
        v88 = *(std::string *)(a3 + 128);
      v89 = *(_WORD *)(a3 + 152);
      v90 = *(_BYTE *)(a3 + 154);
      MEMORY[0x2348A87C0](v91, a3 + 160);
      v51 = *(_OWORD *)(a3 + 336);
      v91[10] = *(_OWORD *)(a3 + 320);
      v91[11] = v51;
      v92 = *(_QWORD *)(a3 + 352);
      v52 = *(_OWORD *)(a3 + 272);
      v91[6] = *(_OWORD *)(a3 + 256);
      v91[7] = v52;
      v53 = *(_OWORD *)(a3 + 304);
      v91[8] = *(_OWORD *)(a3 + 288);
      v91[9] = v53;
      v54 = *(_OWORD *)(a3 + 208);
      v91[2] = *(_OWORD *)(a3 + 192);
      v91[3] = v54;
      v55 = *(_OWORD *)(a3 + 240);
      v91[4] = *(_OWORD *)(a3 + 224);
      v91[5] = v55;
      MEMORY[0x2348A8880](v31, &v72, &v71, v85);
      v56 = *a4;
      *a4 = v31;
      if (v56)
        (*(void (**)(uint64_t))(*(_QWORD *)v56 + 8))(v56);
      KB::String::~String((KB::String *)v91);
      if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v88.__r_.__value_.__l.__data_);
      if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v87.__r_.__value_.__l.__data_);
      if (v71)
      {
        v57 = v71 + 2;
        v58 = atomic_load(v71 + 2);
        if (v58 == 1)
        {
          (*(void (**)(void))(*(_QWORD *)v71 + 8))();
        }
        else
        {
          do
            v59 = __ldaxr(v57);
          while (__stlxr(v59 - 1, v57));
        }
      }
      v47 = v72;
      if (!v72)
        break;
      v60 = (unsigned int *)(v72 + 8);
      v61 = atomic_load((unsigned int *)v72 + 2);
      if (v61 == 1)
      {
LABEL_64:
        (*(void (**)(std::string::pointer))(*(_QWORD *)v47 + 40))(v47);
      }
      else
      {
        do
          v62 = __ldaxr(v60);
        while (__stlxr(v62 - 1, v60));
      }
      break;
    default:
      return;
  }
  v22 = *a4;
  if (*a4)
  {
LABEL_67:
    v63 = a1[5].__r_.__value_.__l.__data_;
    v69 = a1[4].__r_.__value_.__r.__words[2];
    v70 = (std::__shared_weak_count *)v63;
    if (v63)
    {
      v64 = (unint64_t *)(v63 + 8);
      do
        v65 = __ldxr(v64);
      while (__stxr(v65 + 1, v64));
    }
    (*(void (**)(uint64_t, std::string::size_type *))(*(_QWORD *)v22 + 112))(v22, &v69);
    v66 = v70;
    if (v70)
    {
      p_shared_owners = (unint64_t *)&v70->__shared_owners_;
      do
        v68 = __ldaxr(p_shared_owners);
      while (__stlxr(v68 - 1, p_shared_owners));
      if (!v68)
      {
        ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
        std::__shared_weak_count::__release_weak(v66);
      }
    }
  }
}

void sub_22FAA08F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, unsigned int *a11, unsigned int *a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62)
{
  uint64_t *v62;
  uint64_t v63;
  unsigned int *v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int *v68;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;

  if (a56 < 0)
    operator delete(__p);
  if (a11)
  {
    v65 = a11 + 2;
    v66 = atomic_load(a11 + 2);
    if (v66 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)a11 + 8))();
    }
    else
    {
      do
        v67 = __ldaxr(v65);
      while (__stlxr(v67 - 1, v65));
    }
  }
  if (a12)
  {
    v68 = a12 + 2;
    v69 = atomic_load(a12 + 2);
    if (v69 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)a12 + 40))();
    }
    else
    {
      do
        v70 = __ldaxr(v68);
      while (__stlxr(v70 - 1, v68));
    }
  }
  MEMORY[0x2348A8A24](v63, 0x10B3C40F00FAD0FLL);
  v71 = *v62;
  *v62 = 0;
  if (v71)
    (*(void (**)(uint64_t))(*(_QWORD *)v71 + 8))(v71);
  _Unwind_Resume(a1);
}

void TI::CP::PathResampler::~PathResampler(TI::CP::PathResampler *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)*((_QWORD *)this + 14);
  if (v2)
  {
    *((_QWORD *)this + 15) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 11);
  if (v3)
  {
    *((_QWORD *)this + 12) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 8);
  if (v4)
  {
    *((_QWORD *)this + 9) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 5);
  if (v5)
  {
    *((_QWORD *)this + 6) = v5;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,TI::CP::ShapeRecord>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,TI::CP::ShapeRecord>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,TI::CP::ShapeRecord>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,TI::CP::ShapeRecord>>>::~__hash_table(uint64_t a1)
{
  void **v2;
  void **v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 143) < 0)
        operator delete(v2[15]);
      v4 = v2[12];
      if (v4)
      {
        v2[13] = v4;
        operator delete(v4);
      }
      v5 = v2[9];
      if (v5)
      {
        v2[10] = v5;
        operator delete(v5);
      }
      if (*((char *)v2 + 71) < 0)
        operator delete(v2[6]);
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v6 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v6)
    operator delete(v6);
  return a1;
}

void TI::CP::PathReducer::~PathReducer(TI::CP::PathReducer *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 8);
  if (v2)
  {
    *((_QWORD *)this + 9) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 5);
  if (v3)
  {
    *((_QWORD *)this + 6) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 2);
  if (v4)
  {
    *((_QWORD *)this + 3) = v4;
    operator delete(v4);
  }
}

uint64_t TI::CP::TIPathRecognizerInterface::usage_count(TI::CP::TIPathRecognizerInterface *this)
{
  return 0;
}

uint64_t TI::CP::TIPathRecognizerInterface::remove_shapes_older_than(TI::CP::TIPathRecognizerInterface *this, double a2)
{
  return 1;
}

void TI::CP::CPEval::evaluate_records(std::string *a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  void **v32;
  TI::CP::ContinuousPathTestResult *v33;
  TI::CP::ContinuousPathTestResult *v34;
  unint64_t v35;
  uint64_t v36;
  _BYTE v37[8];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42[15];
  _OWORD v43[6];
  uint64_t v44;
  std::string v45;
  std::string __p;
  __int16 v47;
  char v48;
  _OWORD v49[12];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a5 = 0;
  *(_QWORD *)(a5 + 8) = 0;
  *(_QWORD *)(a5 + 16) = 0;
  *(_DWORD *)(a5 + 24) = -1;
  v9 = (void *)MEMORY[0x2348A8D30]();
  v10 = *(_OWORD *)(a4 + 80);
  v43[4] = *(_OWORD *)(a4 + 64);
  v43[5] = v10;
  v44 = *(_QWORD *)(a4 + 96);
  v11 = *(_OWORD *)(a4 + 16);
  v43[0] = *(_OWORD *)a4;
  v43[1] = v11;
  v12 = *(_OWORD *)(a4 + 48);
  v43[2] = *(_OWORD *)(a4 + 32);
  v43[3] = v12;
  if (*(char *)(a4 + 127) < 0)
    std::string::__init_copy_ctor_external(&v45, *(const std::string::value_type **)(a4 + 104), *(_QWORD *)(a4 + 112));
  else
    v45 = *(std::string *)(a4 + 104);
  if (*(char *)(a4 + 151) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a4 + 128), *(_QWORD *)(a4 + 136));
  else
    __p = *(std::string *)(a4 + 128);
  v47 = *(_WORD *)(a4 + 152);
  v48 = *(_BYTE *)(a4 + 154);
  MEMORY[0x2348A87C0](v49, a4 + 160);
  v13 = *(_OWORD *)(a4 + 336);
  v49[10] = *(_OWORD *)(a4 + 320);
  v49[11] = v13;
  v50 = *(_QWORD *)(a4 + 352);
  v14 = *(_OWORD *)(a4 + 272);
  v49[6] = *(_OWORD *)(a4 + 256);
  v49[7] = v14;
  v15 = *(_OWORD *)(a4 + 304);
  v49[8] = *(_OWORD *)(a4 + 288);
  v49[9] = v15;
  v16 = *(_OWORD *)(a4 + 208);
  v49[2] = *(_OWORD *)(a4 + 192);
  v49[3] = v16;
  v17 = *(_OWORD *)(a4 + 240);
  v49[4] = *(_OWORD *)(a4 + 224);
  v49[5] = v17;
  TI::CP::CPEval::create_recognizer_for_config(a1, a3, (uint64_t)v43, &v31);
  KB::String::~String((KB::String *)v49);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  v29 = v31;
  if (v31)
  {
    v18 = *a2;
    if (a2[1] != *a2)
    {
      v19 = 0;
      v20 = 0;
      do
      {
        TI::CP::CPEval::evaluate_test_case((TI::CP::CPEval *)a1, (const TI::CP::ContinuousPathTestCase *)(v18 + v19), (TI::CP::TIPathRecognizerInterface *)v29, v20, (uint64_t)v37);
        v22 = *(_QWORD *)(a5 + 8);
        v21 = *(_QWORD *)(a5 + 16);
        if (v22 >= v21)
        {
          v24 = 0x34F72C234F72C235 * ((uint64_t)(v22 - *(_QWORD *)a5) >> 3);
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) > 0x11A7B9611A7B961)
            abort();
          v26 = 0x34F72C234F72C235 * ((uint64_t)(v21 - *(_QWORD *)a5) >> 3);
          if (2 * v26 > v25)
            v25 = 2 * v26;
          if (v26 >= 0x8D3DCB08D3DCB0)
            v27 = 0x11A7B9611A7B961;
          else
            v27 = v25;
          v36 = a5 + 16;
          if (v27)
            v27 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v27);
          else
            v28 = 0;
          v32 = (void **)v27;
          v33 = (TI::CP::ContinuousPathTestResult *)(v27 + 232 * v24);
          v34 = v33;
          v35 = v27 + 232 * v28;
          TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(v33, (const TI::CP::ContinuousPathTestResult *)v37);
          v34 = (TI::CP::ContinuousPathTestResult *)((char *)v34 + 232);
          std::vector<TI::CP::ContinuousPathTestResult>::__swap_out_circular_buffer((uint64_t *)a5, &v32);
          v23 = *(_QWORD *)(a5 + 8);
          std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v32);
        }
        else
        {
          TI::CP::ContinuousPathTestResult::ContinuousPathTestResult(*(TI::CP::ContinuousPathTestResult **)(a5 + 8), (const TI::CP::ContinuousPathTestResult *)v37);
          v23 = v22 + 232;
          *(_QWORD *)(a5 + 8) = v23;
        }
        *(_QWORD *)(a5 + 8) = v23;
        std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v42[9]);
        v32 = (void **)v42;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v32);
        v32 = (void **)&v41;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v32);
        v32 = (void **)&v40;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v32);
        v32 = (void **)&v39;
        std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v32);
        KB::String::~String((KB::String *)&v38);
        ++v20;
        v18 = *a2;
        v19 += 240;
      }
      while (0xEEEEEEEEEEEEEEEFLL * ((a2[1] - *a2) >> 4) > v20);
    }
    if (a3 == 2)
      *(_DWORD *)(a5 + 24) = TI::CP::ShapeStore::num_records((TI::CP::ShapeStore *)(v29 + 208));
    (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  }
  objc_autoreleasePoolPop(v9);
}

void sub_22FAA1098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  (*(void (**)(uint64_t))(*(_QWORD *)a5 + 8))(a5);
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  _Unwind_Resume(a1);
}

void TI::CP::CPEval::evaluate_test_case(TI::CP::CPEval *this@<X0>, const TI::CP::ContinuousPathTestCase *a2@<X1>, TI::CP::TIPathRecognizerInterface *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *v12;
  char *v13;
  char *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  unsigned int v21;
  double v22;
  unsigned int v23;
  uint64_t v24;
  int matched;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  void *__p[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  void **v44;
  _QWORD v45[3];
  _QWORD *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(TI::CP::TIPathRecognizerInterface *))(*(_QWORD *)a3 + 56))(a3);
  *((_DWORD *)this + 39) = 0;
  if (*((_BYTE *)this + 160))
  {
    (*(void (**)(TI::CP::TIPathRecognizerInterface *, char *))(*(_QWORD *)a3 + 120))(a3, (char *)a2 + 88);
  }
  else
  {
    v43 = 0;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    *(_OWORD *)__p = 0u;
    v38 = 0u;
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v41);
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)((char *)&v41 + 8));
    v42 = 0uLL;
    v43 = 0;
    (*(void (**)(TI::CP::TIPathRecognizerInterface *, void **))(*(_QWORD *)a3 + 120))(a3, __p);
    v44 = (void **)&v42;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v44);
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)((char *)&v41 + 8));
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v41);
    if ((_QWORD)v38)
    {
      *((_QWORD *)&v38 + 1) = v38;
      operator delete((void *)v38);
    }
    v26 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v27 = (unint64_t *)((char *)__p[1] + 8);
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
  }
  v9 = *(unsigned int **)a2;
  if (*(_QWORD *)a2)
  {
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 + 1, v9));
    if (*((unsigned int **)a3 + 1) == v9)
    {
LABEL_10:
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v9);
      goto LABEL_11;
    }
    do
      v11 = __ldaxr(v9);
    while (__stlxr(v11 + 1, v9));
    v12 = (unsigned int *)*((_QWORD *)a3 + 1);
    *((_QWORD *)a3 + 1) = v9;
    if (!v12)
    {
LABEL_9:
      (*(void (**)(TI::CP::TIPathRecognizerInterface *))(*(_QWORD *)a3 + 152))(a3);
      if (!v9)
        goto LABEL_11;
      goto LABEL_10;
    }
LABEL_8:
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v12);
    goto LABEL_9;
  }
  v12 = (unsigned int *)*((_QWORD *)a3 + 1);
  if (v12)
  {
    *((_QWORD *)a3 + 1) = 0;
    goto LABEL_8;
  }
LABEL_11:
  if ((*(unsigned int (**)(TI::CP::TIPathRecognizerInterface *))(*(_QWORD *)a3 + 16))(a3) == 2)
  {
    v13 = (char *)*((_QWORD *)a2 + 8);
    if (!v13)
      v13 = (char *)a2 + 72;
    if (*((_WORD *)a2 + 28))
      v14 = v13;
    else
      v14 = "";
    std::string::basic_string[abi:nn180100]<0>(__p, v14);
    v15 = TI::CP::ShapeStore::shape_count_for_word();
    if (SBYTE7(v38) < 0)
      operator delete(__p[0]);
    v35 = v15 > 0;
  }
  else
  {
    v35 = 0;
  }
  v16 = *((_QWORD *)a2 + 1);
  v17 = *((_QWORD *)a2 + 2) - v16;
  if (v17)
  {
    v18 = 0;
    v19 = 0xAAAAAAAAAAAAAAABLL * (v17 >> 4);
    v20 = INFINITY;
    v21 = 1;
    v22 = INFINITY;
    while (1)
    {
      if (v19 == v21)
        v23 = 2;
      else
        v23 = 1;
      if (v21 == 1)
        v24 = 0;
      else
        v24 = v23;
      (*(void (**)(TI::CP::TIPathRecognizerInterface *, uint64_t, _QWORD, double, double, double, double))(*(_QWORD *)a3 + 32))(a3, v24, 0, *(double *)(v16 + 48 * v18), *(double *)(v16 + 48 * v18 + 8), *(double *)(v16 + 48 * v18 + 16), *(double *)(v16 + 48 * v18 + 24));
      if (!*((_BYTE *)this + 8))
        goto LABEL_38;
      HIDWORD(v43) = 0;
      *(_OWORD *)__p = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      (*(void (**)(TI::CP::TIPathRecognizerInterface *, void **, _QWORD))(*(_QWORD *)a3 + 80))(a3, __p, *((unsigned int *)this + 10));
      matched = TI::CP::CPEval::match_index(this, (const TI::CP::ContinuousPathTestCase *)((char *)a2 + 56), (const KB::Candidate **)__p);
      if (matched != -1)
      {
        if (!matched)
        {
          if (fabs(v22) == INFINITY)
            v22 = *(double *)(v16 + 48 * v18 + 32);
LABEL_35:
          if (fabs(v20) == INFINITY)
            v20 = *(double *)(v16 + 48 * v18 + 32);
          goto LABEL_37;
        }
        if (matched <= 2)
          goto LABEL_35;
      }
LABEL_37:
      v44 = (void **)&v41 + 1;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v44);
      v44 = (void **)&v40;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v44);
      v44 = (void **)&v38 + 1;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v44);
      v44 = __p;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v44);
LABEL_38:
      v18 = v21;
      v16 = *((_QWORD *)a2 + 1);
      v19 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)a2 + 2) - v16) >> 4);
      ++v21;
      if (v19 <= v18)
        goto LABEL_48;
    }
  }
  v22 = INFINITY;
  v20 = INFINITY;
LABEL_48:
  HIDWORD(v43) = 0;
  *(_OWORD *)__p = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  (*(void (**)(TI::CP::TIPathRecognizerInterface *, void **, _QWORD))(*(_QWORD *)a3 + 80))(a3, __p, *((unsigned int *)this + 10));
  v29 = *((_QWORD *)this + 14);
  if (v29)
  {
    (*(void (**)(uint64_t, void **, _QWORD))(*(_QWORD *)v29 + 64))(v29, __p, 0);
    v30 = *((_QWORD *)this + 14);
    v45[0] = &off_24FD48FE0;
    v46 = v45;
    (*(void (**)(uint64_t, void **, _QWORD *))(*(_QWORD *)v30 + 56))(v30, __p, v45);
    v31 = v46;
    if (v46 == v45)
    {
      v32 = 4;
      v31 = v45;
    }
    else
    {
      if (!v46)
      {
LABEL_54:
        KB::CandidateCollection::normalize_scores((KB::CandidateCollection *)__p);
        goto LABEL_55;
      }
      v32 = 5;
    }
    (*(void (**)(void))(*v31 + 8 * v32))();
    goto LABEL_54;
  }
LABEL_55:
  TI::ConfidenceModel::update_confidence_for_candidates((TI::CP::CPEval *)((char *)this + 128), (KB::CandidateCollection *)__p);
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)this, (const KB::Candidate **)__p, a2, a4, a5);
  v33 = *((_QWORD *)a2 + 2);
  if (*((_QWORD *)a2 + 1) == v33)
    v34 = 0;
  else
    v34 = *(_QWORD *)(v33 - 16);
  *(_QWORD *)(a5 + 152) = v34;
  *(double *)(a5 + 160) = v22;
  *(double *)(a5 + 168) = v20;
  *(_BYTE *)(a5 + 220) = v35;
  *(_DWORD *)(a5 + 224) = (*(uint64_t (**)(TI::CP::TIPathRecognizerInterface *))(*(_QWORD *)a3 + 24))(a3);
  v44 = (void **)&v41 + 1;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v44);
  v44 = (void **)&v40;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v44);
  v44 = (void **)&v38 + 1;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v44);
  v44 = __p;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v44);
}

void sub_22FAA1668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  KB::LanguageModelContext::~LanguageModelContext((KB::LanguageModelContext *)&__p);
  _Unwind_Resume(a1);
}

void KB::CandidateCollection::~CandidateCollection(void **this)
{
  void **v2;

  v2 = this + 9;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  v2 = this + 6;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  v2 = this + 3;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
  v2 = this;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v2);
}

void TI::CP::CPEval::compose_result_from_candidates(KB::DictionaryContainer **this@<X0>, const KB::Candidate **a2@<X1>, const TI::CP::ContinuousPathTestCase *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  const KB::String *v10;
  unsigned int matched;
  KB::DictionaryContainer *v12;
  const KB::Word *v13;
  const KB::Word *v14;
  _QWORD *v15;
  char v16;
  char v17;
  char v18;
  const KB::Candidate *v19;
  float v20;
  float v21;
  float v22;
  float v23;
  _QWORD v24[2];
  uint64_t (*v25)(uint64_t, const KB::Word *);
  void *v26;
  TI::CP::CPEval *v27;
  const TI::CP::ContinuousPathTestCase *v28;
  const KB::Word *v29;
  const KB::Word *v30;
  const KB::Word **v31;

  v10 = (const TI::CP::ContinuousPathTestCase *)((char *)a3 + 56);
  matched = TI::CP::CPEval::match_index((TI::CP::CPEval *)this, (const TI::CP::ContinuousPathTestCase *)((char *)a3 + 56), a2);
  v12 = this[9];
  if (v12)
  {
    KB::DictionaryContainer::lookup(v12, v10);
    v13 = v29;
    v14 = v30;
    if (v29 == v30)
    {
      v17 = 0;
    }
    else
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v25 = ___ZNK2TI2CP6CPEval30compose_result_from_candidatesERKN2KB19CandidateCollectionERKNS0_22ContinuousPathTestCaseEj_block_invoke;
      v26 = &__block_descriptor_48_e10_B16__0r_v8l;
      v27 = (TI::CP::CPEval *)this;
      v28 = a3;
      v15 = v24;
      do
      {
        v16 = v25((uint64_t)v15, v13);
        v17 = v16;
        v13 = (const KB::Word *)((char *)v13 + 240);
        if (v13 == v14)
          v18 = 1;
        else
          v18 = v16;
      }
      while ((v18 & 1) == 0);

    }
    v31 = &v29;
    std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100]((void ***)&v31);
  }
  else
  {
    v17 = 1;
  }
  TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)a5, a4, v10, (const KB::CandidateCollection *)a2, matched, v17);
  if ((matched & 0x80000000) != 0)
  {
    if (*a2 != a2[1])
    {
      v22 = expf(*((float *)*a2 + 186));
      *(double *)(a5 + 208) = logf(v22);
    }
    goto LABEL_18;
  }
  v19 = *a2;
  v20 = expf(*((float *)*a2 + 250 * matched + 186));
  *(double *)(a5 + 200) = logf(v20);
  if (matched)
  {
    v21 = expf(*((float *)v19 + 186));
    *(double *)(a5 + 208) = logf(v21);
    if (matched <= 3)
      goto LABEL_22;
LABEL_18:
    if (*((_DWORD *)a2 + 24) != 2)
    {
      *(_BYTE *)(a5 + 219) = 1;
      return;
    }
    goto LABEL_24;
  }
  if ((unint64_t)(0x1CAC083126E978D5 * ((a2[1] - v19) >> 3)) >= 2)
  {
    v23 = expf(*((float *)v19 + 436));
    *(double *)(a5 + 208) = logf(v23);
  }
LABEL_22:
  if (*((_DWORD *)a2 + 24) == 2)
  {
    *(_BYTE *)(a5 + 218) = 1;
    return;
  }
LABEL_24:
  *(_BYTE *)(a5 + 217) = 1;
}

void sub_22FAA197C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, void **a18)
{
  void *v18;

  a18 = (void **)&a15;
  std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100](&a18);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK2TI2CP6CPEval30compose_result_from_candidatesERKN2KB19CandidateCollectionERKNS0_22ContinuousPathTestCaseEj_block_invoke(uint64_t a1, const KB::Word *a2)
{
  TI::CP::CPEval *v3;
  uint64_t is_match;
  _QWORD v6[126];

  v6[125] = *MEMORY[0x24BDAC8D0];
  v3 = *(TI::CP::CPEval **)(a1 + 32);
  KB::Candidate::Candidate((KB::Candidate *)v6, a2);
  is_match = TI::CP::CPEval::is_match(v3, (const KB::Candidate *)v6, (const KB::String *)(*(_QWORD *)(a1 + 40) + 56));
  MEMORY[0x2348A8820](v6);
  return is_match;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0>,void ()(KB::Candidate &,float)>::~__func()
{
  JUMPOUT(0x2348A8A24);
}

_QWORD *std::__function::__func<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0>,void ()(KB::Candidate &,float)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24FD48FE0;
  return result;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0>,void ()(KB::Candidate &,float)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24FD48FE0;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case(TI::CP::ContinuousPathTestCase const&,TI::CP::TIPathRecognizerInterface *,unsigned int)::$_0>,void ()(KB::Candidate &,float)>::operator()(int a1, KB::Candidate *this, float *a3)
{
  float v4;
  float v5;
  float v6;
  float v7;
  char *v8;
  float v9;
  KB *v10;
  float v11;
  KB *v12;
  void *value;
  __CFDictionary *cf;
  uint64_t v15;
  int v16;

  v4 = *a3;
  v5 = *((float *)this + 187);
  v6 = *((float *)this + 189);
  v7 = *((float *)this + 190);
  v8 = (char *)this + 764;
  v15 = *(_QWORD *)((char *)this + 764);
  v16 = *((_DWORD *)this + 193);
  if ((KB::Candidate::has_from_named_entities(this) & 1) != 0
    || KB::Candidate::has_from_supplemental_lexicon(this))
  {
    v4 = v4 * 0.8;
  }
  v9 = logf(v4);
  *((float *)this + 186) = v5 + (float)(v7 * (float)(v6 + v9));
  *((float *)this + 187) = v5;
  *((float *)this + 188) = v9;
  *((float *)this + 189) = v6;
  *((float *)this + 190) = v7;
  *(_QWORD *)v8 = v15;
  *((_DWORD *)v8 + 2) = v16;
  KB::cf_mutable_dictionary(v10);
  v11 = expf(*((float *)this + 186));
  KB::cf_number(v12, v11);
  CFDictionarySetValue(cf, CFSTR("refinement_omega"), value);
  if (value)
    CFRelease(value);
  KB::Candidate::add_sources_info(this, CFSTR("refinement"), cf);
  if (cf)
    CFRelease(cf);
}

void sub_22FAA1BB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

void TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::CPEval *this@<X0>, const TI::CP::ContinuousPathTestCase *a2@<X1>, TI::Favonius::FavoniusStrokeBuildManager *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unsigned int *v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  TI::CP::CPEval *v24;
  void *__p[3];
  const KB::Candidate *v27[3];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void **v31;
  void **v32;
  _BYTE v33[32];
  _BYTE v34[32];
  _BYTE v35[32];
  void **v36[125];
  _QWORD v37[3];
  _QWORD *v38;
  _BYTE v39[32];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(_QWORD *)a3 + 352))(a3);
  (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *))(*(_QWORD *)a3 + 144))(a3);
  v24 = this;
  *((_DWORD *)this + 39) = 1;
  v8 = *((_QWORD *)a2 + 1);
  v9 = *((_QWORD *)a2 + 2);
  v10 = v9 - v8;
  if (v9 != v8)
  {
    v11 = 0;
    v12 = 0xAAAAAAAAAAAAAAABLL * (v10 >> 4);
    do
    {
      v13 = (v11 + 1);
      v14 = v12 == v13 && v11 != 0;
      TI::Favonius::Touch::create();
      v15 = (unsigned int *)v36[0];
      if (v14)
      {
        v31 = v36[0];
        if (v36[0])
        {
          do
            v16 = __ldaxr(v15);
          while (__stlxr(v16 + 1, v15));
        }
        (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *, void ***, uint64_t, _QWORD))(*(_QWORD *)a3 + 32))(a3, &v31, 4294967294, 0);
        v17 = (uint64_t)v31;
        if (!v31)
          goto LABEL_15;
      }
      else
      {
        v32 = v36[0];
        if (v36[0])
        {
          do
            v18 = __ldaxr(v15);
          while (__stlxr(v18 + 1, v15));
        }
        (*(void (**)(TI::Favonius::FavoniusStrokeBuildManager *, void ***, uint64_t, _QWORD))(*(_QWORD *)a3 + 24))(a3, &v32, 4294967294, 0);
        v17 = (uint64_t)v32;
        if (!v32)
          goto LABEL_15;
      }
      WTF::RefCounted<TI::Favonius::Touch>::deref(v17);
LABEL_15:
      if (v15)
        WTF::RefCounted<TI::Favonius::Touch>::deref((uint64_t)v15);
      v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 2) - *((_QWORD *)a2 + 1)) >> 4);
      v11 = v13;
    }
    while (v12 > v13);
  }
  KB::String::String((KB::String *)v39);
  v19 = *((unsigned int *)v24 + 45);
  v37[0] = &off_24FD49028;
  v38 = v37;
  (*(void (**)(const KB::Candidate **__return_ptr, TI::Favonius::FavoniusStrokeBuildManager *, char *, char *, uint64_t, _BYTE *, uint64_t, _QWORD *))(*(_QWORD *)a3 + 72))(v27, a3, (char *)a2 + 192, (char *)a2 + 88, v19, v39, 5, v37);
  v20 = v38;
  if (v38 == v37)
  {
    v21 = 4;
    v20 = v37;
  }
  else
  {
    if (!v38)
      goto LABEL_23;
    v21 = 5;
  }
  (*(void (**)(void))(*v20 + 8 * v21))();
LABEL_23:
  if (v27[1] != v27[0])
  {
    KB::Candidate::Candidate((KB::Candidate *)v36, v27[0]);
    KB::Candidate::capitalized_string((KB::Candidate *)v36);
    KB::String::String((KB::String *)v34);
    KB::String::String((KB::String *)v33);
    v22 = KB::Candidate::string((KB::Candidate *)v36);
    (*(void (**)(void **__return_ptr, TI::Favonius::FavoniusStrokeBuildManager *, _BYTE *, _BYTE *, _BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)a3 + 104))(__p, a3, v35, v34, v33, 0, v22, 1);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    KB::String::~String((KB::String *)v33);
    KB::String::~String((KB::String *)v34);
    KB::String::~String((KB::String *)v35);
    MEMORY[0x2348A8820](v36);
  }
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)v24, v27, a2, a4, a5);
  v36[0] = (void **)&v30;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v36);
  v36[0] = (void **)&v29;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v36);
  v36[0] = (void **)&v28;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v36);
  v36[0] = (void **)v27;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v36);
  KB::String::~String((KB::String *)v39);
}

void sub_22FAA1F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  KB::String::~String((KB::String *)&a36);
  KB::String::~String((KB::String *)&a40);
  MEMORY[0x2348A8820](&a44);
  KB::CandidateCollection::~CandidateCollection(&a17);
  KB::String::~String((KB::String *)(v44 - 128));
  _Unwind_Resume(a1);
}

uint64_t WTF::RefCounted<TI::Favonius::Touch>::deref(uint64_t result)
{
  unsigned int v1;
  unsigned int *v2;
  unsigned int v3;

  v1 = atomic_load((unsigned int *)result);
  if (v1 == 1)
  {
    v2 = *(unsigned int **)(result + 56);
    if (v2)
      WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v2);
    JUMPOUT(0x2348A8A24);
  }
  do
    v3 = __ldaxr((unsigned int *)result);
  while (__stlxr(v3 - 1, (unsigned int *)result));
  return result;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0>,void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::~__func()
{
  JUMPOUT(0x2348A8A24);
}

_QWORD *std::__function::__func<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0>,void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24FD49028;
  return result;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0>,void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24FD49028;
}

void std::__function::__func<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0,std::allocator<TI::CP::CPEval::evaluate_test_case_favonius(TI::CP::ContinuousPathTestCase const&,TI::Favonius::FavoniusStrokeBuildManager *,unsigned int)::$_0>,void ()(KB::CandidateCollection &,KB::CandidateFilterFlags,BOOL)>::operator()(uint64_t a1, const KB::CandidateCollection *a2, uint64_t a3)
{
  void *v3;
  _BYTE v4[24];
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;

  v3 = *(void **)a3;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v4, a2);
  if (v3)
    operator delete(v3);
  v8 = (void **)&v7;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v8);
  v8 = (void **)&v6;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v8);
  v8 = (void **)&v5;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v8);
  v8 = (void **)v4;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v8);
}

void sub_22FAA2158(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void TI::CP::CPEval::evaluate_test_case_input_manager(TI::CP::CPEval *this@<X0>, unsigned int **a2@<X1>, TIInputManager *a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int *v11;
  unint64_t v12;
  unsigned int v13;
  int v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int *v19;
  void **v20[3];
  _OWORD v21[46];
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[32];
  _OWORD v30[3];
  uint64_t v31;
  __int16 v32;
  int v33;
  char v34;
  __int128 v35;
  int v36;
  const KB::Candidate *v37[3];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[6];

  v41[4] = *MEMORY[0x24BDAC8D0];
  *((_DWORD *)this + 39) = 2;
  TIInputManager::clear_continuous_path(a3);
  v8 = *a2;
  v19 = *a2;
  if (*a2)
  {
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
  }
  TIInputManager::set_key_layout();
  v17 = a5;
  if (v19)
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v19);
  KB::String::String((KB::String *)v20);
  TIInputManager::set_input_context();
  KB::String::~String((KB::String *)v20);
  MEMORY[0x2348A87C0](v20, a2 + 24);
  TIInputManager::set_input();
  KB::String::~String((KB::String *)v20);
  v10 = a2[1];
  v11 = a2[2];
  if (v11 != v10)
  {
    v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v10) >> 4);
    v13 = 1;
    v14 = 5;
    do
    {
      if (v12 == v13)
        v15 = 5;
      else
        v15 = v14;
      if (v13 == 1)
        v14 = 1;
      else
        v14 = v15;
      TIInputManager::add_touch();
      v16 = v13;
      v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2[2] - (char *)a2[1]) >> 4);
      ++v13;
    }
    while (v12 > v16);
  }
  TIInputManager::lookup();
  v20[0] = 0;
  v20[1] = (void **)v21;
  v20[2] = (void **)3;
  v21[45] = xmmword_22FAC90F0;
  v22 = 0xFF8000003F800000;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v28);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)v29);
  memset(&v29[8], 0, 24);
  KB::String::String((KB::String *)v30);
  v30[2] = 0u;
  v32 = 0;
  v31 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0u;
  v36 = 0;
  TI::CP::CPEval::compose_result_from_candidates((KB::DictionaryContainer **)this, v37, (const TI::CP::ContinuousPathTestCase *)a2, a4, v17);
  MEMORY[0x2348A8820](v20);
  KB::String::~String((KB::String *)v41);
  v20[0] = (void **)&v40;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v20);
  v20[0] = (void **)&v39;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v20);
  v20[0] = (void **)&v38;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v20);
  v20[0] = (void **)v37;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](v20);
}

void **std::tuple<KB::CandidateCollection,KB::String>::~tuple(void **a1)
{
  void **v3;

  KB::String::~String((KB::String *)(a1 + 13));
  v3 = a1 + 9;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = a1 + 6;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = a1 + 3;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = a1;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v3);
  return a1;
}

void TI::CP::CPEval::create_favonius(TI::CP::CPEval *this@<X0>, TIKeyboardInputManagerConfig *a2@<X1>, uint64_t *a3@<X8>)
{
  TIKeyboardInputManagerConfig *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  KB *v28;
  NSString *v29;
  std::string __p;
  uint64_t v31;
  std::__shared_weak_count *v32;
  unsigned int *v33;
  unsigned int *v34;
  _BYTE v35[32];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = operator new();
  MEMORY[0x2348A88E0]();
  *a3 = v6;
  v7 = (unsigned int *)*((_QWORD *)this + 12);
  v34 = v7;
  if (v7)
  {
    v8 = v7 + 2;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
  }
  (*(void (**)(uint64_t, unsigned int **))(*(_QWORD *)v6 + 176))(v6, &v34);
  if (v34)
  {
    v10 = v34 + 2;
    v11 = atomic_load(v34 + 2);
    if (v11 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)v34 + 40))();
    }
    else
    {
      do
        v12 = __ldaxr(v10);
      while (__stlxr(v12 - 1, v10));
    }
  }
  v13 = *a3;
  v14 = (unsigned int *)*((_QWORD *)this + 13);
  v33 = v14;
  if (v14)
  {
    v15 = v14 + 2;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 + 1, v15));
  }
  (*(void (**)(uint64_t, unsigned int **))(*(_QWORD *)v13 + 192))(v13, &v33);
  if (v33)
  {
    v17 = v33 + 2;
    v18 = atomic_load(v33 + 2);
    if (v18 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)v33 + 8))();
    }
    else
    {
      do
        v19 = __ldaxr(v17);
      while (__stlxr(v19 - 1, v17));
    }
  }
  v20 = *a3;
  v21 = (std::__shared_weak_count *)*((_QWORD *)this + 15);
  v31 = *((_QWORD *)this + 14);
  v32 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v23 = __ldxr(p_shared_owners);
    while (__stxr(v23 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v20 + 208))(v20, &v31);
  v24 = v32;
  if (v32)
  {
    v25 = (unint64_t *)&v32->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = *a3;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)*a3 + 296))(*a3, 1);
  if (*((char *)this + 71) < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)this + 6), *((_QWORD *)this + 7));
  else
    __p = *(std::string *)((_BYTE *)this + 2);
  (*(void (**)(uint64_t, std::string *))(*(_QWORD *)v27 + 448))(v27, &__p);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v27 + 328))(v27, -[TIKeyboardInputManagerConfig usesContinuousPathProgressiveCandidates](v5, "usesContinuousPathProgressiveCandidates"));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v27 + 344))(v27, -[TIKeyboardInputManagerConfig continuousPathDetectPause](v5, "continuousPathDetectPause"));
  -[TIKeyboardInputManagerConfig continuousPathLanguageWeight](v5, "continuousPathLanguageWeight");
  (*(void (**)(uint64_t))(*(_QWORD *)v27 + 360))(v27);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v27 + 376))(v27, 2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v27 + 472))(v27, 4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v27 + 440))(v27, -[TIKeyboardInputManagerConfig usesStemSuffixCorrectionFactor](v5, "usesStemSuffixCorrectionFactor"));
  -[TIKeyboardInputManagerConfig shapeStoreResourceDir](v5, "shapeStoreResourceDir");
  v28 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v28, v29);
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v27 + 464))(v27, v35);
  KB::String::~String((KB::String *)v35);

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v27 + 392))(v27, -[TIKeyboardInputManagerConfig usesContinuousPathRetrocorrection](v5, "usesContinuousPathRetrocorrection"));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v27 + 264))(v27, 1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v27 + 272))(v27, 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

void sub_22FAA2854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  void *v19;
  uint64_t *v20;
  uint64_t v22;

  v22 = *v20;
  *v20 = 0;
  if (v22)
    (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);

  _Unwind_Resume(a1);
}

void TI::CP::CPEval::create_input_manager(TI::CP::CPEval *this@<X0>, TIKeyboardInputManagerConfig *a2@<X1>, uint64_t *a3@<X8>)
{
  TIKeyboardInputManagerConfig *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  KB *v15;
  NSString *v16;
  uint64_t v17;
  int v18;
  void *v19;
  _QWORD *v20;
  unsigned int *v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int *v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unsigned int *v46;
  unsigned int *v47;
  unsigned int *v48;
  _QWORD v49[5];

  v49[4] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = operator new();
  MEMORY[0x2348A85C8]();
  *a3 = v6;
  TI::Favonius::BeamSearchAlgorithm::create((TI::Favonius::BeamSearchAlgorithm *)-[TIKeyboardInputManagerConfig allowsSpaceCorrections](v5, "allowsSpaceCorrections"), 0.01, 0.015);
  v48 = (unsigned int *)v49[0];
  v49[0] = 0;
  TIInputManager::set_search_algorithm();
  if (v48)
  {
    v7 = v48 + 2;
    v8 = atomic_load(v48 + 2);
    if (v8 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)v48 + 16))();
    }
    else
    {
      do
        v9 = __ldaxr(v7);
      while (__stlxr(v9 - 1, v7));
    }
  }
  v10 = *a3;
  -[TIKeyboardInputManagerConfig usesTextChecker](v5, "usesTextChecker");
  TIInputManager::set_uses_text_checker((TIInputManager *)v10);
  *(_BYTE *)(v10 + 688) = 1;
  *(_BYTE *)(v10 + 682) = 1;
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v10 + 184) + 296))(*(_QWORD *)(v10 + 184), 1);
  v11 = *(_QWORD *)(v10 + 184);
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v11 + 392))(v11, 1);
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v10 + 184) + 328))(*(_QWORD *)(v10 + 184), -[TIKeyboardInputManagerConfig usesContinuousPathProgressiveCandidates](v5, "usesContinuousPathProgressiveCandidates"));
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v10 + 184) + 336))(*(_QWORD *)(v10 + 184), -[TIKeyboardInputManagerConfig continuousPathCompletesWords](v5, "continuousPathCompletesWords"));
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v10 + 184) + 344))(*(_QWORD *)(v10 + 184), -[TIKeyboardInputManagerConfig continuousPathDetectPause](v5, "continuousPathDetectPause"));
  -[TIKeyboardInputManagerConfig continuousPathLanguageWeight](v5, "continuousPathLanguageWeight");
  (*(void (**)(_QWORD))(**(_QWORD **)(v10 + 184) + 360))(*(_QWORD *)(v10 + 184));
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v10 + 184) + 376))(*(_QWORD *)(v10 + 184), 2);
  v12 = *(_QWORD *)(v10 + 184);
  if (v12)
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 472))(v12, 4);
  *(_BYTE *)(v10 + 689) = -[TIKeyboardInputManagerConfig completionsShouldSharePrefix](v5, "completionsShouldSharePrefix");
  v13 = -[TIKeyboardInputManagerConfig usesStemSuffixCorrectionFactor](v5, "usesStemSuffixCorrectionFactor");
  v14 = *(_QWORD *)(v10 + 184);
  if (v14)
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v14 + 440))(v14, v13);
  -[TIKeyboardInputManagerConfig shapeStoreResourceDir](v5, "shapeStoreResourceDir");
  v15 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v15, v16);
  v17 = *(_QWORD *)(v10 + 184);
  if (v17)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v17 + 464))(v17, v49);
  KB::String::~String((KB::String *)v49);

  v18 = -[TIKeyboardInputManagerConfig cpConfidenceModelType](v5, "cpConfidenceModelType");
  *(_OWORD *)(v10 + 144) = xmmword_22FAC90D0;
  *(_DWORD *)(v10 + 160) = 1028443341;
  *(_DWORD *)(v10 + 164) = v18;
  *(_DWORD *)(v10 + 168) = 3;
  -[TIKeyboardInputManagerConfig continuousPathParams](v5, "continuousPathParams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, void *))(**(_QWORD **)(v10 + 184) + 400))(*(_QWORD *)(v10 + 184), v19);

  v20 = (_QWORD *)((char *)this + 48);
  if (*((char *)this + 71) < 0)
    v20 = (_QWORD *)*v20;
  MEMORY[0x2348A87B4](v49, v20);
  TIInputManager::set_locale_identifier();
  KB::String::~String((KB::String *)v49);
  v21 = (unsigned int *)*((_QWORD *)this + 12);
  v47 = v21;
  if (v21)
  {
    v22 = v21 + 2;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 + 1, v22));
  }
  TIInputManager::set_typing_model();
  if (v47)
  {
    v24 = v47 + 2;
    v25 = atomic_load(v47 + 2);
    if (v25 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)v47 + 40))();
    }
    else
    {
      do
        v26 = __ldaxr(v24);
      while (__stlxr(v26 - 1, v24));
    }
  }
  v27 = (unsigned int *)*((_QWORD *)this + 13);
  v46 = v27;
  if (v27)
  {
    v28 = v27 + 2;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 + 1, v28));
  }
  TIInputManager::set_candidate_generator();
  if (v46)
  {
    v30 = v46 + 2;
    v31 = atomic_load(v46 + 2);
    if (v31 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)v46 + 8))();
    }
    else
    {
      do
        v32 = __ldaxr(v30);
      while (__stlxr(v32 - 1, v30));
    }
  }
  v33 = (std::__shared_weak_count *)*((_QWORD *)this + 15);
  v45 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldxr(p_shared_owners);
    while (__stxr(v35 + 1, p_shared_owners));
  }
  TIInputManager::set_candidate_refinery();
  if (v45)
  {
    v36 = (unint64_t *)&v45->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  v38 = *a3;
  v39 = *((_QWORD *)this + 10);
  v40 = (std::__shared_weak_count *)*((_QWORD *)this + 11);
  if (v40)
  {
    v41 = (unint64_t *)&v40->__shared_owners_;
    do
      v42 = __ldxr(v41);
    while (__stxr(v42 + 1, v41));
    std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100]((_QWORD *)(v38 + 232), v39, (uint64_t)v40);
    v43 = (unint64_t *)&v40->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  else
  {
    std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100]((_QWORD *)(v38 + 232), v39, 0);
  }
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(*a3 + 184) + 272))(*(_QWORD *)(*a3 + 184), 1);

}

void sub_22FAA2E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  void *v6;
  uint64_t *v7;
  void *v8;
  uint64_t v10;
  va_list va;

  va_start(va, a6);
  KB::String::~String((KB::String *)va);

  v10 = *v7;
  *v7 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);

  _Unwind_Resume(a1);
}

const char *TI::CP::CPEval::recognizer_description(uint64_t a1, unsigned int a2)
{
  if (a2 > 3)
    return "";
  else
    return off_24FD49060[a2];
}

void _TIBeginMockingTrialManager()
{
  void *v0;
  MockTITrialManager *v1;

  v0 = (void *)MEMORY[0x24BEB5448];
  v1 = objc_alloc_init(MockTITrialManager);
  objc_msgSend(v0, "setSharedManager:", v1);

}

uint64_t _TIEndMockingTrialManager()
{
  return objc_msgSend(MEMORY[0x24BEB5448], "setSharedManager:", 0);
}

void sub_22FAAC1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5151(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5152(uint64_t a1)
{

}

uint64_t _isLetterKey(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  if (objc_msgSend(v1, "length")
    && (v2 = objc_msgSend(v1, "_rangeOfLongCharacterAtIndex:", 0), v2 + v3 == objc_msgSend(v1, "length")))
  {
    v4 = objc_msgSend(v1, "_firstLongCharacter");
    objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "longCharacterIsMember:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL _isWordEndingKey(void *a1)
{
  id v1;
  UChar32 v2;
  _BOOL8 v3;

  v1 = a1;
  if (objc_msgSend(v1, "length") == 1)
    v2 = objc_msgSend(v1, "_firstLongCharacter");
  else
    v2 = 0;
  if (u_ispunct(v2))
    v3 = 1;
  else
    v3 = u_isWhitespace(v2) != 0;

  return v3;
}

BOOL _isSpaceKey(void *a1)
{
  id v1;
  UChar32 v2;
  _BOOL8 v3;

  v1 = a1;
  if (objc_msgSend(v1, "length") == 1)
    v2 = objc_msgSend(v1, "_firstLongCharacter");
  else
    v2 = 0;
  v3 = u_isspace(v2) != 0;

  return v3;
}

BOOL _isNumberOrPunctuationKey(void *a1)
{
  id v1;
  UChar32 v2;
  _BOOL8 v3;

  v1 = a1;
  if (objc_msgSend(v1, "length") == 1)
    v2 = objc_msgSend(v1, "_firstLongCharacter");
  else
    v2 = 0;
  if (u_isdigit(v2))
    v3 = 1;
  else
    v3 = u_ispunct(v2) != 0;

  return v3;
}

void _TIBeginMockingSingletons()
{
  _TIBeginMockingSingletonsWithData(0, 0, 0, 0, 1, 0);
}

void _TIBeginMockingSingletonsWithData(void *a1, void *a2, void *a3, void *a4, int a5, char a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  MockTITrialManager *v16;
  id v17;

  v17 = a4;
  v11 = a3;
  v12 = a2;
  v13 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BEB53F0], "disableForTesting:", 1);
  _TIBeginMockingKeyboardActivityController();
  _TIBeginMockingTransientLexiconManagerWithData(v13, v12);

  if (v11)
    v14 = v11;
  else
    v14 = (void *)MEMORY[0x24BDBD1A8];
  _TIBeginMockingUserDictionaryServerWithPairs(v14);

  if (v17)
  {
    _TIBeginMockingLanguageLikelihoodModelWithModel(v17);
    if (!a5)
      goto LABEL_9;
    goto LABEL_8;
  }
  _TIBeginMockingLanguageLikelihoodModel();
  if (a5)
LABEL_8:
    _TIBeginMockingAssetManager();
LABEL_9:
  _TIBeginMockingAggdReporter();
  _TIBeginMockingAnalyticsService();
  _TIBeginMockingCryptographer();
  _TIBeginMockingUserModelDataStore();
  v15 = (void *)MEMORY[0x24BEB5448];
  v16 = objc_alloc_init(MockTITrialManager);
  objc_msgSend(v15, "setSharedManager:", v16);

  if ((a6 & 1) == 0)
  {
    _TIBeginMockingProactiveQuickTypeManager();
    _TIBeginMockingAppAutofillManager();
  }

}

void _TIBeginMockingSingletonsWithResources(void *a1, void *a2, void *a3, int a4, char a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  MockTITrialManager *v13;
  id v14;

  v14 = a3;
  v9 = a2;
  v10 = a1;
  _TIBeginMockingKeyboardActivityController();
  _TIBeginMockingContactManagerWithContactCollection(v10);

  if (v9)
    v11 = v9;
  else
    v11 = (void *)MEMORY[0x24BDBD1A8];
  _TIBeginMockingUserDictionaryServerWithPairs(v11);

  if (v14)
  {
    _TIBeginMockingLanguageLikelihoodModelWithModel(v14);
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  _TIBeginMockingLanguageLikelihoodModel();
  if (a4)
LABEL_6:
    _TIBeginMockingAssetManager();
LABEL_7:
  _TIBeginMockingAggdReporter();
  _TIBeginMockingAnalyticsService();
  _TIBeginMockingCryptographer();
  _TIBeginMockingUserModelDataStore();
  v12 = (void *)MEMORY[0x24BEB5448];
  v13 = objc_alloc_init(MockTITrialManager);
  objc_msgSend(v12, "setSharedManager:", v13);

  _TIBeginMockingAppAutofillManager();
  if ((a5 & 1) == 0)
  {
    _TIBeginMockingProactiveQuickTypeManager();
    _TIBeginMockingAppAutofillManager();
  }

}

void _TIBeginMockingSingletonsWithMockData(void *a1, void *a2, void *a3, void *a4, int a5, char a6)
{
  id v11;
  id v12;
  id v13;
  id v14;

  v11 = a4;
  v12 = a3;
  v13 = a2;
  _TIConvertTIMockContactCollection(a1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  _TIBeginMockingSingletonsWithData(v14, v13, v12, v11, a5, a6);

}

uint64_t _TIEndMockingSingletons()
{
  return _TIEndMockingSingletonsWithData(0);
}

uint64_t _TIEndMockingSingletonsWithData(char a1)
{
  uint64_t result;

  TIDispatchWaitForAllBlocks();
  _TIEndMockingUserModelDataStore();
  _TIEndMockingCryptographer();
  _TIEndMockingAnalyticsService();
  _TIEndMockingAggdReporter();
  _TIEndMockingAssetManager();
  _TIEndMockingLanguageLikelihoodModel();
  _TIEndMockingUserDictionaryServer();
  _TIEndMockingTransientLexiconManager();
  _TIEndMockingKeyboardActivityController();
  objc_msgSend(MEMORY[0x24BEB5448], "setSharedManager:", 0);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    result = objc_msgSend(MEMORY[0x24BEB53F0], "disableForTesting:", 0);
  if ((a1 & 1) == 0)
  {
    _TIEndMockingProactiveQuickTypeManager();
    return _TIEndMockingAppAutofillManager();
  }
  return result;
}

void TI::CP::CPTrainer::train(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD v3[3];
  void **v4;

  memset(v3, 0, sizeof(v3));
  TI::CP::CPTrainer::train_records(a1, a2, (uint64_t)v3, a3);
  v4 = (void **)v3;
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&v4);
}

void sub_22FAADF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&a12);
  _Unwind_Resume(a1);
}

void TI::CP::CPTrainer::evaluate_params(uint64_t a1, int a2, __int128 *a3, uint64_t *a4)
{
  uint64_t v6;
  void **v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *i;
  double v20;
  _DWORD *v21;
  int v22;
  double v23;
  const std::string *v24;
  uint64_t v25;
  char *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  char *v33;
  char *v34;
  int64x2_t v35;
  uint64_t v36;
  TI::CP::TIPathRecognizerInterface *v37;
  void *__p[2];
  uint64_t v39;
  char v40;
  void **v41;
  int64x2_t v42;
  uint64_t v43;
  uint64_t *v44;
  void ***v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50[15];
  void **v51;
  uint64_t v52;
  void *v53[47];

  v53[45] = *(void **)MEMORY[0x24BDAC8D0];
  __p[0] = 0;
  __p[1] = 0;
  v39 = 0;
  if (*(_BYTE *)(a1 + 40))
  {
    TI::CP::CPEval::evaluate_records(*(std::string **)(a1 + 8), a4, a2, (uint64_t)a3, (uint64_t)&v51);
    v7 = v51;
    v6 = v52;
    v8 = 0x34F72C234F72C235 * ((v52 - (uint64_t)v51) >> 3);
    if (0x34F72C234F72C235 * ((int64_t)(v39 - (unint64_t)__p[0]) >> 3) >= v8)
    {
      if (0x34F72C234F72C235 * (((char *)__p[1] - (char *)__p[0]) >> 3) >= v8)
      {
        v11 = (char *)std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *>((uint64_t)v51, v52, (uint64_t)__p[0]);
        v18 = v11;
        for (i = (char *)__p[1]; i != v18; std::__destroy_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,0>((uint64_t)i))
          i -= 232;
        __p[1] = v18;
      }
      else
      {
        v15 = &v51[((char *)__p[1] - (char *)__p[0]) >> 3];
        v11 = (char *)std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *>((uint64_t)v51, (uint64_t)v15, (uint64_t)__p[0]);
        v16 = (char *)__p[1];
        if (v15 != (void **)v6)
        {
          v17 = 0;
          do
          {
            v11 = (char *)TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)((char *)__p[1] + v17 * 8), (const TI::CP::ContinuousPathTestResult *)&v15[v17]);
            v17 += 29;
          }
          while (&v15[v17] != (void **)v6);
          v16 = (char *)__p[1] + v17 * 8;
        }
        __p[1] = v16;
      }
    }
    else
    {
      if (v8 > 0x11A7B9611A7B961)
        goto LABEL_50;
      v9 = 0x69EE58469EE5846ALL * (v39 >> 3);
      if (v9 <= v8)
        v9 = 0x34F72C234F72C235 * ((v52 - (uint64_t)v51) >> 3);
      v10 = (unint64_t)(0x34F72C234F72C235 * (v39 >> 3)) >= 0x8D3DCB08D3DCB0 ? 0x11A7B9611A7B961 : v9;
      if (v10 > 0x11A7B9611A7B961)
LABEL_50:
        abort();
      v11 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v10);
      v12 = v11;
      __p[0] = v11;
      __p[1] = v11;
      v39 = (uint64_t)&v11[232 * v13];
      if (v7 != (void **)v6)
      {
        v14 = 0;
        do
        {
          v11 = (char *)TI::CP::ContinuousPathTestResult::ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)&v12[v14 * 8], (const TI::CP::ContinuousPathTestResult *)&v7[v14]);
          v14 += 29;
        }
        while (&v7[v14] != (void **)v6);
        v12 += v14 * 8;
      }
      __p[1] = v12;
    }
    TI::CP::CPTrainer::dump_match_indices((uint64_t)v11, (uint64_t *)__p);
    v45 = &v51;
    std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100]((void ***)&v45);
    v20 = 0.0;
    if (__p[0] != __p[1])
    {
      v21 = __p[0];
      do
      {
        v22 = v21[36];
        v23 = -4.0;
        if (v22 != -1)
          v23 = (double)v22 / ((double)v22 + 3.0) * -4.0;
        v20 = v20 + v23;
        v21 += 58;
      }
      while (v21 != __p[1]);
    }
    v51 = __p;
    std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&v51);
  }
  else
  {
    v24 = *(const std::string **)(a1 + 8);
    TI::CP::EnsembleConfig::EnsembleConfig((uint64_t)v53, a3);
    TI::CP::CPEval::create_recognizer_for_config(v24, a2, (uint64_t)v53, (uint64_t *)&v37);
    TI::CP::EnsembleConfig::~EnsembleConfig(v53);
    while (1)
    {
      LODWORD(v45) = 0;
      LODWORD(v41) = 0;
      v40 = 0;
      v25 = *(_QWORD *)(a1 + 72);
      if (!v25)
        break;
      (*(void (**)(void ***__return_ptr, uint64_t, void ****, void ***, char *))(*(_QWORD *)v25 + 48))(&v51, v25, &v45, &v41, &v40);
      TI::CP::CPEval::evaluate_test_case(*(TI::CP::CPEval **)(a1 + 8), (const TI::CP::ContinuousPathTestCase *)&v51, v37, 0, (uint64_t)&v45);
      v26 = (char *)__p[1];
      if (__p[1] >= (void *)v39)
      {
        v28 = 0x34F72C234F72C235 * (((char *)__p[1] - (char *)__p[0]) >> 3);
        v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) > 0x11A7B9611A7B961)
          abort();
        if (0x69EE58469EE5846ALL * ((int64_t)(v39 - (unint64_t)__p[0]) >> 3) > v29)
          v29 = 0x69EE58469EE5846ALL * ((int64_t)(v39 - (unint64_t)__p[0]) >> 3);
        if ((unint64_t)(0x34F72C234F72C235 * ((int64_t)(v39 - (unint64_t)__p[0]) >> 3)) >= 0x8D3DCB08D3DCB0)
          v30 = 0x11A7B9611A7B961;
        else
          v30 = v29;
        v44 = &v39;
        if (v30)
          v30 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<TI::CP::ContinuousPathTestResult>>(v30);
        else
          v31 = 0;
        v41 = (void **)v30;
        v42.i64[0] = v30 + 232 * v28;
        v42.i64[1] = v42.i64[0];
        v43 = v30 + 232 * v31;
        std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>(v42.i64[0], (uint64_t)&v45);
        v32 = (void *)v42.i64[0];
        v27 = (void *)(v42.i64[1] + 232);
        v42.i64[1] += 232;
        v34 = (char *)__p[0];
        v33 = (char *)__p[1];
        if (__p[1] == __p[0])
        {
          v35 = vdupq_n_s64((unint64_t)__p[1]);
        }
        else
        {
          do
          {
            v33 -= 232;
            v32 = (void *)std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>((uint64_t)v32 - 232, (uint64_t)v33);
          }
          while (v33 != v34);
          v35 = *(int64x2_t *)__p;
          v27 = (void *)v42.i64[1];
        }
        __p[0] = v32;
        __p[1] = v27;
        v42 = v35;
        v36 = v39;
        v39 = v43;
        v43 = v36;
        v41 = (void **)v35.i64[0];
        std::__split_buffer<TI::CP::ContinuousPathTestResult>::~__split_buffer((uint64_t)&v41);
      }
      else
      {
        std::construct_at[abi:nn180100]<TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult,TI::CP::ContinuousPathTestResult*>((uint64_t)__p[1], (uint64_t)&v45);
        v27 = v26 + 232;
      }
      __p[1] = v27;
      std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v50[9]);
      v41 = (void **)v50;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v41);
      v41 = (void **)&v49;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v41);
      v41 = (void **)&v48;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v41);
      v41 = (void **)&v47;
      std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v41);
      KB::String::~String((KB::String *)&v46);
      TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase((TI::CP::ContinuousPathTestCase *)&v51);
    }
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
  }
}

void sub_22FAAE4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void **a50)
{
  TI::CP::ContinuousPathTestResult::~ContinuousPathTestResult((TI::CP::ContinuousPathTestResult *)&a21);
  TI::CP::ContinuousPathTestCase::~ContinuousPathTestCase((TI::CP::ContinuousPathTestCase *)&a50);
  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  a50 = (void **)&a11;
  std::vector<TI::CP::ContinuousPathTestResult>::__destroy_vector::operator()[abi:nn180100](&a50);
  _Unwind_Resume(a1);
}

uint64_t TI::CP::CPTrainer::dump_match_indices(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
  int v6;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 != v3)
  {
    do
    {
      v4 = *(_DWORD *)(v2 + 144);
      v5 = v4 + 48;
      if (v4 >= 0xA)
        v5 = 62;
      if (v4 == -1)
        v6 = 109;
      else
        v6 = v5;
      putchar(v6);
      v2 += 232;
    }
    while (v2 != v3);
  }
  return putchar(10);
}

uint64_t TI::CP::EnsembleConfig::EnsembleConfig(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v4 = *a2;
  v5 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)a1 = v4;
  v6 = a2[3];
  v7 = a2[4];
  v8 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v7;
  *(_OWORD *)(a1 + 80) = v8;
  *(_OWORD *)(a1 + 48) = v6;
  if (*((char *)a2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 104), *((const std::string::value_type **)a2 + 13), *((_QWORD *)a2 + 14));
  }
  else
  {
    v9 = *(__int128 *)((char *)a2 + 104);
    *(_QWORD *)(a1 + 120) = *((_QWORD *)a2 + 15);
    *(_OWORD *)(a1 + 104) = v9;
  }
  if (*((char *)a2 + 151) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 128), *((const std::string::value_type **)a2 + 16), *((_QWORD *)a2 + 17));
  }
  else
  {
    v10 = a2[8];
    *(_QWORD *)(a1 + 144) = *((_QWORD *)a2 + 18);
    *(_OWORD *)(a1 + 128) = v10;
  }
  v11 = *((_WORD *)a2 + 76);
  *(_BYTE *)(a1 + 154) = *((_BYTE *)a2 + 154);
  *(_WORD *)(a1 + 152) = v11;
  MEMORY[0x2348A87C0](a1 + 160, a2 + 10);
  v12 = a2[12];
  v13 = a2[14];
  *(_OWORD *)(a1 + 208) = a2[13];
  *(_OWORD *)(a1 + 224) = v13;
  *(_OWORD *)(a1 + 192) = v12;
  v14 = a2[15];
  v15 = a2[16];
  v16 = a2[18];
  *(_OWORD *)(a1 + 272) = a2[17];
  *(_OWORD *)(a1 + 288) = v16;
  *(_OWORD *)(a1 + 240) = v14;
  *(_OWORD *)(a1 + 256) = v15;
  v17 = a2[19];
  v18 = a2[20];
  v19 = a2[21];
  *(_QWORD *)(a1 + 352) = *((_QWORD *)a2 + 44);
  *(_OWORD *)(a1 + 320) = v18;
  *(_OWORD *)(a1 + 336) = v19;
  *(_OWORD *)(a1 + 304) = v17;
  return a1;
}

void sub_22FAAE6D0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 127) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

uint64_t std::__throw_bad_function_call[abi:nn180100]()
{
  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  return std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *>();
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *,TI::CP::ContinuousPathTestResult *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  __int128 v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t **leaf_high;
  _QWORD *v14;
  _QWORD *v15;
  BOOL v16;
  __int128 v17;
  uint64_t **v18;
  _QWORD *v19;
  _QWORD *v20;
  __int128 v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      *(_DWORD *)a3 = *(_DWORD *)v5;
      KB::String::operator=();
      if (a3 == v5)
      {
        *(_QWORD *)(a3 + 136) = *(_QWORD *)(v5 + 136);
        v17 = *(_OWORD *)(v5 + 160);
        *(_OWORD *)(a3 + 144) = *(_OWORD *)(v5 + 144);
        *(_OWORD *)(a3 + 160) = v17;
      }
      else
      {
        std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(a3 + 40, *(_QWORD *)(v5 + 40), *(_QWORD *)(v5 + 48), 0x1CAC083126E978D5 * ((uint64_t)(*(_QWORD *)(v5 + 48) - *(_QWORD *)(v5 + 40)) >> 3));
        std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(a3 + 64, *(_QWORD *)(v5 + 64), *(_QWORD *)(v5 + 72), 0x1CAC083126E978D5 * ((uint64_t)(*(_QWORD *)(v5 + 72) - *(_QWORD *)(v5 + 64)) >> 3));
        std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(a3 + 88, *(_QWORD *)(v5 + 88), *(_QWORD *)(v5 + 96), 0x1CAC083126E978D5 * ((uint64_t)(*(_QWORD *)(v5 + 96) - *(_QWORD *)(v5 + 88)) >> 3));
        std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(a3 + 112, *(_QWORD *)(v5 + 112), *(_QWORD *)(v5 + 120), 0x1CAC083126E978D5 * ((uint64_t)(*(_QWORD *)(v5 + 120) - *(_QWORD *)(v5 + 112)) >> 3));
        *(_QWORD *)(a3 + 136) = *(_QWORD *)(v5 + 136);
        v6 = *(_OWORD *)(v5 + 160);
        *(_OWORD *)(a3 + 144) = *(_OWORD *)(v5 + 144);
        *(_OWORD *)(a3 + 160) = v6;
        v7 = *(_QWORD **)(v5 + 176);
        v8 = (_QWORD *)(v5 + 184);
        if (*(_QWORD *)(a3 + 192))
        {
          v9 = *(_QWORD *)(a3 + 184);
          v10 = *(uint64_t **)(a3 + 176);
          *(_QWORD *)(a3 + 176) = a3 + 184;
          *(_QWORD *)(v9 + 16) = 0;
          *(_QWORD *)(a3 + 184) = 0;
          *(_QWORD *)(a3 + 192) = 0;
          if (v10[1])
            v11 = (uint64_t *)v10[1];
          else
            v11 = v10;
          v24 = (uint64_t *)(a3 + 176);
          v25 = v11;
          v26 = v11;
          if (!v11
            || (v25 = std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::__detach_next((uint64_t)v11),
                v7 == v8))
          {
            v15 = v7;
          }
          else
          {
            do
            {
              KB::String::operator=();
              TI::CP::Path::operator=((void **)v11 + 8, (const void **)v7 + 8);
              v12 = v26;
              leaf_high = (uint64_t **)std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_leaf_high(a3 + 176, &v23, (uint64_t)(v26 + 4));
              std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at((uint64_t **)(a3 + 176), v23, leaf_high, v12);
              v26 = v25;
              if (v25)
                v25 = std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::__detach_next((uint64_t)v25);
              v14 = (_QWORD *)v7[1];
              if (v14)
              {
                do
                {
                  v15 = v14;
                  v14 = (_QWORD *)*v14;
                }
                while (v14);
              }
              else
              {
                do
                {
                  v15 = (_QWORD *)v7[2];
                  v16 = *v15 == (_QWORD)v7;
                  v7 = v15;
                }
                while (!v16);
              }
              v11 = v26;
              if (v26)
                v16 = v15 == v8;
              else
                v16 = 1;
              v7 = v15;
            }
            while (!v16);
          }
          std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:nn180100]((uint64_t)&v24);
          v7 = v15;
        }
        if (v7 != v8)
        {
          do
          {
            std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__construct_node<std::pair<KB::String const,TI::CP::Path> const&>((uint64_t)&v24, a3 + 176, (uint64_t)(v7 + 4));
            v18 = (uint64_t **)std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_leaf_high(a3 + 176, &v23, (uint64_t)(v24 + 4));
            std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__insert_node_at((uint64_t **)(a3 + 176), v23, v18, v24);
            v24 = 0;
            std::unique_ptr<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<KB::String,TI::CP::Path>,void *>>>>::reset[abi:nn180100]((uint64_t *)&v24);
            v19 = (_QWORD *)v7[1];
            if (v19)
            {
              do
              {
                v20 = v19;
                v19 = (_QWORD *)*v19;
              }
              while (v19);
            }
            else
            {
              do
              {
                v20 = (_QWORD *)v7[2];
                v16 = *v20 == (_QWORD)v7;
                v7 = v20;
              }
              while (!v16);
            }
            v7 = v20;
          }
          while (v20 != v8);
        }
      }
      v21 = *(_OWORD *)(v5 + 200);
      *(_OWORD *)(a3 + 212) = *(_OWORD *)(v5 + 212);
      *(_OWORD *)(a3 + 200) = v21;
      v5 += 232;
      a3 += 232;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_22FAAE9C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:nn180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
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

_QWORD *std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::__find_leaf_high(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  const char *v6;
  _QWORD *v7;
  const char *v8;
  _QWORD *result;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    if (*(_QWORD *)(a3 + 8))
      v6 = *(const char **)(a3 + 8);
    else
      v6 = (const char *)(a3 + 16);
    do
    {
      while (1)
      {
        v5 = v4;
        v7 = (_QWORD *)v4[5];
        v8 = (const char *)(v7 ? v7 : v5 + 6);
        if ((strcmp(v6, v8) & 0x80000000) == 0)
          break;
        v4 = (_QWORD *)*v5;
        result = v5;
        if (!*v5)
          goto LABEL_14;
      }
      v4 = (_QWORD *)v5[1];
    }
    while (v4);
    result = v5 + 1;
  }
  else
  {
    result = (_QWORD *)(a1 + 8);
  }
LABEL_14:
  *a2 = v5;
  return result;
}

uint64_t std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:nn180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(*(_QWORD **)(a1 + 16));
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
    std::__tree<std::__value_type<KB::String,TI::CP::Path>,std::__map_value_compare<KB::String,std::__value_type<KB::String,TI::CP::Path>,std::less<KB::String>,true>,std::allocator<std::__value_type<KB::String,TI::CP::Path>>>::destroy(v2);
  }
  return a1;
}

KB::Candidate *std::vector<KB::Candidate>::__assign_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  void *v8;
  unint64_t v9;
  unint64_t v10;
  KB::Candidate *v11;
  uint64_t v12;
  uint64_t v13;
  KB::Candidate *result;
  uint64_t v15;

  v8 = *(void **)a1;
  if (0x1CAC083126E978D5 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) < a4)
  {
    std::vector<KB::Candidate>::__vdeallocate((void **)a1);
    if (a4 > 0x4189374BC6A7EFLL)
      abort();
    v9 = 0x395810624DD2F1AALL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3);
    if (v9 <= a4)
      v9 = a4;
    if ((unint64_t)(0x1CAC083126E978D5 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3)) >= 0x20C49BA5E353F7)
      v10 = 0x4189374BC6A7EFLL;
    else
      v10 = v9;
    std::vector<KB::Candidate>::__vallocate[abi:nn180100]((_QWORD *)a1, v10);
    v11 = (KB::Candidate *)a1;
    v12 = a2;
    return std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>(v11, v12, a3);
  }
  if (0x1CAC083126E978D5 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v8) >> 3) < a4)
  {
    v13 = a2 + 8 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v8) >> 3);
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(a2, v13, (uint64_t)v8);
    v11 = (KB::Candidate *)a1;
    v12 = v13;
    return std::vector<KB::Candidate>::__construct_at_end<KB::Candidate*,KB::Candidate*>(v11, v12, a3);
  }
  v15 = std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(a2, a3, (uint64_t)v8);
  for (result = *(KB::Candidate **)(a1 + 8);
        result != (KB::Candidate *)v15;
  *(_QWORD *)(a1 + 8) = v15;
  return result;
}

uint64_t std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  KB::Word *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  KB::Word *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void **v16;
  unint64_t v17;
  void *v18;
  void **v19;
  unint64_t v20;
  KB::Word *v21;
  uint64_t v22;
  const KB::Word *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  uint64_t v32;
  KB::Word *v33;
  const KB::Word *v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  _BYTE *v44;
  _BYTE *v45;
  size_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  _BYTE *v52;
  unint64_t v53;
  _BYTE *v54;
  void *v55;
  __int128 v56;
  std::string *v57;
  __int128 *v58;
  unint64_t v59;
  std::string *v60;
  unint64_t v61;
  unint64_t v62;
  std::string *v63;
  std::string *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  const std::string *v68;
  const void *v69;
  const void *v70;
  const void *v71;
  const void *v72;

  if (a1 != a2)
  {
    v5 = a1;
    while (1)
    {
      if (v5 == a3)
        goto LABEL_46;
      v6 = *(_QWORD *)a3;
      v7 = *(_QWORD *)v5;
      if (*(_QWORD *)a3 > *(_QWORD *)v5)
      {
        v8 = (KB::Word *)(*(_QWORD *)(a3 + 8) + 240 * v7);
        v9 = -240 * v7 + 240 * v6;
        do
        {
          KB::Word::~Word(v8);
          v8 = (KB::Word *)(v10 + 240);
          v9 -= 240;
        }
        while (v9);
        *(_QWORD *)a3 = v7;
        goto LABEL_34;
      }
      v11 = *(_QWORD *)(a3 + 16);
      if (v7 <= v11)
      {
        v7 = *(_QWORD *)a3;
        goto LABEL_34;
      }
      if (v11)
      {
        if (v6)
        {
          v12 = *(KB::Word **)(a3 + 8);
          v13 = 240 * v6;
          do
          {
            KB::Word::~Word(v12);
            v12 = (KB::Word *)(v14 + 240);
            v13 -= 240;
          }
          while (v13);
          *(_QWORD *)a3 = 0;
        }
        v16 = (void **)(a3 + 8);
        v15 = *(void **)(a3 + 8);
        if ((void *)(a3 + 24) != v15)
        {
          *v16 = 0;
          *(_QWORD *)(a3 + 16) = 0;
          free(v15);
          v15 = *v16;
        }
        if (v15)
        {
          v11 = *(_QWORD *)(a3 + 16);
        }
        else
        {
          *(_QWORD *)(a3 + 8) = a3 + 24;
          *(_QWORD *)(a3 + 16) = 3;
          v11 = 3;
        }
      }
      v17 = *(_QWORD *)v5;
      if (v11 < *(_QWORD *)v5)
        break;
LABEL_32:
      if (!*(_QWORD *)(a3 + 8))
        goto LABEL_46;
      v7 = *(_QWORD *)a3;
LABEL_34:
      v24 = *(_QWORD *)(v5 + 8);
      if (v7)
      {
        v25 = v24 + 240 * v7;
        v26 = *(_QWORD *)(a3 + 8) + 200;
        do
        {
          KB::String::operator=();
          KB::ByteString::operator=();
          v27 = *(_DWORD *)(v24 + 56);
          *(_QWORD *)(v26 - 152) = *(_QWORD *)(v24 + 48);
          *(_DWORD *)(v26 - 144) = v27;
          KB::String::operator=();
          v28 = *(_OWORD *)(v24 + 128);
          v29 = *(_OWORD *)(v24 + 144);
          v30 = *(_OWORD *)(v24 + 112);
          *(_OWORD *)(v26 - 104) = *(_OWORD *)(v24 + 96);
          *(_OWORD *)(v26 - 56) = v29;
          *(_OWORD *)(v26 - 72) = v28;
          *(_OWORD *)(v26 - 88) = v30;
          KB::String::operator=();
          *(_BYTE *)(v26 - 8) = *(_BYTE *)(v24 + 192);
          if (v26 - 200 != v24)
          {
            *(_DWORD *)(v26 + 32) = *(_DWORD *)(v24 + 232);
            std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<unsigned long long,void *> *>>((_QWORD *)v26, *(_QWORD **)(v24 + 216));
          }
          v26 += 240;
          v24 += 240;
        }
        while (v24 != v25);
        v24 = *(_QWORD *)(v5 + 8);
        v31 = *(_QWORD *)a3;
      }
      else
      {
        v31 = 0;
      }
      if (v31 != *(_QWORD *)v5)
      {
        v32 = 240 * v31;
        v33 = (KB::Word *)(*(_QWORD *)(a3 + 8) + v32);
        v34 = (const KB::Word *)(v24 + v32);
        v35 = 240 * *(_QWORD *)v5 - v32;
        do
        {
          v33 = (KB::Word *)((char *)KB::Word::Word(v33, v34) + 240);
          v34 = (const KB::Word *)((char *)v34 + 240);
          v35 -= 240;
        }
        while (v35);
        v31 = *(_QWORD *)v5;
      }
      *(_QWORD *)a3 = v31;
LABEL_46:
      *(_DWORD *)(a3 + 744) = *(_DWORD *)(v5 + 744);
      v36 = *(_OWORD *)(v5 + 748);
      *(_OWORD *)(a3 + 760) = *(_OWORD *)(v5 + 760);
      *(_OWORD *)(a3 + 748) = v36;
      *(_QWORD *)(a3 + 776) = *(_QWORD *)(v5 + 776);
      v37 = *(_QWORD *)(v5 + 784);
      v38 = *(_QWORD *)(v5 + 792);
      if (v38)
      {
        v39 = (unint64_t *)(v38 + 8);
        do
          v40 = __ldxr(v39);
        while (__stxr(v40 + 1, v39));
      }
      *(_QWORD *)(a3 + 784) = v37;
      v41 = *(std::__shared_weak_count **)(a3 + 792);
      *(_QWORD *)(a3 + 792) = v38;
      if (v41)
      {
        p_shared_owners = (unint64_t *)&v41->__shared_owners_;
        do
          v43 = __ldaxr(p_shared_owners);
        while (__stlxr(v43 - 1, p_shared_owners));
        if (!v43)
        {
          ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
          std::__shared_weak_count::__release_weak(v41);
        }
      }
      if (v5 == a3)
      {
        language_modeling::v1::LinguisticContext::operator=();
        language_modeling::v1::LinguisticContext::operator=();
        goto LABEL_97;
      }
      v44 = *(_BYTE **)(v5 + 800);
      v45 = *(_BYTE **)(v5 + 808);
      v46 = v45 - v44;
      v47 = (v45 - v44) >> 3;
      v48 = *(_QWORD *)(a3 + 816);
      v49 = *(char **)(a3 + 800);
      if (v47 <= (v48 - (uint64_t)v49) >> 3)
      {
        v52 = *(_BYTE **)(a3 + 808);
        v53 = (v52 - v49) >> 3;
        if (v53 < v47)
        {
          if (v52 != v49)
          {
            memmove(*(void **)(a3 + 800), *(const void **)(v5 + 800), v52 - v49);
            v49 = *(char **)(a3 + 808);
          }
          v54 = &v44[8 * v53];
          v46 = v45 - v54;
          if (v45 == v54)
            goto LABEL_74;
          v55 = v49;
          goto LABEL_73;
        }
      }
      else
      {
        if (v49)
        {
          *(_QWORD *)(a3 + 808) = v49;
          operator delete(v49);
          v48 = 0;
          *(_QWORD *)(a3 + 800) = 0;
          *(_QWORD *)(a3 + 808) = 0;
          *(_QWORD *)(a3 + 816) = 0;
        }
        if ((v46 & 0x8000000000000000) != 0)
LABEL_111:
          abort();
        v50 = v48 >> 2;
        if (v48 >> 2 <= v47)
          v50 = (v45 - v44) >> 3;
        if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8)
          v51 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v51 = v50;
        std::vector<TITokenID>::__vallocate[abi:nn180100]((_QWORD *)(a3 + 800), v51);
        v49 = *(char **)(a3 + 808);
      }
      if (v45 != v44)
      {
        v55 = v49;
        v54 = v44;
LABEL_73:
        memmove(v55, v54, v46);
      }
LABEL_74:
      *(_QWORD *)(a3 + 808) = &v49[v46];
      v56 = *(_OWORD *)(v5 + 824);
      *(_QWORD *)(a3 + 840) = *(_QWORD *)(v5 + 840);
      *(_OWORD *)(a3 + 824) = v56;
      language_modeling::v1::LinguisticContext::operator=();
      language_modeling::v1::LinguisticContext::operator=();
      v57 = *(std::string **)(v5 + 864);
      v58 = *(__int128 **)(v5 + 872);
      v59 = 0xAAAAAAAAAAAAAAABLL * (((char *)v58 - (char *)v57) >> 3);
      v60 = *(std::string **)(a3 + 864);
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a3 + 880) - (_QWORD)v60) >> 3) >= v59)
      {
        v64 = *(std::string **)(a3 + 872);
        v65 = ((char *)v64 - (char *)v60) >> 3;
        v66 = 0xAAAAAAAAAAAAAAABLL * v65;
        if (0xAAAAAAAAAAAAAAABLL * v65 >= v59)
        {
          if (v57 != (std::string *)v58)
          {
            do
              std::string::operator=(v60++, v57++);
            while (v57 != (std::string *)v58);
            v64 = *(std::string **)(a3 + 872);
          }
          while (v64 != v60)
          {
            if (SHIBYTE(v64[-1].__r_.__value_.__r.__words[2]) < 0)
              operator delete(v64[-1].__r_.__value_.__l.__data_);
            --v64;
          }
          *(_QWORD *)(a3 + 872) = v60;
          goto LABEL_97;
        }
        if (v64 != v60)
        {
          v67 = 8 * v65;
          v68 = *(const std::string **)(v5 + 864);
          do
          {
            std::string::operator=(v60++, v68++);
            v67 -= 24;
          }
          while (v67);
          v60 = *(std::string **)(a3 + 872);
        }
        v63 = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((__int128 *)(&v57->__r_.__value_.__l + v66), v58, v60);
      }
      else
      {
        std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(a3 + 864));
        if (v59 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_111;
        v61 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(a3 + 880) - *(_QWORD *)(a3 + 864)) >> 3);
        if (v61 <= v59)
          v61 = 0xAAAAAAAAAAAAAAABLL * (((char *)v58 - (char *)v57) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a3 + 880) - *(_QWORD *)(a3 + 864)) >> 3) >= 0x555555555555555)
          v62 = 0xAAAAAAAAAAAAAAALL;
        else
          v62 = v61;
        std::vector<std::string>::__vallocate[abi:nn180100]((_QWORD *)(a3 + 864), v62);
        v63 = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((__int128 *)v57, v58, *(std::string **)(a3 + 872));
      }
      *(_QWORD *)(a3 + 872) = v63;
LABEL_97:
      KB::String::operator=();
      std::string::operator=((std::string *)(a3 + 920), (const std::string *)(v5 + 920));
      KB::ByteString::operator=();
      *(_OWORD *)(a3 + 960) = *(_OWORD *)(v5 + 960);
      v69 = *(const void **)(v5 + 976);
      v70 = *(const void **)(a3 + 976);
      if (v70 != v69)
      {
        if (v69)
        {
          CFRetain(*(CFTypeRef *)(v5 + 976));
          v70 = *(const void **)(a3 + 976);
        }
        if (v70)
          CFRelease(v70);
        *(_QWORD *)(a3 + 976) = v69;
      }
      v71 = *(const void **)(v5 + 984);
      v72 = *(const void **)(a3 + 984);
      if (v72 != v71)
      {
        if (v71)
        {
          CFRetain(*(CFTypeRef *)(v5 + 984));
          v72 = *(const void **)(a3 + 984);
        }
        if (v72)
          CFRelease(v72);
        *(_QWORD *)(a3 + 984) = v71;
      }
      *(_DWORD *)(a3 + 992) = *(_DWORD *)(v5 + 992);
      v5 += 1000;
      a3 += 1000;
      if (v5 == a2)
        return a3;
    }
    v19 = (void **)(a3 + 8);
    v18 = *(void **)(a3 + 8);
    v20 = *(_QWORD *)a3;
    if (v17 <= 3)
    {
      v21 = (KB::Word *)(a3 + 24);
      *(_QWORD *)(a3 + 8) = a3 + 24;
      *(_QWORD *)(a3 + 16) = 3;
      if (!v20)
        goto LABEL_28;
    }
    else
    {
      *(_QWORD *)(a3 + 16) = v17;
      v21 = (KB::Word *)malloc_type_malloc(240 * v17, 0x10B2040DF775671uLL);
      *(_QWORD *)(a3 + 8) = v21;
      if (!v21 || !v20)
      {
LABEL_28:
        if ((void *)(a3 + 24) != v18)
        {
          if (*v19 == v18)
          {
            *v19 = 0;
            *(_QWORD *)(a3 + 16) = 0;
          }
          free(v18);
        }
        goto LABEL_32;
      }
    }
    v22 = 240 * v20;
    v23 = (const KB::Word *)v18;
    do
    {
      KB::Word::Word(v21, v23);
      KB::Word::~Word(v23);
      v21 = (KB::Word *)((char *)v21 + 240);
      v23 = (const KB::Word *)((char *)v23 + 240);
      v22 -= 240;
    }
    while (v22);
    goto LABEL_28;
  }
  return a3;
}

void sub_22FAAF2D8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 872) = v2;
  _Unwind_Resume(a1);
}

void TI::CP::CPTrainer::train_records(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  TI::CP::CPTrainer *v6;
  double v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  unsigned int v32;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  std::string v42;
  std::string v43;
  __int16 v44;
  char v45;
  _BYTE v46[32];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  _BYTE v58[32];
  __int128 v59;
  _BYTE v60[32];
  __int128 v61;
  uint64_t v62;
  _BYTE __p[51];
  _BYTE v64[32];
  _BYTE v65[80];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v58 = 4;
  *(_OWORD *)&v58[8] = xmmword_22FAC87F0;
  *(_QWORD *)&v58[24] = 0;
  *(_QWORD *)v60 = 0x3FF0000000000000;
  v59 = xmmword_22FAC8808;
  *(_QWORD *)&v60[24] = 0;
  *(_OWORD *)&v60[8] = xmmword_22FAC8820;
  LODWORD(v61) = 1056964608;
  *((_QWORD *)&v61 + 1) = 0x200000001;
  LOBYTE(v62) = 1;
  HIDWORD(v62) = 3;
  memset(__p, 0, sizeof(__p));
  v6 = (TI::CP::CPTrainer *)KB::String::String((KB::String *)v64);
  *(_DWORD *)v65 = 1050253722;
  LOBYTE(v70) = 1;
  *(_OWORD *)&v65[8] = xmmword_22FAC9110;
  *(_OWORD *)&v65[24] = xmmword_22FAC9120;
  *(_OWORD *)&v65[40] = xmmword_22FAC9130;
  *(_OWORD *)&v65[56] = xmmword_22FAC9140;
  *(_QWORD *)&v65[72] = 0x4010000000000000;
  v66 = xmmword_22FAC9150;
  v67 = xmmword_22FAC9160;
  v68 = xmmword_22FAC9100;
  v69 = xmmword_22FAC9170;
  *((_QWORD *)&v70 + 1) = 0x404B30CB295E9E1BLL;
  v71 = 0x4019D81D7DBF4880;
  TI::CP::CPTrainer::initial_parameters_for_training(v6, (uint64_t)&v35);
  *(_OWORD *)&v60[16] = v39;
  v61 = v40;
  v62 = v41;
  *(_OWORD *)v58 = v35;
  *(_OWORD *)&v58[16] = v36;
  v59 = v37;
  *(_OWORD *)v60 = v38;
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  *(std::string *)__p = v42;
  *((_BYTE *)&v42.__r_.__value_.__s + 23) = 0;
  v42.__r_.__value_.__s.__data_[0] = 0;
  if ((__p[47] & 0x80000000) != 0)
    operator delete(*(void **)&__p[24]);
  *(std::string *)&__p[24] = v43;
  *((_BYTE *)&v43.__r_.__value_.__s + 23) = 0;
  v43.__r_.__value_.__s.__data_[0] = 0;
  *(_WORD *)&__p[48] = v44;
  __p[50] = v45;
  KB::String::operator=();
  v69 = v55;
  v70 = v56;
  v71 = v57;
  *(_OWORD *)&v65[64] = v51;
  v66 = v52;
  v67 = v53;
  v68 = v54;
  *(_OWORD *)v65 = v47;
  *(_OWORD *)&v65[16] = v48;
  *(_OWORD *)&v65[32] = v49;
  *(_OWORD *)&v65[48] = v50;
  KB::String::~String((KB::String *)v46);
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v43.__r_.__value_.__l.__data_);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);
  LOBYTE(v62) = 0;
  v7 = (*(double (**)(uint64_t, uint64_t, _BYTE *, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, v58, a3);
  v8 = v61;
  *(_OWORD *)(a4 + 64) = *(_OWORD *)&v60[16];
  *(_OWORD *)(a4 + 80) = v8;
  *(_QWORD *)(a4 + 96) = v62;
  v9 = *(_OWORD *)&v58[16];
  *(_OWORD *)a4 = *(_OWORD *)v58;
  *(_OWORD *)(a4 + 16) = v9;
  v10 = *(_OWORD *)v60;
  *(_OWORD *)(a4 + 32) = v59;
  *(_OWORD *)(a4 + 48) = v10;
  if ((__p[23] & 0x80000000) != 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a4 + 104), *(const std::string::value_type **)__p, *(std::string::size_type *)&__p[8]);
  }
  else
  {
    *(_OWORD *)(a4 + 104) = *(_OWORD *)__p;
    *(_QWORD *)(a4 + 120) = *(_QWORD *)&__p[16];
  }
  if ((__p[47] & 0x80000000) != 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a4 + 128), *(const std::string::value_type **)&__p[24], *(std::string::size_type *)&__p[32]);
  }
  else
  {
    *(_OWORD *)(a4 + 128) = *(_OWORD *)&__p[24];
    *(_QWORD *)(a4 + 144) = *(_QWORD *)&__p[40];
  }
  v32 = a2;
  *(_WORD *)(a4 + 152) = *(_WORD *)&__p[48];
  *(_BYTE *)(a4 + 154) = __p[50];
  MEMORY[0x2348A87C0]();
  v11 = v70;
  *(_OWORD *)(a4 + 320) = v69;
  *(_OWORD *)(a4 + 336) = v11;
  *(_QWORD *)(a4 + 352) = v71;
  v12 = v66;
  *(_OWORD *)(a4 + 256) = *(_OWORD *)&v65[64];
  *(_OWORD *)(a4 + 272) = v12;
  v13 = v68;
  *(_OWORD *)(a4 + 288) = v67;
  *(_OWORD *)(a4 + 304) = v13;
  v14 = *(_OWORD *)&v65[16];
  *(_OWORD *)(a4 + 192) = *(_OWORD *)v65;
  *(_OWORD *)(a4 + 208) = v14;
  v15 = *(_OWORD *)&v65[48];
  *(_OWORD *)(a4 + 224) = *(_OWORD *)&v65[32];
  *(_OWORD *)(a4 + 240) = v15;
  printf("initial score: %g\n", v7);
  v16 = 0;
  v17 = 0;
  v18 = 1;
  v19 = 0.01;
  v20 = v7;
  do
  {
    TI::CP::CPTrainer::perturb(v32, (uint64_t)v58, 0, (uint64_t)&v35);
    v21 = (*(double (**)(uint64_t, _QWORD, __int128 *, uint64_t))(*(_QWORD *)a1 + 24))(a1, v32, &v35, a3);
    v22 = v21;
    v23 = 1.0;
    if (v21 <= v20)
      v23 = exp(-(v20 - v21) / v19);
    if (uniform_random(0.0, 1.0) >= v23)
    {
      printf("rejected: %g [p=%.3g f=%.3g n=%u t=%.3g s=%u]\n", v22, v23, (float)((float)v16 / (float)v18), v18, v19, v17++);
    }
    else
    {
      *(_OWORD *)&v60[16] = v39;
      v61 = v40;
      v62 = v41;
      *(_OWORD *)v58 = v35;
      *(_OWORD *)&v58[16] = v36;
      v59 = v37;
      *(_OWORD *)v60 = v38;
      std::string::operator=((std::string *)__p, &v42);
      std::string::operator=((std::string *)&__p[24], &v43);
      *(_WORD *)&__p[48] = v44;
      __p[50] = v45;
      KB::String::operator=();
      ++v16;
      v69 = v55;
      v70 = v56;
      v71 = v57;
      *(_OWORD *)&v65[64] = v51;
      v66 = v52;
      v67 = v53;
      v68 = v54;
      *(_OWORD *)v65 = v47;
      *(_OWORD *)&v65[16] = v48;
      *(_OWORD *)&v65[32] = v49;
      *(_OWORD *)&v65[48] = v50;
      if (v22 <= v7)
      {
        printf("accepted: %g [p=%.3g, f=%.3g n=%u t=%.3g s=%u]\n", v22, v23, (float)((float)v16 / (float)v18), v18, v19, v17);
        v17 = 0;
        v20 = v22;
      }
      else
      {
        v24 = v40;
        *(_OWORD *)(a4 + 64) = v39;
        *(_OWORD *)(a4 + 80) = v24;
        *(_QWORD *)(a4 + 96) = v41;
        v25 = v36;
        *(_OWORD *)a4 = v35;
        *(_OWORD *)(a4 + 16) = v25;
        v26 = v38;
        *(_OWORD *)(a4 + 32) = v37;
        *(_OWORD *)(a4 + 48) = v26;
        std::string::operator=((std::string *)(a4 + 104), &v42);
        std::string::operator=((std::string *)(a4 + 128), &v43);
        *(_WORD *)(a4 + 152) = v44;
        *(_BYTE *)(a4 + 154) = v45;
        KB::String::operator=();
        v27 = v56;
        *(_OWORD *)(a4 + 320) = v55;
        *(_OWORD *)(a4 + 336) = v27;
        *(_QWORD *)(a4 + 352) = v57;
        v28 = v52;
        *(_OWORD *)(a4 + 256) = v51;
        *(_OWORD *)(a4 + 272) = v28;
        v29 = v54;
        *(_OWORD *)(a4 + 288) = v53;
        *(_OWORD *)(a4 + 304) = v29;
        v30 = v48;
        *(_OWORD *)(a4 + 192) = v47;
        *(_OWORD *)(a4 + 208) = v30;
        v31 = v50;
        *(_OWORD *)(a4 + 224) = v49;
        *(_OWORD *)(a4 + 240) = v31;
        printf("accepted: %g [p=%.3g f=%.3g n=%u t=%.3g s=%u] (new hi score)\n", v22, v23, (float)((float)v16 / (float)v18), v18, v19, v17);
        v17 = 0;
        v20 = v22;
        v7 = v22;
      }
    }
    print_parameters((double *)v58);
    puts("======");
    KB::String::~String((KB::String *)v46);
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v43.__r_.__value_.__l.__data_);
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v42.__r_.__value_.__l.__data_);
    v19 = v19 * 0.95;
    ++v18;
  }
  while (v17 < 0xC8);
  printf("final score: %g\n", v7);
  puts("final params:");
  print_parameters((double *)a4);
  KB::String::~String((KB::String *)v64);
  if ((__p[47] & 0x80000000) != 0)
    operator delete(*(void **)&__p[24]);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
}

void sub_22FAAFA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18)
{
  uint64_t v18;

  if (*(char *)(v18 + 127) < 0)
    operator delete(*a18);
  TI::CP::EnsembleConfig::~EnsembleConfig((void **)&STACK[0x200]);
  _Unwind_Resume(a1);
}

double TI::CP::CPTrainer::initial_parameters_for_training@<D0>(TI::CP::CPTrainer *this@<X0>, uint64_t a2@<X8>)
{
  double result;

  *(_DWORD *)a2 = 4;
  *(_QWORD *)(a2 + 24) = 0;
  *(_OWORD *)(a2 + 8) = xmmword_22FAC87F0;
  *(_QWORD *)(a2 + 48) = 0x3FF0000000000000;
  *(_OWORD *)(a2 + 32) = xmmword_22FAC8808;
  *(_QWORD *)(a2 + 72) = 0;
  *(_OWORD *)(a2 + 56) = xmmword_22FAC8820;
  *(_DWORD *)(a2 + 80) = 1056964608;
  *(_QWORD *)(a2 + 88) = 0x200000001;
  *(_BYTE *)(a2 + 96) = 1;
  *(_DWORD *)(a2 + 100) = 3;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_OWORD *)(a2 + 120) = 0u;
  *(_OWORD *)(a2 + 136) = 0u;
  *(_DWORD *)(a2 + 151) = 0;
  KB::String::String((KB::String *)(a2 + 160));
  *(_DWORD *)(a2 + 192) = 1050253722;
  *(_BYTE *)(a2 + 336) = 1;
  *(_QWORD *)(a2 + 344) = 0x404B30CB295E9E1BLL;
  *(_QWORD *)(a2 + 352) = 0x4019D81D7DBF4880;
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)(a2 + 200) = _Q0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a2 + 216) = _Q0;
  *(_OWORD *)(a2 + 232) = xmmword_22FAC9180;
  *(_OWORD *)(a2 + 248) = xmmword_22FAC9190;
  *(_QWORD *)(a2 + 264) = 0x4010000000000000;
  *(_OWORD *)(a2 + 272) = xmmword_22FAC91A0;
  *(_OWORD *)(a2 + 288) = xmmword_22FAC91B0;
  *(_OWORD *)(a2 + 304) = xmmword_22FAC9100;
  *(_OWORD *)(a2 + 320) = xmmword_22FAC91C0;
  *(_DWORD *)(a2 + 100) = 3;
  result = 0.6;
  *(_OWORD *)(a2 + 8) = xmmword_22FAC91D0;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

void sub_22FAAFC38(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 151) < 0)
    operator delete(*(void **)(v1 + 128));
  if (*(char *)(v1 + 127) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void TI::CP::CPTrainer::perturb(int a1@<W1>, uint64_t a2@<X2>, int a3@<W3>, uint64_t a4@<X8>)
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  uint64_t v18;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v19;
  double v20;
  double v21;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v22;
  double v23;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v24;
  double v25;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v26;
  double v27;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v28;
  double v29;
  double v30;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v31;
  double v32;
  double v33;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v34;
  double v35;
  double v36;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v37;
  double v38;
  double v39;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v40;
  double v41;
  double v42;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v43;
  double v44;
  double v45;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v46;
  double v47;
  double v48;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v49;
  double v50;
  double v51;
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
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  __int128 v74;
  char v75;

  v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a4 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a4 + 80) = v8;
  *(_QWORD *)(a4 + 96) = *(_QWORD *)(a2 + 96);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a2;
  *(_OWORD *)(a4 + 16) = v9;
  v10 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a4 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a4 + 48) = v10;
  v11 = (std::string *)(a4 + 104);
  if (*(char *)(a2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)(a2 + 104), *(_QWORD *)(a2 + 112));
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 104);
    *(_QWORD *)(a4 + 120) = *(_QWORD *)(a2 + 120);
  }
  if (*(char *)(a2 + 151) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a4 + 128), *(const std::string::value_type **)(a2 + 128), *(_QWORD *)(a2 + 136));
  }
  else
  {
    *(_OWORD *)(a4 + 128) = *(_OWORD *)(a2 + 128);
    *(_QWORD *)(a4 + 144) = *(_QWORD *)(a2 + 144);
  }
  *(_WORD *)(a4 + 152) = *(_WORD *)(a2 + 152);
  *(_BYTE *)(a4 + 154) = *(_BYTE *)(a2 + 154);
  MEMORY[0x2348A87C0](a4 + 160, a2 + 160);
  v12 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a4 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a4 + 336) = v12;
  *(_QWORD *)(a4 + 352) = *(_QWORD *)(a2 + 352);
  v13 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a4 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a4 + 272) = v13;
  v14 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a4 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a4 + 304) = v14;
  v15 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a4 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a4 + 208) = v15;
  v16 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a4 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a4 + 240) = v16;
  v17 = *(double *)(a4 + 200);
  v67 = *(_QWORD *)(a4 + 232);
  v68 = *(_QWORD *)(a4 + 216);
  v58 = *(double *)(a4 + 240);
  v59 = *(double *)(a4 + 224);
  v65 = *(double *)(a4 + 256);
  v66 = *(double *)(a4 + 248);
  v69 = *(double *)(a4 + 272);
  v70 = *(_QWORD *)(a4 + 280);
  v71 = *(_QWORD *)(a4 + 264);
  v63 = *(double *)(a4 + 296);
  v64 = *(double *)(a4 + 288);
  v73 = *(_QWORD *)(a4 + 320);
  v18 = *(_QWORD *)(a4 + 336);
  v60 = *(double *)(a4 + 344);
  v61 = *(double *)(a4 + 328);
  v62 = *(double *)(a4 + 352);
  v72 = *(_OWORD *)(a4 + 304);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v19 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v20 = log(1.0 / v17 + -1.0);
  v21 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v19, (double *)&v74);
  v57 = exp(-(v21 - v20));
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v22 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v23 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v22, (double *)&v74);
  v56 = exp(v23);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v24 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v25 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v24, (double *)&v74);
  v55 = exp(v25);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v26 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v27 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v26, (double *)&v74);
  v54 = exp(v27);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v28 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v29 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v28, (double *)&v74);
  v30 = exp(v29);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v31 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v32 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v31, (double *)&v74);
  v33 = exp(v32);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v34 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v35 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v34, (double *)&v74);
  v36 = exp(v35);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v37 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v38 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v37, (double *)&v74);
  v39 = exp(v38);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v40 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v41 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v40, (double *)&v74);
  v42 = exp(v41);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v43 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v44 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v43, (double *)&v74);
  v45 = exp(v44);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v46 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v47 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v46, (double *)&v74);
  v48 = exp(v47);
  v74 = xmmword_22FAC91E0;
  v75 = 0;
  v49 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v50 = std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v74, v49, (double *)&v74);
  v51 = exp(v50);
  v52 = *(_DWORD *)(a4 + 100);
  if ((v52 & 1) != 0)
  {
    uniform_random(-0.05, 0.05);
    v52 = *(_DWORD *)(a4 + 100);
  }
  if ((v52 & 2) != 0)
  {
    uniform_random(-0.05, 0.05);
    v52 = *(_DWORD *)(a4 + 100);
  }
  if ((v52 & 4) != 0)
    uniform_random(-0.05, 0.05);
  if (!a1 || a3)
  {
    v53 = 1.0 / (v57 + 1.0);
    *(double *)(a4 + 200) = v53;
    *(double *)(a4 + 208) = 1.0 - v53;
    *(_QWORD *)(a4 + 216) = v68;
    *(double *)(a4 + 224) = v59 * v30;
    *(_QWORD *)(a4 + 232) = v67;
    *(double *)(a4 + 240) = v58 * v56;
    *(double *)(a4 + 248) = v66 * v54;
    *(double *)(a4 + 256) = v65 * v55 * v36;
    *(_QWORD *)(a4 + 264) = v71;
    *(double *)(a4 + 272) = v69 * v42;
    *(_QWORD *)(a4 + 280) = v70;
    *(double *)(a4 + 288) = v64 * v33;
    *(double *)(a4 + 296) = v63 * v39;
    *(_OWORD *)(a4 + 304) = v72;
    *(_QWORD *)(a4 + 320) = v73;
    *(double *)(a4 + 328) = v61 * v45;
    *(_QWORD *)(a4 + 336) = v18;
    *(double *)(a4 + 344) = v60 * v48;
    *(double *)(a4 + 352) = v62 * v51;
  }
  if (a1 == 3 || a3)
  {
    *(int64x2_t *)(a4 + 8) = vdupq_n_s64(0x7FF8000000000000uLL);
    *(_QWORD *)(a4 + 24) = 0x7FF8000000000000;
  }
}

void sub_22FAB0138(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 127) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

double uniform_random(double a1, double a2)
{
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v4;
  double v5;

  v4 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)random_number_generator();
  v5 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(v4);
  return a1
       + (a2 - a1)
       * ((v5
         + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(v4)
         * 4294967300.0)
        * 5.42101086e-20);
}

uint64_t print_parameters(double *a1)
{
  printf("  geometry_weight = %g\n", a1[25]);
  printf("  language_weight = %g\n", a1[26]);
  printf("  path_deviation_power = %g\n", a1[27]);
  printf("  path_deviation_weight = %g\n", a1[28]);
  printf("  key_deviation_power = %g\n", a1[29]);
  printf("  key_deviation_weight = %g\n", a1[30]);
  printf("  first_key_deviation_weight = %g\n", a1[31]);
  printf("  inflection_point_key_deviation_weight = %g\n", a1[32]);
  printf("  far_key_distance = %g\n", a1[33]);
  printf("  skipped_key_cost = %g\n", a1[34]);
  printf("  skipped_inflection_point_cost = %g\n", a1[37]);
  printf("  overshoot_power = %g\n", a1[35]);
  printf("  overshoot_weight = %g\n", a1[36]);
  printf("  transposition_cost = %g\n", a1[41]);
  printf("  first_key_prediction_cost = %g\n", a1[43]);
  printf("  non_first_key_prediction_cost = %g\n", a1[44]);
  printf("  ensemble favonius (cp_search) coefficient = %f\n", a1[1]);
  printf("  ensemble ml coefficient = %f\n", a1[2]);
  return printf("  ensemble shape recognizer coefficient = %f\n", a1[3]);
}

uint64_t random_number_generator(void)
{
  unsigned __int8 v0;

  {
    __cxa_atexit((void (*)(void *))std::unique_ptr<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::~unique_ptr[abi:nn180100], &random_number_generator(void)::generator, &dword_22FA56000);
  }
  if (random_number_generator(void)::once_token != -1)
    dispatch_once(&random_number_generator(void)::once_token, &__block_literal_global_5430);
  return random_number_generator(void)::generator;
}

uint64_t *std::unique_ptr<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>::~unique_ptr[abi:nn180100](uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
    MEMORY[0x2348A8A24](v2, 0x1000C407BAC9B3ELL);
  return a1;
}

uint64_t ___ZL23random_number_generatorv_block_invoke()
{
  uint64_t result;
  unsigned int v1;
  uint64_t i;
  uint64_t v3;

  result = operator new();
  v1 = 5489;
  *(_DWORD *)result = 5489;
  for (i = 1; i != 624; ++i)
  {
    v1 = i + 1812433253 * (v1 ^ (v1 >> 30));
    *(_DWORD *)(result + 4 * i) = v1;
  }
  *(_QWORD *)(result + 2496) = 0;
  v3 = random_number_generator(void)::generator;
  random_number_generator(void)::generator = result;
  if (v3)
    JUMPOUT(0x2348A8A24);
  return result;
}

TI::CP::CPTrainer *TI::CP::CPTrainer::CPTrainer(TI::CP::CPTrainer *this)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &off_24FD49160;
  *(_OWORD *)((char *)this + 8) = 0u;
  v2 = (uint64_t *)((char *)this + 8);
  *((_QWORD *)this + 9) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_BYTE *)this + 40) = 0;
  v3 = operator new();
  *(_OWORD *)v3 = 0u;
  *(_QWORD *)(v3 + 176) = 0;
  *(_OWORD *)(v3 + 144) = 0u;
  *(_OWORD *)(v3 + 160) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 128) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_QWORD *)v3 = &off_24FD49190;
  TI::CP::ShapeStoreConfiguration::default_config((TI::CP::ShapeStoreConfiguration *)(v3 + 16));
  *(_DWORD *)(v3 + 40) = 0;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 128) = xmmword_22FAC90D0;
  *(_DWORD *)(v3 + 144) = 1028443341;
  *(_QWORD *)(v3 + 148) = 0x300000000;
  *(_BYTE *)(v3 + 160) = 1;
  *(_QWORD *)(v3 + 168) = 0;
  *(_QWORD *)(v3 + 176) = 0xF00000002;
  v4 = *v2;
  *v2 = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return this;
}

void sub_22FAB05E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v13 = v11;
  MEMORY[0x2348A8A24](v13, 0x10F3C40AA89C550);
  v15 = *(_QWORD **)(v10 + 72);
  if (v15 == (_QWORD *)(v10 + 48))
  {
    v16 = 4;
    v15 = (_QWORD *)(v10 + 48);
  }
  else
  {
    if (!v15)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_6:
  a10 = (void **)(v10 + 16);
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&a10);
  v17 = *v12;
  *v12 = 0;
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  _Unwind_Resume(a1);
}

TI::CP::CPTrainer *TI::CP::CPTrainer::CPTrainer(TI::CP::CPTrainer *this, NSString *a2)
{
  NSString *v3;
  TI::CP::CPEval *v4;
  uint64_t v5;

  v3 = a2;
  *(_QWORD *)this = &off_24FD49160;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((_QWORD *)this + 9) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_BYTE *)this + 40) = 0;
  v4 = (TI::CP::CPEval *)operator new();
  TI::CP::CPEval::CPEval(v4, v3);
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);

  return this;
}

void sub_22FAB0714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v14 = v12;
  MEMORY[0x2348A8A24](v14, 0x10F3C40AA89C550);
  v16 = *(_QWORD **)(v11 + 72);
  if (v16 == (_QWORD *)(v11 + 48))
  {
    v17 = 4;
    v16 = (_QWORD *)(v11 + 48);
  }
  else
  {
    if (!v16)
      goto LABEL_6;
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_6:
  a10 = (void **)(v11 + 16);
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&a10);
  v18 = *v13;
  *v13 = 0;
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);

  _Unwind_Resume(a1);
}

uint64_t TI::CP::CPTrainer::CPTrainer(uint64_t a1, void *a2, _QWORD *a3)
{
  NSString *v5;
  _QWORD *v6;
  TI::CP::CPEval *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v15[3];
  _QWORD *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  *(_QWORD *)a1 = &off_24FD49160;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)(a1 + 72) = 0;
  v6 = (_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_BYTE *)(a1 + 40) = 0;
  v7 = (TI::CP::CPEval *)operator new();
  TI::CP::CPEval::CPEval(v7, v5);
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v9 = a3[3];
  if (!v9)
    goto LABEL_6;
  if ((_QWORD *)v9 != a3)
  {
    v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9);
LABEL_6:
    v16 = (_QWORD *)v9;
    goto LABEL_8;
  }
  v16 = v15;
  (*(void (**)(_QWORD *, _QWORD *))(*a3 + 24))(a3, v15);
LABEL_8:
  if (v6 != v15)
  {
    v10 = v16;
    v11 = *(_QWORD **)(a1 + 72);
    if (v16 == v15)
    {
      if (v11 == v6)
      {
        (*(void (**)(_QWORD *, _QWORD *))(v15[0] + 24))(v15, v17);
        (*(void (**)(_QWORD *))(*v16 + 32))(v16);
        v16 = 0;
        (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)(a1 + 72) + 24))(*(_QWORD *)(a1 + 72), v15);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 72) + 32))(*(_QWORD *)(a1 + 72));
        *(_QWORD *)(a1 + 72) = 0;
        v16 = v15;
        (*(void (**)(_QWORD *, uint64_t))(v17[0] + 24))(v17, a1 + 48);
        (*(void (**)(_QWORD *))(v17[0] + 32))(v17);
      }
      else
      {
        (*(void (**)(_QWORD *, uint64_t))(v15[0] + 24))(v15, a1 + 48);
        (*(void (**)(_QWORD *))(*v16 + 32))(v16);
        v16 = *(_QWORD **)(a1 + 72);
      }
      *(_QWORD *)(a1 + 72) = v6;
    }
    else if (v11 == v6)
    {
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)(a1 + 48) + 24))(a1 + 48, v15);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 72) + 32))(*(_QWORD *)(a1 + 72));
      *(_QWORD *)(a1 + 72) = v16;
      v16 = v15;
    }
    else
    {
      v16 = *(_QWORD **)(a1 + 72);
      *(_QWORD *)(a1 + 72) = v10;
    }
  }
  v12 = v16;
  if (v16 == v15)
  {
    v13 = 4;
    v12 = v15;
    goto LABEL_21;
  }
  if (v16)
  {
    v13 = 5;
LABEL_21:
    (*(void (**)(void))(*v12 + 8 * v13))();
  }
  *(_BYTE *)(a1 + 40) = 1;

  return a1;
}

void sub_22FAB0A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13)
{
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v18 = *(_QWORD **)(v14 + 72);
  if (v18 == v15)
  {
    v19 = 4;
  }
  else
  {
    if (!v18)
      goto LABEL_6;
    v19 = 5;
    v15 = *(_QWORD **)(v14 + 72);
  }
  (*(void (**)(_QWORD *))(*v15 + 8 * v19))(v15);
LABEL_6:
  a13 = (void **)(v14 + 16);
  std::vector<TI::CP::ContinuousPathTestCase>::__destroy_vector::operator()[abi:nn180100](&a13);
  v20 = *v16;
  *v16 = 0;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);

  _Unwind_Resume(a1);
}

double TI::CP::CPTrainer::calculate_score(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  int v5;
  double v6;

  v2 = a2[1];
  v3 = 0.0;
  if (*a2 != v2)
  {
    v4 = *a2;
    do
    {
      v5 = *(_DWORD *)(v4 + 144);
      v6 = -4.0;
      if (v5 != -1)
        v6 = (double)v5 / ((double)v5 + 3.0) * -4.0;
      v3 = v3 + v6;
      v4 += 232;
    }
    while (v4 != v2);
  }
  return v3 / (double)(unint64_t)(0x34F72C234F72C235 * ((v2 - *a2) >> 3));
}

void sub_22FAB131C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_22FAB1578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22FAB34F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FAB3E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FAB426C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FAB53F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FAB6B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FAB76E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22FAB7810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5727(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5728(uint64_t a1)
{

}

uint64_t actDsllex(void *a1)
{
  uint32_t *p_cb;
  uint32_t *v2;
  uint32_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t buffer;
  uint32_t *v7;
  char *v8;
  uint32_t *v9;
  uint32_t *v10;
  uint32_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint32_t v21;
  unsigned __int8 *v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  int v32;
  uint32_t *v33;
  int v34;
  char v35;
  unint64_t v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  uint32_t *v41;
  void *v42;
  int v43;
  void *v44;
  size_t v45;
  int v46;
  size_t v48;
  int v49;
  int v50;
  FILE *v51;
  uint32_t *v52;
  unint64_t v53;
  size_t v54;
  uint32_t *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint32_t *v60;
  uint32_t *v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  uint32_t *v66;
  int v67;
  uint32_t *v68;
  int v69;
  unsigned int v70;
  uint32_t *v71;
  uint32_t *v72;
  uint32_t *v73;
  uint64_t v74;
  const char *v75;
  int v76;
  uint64_t v77;
  size_t v78;
  const void *v79;
  uint32_t *v80;
  uint32_t *v81;
  int v82;
  size_t v83;
  const void *v84;
  uint64_t v85;
  uint32_t *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  int v92;
  int v94;
  uint64_t v95;
  uint64_t v96;

  p_cb = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
  v2 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
  v3 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
  if ((yy_init & 1) == 0)
  {
    yy_init = 1;
    if (!yy_start)
      yy_start = 1;
    if (!actDslin)
      actDslin = *MEMORY[0x24BDAC8E0];
    if (!actDslout)
      actDslout = *MEMORY[0x24BDAC8E8];
    v4 = yy_buffer_stack;
    if (yy_buffer_stack
      && (v5 = yy_buffer_stack_top, (buffer = *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top)) != 0))
    {
      v7 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
    }
    else
    {
      actDslensure_buffer_stack();
      v7 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
      buffer = actDsl_create_buffer((FILE *)actDslin, 0x4000);
      v3 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
      v4 = yy_buffer_stack;
      v5 = yy_buffer_stack_top;
      *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = buffer;
    }
    yy_n_chars = *(_QWORD *)(buffer + 32);
    v8 = *(char **)(buffer + 16);
    yy_c_buf_p = (uint64_t)v8;
    actDsltext = (uint64_t)v8;
    *((_QWORD *)v7 + 234) = **(_QWORD **)(v4 + 8 * v5);
    yy_hold_char = *v8;
  }
  v9 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
  v10 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
  v11 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
LABEL_14:
  v12 = yy_c_buf_p;
  *(_BYTE *)yy_c_buf_p = *((_BYTE *)p_cb + 1824);
  LODWORD(v13) = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) + yy_start;
  v14 = v12;
  while (1)
  {
    do
    {
LABEL_15:
      v15 = yy_ec[*(unsigned __int8 *)v12];
      if (yy_accept[(int)v13])
      {
        v10[457] = v13;
        *((_QWORD *)v9 + 229) = v12;
      }
      v16 = (int)v13;
      v17 = yy_base[(int)v13] + v15;
      if ((_DWORD)v13 != (__int16)yy_chk[v17])
      {
        do
        {
          v16 = yy_def[v16];
          if (v16 >= 82)
            v15 = *((unsigned __int8 *)&yy_meta + v15);
          v17 = yy_base[v16] + v15;
        }
        while (yy_chk[v17] != (unsigned __int16)v16);
      }
      v13 = yy_nxt[v17];
      ++v12;
    }
    while (yy_base[v13] != 139);
    while (2)
    {
      v18 = (unsigned __int16)yy_accept[(int)v13];
      if (!yy_accept[(int)v13])
      {
        v12 = *((_QWORD *)v9 + 229);
        v18 = (unsigned __int16)yy_accept[v10[457]];
      }
      v19 = (__int16)v18;
      actDsltext = v14;
      actDslleng = v12 - v14;
      *((_BYTE *)p_cb + 1824) = *(_BYTE *)v12;
      *(_BYTE *)v12 = 0;
      yy_c_buf_p = v12;
      if (v18 != 29 && ((0x1EFEFF9DuLL >> v18) & 1) == 0)
      {
        v20 = actDslleng;
        if (actDslleng)
        {
          v21 = v11[388];
          v22 = (unsigned __int8 *)actDsltext;
          do
          {
            v23 = *v22++;
            if (v23 == 10)
              v11[388] = ++v21;
            --v20;
          }
          while (v20);
        }
      }
LABEL_31:
      switch(v19)
      {
        case 0:
          *(_BYTE *)v12 = *((_BYTE *)p_cb + 1824);
          v12 = *((_QWORD *)v9 + 229);
          LODWORD(v13) = v10[457];
          continue;
        case 1:
        case 7:
        case 20:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          goto LABEL_14;
        case 2:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          yy_push_state(1);
          return 262;
        case 3:
          v87 = v2;
          v88 = (const char *)actDsltext;
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v87 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          if (!strcasecmp(v88, "set"))
            return 263;
          if (!strcasecmp(v88, "yes"))
            return 260;
          if (!strcasecmp(v88, "no"))
            return 261;
          v89 = v88;
LABEL_180:
          actDsllval = (uint64_t)strdup(v89);
          return 272;
        case 4:
          v90 = (const char *)actDsltext;
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          LODWORD(actDsllval) = atoi(v90);
          return 266;
        case 5:
        case 6:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          yy_pop_state();
          return 264;
        case 8:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          v67 = 4;
          goto LABEL_135;
        case 9:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          yy_pop_state();
          actDsllval = (uint64_t)strndup(stringBuf, stringLen);
          stringLen = 0;
          return 269;
        case 10:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          v67 = 3;
          goto LABEL_135;
        case 11:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          yy_pop_state();
          actDsllval = (uint64_t)strndup(stringBuf, stringLen);
          stringLen = 0;
          return 270;
        case 12:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          v67 = 5;
          goto LABEL_135;
        case 13:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          yy_pop_state();
          actDsllval = (uint64_t)strndup(stringBuf, stringLen);
          stringLen = 0;
          return 271;
        case 14:
        case 15:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          yy_pop_state();
          actDsllval = (uint64_t)strndup(stringBuf, stringLen);
          stringLen = 0;
          return 268;
        case 16:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          v68 = v3;
          v69 = yy_start;
          if (yy_start >= 1)
            v69 = yy_start - 1;
          v70 = (v69 >> 1) - 2;
          if (v70 <= 5)
            handleErrorWithLineNumber(a1, (uint64_t)off_24FD494B8[v70], (actDsllineno - 1));
          yy_pop_state();
          stringLen = 0;
          goto LABEL_136;
        case 17:
          v71 = p_cb;
          v72 = v2;
          v73 = v3;
          v74 = actDslleng;
          v75 = (const char *)actDsltext;
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v72 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          if (!strcmp(v75, "\\n"))
          {
            v85 = stringLen++;
            stringBuf[v85] = 10;
          }
          else
          {
            v76 = strcmp(v75, "\\t");
            v77 = stringLen;
            if (v76)
            {
              memcpy(&stringBuf[stringLen], v75 + 1, v74 - 1);
              stringLen = v74 + v77 - 1;
            }
            else
            {
              ++stringLen;
              stringBuf[v77] = 9;
            }
          }
          v3 = v73;
          v2 = v72;
          p_cb = v71;
          goto LABEL_143;
        case 18:
          v78 = actDslleng;
          v79 = (const void *)actDsltext;
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          v80 = v2;
          v81 = v3;
          v82 = stringLen;
          memcpy(&stringBuf[stringLen], v79, v78);
          stringLen = v82 + v78;
          v3 = v81;
          v2 = v80;
          goto LABEL_143;
        case 19:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          yy_push_state(2);
          return 258;
        case 21:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          return 265;
        case 22:
          v89 = (const char *)actDsltext;
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          goto LABEL_180;
        case 23:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          yy_pop_state();
          return 259;
        case 24:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          return 264;
        case 25:
          v91 = (const char *)actDsltext;
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          actDsllval = (uint64_t)strdup(v91);
          return 267;
        case 26:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          v67 = 7;
          goto LABEL_135;
        case 27:
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          v67 = 6;
LABEL_135:
          v68 = v3;
          yy_push_state(v67);
          goto LABEL_136;
        case 28:
          v83 = actDslleng;
          v84 = (const void *)actDsltext;
          if (actDslleng)
            *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 48) = *(unsigned __int8 *)(actDslleng + actDsltext - 1) == 10;
          v68 = v3;
          fwrite(v84, v83, 1uLL, (FILE *)actDslout);
LABEL_136:
          v3 = v68;
LABEL_143:
          v9 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
          v10 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
          v11 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
          goto LABEL_14;
        case 29:
          v24 = actDsltext;
          *(_BYTE *)v12 = *((_BYTE *)p_cb + 1824);
          v25 = *((_QWORD *)v2 + 225);
          v26 = *((_QWORD *)v3 + 226);
          v27 = *(_QWORD *)(v25 + 8 * v26);
          if (*(_DWORD *)(v27 + 64))
          {
            v28 = yy_n_chars;
          }
          else
          {
            v28 = *(_QWORD *)(v27 + 32);
            yy_n_chars = v28;
            *(_QWORD *)v27 = actDslin;
            v27 = *(_QWORD *)(v25 + 8 * v26);
            *(_DWORD *)(v27 + 64) = 1;
          }
          LODWORD(v29) = yy_c_buf_p;
          v30 = *(_BYTE **)(v27 + 8);
          if (yy_c_buf_p <= (unint64_t)&v30[v28])
          {
            v61 = v3;
            v12 = actDsltext + ~v24 + (int)v12;
            yy_c_buf_p = v12;
            LODWORD(v13) = yy_get_previous_state();
            if (yy_accept[(int)v13])
            {
              yy_last_accepting_state = v13;
              yy_last_accepting_cpos = v12;
            }
            v62 = (int)v13;
            v63 = yy_base[(int)v13] + 1;
            p_cb = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            v3 = v61;
            v9 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            v10 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            v11 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            if ((_DWORD)v13 != (__int16)yy_chk[v63])
            {
              do
              {
                v64 = (unsigned __int16)yy_def[v62];
                v62 = (__int16)v64;
                v63 = yy_base[(__int16)v64] + 1;
              }
              while (v64 != yy_chk[v63]);
            }
            v14 = actDsltext;
            if (v63)
            {
              v65 = (unsigned __int16)yy_nxt[v63];
              if (v65 != 81)
              {
                LODWORD(v13) = (__int16)v65;
                yy_c_buf_p = ++v12;
                goto LABEL_15;
              }
            }
            continue;
          }
          v94 = v24;
          v95 = v14;
          if (yy_c_buf_p > (unint64_t)&v30[v28 + 1])
            yy_fatal_error("fatal flex scanner internal error--end of buffer missed");
          v31 = (char *)actDsltext;
          if (!*(_DWORD *)(v27 + 60))
          {
            p_cb = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            if (yy_c_buf_p - actDsltext != 1)
              goto LABEL_93;
            goto LABEL_87;
          }
          v32 = ~(_DWORD)actDsltext + yy_c_buf_p;
          v33 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
          if (v32 >= 1)
          {
            v34 = ~(_DWORD)actDsltext + yy_c_buf_p;
            do
            {
              v35 = *v31++;
              *v30++ = v35;
              --v34;
            }
            while (v34);
            v27 = *(_QWORD *)(v25 + 8 * v26);
          }
          v96 = v32;
          if (*(_DWORD *)(v27 + 64) == 2)
          {
            yy_n_chars = 0;
            goto LABEL_44;
          }
          v38 = ~v32;
          v39 = *(_DWORD *)(v27 + 24);
          v40 = v39 + ~v32;
          v92 = v32;
          if (!v40)
          {
            v41 = v3;
            do
            {
              if (!*(_DWORD *)(v27 + 40))
              {
                *(_QWORD *)(v27 + 8) = 0;
LABEL_195:
                yy_fatal_error("fatal error - scanner input buffer overflow");
              }
              v42 = *(void **)(v27 + 8);
              v43 = 2 * v39;
              *(_DWORD *)(v27 + 24) = v43;
              v44 = malloc_type_realloc(v42, v43 + 2, 0xDB05E8D7uLL);
              *(_QWORD *)(v27 + 8) = v44;
              if (!v44)
                goto LABEL_195;
              v29 = (uint64_t)v44 + (int)v29 - (int)v42;
              yy_c_buf_p = v29;
              v27 = *(_QWORD *)(yy_buffer_stack + 8 * *((_QWORD *)v41 + 226));
              v39 = *(_DWORD *)(v27 + 24);
              v40 = v39 + v38;
            }
            while (!(v39 + v38));
            v33 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
          }
          if (v40 >= 0x2000)
            v45 = 0x2000;
          else
            v45 = v40;
          if (!*(_DWORD *)(v27 + 44))
          {
            *__error() = 0;
            v2 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
            while (1)
            {
              v48 = fread((void *)(*(_QWORD *)(*(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v96), 1uLL, v45, *((FILE **)v33 + 234));
              v36 = (int)v48;
              yy_n_chars = (int)v48;
              if (v48 << 32)
              {
                v3 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
                goto LABEL_78;
              }
              if (!ferror(*((FILE **)v33 + 234)))
                break;
              if (*__error() != 4)
                goto LABEL_196;
              *__error() = 0;
              clearerr(*((FILE **)v33 + 234));
            }
            v25 = yy_buffer_stack;
            v3 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
            v26 = yy_buffer_stack_top;
            v27 = *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
            v32 = v92;
LABEL_44:
            *(_QWORD *)(v27 + 32) = 0;
            if (!v32)
              goto LABEL_81;
LABEL_45:
            v36 = 0;
            v37 = 2;
            *(_DWORD *)(v27 + 64) = 2;
            goto LABEL_82;
          }
          v36 = 0;
          v2 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
          while (1)
          {
            v46 = getc((FILE *)actDslin);
            if (v46 == -1 || v46 == 10)
              break;
            v3 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v96 + v36++) = v46;
            if (v45 == v36)
            {
              v36 = v45;
              goto LABEL_66;
            }
          }
          v3 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
LABEL_66:
          if (v46 == -1)
          {
            v49 = ferror((FILE *)actDslin);
            v3 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            if (v49)
LABEL_196:
              yy_fatal_error("input in flex scanner failed");
          }
          else if (v46 == 10)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8) + v96 + v36++) = 10;
          }
          yy_n_chars = v36;
LABEL_78:
          v25 = yy_buffer_stack;
          v26 = *((_QWORD *)v3 + 226);
          v27 = *(_QWORD *)(yy_buffer_stack + 8 * v26);
          *(_QWORD *)(v27 + 32) = v36;
          v32 = v92;
          if (v36)
          {
            v37 = 0;
            goto LABEL_82;
          }
          v33 = &OBJC_PROTOCOL___TIAnalyticsServiceProvider.cb;
          if (v92)
            goto LABEL_45;
LABEL_81:
          v50 = v32;
          v51 = (FILE *)*((_QWORD *)v33 + 234);
          v52 = v3;
          actDslrestart(v51);
          v32 = v50;
          v3 = v52;
          v36 = yy_n_chars;
          v25 = *((_QWORD *)v2 + 225);
          v26 = *((_QWORD *)v52 + 226);
          v27 = *(_QWORD *)(v25 + 8 * v26);
          v37 = 1;
LABEL_82:
          v53 = v36 + v32;
          if (v53 <= *(int *)(v27 + 24))
          {
            v58 = *(_QWORD *)(v27 + 8);
            p_cb = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
          }
          else
          {
            v54 = v53 + (v36 >> 1);
            v55 = v3;
            v56 = malloc_type_realloc(*(void **)(v27 + 8), v54, 0xDB05E8D7uLL);
            v25 = *((_QWORD *)v2 + 225);
            v26 = *((_QWORD *)v55 + 226);
            *(_QWORD *)(*(_QWORD *)(v25 + 8 * v26) + 8) = v56;
            v57 = *(_QWORD *)(v25 + 8 * v26);
            v58 = *(_QWORD *)(v57 + 8);
            if (!v58)
              yy_fatal_error("out of dynamic memory in yy_get_next_buffer()");
            v3 = v55;
            *(_DWORD *)(v57 + 24) = v54 - 2;
            v53 = yy_n_chars + v96;
            p_cb = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
          }
          yy_n_chars = v53;
          *(_BYTE *)(v58 + v53) = 0;
          *(_BYTE *)(v53 + *(_QWORD *)(*(_QWORD *)(v25 + 8 * v26) + 8) + 1) = 0;
          v31 = *(char **)(*(_QWORD *)(v25 + 8 * v26) + 8);
          actDsltext = (uint64_t)v31;
          if (v37 == 1)
          {
LABEL_87:
            yy_c_buf_p = (uint64_t)v31;
            v59 = yy_start;
            if (yy_start >= 1)
              v59 = yy_start - 1;
            v19 = (v59 >> 1) + 30;
            v9 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            v10 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            v11 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            v14 = v95;
            goto LABEL_31;
          }
          if (v37)
          {
            v30 = *(_BYTE **)(*(_QWORD *)(*((_QWORD *)v2 + 225) + 8 * *((_QWORD *)v3 + 226)) + 8);
            v28 = yy_n_chars;
LABEL_93:
            v12 = (uint64_t)&v30[v28];
            yy_c_buf_p = (uint64_t)&v30[v28];
            v60 = v3;
            LODWORD(v13) = yy_get_previous_state();
            v3 = v60;
            v14 = actDsltext;
            v9 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            v10 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            v11 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
            continue;
          }
          v12 = (uint64_t)&v31[~v94 + (int)v12];
          yy_c_buf_p = v12;
          v66 = v3;
          LODWORD(v13) = yy_get_previous_state();
          v3 = v66;
          v14 = actDsltext;
          v9 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
          v10 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
          v11 = (_DWORD *)(&OBJC_PROTOCOL___TIAnalyticsServiceProvider + 64);
          break;
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
          return 0;
        default:
          yy_fatal_error("fatal flex scanner internal error--no action found");
      }
      break;
    }
  }
}

_QWORD *actDslensure_buffer_stack()
{
  _QWORD *result;
  uint64_t v1;
  _OWORD *v2;

  result = (_QWORD *)yy_buffer_stack;
  if (yy_buffer_stack)
  {
    if (yy_buffer_stack_top >= (unint64_t)(yy_buffer_stack_max - 1))
    {
      v1 = yy_buffer_stack_max + 8;
      result = malloc_type_realloc((void *)yy_buffer_stack, 8 * (yy_buffer_stack_max + 8), 0xDB05E8D7uLL);
      yy_buffer_stack = (uint64_t)result;
      if (result)
      {
        v2 = &result[yy_buffer_stack_max];
        *v2 = 0u;
        v2[1] = 0u;
        v2[2] = 0u;
        v2[3] = 0u;
        yy_buffer_stack_max = v1;
        return result;
      }
LABEL_8:
      yy_fatal_error("out of dynamic memory in yyensure_buffer_stack()");
    }
  }
  else
  {
    result = malloc_type_malloc(8uLL, 0xBF065FE1uLL);
    yy_buffer_stack = (uint64_t)result;
    if (!result)
      goto LABEL_8;
    *result = 0;
    yy_buffer_stack_max = 1;
    yy_buffer_stack_top = 0;
  }
  return result;
}

uint64_t actDsl_create_buffer(FILE *a1, int a2)
{
  _DWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = malloc_type_malloc(0x48uLL, 0xBF065FE1uLL);
  if (!v4
    || (v5 = (uint64_t)v4, v4[6] = a2, v6 = malloc_type_malloc(a2 + 2, 0xBF065FE1uLL), (*(_QWORD *)(v5 + 8) = v6) == 0))
  {
    yy_fatal_error("out of dynamic memory in yy_create_buffer()");
  }
  *(_DWORD *)(v5 + 40) = 1;
  actDsl_init_buffer(v5, a1);
  return v5;
}

_DWORD *yy_push_state(int a1)
{
  int v2;
  int v3;
  _DWORD *result;
  int v5;
  int v6;

  v2 = yy_start_stack_ptr;
  v3 = yy_start_stack_depth;
  result = (_DWORD *)yy_start_stack;
  if (yy_start_stack_ptr >= yy_start_stack_depth)
  {
    v5 = yy_start_stack_depth + 25;
    yy_start_stack_depth += 25;
    if (yy_start_stack)
      result = malloc_type_realloc((void *)yy_start_stack, 4 * (v3 + 25), 0xDB05E8D7uLL);
    else
      result = malloc_type_malloc(4 * v5, 0xBF065FE1uLL);
    yy_start_stack = (uint64_t)result;
    if (!result)
      yy_fatal_error("out of memory expanding start-condition stack");
    v2 = yy_start_stack_ptr;
  }
  v6 = yy_start;
  if (yy_start >= 1)
    v6 = yy_start - 1;
  yy_start_stack_ptr = v2 + 1;
  result[v2] = v6 >> 1;
  yy_start = (2 * a1) | 1;
  return result;
}

void yy_pop_state()
{
  int v0;
  unsigned int v1;

  v0 = yy_start_stack_ptr;
  v1 = --yy_start_stack_ptr;
  if (v0 <= 0)
    yy_fatal_error("start-condition stack underflow");
  yy_start = (2 * *(_DWORD *)(yy_start_stack + 4 * v1)) | 1;
}

uint64_t yy_get_previous_state()
{
  uint64_t result;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  result = (*(_DWORD *)(*(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 48) + yy_start);
  v1 = (_BYTE *)actDsltext;
  if (actDsltext < (unint64_t)yy_c_buf_p)
  {
    do
    {
      if (*v1)
        v2 = yy_ec[*v1];
      else
        v2 = 1u;
      if (yy_accept[(int)result])
      {
        yy_last_accepting_state = result;
        yy_last_accepting_cpos = (uint64_t)v1;
      }
      v3 = (int)result;
      v4 = yy_base[(int)result] + v2;
      if ((_DWORD)result != (__int16)yy_chk[v4])
      {
        do
        {
          v3 = yy_def[v3];
          if (v3 >= 82)
            v2 = *((unsigned __int8 *)&yy_meta + v2);
          v4 = yy_base[v3] + v2;
        }
        while (yy_chk[v4] != (unsigned __int16)v3);
      }
      result = yy_nxt[v4];
      ++v1;
    }
    while (v1 != (_BYTE *)yy_c_buf_p);
  }
  return result;
}

void yy_fatal_error(const char *a1)
{
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", a1);
  exit(2);
}

int *actDslrestart(FILE *a1)
{
  uint64_t buffer;
  int *result;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (!yy_buffer_stack || (buffer = *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top)) == 0)
  {
    actDslensure_buffer_stack();
    buffer = actDsl_create_buffer((FILE *)actDslin, 0x4000);
    *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = buffer;
  }
  result = actDsl_init_buffer(buffer, a1);
  v4 = *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  v5 = *(_QWORD *)(v4 + 32);
  yy_c_buf_p = *(_QWORD *)(v4 + 16);
  actDsltext = yy_c_buf_p;
  v6 = *(uint64_t **)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  yy_n_chars = v5;
  actDslin = *v6;
  yy_hold_char = *(_BYTE *)yy_c_buf_p;
  return result;
}

int *actDsl_init_buffer(uint64_t a1, FILE *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  _BOOL4 v7;
  int *result;

  v4 = *__error();
  actDsl_flush_buffer(a1);
  *(_QWORD *)a1 = a2;
  *(_DWORD *)(a1 + 60) = 1;
  v5 = yy_buffer_stack;
  if (yy_buffer_stack)
    v5 = *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  if (v5 != a1)
    *(_QWORD *)(a1 + 52) = 1;
  if (a2)
  {
    v6 = fileno(a2);
    v7 = isatty(v6) > 0;
  }
  else
  {
    v7 = 0;
  }
  *(_DWORD *)(a1 + 44) = v7;
  result = __error();
  *result = v4;
  return result;
}

uint64_t actDsl_flush_buffer(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    *(_QWORD *)(result + 32) = 0;
    **(_BYTE **)(result + 8) = 0;
    *(_BYTE *)(*(_QWORD *)(result + 8) + 1) = 0;
    *(_QWORD *)(result + 16) = *(_QWORD *)(result + 8);
    *(_DWORD *)(result + 48) = 1;
    *(_DWORD *)(result + 64) = 0;
    if (yy_buffer_stack)
      v1 = *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    else
      v1 = 0;
    if (v1 == result)
    {
      v2 = *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
      yy_n_chars = *(_QWORD *)(v2 + 32);
      yy_c_buf_p = *(_QWORD *)(v2 + 16);
      actDsltext = yy_c_buf_p;
      actDslin = **(_QWORD **)(yy_buffer_stack + 8 * yy_buffer_stack_top);
      yy_hold_char = *(_BYTE *)yy_c_buf_p;
    }
  }
  return result;
}

uint64_t actDslwrap()
{
  return 1;
}

_QWORD *actDsl_switch_to_buffer(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = actDslensure_buffer_stack();
  v3 = yy_buffer_stack;
  if (yy_buffer_stack)
  {
    v4 = yy_buffer_stack_top;
    v5 = *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v5 == a1)
      return result;
    if (v5)
    {
      v6 = yy_c_buf_p;
      *(_BYTE *)yy_c_buf_p = yy_hold_char;
      *(_QWORD *)(*(_QWORD *)(v3 + 8 * v4) + 16) = v6;
      *(_QWORD *)(*(_QWORD *)(v3 + 8 * v4) + 32) = yy_n_chars;
    }
  }
  else
  {
    if (!a1)
      return result;
    v4 = yy_buffer_stack_top;
  }
  *(_QWORD *)(v3 + 8 * v4) = a1;
  yy_n_chars = *(_QWORD *)(a1 + 32);
  yy_c_buf_p = *(_QWORD *)(a1 + 16);
  actDsltext = yy_c_buf_p;
  actDslin = **(_QWORD **)(v3 + 8 * v4);
  yy_hold_char = *(_BYTE *)yy_c_buf_p;
  return result;
}

void *actDslalloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xBF065FE1uLL);
}

void actDsl_delete_buffer(void **a1)
{
  void **v2;

  if (a1)
  {
    if (yy_buffer_stack)
      v2 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    else
      v2 = 0;
    if (v2 == a1)
      *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0;
    if (*((_DWORD *)a1 + 10))
      free(a1[1]);
    free(a1);
  }
}

_QWORD *actDslpush_buffer_state(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (result)
  {
    v1 = result;
    result = actDslensure_buffer_stack();
    v2 = yy_buffer_stack;
    v3 = yy_buffer_stack_top;
    if (yy_buffer_stack)
    {
      if (*(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top))
      {
        v4 = yy_c_buf_p;
        *(_BYTE *)yy_c_buf_p = yy_hold_char;
        *(_QWORD *)(*(_QWORD *)(v2 + 8 * v3) + 16) = v4;
        *(_QWORD *)(*(_QWORD *)(v2 + 8 * v3++) + 32) = yy_n_chars;
        yy_buffer_stack_top = v3;
      }
    }
    *(_QWORD *)(v2 + 8 * v3) = v1;
    v5 = v1[4];
    yy_c_buf_p = v1[2];
    actDsltext = yy_c_buf_p;
    v6 = *(uint64_t **)(v2 + 8 * v3);
    yy_n_chars = v5;
    actDslin = *v6;
    yy_hold_char = *(_BYTE *)yy_c_buf_p;
  }
  return result;
}

void actDslpop_buffer_state()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (yy_buffer_stack)
  {
    v0 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v0)
    {
      actDsl_delete_buffer(v0);
      v1 = yy_buffer_stack;
      v2 = yy_buffer_stack_top;
      *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0;
      if (v2)
      {
        v3 = v2 - 1;
        yy_buffer_stack_top = v3;
        v4 = *(_QWORD *)(v1 + 8 * v3);
        if (v4)
        {
          yy_n_chars = *(_QWORD *)(v4 + 32);
          yy_c_buf_p = *(_QWORD *)(v4 + 16);
          actDsltext = yy_c_buf_p;
          actDslin = **(_QWORD **)(v1 + 8 * v3);
          yy_hold_char = *(_BYTE *)yy_c_buf_p;
        }
      }
    }
  }
}

char *actDsl_scan_buffer(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  char *v4;
  char *v6;

  v2 = a2 - 2;
  if (a2 < 2 || *(_BYTE *)(a1 + v2) || *(_BYTE *)(a2 + a1 - 1))
    return 0;
  v6 = (char *)malloc_type_malloc(0x48uLL, 0xBF065FE1uLL);
  if (!v6)
    yy_fatal_error("out of dynamic memory in yy_scan_buffer()");
  v4 = v6;
  *((_DWORD *)v6 + 6) = v2;
  *((_QWORD *)v6 + 1) = a1;
  *((_QWORD *)v6 + 2) = a1;
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 4) = (int)v2;
  *((_QWORD *)v6 + 5) = 0;
  *((_DWORD *)v6 + 12) = 1;
  *(_QWORD *)(v6 + 60) = 0;
  actDsl_switch_to_buffer((uint64_t)v6);
  return v4;
}

char *actDsl_scan_string(char *a1)
{
  uint64_t v2;

  v2 = (int)strlen(a1);
  return actDsl_scan_bytes(a1, v2);
}

char *actDsl_scan_bytes(char *a1, uint64_t a2)
{
  unint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  char v8;
  char *result;

  v4 = a2 + 2;
  v5 = malloc_type_malloc(a2 + 2, 0xBF065FE1uLL);
  if (!v5)
    yy_fatal_error("out of dynamic memory in yy_scan_bytes()");
  if (a2)
  {
    v6 = v5;
    v7 = a2;
    do
    {
      v8 = *a1++;
      *v6++ = v8;
      --v7;
    }
    while (v7);
  }
  *(_WORD *)&v5[a2] = 0;
  result = actDsl_scan_buffer((uint64_t)v5, v4);
  if (!result)
    yy_fatal_error("bad buffer in yy_scan_bytes()");
  *((_DWORD *)result + 10) = 1;
  return result;
}

uint64_t actDslget_lineno()
{
  return actDsllineno;
}

uint64_t actDslget_in()
{
  return actDslin;
}

uint64_t actDslget_out()
{
  return actDslout;
}

uint64_t actDslget_leng()
{
  return actDslleng;
}

uint64_t actDslget_text()
{
  return actDsltext;
}

uint64_t actDslset_lineno(uint64_t result)
{
  actDsllineno = result;
  return result;
}

uint64_t actDslset_in(uint64_t result)
{
  actDslin = result;
  return result;
}

uint64_t actDslset_out(uint64_t result)
{
  actDslout = result;
  return result;
}

uint64_t actDslget_debug()
{
  return actDsl_flex_debug;
}

uint64_t actDslset_debug(uint64_t result)
{
  actDsl_flex_debug = result;
  return result;
}

uint64_t actDsllex_destroy()
{
  _QWORD *i;

  for (i = (_QWORD *)yy_buffer_stack; yy_buffer_stack; i = (_QWORD *)yy_buffer_stack)
  {
    if (!i[yy_buffer_stack_top])
      break;
    actDsl_delete_buffer((void **)i[yy_buffer_stack_top]);
    *(_QWORD *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0;
    actDslpop_buffer_state();
  }
  free(i);
  free((void *)yy_start_stack);
  actDsllineno = 1;
  yy_buffer_stack = 0;
  yy_buffer_stack_top = 0;
  yy_buffer_stack_max = 0;
  yy_c_buf_p = 0;
  yy_init = 0;
  yy_start = 0;
  yy_start_stack_ptr = 0;
  yy_start_stack_depth = 0;
  yy_start_stack = 0;
  actDslin = 0;
  actDslout = 0;
  return 0;
}

void *actDslrealloc(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0xDB05E8D7uLL);
}

void actDslreset()
{
  yy_start = 1;
  stringLen = 0;
}

uint64_t actDsl_get_line_number()
{
  return actDsllineno;
}

uint64_t yy_get_current_token()
{
  return actDsltext;
}

uint64_t actDslparse(void *a1)
{
  FILE **v1;
  int v2;
  unint64_t v3;
  _BYTE *v4;
  char *v5;
  uint64_t *v6;
  FILE **v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  char *v14;
  int v15;
  int v16;
  unsigned int v17;
  FILE *v18;
  FILE *v19;
  uint64_t v20;
  int v21;
  int v22;
  FILE *v23;
  FILE *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  FILE *v30;
  FILE *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  size_t v36;
  _BYTE *v37;
  _BYTE *v38;
  __int16 *i;
  int v40;
  BOOL v41;
  FILE **v42;
  FILE *v43;
  FILE *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  FILE *v48;
  int v49;
  uint64_t v50;
  FILE *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  unint64_t v58;
  uint64_t v59;
  int v60;
  unint64_t v61;
  _BYTE *v62;
  int v64;
  _BYTE *__src;
  unint64_t v66;
  uint64_t v67;
  _BYTE v68[1600];
  _BYTE v69[400];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v1 = (FILE **)MEMORY[0x24BDAC8D8];
  if (actDsldebug)
    fwrite("Starting parse\n", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  v60 = 0;
  v64 = 0;
  v2 = 0;
  actDslnerrs = 0;
  __src = v68;
  actDslchar = -2;
  v3 = 200;
  v62 = v70;
  v58 = 128;
  v4 = v69;
  v5 = v69;
  v6 = (uint64_t *)v68;
  while (1)
  {
    *(_WORD *)v5 = v2;
    if (&v4[2 * v3 - 2] <= v5)
    {
      if (v3 >> 4 > 0x270
        || ((v7 = v1, 2 * v3 >= 0x2710) ? (v8 = 10000) : (v8 = 2 * v3),
            (v9 = malloc_type_malloc(10 * v8 + 7, 0xAF233AF1uLL)) == 0))
      {
LABEL_145:
        handleErrorWithLineNumber(a1, (uint64_t)"memory exhausted", actDsllineno);
        v54 = 2;
        v10 = v4;
        goto LABEL_130;
      }
      v10 = v9;
      v11 = (v5 - v4) >> 1;
      v12 = v11 + 1;
      memcpy(v9, v4, 2 * (v11 + 1));
      v13 = v8;
      v14 = &v10[(2 * v8 + 7) & 0xFFFFFFFFFFFFFFF8];
      memcpy(v14, __src, 8 * (v11 + 1));
      if (v4 != v69)
        free(v4);
      if (actDsldebug)
        fprintf(*v7, "Stack size increased to %lu\n", v13);
      v5 = &v10[2 * v11];
      v6 = (uint64_t *)&v14[8 * v12 - 8];
      if (v13 <= v12)
      {
        v54 = 1;
        goto LABEL_130;
      }
      v4 = v10;
      __src = v14;
      v3 = v13;
      v1 = v7;
    }
    if (actDsldebug)
      fprintf(*v1, "Entering state %d\n", v2);
    v66 = v3;
    if (((0x2FF8FA79F0uLL >> v2) & 1) != 0)
      goto LABEL_49;
    v15 = yypact[v2];
    v16 = actDslchar;
    if (actDslchar == -2)
    {
      if (actDsldebug)
        fwrite("Reading a token: ", 0x11uLL, 1uLL, *v1);
      v16 = actDsllex(a1);
      actDslchar = v16;
    }
    if (v16 <= 0)
    {
      actDslchar = 0;
      if (actDsldebug)
        fwrite("Now at end of input.\n", 0x15uLL, 1uLL, *v1);
      v17 = 0;
    }
    else
    {
      if (v16 > 0x110)
        v17 = 2;
      else
        v17 = yytranslate[v16];
      if (actDsldebug)
      {
        fprintf(*v1, "%s ", "Next token is");
        v18 = (FILE *)*MEMORY[0x24BDAC8D8];
        if (v17 >= 0x12)
          fprintf(v18, "nterm %s (");
        else
          fprintf(v18, "token %s (");
        v19 = v18;
        v1 = (FILE **)MEMORY[0x24BDAC8D8];
        fputc(41, v19);
        fputc(10, *v1);
      }
    }
    v20 = v17 + v15;
    v64 = v17;
    if (v20 > 0x27 || v17 != yycheck[v20])
    {
LABEL_49:
      if (((0x100705060FuLL >> v2) & 1) == 0)
      {
        v25 = yydefact[v2];
        goto LABEL_51;
      }
      goto LABEL_65;
    }
    v21 = yytable[v20];
    if (((0x7400000001uLL >> v20) & 1) == 0)
      break;
    if (((0x7400000000uLL >> v20) & 1) == 0)
    {
      v25 = -v21;
LABEL_51:
      v26 = v25;
      v61 = yyr2[v25];
      v59 = v6[1 - v61];
      if (actDsldebug)
      {
        fprintf(*v1, "Reducing stack by rule %d (line %lu):\n", v25 - 1, yyrline[v25]);
        if ((_DWORD)v26)
        {
          v27 = 0;
          v28 = v61;
          if (v61 <= 1)
            v28 = 1;
          v67 = v28;
          do
          {
            v29 = v27 + 1;
            fprintf(*v1, "   $%d = ", v27 + 1);
            v30 = (FILE *)*MEMORY[0x24BDAC8D8];
            if (yyrhs[yyprhs[v26] + v27] < 18)
              fprintf(v30, "token %s (");
            else
              fprintf(v30, "nterm %s (");
            v31 = v30;
            v1 = (FILE **)MEMORY[0x24BDAC8D8];
            fputc(41, v31);
            fputc(10, *v1);
            ++v27;
          }
          while ((_DWORD)v67 != v29);
          goto LABEL_60;
        }
LABEL_62:
        v32 = v59;
      }
      else
      {
LABEL_60:
        v32 = v59;
        switch((int)v26)
        {
          case 5:
            handleTyping(a1, *v6);
            break;
          case 6:
            handleCorrectionMatch(a1, *v6);
            break;
          case 7:
            handlePredictionMatch(a1, *v6);
            break;
          case 8:
            handleDocumentMatch(a1, *v6);
            break;
          case 9:
          case 10:
          case 13:
          case 14:
          case 15:
          case 20:
          case 21:
          case 22:
            break;
          case 11:
            objc_msgSend(a1, "handleNewLine");
            break;
          case 12:
            yy_start = 1;
            stringLen = 0;
            break;
          case 16:
            handleBoolConfig(a1, *(v6 - 1), *(_DWORD *)v6);
            break;
          case 17:
            handleIntConfig(a1, *(v6 - 1), *(unsigned int *)v6);
            break;
          case 18:
          case 19:
            handleStringConfig(a1, *(v6 - 1), *v6);
            break;
          case 23:
          case 24:
            v45 = *(v6 - 1);
            v46 = *v6;
            v47 = a1;
            goto LABEL_114;
          case 25:
            v45 = *v6;
            v47 = a1;
            v46 = 0;
LABEL_114:
            handleBracketCommand(v47, v45, v46);
            break;
          case 26:
            v32 = 1;
            break;
          case 27:
            v32 = 0;
            break;
          default:
            goto LABEL_62;
        }
      }
      if (actDsldebug)
      {
        fprintf(*v1, "%s ", "-> $$ =");
        v48 = (FILE *)*MEMORY[0x24BDAC8D8];
        v49 = v26;
        v50 = yyr1[v26];
        if (v49)
          fprintf(v48, "nterm %s (");
        else
          fprintf(v48, "token %s (");
        v51 = v48;
        v1 = (FILE **)MEMORY[0x24BDAC8D8];
        fputc(41, v51);
        fputc(10, *v1);
        v52 = &v6[-v61];
        v5 -= 2 * v61;
        if (actDsldebug)
          yy_stack_print((__int16 *)v4, (unint64_t)v5);
      }
      else
      {
        v52 = &v6[-v61];
        v50 = yyr1[v26];
        v5 -= 2 * v61;
      }
      v52[1] = v32 | v59 & 0xFFFFFFFF00000000;
      v6 = v52 + 1;
      v53 = (*(__int16 *)v5 + yypgoto[v50 - 18]);
      if (v53 <= 0x27 && *(unsigned __int16 *)v5 == (unsigned __int16)yycheck[v53])
        v21 = yytable[v53];
      else
        v21 = yydefgoto[v50 - 18];
      goto LABEL_128;
    }
LABEL_65:
    if (v60 == 3)
    {
      if (actDslchar <= 0)
      {
        if (!actDslchar)
        {
          v54 = 1;
          goto LABEL_136;
        }
      }
      else
      {
        yydestruct("Error: discarding", v64, (void **)&actDsllval);
        actDslchar = -2;
      }
    }
    else if (!v60)
    {
      ++actDslnerrs;
      v33 = yysyntax_error(0, v2, actDslchar);
      v34 = v33;
      v35 = v58;
      if (v58 < v33)
      {
        if (v33 < 0)
          v36 = -1;
        else
          v36 = 2 * v33;
        if (v62 != v70)
          free(v62);
        v37 = malloc_type_malloc(v36, 0x6CAC4B48uLL);
        v38 = v70;
        if (v37)
          v38 = v37;
        v62 = v38;
        if (v37)
          v35 = v36;
        else
          v35 = 128;
      }
      v58 = v35;
      if (v34 - 1 >= v35)
      {
        handleErrorWithLineNumber(a1, (uint64_t)"syntax error", actDsllineno);
        if (v34)
          goto LABEL_145;
      }
      else
      {
        yysyntax_error(v62, v2, actDslchar);
        handleErrorWithLineNumber(a1, (uint64_t)v62, actDsllineno);
      }
    }
    for (i = (__int16 *)(v5 - 2); ; --i)
    {
      v5 = (char *)(i + 1);
      if (((0x2FF8FA79F0uLL >> v2) & 1) == 0 && ((0x100304060FuLL >> v2) & 1) != 0)
      {
        v40 = yypact[v2] + 1;
        v41 = yypact[v2] == 10 || v40 == 1;
        if (v41 && ((0x8BFFFFFFFEuLL >> v40) & 1) != 0)
          break;
      }
      if (v5 == v4)
      {
        v54 = 1;
        v10 = v4;
        v5 = v4;
        goto LABEL_130;
      }
      yydestruct("Error: popping", yystos[v2], (void **)v6);
      v2 = *i;
      if (actDsldebug)
        yy_stack_print((__int16 *)v4, (unint64_t)i);
      --v6;
    }
    v21 = yytable[yypact[v2] + 1];
    v6[1] = actDsllval;
    ++v6;
    if (actDsldebug)
    {
      v42 = (FILE **)MEMORY[0x24BDAC8D8];
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s ", "Shifting");
      v43 = *v42;
      if (((0x1BE3ECC1FFuLL >> v21) & 1) != 0)
        fprintf(v43, "token %s (");
      else
        fprintf(v43, "nterm %s (");
      v44 = v43;
      v1 = v42;
      fputc(41, v44);
      fputc(10, *v42);
      v60 = 3;
    }
    else
    {
      v60 = 3;
      v1 = (FILE **)MEMORY[0x24BDAC8D8];
    }
LABEL_128:
    v5 += 2;
    v2 = v21;
    v3 = v66;
  }
  if ((_DWORD)v20 != 23)
  {
    v22 = v60 - 1;
    if (!v60)
      v22 = 0;
    v60 = v22;
    if (actDsldebug)
    {
      fprintf(*v1, "%s ", "Shifting");
      v23 = (FILE *)*MEMORY[0x24BDAC8D8];
      if (v17 >= 0x12)
        fprintf(v23, "nterm %s (");
      else
        fprintf(v23, "token %s (");
      v24 = v23;
      v1 = (FILE **)MEMORY[0x24BDAC8D8];
      fputc(41, v24);
      fputc(10, *v1);
    }
    if (actDslchar)
      actDslchar = -2;
    v6[1] = actDsllval;
    ++v6;
    goto LABEL_128;
  }
  v54 = 0;
  v10 = v4;
LABEL_130:
  if (actDslchar != -2 && actDslchar != 0)
    yydestruct("Cleanup: discarding lookahead", v64, (void **)&actDsllval);
  v4 = v10;
LABEL_136:
  if (actDsldebug)
    yy_stack_print((__int16 *)v4, (unint64_t)v5);
  for (; v5 != v4; --v6)
  {
    v56 = *(__int16 *)v5;
    v5 -= 2;
    yydestruct("Cleanup: popping", yystos[v56], (void **)v6);
  }
  if (v4 != v69)
    free(v4);
  if (v62 != v70)
    free(v62);
  return v54;
}

void handleTyping(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(v3, "stringWithUTF8String:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleTyping:", v5);

}

void handleCorrectionMatch(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(v3, "stringWithUTF8String:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleCorrectionMatch:lineNumber:", v5, actDsllineno);

}

void handlePredictionMatch(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(v3, "stringWithUTF8String:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handlePredictionMatch:lineNumber:", v5, actDsllineno);

}

void handleDocumentMatch(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(v3, "stringWithUTF8String:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleDocumentMatch:lineNumber:", v5, actDsllineno);

}

void handleBoolConfig(void *a1, uint64_t a2, int a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a1;
  objc_msgSend(v5, "stringWithUTF8String:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleBoolConfig:withValue:lineNumber:", v7, a3 != 0, actDsllineno);

}

void handleIntConfig(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a1;
  objc_msgSend(v5, "stringWithUTF8String:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleIntConfig:withValue:lineNumber:", v7, a3, actDsllineno);

}

void handleStringConfig(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a1;
  objc_msgSend(v5, "stringWithUTF8String:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleStringConfig:withValue:lineNumber:", v8, v7, actDsllineno);

}

void handleBracketCommand(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a1;
  objc_msgSend(v5, "stringWithUTF8String:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v6, "handleCommand:withValue:lineNumber:", v8, v7, actDsllineno);

  if (a3)
}

uint64_t yy_stack_print(__int16 *a1, unint64_t a2)
{
  FILE **v4;
  int v5;

  v4 = (FILE **)MEMORY[0x24BDAC8D8];
  fwrite("Stack now", 9uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  while ((unint64_t)a1 <= a2)
  {
    v5 = *a1++;
    fprintf(*v4, " %d", v5);
  }
  return fputc(10, *v4);
}

uint64_t yysyntax_error(_BYTE *a1, int a2, unsigned int a3)
{
  uint64_t v3;
  char v5;
  int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  int v19;
  char *v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v26;
  int v28;
  char *i;
  int v30;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  char v36[64];
  char *v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (((0x100705860FuLL >> a2) & 1) != 0)
  {
    v5 = a2;
    v6 = yypact[a2];
    if (a3 > 0x110)
      v7 = 2;
    else
      v7 = yytranslate[a3];
    v8 = yytname[v7];
    v9 = yytnamerr(0, v8);
    v39 = 0u;
    v38 = 0u;
    v37 = v8;
    strcpy(v36, "syntax error, unexpected %s");
    if (((0x2FFCFBF9F0uLL >> v5) & 1) != 0)
      v10 = -v6;
    else
      v10 = 0;
    if (40 - v6 >= 18)
      v11 = 18;
    else
      v11 = 40 - v6;
    if (v10 < v11)
    {
      v12 = 0;
      v13 = &v36[27];
      v14 = v10;
      v15 = v6;
      v16 = v11;
      v17 = v9;
      v18 = ", expecting %s";
      v19 = 1;
      v35 = v9;
      while (1)
      {
        if (v14 == 1 || (_DWORD)v14 != yycheck[v14 + v15])
        {
          v21 = v17;
        }
        else
        {
          if (v19 == 5)
          {
            v36[27] = 0;
            v19 = 1;
            v21 = v35;
            goto LABEL_25;
          }
          v20 = yytname[v14];
          (&v37)[v19] = v20;
          v21 = yytnamerr(0, v20) + v17;
          --v13;
          do
          {
            v22 = *(unsigned __int8 *)v18++;
            *++v13 = v22;
          }
          while (v22);
          ++v19;
          v12 |= v21 < v17;
          v18 = " or %s";
        }
        ++v14;
        v17 = v21;
        if (v14 == v16)
          goto LABEL_25;
      }
    }
    v12 = 0;
    v19 = 1;
    v21 = v9;
LABEL_25:
    v23 = 0;
    do
      v24 = v23;
    while (v36[v23++]);
    v3 = v24 + v21;
    v26 = __CFADD__(v24, v21);
    if (v12 | v26)
      return -1;
    if (!a1)
      return v3;
    v28 = 0;
    for (i = v36; ; i += v33)
    {
      v30 = *i;
      *a1 = v30;
      if (v30 != 37)
        break;
      if (i[1] != 115 || v28 >= v19)
        goto LABEL_42;
      v34 = v28 + 1;
      v32 = yytnamerr((uint64_t)a1, (&v37)[v28]);
      v33 = 2;
      v28 = v34;
LABEL_44:
      a1 += v32;
    }
    if (!v30)
      return v3;
LABEL_42:
    v32 = 1;
    v33 = 1;
    goto LABEL_44;
  }
  return 0;
}

void handleErrorWithLineNumber(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a1;
  objc_msgSend(v5, "stringWithUTF8String:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportSyntaxErrors:lineNumber:", v7, a3);

}

void yydestruct(const char *a1, int a2, void **a3)
{
  const char *v5;
  FILE **v6;
  FILE *v7;

  if (actDsldebug)
  {
    v5 = "Deleting";
    if (a1)
      v5 = a1;
    v6 = (FILE **)MEMORY[0x24BDAC8D8];
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s ", v5);
    v7 = *v6;
    if (a2 >= 18)
      fprintf(v7, "nterm %s (");
    else
      fprintf(v7, "token %s (");
    fputc(41, v7);
    fputc(10, *v6);
  }
  if ((a2 - 12) <= 5)
    free(*a3);
}

uint64_t yytnamerr(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  _BYTE *v3;
  _BYTE *i;
  int v5;
  int v6;
  char v7;
  _BYTE *v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  if (*a2 != 34)
  {
LABEL_13:
    if (a1)
    {
      v10 = a1 - 1;
      do
      {
        v11 = *a2++;
        *(_BYTE *)++v10 = v11;
      }
      while (v11);
      return v10 - a1;
    }
    else
    {
      v12 = 0;
      while (a2[v12++])
        ;
      return v12 - 1;
    }
  }
  v2 = 0;
  v3 = a2;
  for (i = a2; ; v3 = i)
  {
    v6 = (char)*++i;
    v5 = v6;
    v7 = v6;
    if (v6 > 91)
    {
      if (v5 == 92)
      {
        v9 = v3[2];
        v8 = v3 + 2;
        if (v9 != 92)
          goto LABEL_13;
        v7 = 92;
        i = v8;
      }
      goto LABEL_10;
    }
    if (v5 == 34)
      break;
    if (v5 == 39 || v5 == 44)
      goto LABEL_13;
LABEL_10:
    if (a1)
      *(_BYTE *)(a1 + v2) = v7;
    ++v2;
  }
  if (a1)
    *(_BYTE *)(a1 + v2) = 0;
  return v2;
}

void handleError(void *a1, uint64_t a2)
{
  handleErrorWithLineNumber(a1, a2, actDsllineno);
}

void _GLOBAL__sub_I_TIUnitTestUtils_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2348A8D30]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_22FA56000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TITestUserPersona_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2348A8D30]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_22FA56000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_CPUtilities_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2348A8D30]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_22FA56000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_CPParamTrainer_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2348A8D30]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_22FA56000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_CPTestCaseEval_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2348A8D30]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_22FA56000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TTKTestCaseConverter_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2348A8D30]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_22FA56000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TILanguageResourcesUtil_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2348A8D30]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_22FA56000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TICPEval_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2348A8D30]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_22FA56000);
  objc_autoreleasePoolPop(v0);
}

void _GLOBAL__sub_I_TICPTrainer_mm()
{
  void *v0;

  v0 = (void *)MEMORY[0x2348A8D30]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_22FA56000);
  objc_autoreleasePoolPop(v0);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC20](theSetIdentifier);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x24BDBBC38](theSet, *(_QWORD *)&theChar);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x24BDBC6F8](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t LMLanguageModelPerformMaintenance()
{
  return MEMORY[0x24BE5EBE0]();
}

uint64_t LMStreamTokenizerCreate()
{
  return MEMORY[0x24BE5EC98]();
}

uint64_t LMStreamTokenizerPushBytes()
{
  return MEMORY[0x24BE5ECA0]();
}

uint64_t LMStreamTokenizerRelease()
{
  return MEMORY[0x24BE5ECA8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t TIBundleForInputMode()
{
  return MEMORY[0x24BEB4EF8]();
}

uint64_t TICharIsAlphaNumeric()
{
  return MEMORY[0x24BEB4F08]();
}

uint64_t TICharIsSpace()
{
  return MEMORY[0x24BEB4F10]();
}

uint64_t TIDispatchAsync()
{
  return MEMORY[0x24BEB4F38]();
}

uint64_t TIDispatchSync()
{
  return MEMORY[0x24BEB4F40]();
}

uint64_t TIDispatchWaitForAllBlocks()
{
  return MEMORY[0x24BEB4F48]();
}

uint64_t TIGetInputModeProperties()
{
  return MEMORY[0x24BEB4F68]();
}

uint64_t TIInputModeGetLanguage()
{
  return MEMORY[0x24BEB4F98]();
}

uint64_t TIInputModeGetLanguageWithRegion()
{
  return MEMORY[0x24BEB4FA0]();
}

uint64_t TIIsRevision_Enabled()
{
  return MEMORY[0x24BEB54B0]();
}

uint64_t TILexiconIDForLocaleIdentifier()
{
  return MEMORY[0x24BEB54C0]();
}

uint64_t TILocaleIdentifierForLexiconID()
{
  return MEMORY[0x24BEB54C8]();
}

uint64_t TILogProblemSentencesToStdout()
{
  return MEMORY[0x24BEB54D0]();
}

uint64_t TIMultilingualDynamicModelEnabled()
{
  return MEMORY[0x24BEB54D8]();
}

uint64_t TINgramModelPathForInputMode()
{
  return MEMORY[0x24BEB50E0]();
}

uint64_t TIPrintTypingTranscriptToStdout()
{
  return MEMORY[0x24BEB54F0]();
}

uint64_t TISwearWordPolicyV1Enabled()
{
  return MEMORY[0x24BEB54F8]();
}

uint64_t TI_KB_USER_DIRECTORY()
{
  return MEMORY[0x24BEB5528]();
}

uint64_t TI_SET_DIALECT_LM_PATH()
{
  return MEMORY[0x24BEB5530]();
}

uint64_t TI_SET_IS_USING_CUSTOM_DIALECT_LM()
{
  return MEMORY[0x24BEB5538]();
}

uint64_t TI_SET_KB_USER_DIRECTORY()
{
  return MEMORY[0x24BEB5540]();
}

uint64_t TI_SET_USING_TOUCAN_LM()
{
  return MEMORY[0x24BEB5548]();
}

uint64_t UIKeyboardDeltaLexiconPathForInputMode()
{
  return MEMORY[0x24BEB5550]();
}

uint64_t UIKeyboardDynamicDictionaryFile()
{
  return MEMORY[0x24BEB5558]();
}

uint64_t UIKeyboardGetInputModeKBStarLayout()
{
  return MEMORY[0x24BDF7A50]();
}

uint64_t UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom()
{
  return MEMORY[0x24BDF7A70]();
}

uint64_t UIKeyboardInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x24BDF7A80]();
}

uint64_t UIKeyboardInputModeGetNormalizedLevelsFromComponents()
{
  return MEMORY[0x24BDF7AA8]();
}

uint64_t UIKeyboardInputModeWithNewSWLayout()
{
  return MEMORY[0x24BDF7AC8]();
}

uint64_t UIKeyboardPhraseLexiconPathForInputMode()
{
  return MEMORY[0x24BEB5560]();
}

uint64_t UIKeyboardStaticUnigramsFile()
{
  return MEMORY[0x24BEB5568]();
}

uint64_t UIKeyboardUserDirectory()
{
  return MEMORY[0x24BEB5570]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BDF7CE0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t TIInputManager::set_key_layout()
{
  return MEMORY[0x24BEB55D8]();
}

uint64_t TIInputManager::set_typing_model()
{
  return MEMORY[0x24BEB55F0]();
}

uint64_t TIInputManager::set_input_context()
{
  return MEMORY[0x24BEB5600]();
}

uint64_t TIInputManager::set_search_algorithm()
{
  return MEMORY[0x24BEB5608]();
}

uint64_t TIInputManager::clear_continuous_path(TIInputManager *this)
{
  return MEMORY[0x24BEB5610](this);
}

uint64_t TIInputManager::set_locale_identifier()
{
  return MEMORY[0x24BEB5620]();
}

uint64_t TIInputManager::set_uses_text_checker(TIInputManager *this)
{
  return MEMORY[0x24BEB5628](this);
}

uint64_t TIInputManager::set_candidate_refinery()
{
  return MEMORY[0x24BEB5630]();
}

uint64_t TIInputManager::set_candidate_generator()
{
  return MEMORY[0x24BEB5638]();
}

uint64_t TIInputManager::lookup()
{
  return MEMORY[0x24BEB5668]();
}

uint64_t TIInputManager::add_touch()
{
  return MEMORY[0x24BEB5678]();
}

uint64_t TIInputManager::set_input()
{
  return MEMORY[0x24BEB5680]();
}

void TIInputManager::TIInputManager(TIInputManager *this)
{
  MEMORY[0x24BEB5688](this);
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext()
{
  return MEMORY[0x24BE5ED18]();
}

{
  return MEMORY[0x24BE5ED20]();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x24BE5ED28](this);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  MEMORY[0x24BE5ED30](this);
}

uint64_t language_modeling::v1::LinguisticContext::operator=()
{
  return MEMORY[0x24BE5ED38]();
}

{
  return MEMORY[0x24BE5ED40]();
}

uint64_t TIFitAffineMLLMatrix::identity(TIFitAffineMLLMatrix *this)
{
  return MEMORY[0x24BEB56A0](this);
}

void TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(TIFitAffineMLLMatrix *this, const TIFitAffineMLLMatrix *a2)
{
  MEMORY[0x24BEB56A8](this, a2);
}

void TIFitAffineMLLMatrix::TIFitAffineMLLMatrix(TIFitAffineMLLMatrix *this)
{
  MEMORY[0x24BEB56B0](this);
}

uint64_t TIFitAffineMLLMatrix::TIFitAffineMLLMatrix()
{
  return MEMORY[0x24BEB56B8]();
}

uint64_t TIFitAffineMLLMatrix::operator()()
{
  return MEMORY[0x24BEB56C0]();
}

uint64_t KB::ByteString::copy()
{
  return MEMORY[0x24BEB56C8]();
}

uint64_t KB::ByteString::operator=()
{
  return MEMORY[0x24BEB56D0]();
}

{
  return MEMORY[0x24BEB56D8]();
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x24BEB56E0](this, a2);
}

uint64_t KB::AppTrieLoader::create()
{
  return MEMORY[0x24BEB56F8]();
}

uint64_t KB::LanguageModel::find_token_id_for_word()
{
  return MEMORY[0x24BEB5700]();
}

uint64_t KB::LanguageModel::clear_dynamic_learning_bundles()
{
  return MEMORY[0x24BEB5708]();
}

uint64_t KB::LanguageModelStr::LanguageModelStr()
{
  return MEMORY[0x24BEB5728]();
}

uint64_t KB::StaticDictionary::load()
{
  return MEMORY[0x24BEB5730]();
}

uint64_t KB::StaticDictionary::create(KB::StaticDictionary *this)
{
  return MEMORY[0x24BEB5738](this);
}

void KB::StaticDictionary::~StaticDictionary(KB::StaticDictionary *this)
{
  MEMORY[0x24BEB5740](this);
}

uint64_t KB::DynamicDictionary::create_single(KB::DynamicDictionary *this)
{
  return MEMORY[0x24BEB5748](this);
}

uint64_t KB::CandidateCollection::normalize_scores(KB::CandidateCollection *this)
{
  return MEMORY[0x24BEB5758](this);
}

uint64_t KB::DictionaryContainer::create_multilexicon()
{
  return MEMORY[0x24BEB5760]();
}

void KB::DictionaryContainer::~DictionaryContainer(KB::DictionaryContainer *this)
{
  MEMORY[0x24BEB5768](this);
}

uint64_t KB::LanguageModelConfig::LanguageModelConfig()
{
  return MEMORY[0x24BEB5770]();
}

uint64_t KB::LanguageModelContext::append()
{
  return MEMORY[0x24BEB5778]();
}

{
  return MEMORY[0x24BEB5780]();
}

uint64_t KB::LanguageModelContext::LanguageModelContext()
{
  return MEMORY[0x24BEB5788]();
}

uint64_t KB::AddressBookTrieLoader::create()
{
  return MEMORY[0x24BEB5798]();
}

uint64_t KB::LanguageModelImplStub::LanguageModelImplStub()
{
  return MEMORY[0x24BEB57A0]();
}

uint64_t KB::MutableLexiconWrapper::create()
{
  return MEMORY[0x24BEB57A8]();
}

uint64_t KB::cf_mutable_dictionary(KB *this)
{
  return MEMORY[0x24BEB57B0](this);
}

uint64_t KB::LanguageModelContainer::LanguageModelContainer()
{
  return MEMORY[0x24BEB57B8]();
}

uint64_t KB::NgramCandidateRefinery::create()
{
  return MEMORY[0x24BEB57C0]();
}

uint64_t KB::LanguageModelLexiconGroup::set_lexicon_weight(KB::LanguageModelLexiconGroup *this, float a2)
{
  return MEMORY[0x24BEB57D8](this, a2);
}

uint64_t KB::LanguageModelLexiconGroup::LanguageModelLexiconGroup()
{
  return MEMORY[0x24BEB57E0]();
}

uint64_t KB::String::hash(KB::String *this, const char *a2)
{
  return MEMORY[0x24BEB5810](this, a2);
}

uint64_t KB::String::String()
{
  return MEMORY[0x24BEB5840]();
}

uint64_t KB::String::String(KB::String *this, const char *a2)
{
  return MEMORY[0x24BEB5848](this, a2);
}

uint64_t KB::String::String(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x24BEB5850](this, a2);
}

uint64_t KB::String::String(KB::String *this)
{
  return MEMORY[0x24BEB5858](this);
}

{
  return MEMORY[0x24BEB5860](this);
}

void KB::String::~String(KB::String *this)
{
  MEMORY[0x24BEB5868](this);
}

uint64_t KB::String::operator=()
{
  return MEMORY[0x24BEB5870]();
}

{
  return MEMORY[0x24BEB5878]();
}

uint64_t KB::Candidate::add_sources_info(KB::Candidate *this, const __CFString *a2, const __CFDictionary *a3)
{
  return MEMORY[0x24BEB5880](this, a2, a3);
}

uint64_t KB::Candidate::append()
{
  return MEMORY[0x24BEB5888]();
}

void KB::Candidate::~Candidate(KB::Candidate *this)
{
  MEMORY[0x24BEB5898](this);
}

uint64_t KB::cf_number(KB *this, double a2)
{
  return MEMORY[0x24BEB58A0](this, a2);
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x24BEB58B0](this, a2);
}

uint64_t TI::TIInputRecognizer::TIInputRecognizer()
{
  return MEMORY[0x24BEB58B8]();
}

uint64_t TI::CP::ShapeStore::num_records(TI::CP::ShapeStore *this)
{
  return MEMORY[0x24BEB58C0](this);
}

uint64_t TI::CP::ShapeStore::shape_count_for_word()
{
  return MEMORY[0x24BEB58C8]();
}

uint64_t TI::CP::ShapeStore::ShapeStore(TI::CP::ShapeStore *this, const TI::CP::ShapeStoreConfiguration *a2)
{
  return MEMORY[0x24BEB58D0](this, a2);
}

void TI::CP::ShapeStore::~ShapeStore(TI::CP::ShapeStore *this)
{
  MEMORY[0x24BEB58D8](this);
}

uint64_t TI::CP::TIPathRecognizerEnsemble::TIPathRecognizerEnsemble()
{
  return MEMORY[0x24BEB58E0]();
}

uint64_t TI::CP::Path::append(TI::CP::Path *this, CGPoint a2, double a3, double a4, double a5, double a6)
{
  return MEMORY[0x24BEB58E8](this, (__n128)a2, *(__n128 *)&a2.y, a3, a4, a5, a6);
}

uint64_t TI::CP::Search::Search()
{
  return MEMORY[0x24BEB58F0]();
}

uint64_t TI::CP::operator==()
{
  return MEMORY[0x24BEB58F8]();
}

uint64_t TI::Favonius::KeyboardLayout::create()
{
  return MEMORY[0x24BEB5900]();
}

uint64_t TI::Favonius::UnigramTypingModel::create()
{
  return MEMORY[0x24BEB5908]();
}

uint64_t TI::Favonius::BeamSearchAlgorithm::create(TI::Favonius::BeamSearchAlgorithm *this, double a2, double a3)
{
  return MEMORY[0x24BEB5910](this, a2, a3);
}

uint64_t TI::Favonius::UnigramCandidateGenerator::create()
{
  return MEMORY[0x24BEB5918]();
}

uint64_t TI::Favonius::FavoniusStrokeBuildManager::FavoniusStrokeBuildManager(TI::Favonius::FavoniusStrokeBuildManager *this)
{
  return MEMORY[0x24BEB5920](this);
}

uint64_t TI::Favonius::Touch::create()
{
  return MEMORY[0x24BEB5928]();
}

uint64_t TI::Favonius::LayoutKey::create()
{
  return MEMORY[0x24BEB5930]();
}

uint64_t TIFitAffineMLLMatrix::addRow()
{
  return MEMORY[0x24BEB5980]();
}

uint64_t TIFitAffineMLLMatrix::transform(TIFitAffineMLLMatrix *this)
{
  return MEMORY[0x24BEB5988](this);
}

uint64_t TIFitAffineMLLMatrix::operator*()
{
  return MEMORY[0x24BEB5990]();
}

uint64_t KB::LanguageModel::id_for_static_word()
{
  return MEMORY[0x24BEB5998]();
}

uint64_t KB::CollatorWrapper::sortkey_for_string(KB::CollatorWrapper *this, const KB::String *a2)
{
  return MEMORY[0x24BEB59A0](this, a2);
}

uint64_t KB::CollatorWrapper::sortkey_equal_strings(KB::CollatorWrapper *this, const KB::String *a2, const KB::String *a3)
{
  return MEMORY[0x24BEB59A8](this, a2, a3);
}

uint64_t KB::DictionaryContainer::derive_static_words()
{
  return MEMORY[0x24BEB59C0]();
}

uint64_t KB::DictionaryContainer::lookup(KB::DictionaryContainer *this, const KB::String *a2)
{
  return MEMORY[0x24BEB59C8](this, a2);
}

uint64_t KB::Word::capitalized_string(KB::Word *this)
{
  return MEMORY[0x24BEB59E0](this);
}

uint64_t KB::String::equal(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x24BEB5A08](this, a2);
}

uint64_t KB::Candidate::capitalized_string(KB::Candidate *this)
{
  return MEMORY[0x24BEB5A28](this);
}

uint64_t KB::Candidate::has_from_named_entities(KB::Candidate *this)
{
  return MEMORY[0x24BEB5A30](this);
}

uint64_t KB::Candidate::has_from_supplemental_lexicon(KB::Candidate *this)
{
  return MEMORY[0x24BEB5A38](this);
}

uint64_t KB::Candidate::string(KB::Candidate *this)
{
  return MEMORY[0x24BEB5A40](this);
}

uint64_t TI::ConfidenceModel::update_confidence_for_candidates(TI::ConfidenceModel *this, KB::CandidateCollection *a2)
{
  return MEMORY[0x24BEB5A48](this, a2);
}

uint64_t TI::CP::Path::is_inflection_point(TI::CP::Path *this)
{
  return MEMORY[0x24BEB5A50](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24FD47CA0();
}

void operator delete(void *__p)
{
  off_24FD47CA8(__p);
}

uint64_t operator delete()
{
  return off_24FD47CB0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24FD47CB8(__sz);
}

uint64_t operator new()
{
  return off_24FD47CC0();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x24BEDCE40](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x24BEDCEE8](cls, name, imp, types);
}

void clearerr(FILE *a1)
{
  MEMORY[0x24BDAD9A8](a1);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
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

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
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

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x24BDAE5C8](a1);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x24BDAE6B0](*(_QWORD *)&a1, a2, a3, a4, a5);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
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

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x24BEDCF28](m1, m2);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x24BEDCF50](m);
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

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
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

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int sgesv_(__CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_real *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x24BDB2F90](__n, __nrhs, __a, __lda, __ipiv, __b, __ldb, __info);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int system(const char *a1)
{
  return MEMORY[0x24BDB0130](a1);
}

UBool u_isWhitespace(UChar32 c)
{
  return MEMORY[0x24BEDBF98](*(_QWORD *)&c);
}

UBool u_isdigit(UChar32 c)
{
  return MEMORY[0x24BEDBFA8](*(_QWORD *)&c);
}

UBool u_ispunct(UChar32 c)
{
  return MEMORY[0x24BEDBFC0](*(_QWORD *)&c);
}

UBool u_isspace(UChar32 c)
{
  return MEMORY[0x24BEDBFC8](*(_QWORD *)&c);
}

