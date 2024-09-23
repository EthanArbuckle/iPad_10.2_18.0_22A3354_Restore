@implementation VKIconModifiers

- (VKIconModifiers)init
{
  VKIconModifiers *v2;
  VKIconModifiers *v3;
  _BOOL4 hasValue;
  int v10;
  int v11;
  int v12;
  int v13;
  void **p_value;
  __int128 v15;
  double v16;
  ValueUnion *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 *v22;
  uint64_t v23;
  objc_super v25;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[5];
  _OWORD *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)VKIconModifiers;
  v2 = -[VKIconModifiers init](&v25, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  *(_QWORD *)&v26[0] = 0;
  memset(&v26[1], 0, 32);
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  __asm { FMOV            V0.2S, #1.0 }
  *((_QWORD *)&v26[0] + 1) = _D0;
  BYTE14(v26[1]) = 0;
  v30 = 0uLL;
  *((_QWORD *)&v30 + 1) = grl::Allocator::instance((grl::Allocator *)v2);
  memset(v31, 0, 56);
  *((_QWORD *)&v29 + 1) = &v30;
  v32 = 0;
  *(_OWORD *)&v3->_iconModifiers._isClusterIcon = v26[0];
  hasValue = v3->_iconModifiers._pathScale._hasValue;
  if (LOBYTE(v26[1]))
  {
    *((_DWORD *)&v3->_iconModifiers._pathScale._hasValue + 1) = DWORD1(v26[1]);
    if (!hasValue)
      v3->_iconModifiers._pathScale._hasValue = 1;
  }
  else if (v3->_iconModifiers._pathScale._hasValue)
  {
    v3->_iconModifiers._pathScale._hasValue = 0;
  }
  v3->_iconModifiers._pathScale._value.data[0] = BYTE8(v26[1]);
  v10 = v3->_iconModifiers._pathScale._value.data[1];
  if (BYTE9(v26[1]))
  {
    *(_DWORD *)((char *)&v3->_iconModifiers._pathScale._value.type + 2) = *(_DWORD *)((char *)&v26[1] + 10);
    if (!v10)
      v3->_iconModifiers._pathScale._value.data[1] = 1;
  }
  else if (v3->_iconModifiers._pathScale._value.data[1])
  {
    v3->_iconModifiers._pathScale._value.data[1] = 0;
  }
  v11 = v3->_iconModifiers._pathScale._value.data[6];
  if (BYTE14(v26[1]))
  {
    *(_DWORD *)((char *)&v3->_iconModifiers._pathScale._value.type + 7) = *(_DWORD *)((char *)&v26[1] + 15);
    if (!v11)
      v3->_iconModifiers._pathScale._value.data[6] = 1;
  }
  else if (v3->_iconModifiers._pathScale._value.data[6])
  {
    v3->_iconModifiers._pathScale._value.data[6] = 0;
  }
  v12 = *(&v3->_iconModifiers._component + 4);
  if (BYTE4(v26[2]))
  {
    *(_DWORD *)&v3->_iconModifiers._customColor._hasValue = DWORD2(v26[2]);
    if (!v12)
      *(&v3->_iconModifiers._component + 4) = 1;
  }
  else if (*(&v3->_iconModifiers._component + 4))
  {
    *(&v3->_iconModifiers._component + 4) = 0;
  }
  v13 = *((unsigned __int8 *)&v3->_iconModifiers._customColor._hasValue + 4);
  if (BYTE12(v26[2]))
  {
    LODWORD(v3->_iconModifiers._customColor._value.type) = v27;
    if (!v13)
      *(&v3->_iconModifiers._customColor._hasValue + 4) = 1;
  }
  else if (*(&v3->_iconModifiers._customColor._hasValue + 4))
  {
    *(&v3->_iconModifiers._customColor._hasValue + 4) = 0;
  }
  if (BYTE8(v27))
  {
    if (v3->_iconModifiers._shapeColor._hasValue)
    {
      p_value = (void **)&v3->_iconModifiers._shapeColor._value;
      if ((char)v3->_iconModifiers._fontSize._value.data[7] < 0)
        operator delete(*p_value);
      v15 = v28;
      *(_QWORD *)&v3->_iconModifiers._fontSize._value.type = v29;
      *(_OWORD *)p_value = v15;
      BYTE7(v29) = 0;
      LOBYTE(v28) = 0;
    }
    else
    {
      v16 = *(double *)&v29;
      *(_OWORD *)v3->_iconModifiers._shapeColor._value.data = v28;
      v3->_iconModifiers._fontSize._value.type = v16;
      *(_QWORD *)&v29 = 0;
      v28 = 0uLL;
      v3->_iconModifiers._shapeColor._hasValue = 1;
    }
  }
  else if (v3->_iconModifiers._shapeColor._hasValue)
  {
    if ((char)v3->_iconModifiers._fontSize._value.data[7] < 0)
      operator delete(*(void **)&v3->_iconModifiers._shapeColor._value.type);
    v3->_iconModifiers._shapeColor._hasValue = 0;
  }
  v17 = &v3->_iconModifiers._tailDirection._value;
  std::__tree<std::__value_type<unsigned short,std::string>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,std::string>,std::less<unsigned short>,true>,geo::StdAllocator<std::__value_type<unsigned short,std::string>,grl::Allocator>>::destroy((uint64_t)&v3->_iconModifiers._tailDirection, *(_QWORD *)&v3->_iconModifiers._tailDirection._value.type);
  *(_QWORD *)&v3->_iconModifiers._tailDirection._hasValue = *((_QWORD *)&v29 + 1);
  v18 = v30;
  *(_QWORD *)&v3->_iconModifiers._tailDirection._value.type = v30;
  v19 = *(_QWORD *)&v31[0];
  v3->_iconModifiers._textLocale._value.type = *(double *)v31;
  if (v19)
  {
    *(_QWORD *)(v18 + 16) = v17;
    *((_QWORD *)&v29 + 1) = &v30;
    *(_QWORD *)&v30 = 0;
    *(_QWORD *)&v31[0] = 0;
  }
  else
  {
    *(_QWORD *)&v3->_iconModifiers._tailDirection._hasValue = v17;
  }
  v20 = *(void **)v3->_anon_80;
  if (v20)
  {
    *(_QWORD *)&v3->_anon_80[8] = v20;
    operator delete(v20);
  }
  *(_OWORD *)v3->_anon_80 = *(_OWORD *)((char *)v31 + 8);
  *(_QWORD *)&v3->_anon_80[16] = *((_QWORD *)&v31[1] + 1);
  memset((char *)v31 + 8, 0, 24);
  v21 = *(void **)&v3->_anon_80[24];
  if (v21)
  {
    *(_QWORD *)&v3->_anon_80[32] = v21;
    operator delete(v21);
  }
  *(_OWORD *)&v3->_anon_80[24] = v31[2];
  *(_QWORD *)&v3->_anon_80[40] = *(_QWORD *)&v31[3];
  memset(&v31[2], 0, 24);
  v22 = *(unsigned __int8 **)&v3->_anon_80[72];
  *(_QWORD *)&v3->_anon_80[72] = 0;
  if (v22 == &v3->_anon_80[48])
  {
    v23 = 4;
    v22 = &v3->_anon_80[48];
    goto LABEL_53;
  }
  if (v22)
  {
    v23 = 5;
LABEL_53:
    (*(void (**)(void))(*(_QWORD *)v22 + 8 * v23))();
  }
  if (v32)
  {
    if (v32 == (_OWORD *)((char *)&v31[3] + 8))
    {
      *(_QWORD *)&v3->_anon_80[72] = &v3->_anon_80[48];
      (*(void (**)(void))(*((_QWORD *)&v31[3] + 1) + 24))();
    }
    else
    {
      *(_QWORD *)&v3->_anon_80[72] = v32;
      v32 = 0;
    }
  }
  else
  {
    *(_QWORD *)&v3->_anon_80[72] = 0;
  }
  grl::IconModifiers::~IconModifiers((grl::IconModifiers *)v26);
  *(_WORD *)&v3->_transitMode = 0;
  v3->_navMode = 0;
  v3->_interactive = 0;
  v3->_zoom = -1;
  v3->_variant = 0;
  v3->_secondaryVariant = 0;
  v3->_countryCode = 0xFFFFLL;
  return v3;
}

- (VKIconModifiers)initWithModifiers:(const void *)a3
{
  char *v4;
  _QWORD *i;
  char *v6;
  int v7;
  int v8;
  int v9;
  _QWORD **v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t **v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void **v20;
  char v21;
  __int128 v22;
  void *v23;
  size_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  _QWORD *v28;
  char *v29;
  char **v30;
  BOOL v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t **v35;
  uint64_t v36;
  std::string *v37;
  __int128 v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t *v41;
  _QWORD *v42;
  char *v43;
  char *v44;
  _BYTE *v45;
  __int128 *v46;
  int *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  _BYTE *v53;
  _BYTE **v54;
  _BYTE *v55;
  _BYTE *v56;
  uint64_t v57;
  unint64_t v58;
  int *v59;
  unint64_t v60;
  int *v61;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  __int128 *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 *v70;
  _OWORD *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  __int128 *v81;
  _OWORD *v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 *v94;
  _OWORD *v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  char *v99;
  _BYTE *v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _OWORD *v105;
  __int128 *v106;
  uint64_t v107;
  __int128 v108;
  int v109;
  char *v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  _QWORD *v115;
  objc_super v116;
  _QWORD v117[3];
  _QWORD *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v116.receiver = self;
  v116.super_class = (Class)VKIconModifiers;
  v4 = -[VKIconModifiers init](&v116, sel_init);
  i = v4;
  v6 = v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 8) = *(_OWORD *)a3;
    v7 = v4[24];
    if (*((_BYTE *)a3 + 16))
    {
      *((_DWORD *)v4 + 7) = *((_DWORD *)a3 + 5);
      if (!v7)
        v4[24] = 1;
    }
    else if (v4[24])
    {
      v4[24] = 0;
    }
    v4[32] = *((_BYTE *)a3 + 24);
    if (*((_BYTE *)a3 + 25))
    {
      if (v4[33])
      {
        v4[34] = *((_BYTE *)a3 + 26);
        v4[35] = *((_BYTE *)a3 + 27);
        v4[36] = *((_BYTE *)a3 + 28);
        v4[37] = *((_BYTE *)a3 + 29);
      }
      else
      {
        *(_DWORD *)(v4 + 34) = *(_DWORD *)((char *)a3 + 26);
        v4[33] = 1;
      }
    }
    else if (v4[33])
    {
      v4[33] = 0;
    }
    if (*((_BYTE *)a3 + 30))
    {
      if (v4[38])
      {
        v4[39] = *((_BYTE *)a3 + 31);
        v4[40] = *((_BYTE *)a3 + 32);
        v4[41] = *((_BYTE *)a3 + 33);
        v4[42] = *((_BYTE *)a3 + 34);
      }
      else
      {
        *(_DWORD *)(v4 + 39) = *(_DWORD *)((char *)a3 + 31);
        v4[38] = 1;
      }
    }
    else if (v4[38])
    {
      v4[38] = 0;
    }
    v8 = v4[44];
    if (*((_BYTE *)a3 + 36))
    {
      *((_DWORD *)v4 + 12) = *((_DWORD *)a3 + 10);
      if (!v8)
        v4[44] = 1;
    }
    else if (v4[44])
    {
      v4[44] = 0;
    }
    v9 = v4[52];
    if (*((_BYTE *)a3 + 44))
    {
      *((_DWORD *)v4 + 14) = *((_DWORD *)a3 + 12);
      if (!v9)
        v4[52] = 1;
    }
    else if (v4[52])
    {
      v4[52] = 0;
    }
    geo::optional<std::string>::operator=((uint64_t)(v4 + 64), (uint64_t)a3 + 56);
    if (i + 1 == a3)
    {
LABEL_173:
      v110 = (char *)*((_QWORD *)a3 + 24);
      if (v110)
      {
        if (v110 == (char *)a3 + 168)
        {
          v118 = v117;
          (*(void (**)(char *, _QWORD *))(*((_QWORD *)a3 + 21) + 24))((char *)a3 + 168, v117);
LABEL_179:
          std::__function::__value_func<void ()(gdc::Registry *,std::span<gdc::Entity,18446744073709551615ul>)>::swap[abi:nn180100](v117, i + 22);
          v112 = v118;
          if (v118 == v117)
          {
            v113 = 4;
            v112 = v117;
          }
          else
          {
            if (!v118)
            {
LABEL_184:
              *((_WORD *)v6 + 106) = 0;
              v6[211] = 0;
              v6[209] = 0;
              *((_QWORD *)v6 + 27) = -1;
              *((_QWORD *)v6 + 28) = 0;
              *((_QWORD *)v6 + 29) = 0;
              *((_QWORD *)v6 + 30) = 0xFFFFLL;
              return (VKIconModifiers *)v6;
            }
            v113 = 5;
          }
          (*(void (**)(void))(*v112 + 8 * v113))();
          goto LABEL_184;
        }
        v111 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v110 + 16))(*((_QWORD *)a3 + 24));
      }
      else
      {
        v111 = 0;
      }
      v118 = (_QWORD *)v111;
      goto LABEL_179;
    }
    v10 = (_QWORD **)(i + 12);
    v11 = (char *)*((_QWORD *)a3 + 11);
    v12 = (char *)a3 + 96;
    if (*((_QWORD *)v6 + 15))
    {
      v115 = i;
      v14 = (uint64_t **)(v6 + 104);
      v13 = *((_QWORD *)v6 + 13);
      v15 = *((_QWORD *)v6 + 12);
      *((_QWORD *)v6 + 12) = v6 + 104;
      *(_QWORD *)(v13 + 16) = 0;
      *((_QWORD *)v6 + 13) = 0;
      *((_QWORD *)v6 + 15) = 0;
      if (*(_QWORD *)(v15 + 8))
        v16 = *(_QWORD *)(v15 + 8);
      else
        v16 = v15;
      if (v16)
      {
        v17 = *(_QWORD **)(v16 + 16);
        if (v17)
        {
          v18 = (_QWORD *)*v17;
          if (*v17 == v16)
          {
            *v17 = 0;
            while (1)
            {
              v63 = (_QWORD *)v17[1];
              if (!v63)
                break;
              do
              {
                v17 = v63;
                v63 = (_QWORD *)*v63;
              }
              while (v63);
            }
          }
          else
          {
            for (v17[1] = 0; v18; v18 = (_QWORD *)v17[1])
            {
              do
              {
                v17 = v18;
                v18 = (_QWORD *)*v18;
              }
              while (v18);
            }
          }
        }
        if (v11 == v12)
        {
          v30 = (char **)v11;
          v19 = v16;
        }
        else
        {
          do
          {
            v19 = (uint64_t)v17;
            *(_WORD *)(v16 + 32) = *((_WORD *)v11 + 16);
            if ((char *)v16 != v11)
            {
              v20 = (void **)(v16 + 40);
              v21 = v11[63];
              if (*(char *)(v16 + 63) < 0)
              {
                if (v21 >= 0)
                  v23 = v11 + 40;
                else
                  v23 = (void *)*((_QWORD *)v11 + 5);
                if (v21 >= 0)
                  v24 = v11[63];
                else
                  v24 = *((_QWORD *)v11 + 6);
                std::string::__assign_no_alias<false>(v20, v23, v24);
              }
              else if (v11[63] < 0)
              {
                std::string::__assign_no_alias<true>(v20, *((void **)v11 + 5), *((_QWORD *)v11 + 6));
              }
              else
              {
                v22 = *(_OWORD *)(v11 + 40);
                *(_QWORD *)(v16 + 56) = *((_QWORD *)v11 + 7);
                *(_OWORD *)v20 = v22;
              }
            }
            v25 = *v14;
            v26 = (uint64_t *)(v6 + 104);
            v27 = (uint64_t *)(v6 + 104);
            if (*v14)
            {
              do
              {
                while (1)
                {
                  v26 = v25;
                  if (*(unsigned __int16 *)(v16 + 32) >= *((unsigned __int16 *)v25 + 16))
                    break;
                  v25 = (uint64_t *)*v25;
                  v27 = v26;
                  if (!*v26)
                    goto LABEL_63;
                }
                v25 = (uint64_t *)v25[1];
              }
              while (v25);
              v27 = v26 + 1;
            }
LABEL_63:
            *(_QWORD *)v16 = 0;
            *(_QWORD *)(v16 + 8) = 0;
            *(_QWORD *)(v16 + 16) = v26;
            *v27 = v16;
            v28 = (_QWORD *)**v10;
            if (v28)
            {
              *v10 = v28;
              v16 = *v27;
            }
            std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v6 + 13), (uint64_t *)v16);
            ++*((_QWORD *)v6 + 15);
            if (v17)
            {
              v17 = (_QWORD *)v17[2];
              if (v17)
              {
                v32 = (_QWORD *)*v17;
                if (*v17 == v19)
                {
                  *v17 = 0;
                  while (1)
                  {
                    v33 = (_QWORD *)v17[1];
                    if (!v33)
                      break;
                    do
                    {
                      v17 = v33;
                      v33 = (_QWORD *)*v33;
                    }
                    while (v33);
                  }
                }
                else
                {
                  for (v17[1] = 0; v32; v32 = (_QWORD *)v17[1])
                  {
                    do
                    {
                      v17 = v32;
                      v32 = (_QWORD *)*v32;
                    }
                    while (v32);
                  }
                }
              }
            }
            else
            {
              v17 = 0;
            }
            v29 = (char *)*((_QWORD *)v11 + 1);
            if (v29)
            {
              do
              {
                v30 = (char **)v29;
                v29 = *(char **)v29;
              }
              while (v29);
            }
            else
            {
              do
              {
                v30 = (char **)*((_QWORD *)v11 + 2);
                v31 = *v30 == v11;
                v11 = (char *)v30;
              }
              while (!v31);
            }
            if (!v19)
              break;
            v16 = v19;
            v11 = (char *)v30;
          }
          while (v30 != (char **)v12);
        }
        std::__tree<std::__value_type<unsigned short,std::string>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,std::string>,std::less<unsigned short>,true>,geo::StdAllocator<std::__value_type<unsigned short,std::string>,grl::Allocator>>::destroy((uint64_t)v10, v19);
        if (v17)
        {
          v34 = (_QWORD *)v17[2];
          for (i = v115; v34; v34 = (_QWORD *)v34[2])
            v17 = v34;
          std::__tree<std::__value_type<unsigned short,std::string>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,std::string>,std::less<unsigned short>,true>,geo::StdAllocator<std::__value_type<unsigned short,std::string>,grl::Allocator>>::destroy((uint64_t)v10, (uint64_t)v17);
          if (v30 == (char **)v12)
            goto LABEL_115;
          goto LABEL_95;
        }
      }
      else
      {
        v30 = (char **)v11;
      }
      i = v115;
      if (v30 == (char **)v12)
        goto LABEL_115;
    }
    else
    {
      v30 = (char **)*((_QWORD *)a3 + 11);
      if (v11 == v12)
        goto LABEL_115;
    }
LABEL_95:
    v35 = (uint64_t **)(i + 13);
    do
    {
      v36 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)v6 + 14) + 16))(*((_QWORD *)v6 + 14), 64, 8);
      *(_WORD *)(v36 + 32) = *((_WORD *)v30 + 16);
      v37 = (std::string *)(v36 + 40);
      if (*((char *)v30 + 63) < 0)
      {
        std::string::__init_copy_ctor_external(v37, v30[5], (std::string::size_type)v30[6]);
      }
      else
      {
        v38 = *(_OWORD *)(v30 + 5);
        *(_QWORD *)(v36 + 56) = v30[7];
        *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      }
      v39 = *v35;
      v40 = i + 13;
      v41 = i + 13;
      if (*v35)
      {
        do
        {
          while (1)
          {
            v40 = v39;
            if (*(unsigned __int16 *)(v36 + 32) >= *((unsigned __int16 *)v39 + 16))
              break;
            v39 = (uint64_t *)*v39;
            v41 = v40;
            if (!*v40)
              goto LABEL_107;
          }
          v39 = (uint64_t *)v39[1];
        }
        while (v39);
        v41 = v40 + 1;
      }
LABEL_107:
      *(_QWORD *)v36 = 0;
      *(_QWORD *)(v36 + 8) = 0;
      *(_QWORD *)(v36 + 16) = v40;
      *v41 = v36;
      v42 = (_QWORD *)**v10;
      if (v42)
      {
        *v10 = v42;
        v36 = *v41;
      }
      std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*((uint64_t **)v6 + 13), (uint64_t *)v36);
      ++*((_QWORD *)v6 + 15);
      v43 = v30[1];
      if (v43)
      {
        do
        {
          v44 = v43;
          v43 = *(char **)v43;
        }
        while (v43);
      }
      else
      {
        do
        {
          v44 = v30[2];
          v31 = *(_QWORD *)v44 == (_QWORD)v30;
          v30 = (char **)v44;
        }
        while (!v31);
      }
      v30 = (char **)v44;
    }
    while (v44 != v12);
LABEL_115:
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>(i + 16, *((char **)a3 + 15), *((char **)a3 + 16), (uint64_t)(*((_QWORD *)a3 + 16) - *((_QWORD *)a3 + 15)) >> 2);
    v45 = (_BYTE *)*((_QWORD *)v6 + 19);
    v46 = (__int128 *)*((_QWORD *)a3 + 18);
    v47 = (int *)*((_QWORD *)a3 + 19);
    v48 = (char *)v47 - (char *)v46;
    v49 = ((char *)v47 - (char *)v46) >> 2;
    v50 = *((_QWORD *)v6 + 21);
    if (v49 > (v50 - (uint64_t)v45) >> 2)
    {
      if (v45)
      {
        *((_QWORD *)v6 + 20) = v45;
        operator delete(v45);
        v50 = 0;
        *((_QWORD *)v6 + 19) = 0;
        *((_QWORD *)v6 + 20) = 0;
        *((_QWORD *)v6 + 21) = 0;
      }
      if (v48 < 0)
        goto LABEL_186;
      v51 = v50 >> 1;
      if (v50 >> 1 <= v49)
        v51 = ((char *)v47 - (char *)v46) >> 2;
      v52 = (unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v51;
      if (v52 >> 62)
LABEL_186:
        abort();
      v53 = operator new(4 * v52);
      v45 = v53;
      *((_QWORD *)v6 + 20) = v53;
      v54 = (_BYTE **)(v6 + 160);
      *((_QWORD *)v6 + 19) = v53;
      *((_QWORD *)v6 + 21) = &v53[4 * v52];
      v55 = v53;
      if (v46 != (__int128 *)v47)
      {
        memcpy(v53, v46, ((v48 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4);
        v55 = &v45[((v48 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4];
      }
      goto LABEL_150;
    }
    v54 = (_BYTE **)(v6 + 160);
    v56 = (_BYTE *)*((_QWORD *)v6 + 20);
    v57 = v56 - v45;
    v58 = (v56 - v45) >> 2;
    if (v58 < v49)
    {
      v59 = (int *)v46 + v58;
      if (v56 == v45)
        goto LABEL_162;
      v60 = v57 - 4;
      if ((unint64_t)(v57 - 4) < 0x1C)
      {
        v61 = (int *)*((_QWORD *)a3 + 18);
        goto LABEL_160;
      }
      if (v45 < (_BYTE *)v46 + (v57 & 0xFFFFFFFFFFFFFFFCLL))
      {
        v61 = (int *)*((_QWORD *)a3 + 18);
        if (&v45[v57 & 0xFFFFFFFFFFFFFFFCLL] > (_BYTE *)v46)
          goto LABEL_160;
      }
      v64 = (v60 >> 2) + 1;
      if (v60 >= 0x7C)
      {
        v65 = v64 & 0x7FFFFFFFFFFFFFE0;
        v81 = v46 + 4;
        v82 = v45 + 64;
        v83 = v64 & 0x7FFFFFFFFFFFFFE0;
        do
        {
          v85 = *(v81 - 4);
          v84 = *(v81 - 3);
          v86 = *(v81 - 1);
          v88 = *v81;
          v87 = v81[1];
          v90 = v81[2];
          v89 = v81[3];
          *(v82 - 2) = *(v81 - 2);
          *(v82 - 1) = v86;
          *(v82 - 4) = v85;
          *(v82 - 3) = v84;
          v82[2] = v90;
          v82[3] = v89;
          v81 += 8;
          *v82 = v88;
          v82[1] = v87;
          v82 += 8;
          v83 -= 32;
        }
        while (v83);
        if (v64 == v65)
          goto LABEL_161;
        if ((v64 & 0x18) == 0)
        {
          v98 = 4 * v65;
          v61 = (int *)((char *)v46 + v98);
          v45 += v98;
          goto LABEL_160;
        }
      }
      else
      {
        v65 = 0;
      }
      v91 = 4 * (v64 & 0x7FFFFFFFFFFFFFF8);
      v92 = v65 - (v64 & 0x7FFFFFFFFFFFFFF8);
      v93 = 4 * v65;
      v94 = (__int128 *)((char *)v46 + 4 * v65);
      v95 = &v45[v93];
      do
      {
        v96 = *v94;
        v97 = v94[1];
        v94 += 2;
        *v95 = v96;
        v95[1] = v97;
        v95 += 2;
        v92 += 8;
      }
      while (v92);
      if (v64 == (v64 & 0x7FFFFFFFFFFFFFF8))
        goto LABEL_161;
      v61 = (int *)((char *)v46 + v91);
      v45 += v91;
      do
      {
LABEL_160:
        *v45 = *(_BYTE *)v61;
        v45[1] = *((_BYTE *)v61 + 1);
        v45[2] = *((_BYTE *)v61 + 2);
        v45[3] = *((_BYTE *)v61++ + 3);
        v45 += 4;
      }
      while (v61 != v59);
LABEL_161:
      v45 = *v54;
LABEL_162:
      v99 = v45;
      if (v59 != v47)
      {
        v100 = (char *)v46 + v57;
        v101 = (char *)v47 - ((char *)v46 + v57) - 4;
        if (v101 < 0x1C)
        {
          v99 = v45;
        }
        else
        {
          v102 = v45 - v100;
          v99 = v45;
          if (v102 >= 0x20)
          {
            v103 = (v101 >> 2) + 1;
            v104 = 4 * (v103 & 0x7FFFFFFFFFFFFFF8);
            v59 = (int *)((char *)v59 + v104);
            v105 = v45 + 16;
            v106 = (__int128 *)((char *)v46 + 4 * v58 + 16);
            v107 = v103 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              v108 = *v106;
              *(v105 - 1) = *(v106 - 1);
              *v105 = v108;
              v105 += 2;
              v106 += 2;
              v107 -= 8;
            }
            while (v107);
            v99 = &v45[v104];
            if (v103 == (v103 & 0x7FFFFFFFFFFFFFF8))
              goto LABEL_171;
          }
        }
        do
        {
          v109 = *v59++;
          *(_DWORD *)v99 = v109;
          v99 += 4;
        }
        while (v59 != v47);
      }
LABEL_171:
      v80 = v99 - v45;
      goto LABEL_172;
    }
    if (v46 == (__int128 *)v47)
    {
      v55 = (_BYTE *)*((_QWORD *)v6 + 19);
    }
    else
    {
      v62 = v48 - 4;
      if ((unint64_t)(v48 - 4) >= 0x7C)
      {
        v66 = (v62 & 0xFFFFFFFFFFFFFFFCLL) + 4;
        if (v45 >= (_BYTE *)v46 + v66 || (v67 = (__int128 *)&v45[v66], v55 = (_BYTE *)*((_QWORD *)v6 + 19), v67 <= v46))
        {
          v68 = (v62 >> 2) + 1;
          v69 = 4 * (v68 & 0x7FFFFFFFFFFFFFE0);
          v55 = &v45[v69];
          v70 = v46 + 4;
          v71 = v45 + 64;
          v72 = v68 & 0x7FFFFFFFFFFFFFE0;
          do
          {
            v74 = *(v70 - 4);
            v73 = *(v70 - 3);
            v75 = *(v70 - 1);
            v77 = *v70;
            v76 = v70[1];
            v79 = v70[2];
            v78 = v70[3];
            *(v71 - 2) = *(v70 - 2);
            *(v71 - 1) = v75;
            *(v71 - 4) = v74;
            *(v71 - 3) = v73;
            v71[2] = v79;
            v71[3] = v78;
            v70 += 8;
            *v71 = v77;
            v71[1] = v76;
            v71 += 8;
            v72 -= 32;
          }
          while (v72);
          if (v68 == (v68 & 0x7FFFFFFFFFFFFFE0))
            goto LABEL_150;
          v46 = (__int128 *)((char *)v46 + v69);
        }
      }
      else
      {
        v55 = (_BYTE *)*((_QWORD *)v6 + 19);
      }
      do
      {
        *v55 = *(_BYTE *)v46;
        v55[1] = *((_BYTE *)v46 + 1);
        v55[2] = *((_BYTE *)v46 + 2);
        v55[3] = *((_BYTE *)v46 + 3);
        v55 += 4;
        v46 = (__int128 *)((char *)v46 + 4);
      }
      while (v46 != (__int128 *)v47);
    }
LABEL_150:
    v80 = v55 - v45;
LABEL_172:
    *v54 = &v45[v80];
    goto LABEL_173;
  }
  return (VKIconModifiers *)v6;
}

- (void)cppModifiers
{
  return &self->_iconModifiers;
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  size_t v7;
  std::string::size_type v8;
  std::string *p_dst;
  uint64_t v10;
  uint64_t v11;
  std::string __dst;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
    goto LABEL_13;
  v6 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  v7 = strlen(v6);
  if (v7 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v8 = v7;
  if (v7 >= 0x17)
  {
    v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v10 = v7 | 7;
    v11 = v10 + 1;
    p_dst = (std::string *)operator new(v10 + 1);
    __dst.__r_.__value_.__l.__size_ = v8;
    __dst.__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_10;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v7;
  p_dst = &__dst;
  if (v7)
LABEL_10:
    memmove(p_dst, v6, v8);
  p_dst->__r_.__value_.__s.__data_[v8] = 0;
  grl::IconModifiers::setText(&self->_iconModifiers._isClusterIcon, &__dst);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_13:

}

- (void)setTransitLineColor:(id)a3
{
  float var1;
  uint64_t v4;
  int16x8_t v5;
  unsigned __int32 v6;

  var1 = a3.var1;
  v4 = *(_QWORD *)&a3.var2;
  v5 = (int16x8_t)vcvtq_s32_f32(vmulq_f32((float32x4_t)a3, (float32x4_t)vdupq_n_s32(0x437F0000u)));
  *(int16x4_t *)v5.i8 = vmovn_s32((int32x4_t)v5);
  v6 = vmovn_s16(v5).u32[0];
  grl::IconModifiers::setTransitLineColor((uint64_t)&self->_iconModifiers, &v6);
}

- (void)setGlyphOnly:(BOOL)a3
{
  grl::IconModifiers::setGlyphOnly((uint64_t)&self->_iconModifiers, a3);
}

- (BOOL)elevated
{
  return self->_elevated;
}

- (void)setElevated:(BOOL)a3
{
  self->_elevated = a3;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (void)setNightMode:(BOOL)a3
{
  self->_nightMode = a3;
}

- (BOOL)navMode
{
  return self->_navMode;
}

- (void)setNavMode:(BOOL)a3
{
  self->_navMode = a3;
}

- (BOOL)transitMode
{
  return self->_transitMode;
}

- (void)setTransitMode:(BOOL)a3
{
  self->_transitMode = a3;
}

- (BOOL)isSearchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(BOOL)a3
{
  self->_searchResult = a3;
}

- (int64_t)zoom
{
  return self->_zoom;
}

- (void)setZoom:(int64_t)a3
{
  self->_zoom = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (unint64_t)secondaryVariant
{
  return self->_secondaryVariant;
}

- (void)setSecondaryVariant:(unint64_t)a3
{
  self->_secondaryVariant = a3;
}

- (unint64_t)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(unint64_t)a3
{
  self->_countryCode = a3;
}

- (void).cxx_destruct
{
  grl::IconModifiers::~IconModifiers((grl::IconModifiers *)&self->_iconModifiers);
}

- (id).cxx_construct
{
  ValueUnion *p_value;

  *(_QWORD *)&self->_iconModifiers._isClusterIcon = 0;
  __asm { FMOV            V0.2S, #1.0 }
  *(_QWORD *)&self->_iconModifiers._opacity = _D0;
  self->_iconModifiers._pathScale._hasValue = 0;
  LOWORD(self->_iconModifiers._pathScale._value.type) = 0;
  self->_iconModifiers._pathScale._value.data[6] = 0;
  *(&self->_iconModifiers._component + 4) = 0;
  *(&self->_iconModifiers._customColor._hasValue + 4) = 0;
  self->_iconModifiers._shapeColor._hasValue = 0;
  self->_iconModifiers._tailDirection._value.type = 0.0;
  p_value = &self->_iconModifiers._tailDirection._value;
  *(_QWORD *)&self->_iconModifiers._textLocale._hasValue = grl::Allocator::instance((grl::Allocator *)self);
  self->_iconModifiers._textLocale._value.type = 0.0;
  *(_QWORD *)&self->_iconModifiers._tailDirection._hasValue = p_value;
  *(_QWORD *)&self->_anon_80[72] = 0;
  *(_OWORD *)self->_anon_80 = 0u;
  *(_OWORD *)&self->_anon_80[16] = 0u;
  *(_OWORD *)&self->_anon_80[32] = 0u;
  return self;
}

@end
