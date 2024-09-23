BOOL MetricFileMetadataHelper::isTopLevelField(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v3 = *a2;
  if (!*a2)
  {
    v6 = *(_OWORD *)a2;
    v7 = a2[2];
    MetadataHelper::descendIntoMessage(a1, (MetadataHandle *)&v6, (uint64_t)&v8);
    *(_OWORD *)a2 = v8;
    a2[2] = v9;
    v3 = *a2;
  }
  return v3 == *(_QWORD *)(a1 + 80);
}

void sub_24BA32FE4(xpc_object_t *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, __int128 *a3, unsigned int a4, __int128 *a5)
{
  char *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  int v19;
  __int128 v20;
  uint64_t v21;
  xpc_object_t object;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v25, a4);
  v11 = xpc_dictionary_create(0, 0, 0);
  if (v11 || (v11 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2CA88](v11) == MEMORY[0x24BDACFA0])
    {
      xpc_retain(v11);
      v12 = v11;
    }
    else
    {
      v12 = xpc_null_create();
    }
  }
  else
  {
    v12 = xpc_null_create();
    v11 = 0;
  }
  xpc_release(v11);
  v13 = *a1;
  *a1 = xpc_null_create();
  v14 = xpc_null_create();
  v15 = *a1;
  *a1 = v12;
  xpc_release(v15);
  xpc_release(v14);
  while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    v23 = *a5;
    v24 = *((_QWORD *)a5 + 2);
    sub_24BA33508(a2);
  }
  v16 = *a1;
  *a1 = xpc_null_create();
  v17 = xpc_null_create();
  v18 = *a1;
  *a1 = v13;
  xpc_release(v18);
  object = v16;
  if (v16)
    xpc_retain(v16);
  else
    object = xpc_null_create();
  v20 = *a3;
  v21 = *((_QWORD *)a3 + 2);
  v19 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v20, a4);
  sub_24BA351E4(a1, (uint64_t)v10, &object, v19);
  xpc_release(object);
  object = 0;
  xpc_release(v16);
  xpc_release(v17);
}

void sub_24BA331E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  void *v12;
  void *v13;

  xpc_release(object);
  xpc_release(v12);
  xpc_release(v13);
  _Unwind_Resume(a1);
}

void sub_24BA33228(void **a1)
{
  void **v2;
  void **v3;

  *a1 = &off_251CCD428;
  v2 = a1 + 1;
  v3 = a1 + 4;
  sub_24BA39574(&v3);
  v3 = v2;
  sub_24BA39574(&v3);
  PB::Base::~Base((PB::Base *)a1);
}

xpc_object_t sub_24BA33280@<X0>(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_object_t result;

  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  result = xpc_null_create();
  *a2 = result;
  return result;
}

void sub_24BA332C8(void *a1, _DWORD *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  xpc_object_t v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v17;
  uint64_t v18;
  xpc_object_t object;
  xpc_object_t v20;
  xpc_object_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  char v25;
  xpc_object_t v26;
  __int128 v27;
  uint64_t v28;

  v27 = *a3;
  v28 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v27, a4);
  v11 = xpc_null_create();
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, *a2, __p);
    if (v25 < 0)
    {
      if (!__p[1])
      {
LABEL_10:
        operator delete(__p[0]);
        goto LABEL_11;
      }
      v13 = (char *)__p[0];
    }
    else
    {
      if (!v25)
        goto LABEL_11;
      v13 = (char *)__p;
    }
    sub_24BA38958(v13, &v21);
    v14 = v21;
    v21 = v11;
    xpc_release(v11);
    v21 = 0;
    v11 = v14;
    if ((v25 & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (a5 == 12)
  {
    sub_24BA38A58(*a2 != 0, &v26);
    v12 = v26;
    v26 = v11;
    xpc_release(v11);
    v26 = 0;
    v11 = v12;
  }
LABEL_11:
  if (MEMORY[0x24BD2CA88](v11) == MEMORY[0x24BDACFE0])
  {
    sub_24BA389E0(*a2, &v20);
    v15 = v20;
    v20 = v11;
    xpc_release(v11);
    v20 = 0;
    v11 = v15;
  }
  object = v11;
  if (v11)
    xpc_retain(v11);
  else
    object = xpc_null_create();
  v17 = *a3;
  v18 = *((_QWORD *)a3 + 2);
  v16 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v17, a4);
  sub_24BA351E4(a1, (uint64_t)v10, &object, v16);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
}

void sub_24BA334A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;

  if (a24 < 0)
    operator delete(__p);
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void sub_24BA33508(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t a3)
{
  unsigned __int8 *v6;
  uint64_t TagFallback;
  unint64_t v8;
  void *v9;
  unsigned __int8 v10;
  MetricFileMetadataHelper *v11;
  uint64_t BuiltinType;
  int v13;
  uint64_t DecodingType;
  char *v15;
  void *exception;
  char *v17;
  int WireTypeForType;
  int v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t *v30;
  char *v31;
  char Varint64Fallback;
  char LittleEndian32Fallback;
  char *v34;
  xpc_object_t v35;
  xpc_object_t v36;
  char *v37;
  char *v38;
  xpc_object_t *v39;
  char *v40;
  unsigned int v41;
  unint64_t v42;
  float v43;
  unsigned int v44;
  char *v45;
  xpc_object_t v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  unsigned int v51;
  char *v52;
  xpc_object_t v53;
  void *v54;
  void *v55;
  xpc_object_t v56;
  xpc_object_t v57;
  xpc_object_t v58;
  void *v59;
  char Raw;
  void *v61;
  int v62;
  BOOL v63;
  int v64;
  void *v65;
  int v66;
  uint64_t v67;
  unsigned int *v68;
  unsigned int *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  _QWORD *v75;
  int v76;
  int v77;
  _QWORD *v78;
  xpc_object_t v79;
  uint64_t v80;
  unsigned int *v81;
  void *v82;
  int v83;
  double *v84;
  double *v85;
  uint64_t v86;
  double v87;
  xpc_object_t v88;
  unint64_t v89;
  unsigned int *v90;
  void *v91;
  void *v92;
  float *v93;
  float *v94;
  uint64_t v95;
  float v96;
  xpc_object_t v97;
  unint64_t v98;
  unsigned int *v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  __n128 *v104;
  char *v105;
  int v106;
  int UnpackedType;
  void *v108;
  __int128 v109;
  uint64_t v110;
  __n128 v111;
  unint64_t v112;
  __n128 v113;
  unint64_t v114;
  __n128 v115;
  unint64_t v116;
  void *__p;
  char *v118;
  char *v119;
  xpc_object_t object;
  int v121;
  unsigned int v122;
  __int128 v123;
  uint64_t v124;
  __n128 v125;
  unint64_t v126;
  __int128 v127;
  uint64_t v128;
  __n128 v129;
  unint64_t v130;
  __n128 v131;
  unint64_t v132;
  xpc_object_t v133;
  xpc_object_t v134;
  xpc_object_t v135;
  unsigned int v136[4];
  unint64_t v137;
  unsigned int v138[4];
  unint64_t v139;
  unint64_t v140;
  unsigned int v141[4];
  unint64_t v142;

  v6 = (unsigned __int8 *)*((_QWORD *)this + 1);
  if ((unint64_t)v6 >= *((_QWORD *)this + 2) || (char)*v6 < 0)
  {
    TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if ((_DWORD)TagFallback)
      goto LABEL_4;
LABEL_10:
    if (*((_BYTE *)this + 36))
      return;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
    goto LABEL_246;
  }
  TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((_QWORD *)this + 1) = v6 + 1;
  if (!(_DWORD)TagFallback)
    goto LABEL_10;
LABEL_4:
  v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  v9 = (void *)HIDWORD(v8);
  v10 = v8;
  v108 = (void *)a3;
  v11 = (MetricFileMetadataHelper *)(a3 + 8);
  v125 = *a2;
  v126 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::getSubfieldType(v11, &v125, HIDWORD(v8), (uint64_t)&v127);
  v123 = v127;
  v124 = v128;
  BuiltinType = MetadataHelper::getBuiltinType((uint64_t)v11, (MetadataHandle *)&v123);
  v13 = BuiltinType;
  DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(_QWORD *)v141 = 0;
          if (sub_24BA3E798(this, (unint64_t *)v141))
            goto LABEL_146;
          goto LABEL_114;
        case 1u:
          *(_QWORD *)v141 = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v141) & 1) != 0)goto LABEL_114;
LABEL_146:
          v67 = *(_QWORD *)v141;
          goto LABEL_149;
        case 2u:
          v138[0] = 0;
          if ((sub_24BA3E7C8(this, v138) & 1) == 0)
            goto LABEL_114;
          sub_24BA38754(v141, v138[0]);
          Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v141);
          if ((Raw & 1) != 0)
            sub_24BA4F718(v108, *(void **)v141, *(_QWORD *)&v141[2] - *(_QWORD *)v141, v9);
          goto LABEL_130;
        case 5u:
          v141[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v141))goto LABEL_114;
          v67 = v141[0];
LABEL_149:
          sub_24BA4F61C(v108, v67, v9);
          break;
        default:
          goto LABEL_114;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      v140 = 0;
      switch(v10)
      {
        case 0u:
          v15 = (char *)*((_QWORD *)this + 1);
          if ((unint64_t)v15 < *((_QWORD *)this + 2) && (*v15 & 0x80000000) == 0)
          {
            v140 = *v15;
            *((_QWORD *)this + 1) = v15 + 1;
LABEL_74:
            v42 = v140;
            switch(v13)
            {
              case 1:
              case 15:
                v49 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v140);
                v131 = *a2;
                v132 = a2[1].n128_u64[0];
                *(__n128 *)v141 = *a2;
                v142 = a2[1].n128_u64[0];
                v44 = v9;
                v45 = sub_24BA39290((uint64_t)v108, (MetadataHandle *)v141, v9);
                v46 = xpc_null_create();
                if (v13 != 11)
                {
                  if (v13 == 12)
                  {
                    v47 = v108;
                    sub_24BA38A58(v49 != 0.0, v136);
                    v50 = *(void **)v136;
                    *(_QWORD *)v136 = v46;
                    xpc_release(v46);
                    *(_QWORD *)v136 = 0;
                    v46 = v50;
                  }
                  else
                  {
                    v47 = v108;
                  }
LABEL_175:
                  if (MEMORY[0x24BD2CA88](v46) == MEMORY[0x24BDACFE0])
                  {
                    sub_24BA508C8(&__p, v49);
                    v74 = __p;
                    __p = v46;
                    xpc_release(v46);
                    __p = 0;
                    v46 = v74;
                  }
                  object = v46;
                  if (!v46)
                  {
LABEL_169:
                    object = xpc_null_create();
                    goto LABEL_170;
                  }
LABEL_168:
                  xpc_retain(v46);
LABEL_170:
                  *(__n128 *)v138 = v131;
                  v139 = v132;
                  v72 = sub_24BA39310((uint64_t)v47, (MetadataHandle *)v138, v44);
                  sub_24BA351E4(v47, (uint64_t)v45, &object, v72);
                  xpc_release(object);
                  object = 0;
                  xpc_release(v46);
                  return;
                }
                *(__n128 *)v136 = v131;
                v137 = v132;
                v47 = v108;
                sub_24BA3938C((uint64_t)v108, (MetadataHandle *)v136, v44, (unint64_t)v49, v138);
                if (SHIBYTE(v139) < 0)
                {
                  if (!*(_QWORD *)&v138[2])
                  {
LABEL_174:
                    operator delete(*(void **)v138);
                    goto LABEL_175;
                  }
                  v69 = *(unsigned int **)v138;
                }
                else
                {
                  if (!HIBYTE(v139))
                    goto LABEL_175;
                  v69 = v138;
                }
                sub_24BA38958((char *)v69, &v129);
                v73 = (void *)v129.n128_u64[0];
                v129.n128_u64[0] = (unint64_t)v46;
                xpc_release(v46);
                v129.n128_u64[0] = 0;
                v46 = v73;
                if ((SHIBYTE(v139) & 0x80000000) == 0)
                  goto LABEL_175;
                goto LABEL_174;
              case 2:
              case 16:
                v43 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v140);
                v131 = *a2;
                v132 = a2[1].n128_u64[0];
                *(__n128 *)v141 = *a2;
                v142 = a2[1].n128_u64[0];
                v44 = v9;
                v45 = sub_24BA39290((uint64_t)v108, (MetadataHandle *)v141, v9);
                v46 = xpc_null_create();
                if (v13 != 11)
                {
                  if (v13 == 12)
                  {
                    v47 = v108;
                    sub_24BA38A58(v43 != 0.0, v136);
                    v48 = *(void **)v136;
                    *(_QWORD *)v136 = v46;
                    xpc_release(v46);
                    *(_QWORD *)v136 = 0;
                    v46 = v48;
                  }
                  else
                  {
                    v47 = v108;
                  }
LABEL_165:
                  if (MEMORY[0x24BD2CA88](v46) == MEMORY[0x24BDACFE0])
                  {
                    sub_24BA50900(&__p, v43);
                    v71 = __p;
                    __p = v46;
                    xpc_release(v46);
                    __p = 0;
                    v46 = v71;
                  }
                  object = v46;
                  if (!v46)
                    goto LABEL_169;
                  goto LABEL_168;
                }
                *(__n128 *)v136 = v131;
                v137 = v132;
                v47 = v108;
                sub_24BA3938C((uint64_t)v108, (MetadataHandle *)v136, v44, (unint64_t)v43, v138);
                if (SHIBYTE(v139) < 0)
                {
                  if (!*(_QWORD *)&v138[2])
                  {
LABEL_164:
                    operator delete(*(void **)v138);
                    goto LABEL_165;
                  }
                  v68 = *(unsigned int **)v138;
                }
                else
                {
                  if (!HIBYTE(v139))
                    goto LABEL_165;
                  v68 = v138;
                }
                sub_24BA38958((char *)v68, &v129);
                v70 = (void *)v129.n128_u64[0];
                v129.n128_u64[0] = (unint64_t)v46;
                xpc_release(v46);
                v129.n128_u64[0] = 0;
                v46 = v70;
                if ((SHIBYTE(v139) & 0x80000000) == 0)
                  goto LABEL_165;
                goto LABEL_164;
              case 3:
              case 11:
              case 17:
              case 25:
                *(_QWORD *)v138 = v140;
                goto LABEL_86;
              case 4:
              case 10:
              case 18:
              case 24:
                *(_QWORD *)v138 = v140;
                *(__n128 *)v141 = *a2;
                v142 = a2[1].n128_u64[0];
                sub_24BA38B04(v108, (uint64_t *)v138, (__int128 *)v141, v9, v13);
                return;
              case 5:
              case 19:
                *(_QWORD *)v138 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v140);
LABEL_86:
                *(__n128 *)v141 = *a2;
                v142 = a2[1].n128_u64[0];
                sub_24BA38D44(v108, (uint64_t *)v138, (__int128 *)v141, v9, v13);
                return;
              case 6:
              case 20:
                v138[0] = v140;
                goto LABEL_88;
              case 7:
              case 9:
              case 21:
              case 23:
                v138[0] = v140;
                *(__n128 *)v141 = *a2;
                v142 = a2[1].n128_u64[0];
                sub_24BA332C8(v108, v138, (__int128 *)v141, v9, v13);
                return;
              case 8:
              case 22:
                v138[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v140);
LABEL_88:
                *(__n128 *)v141 = *a2;
                v142 = a2[1].n128_u64[0];
                sub_24BA38F84(v108, (int *)v138, (__int128 *)v141, v9, v13);
                return;
              case 12:
              case 26:
                *(__n128 *)v136 = *a2;
                v137 = a2[1].n128_u64[0];
                *(__n128 *)v141 = *a2;
                v142 = a2[1].n128_u64[0];
                v51 = v9;
                v52 = sub_24BA39290((uint64_t)v108, (MetadataHandle *)v141, v9);
                v53 = xpc_null_create();
                if (v13 == 12)
                {
                  v54 = v108;
                  sub_24BA38A58(v42 != 0, &v131);
                  v55 = (void *)v131.n128_u64[0];
                  v131.n128_u64[0] = (unint64_t)v53;
                  xpc_release(v53);
                  v131.n128_u64[0] = 0;
                  v53 = v55;
                }
                else
                {
                  v54 = v108;
                }
                if (MEMORY[0x24BD2CA88](v53) == MEMORY[0x24BDACFE0])
                {
                  sub_24BA38A1C(v42 != 0, &v129);
                  v65 = (void *)v129.n128_u64[0];
                  v129.n128_u64[0] = (unint64_t)v53;
                  xpc_release(v53);
                  v129.n128_u64[0] = 0;
                  v53 = v65;
                }
                __p = v53;
                if (v53)
                  xpc_retain(v53);
                else
                  __p = xpc_null_create();
                *(_OWORD *)v138 = *(_OWORD *)v136;
                v139 = v137;
                v66 = sub_24BA39310((uint64_t)v54, (MetadataHandle *)v138, v51);
                sub_24BA351E4(v54, (uint64_t)v52, &__p, v66);
                xpc_release(__p);
                __p = 0;
                xpc_release(v53);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x24BD2C6B0](exception, "This should never happen, no matter what the input!");
                goto LABEL_246;
            }
          }
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v140) & 1) != 0)
            goto LABEL_74;
          if (!(_DWORD)v9 && *((_BYTE *)this + 36))
            return;
          break;
        case 1u:
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, &v140) & 1) != 0)
            goto LABEL_74;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            break;
          return;
        case 2u:
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            break;
          return;
        case 5u:
          v141[0] = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v141) & 1) != 0)
          {
            v140 = v141[0];
            goto LABEL_74;
          }
          if (!(_DWORD)v9 && *((_BYTE *)this + 36))
            return;
          break;
        default:
          goto LABEL_74;
      }
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
      goto LABEL_246;
    case 13:
      v138[0] = 0;
      v37 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v37 >= *((_QWORD *)this + 2) || *v37 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v138))goto LABEL_114;
      }
      else
      {
        v138[0] = *v37;
        *((_QWORD *)this + 1) = v37 + 1;
      }
      memset(v141, 0, sizeof(v141));
      v142 = 0;
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if ((Raw & 1) != 0)
      {
        v115 = *a2;
        v116 = a2[1].n128_u64[0];
        sub_24BA4F508(v108, (char *)v141, (__int128 *)&v115, v9);
      }
      if (SHIBYTE(v142) < 0)
      {
        v61 = *(void **)v141;
LABEL_132:
        operator delete(v61);
      }
LABEL_133:
      if ((Raw & 1) == 0)
        goto LABEL_114;
      return;
    case 14:
      v138[0] = 0;
      v40 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v40 >= *((_QWORD *)this + 2) || *v40 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v138))goto LABEL_114;
        v41 = v138[0];
      }
      else
      {
        v41 = *v40;
        v138[0] = v41;
        *((_QWORD *)this + 1) = v40 + 1;
      }
      sub_24BA38754(v141, v41);
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v141);
      if ((Raw & 1) != 0)
      {
        v113 = *a2;
        v114 = a2[1].n128_u64[0];
        sub_24BA391C4(v108, (uint64_t)v141, (__int128 *)&v113, v9);
      }
LABEL_130:
      v61 = *(void **)v141;
      if (!*(_QWORD *)v141)
        goto LABEL_133;
      *(_QWORD *)&v141[2] = *(_QWORD *)v141;
      goto LABEL_132;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      v122 = 0;
      v17 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v17 >= *((_QWORD *)this + 2) || *v17 < 0)
      {
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v122) & 1) == 0)
          goto LABEL_114;
      }
      else
      {
        v122 = *v17;
        *((_QWORD *)this + 1) = v17 + 1;
      }
      v104 = a2;
      v106 = (int)v9;
      UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      object = this;
      v121 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      __p = 0;
      v118 = 0;
      v119 = 0;
      while (1)
      {
        v19 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v19 < 1)
          break;
        v20 = v118;
        if (v118 >= v119)
        {
          v22 = (char *)__p;
          v23 = (v118 - (_BYTE *)__p) >> 3;
          v24 = v23 + 1;
          if ((unint64_t)(v23 + 1) >> 61)
            sub_24BA39774();
          v25 = v119 - (_BYTE *)__p;
          if ((v119 - (_BYTE *)__p) >> 2 > v24)
            v24 = v25 >> 2;
          if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
            v26 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v26 = v24;
          if (v26)
          {
            v27 = (char *)sub_24BA39788((uint64_t)&v119, v26);
            v22 = (char *)__p;
            v20 = v118;
          }
          else
          {
            v27 = 0;
          }
          v28 = &v27[8 * v23];
          *(_QWORD *)v28 = 0;
          v21 = v28 + 8;
          while (v20 != v22)
          {
            v29 = *((_QWORD *)v20 - 1);
            v20 -= 8;
            *((_QWORD *)v28 - 1) = v29;
            v28 -= 8;
          }
          __p = v28;
          v118 = v21;
          v119 = &v27[8 * v26];
          if (v22)
            operator delete(v22);
        }
        else
        {
          *(_QWORD *)v118 = 0;
          v21 = v20 + 8;
        }
        v118 = v21;
        switch(WireTypeForType)
        {
          case 0:
            v30 = (unint64_t *)(v21 - 8);
            v31 = (char *)*((_QWORD *)this + 1);
            if ((unint64_t)v31 >= *((_QWORD *)this + 2) || *v31 < 0)
            {
              Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v30);
LABEL_42:
              if ((Varint64Fallback & 1) == 0)
                goto LABEL_111;
            }
            else
            {
              *v30 = *v31;
              *((_QWORD *)this + 1) = v31 + 1;
            }
            break;
          case 1:
            Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v21 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_111;
          case 5:
            v141[0] = 0;
            LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v141);
            *((_QWORD *)v118 - 1) = v141[0];
            if ((LittleEndian32Fallback & 1) == 0)
              goto LABEL_111;
            continue;
          default:
            continue;
        }
      }
      break;
    case 27:
      v136[0] = 0;
      v38 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v38 >= *((_QWORD *)this + 2) || *v38 < 0)
      {
        v39 = (xpc_object_t *)v108;
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v136))goto LABEL_114;
      }
      else
      {
        v136[0] = *v38;
        *((_QWORD *)this + 1) = v38 + 1;
        v39 = (xpc_object_t *)v108;
      }
      *(_QWORD *)v141 = this;
      v141[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(_QWORD *)v138 = this;
      v111 = *a2;
      v112 = a2[1].n128_u64[0];
      v109 = v127;
      v110 = v128;
      sub_24BA32FE4(v39, this, (__int128 *)&v111, v9, &v109);
      sub_24BA3871C((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v138);
      v62 = *((_DWORD *)this + 14);
      v63 = __OFSUB__(v62, 1);
      v64 = v62 - 1;
      if (v64 < 0 == v63)
        *((_DWORD *)this + 14) = v64;
      sub_24BA38A94((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v141);
      return;
    default:
      goto LABEL_114;
  }
  switch((int)DecodingType)
  {
    case 15:
      sub_24BA400A0((uint64_t *)&__p, &v131);
      v129 = *v104;
      v130 = v104[1].n128_u64[0];
      *(__n128 *)v141 = *v104;
      v142 = v104[1].n128_u64[0];
      v34 = sub_24BA39290((uint64_t)v108, (MetadataHandle *)v141, v9);
      v35 = xpc_array_create(0, 0);
      if (v35 || (v35 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x24BD2CA88](v35) == MEMORY[0x24BDACF78])
        {
          xpc_retain(v35);
          v36 = v35;
        }
        else
        {
          v36 = xpc_null_create();
        }
      }
      else
      {
        v36 = xpc_null_create();
        v35 = 0;
      }
      xpc_release(v35);
      v85 = (double *)v131.n128_u64[1];
      v84 = (double *)v131.n128_u64[0];
      if (v131.n128_u64[0] == v131.n128_u64[1])
        goto LABEL_221;
      v86 = MEMORY[0x24BDACFE0];
      while (1)
      {
        v87 = *v84;
        v88 = xpc_null_create();
        if (UnpackedType != 11)
        {
          if (UnpackedType == 12)
          {
            sub_24BA38A58(v87 != 0.0, &v140);
            v89 = v140;
            v140 = (unint64_t)v88;
            xpc_release(v88);
            v140 = 0;
            v88 = (xpc_object_t)v89;
          }
          goto LABEL_218;
        }
        *(__n128 *)v136 = v129;
        v137 = v130;
        sub_24BA3938C((uint64_t)v108, (MetadataHandle *)v136, v9, (unint64_t)v87, v138);
        if (SHIBYTE(v139) < 0)
        {
          if (!*(_QWORD *)&v138[2])
            goto LABEL_217;
          v90 = *(unsigned int **)v138;
        }
        else
        {
          if (!HIBYTE(v139))
            goto LABEL_218;
          v90 = v138;
        }
        sub_24BA38958((char *)v90, &v135);
        v91 = v135;
        v135 = v88;
        xpc_release(v88);
        v135 = 0;
        v88 = v91;
        if (SHIBYTE(v139) < 0)
LABEL_217:
          operator delete(*(void **)v138);
LABEL_218:
        if (MEMORY[0x24BD2CA88](v88) == v86)
        {
          sub_24BA508C8(&v134, v87);
          v92 = v134;
          v134 = v88;
          xpc_release(v88);
          v134 = 0;
          v88 = v92;
        }
        xpc_array_append_value(v36, v88);
        xpc_release(v88);
        if (++v84 == v85)
        {
LABEL_221:
          v133 = v36;
          if (!v36)
          {
LABEL_241:
            v133 = xpc_null_create();
LABEL_242:
            *(__n128 *)v138 = v129;
            v139 = v130;
            v102 = sub_24BA39310((uint64_t)v108, (MetadataHandle *)v138, v9);
            sub_24BA351E4(v108, (uint64_t)v34, &v133, v102);
            xpc_release(v133);
            v133 = 0;
            xpc_release(v36);
            v59 = (void *)v131.n128_u64[0];
            if (v131.n128_u64[0])
            {
              v131.n128_u64[1] = v131.n128_u64[0];
              goto LABEL_110;
            }
            goto LABEL_111;
          }
LABEL_240:
          xpc_retain(v36);
          goto LABEL_242;
        }
      }
    case 16:
      sub_24BA4036C((uint64_t *)&__p, &v131);
      v129 = *v104;
      v130 = v104[1].n128_u64[0];
      *(__n128 *)v141 = *v104;
      v142 = v104[1].n128_u64[0];
      v34 = sub_24BA39290((uint64_t)v108, (MetadataHandle *)v141, v9);
      v58 = xpc_array_create(0, 0);
      if (v58 || (v58 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x24BD2CA88](v58) == MEMORY[0x24BDACF78])
        {
          xpc_retain(v58);
          v36 = v58;
        }
        else
        {
          v36 = xpc_null_create();
        }
      }
      else
      {
        v36 = xpc_null_create();
        v58 = 0;
      }
      xpc_release(v58);
      v94 = (float *)v131.n128_u64[1];
      v93 = (float *)v131.n128_u64[0];
      if (v131.n128_u64[0] == v131.n128_u64[1])
        goto LABEL_239;
      v95 = MEMORY[0x24BDACFE0];
      while (1)
      {
        v96 = *v93;
        v97 = xpc_null_create();
        if (UnpackedType != 11)
        {
          if (UnpackedType == 12)
          {
            sub_24BA38A58(v96 != 0.0, &v140);
            v98 = v140;
            v140 = (unint64_t)v97;
            xpc_release(v97);
            v140 = 0;
            v97 = (xpc_object_t)v98;
          }
          goto LABEL_236;
        }
        *(__n128 *)v136 = v129;
        v137 = v130;
        sub_24BA3938C((uint64_t)v108, (MetadataHandle *)v136, v9, (unint64_t)v96, v138);
        if (SHIBYTE(v139) < 0)
        {
          if (!*(_QWORD *)&v138[2])
            goto LABEL_235;
          v99 = *(unsigned int **)v138;
        }
        else
        {
          if (!HIBYTE(v139))
            goto LABEL_236;
          v99 = v138;
        }
        sub_24BA38958((char *)v99, &v135);
        v100 = v135;
        v135 = v97;
        xpc_release(v97);
        v135 = 0;
        v97 = v100;
        if (SHIBYTE(v139) < 0)
LABEL_235:
          operator delete(*(void **)v138);
LABEL_236:
        if (MEMORY[0x24BD2CA88](v97) == v95)
        {
          sub_24BA50900(&v134, v96);
          v101 = v134;
          v134 = v97;
          xpc_release(v97);
          v134 = 0;
          v97 = v101;
        }
        xpc_array_append_value(v36, v97);
        xpc_release(v97);
        if (++v93 == v94)
        {
LABEL_239:
          v133 = v36;
          if (!v36)
            goto LABEL_241;
          goto LABEL_240;
        }
      }
    case 17:
    case 25:
      sub_24BA40020((uint64_t *)&__p, v141);
      *(__n128 *)v138 = *v104;
      v139 = v104[1].n128_u64[0];
      sub_24BA4FDFC(v108, (uint64_t **)v141, (__int128 *)v138, v9, UnpackedType);
      goto LABEL_108;
    case 18:
    case 24:
      sub_24BA40020((uint64_t *)&__p, v141);
      *(__n128 *)v138 = *v104;
      v139 = v104[1].n128_u64[0];
      sub_24BA4F7EC(v108, (uint64_t **)v141, (__int128 *)v138, v9, UnpackedType);
      goto LABEL_108;
    case 19:
      sub_24BA40638((uint64_t *)&__p, v141);
      *(__n128 *)v138 = *v104;
      v139 = v104[1].n128_u64[0];
      sub_24BA4FDFC(v108, (uint64_t **)v141, (__int128 *)v138, v9, UnpackedType);
      goto LABEL_108;
    case 20:
      sub_24BA402EC((uint64_t *)&__p, v141);
      *(__n128 *)v138 = *v104;
      v139 = v104[1].n128_u64[0];
      sub_24BA50104(v108, (int **)v141, (__int128 *)v138, v9, UnpackedType);
      goto LABEL_108;
    case 21:
    case 23:
      sub_24BA402EC((uint64_t *)&__p, v141);
      *(__n128 *)v138 = *v104;
      v139 = v104[1].n128_u64[0];
      sub_24BA4FAF4(v108, (unsigned int **)v141, (__int128 *)v138, v9, UnpackedType);
      goto LABEL_108;
    case 22:
      sub_24BA40884((uint64_t *)&__p, v141);
      *(__n128 *)v138 = *v104;
      v139 = v104[1].n128_u64[0];
      sub_24BA50104(v108, (int **)v141, (__int128 *)v138, v9, UnpackedType);
LABEL_108:
      v59 = *(void **)v141;
      if (!*(_QWORD *)v141)
        goto LABEL_111;
      *(_QWORD *)&v141[2] = *(_QWORD *)v141;
      goto LABEL_110;
    case 26:
      sub_24BA403F0((uint64_t)&__p, &v131);
      v129 = *v104;
      v130 = v104[1].n128_u64[0];
      *(__n128 *)v141 = *v104;
      v142 = v104[1].n128_u64[0];
      v105 = sub_24BA39290((uint64_t)v108, (MetadataHandle *)v141, v9);
      v56 = xpc_array_create(0, 0);
      if (v56 || (v56 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x24BD2CA88](v56) == MEMORY[0x24BDACF78])
        {
          xpc_retain(v56);
          v57 = v56;
        }
        else
        {
          v57 = xpc_null_create();
        }
      }
      else
      {
        v57 = xpc_null_create();
        v56 = 0;
      }
      xpc_release(v56);
      v75 = (_QWORD *)v131.n128_u64[0];
      v76 = v131.n128_u8[8] & 0x3F;
      if (v131.n128_u64[1] <= 0x3F && (v131.n128_u8[8] & 0x3F) == 0)
        goto LABEL_200;
      v77 = 0;
      v78 = (_QWORD *)(v131.n128_u64[0] + 8 * (v131.n128_u64[1] >> 6));
      break;
    default:
      v103 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24BD2C6B0](v103, "This should never happen, no matter what the input!");
      __cxa_throw(v103, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  do
  {
    v79 = xpc_null_create();
    v80 = 1 << v77;
    if (UnpackedType == 11)
    {
      *(__n128 *)v136 = v129;
      v137 = v130;
      sub_24BA3938C((uint64_t)v108, (MetadataHandle *)v136, v9, (*v75 >> v77) & 1, v138);
      if (SHIBYTE(v139) < 0)
      {
        if (!*(_QWORD *)&v138[2])
        {
LABEL_192:
          operator delete(*(void **)v138);
          goto LABEL_193;
        }
        v81 = *(unsigned int **)v138;
      }
      else
      {
        if (!HIBYTE(v139))
          goto LABEL_193;
        v81 = v138;
      }
      sub_24BA38958((char *)v81, &v135);
      v9 = v135;
      v135 = v79;
      xpc_release(v79);
      v135 = 0;
      v79 = v9;
      LODWORD(v9) = v106;
      if ((SHIBYTE(v139) & 0x80000000) == 0)
        goto LABEL_193;
      goto LABEL_192;
    }
    if (UnpackedType == 12)
    {
      sub_24BA38A58((*v75 & v80) != 0, &v140);
      v9 = (void *)v140;
      v140 = (unint64_t)v79;
      xpc_release(v79);
      v140 = 0;
      v79 = v9;
      LODWORD(v9) = v106;
    }
LABEL_193:
    if (MEMORY[0x24BD2CA88](v79) == MEMORY[0x24BDACFE0])
    {
      sub_24BA38A1C((*v75 & v80) != 0, &v134);
      v82 = v134;
      v134 = v79;
      xpc_release(v79);
      v134 = 0;
      v79 = v82;
    }
    xpc_array_append_value(v57, v79);
    xpc_release(v79);
    v75 += v77 == 63;
    if (v77 == 63)
      v77 = 0;
    else
      ++v77;
  }
  while (v75 != v78 || v77 != v76);
LABEL_200:
  v133 = v57;
  if (v57)
    xpc_retain(v57);
  else
    v133 = xpc_null_create();
  *(__n128 *)v138 = v129;
  v139 = v130;
  v83 = sub_24BA39310((uint64_t)v108, (MetadataHandle *)v138, v9);
  sub_24BA351E4(v108, (uint64_t)v105, &v133, v83);
  xpc_release(v133);
  v133 = 0;
  xpc_release(v57);
  v59 = (void *)v131.n128_u64[0];
  if (v131.n128_u64[0])
LABEL_110:
    operator delete(v59);
LABEL_111:
  if (__p)
  {
    v118 = (char *)__p;
    operator delete(__p);
  }
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit((wireless_diagnostics::google::protobuf::io::CodedInputStream *)object);
  LODWORD(v9) = v106;
  if (v19 > 0)
  {
LABEL_114:
    if (!(_DWORD)v9 && *((_BYTE *)this + 36))
      return;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
LABEL_246:
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
}

void sub_24BA34BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,xpc_object_t object)
{
  void *v32;
  uint64_t v33;

  if (*(char *)(v33 - 153) < 0)
    operator delete(*(void **)(v33 - 176));
  xpc_release(v32);
  _Unwind_Resume(a1);
}

void wis::createTagForProtobuf(wis *this@<X0>, unsigned int a2@<W1>, unint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  sub_24BA35008(a3, (8 * (_DWORD)this) | 2);
  sub_24BA35008(a3, a2);
}

void sub_24BA34FEC(_Unwind_Exception *exception_object)
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

void sub_24BA35008(unint64_t *a1, unsigned int a2)
{
  unsigned int v2;
  _BYTE *v4;
  unsigned int v5;
  char v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  char *v14;
  char *v15;
  _BYTE *v16;
  _BYTE *v17;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  unint64_t v27;
  char *v28;
  _BYTE *v29;
  char v30;

  LOBYTE(v2) = a2;
  if (a2 <= 0x7F)
  {
    v8 = (_BYTE *)a1[1];
  }
  else
  {
    v4 = (_BYTE *)a1[1];
    v5 = a2;
    do
    {
      v6 = v5 | 0x80;
      v7 = a1[2];
      if ((unint64_t)v4 >= v7)
      {
        v9 = *a1;
        v10 = &v4[-*a1];
        v11 = (unint64_t)(v10 + 1);
        if ((uint64_t)(v10 + 1) < 0)
          goto LABEL_42;
        v12 = v7 - v9;
        if (2 * v12 > v11)
          v11 = 2 * v12;
        if (v12 >= 0x3FFFFFFFFFFFFFFFLL)
          v13 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v13 = v11;
        if (v13)
          v14 = (char *)operator new(v13);
        else
          v14 = 0;
        v15 = &v10[(_QWORD)v14];
        v16 = &v10[(_QWORD)v14];
        *v16 = v6;
        v8 = v16 + 1;
        if (v4 != (_BYTE *)v9)
        {
          v17 = &v4[~v9];
          do
          {
            v18 = *--v4;
            (v17--)[(_QWORD)v14] = v18;
          }
          while (v4 != (_BYTE *)v9);
          v4 = (_BYTE *)*a1;
          v15 = v14;
        }
        *a1 = (unint64_t)v15;
        a1[1] = (unint64_t)v8;
        a1[2] = (unint64_t)&v14[v13];
        if (v4)
          operator delete(v4);
      }
      else
      {
        *v4 = v6;
        v8 = v4 + 1;
      }
      a1[1] = (unint64_t)v8;
      v2 = v5 >> 7;
      v19 = v5 >> 14;
      v4 = v8;
      v5 >>= 7;
    }
    while (v19);
  }
  v20 = a1[2];
  if ((unint64_t)v8 >= v20)
  {
    v22 = *a1;
    v23 = &v8[-*a1];
    v24 = (unint64_t)(v23 + 1);
    if ((uint64_t)(v23 + 1) < 0)
LABEL_42:
      sub_24BA39774();
    v25 = v20 - v22;
    if (2 * v25 > v24)
      v24 = 2 * v25;
    if (v25 >= 0x3FFFFFFFFFFFFFFFLL)
      v26 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v26 = v24;
    if (v26)
      v27 = (unint64_t)operator new(v26);
    else
      v27 = 0;
    v28 = (char *)(v27 + v26);
    v23[v27] = v2;
    v21 = (uint64_t)&v23[v27 + 1];
    if (v8 == (_BYTE *)v22)
    {
      v27 += (unint64_t)v23;
    }
    else
    {
      v29 = &v8[~v22];
      do
      {
        v30 = *--v8;
        (v29--)[v27] = v30;
      }
      while (v8 != (_BYTE *)v22);
      v8 = (_BYTE *)*a1;
    }
    *a1 = v27;
    a1[1] = v21;
    a1[2] = (unint64_t)v28;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v8 = v2;
    v21 = (uint64_t)(v8 + 1);
  }
  a1[1] = v21;
}

void sub_24BA351E4(void *a1, uint64_t a2, xpc_object_t *a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  void *count;
  xpc_object_t v16;
  xpc_object_t object;
  xpc_object_t v18[2];
  xpc_object_t v19[2];
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  uint64_t v23;
  xpc_object_t v24;

  if (a4)
  {
    v22 = a1;
    v23 = a2;
    sub_24BA38838((uint64_t)&v22, &v24);
    v7 = MEMORY[0x24BD2CA88](v24);
    v8 = MEMORY[0x24BDACF78];
    if (v7 != MEMORY[0x24BDACF78])
    {
      v9 = xpc_array_create(0, 0);
      if (v9 || (v9 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x24BD2CA88](v9) == v8)
        {
          xpc_retain(v9);
          v10 = v9;
        }
        else
        {
          v10 = xpc_null_create();
        }
      }
      else
      {
        v10 = xpc_null_create();
        v9 = 0;
      }
      xpc_release(v9);
      v12 = xpc_null_create();
      v13 = v24;
      v24 = v10;
      xpc_release(v13);
      xpc_release(v12);
      v20 = v24;
      if (v24)
        xpc_retain(v24);
      else
        v20 = xpc_null_create();
      v22 = a1;
      v23 = a2;
      sub_24BA388D0((uint64_t)&v22, &v20, &v21);
      xpc_release(v21);
      v21 = 0;
      xpc_release(v20);
      v20 = 0;
    }
    v14 = *a3;
    if (*a3 && MEMORY[0x24BD2CA88](*a3) == v8)
      xpc_retain(v14);
    else
      v14 = xpc_null_create();
    if (MEMORY[0x24BD2CA88](v14) == v8)
    {
      v22 = v14;
      if (v14)
        xpc_retain(v14);
      else
        v22 = xpc_null_create();
      sub_24BA5093C(v19, &v22, 0);
      xpc_release(v22);
      v22 = v14;
      if (v14)
        xpc_retain(v14);
      else
        v22 = xpc_null_create();
      if (MEMORY[0x24BD2CA88](v14) == v8)
        count = (void *)xpc_array_get_count(v14);
      else
        count = 0;
      sub_24BA5093C(v18, &v22, count);
      xpc_release(v22);
      sub_24BA50798(v19, v18, &v24);
      xpc_release(v18[0]);
      v18[0] = 0;
      xpc_release(v19[0]);
      v19[0] = 0;
    }
    else
    {
      xpc_array_append_value(v24, *a3);
    }
    xpc_release(v14);
    xpc_release(v24);
  }
  else
  {
    v11 = *a3;
    v16 = v11;
    if (v11)
      xpc_retain(v11);
    else
      v16 = xpc_null_create();
    v22 = a1;
    v23 = a2;
    sub_24BA33280((uint64_t)&v22, &v16, &object);
    xpc_release(object);
    object = 0;
    xpc_release(v16);
  }
}

void sub_24BA35478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, xpc_object_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  uint64_t v19;

  xpc_release(object);
  xpc_release(a14);
  xpc_release(v18);
  xpc_release(*(xpc_object_t *)(v19 - 56));
  _Unwind_Resume(a1);
}

xpc_object_t sMetricToXpcTransform(uint64_t *a1, uint64_t a2, const unsigned __int8 *a3)
{
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unsigned int v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  xpc_object_t v21;
  _QWORD v23[3];
  int v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int128 v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  __n128 object;
  uint64_t v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  xpc_object_t v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint64_t v41;

  v6 = xpc_null_create();
  if (a2 && a3)
  {
    v32[0] = 0;
    v32[1] = 0;
    v33 = 0;
    wis::GetProtobufTag(a2, a3, v32);
    v23[0] = 0;
    v23[1] = a2 + v32[0];
    v23[2] = a2 + v32[0] + (int)a3 - LODWORD(v32[0]);
    v24 = (_DWORD)a3 - LODWORD(v32[0]);
    v25 = 0;
    v26 = 0;
    v27 = (_DWORD)a3 - LODWORD(v32[0]);
    v28 = xmmword_24BA5DBB0;
    v29 = *MEMORY[0x24BEDD6F0];
    v30 = 0;
    v31 = 0;
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7 || (v7 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x24BD2CA88](v7) == MEMORY[0x24BDACFA0])
      {
        xpc_retain(v7);
        v8 = v7;
      }
      else
      {
        v8 = xpc_null_create();
      }
    }
    else
    {
      v8 = xpc_null_create();
      v7 = 0;
    }
    xpc_release(v7);
    if (v8)
    {
      xpc_retain(v8);
      v10 = v8;
    }
    else
    {
      v10 = xpc_null_create();
    }
    v11 = (std::__shared_weak_count *)a1[1];
    v36 = *a1;
    v37 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    v14 = v33;
    object.n128_u64[0] = (unint64_t)v10;
    if (v10)
      xpc_retain(v10);
    else
      object.n128_u64[0] = (unint64_t)xpc_null_create();
    sub_24BA38AC4(&v38, (void **)&object);
    xpc_release((xpc_object_t)object.n128_u64[0]);
    object.n128_u64[0] = 0;
    MetricFileMetadataHelper::MetricFileMetadataHelper((uint64_t)&v39, &v36, v14);
    v15 = v37;
    if (v37)
    {
      v16 = (unint64_t *)&v37->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    xpc_release(v10);
    while (!(_BYTE)v26)
    {
      object = 0uLL;
      v35 = 0xFFFFFFFFLL;
      sub_24BA33508((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v23, &object, (uint64_t)&v38);
    }
    sub_24BA387C4((uint64_t)&v41);
    v18 = v40;
    if (v40)
    {
      v19 = (unint64_t *)&v40->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    xpc_release(v38);
    v21 = xpc_null_create();
    xpc_release(v21);
    MEMORY[0x24BD2C524](v23);
    v9 = v6;
    v6 = v8;
  }
  else
  {
    v9 = xpc_null_create();
  }
  xpc_release(v9);
  return v6;
}

void sub_24BA357B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,xpc_object_t object)
{
  void *v27;
  void *v28;

  xpc_release(v28);
  MEMORY[0x24BD2C524](&a9);
  xpc_release(v27);
  _Unwind_Resume(a1);
}

uint64_t wis::GetProtobufTag@<X0>(uint64_t this@<X0>, const unsigned __int8 *a2@<X1>, _QWORD *a3@<X8>)
{
  int v3;
  unsigned __int8 *v5;
  unsigned int v6;
  void *exception;
  uint64_t v8;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (this)
  {
    v3 = this;
    v5 = (unsigned __int8 *)&a2[this];
    v8 = this;
    v6 = sub_24BA35948(&v8, &a2[this]);
    if ((v6 & 7) != 2)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24BD2C6B0](exception, &unk_24BA5D72A);
      __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
    }
    *((_DWORD *)a3 + 4) = v6 >> 3;
    this = sub_24BA35948(&v8, v5);
    *a3 = (v8 - v3);
    a3[1] = this;
  }
  return this;
}

void sub_24BA35910(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _QWORD *v16;
  void *v17;

  __cxa_free_exception(v17);
  __cxa_begin_catch(a1);
  v16[1] = 0;
  v16[2] = 0;
  *v16 = 0;
  __cxa_end_catch();
}

uint64_t sub_24BA35948(_QWORD *a1, _BYTE *a2)
{
  _BYTE *v2;
  _BYTE *v3;
  int v4;
  char v5;
  uint64_t result;
  void *exception;

  v2 = (_BYTE *)*a1;
  if ((_BYTE *)*a1 == a2)
    goto LABEL_11;
  v3 = (_BYTE *)*a1;
  while ((char)*v3 < 0)
  {
    if (++v3 == a2)
    {
      v3 = a2;
      break;
    }
  }
  if (v3 == a2)
  {
LABEL_11:
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24BD2C6B0](exception, &unk_24BA5D72A);
    __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
  }
  *a1 = v3 + 1;
  v4 = *v3 & 0x7F;
  if (v3 == v2)
    return *v3 & 0x7F;
  do
  {
    v5 = *--v3;
    result = v5 & 0x7F | (v4 << 7);
    v4 = v5 & 0x7F | (v4 << 7);
  }
  while (v3 != v2);
  return result;
}

void sub_24BA359F4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t MetricFileMetadataHelper::MetricFileMetadataHelper(uint64_t a1, _QWORD *a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t v6;
  __n128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)a1, a2);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(v5 + 80);
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(v5 + 96);
  v8 = *(__n128 *)(v5 + 80);
  v9 = *(_QWORD *)(v5 + 96);
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle((MetricFileMetadataHelper *)v5, &v8, a3, (uint64_t)&v10);
  v6 = v11;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v6;
  return a1;
}

{
  uint64_t v5;
  uint64_t v6;
  __n128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)a1, a2);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(v5 + 80);
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(v5 + 96);
  v8 = *(__n128 *)(v5 + 80);
  v9 = *(_QWORD *)(v5 + 96);
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle((MetricFileMetadataHelper *)v5, &v8, a3, (uint64_t)&v10);
  v6 = v11;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v6;
  return a1;
}

void sub_24BA35A84(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_24BA387C4(v1 + 40);
  sub_24BA3B304(v1);
  _Unwind_Resume(a1);
}

__n128 MetricFileMetadataHelper::MetricFileMetadataHelper(MetricFileMetadataHelper *a1, _QWORD *a2)
{
  __n128 *v2;
  __n128 result;

  MetricFileMetadataHelper::MetricFileMetadataHelper(a1, a2);
  result = v2[5];
  v2[1] = result;
  v2[2].n128_u64[0] = v2[6].n128_u64[0];
  return result;
}

{
  __n128 *v2;
  __n128 result;

  MetricFileMetadataHelper::MetricFileMetadataHelper(a1, a2);
  result = v2[5];
  v2[1] = result;
  v2[2].n128_u64[0] = v2[6].n128_u64[0];
  return result;
}

void MetricFileMetadataHelper::MetricFileMetadataHelper(MetricFileMetadataHelper *this, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a2[1];
  *(_QWORD *)this = *a2;
  *((_QWORD *)this + 1) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0xFFFFFFFFLL;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0xFFFFFFFFLL;
  *((_QWORD *)this + 2) = MetricFileMetadataHelper::getMetadataForComponent(this, 0);
  MetricFileMetadataHelper::setupMetricFileSentinel((__n128 *)this);
}

void sub_24BA35B50(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_24BA387C4(v2);
  sub_24BA3B304(v1);
  _Unwind_Resume(a1);
}

double MetricFileMetadataHelper::setupMetricFileSentinel(__n128 *this)
{
  unint64_t v2;
  double result;
  __n128 v4;
  unint64_t v5;
  __n128 v6;
  unint64_t v7;
  __n128 v8;
  unint64_t v9;
  __n128 v10;
  unint64_t v11;

  v8 = this[5];
  v9 = this[6].n128_u64[0];
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle((MetricFileMetadataHelper *)this, &v8, 0xFu, (uint64_t)&v10);
  v6 = v10;
  v7 = v11;
  v2 = v11;
  this[5] = v10;
  this[6].n128_u64[0] = v2;
  v4 = this[5];
  v5 = v2;
  MetadataHelper::descendIntoMessage((uint64_t)this, (MetadataHandle *)&v4, (uint64_t)&v10);
  result = v10.n128_f64[0];
  this[5] = v10;
  this[6].n128_u64[0] = v11;
  return result;
}

uint64_t MetricFileMetadataHelper::getSubfield(MetricFileMetadataHelper *a1, __n128 *a2, unsigned int a3)
{
  __n128 v4;
  unint64_t v5;
  _BYTE v6[24];
  uint64_t v7;

  v4 = *a2;
  v5 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle(a1, &v4, a3, (uint64_t)v6);
  return v7;
}

void sub_24BA35C2C(uint64_t a1)
{
  sub_24BA35C50(a1);
  JUMPOUT(0x24BD2C8A8);
}

void sub_24BA35C50(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;

  *(_QWORD *)a1 = &off_251CCBF80;
  v4 = *(_QWORD *)(a1 + 32);
  v2 = (_QWORD *)(a1 + 32);
  v3 = v4;
  *v2 = 0;
  if (v4)
    sub_24BA395F0((uint64_t)v2, v3);
  v5 = (void **)(a1 + 8);
  sub_24BA39574(&v5);
  PB::Base::~Base((PB::Base *)a1);
}

void sub_24BA35CA8(PB::Base *a1)
{
  sub_24BA35CCC(a1);
  JUMPOUT(0x24BD2C8A8);
}

void sub_24BA35CCC(PB::Base *this)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &off_251CCCF48;
  v4 = *((_QWORD *)this + 1);
  v2 = (_QWORD *)((char *)this + 8);
  v3 = v4;
  *v2 = 0;
  if (v4)
    sub_24BA395F0((uint64_t)v2, v3);
  PB::Base::~Base(this);
}

void sub_24BA35D08(uint64_t a1)
{
  sub_24BA35D2C(a1);
  JUMPOUT(0x24BD2C8A8);
}

void sub_24BA35D2C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;

  *(_QWORD *)a1 = &off_251CCD530;
  v4 = *(_QWORD *)(a1 + 32);
  v2 = (_QWORD *)(a1 + 32);
  v3 = v4;
  *v2 = 0;
  if (v4)
    sub_24BA395F0((uint64_t)v2, v3);
  v5 = (void **)(a1 + 8);
  sub_24BA39574(&v5);
  PB::Base::~Base((PB::Base *)a1);
}

void sub_24BA35D84(PB::Base *a1)
{
  sub_24BA35DA8(a1);
  JUMPOUT(0x24BD2C8A8);
}

void sub_24BA35DA8(PB::Base *this)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &off_251CCD3D8;
  v4 = *((_QWORD *)this + 1);
  v2 = (_QWORD *)((char *)this + 8);
  v3 = v4;
  *v2 = 0;
  if (v4)
    sub_24BA395F0((uint64_t)v2, v3);
  PB::Base::~Base(this);
}

uint64_t sub_24BA35DE4(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t **v9;
  uint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  char v17;
  unsigned int v18;
  unint64_t v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t **)(a1 + 8);
    v9 = (uint64_t **)(a1 + 32);
    do
    {
      v10 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v17 = 0;
        v18 = 0;
        v13 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v19 = v2 + 1;
          v20 = *(_BYTE *)(v10 + v2);
          *((_QWORD *)this + 1) = v19;
          v13 |= (unint64_t)(v20 & 0x7F) << v17;
          if ((v20 & 0x80) == 0)
            goto LABEL_21;
          v17 += 7;
          v2 = v19;
          if (v18++ >= 9)
          {
LABEL_20:
            v13 = 0;
            goto LABEL_21;
          }
        }
        v4 = 1;
        *((_BYTE *)this + 24) = 1;
        return v4 == 0;
      }
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v15 = *(_BYTE *)(v10 + v2);
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0)
          break;
        v11 += 7;
        v2 = v14;
        if (v12++ > 8)
          goto LABEL_20;
      }
LABEL_21:
      if ((v13 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v13 >> 3) == 2)
      {
        sub_24BA36EA8(v8);
        v22 = *(_QWORD *)(a1 + 16);
      }
      else
      {
        if ((v13 >> 3) != 1)
        {
          result = PB::Reader::skip(this);
          if (!(_DWORD)result)
            return result;
          goto LABEL_30;
        }
        sub_24BA35FA8(v9);
        v22 = *(_QWORD *)(a1 + 40);
      }
      v23 = *(_QWORD *)(v22 - 8);
      if (!PB::Reader::placeMark()
        || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v23 + 16))(v23, this) & 1) == 0)
      {
        return 0;
      }
      PB::Reader::recallMark();
LABEL_30:
      v2 = *((_QWORD *)this + 1);
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
    }
    while (v2 < v3 && !*((_BYTE *)this + 24));
  }
  return v4 == 0;
}

uint64_t sub_24BA35FA8(uint64_t **a1)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t *v12;
  char *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  int64x2_t v17;
  uint64_t *v18;
  uint64_t v19;
  int64x2_t v20;
  char *v21;
  _QWORD *v22;

  v2 = operator new();
  sub_24BA360F0(v2);
  result = (uint64_t)(a1 + 2);
  v4 = (unint64_t)a1[2];
  v5 = a1[1];
  if ((unint64_t)v5 >= v4)
  {
    v7 = v5 - *a1;
    if ((unint64_t)(v7 + 1) >> 61)
      sub_24BA39774();
    v8 = v4 - (_QWORD)*a1;
    v9 = v8 >> 2;
    if (v8 >> 2 <= (unint64_t)(v7 + 1))
      v9 = v7 + 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v10 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    v22 = a1 + 2;
    if (v10)
      v11 = (char *)sub_24BA39788(result, v10);
    else
      v11 = 0;
    v12 = (uint64_t *)&v11[8 * v7];
    v13 = &v11[8 * v10];
    v21 = v13;
    *v12 = v2;
    v6 = v12 + 1;
    v20.i64[1] = (uint64_t)(v12 + 1);
    v15 = *a1;
    v14 = a1[1];
    if (v14 == *a1)
    {
      v17 = vdupq_n_s64((unint64_t)v14);
    }
    else
    {
      do
      {
        v16 = *--v14;
        *v14 = 0;
        *--v12 = v16;
      }
      while (v14 != v15);
      v17 = *(int64x2_t *)a1;
      v6 = (uint64_t *)v20.i64[1];
      v13 = v21;
    }
    *a1 = v12;
    a1[1] = v6;
    v20 = v17;
    v18 = a1[2];
    a1[2] = (uint64_t *)v13;
    v21 = (char *)v18;
    v19 = v17.i64[0];
    result = sub_24BA36E48((uint64_t)&v19);
  }
  else
  {
    *v5 = v2;
    v6 = v5 + 1;
  }
  a1[1] = v6;
  return result;
}

void sub_24BA360D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

double sub_24BA360F0(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = &off_251CCD530;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  return result;
}

uint64_t sub_24BA3610C(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  char v17;
  unsigned int v18;
  unint64_t v19;
  char v20;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t **)(a1 + 8);
    v9 = (uint64_t *)(a1 + 32);
    while (1)
    {
      v10 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v15 = *(_BYTE *)(v10 + v2);
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0)
          break;
        v11 += 7;
        v2 = v14;
        if (v12++ > 8)
          goto LABEL_20;
      }
LABEL_21:
      if ((v13 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v13 >> 3) == 2)
      {
        sub_24BA36CDC(v8);
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 16) - 8);
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v25 + 16))(v25, this) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        v22 = (_QWORD *)operator new();
        v22[1] = 0;
        v22[2] = 0;
        *v22 = 0;
        v27 = 0;
        v23 = *v9;
        *v9 = (uint64_t)v22;
        if (v23)
        {
          sub_24BA395F0((uint64_t)v9, v23);
          v24 = v27;
          v27 = 0;
          if (v24)
            sub_24BA395F0((uint64_t)&v27, v24);
        }
        PB::Reader::read();
      }
      else
      {
        result = PB::Reader::skip(this);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)this + 1);
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v17 = 0;
    v18 = 0;
    v13 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v19 = v2 + 1;
      v20 = *(_BYTE *)(v10 + v2);
      *((_QWORD *)this + 1) = v19;
      v13 |= (unint64_t)(v20 & 0x7F) << v17;
      if ((v20 & 0x80) == 0)
        goto LABEL_21;
      v17 += 7;
      v2 = v19;
      if (v18++ >= 9)
      {
LABEL_20:
        v13 = 0;
        goto LABEL_21;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_24BA3631C(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  BOOL v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  BOOL v48;
  unint64_t v49;
  unint64_t v50;
  int v51;
  BOOL v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  char v96;
  unsigned int v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  char v101;
  unsigned int v102;
  unint64_t v103;
  char v104;
  char v105;
  unsigned int v106;
  unint64_t v107;
  char v108;
  char v109;
  unsigned int v110;
  unint64_t v111;
  char v112;
  char v113;
  unsigned int v114;
  unint64_t v115;
  char v116;
  char v117;
  unsigned int v118;
  unint64_t v119;
  char v120;
  char v121;
  unsigned int v122;
  unint64_t v123;
  char v124;
  char v125;
  unsigned int v126;
  unint64_t v127;
  char v128;
  char v129;
  unsigned int v130;
  unint64_t v131;
  char v132;
  uint64_t v134;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t *)(a1 + 8);
    while (1)
    {
      v9 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v12 >> 3))
      {
        case 1u:
          *(_WORD *)(a1 + 52) |= 0x40u;
          v21 = *((_QWORD *)this + 1);
          v22 = *((_QWORD *)this + 2);
          v23 = *(_QWORD *)this;
          if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v22)
          {
            v101 = 0;
            v102 = 0;
            v26 = 0;
            if (v22 <= v21)
              v22 = *((_QWORD *)this + 1);
            do
            {
              if (v22 == v21)
              {
                LODWORD(v26) = 0;
                *((_BYTE *)this + 24) = 1;
                goto LABEL_156;
              }
              v103 = v21 + 1;
              v104 = *(_BYTE *)(v23 + v21);
              *((_QWORD *)this + 1) = v103;
              v26 |= (unint64_t)(v104 & 0x7F) << v101;
              if ((v104 & 0x80) == 0)
              {
                if (*((_BYTE *)this + 24))
                  LODWORD(v26) = 0;
                goto LABEL_156;
              }
              v101 += 7;
              v21 = v103;
              v15 = v102++ > 8;
            }
            while (!v15);
LABEL_97:
            LODWORD(v26) = 0;
          }
          else
          {
            v24 = 0;
            v25 = 0;
            v26 = 0;
            while (1)
            {
              v27 = v21 + 1;
              *((_QWORD *)this + 1) = v21 + 1;
              v28 = *(_BYTE *)(v23 + v21);
              v26 |= (unint64_t)(v28 & 0x7F) << v24;
              if ((v28 & 0x80) == 0)
                break;
              v24 += 7;
              v21 = v27;
              v15 = v25++ > 8;
              if (v15)
                goto LABEL_97;
            }
          }
LABEL_156:
          *(_DWORD *)(a1 + 40) = v26;
          goto LABEL_185;
        case 2u:
          *(_WORD *)(a1 + 52) |= 0x80u;
          v30 = *((_QWORD *)this + 1);
          v31 = *((_QWORD *)this + 2);
          v32 = *(_QWORD *)this;
          if (v30 <= 0xFFFFFFFFFFFFFFF5 && v30 + 10 <= v31)
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            do
            {
              v36 = v30 + 1;
              *((_QWORD *)this + 1) = v30 + 1;
              v37 = *(_BYTE *)(v32 + v30);
              v35 |= (unint64_t)(v37 & 0x7F) << v33;
              if ((v37 & 0x80) == 0)
                goto LABEL_160;
              v33 += 7;
              v30 = v36;
              v15 = v34++ > 8;
            }
            while (!v15);
LABEL_104:
            LODWORD(v35) = 0;
            goto LABEL_160;
          }
          v105 = 0;
          v106 = 0;
          v35 = 0;
          if (v31 <= v30)
            v31 = *((_QWORD *)this + 1);
          while (2)
          {
            if (v31 == v30)
            {
              LODWORD(v35) = 0;
              *((_BYTE *)this + 24) = 1;
            }
            else
            {
              v107 = v30 + 1;
              v108 = *(_BYTE *)(v32 + v30);
              *((_QWORD *)this + 1) = v107;
              v35 |= (unint64_t)(v108 & 0x7F) << v105;
              if (v108 < 0)
              {
                v105 += 7;
                v30 = v107;
                v15 = v106++ > 8;
                if (v15)
                  goto LABEL_104;
                continue;
              }
              if (*((_BYTE *)this + 24))
                LODWORD(v35) = 0;
            }
            break;
          }
LABEL_160:
          *(_DWORD *)(a1 + 44) = v35;
          goto LABEL_185;
        case 3u:
          *(_WORD *)(a1 + 52) |= 0x400u;
          v38 = *((_QWORD *)this + 1);
          if (v38 >= *((_QWORD *)this + 2))
          {
            v41 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v39 = v38 + 1;
            v40 = *(unsigned __int8 *)(*(_QWORD *)this + v38);
            *((_QWORD *)this + 1) = v39;
            v41 = v40 != 0;
          }
          *(_BYTE *)(a1 + 50) = v41;
          goto LABEL_185;
        case 4u:
          v42 = (_QWORD *)operator new();
          v42[1] = 0;
          v42[2] = 0;
          *v42 = 0;
          v134 = 0;
          v43 = *v8;
          *v8 = (uint64_t)v42;
          if (v43)
          {
            sub_24BA395F0((uint64_t)v8, v43);
            v44 = v134;
            v134 = 0;
            if (v44)
              sub_24BA395F0((uint64_t)&v134, v44);
          }
          PB::Reader::read();
          goto LABEL_185;
        case 5u:
          *(_WORD *)(a1 + 52) |= 0x200u;
          v45 = *((_QWORD *)this + 1);
          if (v45 >= *((_QWORD *)this + 2))
          {
            v48 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v46 = v45 + 1;
            v47 = *(unsigned __int8 *)(*(_QWORD *)this + v45);
            *((_QWORD *)this + 1) = v46;
            v48 = v47 != 0;
          }
          *(_BYTE *)(a1 + 49) = v48;
          goto LABEL_185;
        case 6u:
          *(_WORD *)(a1 + 52) |= 0x100u;
          v49 = *((_QWORD *)this + 1);
          if (v49 >= *((_QWORD *)this + 2))
          {
            v52 = 0;
            *((_BYTE *)this + 24) = 1;
          }
          else
          {
            v50 = v49 + 1;
            v51 = *(unsigned __int8 *)(*(_QWORD *)this + v49);
            *((_QWORD *)this + 1) = v50;
            v52 = v51 != 0;
          }
          *(_BYTE *)(a1 + 48) = v52;
          goto LABEL_185;
        case 7u:
          *(_WORD *)(a1 + 52) |= 2u;
          v53 = *((_QWORD *)this + 1);
          v54 = *((_QWORD *)this + 2);
          v55 = *(_QWORD *)this;
          if (v53 <= 0xFFFFFFFFFFFFFFF5 && v53 + 10 <= v54)
          {
            v56 = 0;
            v57 = 0;
            v58 = 0;
            do
            {
              v59 = v53 + 1;
              *((_QWORD *)this + 1) = v53 + 1;
              v60 = *(_BYTE *)(v55 + v53);
              v58 |= (unint64_t)(v60 & 0x7F) << v56;
              if ((v60 & 0x80) == 0)
                goto LABEL_164;
              v56 += 7;
              v53 = v59;
              v15 = v57++ > 8;
            }
            while (!v15);
LABEL_117:
            LODWORD(v58) = 0;
            goto LABEL_164;
          }
          v109 = 0;
          v110 = 0;
          v58 = 0;
          if (v54 <= v53)
            v54 = *((_QWORD *)this + 1);
          while (2)
          {
            if (v54 == v53)
            {
              LODWORD(v58) = 0;
              *((_BYTE *)this + 24) = 1;
            }
            else
            {
              v111 = v53 + 1;
              v112 = *(_BYTE *)(v55 + v53);
              *((_QWORD *)this + 1) = v111;
              v58 |= (unint64_t)(v112 & 0x7F) << v109;
              if (v112 < 0)
              {
                v109 += 7;
                v53 = v111;
                v15 = v110++ > 8;
                if (v15)
                  goto LABEL_117;
                continue;
              }
              if (*((_BYTE *)this + 24))
                LODWORD(v58) = 0;
            }
            break;
          }
LABEL_164:
          *(_DWORD *)(a1 + 20) = v58;
          goto LABEL_185;
        case 8u:
          *(_WORD *)(a1 + 52) |= 1u;
          v61 = *((_QWORD *)this + 1);
          v62 = *((_QWORD *)this + 2);
          v63 = *(_QWORD *)this;
          if (v61 <= 0xFFFFFFFFFFFFFFF5 && v61 + 10 <= v62)
          {
            v64 = 0;
            v65 = 0;
            v66 = 0;
            do
            {
              v67 = v61 + 1;
              *((_QWORD *)this + 1) = v61 + 1;
              v68 = *(_BYTE *)(v63 + v61);
              v66 |= (unint64_t)(v68 & 0x7F) << v64;
              if ((v68 & 0x80) == 0)
                goto LABEL_168;
              v64 += 7;
              v61 = v67;
              v15 = v65++ > 8;
            }
            while (!v15);
LABEL_124:
            LODWORD(v66) = 0;
            goto LABEL_168;
          }
          v113 = 0;
          v114 = 0;
          v66 = 0;
          if (v62 <= v61)
            v62 = *((_QWORD *)this + 1);
          while (2)
          {
            if (v62 == v61)
            {
              LODWORD(v66) = 0;
              *((_BYTE *)this + 24) = 1;
            }
            else
            {
              v115 = v61 + 1;
              v116 = *(_BYTE *)(v63 + v61);
              *((_QWORD *)this + 1) = v115;
              v66 |= (unint64_t)(v116 & 0x7F) << v113;
              if (v116 < 0)
              {
                v113 += 7;
                v61 = v115;
                v15 = v114++ > 8;
                if (v15)
                  goto LABEL_124;
                continue;
              }
              if (*((_BYTE *)this + 24))
                LODWORD(v66) = 0;
            }
            break;
          }
LABEL_168:
          *(_DWORD *)(a1 + 16) = v66;
          goto LABEL_185;
        case 9u:
          *(_WORD *)(a1 + 52) |= 0x20u;
          v69 = *((_QWORD *)this + 1);
          v70 = *((_QWORD *)this + 2);
          v71 = *(_QWORD *)this;
          if (v69 <= 0xFFFFFFFFFFFFFFF5 && v69 + 10 <= v70)
          {
            v72 = 0;
            v73 = 0;
            v74 = 0;
            do
            {
              v75 = v69 + 1;
              *((_QWORD *)this + 1) = v69 + 1;
              v76 = *(_BYTE *)(v71 + v69);
              v74 |= (unint64_t)(v76 & 0x7F) << v72;
              if ((v76 & 0x80) == 0)
                goto LABEL_172;
              v72 += 7;
              v69 = v75;
              v15 = v73++ > 8;
            }
            while (!v15);
LABEL_131:
            LODWORD(v74) = 0;
            goto LABEL_172;
          }
          v117 = 0;
          v118 = 0;
          v74 = 0;
          if (v70 <= v69)
            v70 = *((_QWORD *)this + 1);
          while (2)
          {
            if (v70 == v69)
            {
              LODWORD(v74) = 0;
              *((_BYTE *)this + 24) = 1;
            }
            else
            {
              v119 = v69 + 1;
              v120 = *(_BYTE *)(v71 + v69);
              *((_QWORD *)this + 1) = v119;
              v74 |= (unint64_t)(v120 & 0x7F) << v117;
              if (v120 < 0)
              {
                v117 += 7;
                v69 = v119;
                v15 = v118++ > 8;
                if (v15)
                  goto LABEL_131;
                continue;
              }
              if (*((_BYTE *)this + 24))
                LODWORD(v74) = 0;
            }
            break;
          }
LABEL_172:
          *(_DWORD *)(a1 + 36) = v74;
          goto LABEL_185;
        case 0xAu:
          *(_WORD *)(a1 + 52) |= 0x10u;
          v77 = *((_QWORD *)this + 1);
          v78 = *((_QWORD *)this + 2);
          v79 = *(_QWORD *)this;
          if (v77 <= 0xFFFFFFFFFFFFFFF5 && v77 + 10 <= v78)
          {
            v80 = 0;
            v81 = 0;
            v82 = 0;
            do
            {
              v83 = v77 + 1;
              *((_QWORD *)this + 1) = v77 + 1;
              v84 = *(_BYTE *)(v79 + v77);
              v82 |= (unint64_t)(v84 & 0x7F) << v80;
              if ((v84 & 0x80) == 0)
                goto LABEL_176;
              v80 += 7;
              v77 = v83;
              v15 = v81++ > 8;
            }
            while (!v15);
LABEL_138:
            LODWORD(v82) = 0;
            goto LABEL_176;
          }
          v121 = 0;
          v122 = 0;
          v82 = 0;
          if (v78 <= v77)
            v78 = *((_QWORD *)this + 1);
          while (2)
          {
            if (v78 == v77)
            {
              LODWORD(v82) = 0;
              *((_BYTE *)this + 24) = 1;
            }
            else
            {
              v123 = v77 + 1;
              v124 = *(_BYTE *)(v79 + v77);
              *((_QWORD *)this + 1) = v123;
              v82 |= (unint64_t)(v124 & 0x7F) << v121;
              if (v124 < 0)
              {
                v121 += 7;
                v77 = v123;
                v15 = v122++ > 8;
                if (v15)
                  goto LABEL_138;
                continue;
              }
              if (*((_BYTE *)this + 24))
                LODWORD(v82) = 0;
            }
            break;
          }
LABEL_176:
          *(_DWORD *)(a1 + 32) = v82;
          goto LABEL_185;
        case 0xBu:
          *(_WORD *)(a1 + 52) |= 8u;
          v85 = *((_QWORD *)this + 1);
          v86 = *((_QWORD *)this + 2);
          v87 = *(_QWORD *)this;
          if (v85 <= 0xFFFFFFFFFFFFFFF5 && v85 + 10 <= v86)
          {
            v88 = 0;
            v89 = 0;
            v90 = 0;
            do
            {
              v91 = v85 + 1;
              *((_QWORD *)this + 1) = v85 + 1;
              v92 = *(_BYTE *)(v87 + v85);
              v90 |= (unint64_t)(v92 & 0x7F) << v88;
              if ((v92 & 0x80) == 0)
                goto LABEL_180;
              v88 += 7;
              v85 = v91;
              v15 = v89++ > 8;
            }
            while (!v15);
LABEL_145:
            LODWORD(v90) = 0;
            goto LABEL_180;
          }
          v125 = 0;
          v126 = 0;
          v90 = 0;
          if (v86 <= v85)
            v86 = *((_QWORD *)this + 1);
          while (2)
          {
            if (v86 == v85)
            {
              LODWORD(v90) = 0;
              *((_BYTE *)this + 24) = 1;
            }
            else
            {
              v127 = v85 + 1;
              v128 = *(_BYTE *)(v87 + v85);
              *((_QWORD *)this + 1) = v127;
              v90 |= (unint64_t)(v128 & 0x7F) << v125;
              if (v128 < 0)
              {
                v125 += 7;
                v85 = v127;
                v15 = v126++ > 8;
                if (v15)
                  goto LABEL_145;
                continue;
              }
              if (*((_BYTE *)this + 24))
                LODWORD(v90) = 0;
            }
            break;
          }
LABEL_180:
          *(_DWORD *)(a1 + 28) = v90;
          goto LABEL_185;
        case 0xCu:
          *(_WORD *)(a1 + 52) |= 4u;
          v93 = *((_QWORD *)this + 1);
          v94 = *((_QWORD *)this + 2);
          v95 = *(_QWORD *)this;
          if (v93 <= 0xFFFFFFFFFFFFFFF5 && v93 + 10 <= v94)
          {
            v96 = 0;
            v97 = 0;
            v98 = 0;
            do
            {
              v99 = v93 + 1;
              *((_QWORD *)this + 1) = v93 + 1;
              v100 = *(_BYTE *)(v95 + v93);
              v98 |= (unint64_t)(v100 & 0x7F) << v96;
              if ((v100 & 0x80) == 0)
                goto LABEL_184;
              v96 += 7;
              v93 = v99;
              v15 = v97++ > 8;
            }
            while (!v15);
LABEL_152:
            LODWORD(v98) = 0;
            goto LABEL_184;
          }
          v129 = 0;
          v130 = 0;
          v98 = 0;
          if (v94 <= v93)
            v94 = *((_QWORD *)this + 1);
          break;
        default:
          result = PB::Reader::skip(this);
          if (!(_DWORD)result)
            return result;
          goto LABEL_185;
      }
      while (1)
      {
        if (v94 == v93)
        {
          LODWORD(v98) = 0;
          *((_BYTE *)this + 24) = 1;
          goto LABEL_184;
        }
        v131 = v93 + 1;
        v132 = *(_BYTE *)(v95 + v93);
        *((_QWORD *)this + 1) = v131;
        v98 |= (unint64_t)(v132 & 0x7F) << v129;
        if ((v132 & 0x80) == 0)
          break;
        v129 += 7;
        v93 = v131;
        v15 = v130++ > 8;
        if (v15)
          goto LABEL_152;
      }
      if (*((_BYTE *)this + 24))
        LODWORD(v98) = 0;
LABEL_184:
      *(_DWORD *)(a1 + 24) = v98;
LABEL_185:
      v2 = *((_QWORD *)this + 1);
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)this + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_21;
      v16 += 7;
      v2 = v18;
      if (v17++ >= 9)
      {
LABEL_20:
        v12 = 0;
        goto LABEL_21;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_24BA36CDC(uint64_t **a1)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t *v12;
  char *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  int64x2_t v17;
  uint64_t *v18;
  uint64_t v19;
  int64x2_t v20;
  char *v21;
  _QWORD *v22;

  v2 = operator new();
  sub_24BA36E24(v2);
  result = (uint64_t)(a1 + 2);
  v4 = (unint64_t)a1[2];
  v5 = a1[1];
  if ((unint64_t)v5 >= v4)
  {
    v7 = v5 - *a1;
    if ((unint64_t)(v7 + 1) >> 61)
      sub_24BA39774();
    v8 = v4 - (_QWORD)*a1;
    v9 = v8 >> 2;
    if (v8 >> 2 <= (unint64_t)(v7 + 1))
      v9 = v7 + 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v10 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    v22 = a1 + 2;
    if (v10)
      v11 = (char *)sub_24BA39788(result, v10);
    else
      v11 = 0;
    v12 = (uint64_t *)&v11[8 * v7];
    v13 = &v11[8 * v10];
    v21 = v13;
    *v12 = v2;
    v6 = v12 + 1;
    v20.i64[1] = (uint64_t)(v12 + 1);
    v15 = *a1;
    v14 = a1[1];
    if (v14 == *a1)
    {
      v17 = vdupq_n_s64((unint64_t)v14);
    }
    else
    {
      do
      {
        v16 = *--v14;
        *v14 = 0;
        *--v12 = v16;
      }
      while (v14 != v15);
      v17 = *(int64x2_t *)a1;
      v6 = (uint64_t *)v20.i64[1];
      v13 = v21;
    }
    *a1 = v12;
    a1[1] = v6;
    v20 = v17;
    v18 = a1[2];
    a1[2] = (uint64_t *)v13;
    v21 = (char *)v18;
    v19 = v17.i64[0];
    result = sub_24BA36E48((uint64_t)&v19);
  }
  else
  {
    *v5 = v2;
    v6 = v5 + 1;
  }
  a1[1] = v6;
  return result;
}

void sub_24BA36E08(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

double sub_24BA36E24(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = &off_251CCD3D8;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)&result = 0x100000001;
  *(_QWORD *)(a1 + 32) = 0x100000001;
  *(_DWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 52) = 0;
  return result;
}

uint64_t sub_24BA36E48(uint64_t a1)
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

uint64_t sub_24BA36EA8(uint64_t **a1)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t *v12;
  char *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  int64x2_t v17;
  uint64_t *v18;
  uint64_t v19;
  int64x2_t v20;
  char *v21;
  _QWORD *v22;

  v2 = operator new();
  sub_24BA36FF0(v2);
  result = (uint64_t)(a1 + 2);
  v4 = (unint64_t)a1[2];
  v5 = a1[1];
  if ((unint64_t)v5 >= v4)
  {
    v7 = v5 - *a1;
    if ((unint64_t)(v7 + 1) >> 61)
      sub_24BA39774();
    v8 = v4 - (_QWORD)*a1;
    v9 = v8 >> 2;
    if (v8 >> 2 <= (unint64_t)(v7 + 1))
      v9 = v7 + 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v10 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    v22 = a1 + 2;
    if (v10)
      v11 = (char *)sub_24BA39788(result, v10);
    else
      v11 = 0;
    v12 = (uint64_t *)&v11[8 * v7];
    v13 = &v11[8 * v10];
    v21 = v13;
    *v12 = v2;
    v6 = v12 + 1;
    v20.i64[1] = (uint64_t)(v12 + 1);
    v15 = *a1;
    v14 = a1[1];
    if (v14 == *a1)
    {
      v17 = vdupq_n_s64((unint64_t)v14);
    }
    else
    {
      do
      {
        v16 = *--v14;
        *v14 = 0;
        *--v12 = v16;
      }
      while (v14 != v15);
      v17 = *(int64x2_t *)a1;
      v6 = (uint64_t *)v20.i64[1];
      v13 = v21;
    }
    *a1 = v12;
    a1[1] = v6;
    v20 = v17;
    v18 = a1[2];
    a1[2] = (uint64_t *)v13;
    v21 = (char *)v18;
    v19 = v17.i64[0];
    result = sub_24BA36E48((uint64_t)&v19);
  }
  else
  {
    *v5 = v2;
    v6 = v5 + 1;
  }
  a1[1] = v6;
  return result;
}

void sub_24BA36FD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

double sub_24BA36FF0(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = &off_251CCBF80;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  return result;
}

uint64_t sub_24BA3700C(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  char v17;
  unsigned int v18;
  unint64_t v19;
  char v20;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t **)(a1 + 8);
    v9 = (uint64_t *)(a1 + 32);
    while (1)
    {
      v10 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v15 = *(_BYTE *)(v10 + v2);
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0)
          break;
        v11 += 7;
        v2 = v14;
        if (v12++ > 8)
          goto LABEL_20;
      }
LABEL_21:
      if ((v13 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v13 >> 3) == 2)
      {
        sub_24BA3721C(v8);
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 16) - 8);
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v25 + 16))(v25, this) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else if ((v13 >> 3) == 1)
      {
        v22 = (_QWORD *)operator new();
        v22[1] = 0;
        v22[2] = 0;
        *v22 = 0;
        v27 = 0;
        v23 = *v9;
        *v9 = (uint64_t)v22;
        if (v23)
        {
          sub_24BA395F0((uint64_t)v9, v23);
          v24 = v27;
          v27 = 0;
          if (v24)
            sub_24BA395F0((uint64_t)&v27, v24);
        }
        PB::Reader::read();
      }
      else
      {
        result = PB::Reader::skip(this);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)this + 1);
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v17 = 0;
    v18 = 0;
    v13 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v19 = v2 + 1;
      v20 = *(_BYTE *)(v10 + v2);
      *((_QWORD *)this + 1) = v19;
      v13 |= (unint64_t)(v20 & 0x7F) << v17;
      if ((v20 & 0x80) == 0)
        goto LABEL_21;
      v17 += 7;
      v2 = v19;
      if (v18++ >= 9)
      {
LABEL_20:
        v13 = 0;
        goto LABEL_21;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_24BA3721C(uint64_t **a1)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t *v12;
  char *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  int64x2_t v17;
  uint64_t *v18;
  uint64_t v19;
  int64x2_t v20;
  char *v21;
  _QWORD *v22;

  v2 = operator new();
  sub_24BA37364(v2);
  result = (uint64_t)(a1 + 2);
  v4 = (unint64_t)a1[2];
  v5 = a1[1];
  if ((unint64_t)v5 >= v4)
  {
    v7 = v5 - *a1;
    if ((unint64_t)(v7 + 1) >> 61)
      sub_24BA39774();
    v8 = v4 - (_QWORD)*a1;
    v9 = v8 >> 2;
    if (v8 >> 2 <= (unint64_t)(v7 + 1))
      v9 = v7 + 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v10 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    v22 = a1 + 2;
    if (v10)
      v11 = (char *)sub_24BA39788(result, v10);
    else
      v11 = 0;
    v12 = (uint64_t *)&v11[8 * v7];
    v13 = &v11[8 * v10];
    v21 = v13;
    *v12 = v2;
    v6 = v12 + 1;
    v20.i64[1] = (uint64_t)(v12 + 1);
    v15 = *a1;
    v14 = a1[1];
    if (v14 == *a1)
    {
      v17 = vdupq_n_s64((unint64_t)v14);
    }
    else
    {
      do
      {
        v16 = *--v14;
        *v14 = 0;
        *--v12 = v16;
      }
      while (v14 != v15);
      v17 = *(int64x2_t *)a1;
      v6 = (uint64_t *)v20.i64[1];
      v13 = v21;
    }
    *a1 = v12;
    a1[1] = v6;
    v20 = v17;
    v18 = a1[2];
    a1[2] = (uint64_t *)v13;
    v21 = (char *)v18;
    v19 = v17.i64[0];
    result = sub_24BA36E48((uint64_t)&v19);
  }
  else
  {
    *v5 = v2;
    v6 = v5 + 1;
  }
  a1[1] = v6;
  return result;
}

void sub_24BA37348(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA37364(uint64_t result)
{
  *(_QWORD *)result = &off_251CCCF48;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 32) = 0;
  return result;
}

uint64_t sub_24BA37378(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t result;
  char v42;
  unsigned int v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  unint64_t v48;
  char v49;
  uint64_t v51;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t *)(a1 + 8);
    while (1)
    {
      v9 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v21 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 32) |= 1u;
        v25 = *((_QWORD *)this + 1);
        v26 = *((_QWORD *)this + 2);
        v27 = *(_QWORD *)this;
        if (v25 > 0xFFFFFFFFFFFFFFF5 || v25 + 10 > v26)
        {
          v42 = 0;
          v43 = 0;
          v30 = 0;
          if (v26 <= v25)
            v26 = *((_QWORD *)this + 1);
          while (1)
          {
            if (v26 == v25)
            {
              v30 = 0;
              *((_BYTE *)this + 24) = 1;
              goto LABEL_62;
            }
            v44 = v25 + 1;
            v45 = *(_BYTE *)(v27 + v25);
            *((_QWORD *)this + 1) = v44;
            v30 |= (unint64_t)(v45 & 0x7F) << v42;
            if ((v45 & 0x80) == 0)
              break;
            v42 += 7;
            v25 = v44;
            v15 = v43++ > 8;
            if (v15)
            {
LABEL_51:
              v30 = 0;
              goto LABEL_62;
            }
          }
          if (*((_BYTE *)this + 24))
            v30 = 0;
        }
        else
        {
          v28 = 0;
          v29 = 0;
          v30 = 0;
          while (1)
          {
            v31 = v25 + 1;
            *((_QWORD *)this + 1) = v25 + 1;
            v32 = *(_BYTE *)(v27 + v25);
            v30 |= (unint64_t)(v32 & 0x7F) << v28;
            if ((v32 & 0x80) == 0)
              break;
            v28 += 7;
            v25 = v31;
            v15 = v29++ > 8;
            if (v15)
              goto LABEL_51;
          }
        }
LABEL_62:
        *(_QWORD *)(a1 + 16) = v30;
      }
      else if ((_DWORD)v21 == 2)
      {
        *(_BYTE *)(a1 + 32) |= 2u;
        v33 = *((_QWORD *)this + 1);
        v34 = *((_QWORD *)this + 2);
        v35 = *(_QWORD *)this;
        if (v33 > 0xFFFFFFFFFFFFFFF5 || v33 + 10 > v34)
        {
          v46 = 0;
          v47 = 0;
          v38 = 0;
          if (v34 <= v33)
            v34 = *((_QWORD *)this + 1);
          while (1)
          {
            if (v34 == v33)
            {
              v38 = 0;
              *((_BYTE *)this + 24) = 1;
              goto LABEL_66;
            }
            v48 = v33 + 1;
            v49 = *(_BYTE *)(v35 + v33);
            *((_QWORD *)this + 1) = v48;
            v38 |= (unint64_t)(v49 & 0x7F) << v46;
            if ((v49 & 0x80) == 0)
              break;
            v46 += 7;
            v33 = v48;
            v15 = v47++ > 8;
            if (v15)
            {
LABEL_58:
              v38 = 0;
              goto LABEL_66;
            }
          }
          if (*((_BYTE *)this + 24))
            v38 = 0;
        }
        else
        {
          v36 = 0;
          v37 = 0;
          v38 = 0;
          while (1)
          {
            v39 = v33 + 1;
            *((_QWORD *)this + 1) = v33 + 1;
            v40 = *(_BYTE *)(v35 + v33);
            v38 |= (unint64_t)(v40 & 0x7F) << v36;
            if ((v40 & 0x80) == 0)
              break;
            v36 += 7;
            v33 = v39;
            v15 = v37++ > 8;
            if (v15)
              goto LABEL_58;
          }
        }
LABEL_66:
        *(_QWORD *)(a1 + 24) = v38;
      }
      else if ((_DWORD)v21 == 1)
      {
        v22 = (_QWORD *)operator new();
        v22[1] = 0;
        v22[2] = 0;
        *v22 = 0;
        v51 = 0;
        v23 = *v8;
        *v8 = (uint64_t)v22;
        if (v23)
        {
          sub_24BA395F0((uint64_t)v8, v23);
          v24 = v51;
          v51 = 0;
          if (v24)
            sub_24BA395F0((uint64_t)&v51, v24);
        }
        PB::Reader::read();
      }
      else
      {
        result = PB::Reader::skip(this);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)this + 1);
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)this + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_21;
      v16 += 7;
      v2 = v18;
      if (v17++ >= 9)
      {
LABEL_20:
        v12 = 0;
        goto LABEL_21;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t MetricFileMetadataHelper::getMetadataForComponent(MetricFileMetadataHelper *this, unsigned int a2)
{
  char *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD *v11;
  __n128 v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  __int128 v17;
  unsigned int v18;
  unsigned int *v19;

  v18 = a2;
  v3 = (char *)this + 40;
  v4 = sub_24BA37D28((_QWORD *)this + 5, &v18);
  if (v4)
    return v4[3];
  MetricFileMetadataHelper::createMetadataForComponent((WISMetadataLoader **)this, v18, &v17);
  if (!(_QWORD)v17)
  {
    v11 = operator new(0x50uLL);
    v11[1] = 0;
    v11[2] = 0;
    *v11 = &off_251CCD200;
    v12.n128_f64[0] = sub_24BA38418((uint64_t)(v11 + 3));
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    *(_QWORD *)&v17 = v14;
    *((_QWORD *)&v17 + 1) = v11;
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v13->__on_zero_shared)(v13, v12);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  v19 = &v18;
  v7 = sub_24BA37DDC((uint64_t)v3, &v18, (uint64_t)&unk_24BA5E9E4, &v19);
  sub_24BA54188(v7 + 3, (uint64_t *)&v17);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
  v5 = v17;
  if (*((_QWORD *)&v17 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v5;
}

void sub_24BA37830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_24BA3B304((uint64_t)&a9);
  _Unwind_Resume(a1);
}

double MetricFileMetadataHelper::getSubfieldType@<D0>(MetricFileMetadataHelper *a1@<X0>, __n128 *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  double result;
  __n128 v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;

  v6 = *a2;
  v7 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle(a1, &v6, a3, (uint64_t)&v8);
  result = *(double *)&v8;
  *(_OWORD *)a4 = v8;
  *(_QWORD *)(a4 + 16) = v9;
  return result;
}

double MetricFileMetadataHelper::resolveSubfieldInMetricHandle@<D0>(MetricFileMetadataHelper *a1@<X0>, __n128 *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  double result;
  __int128 v8;
  __n128 v9;
  uint64_t v10;
  __n128 v11;
  unint64_t v12;
  _BYTE v13[32];

  v11 = *a2;
  v12 = a2[1].n128_u64[0];
  MetadataHelper::resolveSubfieldInHandle((uint64_t)a1, &v11, a3, (__n128 *)v13);
  if (*(_QWORD *)&v13[24] || *(_OWORD *)v13 != *((_OWORD *)a1 + 5))
  {
    result = *(double *)v13;
    v8 = *(_OWORD *)&v13[16];
    *(_OWORD *)a4 = *(_OWORD *)v13;
    *(_OWORD *)(a4 + 16) = v8;
  }
  else
  {
    *(_QWORD *)v13 = MetricFileMetadataHelper::getMetadataForComponent(a1, HIWORD(a3));
    *(_OWORD *)&v13[8] = xmmword_24BA5EC00;
    v9 = *(__n128 *)v13;
    v10 = 0xFFFFFFFFLL;
    *(_QWORD *)&result = MetadataHelper::resolveSubfieldInHandle((uint64_t)a1, &v9, a3, (__n128 *)a4).n128_u64[0];
  }
  return result;
}

__n128 MetadataHelper::resolveSubfieldInHandle@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, unsigned int a3@<W2>, __n128 *a4@<X8>)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  BOOL v24;
  __n128 result;
  __n128 v26;
  unint64_t v27;
  __n128 v28;

  v26 = *a2;
  v27 = a2[1].n128_u64[0];
  MetadataHelper::descendIntoMessage(a1, (MetadataHandle *)&v26, (uint64_t)&v28);
  *a2 = v28;
  a2[1].n128_u64[0] = 0xFFFFFFFFLL;
  v7 = a2->n128_u64[0];
  if (!a2->n128_u64[0])
    goto LABEL_18;
  v8 = a2->n128_u64[1];
  v10 = v7 + 32;
  v9 = *(_QWORD *)(v7 + 32);
  if (v8 >= (*(_QWORD *)(v10 + 8) - v9) >> 3)
    goto LABEL_18;
  v11 = *(_QWORD *)(v9 + 8 * v8);
  if (!v11)
    goto LABEL_18;
  v12 = *(_QWORD **)(v11 + 8);
  v13 = *(_QWORD *)(v11 + 16) - (_QWORD)v12;
  if (!v13)
    goto LABEL_18;
  v14 = v13 >> 3;
  v15 = v12;
  do
  {
    v16 = v14 >> 1;
    v17 = &v15[v14 >> 1];
    v19 = *v17;
    v18 = v17 + 1;
    v14 += ~(v14 >> 1);
    if (*(_DWORD *)(v19 + 40) <= a3)
      v15 = v18;
    else
      v14 = v16;
  }
  while (v14);
  if (v15 != v12
    && ((v22 = *(v15 - 1), v20 = v15 - 1, v21 = v22, v23 = *(_DWORD *)(v22 + 40), v23 == a3)
     || (v23 < a3 ? (v24 = (*(_WORD *)(v21 + 52) & 8) == 0) : (v24 = 1), !v24 && *(_DWORD *)(v21 + 28) > a3)))
  {
    a2[1].n128_u64[0] = v20 - v12;
  }
  else
  {
LABEL_18:
    v21 = 0;
  }
  result = *a2;
  *a4 = *a2;
  a4[1].n128_u64[0] = a2[1].n128_u64[0];
  a4[1].n128_u64[1] = v21;
  return result;
}

__n128 MetadataHelper::descendIntoMessage@<Q0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v5;
  uint64_t Field;
  __n128 result;

  if (!*(_QWORD *)a2)
  {
    v5 = *(_OWORD *)(a1 + 16);
    *((_QWORD *)a2 + 2) = *(_QWORD *)(a1 + 32);
    *(_OWORD *)a2 = v5;
  }
  if (*((_QWORD *)a2 + 2) != 0xFFFFFFFFLL)
  {
    Field = MetadataHandle::getField(a2);
    if (Field)
      *((_QWORD *)a2 + 1) = *(unsigned int *)(Field + 20);
    *((_QWORD *)a2 + 2) = 0xFFFFFFFFLL;
  }
  result = *(__n128 *)a2;
  *(_OWORD *)a3 = *(_OWORD *)a2;
  *(_QWORD *)(a3 + 16) = *((_QWORD *)a2 + 2);
  return result;
}

uint64_t MetadataHandle::getField(MetadataHandle *this)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *((_QWORD *)this + 2);
  if (v1 != 0xFFFFFFFF
    && (v2 = *(_QWORD *)this) != 0
    && (v3 = *((_QWORD *)this + 1), v5 = v2 + 32, v4 = *(_QWORD *)(v2 + 32), v3 < (*(_QWORD *)(v5 + 8) - v4) >> 3)
    && (v6 = *(_QWORD *)(v4 + 8 * v3)) != 0
    && (v8 = v6 + 8, v7 = *(_QWORD *)(v6 + 8), v1 < (*(_QWORD *)(v8 + 8) - v7) >> 3))
  {
    return *(_QWORD *)(v7 + 8 * v1);
  }
  else
  {
    return 0;
  }
}

unint64_t wis::reflect::decodeTag(wis::reflect *this)
{
  return this & 7 | ((unint64_t)(this >> 3) << 32);
}

uint64_t MetadataHelper::getBuiltinType(uint64_t a1, MetadataHandle *a2)
{
  uint64_t result;

  result = MetadataHandle::getField(a2);
  if (result)
    return *(unsigned int *)(result + 44);
  return result;
}

uint64_t wis::reflect::getDecodingType(uint64_t a1, int a2)
{
  uint64_t UnpackedType;

  if (wis::reflect::getWireTypeForType(a1) == a2)
    return a1;
  UnpackedType = wis::reflect::getUnpackedType(a1);
  if (wis::reflect::getWireTypeForType(UnpackedType) != a2)
  {
    if (a2 != 2)
      return 0;
    UnpackedType = wis::reflect::getPackedType(a1);
    if (!(_DWORD)UnpackedType)
      return 0;
  }
  return UnpackedType;
}

uint64_t wis::reflect::getWireTypeForType(int a1)
{
  if ((a1 - 1) > 0x1A)
    return 0;
  else
    return byte_24BA5E948[a1 - 1];
}

uint64_t MetadataHandle::getEnum(MetadataHandle *this)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = MetadataHandle::getField(this);
  if (result)
  {
    if ((*(_WORD *)(result + 52) & 1) != 0
      && (v3 = *(unsigned int *)(result + 16),
          v4 = *(_QWORD *)(*(_QWORD *)this + 8),
          v3 < (*(_QWORD *)(*(_QWORD *)this + 16) - v4) >> 3))
    {
      return *(_QWORD *)(v4 + 8 * v3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void MetricFileMetadataHelper::createMetadataForComponent(WISMetadataLoader **this@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  WISMetadataLoader *v3;

  v3 = *this;
  if ((_DWORD)a2)
    WISMetadataLoader::loadComponentMetadata(v3, a2, a3);
  else
    WISMetadataLoader::loadMetricFileMetadata(v3, a3);
}

void WISMetadataLoader::loadMetricFileMetadata(WISMetadataLoader *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  __int128 v12;

  v5 = (uint64_t *)((char *)this + 16);
  v4 = *((_QWORD *)this + 2);
  if (!v4)
  {
    (*(void (**)(__int128 *__return_ptr, _QWORD, uint64_t))(**(_QWORD **)this + 16))(&v12, *(_QWORD *)this, 1);
    sub_24BA511B4((uint64_t)v5, &v12);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v4 = *v5;
  }
  v9 = *((_QWORD *)this + 3);
  *a2 = v4;
  a2[1] = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
}

uint64_t *sub_24BA37D28(_QWORD *a1, unsigned int *a2)
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
    v5 = (v2.i32[0] - 1) & v3;
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

uint64_t *sub_24BA37DDC(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  uint64_t **v10;
  uint64_t *i;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v24[2];
  char v25;

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
    v10 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (uint64_t *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (*((_DWORD *)i + 4) == (_DWORD)v7)
            return i;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4)
            break;
        }
      }
    }
  }
  v13 = a1 + 16;
  v14 = operator new(0x28uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *v14 = 0;
  v14[1] = v7;
  *((_DWORD *)v14 + 4) = **a4;
  v14[3] = 0;
  v14[4] = 0;
  v25 = 1;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_24BA3814C(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *(_QWORD *)v24[0] = *v21;
    *v21 = v24[0];
  }
  else
  {
    *(_QWORD *)v24[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v24[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v13;
    if (*(_QWORD *)v24[0])
    {
      v22 = *(_QWORD *)(*(_QWORD *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8)
          v22 %= v8;
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = v24[0];
    }
  }
  i = (uint64_t *)v24[0];
  v24[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  sub_24BA5446C((uint64_t)v24, 0);
  return i;
}

void sub_24BA38024(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA5446C((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

double WISMetadataLoader::loadComponentMetadata@<D0>(WISMetadataLoader *this@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  double result;
  __int128 v5;

  (*(void (**)(__int128 *__return_ptr, _QWORD, _QWORD, uint64_t))(**(_QWORD **)this + 32))(&v5, *(_QWORD *)this, *((unsigned int *)this + 2), a2);
  result = *(double *)&v5;
  *a3 = v5;
  return result;
}

void BestChoiceMetadataLoaderDelegate::readComponentData(_QWORD *a1@<X0>, int a2@<W1>, unsigned int a3@<W2>, _QWORD *a4@<X8>)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t *v9;
  unsigned int v10;

  v10 = a3;
  v7 = a1 + 10;
  (*(void (**)(_QWORD *))(*a1 + 88))(a1);
  if (a2 == 1)
    v8 = v7;
  else
    v8 = a1 + 5;
  v9 = sub_24BA37D28(v8, &v10);
  if (v9)
  {
    sub_24BA38380((unsigned __int8 *)v9[3], v9[4], a4);
  }
  else
  {
    *a4 = 0;
    a4[1] = 0;
  }
}

_QWORD *BestChoiceMetadataLoaderDelegate::ensureCacheReady(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[8])
  {
    v1 = this;
    v2 = (*(uint64_t (**)(_QWORD *))(*this + 96))(this);
    return (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t))(*v1 + 104))(v1, v2);
  }
  return this;
}

void sub_24BA3814C(uint64_t a1, size_t __n)
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
      sub_24BA38228(a1, prime);
  }
}

void sub_24BA38228(uint64_t a1, unint64_t a2)
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
      sub_24BA3974C();
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

void sub_24BA38380(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 && a2)
  {
    PB::Reader::Reader((PB::Reader *)&v7, a1);
    v4 = operator new(0x50uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = &off_251CCD200;
    v5 = sub_24BA38418((uint64_t)(v4 + 3));
    *a3 = v6;
    a3[1] = v4;
    if (((*(uint64_t (**)(double))(v4[3] + 16))(v5) & 1) == 0)
      sub_24BA558C4(a3);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_24BA38404(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_24BA3B304(v1);
  _Unwind_Resume(a1);
}

double sub_24BA38418(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = &off_251CCD428;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  return result;
}

uint64_t wis::reflect::encodeTag(char a1, int a2)
{
  return a1 & 7 | (8 * a2);
}

uint64_t sub_24BA38444(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t wis::GetProtobufTag@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return wis::GetProtobufTag(*a1, (const unsigned __int8 *)(a1[1] - *a1), a2);
}

void wis::asString(unsigned int *a1@<X0>, std::string *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  std::string *v6;
  __int128 v7;
  void **v8;
  std::string::size_type v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  __int128 v13;
  std::string *v14;
  std::string::size_type size;
  std::string *v16;
  __int128 v17;
  std::string *v18;
  std::string v19;
  void *__p[2];
  unsigned __int8 v21;
  std::string v22;
  std::string v23;
  std::string v24;
  std::string v25;
  std::string v26;
  std::string v27;

  ctu::hex((ctu *)*a1);
  v4 = std::string::insert(&v22, 0, "Trigger(cid=0x");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v23.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  v6 = std::string::append(&v23, ", trid=0x");
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v24.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  ctu::hex((ctu *)a1[1]);
  if ((v21 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  if ((v21 & 0x80u) == 0)
    v9 = v21;
  else
    v9 = (std::string::size_type)__p[1];
  v10 = std::string::append(&v24, (const std::string::value_type *)v8, v9);
  v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v25.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  v12 = std::string::append(&v25, ", sid=");
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v26.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&v19, a1[2]);
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v14 = &v19;
  else
    v14 = (std::string *)v19.__r_.__value_.__r.__words[0];
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v19.__r_.__value_.__r.__words[2]);
  else
    size = v19.__r_.__value_.__l.__size_;
  v16 = std::string::append(&v26, (const std::string::value_type *)v14, size);
  v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v27.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  v18 = std::string::append(&v27, ")");
  *a2 = *v18;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__r_.__value_.__l.__data_);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);
  if ((char)v21 < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
}

void sub_24BA38658(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  uint64_t v40;

  if (*(char *)(v40 - 41) < 0)
    operator delete(*(void **)(v40 - 64));
  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v40 - 73) < 0)
    operator delete(*(void **)(v40 - 96));
  if (*(char *)(v40 - 105) < 0)
    operator delete(*(void **)(v40 - 128));
  if (a21 < 0)
    operator delete(a16);
  if (a40 < 0)
    operator delete(a35);
  if (a33 < 0)
    operator delete(a28);
  if (a27 < 0)
    operator delete(a22);
  _Unwind_Resume(exception_object);
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_24BA3871C(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(*a1);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(*a1);
  return a1;
}

_QWORD *sub_24BA38754(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_24BA4108C(a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_24BA387A8(_Unwind_Exception *exception_object)
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

uint64_t sub_24BA387C4(uint64_t a1)
{
  void *v2;

  sub_24BA387FC(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_24BA387FC(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      sub_24BA3B304((uint64_t)(v2 + 3));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void sub_24BA38838(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t v4;
  xpc_object_t v5;

  value = xpc_dictionary_get_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8));
  if (value)
  {
    v4 = value;
    xpc_retain(value);
    *a2 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    *a2 = v4;
    if (!v4)
    {
      v5 = xpc_null_create();
      v4 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x24BD2CA88](v4) != MEMORY[0x24BDACF78])
  {
    v5 = xpc_null_create();
LABEL_8:
    *a2 = v5;
    goto LABEL_9;
  }
  xpc_retain(v4);
LABEL_9:
  xpc_release(v4);
}

xpc_object_t sub_24BA388D0@<X0>(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_object_t result;

  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  result = xpc_null_create();
  *a2 = result;
  return result;
}

xpc_object_t sub_24BA38918@<X0>(void *bytes@<X1>, size_t length@<X2>, _QWORD *a3@<X8>)
{
  xpc_object_t result;

  result = xpc_data_create(bytes, length);
  *a3 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a3 = result;
  }
  return result;
}

xpc_object_t sub_24BA38958@<X0>(char *string@<X1>, _QWORD *a2@<X8>)
{
  xpc_object_t result;

  if (!string || (result = xpc_string_create(string), (*a2 = result) == 0))
  {
    result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

xpc_object_t sub_24BA389A4@<X0>(uint64_t value@<X1>, _QWORD *a2@<X8>)
{
  xpc_object_t result;

  result = xpc_uint64_create(value);
  *a2 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

xpc_object_t sub_24BA389E0@<X0>(int64_t value@<X1>, _QWORD *a2@<X8>)
{
  xpc_object_t result;

  result = xpc_int64_create(value);
  *a2 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

xpc_object_t sub_24BA38A1C@<X0>(int a1@<W1>, _QWORD *a2@<X8>)
{
  xpc_object_t result;

  result = xpc_int64_create(a1);
  *a2 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

xpc_object_t sub_24BA38A58@<X0>(BOOL value@<W1>, _QWORD *a2@<X8>)
{
  xpc_object_t result;

  result = xpc_BOOL_create(value);
  *a2 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_24BA38A94(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(*a1);
  return a1;
}

void **sub_24BA38AC4(void **a1, void **a2)
{
  void *v3;

  v3 = *a2;
  *a1 = *a2;
  if (v3)
    xpc_retain(v3);
  else
    *a1 = xpc_null_create();
  return a1;
}

void sub_24BA38B04(void *a1, uint64_t *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  xpc_object_t v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v17;
  uint64_t v18;
  xpc_object_t object;
  xpc_object_t v20;
  xpc_object_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  char v25;
  xpc_object_t v26;
  __int128 v27;
  uint64_t v28;

  v27 = *a3;
  v28 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v27, a4);
  v11 = xpc_null_create();
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, *a2, __p);
    if (v25 < 0)
    {
      if (!__p[1])
      {
LABEL_10:
        operator delete(__p[0]);
        goto LABEL_11;
      }
      v13 = (char *)__p[0];
    }
    else
    {
      if (!v25)
        goto LABEL_11;
      v13 = (char *)__p;
    }
    sub_24BA38958(v13, &v21);
    v14 = v21;
    v21 = v11;
    xpc_release(v11);
    v21 = 0;
    v11 = v14;
    if ((v25 & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (a5 == 12)
  {
    sub_24BA38A58(*a2 != 0, &v26);
    v12 = v26;
    v26 = v11;
    xpc_release(v11);
    v26 = 0;
    v11 = v12;
  }
LABEL_11:
  if (MEMORY[0x24BD2CA88](v11) == MEMORY[0x24BDACFE0])
  {
    sub_24BA389A4(*a2, &v20);
    v15 = v20;
    v20 = v11;
    xpc_release(v11);
    v20 = 0;
    v11 = v15;
  }
  object = v11;
  if (v11)
    xpc_retain(v11);
  else
    object = xpc_null_create();
  v17 = *a3;
  v18 = *((_QWORD *)a3 + 2);
  v16 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v17, a4);
  sub_24BA351E4(a1, (uint64_t)v10, &object, v16);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
}

void sub_24BA38CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;

  if (a24 < 0)
    operator delete(__p);
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void sub_24BA38D44(void *a1, uint64_t *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  xpc_object_t v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v17;
  uint64_t v18;
  xpc_object_t object;
  xpc_object_t v20;
  xpc_object_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  char v25;
  xpc_object_t v26;
  __int128 v27;
  uint64_t v28;

  v27 = *a3;
  v28 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v27, a4);
  v11 = xpc_null_create();
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, *a2, __p);
    if (v25 < 0)
    {
      if (!__p[1])
      {
LABEL_10:
        operator delete(__p[0]);
        goto LABEL_11;
      }
      v13 = (char *)__p[0];
    }
    else
    {
      if (!v25)
        goto LABEL_11;
      v13 = (char *)__p;
    }
    sub_24BA38958(v13, &v21);
    v14 = v21;
    v21 = v11;
    xpc_release(v11);
    v21 = 0;
    v11 = v14;
    if ((v25 & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (a5 == 12)
  {
    sub_24BA38A58(*a2 != 0, &v26);
    v12 = v26;
    v26 = v11;
    xpc_release(v11);
    v26 = 0;
    v11 = v12;
  }
LABEL_11:
  if (MEMORY[0x24BD2CA88](v11) == MEMORY[0x24BDACFE0])
  {
    sub_24BA5088C(*a2, &v20);
    v15 = v20;
    v20 = v11;
    xpc_release(v11);
    v20 = 0;
    v11 = v15;
  }
  object = v11;
  if (v11)
    xpc_retain(v11);
  else
    object = xpc_null_create();
  v17 = *a3;
  v18 = *((_QWORD *)a3 + 2);
  v16 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v17, a4);
  sub_24BA351E4(a1, (uint64_t)v10, &object, v16);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
}

void sub_24BA38F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;

  if (a24 < 0)
    operator delete(__p);
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void sub_24BA38F84(void *a1, int *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  xpc_object_t v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v17;
  uint64_t v18;
  xpc_object_t object;
  xpc_object_t v20;
  xpc_object_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  char v25;
  xpc_object_t v26;
  __int128 v27;
  uint64_t v28;

  v27 = *a3;
  v28 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v27, a4);
  v11 = xpc_null_create();
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, *a2, __p);
    if (v25 < 0)
    {
      if (!__p[1])
      {
LABEL_10:
        operator delete(__p[0]);
        goto LABEL_11;
      }
      v13 = (char *)__p[0];
    }
    else
    {
      if (!v25)
        goto LABEL_11;
      v13 = (char *)__p;
    }
    sub_24BA38958(v13, &v21);
    v14 = v21;
    v21 = v11;
    xpc_release(v11);
    v21 = 0;
    v11 = v14;
    if ((v25 & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (a5 == 12)
  {
    sub_24BA38A58(*a2 != 0, &v26);
    v12 = v26;
    v26 = v11;
    xpc_release(v11);
    v26 = 0;
    v11 = v12;
  }
LABEL_11:
  if (MEMORY[0x24BD2CA88](v11) == MEMORY[0x24BDACFE0])
  {
    sub_24BA38A1C(*a2, &v20);
    v15 = v20;
    v20 = v11;
    xpc_release(v11);
    v20 = 0;
    v11 = v15;
  }
  object = v11;
  if (v11)
    xpc_retain(v11);
  else
    object = xpc_null_create();
  v17 = *a3;
  v18 = *((_QWORD *)a3 + 2);
  v16 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v17, a4);
  sub_24BA351E4(a1, (uint64_t)v10, &object, v16);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
}

void sub_24BA39160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;

  if (a24 < 0)
    operator delete(__p);
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void sub_24BA391C4(void *a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v8;
  int v9;
  __int128 v10;
  uint64_t v11;
  xpc_object_t object;
  __int128 v13;
  uint64_t v14;

  v13 = *a3;
  v14 = *((_QWORD *)a3 + 2);
  v8 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v13, a4);
  sub_24BA38918(*(void **)a2, *(_QWORD *)(a2 + 8) - *(_QWORD *)a2, &object);
  v10 = *a3;
  v11 = *((_QWORD *)a3 + 2);
  v9 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v10, a4);
  sub_24BA351E4(a1, (uint64_t)v8, &object, v9);
  xpc_release(object);
}

void sub_24BA39278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

char *sub_24BA39290(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  uint64_t Field;
  char *result;
  __n128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v6 = *(__n128 *)a2;
  v7 = *((_QWORD *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 8), &v6, a3, (uint64_t)&v8);
  *(_OWORD *)a2 = v8;
  *((_QWORD *)a2 + 2) = v9;
  Field = MetadataHandle::getField(a2);
  if (!Field)
    return (char *)&unk_24BA5D72A;
  result = *(char **)(Field + 8);
  if (!result)
    return (char *)&unk_24BA5D72A;
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

uint64_t sub_24BA39310(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  uint64_t result;
  __n128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v5 = *(__n128 *)a2;
  v6 = *((_QWORD *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 8), &v5, a3, (uint64_t)&v7);
  *(_OWORD *)a2 = v7;
  *((_QWORD *)a2 + 2) = v8;
  result = MetadataHandle::getField(a2);
  if (result)
    return (*(_WORD *)(result + 52) & 0x400) != 0 && *(_BYTE *)(result + 50) != 0;
  return result;
}

_QWORD *sub_24BA3938C@<X0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  _QWORD *result;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  __n128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v15 = *(__n128 *)a2;
  v16 = *((_QWORD *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 8), &v15, a3, (uint64_t)&v17);
  *(_OWORD *)a2 = v17;
  *((_QWORD *)a2 + 2) = v18;
  result = (_QWORD *)MetadataHandle::getEnum(a2);
  if (!result)
    return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  v9 = (uint64_t *)result[1];
  v10 = (uint64_t *)result[2];
  if (v9 == v10)
    return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  while (1)
  {
    v11 = *v9;
    v12 = (*(_BYTE *)(*v9 + 32) & 2) != 0 ? 24 : 16;
    if (*(_QWORD *)(v11 + v12) == a4)
      break;
    if (++v9 == v10)
      return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  }
  v13 = *(__int128 **)(v11 + 8);
  if (*((char *)v13 + 23) < 0)
    return sub_24BA39638(a5, *(void **)v13, *((_QWORD *)v13 + 1));
  v14 = *v13;
  a5[2] = *((_QWORD *)v13 + 2);
  *(_OWORD *)a5 = v14;
  return result;
}

void sub_24BA39478(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t sub_24BA3948C(_QWORD *a1, PB::TextFormatter *this, char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;

  PB::TextFormatter::beginObject(this, a3);
  v5 = (uint64_t *)a1[1];
  v6 = (uint64_t *)a1[2];
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, this, "enum_names");
  }
  if (a1[4])
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_24BA39518(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  const PB::Base **v4;
  const PB::Base **v5;
  const PB::Base *v6;

  v3 = result;
  if (*(_QWORD *)(result + 32))
    result = PB::Writer::write();
  v5 = *(const PB::Base ***)(v3 + 8);
  v4 = *(const PB::Base ***)(v3 + 16);
  while (v5 != v4)
  {
    v6 = *v5++;
    result = PB::Writer::writeSubmessage(this, v6);
  }
  return result;
}

void sub_24BA39574(void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_24BA395F0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(char *)(a2 + 23) < 0)
      operator delete(*(void **)a2);
    JUMPOUT(0x24BD2C8A8);
  }
}

void *sub_24BA39638(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_24BA396C4();
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

void sub_24BA396C4()
{
  sub_24BA396D8("basic_string");
}

void sub_24BA396D8(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_24BA39728(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_251CCBD70, MEMORY[0x24BEDAAF0]);
}

void sub_24BA39714(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_24BA39728(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_24BA3974C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_24BA39774()
{
  sub_24BA396D8("vector");
}

void *sub_24BA39788(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_24BA3974C();
  return operator new(8 * a2);
}

void sDumpMetricFile(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BR              X11 }
}

uint64_t sub_24BA39830()
{
  __int128 *v0;
  _QWORD *v1;
  uint64_t v2;
  char v4;
  __n128 v5;
  uint64_t v6;

  v5 = 0uLL;
  v6 = 0xFFFFFFFFLL;
  v4 = 0;
  sub_24BA3996C(&v5, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)(v2 - 96), &v4, v0, v1);
  return MEMORY[0x24BD2C524](v2 - 96);
}

void sub_24BA39934(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD2C524](v1 - 96);
  _Unwind_Resume(a1);
}

void sub_24BA3996C(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, char *a3@<X2>, __int128 *a4@<X3>, _QWORD *a5@<X8>)
{
  char v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __n128 v14;
  unint64_t v15;
  __int128 v16;
  _QWORD v17[2];
  uint64_t v18;
  std::__shared_weak_count *v19;
  _BYTE v20[72];

  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  v7 = *a3;
  v16 = *a4;
  *(_QWORD *)a4 = 0;
  *((_QWORD *)a4 + 1) = 0;
  v17[0] = a5;
  v17[1] = 0;
  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v18, &v16);
  v20[64] = v7;
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
  if (*((_QWORD *)&v16 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  while (!*((_BYTE *)a2 + 36))
  {
    v14 = *a1;
    v15 = a1[1].n128_u64[0];
    sub_24BA3D28C(a2, &v14, (uint64_t)v17);
  }
  sub_24BA387C4((uint64_t)v20);
  v11 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
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

void sub_24BA39A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;

  va_start(va, a5);
  sub_24BA3B304((uint64_t)va);
  if (*(char *)(v5 + 23) < 0)
    operator delete(*(void **)v5);
  _Unwind_Resume(a1);
}

void sub_24BA39AC0(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  __n128 v14;
  unint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;

  sub_24BA42608(a4, 0, 0, 0, 1);
  v16 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  v17 = a4;
  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v18, &v16);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
  if (*((_QWORD *)&v16 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  while (!*((_BYTE *)a2 + 36))
  {
    v14 = *a1;
    v15 = a1[1].n128_u64[0];
    sub_24BA410CC(a2, &v14, &v17);
  }
  sub_24BA387C4((uint64_t)&v20);
  v11 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
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

void sub_24BA39BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  char ***v5;
  va_list va;

  va_start(va, a5);
  sub_24BA3B304((uint64_t)va);
  sub_24BA3C92C(v5 + 1, *(unsigned __int8 *)v5);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA39C1C@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, _QWORD *a6@<X8>)
{
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  uint64_t *v24[81];

  v24[80] = *(uint64_t **)MEMORY[0x24BDAC8D0];
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  v12 = (std::__shared_weak_count *)operator new(0x28uLL);
  v12->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v12->__shared_owners_;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = (std::__shared_weak_count_vtbl *)off_251CCC020;
  v12->__vftable = (std::__shared_weak_count_vtbl *)&off_251CCBFD0;
  v12[1].__shared_owners_ = (uint64_t)a6;
  v21 = v12;
  v22 = &v12[1].__vftable;
  v23 = v12;
  do
    v14 = __ldxr(p_shared_owners);
  while (__stxr(v14 + 1, p_shared_owners));
  sub_24BA3B1C4((uint64_t)v24, (uint64_t)&v22, a3, a5);
  v15 = v23;
  if (v23)
  {
    v16 = (unint64_t *)&v23->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v21)
  {
    v18 = (unint64_t *)&v21->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  sub_24BA3A760(v24, a1, a2 >= 0, a4, a2 & ~(a2 >> 31), 0);
  return sub_24BA3C8FC((uint64_t)v24);
}

void sub_24BA39D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  sub_24BA3C8FC((uint64_t)va);
  if (*(char *)(v6 + 23) < 0)
    operator delete(*(void **)v6);
  _Unwind_Resume(a1);
}

void sDumpMetricLog(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BR              X11 }
}

uint64_t sub_24BA39E50()
{
  __int128 *v0;
  _QWORD *v1;
  uint64_t v2;
  char v4;
  __n128 v5;
  uint64_t v6;

  v5 = 0uLL;
  v6 = 0xFFFFFFFFLL;
  v4 = 0;
  sub_24BA39F8C(&v5, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)(v2 - 96), &v4, v0, v1);
  return MEMORY[0x24BD2C524](v2 - 96);
}

void sub_24BA39F54(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD2C524](v1 - 96);
  _Unwind_Resume(a1);
}

void sub_24BA39F8C(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, char *a3@<X2>, __int128 *a4@<X3>, _QWORD *a5@<X8>)
{
  char v7;
  __n128 v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  __n128 v15;
  unint64_t v16;
  __int128 v17;
  _QWORD v18[2];
  uint64_t v19;
  std::__shared_weak_count *v20;
  _BYTE v21[72];

  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  v7 = *a3;
  v17 = *a4;
  *(_QWORD *)a4 = 0;
  *((_QWORD *)a4 + 1) = 0;
  v18[0] = a5;
  v18[1] = 0;
  v8 = MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v19, &v17);
  v21[64] = v7;
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v9->__on_zero_shared)(v9, v8);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  while (!*((_BYTE *)a2 + 36))
  {
    v15 = *a1;
    v16 = a1[1].n128_u64[0];
    sub_24BA3D28C(a2, &v15, (uint64_t)v18);
  }
  sub_24BA387C4((uint64_t)v21);
  v12 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
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

void sub_24BA3A0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;

  va_start(va, a5);
  sub_24BA3B304((uint64_t)va);
  if (*(char *)(v5 + 23) < 0)
    operator delete(*(void **)v5);
  _Unwind_Resume(a1);
}

void sub_24BA3A0E0(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  __n128 v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  __n128 v15;
  unint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;

  sub_24BA42608(a4, 0, 0, 0, 1);
  v17 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  v18 = a4;
  v8 = MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v19, &v17);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
  if (*((_QWORD *)&v17 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v9->__on_zero_shared)(v9, v8);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  while (!*((_BYTE *)a2 + 36))
  {
    v15 = *a1;
    v16 = a1[1].n128_u64[0];
    sub_24BA410CC(a2, &v15, &v18);
  }
  sub_24BA387C4((uint64_t)&v21);
  v12 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
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

void sub_24BA3A204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  char ***v5;
  va_list va;

  va_start(va, a5);
  sub_24BA3B304((uint64_t)va);
  sub_24BA3C92C(v5 + 1, *(unsigned __int8 *)v5);
  _Unwind_Resume(a1);
}

void sDumpDeviceConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BR              X11 }
}

uint64_t sub_24BA3A2B0()
{
  __int128 *v0;
  _QWORD *v1;
  uint64_t v2;
  char v4;
  __n128 v5;
  uint64_t v6;

  v5 = 0uLL;
  v6 = 0xFFFFFFFFLL;
  v4 = 0;
  sub_24BA3A3EC(&v5, (wireless_diagnostics::google::protobuf::io::CodedInputStream *)(v2 - 96), &v4, v0, v1);
  return MEMORY[0x24BD2C524](v2 - 96);
}

void sub_24BA3A3B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD2C524](v1 - 96);
  _Unwind_Resume(a1);
}

void sub_24BA3A3EC(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, char *a3@<X2>, __int128 *a4@<X3>, _QWORD *a5@<X8>)
{
  char v7;
  __n128 v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __n128 v21;
  unint64_t v22;
  __int128 v23;
  _QWORD v24[2];
  uint64_t v25;
  std::__shared_weak_count *v26;
  std::__shared_weak_count *v27;
  char v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  uint64_t v31;

  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  v7 = *a3;
  v23 = *a4;
  *(_QWORD *)a4 = 0;
  *((_QWORD *)a4 + 1) = 0;
  v24[0] = a5;
  v24[1] = 0;
  DeviceConfigMetadataHelper::DeviceConfigMetadataHelper((uint64_t)&v25, (uint64_t)&v23);
  v28 = v7;
  v8 = MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v29, &v23);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
  if (*((_QWORD *)&v23 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v9->__on_zero_shared)(v9, v8);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  while (!*((_BYTE *)a2 + 36))
  {
    v21 = *a1;
    v22 = a1[1].n128_u64[0];
    sub_24BA46104(a2, &v21, (uint64_t)v24);
  }
  sub_24BA387C4((uint64_t)&v31);
  v12 = v30;
  if (v30)
  {
    p_shared_owners = (unint64_t *)&v30->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  v15 = v27;
  if (v27)
  {
    v16 = (unint64_t *)&v27->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = v26;
  if (v26)
  {
    v19 = (unint64_t *)&v26->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
}

void sub_24BA3A588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  sub_24BA3B304((uint64_t)va1);
  sub_24BA3B304(v6);
  sub_24BA3B304((uint64_t)va);
  if (*(char *)(v5 + 23) < 0)
    operator delete(*(void **)v5);
  _Unwind_Resume(a1);
}

void sub_24BA3A5D8(__n128 *a1@<X0>, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  __n128 v17;
  unint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  std::__shared_weak_count *v23;

  sub_24BA42608(a4, 0, 0, 0, 1);
  v19 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  v20 = a4;
  DeviceConfigMetadataHelper::DeviceConfigMetadataHelper((uint64_t)&v21, (uint64_t)&v19);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  while (!*((_BYTE *)a2 + 36))
  {
    v17 = *a1;
    v18 = a1[1].n128_u64[0];
    sub_24BA493D8(a2, &v17, &v20);
  }
  v11 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v22;
  if (v22)
  {
    v15 = (unint64_t *)&v22->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

void sub_24BA3A728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  char ***v5;
  va_list va;

  va_start(va, a5);
  sub_24BA3B304((uint64_t)va);
  sub_24BA3C92C(v5 + 1, *(unsigned __int8 *)v5);
  _Unwind_Resume(a1);
}

uint64_t **sub_24BA3A760(uint64_t **result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t **v10;
  uint64_t (*v11)(void);
  uint64_t v12;
  unsigned int v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t (*v30)(void);
  void (*v31)(void);
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t (***v35)(void);
  _QWORD *v36;
  unsigned __int8 **v37;
  unsigned __int8 *v38;
  unsigned __int8 *v39;
  unsigned int v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t i;
  uint64_t v46;
  unsigned __int8 **v47;
  unsigned __int8 *v48;
  unsigned __int8 *v49;
  unsigned int v50;
  _QWORD *v51;
  uint64_t v52;
  void (*v53)(void);
  unint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  BOOL v57;
  _QWORD *v58;
  unint64_t v59;
  _QWORD *v60;

  v10 = result;
  switch(*(_BYTE *)a2)
  {
    case 0:
      v11 = *(uint64_t (**)(void))(**result + 8);
      return (uint64_t **)v11();
    case 1:
      v12 = **result;
      if (!*(_QWORD *)(*(_QWORD *)(a2 + 8) + 16))
      {
        v11 = *(uint64_t (**)(void))(v12 + 8);
        return (uint64_t **)v11();
      }
      if (!a3)
      {
        (*(void (**)(void))v12)();
        v41 = *(_QWORD **)(a2 + 8);
        v42 = (_QWORD *)*v41;
        if (v41[2] == 1)
        {
          v43 = (_QWORD *)*v41;
        }
        else
        {
          v59 = 0;
          do
          {
            (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 34);
            sub_24BA3B35C((uint64_t)v10, v42 + 4, a4);
            (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\":", 2);
            sub_24BA3A760(v10, v42 + 7, 0, a4, a5, a6);
            (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 44);
            v60 = (_QWORD *)v42[1];
            if (v60)
            {
              do
              {
                v43 = v60;
                v60 = (_QWORD *)*v60;
              }
              while (v60);
            }
            else
            {
              do
              {
                v43 = (_QWORD *)v42[2];
                v57 = *v43 == (_QWORD)v42;
                v42 = v43;
              }
              while (!v57);
            }
            ++v59;
            v42 = v43;
          }
          while (v59 < *(_QWORD *)(*(_QWORD *)(a2 + 8) + 16) - 1);
        }
        (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 34);
        sub_24BA3B35C((uint64_t)v10, v43 + 4, a4);
        (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\":", 2);
        sub_24BA3A760(v10, v43 + 7, 0, a4, a5, a6);
        goto LABEL_84;
      }
      (*(void (**)(void))(v12 + 8))();
      v13 = a6 + a5;
      v14 = v10 + 76;
      if (*((char *)v10 + 631) < 0)
      {
        v15 = (unint64_t)v10[77];
        if (v15 >= v13)
          goto LABEL_7;
      }
      else
      {
        v15 = *((unsigned __int8 *)v10 + 631);
        if (v13 <= v15)
          goto LABEL_7;
      }
      std::string::resize((std::string *)(v10 + 76), 2 * v15, 32);
LABEL_7:
      v16 = *(_QWORD **)(a2 + 8);
      v17 = (_QWORD *)*v16;
      if (v16[2] == 1)
      {
        v18 = (_QWORD *)*v16;
      }
      else
      {
        v54 = 0;
        do
        {
          v55 = v10 + 76;
          if (*((char *)v10 + 631) < 0)
            v55 = (_QWORD *)*v14;
          (*(void (**)(uint64_t *, _QWORD *, _QWORD))(**v10 + 8))(*v10, v55, (a6 + a5));
          (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 34);
          sub_24BA3B35C((uint64_t)v10, v17 + 4, a4);
          (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\": ", 3);
          sub_24BA3A760(v10, v17 + 7, 1, a4, a5, (a6 + a5));
          (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, ",\n", 2);
          v56 = (_QWORD *)v17[1];
          if (v56)
          {
            do
            {
              v18 = v56;
              v56 = (_QWORD *)*v56;
            }
            while (v56);
          }
          else
          {
            do
            {
              v18 = (_QWORD *)v17[2];
              v57 = *v18 == (_QWORD)v17;
              v17 = v18;
            }
            while (!v57);
          }
          ++v54;
          v17 = v18;
        }
        while (v54 < *(_QWORD *)(*(_QWORD *)(a2 + 8) + 16) - 1);
      }
      v58 = v10 + 76;
      if (*((char *)v10 + 631) < 0)
        v58 = (_QWORD *)*v14;
      (*(void (**)(uint64_t *, _QWORD *, _QWORD))(**v10 + 8))(*v10, v58, (a6 + a5));
      (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 34);
      sub_24BA3B35C((uint64_t)v10, v18 + 4, a4);
      (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\": ", 3);
      sub_24BA3A760(v10, v18 + 7, 1, a4, a5, (a6 + a5));
      (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 10);
      v53 = *(void (**)(void))(**v10 + 8);
      goto LABEL_75;
    case 2:
      v19 = *(uint64_t **)(a2 + 8);
      v20 = *v19;
      v21 = v19[1];
      v22 = **result;
      if (v20 == v21)
      {
        v11 = *(uint64_t (**)(void))(v22 + 8);
        return (uint64_t **)v11();
      }
      if (!a3)
      {
        (*(void (**)(void))v22)();
        v44 = *(uint64_t **)(a2 + 8);
        for (i = *v44; i != v44[1] - 16; i += 16)
        {
          sub_24BA3A760(v10, i, 0, a4, a5, a6);
          (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 44);
          v44 = *(uint64_t **)(a2 + 8);
        }
        sub_24BA3A760(v10, i, 0, a4, a5, a6);
        goto LABEL_47;
      }
      (*(void (**)(void))(v22 + 8))();
      v23 = a6 + a5;
      v24 = v10 + 76;
      if (*((char *)v10 + 631) < 0)
      {
        v25 = (unint64_t)v10[77];
        if (v25 >= v23)
          goto LABEL_13;
      }
      else
      {
        v25 = *((unsigned __int8 *)v10 + 631);
        if (v23 <= v25)
          goto LABEL_13;
      }
      std::string::resize((std::string *)(v10 + 76), 2 * v25, 32);
LABEL_13:
      v26 = *(uint64_t **)(a2 + 8);
      v27 = *v26;
      if (*v26 != v26[1] - 16)
      {
        do
        {
          v28 = v10 + 76;
          if (*((char *)v10 + 631) < 0)
            v28 = (_QWORD *)*v24;
          (*(void (**)(uint64_t *, _QWORD *, _QWORD))(**v10 + 8))(*v10, v28, (a6 + a5));
          sub_24BA3A760(v10, v27, 1, a4, a5, (a6 + a5));
          (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, ",\n", 2);
          v27 += 16;
        }
        while (v27 != *(_QWORD *)(*(_QWORD *)(a2 + 8) + 8) - 16);
      }
      v29 = v10 + 76;
      if (*((char *)v10 + 631) < 0)
        v29 = (_QWORD *)*v24;
      (*(void (**)(uint64_t *, _QWORD *, _QWORD))(**v10 + 8))(*v10, v29, (a6 + a5));
      sub_24BA3A760(v10, *(_QWORD *)(*(_QWORD *)(a2 + 8) + 8) - 16, 1, a4, a5, (a6 + a5));
      (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 10);
      if (*((char *)v10 + 631) < 0)
        v24 = (_QWORD *)*v24;
      (*(void (**)(uint64_t *, _QWORD *, _QWORD))(**v10 + 8))(*v10, v24, a6);
LABEL_47:
      v30 = *(uint64_t (**)(void))**v10;
      return (uint64_t **)v30();
    case 3:
      (*(void (**)(void))**result)();
      sub_24BA3B35C((uint64_t)v10, *(uint64_t **)(a2 + 8), a4);
      v30 = *(uint64_t (**)(void))**v10;
      return (uint64_t **)v30();
    case 4:
      v11 = *(uint64_t (**)(void))(**result + 8);
      return (uint64_t **)v11();
    case 5:
      return (uint64_t **)sub_24BA3B9D4(result, *(_QWORD *)(a2 + 8));
    case 6:
      return (uint64_t **)sub_24BA3BB94(result, *(_QWORD *)(a2 + 8));
    case 7:
      return (uint64_t **)sub_24BA3BCBC((const char *)result, *(double *)(a2 + 8));
    case 8:
      v31 = *(void (**)(void))(**result + 8);
      if (a3)
      {
        v31();
        v32 = (a6 + a5);
        v33 = v10 + 76;
        if (*((char *)v10 + 631) < 0)
        {
          v34 = (unint64_t)v10[77];
          if (v34 >= v32)
          {
            v35 = (uint64_t (***)(void))*v10;
            goto LABEL_50;
          }
        }
        else
        {
          v34 = *((unsigned __int8 *)v10 + 631);
          if (v32 <= v34)
          {
            v35 = (uint64_t (***)(void))*v10;
            v36 = v10 + 76;
            goto LABEL_51;
          }
        }
        std::string::resize((std::string *)(v10 + 76), 2 * v34, 32);
        v35 = (uint64_t (***)(void))*v10;
        v36 = v10 + 76;
        if ((*((char *)v10 + 631) & 0x80000000) == 0)
        {
LABEL_51:
          ((void (*)(uint64_t (***)(void), _QWORD *, uint64_t))(*v35)[1])(v35, v36, v32);
          (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\"bytes\": [", 10);
          v47 = *(unsigned __int8 ***)(a2 + 8);
          v49 = *v47;
          v48 = v47[1];
          if (v49 != v48)
          {
            if (v49 != v48 - 1)
            {
              do
              {
                v50 = *v49++;
                sub_24BA3B928(v10, v50);
                (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, ", ", 2);
              }
              while (v49 != (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 8) - 1));
            }
            sub_24BA3B928(v10, *v49);
          }
          (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "],\n", 3);
          v51 = v10 + 76;
          if (*((char *)v10 + 631) < 0)
            v51 = (_QWORD *)*v33;
          (*(void (**)(uint64_t *, _QWORD *, uint64_t))(**v10 + 8))(*v10, v51, v32);
          (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "\"subtype\": ", 11);
          v52 = *(_QWORD *)(a2 + 8);
          if (*(_BYTE *)(v52 + 25))
            sub_24BA3B928(v10, *(unsigned __int8 *)(v52 + 24));
          else
            (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "null", 4);
          (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 10);
          v53 = *(void (**)(void))(**v10 + 8);
LABEL_75:
          v53();
          goto LABEL_84;
        }
LABEL_50:
        v36 = (_QWORD *)*v33;
        goto LABEL_51;
      }
      v31();
      v37 = *(unsigned __int8 ***)(a2 + 8);
      v39 = *v37;
      v38 = v37[1];
      if (v39 != v38)
      {
        while (v39 != v38 - 1)
        {
          v40 = *v39++;
          sub_24BA3B928(v10, v40);
          (*(void (**)(uint64_t *, uint64_t))**v10)(*v10, 44);
          v38 = *(unsigned __int8 **)(*(_QWORD *)(a2 + 8) + 8);
        }
        sub_24BA3B928(v10, *v39);
      }
      (*(void (**)(uint64_t *, const char *, uint64_t))(**v10 + 8))(*v10, "],\"subtype\":", 12);
      v46 = *(_QWORD *)(a2 + 8);
      if (!*(_BYTE *)(v46 + 25))
      {
        v11 = *(uint64_t (**)(void))(**v10 + 8);
        return (uint64_t **)v11();
      }
      sub_24BA3B928(v10, *(unsigned __int8 *)(v46 + 24));
LABEL_84:
      v30 = *(uint64_t (**)(void))**v10;
      return (uint64_t **)v30();
    case 9:
      v11 = *(uint64_t (**)(void))(**result + 8);
      return (uint64_t **)v11();
    default:
      return result;
  }
}

void sub_24BA3B14C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251CCBFD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_24BA3B15C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251CCBFD0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t sub_24BA3B18C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 16))(a1 + 24);
}

void sub_24BA3B19C(uint64_t a1, std::string::value_type a2)
{
  std::string::push_back(*(std::string **)(a1 + 8), a2);
}

std::string *sub_24BA3B1A4(uint64_t a1, const std::string::value_type *a2, std::string::size_type a3)
{
  return std::string::append(*(std::string **)(a1 + 8), a2, a3);
}

void sub_24BA3B1B0()
{
  JUMPOUT(0x24BD2C8A8);
}

uint64_t sub_24BA3B1C4(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  lconv *v7;
  char *thousands_sep;
  char *decimal_point;
  int8x16_t *v10;
  int8x16_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  v7 = localeconv();
  *(_QWORD *)(a1 + 80) = v7;
  thousands_sep = v7->thousands_sep;
  if (thousands_sep)
    LOBYTE(thousands_sep) = *thousands_sep;
  *(_BYTE *)(a1 + 88) = (_BYTE)thousands_sep;
  decimal_point = v7->decimal_point;
  if (v7->decimal_point)
    LOBYTE(decimal_point) = *decimal_point;
  *(_OWORD *)(a1 + 90) = 0u;
  *(_BYTE *)(a1 + 89) = (_BYTE)decimal_point;
  *(_OWORD *)(a1 + 106) = 0u;
  *(_OWORD *)(a1 + 122) = 0u;
  *(_OWORD *)(a1 + 138) = 0u;
  *(_OWORD *)(a1 + 154) = 0u;
  *(_OWORD *)(a1 + 170) = 0u;
  *(_OWORD *)(a1 + 186) = 0u;
  *(_OWORD *)(a1 + 202) = 0u;
  *(_OWORD *)(a1 + 218) = 0u;
  *(_OWORD *)(a1 + 234) = 0u;
  *(_OWORD *)(a1 + 250) = 0u;
  *(_OWORD *)(a1 + 266) = 0u;
  *(_OWORD *)(a1 + 282) = 0u;
  *(_OWORD *)(a1 + 298) = 0u;
  *(_OWORD *)(a1 + 314) = 0u;
  *(_OWORD *)(a1 + 330) = 0u;
  *(_OWORD *)(a1 + 346) = 0u;
  *(_OWORD *)(a1 + 362) = 0u;
  *(_OWORD *)(a1 + 378) = 0u;
  *(_OWORD *)(a1 + 394) = 0u;
  *(_OWORD *)(a1 + 410) = 0u;
  *(_OWORD *)(a1 + 426) = 0u;
  *(_OWORD *)(a1 + 442) = 0u;
  *(_OWORD *)(a1 + 458) = 0u;
  *(_OWORD *)(a1 + 474) = 0u;
  *(_OWORD *)(a1 + 490) = 0u;
  *(_OWORD *)(a1 + 506) = 0u;
  *(_OWORD *)(a1 + 522) = 0u;
  *(_OWORD *)(a1 + 538) = 0u;
  *(_OWORD *)(a1 + 554) = 0u;
  *(_OWORD *)(a1 + 570) = 0u;
  *(_OWORD *)(a1 + 586) = 0u;
  *(_BYTE *)(a1 + 602) = a3;
  v10 = (int8x16_t *)operator new(0x208uLL);
  *(_QWORD *)(a1 + 608) = v10;
  *(_QWORD *)(a1 + 624) = 0x8000000000000208;
  v11 = vdupq_n_s8(a3);
  *(_QWORD *)(a1 + 616) = 512;
  *v10 = v11;
  v10[1] = v11;
  v10[2] = v11;
  v10[3] = v11;
  v10[4] = v11;
  v10[5] = v11;
  v10[6] = v11;
  v10[7] = v11;
  v10[8] = v11;
  v10[9] = v11;
  v10[10] = v11;
  v10[11] = v11;
  v10[12] = v11;
  v10[13] = v11;
  v10[14] = v11;
  v10[15] = v11;
  v10[16] = v11;
  v10[17] = v11;
  v10[18] = v11;
  v10[19] = v11;
  v10[20] = v11;
  v10[21] = v11;
  v10[22] = v11;
  v10[23] = v11;
  v10[24] = v11;
  v10[25] = v11;
  v10[26] = v11;
  v10[27] = v11;
  v10[28] = v11;
  v10[29] = v11;
  v10[30] = v11;
  v10[31] = v11;
  v10[32].i8[0] = 0;
  *(_DWORD *)(a1 + 632) = a4;
  return a1;
}

void sub_24BA3B2F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_24BA3B304(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA3B304(uint64_t a1)
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

uint64_t sub_24BA3B35C(uint64_t result, uint64_t *a2, int a3)
{
  unsigned int v3;
  uint64_t v4;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char *v23;
  int v24;
  unint64_t v25;
  uint64_t (*v26)(void);
  int v27;
  _QWORD *exception;
  std::string *v29;
  __int128 v30;
  std::string *v31;
  __int128 v32;
  char *v33;
  std::string::size_type v34;
  std::string *v35;
  __int128 v36;
  uint64_t *v37;
  _QWORD *v38;
  std::string v39;
  std::string v40;
  std::string v41;
  __int128 v42;
  std::string::size_type v43;
  char __str[8];
  std::string::size_type v45;
  char v46;

  LOBYTE(v3) = *((char *)a2 + 23) < 0;
  v4 = *((unsigned __int8 *)a2 + 23);
  if ((v4 & 0x80u) != 0)
    v4 = a2[1];
  if (!v4)
    return result;
  v7 = (_QWORD *)result;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = result + 90;
  do
  {
    if ((v3 & 1) != 0)
      v15 = (uint64_t *)*a2;
    else
      v15 = a2;
    v16 = *((unsigned __int8 *)v15 + v8);
    if (v12)
      v13 = *((_BYTE *)v15 + v8) & 0x3F | (v13 << 6);
    else
      v13 = (0xFFu >> byte_24BA5DFF5[v16]) & v16;
    v12 = byte_24BA5DFF5[16 * v12 + 256 + byte_24BA5DFF5[v16]];
    if (v12 == 1)
    {
      v18 = *((_DWORD *)v7 + 158);
      if ((v18 - 1) < 2)
      {
        v8 -= v9 != 0;
        if (v18 != 1)
        {
          v12 = 0;
          v9 = 0;
          v11 = v10;
          goto LABEL_47;
        }
        if (a3)
        {
          v19 = v14 + v10;
          *(_DWORD *)v19 = 1717990748;
          *(_WORD *)(v19 + 4) = 25702;
          v11 = v10 + 6;
        }
        else
        {
          v11 = v10 + 3;
          v20 = v14 + v10;
          *(_WORD *)v20 = -16401;
          *(_BYTE *)(v20 + 2) = -67;
        }
        goto LABEL_44;
      }
      if (!v18)
      {
        v46 = 3;
        *(_DWORD *)__str = 0;
        snprintf(__str, 3uLL, "%.2X", v16);
        exception = __cxa_allocate_exception(0x20uLL);
        std::to_string(&v39, v8);
        v29 = std::string::insert(&v39, 0, "invalid UTF-8 byte at index ");
        v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
        v40.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v30;
        v29->__r_.__value_.__l.__size_ = 0;
        v29->__r_.__value_.__r.__words[2] = 0;
        v29->__r_.__value_.__r.__words[0] = 0;
        v31 = std::string::append(&v40, ": 0x");
        v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
        v41.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v32;
        v31->__r_.__value_.__l.__size_ = 0;
        v31->__r_.__value_.__r.__words[2] = 0;
        v31->__r_.__value_.__r.__words[0] = 0;
        if (v46 >= 0)
          v33 = __str;
        else
          v33 = *(char **)__str;
        if (v46 >= 0)
          v34 = v46;
        else
          v34 = v45;
        v35 = std::string::append(&v41, v33, v34);
        v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
        v43 = v35->__r_.__value_.__r.__words[2];
        v42 = v36;
        v35->__r_.__value_.__l.__size_ = 0;
        v35->__r_.__value_.__r.__words[2] = 0;
        v35->__r_.__value_.__r.__words[0] = 0;
        sub_24BA3BD30(316, (uint64_t)&v42, exception);
        __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
      }
      v12 = 1;
    }
    else
    {
      if (!v12)
      {
        switch(v13)
        {
          case 8u:
            v17 = 25180;
            goto LABEL_43;
          case 9u:
            v17 = 29788;
            goto LABEL_43;
          case 0xAu:
            v17 = 28252;
            goto LABEL_43;
          case 0xBu:
            goto LABEL_29;
          case 0xCu:
            v17 = 26204;
            goto LABEL_43;
          case 0xDu:
            v17 = 29276;
            goto LABEL_43;
          default:
            if (v13 == 34)
            {
              v17 = 8796;
              goto LABEL_43;
            }
            if (v13 == 92)
            {
              v17 = 23644;
LABEL_43:
              *(_WORD *)(v14 + v11) = v17;
              v11 += 2;
              break;
            }
LABEL_29:
            if (v13 > 0x7E)
              v21 = a3;
            else
              v21 = 0;
            if (v13 >= 0x20 && v21 == 0)
            {
              *(_BYTE *)(v14 + v11++) = *((_BYTE *)v15 + v8);
            }
            else
            {
              v23 = (char *)(v14 + v11);
              if (HIWORD(v13))
              {
                result = snprintf(v23, 0xDuLL, "\\u%04x\\u%04x", (unsigned __int16)((v13 >> 10) - 10304), v13 & 0x3FF | 0xDC00);
                v11 += 12;
              }
              else
              {
                result = snprintf(v23, 7uLL, "\\u%04x", v13);
                v11 += 6;
              }
            }
            break;
        }
LABEL_44:
        if ((unint64_t)(v11 - 500) > 0xC)
        {
          v12 = 0;
          v9 = 0;
          v10 = v11;
        }
        else
        {
          result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v14, v11);
          v12 = 0;
          v11 = 0;
          v10 = 0;
          v9 = 0;
        }
        goto LABEL_47;
      }
      if ((a3 & 1) == 0)
        *(_BYTE *)(v14 + v11++) = *((_BYTE *)v15 + v8);
      ++v9;
    }
LABEL_47:
    ++v8;
    v24 = *((char *)a2 + 23);
    v3 = v24 >> 31;
    v25 = a2[1];
    if (v24 >= 0)
      v25 = *((unsigned __int8 *)a2 + 23);
  }
  while (v8 < v25);
  if (v12)
  {
    v27 = *((_DWORD *)v7 + 158);
    switch(v27)
    {
      case 1:
        (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 8))(*v7, v14, v10);
        v26 = *(uint64_t (**)(void))(*(_QWORD *)*v7 + 8);
        break;
      case 2:
        v26 = *(uint64_t (**)(void))(*(_QWORD *)*v7 + 8);
        break;
      case 0:
        v46 = 3;
        *(_DWORD *)__str = 0;
        v37 = (uint64_t *)*a2;
        if (v24 >= 0)
          v37 = a2;
        snprintf(__str, 3uLL, "%.2X", *((unsigned __int8 *)v37 + v25 - 1));
        v38 = __cxa_allocate_exception(0x20uLL);
        std::operator+<char>();
        sub_24BA3BD30(316, (uint64_t)&v42, v38);
        __cxa_throw(v38, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
      default:
        return result;
    }
    return v26();
  }
  if (v11)
  {
    v26 = *(uint64_t (**)(void))(*(_QWORD *)*v7 + 8);
    return v26();
  }
  return result;
}

void sub_24BA3B868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  void *v39;
  int v40;
  uint64_t v41;

  if (a39 < 0)
  {
    operator delete(__p);
    if ((v40 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v41 - 89) < 0)
        operator delete(*(void **)(v41 - 112));
      _Unwind_Resume(a1);
    }
  }
  else if (!v40)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v39);
  goto LABEL_6;
}

uint64_t sub_24BA3B928(_QWORD *a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  char *v5;

  if (!a2)
    return (**(uint64_t (***)(_QWORD, uint64_t))*a1)(*a1, 48);
  LOBYTE(v2) = a2;
  if (a2 >= 0xA)
  {
    if (a2 >= 0x64)
    {
      *(_WORD *)((char *)a1 + 17) = *(_WORD *)&a00010203040506[2 * (a2 - 100 * ((41 * a2) >> 12))];
      v5 = (char *)a1 + 17;
      v2 = (41 * a2) >> 12;
      goto LABEL_10;
    }
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  v5 = (char *)a1 + v3 + 16;
  if (a2 < 0xA)
  {
LABEL_10:
    *(v5 - 1) = v2 | 0x30;
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
  }
  *((_WORD *)v5 - 1) = *(_WORD *)&a00010203040506[2 * a2];
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
}

uint64_t sub_24BA3B9D4(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  _BYTE *v3;
  char *v4;
  int v6;
  unsigned int v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  if (!a2)
    return (**(uint64_t (***)(_QWORD, uint64_t))*a1)(*a1, 48);
  v2 = a2;
  v3 = a1 + 2;
  if ((v2 & 0x8000000000000000) != 0)
  {
    *v3 = 45;
    v2 = -(uint64_t)v2;
    if (v2 >= 0xA)
    {
      v6 = 4;
      v10 = v2;
      while (1)
      {
        if (v10 <= 0x63)
        {
          v6 -= 2;
          goto LABEL_24;
        }
        if (v10 <= 0x3E7)
          break;
        if (v10 >> 4 < 0x271)
          goto LABEL_24;
        v6 += 4;
        v9 = v10 >= 0x186A0;
        v10 /= 0x2710uLL;
        if (!v9)
        {
          v6 -= 3;
          goto LABEL_24;
        }
      }
      --v6;
    }
    else
    {
      v6 = 1;
    }
LABEL_24:
    v7 = v6 + 1;
  }
  else
  {
    if (v2 < 0xA)
    {
      v4 = (char *)a1 + 17;
LABEL_32:
      *(v4 - 1) = v2 + 48;
      return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
    }
    v7 = 4;
    v8 = v2;
    while (1)
    {
      if (v8 <= 0x63)
      {
        v7 -= 2;
        goto LABEL_25;
      }
      if (v8 <= 0x3E7)
        break;
      if (v8 >> 4 < 0x271)
        goto LABEL_25;
      v7 += 4;
      v9 = v8 >= 0x186A0;
      v8 /= 0x2710uLL;
      if (!v9)
      {
        v7 -= 3;
        goto LABEL_25;
      }
    }
    --v7;
  }
LABEL_25:
  v4 = &v3[v7];
  if (v2 < 0x64)
  {
    v11 = v2;
  }
  else
  {
    do
    {
      v11 = v2 / 0x64;
      *((_WORD *)v4 - 1) = *(_WORD *)&a00010203040506[2 * (v2 % 0x64) + 200];
      v4 -= 2;
      v12 = v2 >> 4;
      v2 /= 0x64uLL;
    }
    while (v12 > 0x270);
  }
  if (v11 < 0xA)
  {
    LOBYTE(v2) = v11;
    goto LABEL_32;
  }
  *((_WORD *)v4 - 1) = *(_WORD *)&a00010203040506[2 * v11 + 200];
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
}

uint64_t sub_24BA3BB94(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (!a2)
    return (**(uint64_t (***)(_QWORD, uint64_t))*a1)(*a1, 48);
  v2 = a2;
  if (a2 < 0xA)
  {
    v3 = (uint64_t)a1 + 17;
LABEL_20:
    *(_BYTE *)(v3 - 1) = v2 + 48;
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
  }
  v5 = 4;
  v6 = a2;
  while (1)
  {
    if (v6 <= 0x63)
    {
      v5 -= 2;
      goto LABEL_13;
    }
    if (v6 <= 0x3E7)
      break;
    if (v6 >> 4 < 0x271)
      goto LABEL_13;
    v7 = v6 >> 5;
    v6 /= 0x2710uLL;
    v5 += 4;
    if (v7 <= 0xC34)
    {
      v5 -= 3;
      goto LABEL_13;
    }
  }
  --v5;
LABEL_13:
  v3 = (uint64_t)a1 + v5 + 16;
  if (a2 < 0x64)
  {
    v8 = a2;
  }
  else
  {
    do
    {
      v8 = v2 / 0x64;
      *(_WORD *)(v3 - 2) = *(_WORD *)&a00010203040506[2 * (v2 % 0x64) + 400];
      v3 -= 2;
      v9 = v2 >> 4;
      v2 /= 0x64uLL;
    }
    while (v9 > 0x270);
  }
  if (v8 < 0xA)
  {
    LOBYTE(v2) = v8;
    goto LABEL_20;
  }
  *(_WORD *)(v3 - 2) = *(_WORD *)&a00010203040506[2 * v8 + 400];
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
}

uint64_t sub_24BA3BCBC(const char *a1, double a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, const char *, uint64_t);
  uint64_t v5;
  const char *v6;

  if ((*(_QWORD *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    v5 = *(_QWORD *)a1;
    v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(_QWORD **)a1 + 8);
    v6 = "null";
    v3 = 4;
  }
  else
  {
    v3 = sub_24BA3C1D0((_BYTE *)a1 + 16, a2) - (_QWORD)(a1 + 16);
    v4 = *(uint64_t (**)(uint64_t, const char *, uint64_t))(**(_QWORD **)a1 + 8);
    v5 = *(_QWORD *)a1;
    v6 = a1 + 16;
  }
  return v4(v5, v6, v3);
}

void sub_24BA3BD30(int a1@<W0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  int v6;
  const std::string::value_type *v7;
  std::string::size_type v8;
  std::string *v9;
  __int128 v10;
  void **v11;
  void *__p;
  char v13;
  std::string v14;
  void *v15[2];
  int64_t v16;

  sub_24BA3C010(&__p, "type_error");
  sub_24BA3BE90(a1, &v14);
  v6 = *(char *)(a2 + 23);
  if (v6 >= 0)
    v7 = (const std::string::value_type *)a2;
  else
    v7 = *(const std::string::value_type **)a2;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  v9 = std::string::append(&v14, v7, v8);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v13 < 0)
    operator delete(__p);
  if (v16 >= 0)
    v11 = v15;
  else
    v11 = (void **)v15[0];
  sub_24BA3C0C0((uint64_t)a3, a1, (uint64_t)v11);
  *a3 = &off_251CCC0A8;
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);
}

void sub_24BA3BE18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3BE60(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&off_251CCC0D0;
  MEMORY[0x24BD2C6BC](&a1[2]);
  std::exception::~exception(a1);
}

void sub_24BA3BE90(int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  std::string *p_p;
  std::string::size_type size;
  std::string *v8;
  __int128 v9;
  std::string *v10;
  std::string __p;
  std::string v12;
  std::string v13;
  std::string v14;

  std::operator+<char>();
  v4 = std::string::append(&v12, ".");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v13.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v8 = std::string::append(&v13, (const std::string::value_type *)p_p, size);
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v10 = std::string::append(&v14, "] ");
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_24BA3BFAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (*(char *)(v26 - 41) < 0)
    operator delete(*(void **)(v26 - 64));
  if (a14 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_24BA3C010(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_24BA396C4();
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

uint64_t sub_24BA3C0C0(uint64_t a1, int a2, uint64_t a3)
{
  *(_QWORD *)a1 = &off_251CCC0D0;
  *(_DWORD *)(a1 + 8) = a2;
  MEMORY[0x24BD2C6B0](a1 + 16, a3);
  return a1;
}

void sub_24BA3C0FC(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void sub_24BA3C110(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&off_251CCC0D0;
  MEMORY[0x24BD2C6BC](&a1[2]);
  std::exception::~exception(a1);
  JUMPOUT(0x24BD2C8A8);
}

const char *sub_24BA3C154(const std::runtime_error *a1)
{
  return std::runtime_error::what(a1 + 1);
}

void sub_24BA3C15C(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&off_251CCC0D0;
  MEMORY[0x24BD2C6BC](&a1[2]);
  std::exception::~exception(a1);
}

void sub_24BA3C18C(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&off_251CCC0D0;
  MEMORY[0x24BD2C6BC](&a1[2]);
  std::exception::~exception(a1);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t sub_24BA3C1D0(_BYTE *a1, double a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  unsigned int v10;
  char v11;
  char v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;

  v2 = (uint64_t)a1;
  if ((*(_QWORD *)&a2 & 0x8000000000000000) != 0)
  {
    a2 = -a2;
    *a1 = 45;
    v2 = (uint64_t)(a1 + 1);
  }
  if (a2 == 0.0)
  {
    *(_WORD *)v2 = 11824;
    result = v2 + 3;
    *(_BYTE *)(v2 + 2) = 48;
    return result;
  }
  v15 = 0;
  sub_24BA3C3F0(v2, (int *)&v15 + 1, &v15, a2);
  v4 = SHIDWORD(v15);
  v5 = (int)v15 + (uint64_t)SHIDWORD(v15);
  if ((v15 & 0x80000000) == 0 && (int)v5 <= 15)
  {
    memset((void *)(v2 + SHIDWORD(v15)), 48, (int)v15);
    *(_WORD *)(v2 + v5) = 12334;
    return v2 + v5 + 2;
  }
  if ((v5 - 16) >= 0xFFFFFFF1)
  {
    v7 = (_BYTE *)(v2 + v5);
    memmove(v7 + 1, v7, SHIDWORD(v15) - (unint64_t)v5);
    *v7 = 46;
    return v4 + v2 + 1;
  }
  if ((_DWORD)v5 == 0 || v5 >= 0xFFFFFFFD)
  {
    v6 = -(int)v5;
    memmove((void *)(v2 + v6 + 2), (const void *)v2, SHIDWORD(v15));
    *(_WORD *)v2 = 11824;
    memset((void *)(v2 + 2), 48, v6);
    return v2 + v4 + v6 + 2;
  }
  if (HIDWORD(v15) == 1)
  {
    v8 = 1;
  }
  else
  {
    memmove((void *)(v2 + 2), (const void *)(v2 + 1), SHIDWORD(v15) - 1);
    *(_BYTE *)(v2 + 1) = 46;
    v8 = v4 + 1;
  }
  v9 = (_BYTE *)(v2 + v8);
  *v9 = 101;
  v10 = v5 - 1;
  if ((int)v5 >= 1)
    v11 = 43;
  else
    v11 = 45;
  if ((int)v5 - 1 < 0)
    v10 = 1 - v5;
  v9[1] = v11;
  if (v10 > 9)
  {
    if (v10 > 0x63)
    {
      v9[2] = v10 / 0x64 + 48;
      v14 = v10 % 0x64;
      v9[3] = (v14 / 0xAu) | 0x30;
      v9[4] = (v14 % 0xAu) | 0x30;
      v13 = 2;
      return (uint64_t)&v9[v13 + 3];
    }
    v9[2] = v10 / 0xAu + 48;
    v12 = (v10 % 0xAu) | 0x30;
  }
  else
  {
    v9[2] = 48;
    v12 = v10 + 48;
  }
  v9[3] = v12;
  v13 = 1;
  return (uint64_t)&v9[v13 + 3];
}

uint64_t sub_24BA3C3F0(uint64_t a1, int *a2, _DWORD *a3, double a4)
{
  int v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  _OWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  _QWORD v25[2];
  __int128 v26;
  __int128 v27;

  sub_24BA3C514((uint64_t)v20, a4);
  v27 = v20[1];
  v26 = v20[0];
  v25[0] = v21;
  v25[1] = v22;
  if (-61 - (int)v22 <= 0)
    v7 = 78913 * (-61 - (int)v22) / 0x40000;
  else
    v7 = 78913 * (-61 - (int)v22) / 0x40000 + 1;
  v8 = (uint64_t *)((char *)&unk_24BA5E3E0 + 16
                                          * ((int)((v7 + 307 + (((v7 + 307) >> 28) & 7)) << 16) >> 19));
  v9 = v8[1];
  v23 = *v8;
  v24 = v9;
  v10 = sub_24BA3C5BC(&v26, &v23);
  v12 = v11;
  v13 = sub_24BA3C5BC(&v27, &v23);
  v15 = v14;
  v16 = sub_24BA3C5BC(v25, &v23);
  *a3 = -HIDWORD(v9);
  return sub_24BA3C61C(a1, a2, a3, v13 + 1, v15, v10, v12, v18, v16 - 1, v17);
}

void sub_24BA3C514(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char v7;
  uint64_t v8;

  v2 = *(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL;
  if (*(_QWORD *)&a2 >> 52)
  {
    LODWORD(v5) = (*(_QWORD *)&a2 >> 52) - 1075;
    v3 = 2 * (v2 | 0x10000000000000);
    v4 = (2 * (*(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL | 0x10000000000000)) | 1;
    v6 = (*(_QWORD *)&a2 >> 52) - 1076;
    if (*(_QWORD *)&a2 >> 53 && !v2)
    {
      v7 = (*(_QWORD *)&a2 >> 52) - 53;
      v8 = 0x3FFFFFFFFFFFFFLL;
      v2 = 0x10000000000000;
      goto LABEL_8;
    }
    v2 |= 0x10000000000000uLL;
  }
  else
  {
    v3 = 2 * v2;
    v4 = (2 * (*(_QWORD *)&a2 & 0xFFFFFFFFFFFFFLL)) | 1;
    LODWORD(v5) = -1074;
    v6 = -1075;
  }
  v8 = v3 - 1;
  v7 = v6;
  do
  {
LABEL_8:
    v4 *= 2;
    --v6;
  }
  while ((v4 & 0x8000000000000000) == 0);
  do
  {
    v2 *= 2;
    v5 = (v5 - 1);
  }
  while ((v2 & 0x8000000000000000) == 0);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v8 << (v7 - v6);
  *(_DWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v4;
  *(_DWORD *)(a1 + 40) = v6;
}

unint64_t sub_24BA3C5BC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = HIDWORD(*a1);
  v3 = HIDWORD(*a2);
  v4 = v3 * (unint64_t)*a1;
  v5 = *a2 * (unint64_t)v2;
  return HIDWORD(v5)
       + v3 * (unint64_t)v2
       + HIDWORD(v4)
       + ((((*a2 * (unint64_t)*a1) >> 32)
         + v4
         + v5
         + 0x80000000) >> 32);
}

uint64_t sub_24BA3C61C(uint64_t result, int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, int a10)
{
  unint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v10 = a9 - a4;
  v11 = a9 - a6;
  v12 = -a10;
  v13 = 1 << -(char)a10;
  v14 = a9 >> -(char)a10;
  v15 = (v13 - 1) & a9;
  if (v14 <= 0x3B9AC9FF)
  {
    if (v14 <= 0x5F5E0FF)
    {
      if (v14 <= 0x98967F)
      {
        if (v14 <= 0xF423F)
        {
          v18 = v14 >> 5;
          v19 = v14 >> 4;
          if (v14 <= 9)
            v20 = 1;
          else
            v20 = 10;
          if (v14 <= 9)
            v21 = 1;
          else
            v21 = 2;
          if (v14 <= 0x63)
            v22 = v20;
          else
            v22 = 100;
          if (v14 <= 0x63)
            v23 = v21;
          else
            v23 = 3;
          if (v14 <= 0x3E7)
            v24 = v22;
          else
            v24 = 1000;
          if (v14 <= 0x3E7)
            v25 = v23;
          else
            v25 = 4;
          if (v19 <= 0x270)
            v26 = v24;
          else
            v26 = 10000;
          if (v19 <= 0x270)
            v27 = v25;
          else
            v27 = 5;
          if (v18 > 0xC34)
            v16 = 100000;
          else
            v16 = v26;
          if (v18 <= 0xC34)
            v17 = v27;
          else
            v17 = 6;
        }
        else
        {
          v16 = 1000000;
          v17 = 7;
        }
      }
      else
      {
        v16 = 10000000;
        v17 = 8;
      }
    }
    else
    {
      v16 = 100000000;
      v17 = 9;
    }
  }
  else
  {
    v16 = 1000000000;
    v17 = 10;
  }
  v28 = -a6;
  v29 = -a4;
  v30 = a6 - a9;
  while (v17 > 0)
  {
    v31 = v14 / v16;
    v14 = v14 % v16;
    v32 = *a2;
    *a2 = v32 + 1;
    *(_BYTE *)(result + v32) = v31 + 48;
    --v17;
    v33 = (v14 << v12) + v15;
    if (v10 >= v33)
    {
      *a3 += v17;
      v34 = (unint64_t)v16 << v12;
      if (v33 >= v11 || v10 - v33 < v34)
        return result;
      v36 = *a2 - 1;
      v37 = v15 + (v14 << v12) + v34;
      v38 = v29 - v37;
      v39 = a9;
      do
      {
        if (v37 >= v11 && v28 - v33 + v39 <= v30 + v37)
          break;
        --*(_BYTE *)(result + v36);
        if (v37 >= v11)
          break;
        v40 = v38 + v39;
        v39 -= v34;
        v37 += v34;
      }
      while (v40 >= v34);
    }
    else
    {
      v16 /= 0xAu;
    }
    if (v10 >= v33)
      return result;
  }
  v41 = 0;
  do
  {
    v42 = v10;
    v43 = v11;
    v44 = 5 * v15;
    v45 = *a2;
    *a2 = v45 + 1;
    *(_BYTE *)(result + v45) = ((unint64_t)(2 * v44) >> v12) + 48;
    v10 = 10 * v42;
    v11 *= 10;
    --v41;
    v15 = (v13 - 1) & (2 * v44);
  }
  while (10 * v42 < v15);
  *a3 += v41;
  if (v15 < v11 && 10 * v42 - v15 >= v13)
  {
    v46 = *a2 - 1;
    v47 = 10 * v43;
    v48 = -(uint64_t)v15;
    v49 = 10 * v42 - v13;
    v50 = v13 + v15;
    v51 = -10 * v43;
    do
    {
      if (v50 >= v11 && v47 + v48 <= v51 + v50)
        break;
      --*(_BYTE *)(result + v46);
      if (v50 >= v11)
        break;
      v52 = v49 + v48;
      v48 -= v13;
      v50 += v13;
    }
    while (v52 >= v13);
  }
  return result;
}

uint64_t sub_24BA3C8FC(uint64_t a1)
{
  if (*(char *)(a1 + 631) < 0)
    operator delete(*(void **)(a1 + 608));
  return sub_24BA3B304(a1);
}

void sub_24BA3C92C(char ***a1, int a2)
{
  int v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void **v10;
  void **v11;
  uint64_t v12;
  char *v13;
  char *v14;
  BOOL v15;
  uint64_t i;
  unint64_t v17;
  char **v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char **v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void **v29;
  void **v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char **v34;
  char *v35;
  char *v36;
  unsigned __int8 v37;
  char **v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char **v42;
  void **v43;
  void **v44;
  void **v45;
  unint64_t *v46;

  v39 = 0;
  v40 = 0;
  v41 = 0;
  v3 = a2 - 1;
  if (a2 == 1)
  {
    sub_24BA3CD94(&v39, (unint64_t)(*a1)[2]);
    v4 = (uint64_t)(*a1 + 1);
    v5 = **a1;
    if (v5 != (char *)v4)
    {
      v6 = v40;
      do
      {
        if (v6 >= v41)
        {
          v7 = (uint64_t)(v6 - v39) >> 4;
          if ((unint64_t)(v7 + 1) >> 60)
            sub_24BA39774();
          v8 = (uint64_t)(v41 - v39) >> 3;
          if (v8 <= v7 + 1)
            v8 = v7 + 1;
          if (v41 - v39 >= 0x7FFFFFFFFFFFFFF0)
            v9 = 0xFFFFFFFFFFFFFFFLL;
          else
            v9 = v8;
          v46 = &v41;
          v10 = (void **)sub_24BA3CE98((uint64_t)&v41, v9);
          v11 = &v10[2 * v7];
          v42 = (char **)v10;
          v43 = v11;
          v45 = &v10[2 * v12];
          *(_BYTE *)v11 = v5[56];
          v11[1] = (void *)*((_QWORD *)v5 + 8);
          v5[56] = 0;
          *((_QWORD *)v5 + 8) = 0;
          v44 = v11 + 2;
          sub_24BA3CE24(&v39, &v42);
          v6 = v40;
          sub_24BA3CFD4((uint64_t)&v42);
        }
        else
        {
          *(_BYTE *)v6 = v5[56];
          *(_QWORD *)(v6 + 8) = *((_QWORD *)v5 + 8);
          v5[56] = 0;
          *((_QWORD *)v5 + 8) = 0;
          v6 += 16;
        }
        v40 = v6;
        v13 = (char *)*((_QWORD *)v5 + 1);
        if (v13)
        {
          do
          {
            v14 = v13;
            v13 = *(char **)v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            v14 = (char *)*((_QWORD *)v5 + 2);
            v15 = *(_QWORD *)v14 == (_QWORD)v5;
            v5 = v14;
          }
          while (!v15);
        }
        v5 = v14;
      }
      while (v14 != (char *)v4);
    }
  }
  else if (a2 == 2)
  {
    sub_24BA3CD94(&v39, ((*a1)[1] - **a1) >> 4);
    sub_24BA3D024((uint64_t)&v42, **a1, (*a1)[1], &v39);
  }
  for (i = v40; v39 != v40; i = v40)
  {
    v37 = *(_BYTE *)(i - 16);
    v38 = *(char ***)(i - 8);
    *(_BYTE *)(i - 16) = 0;
    *(_QWORD *)(i - 8) = 0;
    v17 = v40 - 16;
    sub_24BA3C92C(v40 - 8, *(unsigned __int8 *)(v40 - 16));
    v40 = v17;
    if (v37 == 1)
    {
      v23 = (uint64_t)v38;
      v24 = v38 + 1;
      v25 = *v38;
      if (*v38 != (char *)(v38 + 1))
      {
        do
        {
          if (v17 >= v41)
          {
            v26 = (uint64_t)(v17 - v39) >> 4;
            if ((unint64_t)(v26 + 1) >> 60)
              sub_24BA39774();
            v27 = (uint64_t)(v41 - v39) >> 3;
            if (v27 <= v26 + 1)
              v27 = v26 + 1;
            if (v41 - v39 >= 0x7FFFFFFFFFFFFFF0)
              v28 = 0xFFFFFFFFFFFFFFFLL;
            else
              v28 = v27;
            v46 = &v41;
            v29 = (void **)sub_24BA3CE98((uint64_t)&v41, v28);
            v30 = &v29[2 * v26];
            v42 = (char **)v29;
            v43 = v30;
            v45 = &v29[2 * v31];
            *(_BYTE *)v30 = v25[56];
            v30[1] = (void *)*((_QWORD *)v25 + 8);
            v25[56] = 0;
            *((_QWORD *)v25 + 8) = 0;
            v44 = v30 + 2;
            sub_24BA3CE24(&v39, &v42);
            v17 = v40;
            sub_24BA3CFD4((uint64_t)&v42);
          }
          else
          {
            *(_BYTE *)v17 = v25[56];
            *(_QWORD *)(v17 + 8) = *((_QWORD *)v25 + 8);
            v25[56] = 0;
            *((_QWORD *)v25 + 8) = 0;
            v17 += 16;
          }
          v40 = v17;
          v32 = (char *)*((_QWORD *)v25 + 1);
          if (v32)
          {
            do
            {
              v33 = v32;
              v32 = *(char **)v32;
            }
            while (v32);
          }
          else
          {
            do
            {
              v33 = (char *)*((_QWORD *)v25 + 2);
              v15 = *(_QWORD *)v33 == (_QWORD)v25;
              v25 = v33;
            }
            while (!v15);
          }
          v25 = v33;
        }
        while (v33 != (char *)v24);
        v23 = (uint64_t)v38;
      }
      sub_24BA3D168(v23, *(char **)(v23 + 8));
      *(_QWORD *)v23 = v23 + 8;
      *(_QWORD *)(v23 + 16) = 0;
      *(_QWORD *)(v23 + 8) = 0;
    }
    else if (v37 == 2)
    {
      sub_24BA3D024((uint64_t)&v42, *v38, v38[1], &v39);
      v18 = v38;
      v20 = *v38;
      v19 = v38[1];
      if (v19 != *v38)
      {
        v21 = v19 - 8;
        do
        {
          v22 = v21 - 8;
          sub_24BA3C92C(v21, *(v21 - 8));
          v21 -= 16;
        }
        while (v22 != v20);
      }
      v18[1] = v20;
    }
    sub_24BA3C92C(&v38, v37);
  }
  switch(v3)
  {
    case 0:
      sub_24BA3D168((uint64_t)*a1, (*a1)[1]);
      goto LABEL_55;
    case 1:
      v42 = *a1;
      sub_24BA3D204((void ***)&v42);
      goto LABEL_55;
    case 2:
      v34 = *a1;
      if ((*((char *)*a1 + 23) & 0x80000000) == 0)
        goto LABEL_56;
      v35 = *v34;
      break;
    case 7:
      v34 = *a1;
      v36 = **a1;
      if (!v36)
        goto LABEL_56;
      v34[1] = v36;
      v35 = v36;
      break;
    default:
      goto LABEL_57;
  }
  operator delete(v35);
LABEL_55:
  v34 = *a1;
LABEL_56:
  operator delete(v34);
LABEL_57:
  v42 = (char **)&v39;
  sub_24BA3D204((void ***)&v42);
}

void sub_24BA3CD60(void *a1)
{
  sub_24BA39478(a1);
}

uint64_t sub_24BA3CD94(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60)
      sub_24BA39774();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = sub_24BA3CE98(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 16 * v6;
    sub_24BA3CE24(a1, v7);
    return sub_24BA3CFD4((uint64_t)v7);
  }
  return result;
}

void sub_24BA3CE10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA3CE24(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_24BA3CECC((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_24BA3CE98(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    sub_24BA3974C();
  return operator new(16 * a2);
}

uint64_t sub_24BA3CECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      v8 = *(_BYTE *)(a3 - 16);
      a3 -= 16;
      *(_BYTE *)(v7 - 16) = v8;
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(a3 + 8);
      *(_BYTE *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      v7 = *((_QWORD *)&v14 + 1) - 16;
      *((_QWORD *)&v14 + 1) -= 16;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  sub_24BA3CF64((uint64_t)v11);
  return v9;
}

uint64_t sub_24BA3CF64(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_24BA3CF98(a1);
  return a1;
}

uint64_t sub_24BA3CF98(uint64_t result)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned int v4;

  v1 = *(unsigned __int8 **)(*(_QWORD *)(result + 16) + 8);
  v2 = *(unsigned __int8 **)(*(_QWORD *)(result + 8) + 8);
  while (v1 != v2)
  {
    v3 = v1 + 8;
    v4 = *v1;
    v1 += 16;
    result = sub_24BA3C92C(v3, v4);
  }
  return result;
}

uint64_t sub_24BA3CFD4(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v5 = *(unsigned __int8 *)(i - 16);
    v4 = i - 16;
    *(_QWORD *)(a1 + 16) = v4;
    sub_24BA3C92C(v4 + 8, v5);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char *sub_24BA3D024(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  char *v5;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD v17[5];

  v5 = a2;
  if (a2 != a3)
  {
    v7 = (unint64_t *)(a4 + 2);
    v8 = a4[1];
    do
    {
      if (v8 >= *v7)
      {
        v9 = (uint64_t)(v8 - *a4) >> 4;
        if ((unint64_t)(v9 + 1) >> 60)
          sub_24BA39774();
        v10 = *v7 - *a4;
        v11 = v10 >> 3;
        if (v10 >> 3 <= (unint64_t)(v9 + 1))
          v11 = v9 + 1;
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
          v12 = 0xFFFFFFFFFFFFFFFLL;
        else
          v12 = v11;
        v17[4] = a4 + 2;
        v13 = (char *)sub_24BA3CE98((uint64_t)(a4 + 2), v12);
        v14 = &v13[16 * v9];
        v17[0] = v13;
        v17[1] = v14;
        v17[3] = &v13[16 * v15];
        *v14 = *v5;
        *((_QWORD *)v14 + 1) = *((_QWORD *)v5 + 1);
        *v5 = 0;
        *((_QWORD *)v5 + 1) = 0;
        v17[2] = v14 + 16;
        sub_24BA3CE24(a4, v17);
        v8 = a4[1];
        sub_24BA3CFD4((uint64_t)v17);
      }
      else
      {
        *(_BYTE *)v8 = *v5;
        *(_QWORD *)(v8 + 8) = *((_QWORD *)v5 + 1);
        *v5 = 0;
        *((_QWORD *)v5 + 1) = 0;
        v8 += 16;
      }
      a4[1] = v8;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void sub_24BA3D154(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24BA3D168(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_24BA3D168(a1, *(_QWORD *)a2);
    sub_24BA3D168(a1, *((_QWORD *)a2 + 1));
    sub_24BA3C92C(a2 + 64, a2[56]);
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

void sub_24BA3D1C4(uint64_t a1, uint64_t a2)
{
  sub_24BA3C92C((char ***)(a2 + 32), *(unsigned __int8 *)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

void sub_24BA3D204(void ***a1)
{
  void **v1;
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = (uint64_t)v4 - 8;
      do
      {
        v7 = (void *)(v6 - 8);
        sub_24BA3C92C(v6, *(unsigned __int8 *)(v6 - 8));
        v6 -= 16;
      }
      while (v7 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_24BA3D28C(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t a3)
{
  unsigned __int8 *v6;
  uint64_t TagFallback;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 v10;
  uint64_t BuiltinType;
  int v12;
  uint64_t DecodingType;
  char *v14;
  void *exception;
  unsigned __int8 *v16;
  int WireTypeForType;
  int v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  unint64_t *v29;
  char *v30;
  char Varint64Fallback;
  char LittleEndian32Fallback;
  char *v33;
  double *v34;
  double *v35;
  const std::string::value_type *v36;
  std::string *(__cdecl *v37)(std::string *__return_ptr __struct_ptr, double);
  double v38;
  const char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  unsigned int v44;
  unint64_t v45;
  float v46;
  char *v47;
  const char *v48;
  double v49;
  const char *v50;
  char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t (*v54)(int, int);
  char *v55;
  int v56;
  uint64_t (*v57)(int, int);
  int v58;
  double *v59;
  uint64_t v60;
  int v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL8 v65;
  char *v66;
  double *v67;
  const std::string::value_type *v68;
  std::string *(__cdecl *v69)(std::string *__return_ptr __struct_ptr, float);
  float v70;
  const char *v71;
  uint64_t v72;
  double *v73;
  char Raw;
  void *v75;
  int v76;
  BOOL v77;
  int v78;
  unint64_t v79;
  uint64_t v80;
  std::string *(__cdecl *v81)(std::string *__return_ptr __struct_ptr, float);
  uint64_t v82;
  std::string *(__cdecl *v83)(std::string *__return_ptr __struct_ptr, double);
  void *v84;
  int UnpackedType;
  uint64_t v86;
  unsigned int v87;
  __n128 v88;
  unint64_t v89;
  __n128 v90;
  unint64_t v91;
  __n128 v92;
  unint64_t v93;
  void *__p;
  char *v95;
  char *v96;
  wireless_diagnostics::google::protobuf::io::CodedInputStream *v97;
  int v98;
  unsigned int v99;
  __int128 v100;
  uint64_t v101;
  __n128 v102;
  unint64_t v103;
  __int128 v104;
  uint64_t v105;
  unint64_t v106[2];
  unint64_t v107;
  __n128 v108;
  unint64_t v109;
  __n128 v110;
  unint64_t v111;
  __n128 v112;
  unint64_t v113;
  unsigned int v114[4];
  unint64_t v115;
  unsigned int v116[4];
  int64_t v117;
  unsigned int v118[4];
  unint64_t v119;

  v6 = (unsigned __int8 *)*((_QWORD *)this + 1);
  if ((unint64_t)v6 >= *((_QWORD *)this + 2) || (char)*v6 < 0)
  {
    TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if ((_DWORD)TagFallback)
      goto LABEL_4;
LABEL_10:
    if (*((_BYTE *)this + 36))
      return;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
    goto LABEL_233;
  }
  TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((_QWORD *)this + 1) = v6 + 1;
  if (!(_DWORD)TagFallback)
    goto LABEL_10;
LABEL_4:
  v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  v9 = HIDWORD(v8);
  v10 = v8;
  v102 = *a2;
  v103 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a3 + 16), &v102, HIDWORD(v8), (uint64_t)&v104);
  v100 = v104;
  v101 = v105;
  BuiltinType = MetadataHelper::getBuiltinType(a3 + 16, (MetadataHandle *)&v100);
  v12 = BuiltinType;
  DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(_QWORD *)v118 = 0;
          if (sub_24BA3E798(this, (unint64_t *)v118))
            goto LABEL_205;
          goto LABEL_180;
        case 1u:
          *(_QWORD *)v118 = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v118) & 1) != 0)goto LABEL_180;
LABEL_205:
          v79 = *(_QWORD *)v118;
          goto LABEL_208;
        case 2u:
          v116[0] = 0;
          if ((sub_24BA3E7C8(this, v116) & 1) == 0)
            goto LABEL_180;
          sub_24BA38754(v118, v116[0]);
          Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v118);
          if ((Raw & 1) != 0)
            sub_24BA3EB08(a3, *(_BYTE **)v118, *(_QWORD *)&v118[2] - *(_QWORD *)v118, v9);
          goto LABEL_196;
        case 5u:
          v118[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118))goto LABEL_180;
          v79 = v118[0];
LABEL_208:
          sub_24BA3EA48(a3, v79, v9);
          break;
        default:
          goto LABEL_180;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      v106[0] = 0;
      switch(v10)
      {
        case 0u:
          v14 = (char *)*((_QWORD *)this + 1);
          if ((unint64_t)v14 < *((_QWORD *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            v106[0] = *v14;
            *((_QWORD *)this + 1) = v14 + 1;
LABEL_91:
            v45 = v106[0];
            switch(v12)
            {
              case 1:
              case 15:
                v49 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v106[0]);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                v47 = sub_24BA3F240(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                v117 = 0;
                if (v12 == 11)
                {
                  v112 = v108;
                  v113 = v109;
                  sub_24BA3F2C0(a3, (MetadataHandle *)&v112, v9, (unint64_t)v49, v114);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(_OWORD *)v116 = *(_OWORD *)v114;
                  v117 = v115;
                }
                else if (v12 == 12)
                {
                  v50 = sub_24BA4EF64(a3, v49 != 0.0);
                  MEMORY[0x24BD2C710](v116, v50);
                }
                v82 = HIBYTE(v117);
                if (v117 < 0)
                  v82 = *(_QWORD *)&v116[2];
                if (!v82)
                {
                  *(__n128 *)v114 = v108;
                  v115 = v109;
                  v83 = sub_24BA3F530(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, double))v83)(&v110, a3, v49);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(__n128 *)v116 = v110;
                  v117 = v111;
                }
                goto LABEL_228;
              case 2:
              case 16:
                v46 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v106[0]);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                v47 = sub_24BA3F240(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                v117 = 0;
                if (v12 == 11)
                {
                  v112 = v108;
                  v113 = v109;
                  sub_24BA3F2C0(a3, (MetadataHandle *)&v112, v9, (unint64_t)v46, v114);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(_OWORD *)v116 = *(_OWORD *)v114;
                  v117 = v115;
                }
                else if (v12 == 12)
                {
                  v48 = sub_24BA4EF64(a3, v46 != 0.0);
                  MEMORY[0x24BD2C710](v116, v48);
                }
                v80 = HIBYTE(v117);
                if (v117 < 0)
                  v80 = *(_QWORD *)&v116[2];
                if (!v80)
                {
                  *(__n128 *)v114 = v108;
                  v115 = v109;
                  v81 = sub_24BA3F840(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, float))v81)(&v110, a3, v46);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(__n128 *)v116 = v110;
                  v117 = v111;
                }
LABEL_228:
                sub_24BA4EEE0(a3, v47, (uint64_t)v116);
                goto LABEL_229;
              case 3:
              case 11:
              case 17:
              case 25:
                *(_QWORD *)v116 = v106[0];
                goto LABEL_103;
              case 4:
              case 10:
              case 18:
              case 24:
                *(_QWORD *)v116 = v106[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                sub_24BA3EBD0(a3, (uint64_t *)v116, (__int128 *)v118, v9, v12);
                return;
              case 5:
              case 19:
                *(_QWORD *)v116 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v106[0]);
LABEL_103:
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                sub_24BA3EF08(a3, (uint64_t *)v116, (__int128 *)v118, v9, v12);
                return;
              case 6:
              case 20:
                v116[0] = v106[0];
                goto LABEL_105;
              case 7:
              case 9:
              case 21:
              case 23:
                v116[0] = v106[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                sub_24BA3ED6C(a3, v116, (__int128 *)v118, v9, v12);
                return;
              case 8:
              case 22:
                v116[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v106[0]);
LABEL_105:
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                sub_24BA3F0A4(a3, v116, (__int128 *)v118, v9, v12);
                return;
              case 12:
              case 26:
                v110 = *a2;
                v111 = a2[1].n128_u64[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                v51 = sub_24BA3F240(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                v117 = 0;
                if (v12 != 12)
                  goto LABEL_110;
                v52 = sub_24BA4EF64(a3, v45 != 0);
                MEMORY[0x24BD2C710](v116, v52);
                v53 = HIBYTE(v117);
                if (v117 < 0)
                  v53 = *(_QWORD *)&v116[2];
                if (!v53)
                {
LABEL_110:
                  *(__n128 *)v114 = v110;
                  v115 = v111;
                  v54 = sub_24BA3F9CC(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, BOOL))v54)(&v112, a3, v45 != 0);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(__n128 *)v116 = v112;
                  v117 = v113;
                }
                sub_24BA4EEE0(a3, v51, (uint64_t)v116);
LABEL_229:
                if (SHIBYTE(v117) < 0)
                  operator delete(*(void **)v116);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x24BD2C6B0](exception, "This should never happen, no matter what the input!");
                goto LABEL_233;
            }
          }
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v106) & 1) != 0)
            goto LABEL_91;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_116;
          return;
        case 1u:
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, v106) & 1) != 0)
            goto LABEL_91;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_116;
          return;
        case 2u:
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_116;
          return;
        case 5u:
          v118[0] = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118) & 1) != 0)
          {
            v106[0] = v118[0];
            goto LABEL_91;
          }
          if (!(_DWORD)v9 && *((_BYTE *)this + 36))
            return;
LABEL_116:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_91;
      }
      goto LABEL_233;
    case 13:
      v116[0] = 0;
      v41 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v41 >= *((_QWORD *)this + 2) || *v41 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v116))goto LABEL_180;
      }
      else
      {
        v116[0] = *v41;
        *((_QWORD *)this + 1) = v41 + 1;
      }
      memset(v118, 0, sizeof(v118));
      v119 = 0;
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if ((Raw & 1) != 0)
      {
        v92 = *a2;
        v93 = a2[1].n128_u64[0];
        sub_24BA3E7F8(a3, (uint64_t)v118, (__int128 *)&v92, v9);
      }
      if ((SHIBYTE(v119) & 0x80000000) == 0)
        goto LABEL_199;
      v75 = *(void **)v118;
      goto LABEL_198;
    case 14:
      v116[0] = 0;
      v43 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v43 >= *((_QWORD *)this + 2) || *v43 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v116))goto LABEL_180;
        v44 = v116[0];
      }
      else
      {
        v44 = *v43;
        v116[0] = v44;
        *((_QWORD *)this + 1) = v43 + 1;
      }
      sub_24BA38754(v118, v44);
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v118);
      if ((Raw & 1) != 0)
      {
        v90 = *a2;
        v91 = a2[1].n128_u64[0];
        sub_24BA3E888(a3, (uint64_t)v118, (__int128 *)&v90, v9);
      }
LABEL_196:
      v75 = *(void **)v118;
      if (*(_QWORD *)v118)
      {
        *(_QWORD *)&v118[2] = *(_QWORD *)v118;
LABEL_198:
        operator delete(v75);
      }
LABEL_199:
      if ((Raw & 1) != 0)
        return;
      goto LABEL_180;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      v87 = v9;
      v99 = 0;
      v16 = (unsigned __int8 *)*((_QWORD *)this + 1);
      if ((unint64_t)v16 >= *((_QWORD *)this + 2) || (char)*v16 < 0)
      {
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v99) & 1) != 0)
          goto LABEL_16;
LABEL_180:
        if (!(_DWORD)v9 && *((_BYTE *)this + 36))
          return;
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
LABEL_233:
        __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      v99 = *v16;
      *((_QWORD *)this + 1) = v16 + 1;
LABEL_16:
      v86 = a3;
      UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      v97 = this;
      v98 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      __p = 0;
      v95 = 0;
      v96 = 0;
      while (1)
      {
        v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1)
          break;
        v19 = v95;
        if (v95 >= v96)
        {
          v21 = (char *)__p;
          v22 = (v95 - (_BYTE *)__p) >> 3;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61)
            sub_24BA39774();
          v24 = v96 - (_BYTE *)__p;
          if ((v96 - (_BYTE *)__p) >> 2 > v23)
            v23 = v24 >> 2;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
            v25 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v25 = v23;
          if (v25)
          {
            v26 = (char *)sub_24BA39788((uint64_t)&v96, v25);
            v21 = (char *)__p;
            v19 = v95;
          }
          else
          {
            v26 = 0;
          }
          v27 = &v26[8 * v22];
          *(_QWORD *)v27 = 0;
          v20 = v27 + 8;
          while (v19 != v21)
          {
            v28 = *((_QWORD *)v19 - 1);
            v19 -= 8;
            *((_QWORD *)v27 - 1) = v28;
            v27 -= 8;
          }
          __p = v27;
          v95 = v20;
          v96 = &v26[8 * v25];
          if (v21)
            operator delete(v21);
        }
        else
        {
          *(_QWORD *)v95 = 0;
          v20 = v19 + 8;
        }
        v95 = v20;
        switch(WireTypeForType)
        {
          case 0:
            v29 = (unint64_t *)(v20 - 8);
            v30 = (char *)*((_QWORD *)this + 1);
            if ((unint64_t)v30 >= *((_QWORD *)this + 2) || *v30 < 0)
            {
              Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0)
                goto LABEL_177;
            }
            else
            {
              *v29 = *v30;
              *((_QWORD *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_177;
          case 5:
            v118[0] = 0;
            LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118);
            *((_QWORD *)v95 - 1) = v118[0];
            if ((LittleEndian32Fallback & 1) == 0)
              goto LABEL_177;
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_24BA400A0((uint64_t *)&__p, &v108);
          *(__n128 *)v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v118 = *a2;
          v119 = a2[1].n128_u64[0];
          v33 = sub_24BA3F240(v86, (MetadataHandle *)v118, v87);
          v34 = (double *)v108.n128_u64[1];
          v35 = (double *)v108.n128_u64[0];
          if (v108.n128_u64[0] == v108.n128_u64[1])
            goto LABEL_169;
          v36 = v33;
          v37 = 0;
          do
          {
            v38 = *v35;
            memset(v116, 0, sizeof(v116));
            v117 = 0;
            if (UnpackedType == 11)
            {
              v112 = *(__n128 *)v106;
              v113 = v107;
              sub_24BA3F2C0(v86, (MetadataHandle *)&v112, v87, (unint64_t)v38, v114);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              *(_OWORD *)v116 = *(_OWORD *)v114;
              v117 = v115;
            }
            else if (UnpackedType == 12)
            {
              v39 = sub_24BA4EF64(v86, v38 != 0.0);
              MEMORY[0x24BD2C710](v116, v39);
            }
            v40 = HIBYTE(v117);
            if (v117 < 0)
              v40 = *(_QWORD *)&v116[2];
            if (!v40)
            {
              if (!v37)
              {
                v110 = *(__n128 *)v106;
                v111 = v107;
                v37 = sub_24BA3F530(v86, (MetadataHandle *)&v110, v87);
              }
              ((void (*)(unsigned int *__return_ptr, uint64_t, double))v37)(v114, v86, v38);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              *(_OWORD *)v116 = *(_OWORD *)v114;
              v117 = v115;
            }
            sub_24BA4EEE0(v86, v36, (uint64_t)v116);
            if (SHIBYTE(v117) < 0)
              operator delete(*(void **)v116);
            ++v35;
          }
          while (v35 != v34);
          goto LABEL_168;
        case 16:
          sub_24BA4036C((uint64_t *)&__p, &v108);
          *(__n128 *)v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v118 = *a2;
          v119 = a2[1].n128_u64[0];
          v66 = sub_24BA3F240(v86, (MetadataHandle *)v118, v87);
          v67 = (double *)v108.n128_u64[1];
          v35 = (double *)v108.n128_u64[0];
          if (v108.n128_u64[0] == v108.n128_u64[1])
            goto LABEL_169;
          v68 = v66;
          v69 = 0;
          do
          {
            v70 = *(float *)v35;
            memset(v116, 0, sizeof(v116));
            v117 = 0;
            if (UnpackedType == 11)
            {
              v112 = *(__n128 *)v106;
              v113 = v107;
              sub_24BA3F2C0(v86, (MetadataHandle *)&v112, v87, (unint64_t)v70, v114);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              *(_OWORD *)v116 = *(_OWORD *)v114;
              v117 = v115;
            }
            else if (UnpackedType == 12)
            {
              v71 = sub_24BA4EF64(v86, v70 != 0.0);
              MEMORY[0x24BD2C710](v116, v71);
            }
            v72 = HIBYTE(v117);
            if (v117 < 0)
              v72 = *(_QWORD *)&v116[2];
            if (!v72)
            {
              if (!v69)
              {
                v110 = *(__n128 *)v106;
                v111 = v107;
                v69 = sub_24BA3F840(v86, (MetadataHandle *)&v110, v87);
              }
              ((void (*)(unsigned int *__return_ptr, uint64_t, float))v69)(v114, v86, v70);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              *(_OWORD *)v116 = *(_OWORD *)v114;
              v117 = v115;
            }
            sub_24BA4EEE0(v86, v68, (uint64_t)v116);
            if (SHIBYTE(v117) < 0)
              operator delete(*(void **)v116);
            v35 = (double *)((char *)v35 + 4);
          }
          while (v35 != v67);
LABEL_168:
          v35 = (double *)v108.n128_u64[0];
LABEL_169:
          if (!v35)
            goto LABEL_177;
          v108.n128_u64[1] = (unint64_t)v35;
LABEL_171:
          v73 = v35;
          break;
        case 17:
        case 25:
          sub_24BA40020((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA40470(v86, (uint64_t **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 18:
        case 24:
          sub_24BA40020((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA3FE58(v86, (uint64_t **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 19:
          sub_24BA40638((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA40470(v86, (uint64_t **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 20:
          sub_24BA402EC((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA406BC(v86, (int **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 21:
        case 23:
          sub_24BA402EC((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA40124(v86, (unsigned int **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 22:
          sub_24BA40884((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA406BC(v86, (int **)v118, (__int128 *)v116, v87, UnpackedType);
LABEL_174:
          v73 = *(double **)v118;
          if (!*(_QWORD *)v118)
            goto LABEL_177;
          *(_QWORD *)&v118[2] = *(_QWORD *)v118;
          break;
        case 26:
          sub_24BA403F0((uint64_t)&__p, &v108);
          *(__n128 *)v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v118 = *a2;
          v119 = a2[1].n128_u64[0];
          v55 = sub_24BA3F240(v86, (MetadataHandle *)v118, v87);
          v35 = (double *)v108.n128_u64[0];
          v56 = v108.n128_u8[8] & 0x3F;
          if (v108.n128_u64[1] > 0x3F || (v108.n128_u8[8] & 0x3F) != 0)
          {
            v57 = 0;
            v58 = 0;
            v59 = (double *)(v108.n128_u64[0] + 8 * (v108.n128_u64[1] >> 6));
            do
            {
              v60 = 1 << v58;
              memset(v116, 0, sizeof(v116));
              v117 = 0;
              v61 = v58;
              if (UnpackedType == 11)
              {
                v112 = *(__n128 *)v106;
                v113 = v107;
                sub_24BA3F2C0(v86, (MetadataHandle *)&v112, v87, (*(_QWORD *)v35 >> v58) & 1, v114);
                if (SHIBYTE(v117) < 0)
                  operator delete(*(void **)v116);
                *(_OWORD *)v116 = *(_OWORD *)v114;
                v117 = v115;
              }
              else if (UnpackedType == 12)
              {
                v62 = sub_24BA4EF64(v86, (*(_QWORD *)v35 & v60) != 0);
                MEMORY[0x24BD2C710](v116, v62);
              }
              v63 = HIBYTE(v117);
              if (v117 < 0)
                v63 = *(_QWORD *)&v116[2];
              if (v63)
              {
                v64 = v86;
              }
              else
              {
                if (!v57)
                {
                  v110 = *(__n128 *)v106;
                  v111 = v107;
                  v57 = sub_24BA3F9CC(v86, (MetadataHandle *)&v110, v87);
                }
                v65 = (*(_QWORD *)v35 & v60) != 0;
                v64 = v86;
                ((void (*)(unsigned int *__return_ptr, uint64_t, _BOOL8))v57)(v114, v86, v65);
                if (SHIBYTE(v117) < 0)
                  operator delete(*(void **)v116);
                *(_OWORD *)v116 = *(_OWORD *)v114;
                v117 = v115;
              }
              sub_24BA4EEE0(v64, v55, (uint64_t)v116);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              v35 += v61 == 63;
              if (v61 == 63)
                v58 = 0;
              else
                v58 = v61 + 1;
            }
            while (v35 != v59 || v58 != v56);
            v35 = (double *)v108.n128_u64[0];
          }
          if (!v35)
            goto LABEL_177;
          goto LABEL_171;
        default:
          v84 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](v84, "This should never happen, no matter what the input!");
          __cxa_throw(v84, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      operator delete(v73);
LABEL_177:
      if (__p)
      {
        v95 = (char *)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v97);
      LODWORD(v9) = v87;
      if (v18 > 0)
        goto LABEL_180;
      return;
    case 27:
      v114[0] = 0;
      v42 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v42 >= *((_QWORD *)this + 2) || *v42 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v114))goto LABEL_180;
      }
      else
      {
        v114[0] = *v42;
        *((_QWORD *)this + 1) = v42 + 1;
      }
      *(_QWORD *)v118 = this;
      v118[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(_QWORD *)v116 = this;
      v88 = *a2;
      v89 = a2[1].n128_u64[0];
      sub_24BA3E928(a3, this, (__int128 *)&v88, v9);
      sub_24BA3EA10((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v116);
      v76 = *((_DWORD *)this + 14);
      v77 = __OFSUB__(v76, 1);
      v78 = v76 - 1;
      if (v78 < 0 == v77)
        *((_DWORD *)this + 14) = v78;
      sub_24BA38A94((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v118);
      return;
    default:
      goto LABEL_180;
  }
}

void sub_24BA3E5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50)
{
  void *v50;

  __cxa_free_exception(v50);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA3E798(wireless_diagnostics::google::protobuf::io::CodedInputStream *a1, unint64_t *a2)
{
  unsigned __int8 *v2;

  v2 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
  if ((unint64_t)v2 >= *((_QWORD *)a1 + 2) || (char)*v2 < 0)
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(a1, a2);
  *a2 = *v2;
  *((_QWORD *)a1 + 1) = v2 + 1;
  return 1;
}

uint64_t sub_24BA3E7C8(wireless_diagnostics::google::protobuf::io::CodedInputStream *a1, unsigned int *a2)
{
  unsigned __int8 *v2;

  v2 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
  if ((unint64_t)v2 >= *((_QWORD *)a1 + 2) || (char)*v2 < 0)
    return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(a1, a2);
  *a2 = *v2;
  *((_QWORD *)a1 + 1) = v2 + 1;
  return 1;
}

void sub_24BA3E7F8(uint64_t a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v6;
  std::string v7;
  __int128 v8;
  uint64_t v9;

  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  v6 = sub_24BA3F240(a1, (MetadataHandle *)&v8, a4);
  sub_24BA4EFA8((unsigned __int8 *)a2, &v7);
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
  *(std::string *)a2 = v7;
  sub_24BA4EEE0(a1, v6, a2);
}

void sub_24BA3E888(uint64_t a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v6;
  std::string __p;
  __int128 v8;
  uint64_t v9;

  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  v6 = sub_24BA3F240(a1, (MetadataHandle *)&v8, a4);
  sub_24BA4F208(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2, *(_BYTE **)a2, &__p);
  sub_24BA4EEE0(a1, v6, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24BA3E90C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *sub_24BA3E928(uint64_t a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, __int128 *a3, unsigned int a4)
{
  char *v6;
  __int128 v8;
  uint64_t v9;

  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  v6 = sub_24BA3F240(a1, (MetadataHandle *)&v8, a4);
  sub_24BA4EECC(a1);
  std::string::append(*(std::string **)a1, v6);
  std::string::append(*(std::string **)a1, " {\n");
  ++*(_QWORD *)(a1 + 8);
  if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    do
      sub_24BA3D28C(a2);
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) > 0);
  }
  --*(_QWORD *)(a1 + 8);
  sub_24BA4EECC(a1);
  return std::string::append(*(std::string **)a1, "}\n");
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_24BA3EA10(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(*a1);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(*a1);
  return a1;
}

void sub_24BA3EA48(uint64_t a1, unint64_t a2, unsigned int __val)
{
  std::string *v5;
  std::string __p;
  std::string v7;

  sub_24BA4EF98(__val, &v7);
  sub_24BA4EF88(a2, &__p);
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v7;
  else
    v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
  sub_24BA4EEE0(a1, (const std::string::value_type *)v5, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
}

void sub_24BA3EAD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void sub_24BA3EB08(uint64_t a1, _BYTE *a2, unint64_t a3, unsigned int __val)
{
  std::string *v7;
  std::string __p;
  std::string v9;

  sub_24BA4EF98(__val, &v9);
  sub_24BA4F208(a3, a2, &__p);
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v9;
  else
    v7 = (std::string *)v9.__r_.__value_.__r.__words[0];
  sub_24BA4EEE0(a1, (const std::string::value_type *)v7, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
}

void sub_24BA3EB9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void sub_24BA3EBD0(uint64_t a1, uint64_t *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  const char *v11;
  void *v12;
  uint64_t (*v13)(int, unint64_t);
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v22 = *a3;
  v23 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA3F240(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  v21 = 0;
  if (a5 == 11)
  {
    v16 = *a3;
    v17 = *((_QWORD *)a3 + 2);
    sub_24BA3F2C0(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  else if (a5 == 12)
  {
    v11 = sub_24BA4EF64(a1, *a2 != 0);
    MEMORY[0x24BD2C710](__p, v11);
  }
  v12 = (void *)HIBYTE(v21);
  if (v21 < 0)
    v12 = __p[1];
  if (!v12)
  {
    v14 = *a3;
    v15 = *((_QWORD *)a3 + 2);
    v13 = sub_24BA3F3AC(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  sub_24BA4EEE0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
}

void sub_24BA3ED44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3ED6C(uint64_t a1, _DWORD *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  const char *v11;
  void *v12;
  uint64_t (*v13)(int, unsigned int);
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v22 = *a3;
  v23 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA3F240(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  v21 = 0;
  if (a5 == 11)
  {
    v16 = *a3;
    v17 = *((_QWORD *)a3 + 2);
    sub_24BA3F2C0(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  else if (a5 == 12)
  {
    v11 = sub_24BA4EF64(a1, *a2 != 0);
    MEMORY[0x24BD2C710](__p, v11);
  }
  v12 = (void *)HIBYTE(v21);
  if (v21 < 0)
    v12 = __p[1];
  if (!v12)
  {
    v14 = *a3;
    v15 = *((_QWORD *)a3 + 2);
    v13 = sub_24BA3F6BC(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(__int128 *__return_ptr, uint64_t, _QWORD))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  sub_24BA4EEE0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
}

void sub_24BA3EEE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3EF08(uint64_t a1, uint64_t *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  const char *v11;
  void *v12;
  uint64_t (*v13)(int, uint64_t);
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v22 = *a3;
  v23 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA3F240(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  v21 = 0;
  if (a5 == 11)
  {
    v16 = *a3;
    v17 = *((_QWORD *)a3 + 2);
    sub_24BA3F2C0(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  else if (a5 == 12)
  {
    v11 = sub_24BA4EF64(a1, *a2 != 0);
    MEMORY[0x24BD2C710](__p, v11);
  }
  v12 = (void *)HIBYTE(v21);
  if (v21 < 0)
    v12 = __p[1];
  if (!v12)
  {
    v14 = *a3;
    v15 = *((_QWORD *)a3 + 2);
    v13 = sub_24BA3FB50(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  sub_24BA4EEE0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
}

void sub_24BA3F07C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3F0A4(uint64_t a1, unsigned int *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  const char *v11;
  void *v12;
  uint64_t (*v13)(int, int);
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v22 = *a3;
  v23 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA3F240(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  v21 = 0;
  if (a5 == 11)
  {
    v16 = *a3;
    v17 = *((_QWORD *)a3 + 2);
    sub_24BA3F2C0(a1, (MetadataHandle *)&v16, a4, (int)*a2, &v18);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  else if (a5 == 12)
  {
    v11 = sub_24BA4EF64(a1, *a2 != 0);
    MEMORY[0x24BD2C710](__p, v11);
  }
  v12 = (void *)HIBYTE(v21);
  if (v21 < 0)
    v12 = __p[1];
  if (!v12)
  {
    v14 = *a3;
    v15 = *((_QWORD *)a3 + 2);
    v13 = sub_24BA3FCD4(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(__int128 *__return_ptr, uint64_t, _QWORD))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  sub_24BA4EEE0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
}

void sub_24BA3F218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *sub_24BA3F240(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  uint64_t Field;
  char *result;
  __n128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v6 = *(__n128 *)a2;
  v7 = *((_QWORD *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v6, a3, (uint64_t)&v8);
  *(_OWORD *)a2 = v8;
  *((_QWORD *)a2 + 2) = v9;
  Field = MetadataHandle::getField(a2);
  if (!Field)
    return (char *)&unk_24BA5D72A;
  result = *(char **)(Field + 8);
  if (!result)
    return (char *)&unk_24BA5D72A;
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

_QWORD *sub_24BA3F2C0@<X0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  _QWORD *result;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  __n128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v15 = *(__n128 *)a2;
  v16 = *((_QWORD *)a2 + 2);
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v15, a3, (uint64_t)&v17);
  *(_OWORD *)a2 = v17;
  *((_QWORD *)a2 + 2) = v18;
  result = (_QWORD *)MetadataHandle::getEnum(a2);
  if (!result)
    return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  v9 = (uint64_t *)result[1];
  v10 = (uint64_t *)result[2];
  if (v9 == v10)
    return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  while (1)
  {
    v11 = *v9;
    v12 = (*(_BYTE *)(*v9 + 32) & 2) != 0 ? 24 : 16;
    if (*(_QWORD *)(v11 + v12) == a4)
      break;
    if (++v9 == v10)
      return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  }
  v13 = *(__int128 **)(v11 + 8);
  if (*((char *)v13 + 23) < 0)
    return sub_24BA39638(a5, *(void **)v13, *((_QWORD *)v13 + 1));
  v14 = *v13;
  a5[2] = *((_QWORD *)v13 + 2);
  *(_OWORD *)a5 = v14;
  return result;
}

uint64_t (*sub_24BA3F3AC(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, unint64_t __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 120)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v7, a3, (uint64_t)&v9),
        *(_OWORD *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, unint64_t))off_251CCC0E8[v5];
  }
  else
  {
    return sub_24BA3F444;
  }
}

void sub_24BA3F448(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA3F450(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 1, a2, a3);
}

void sub_24BA3F458(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 1, a2, a3);
}

void sub_24BA3F460(unint64_t a1@<X1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA3F4CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3F4E8(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA3F4F0(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA3F4F8(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA3F500(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA3F508(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA3F510(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA3F518(time_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA3F520(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA3F528(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

std::string *(__cdecl *sub_24BA3F530(uint64_t a1, MetadataHandle *a2, unsigned int a3))(std::string *__return_ptr __struct_ptr retstr, double __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 120)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v7, a3, (uint64_t)&v9),
        *(_OWORD *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (std::string *(__cdecl *)(std::string *__return_ptr __struct_ptr, double))off_251CCC1E8[v5];
  }
  else
  {
    return j_std::to_string;
  }
}

void sub_24BA3F5CC(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58AB8((unint64_t)a2, a1);
}

void sub_24BA3F5D4(__n128 *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  sub_24BA58DBC(a1 + 1, a3, a2);
}

void sub_24BA3F5E0(__n128 *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  sub_24BA58E64(a1 + 1, a3, a2);
}

void sub_24BA3F5EC(std::string *a1@<X8>, double a2@<D0>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940((unint64_t)a2, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a1 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA3F658(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3F674(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58EF4((unint64_t)a2, a1);
}

void sub_24BA3F67C(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA5938C((unint64_t)a2, a1);
}

void sub_24BA3F684(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA594B0((unint64_t)a2, a1);
}

void sub_24BA3F68C(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA595D4((unint64_t)a2, a1);
}

void sub_24BA3F694(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA596BC((unint64_t)a2, a1);
}

void sub_24BA3F69C(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA59788((unint64_t)a2, a1);
}

void sub_24BA3F6A4(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58D1C((unint64_t)a2, a1);
}

void sub_24BA3F6AC(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58C70((unint64_t)a2, a1);
}

void sub_24BA3F6B4(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58C70((unint64_t)a2, a1);
}

uint64_t (*sub_24BA3F6BC(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, unsigned int __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 120)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v7, a3, (uint64_t)&v9),
        *(_OWORD *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, unsigned int))off_251CCC2E8[v5];
  }
  else
  {
    return sub_24BA3F754;
  }
}

void sub_24BA3F758(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA3F760(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 1, a2, a3);
}

void sub_24BA3F768(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 1, a2, a3);
}

void sub_24BA3F770(unsigned int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA3F7DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3F7F8(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA3F800(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA3F808(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA3F810(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA3F818(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA3F820(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA3F828(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA3F830(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA3F838(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

std::string *(__cdecl *sub_24BA3F840(uint64_t a1, MetadataHandle *a2, unsigned int a3))(std::string *__return_ptr __struct_ptr retstr, float __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 120)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v7, a3, (uint64_t)&v9),
        *(_OWORD *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (std::string *(__cdecl *)(std::string *__return_ptr __struct_ptr, float))off_251CCC3E8[v5];
  }
  else
  {
    return j_std::to_string;
  }
}

void sub_24BA3F8DC(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58AB8((unint64_t)a2, a1);
}

void sub_24BA3F8E4(__n128 *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  sub_24BA58DBC(a1 + 1, a3, a2);
}

void sub_24BA3F8F0(__n128 *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  sub_24BA58E64(a1 + 1, a3, a2);
}

void sub_24BA3F8FC(std::string *a1@<X8>, float a2@<S0>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940((unint64_t)a2, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a1 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA3F968(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3F984(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58EF4((unint64_t)a2, a1);
}

void sub_24BA3F98C(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA5938C((unint64_t)a2, a1);
}

void sub_24BA3F994(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA594B0((unint64_t)a2, a1);
}

void sub_24BA3F99C(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA595D4((unint64_t)a2, a1);
}

void sub_24BA3F9A4(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA596BC((unint64_t)a2, a1);
}

void sub_24BA3F9AC(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA59788((unint64_t)a2, a1);
}

void sub_24BA3F9B4(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58D1C((unint64_t)a2, a1);
}

void sub_24BA3F9BC(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58C70((unint64_t)a2, a1);
}

void sub_24BA3F9C4(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58C70((unint64_t)a2, a1);
}

uint64_t (*sub_24BA3F9CC(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, int __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 120)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v7, a3, (uint64_t)&v9),
        *(_OWORD *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, int))off_251CCC4E8[v5];
  }
  else
  {
    return sub_24BA3FA64;
  }
}

void sub_24BA3FA68(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA3FA70(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 1, a2, a3);
}

void sub_24BA3FA78(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 1, a2, a3);
}

void sub_24BA3FA80(unsigned int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA3FAEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3FB08(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA3FB10(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA3FB18(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA3FB20(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA3FB28(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA3FB30(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA3FB38(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA3FB40(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA3FB48(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

uint64_t (*sub_24BA3FB50(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, uint64_t __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 120)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v7, a3, (uint64_t)&v9),
        *(_OWORD *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, uint64_t))off_251CCC5E8[v5];
  }
  else
  {
    return sub_24BA3FBE8;
  }
}

void sub_24BA3FBEC(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA3FBF4(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 1, a2, a3);
}

void sub_24BA3FBFC(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 1, a2, a3);
}

void sub_24BA3FC04(unint64_t a1@<X1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA3FC70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3FC8C(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA3FC94(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA3FC9C(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA3FCA4(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA3FCAC(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA3FCB4(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA3FCBC(time_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA3FCC4(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA3FCCC(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

uint64_t (*sub_24BA3FCD4(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, int __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 120)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a1 + 16), &v7, a3, (uint64_t)&v9),
        *(_OWORD *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, int))off_251CCC6E8[v5];
  }
  else
  {
    return sub_24BA3FD6C;
  }
}

void sub_24BA3FD70(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA3FD78(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 1, a2, a3);
}

void sub_24BA3FD80(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 1, a2, a3);
}

void sub_24BA3FD88(int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA3FDF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA3FE10(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA3FE18(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA3FE20(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA3FE28(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA3FE30(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA3FE38(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA3FE40(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA3FE48(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA3FE50(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA3FE58(uint64_t a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  const std::string::value_type *v13;
  uint64_t (*v14)(int, unint64_t);
  uint64_t v15;
  const char *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v26 = *a3;
  v27 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA3F240(a1, (MetadataHandle *)&v26, a4);
  v11 = *a2;
  v12 = a2[1];
  if (*a2 != v12)
  {
    v13 = v10;
    v14 = 0;
    do
    {
      v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      v25 = 0;
      if (a5 == 11)
      {
        v20 = *a3;
        v21 = *((_QWORD *)a3 + 2);
        sub_24BA3F2C0(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      else if (a5 == 12)
      {
        v16 = sub_24BA4EF64(a1, v15 != 0);
        MEMORY[0x24BD2C710](__p, v16);
      }
      v17 = (void *)HIBYTE(v25);
      if (v25 < 0)
        v17 = __p[1];
      if (!v17)
      {
        if (!v14)
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 2);
          v14 = sub_24BA3F3AC(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      sub_24BA4EEE0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0)
        operator delete(__p[0]);
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_24BA3FFFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_24BA40020@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *i;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (uint64_t *)*result;
  v3 = (uint64_t *)result[1];
  for (i = a2; v2 != v3; ++v2)
  {
    v4 = *v2;
    result = sub_24BA40908((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_24BA40084(_Unwind_Exception *exception_object)
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

uint64_t *sub_24BA400A0@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  double v4;
  _QWORD *i;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (uint64_t *)*result;
  v3 = (uint64_t *)result[1];
  for (i = a2; v2 != v3; ++v2)
  {
    v4 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(*v2);
    result = sub_24BA409F4((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_24BA40108(_Unwind_Exception *exception_object)
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

void sub_24BA40124(uint64_t a1, unsigned int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  unsigned int *v11;
  unsigned int *v12;
  const std::string::value_type *v13;
  uint64_t (*v14)(int, unsigned int);
  uint64_t v15;
  const char *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v26 = *a3;
  v27 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA3F240(a1, (MetadataHandle *)&v26, a4);
  v11 = *a2;
  v12 = a2[1];
  if (*a2 != v12)
  {
    v13 = v10;
    v14 = 0;
    do
    {
      v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      v25 = 0;
      if (a5 == 11)
      {
        v20 = *a3;
        v21 = *((_QWORD *)a3 + 2);
        sub_24BA3F2C0(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      else if (a5 == 12)
      {
        v16 = sub_24BA4EF64(a1, v15 != 0);
        MEMORY[0x24BD2C710](__p, v16);
      }
      v17 = (void *)HIBYTE(v25);
      if (v25 < 0)
        v17 = __p[1];
      if (!v17)
      {
        if (!v14)
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 2);
          v14 = sub_24BA3F6BC(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      sub_24BA4EEE0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0)
        operator delete(__p[0]);
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_24BA402C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_24BA402EC@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  _QWORD *i;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (_QWORD *)*result;
  v3 = (_QWORD *)result[1];
  for (i = a2; v2 != v3; ++v2)
  {
    v4 = *v2;
    result = sub_24BA40AE0((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_24BA40350(_Unwind_Exception *exception_object)
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

uint64_t *sub_24BA4036C@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  float v4;
  _QWORD *i;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (_QWORD *)*result;
  v3 = (_QWORD *)result[1];
  for (i = a2; v2 != v3; ++v2)
  {
    v4 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(*v2);
    result = sub_24BA40C00((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_24BA403D4(_Unwind_Exception *exception_object)
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

void sub_24BA403F0(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  BOOL v5;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD **)(a1 + 8);
  if (*(_QWORD **)a1 != v3)
  {
    do
    {
      v5 = *v2 != 0;
      sub_24BA40CEC((uint64_t)a2, &v5);
      ++v2;
    }
    while (v2 != v3);
  }
}

void sub_24BA40458(_Unwind_Exception *exception_object)
{
  void **v1;

  if (*v1)
    operator delete(*v1);
  _Unwind_Resume(exception_object);
}

void sub_24BA40470(uint64_t a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  const std::string::value_type *v13;
  uint64_t (*v14)(int, uint64_t);
  uint64_t v15;
  const char *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v26 = *a3;
  v27 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA3F240(a1, (MetadataHandle *)&v26, a4);
  v11 = *a2;
  v12 = a2[1];
  if (*a2 != v12)
  {
    v13 = v10;
    v14 = 0;
    do
    {
      v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      v25 = 0;
      if (a5 == 11)
      {
        v20 = *a3;
        v21 = *((_QWORD *)a3 + 2);
        sub_24BA3F2C0(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      else if (a5 == 12)
      {
        v16 = sub_24BA4EF64(a1, v15 != 0);
        MEMORY[0x24BD2C710](__p, v16);
      }
      v17 = (void *)HIBYTE(v25);
      if (v25 < 0)
        v17 = __p[1];
      if (!v17)
      {
        if (!v14)
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 2);
          v14 = sub_24BA3FB50(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      sub_24BA4EEE0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0)
        operator delete(__p[0]);
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_24BA40614(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_24BA40638@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  unint64_t *v2;
  unint64_t *v3;
  unint64_t v4;
  _QWORD *i;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (unint64_t *)*result;
  v3 = (unint64_t *)result[1];
  for (i = a2; v2 != v3; ++v2)
  {
    v4 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(*v2);
    result = sub_24BA40908((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_24BA406A0(_Unwind_Exception *exception_object)
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

void sub_24BA406BC(uint64_t a1, int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  int *v11;
  int *v12;
  const std::string::value_type *v13;
  uint64_t (*v14)(int, int);
  uint64_t v15;
  const char *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v26 = *a3;
  v27 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA3F240(a1, (MetadataHandle *)&v26, a4);
  v11 = *a2;
  v12 = a2[1];
  if (*a2 != v12)
  {
    v13 = v10;
    v14 = 0;
    do
    {
      v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      v25 = 0;
      if (a5 == 11)
      {
        v20 = *a3;
        v21 = *((_QWORD *)a3 + 2);
        sub_24BA3F2C0(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      else if (a5 == 12)
      {
        v16 = sub_24BA4EF64(a1, v15 != 0);
        MEMORY[0x24BD2C710](__p, v16);
      }
      v17 = (void *)HIBYTE(v25);
      if (v25 < 0)
        v17 = __p[1];
      if (!v17)
      {
        if (!v14)
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 2);
          v14 = sub_24BA3FCD4(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      sub_24BA4EEE0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0)
        operator delete(__p[0]);
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_24BA40860(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_24BA40884@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  _QWORD *i;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2 = (_QWORD *)*result;
  v3 = (_QWORD *)result[1];
  for (i = a2; v2 != v3; ++v2)
  {
    v4 = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(*v2);
    result = sub_24BA40AE0((uint64_t *)&i, &v4);
  }
  return result;
}

void sub_24BA408EC(_Unwind_Exception *exception_object)
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

uint64_t *sub_24BA40908(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v4 = *a1;
  v5 = *(_QWORD **)(*a1 + 8);
  v6 = (_QWORD *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    v8 = *(_QWORD **)v4;
    v9 = ((uint64_t)v5 - *(_QWORD *)v4) >> 3;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      sub_24BA39774();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)sub_24BA39788((uint64_t)v6, v12);
      v8 = *(_QWORD **)v4;
      v5 = *(_QWORD **)(v4 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = *a2;
    v7 = v14 + 8;
    while (v5 != v8)
    {
      v16 = *--v5;
      *((_QWORD *)v14 - 1) = v16;
      v14 -= 8;
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

uint64_t *sub_24BA409F4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v4 = *a1;
  v5 = *(_QWORD **)(*a1 + 8);
  v6 = (_QWORD *)(*a1 + 16);
  if ((unint64_t)v5 >= *v6)
  {
    v8 = *(_QWORD **)v4;
    v9 = ((uint64_t)v5 - *(_QWORD *)v4) >> 3;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      sub_24BA39774();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)sub_24BA39788((uint64_t)v6, v12);
      v8 = *(_QWORD **)v4;
      v5 = *(_QWORD **)(v4 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = *a2;
    v7 = v14 + 8;
    while (v5 != v8)
    {
      v16 = *--v5;
      *((_QWORD *)v14 - 1) = v16;
      v14 -= 8;
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

uint64_t *sub_24BA40AE0(uint64_t *a1, _DWORD *a2)
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
      sub_24BA39774();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)sub_24BA40BCC((uint64_t)v6, v12);
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

void *sub_24BA40BCC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_24BA3974C();
  return operator new(4 * a2);
}

uint64_t *sub_24BA40C00(uint64_t *a1, _DWORD *a2)
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
      sub_24BA39774();
    v11 = *v6 - (_QWORD)v8;
    if (v11 >> 1 > v10)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)sub_24BA40BCC((uint64_t)v6, v12);
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

void sub_24BA40CEC(uint64_t a1, _BYTE *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0)
      sub_24BA39774();
    v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64)
      v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    if (v4 <= 0x3FFFFFFFFFFFFFFELL)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    sub_24BA40D90((char **)a1, v7);
    v4 = *(_QWORD *)(a1 + 8);
  }
  *(_QWORD *)(a1 + 8) = v4 + 1;
  v8 = *(char **)a1;
  v9 = v4 >> 6;
  v10 = 1 << v4;
  if (*a2)
    v11 = *(_QWORD *)&v8[8 * v9] | v10;
  else
    v11 = *(_QWORD *)&v8[8 * v9] & ~v10;
  *(_QWORD *)&v8[8 * v9] = v11;
}

void sub_24BA40D90(char **a1, unint64_t a2)
{
  unint64_t v3;
  char *v4;
  __int128 v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  __int128 v11;

  if (a2 > (_QWORD)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0)
      sub_24BA39774();
    v10 = 0;
    v11 = 0uLL;
    sub_24BA40E4C(&v10, a2);
    v3 = (unint64_t)a1[1];
    v8 = *a1;
    v9 = 0;
    v6 = &v8[8 * (v3 >> 6)];
    v7 = v3 & 0x3F;
    sub_24BA40E90(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    v4 = *a1;
    *a1 = v10;
    v10 = v4;
    v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    v11 = v5;
    if (v4)
      operator delete(v4);
  }
}

void sub_24BA40E34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *sub_24BA40E4C(_QWORD *a1, uint64_t a2)
{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    sub_24BA39774();
  result = sub_24BA39788((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void sub_24BA40E90(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v4 = a1[1];
  v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41)
      v6 = (v5 - 1) >> 6;
    else
      v6 = 0;
    *(_QWORD *)(*a1 + 8 * v6) = 0;
  }
  v7 = *(_DWORD *)(a2 + 8);
  v8 = *(_QWORD *)a3;
  v9 = *(_DWORD *)(a3 + 8);
  v10 = *a1 + 8 * (v4 >> 6);
  v16 = *(_QWORD *)a2;
  v17 = v7;
  v14 = v8;
  v15 = v9;
  v12 = v10;
  v13 = v4 & 0x3F;
  sub_24BA40F30(&v16, &v14, &v12, (uint64_t)&v11);
}

void sub_24BA40F30(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;

  v5 = *((_DWORD *)a1 + 2);
  v6 = *a2;
  v7 = *((_DWORD *)a2 + 2);
  v16 = *a1;
  v17 = v5;
  v14 = v6;
  v15 = v7;
  v8 = *((_DWORD *)a3 + 2);
  v12 = *a3;
  v13 = v8;
  sub_24BA40FBC((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  v9 = v19;
  v10 = v20;
  v11 = v21;
  *(_QWORD *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(_QWORD *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
}

void sub_24BA40FBC(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  int v5;
  int i;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  v4 = *(_QWORD **)a1;
  v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(_QWORD *)a1 != *(_QWORD *)a2 || v5 != *(_DWORD *)(a2 + 8); v5 = *(_DWORD *)(a1 + 8))
  {
    v8 = *(uint64_t **)a3;
    v9 = 1 << i;
    if (((*v4 >> v5) & 1) != 0)
      v10 = *v8 | v9;
    else
      v10 = *v8 & ~v9;
    *v8 = v10;
    if (v5 == 63)
    {
      v11 = 0;
      *(_QWORD *)a1 = v4 + 1;
    }
    else
    {
      v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      i = 0;
      *(_QWORD *)a3 += 8;
    }
    else
    {
      i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    v4 = *(_QWORD **)a1;
  }
  *(_QWORD *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(_QWORD *)(a4 + 16) = *(_QWORD *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

char *sub_24BA4108C(_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    sub_24BA39774();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_24BA410CC(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t *a3)
{
  unsigned __int8 *v6;
  uint64_t TagFallback;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 v10;
  uint64_t BuiltinType;
  int v12;
  uint64_t DecodingType;
  char *v14;
  void *exception;
  unsigned __int8 *v16;
  int WireTypeForType;
  int v18;
  char **v19;
  char **v20;
  char **v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char **v27;
  char *v28;
  unint64_t *v29;
  char *v30;
  char Varint64Fallback;
  char LittleEndian32Fallback;
  char *v33;
  double *i;
  double *v35;
  double v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  unsigned int v41;
  unint64_t v42;
  float v43;
  char *v44;
  char ***v45;
  double v46;
  _BOOL8 v47;
  char *v48;
  int v49;
  int v50;
  char *v51;
  _QWORD *v52;
  int v53;
  int v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  void *v59;
  float *j;
  float *v61;
  float v62;
  uint64_t v63;
  int v64;
  char Raw;
  void *v66;
  int v67;
  BOOL v68;
  int v69;
  char **v70;
  uint64_t v71;
  char v72;
  _QWORD *v73;
  int v74;
  char **v75;
  uint64_t v76;
  char v77;
  _QWORD *v78;
  int v79;
  char **v80;
  int v81;
  void *v82;
  uint64_t *v83;
  int UnpackedType;
  unsigned int v85;
  __int128 v86;
  uint64_t v87;
  __n128 v88;
  unint64_t v89;
  __n128 v90;
  unint64_t v91;
  __n128 v92;
  unint64_t v93;
  void *__p;
  char **v95;
  unint64_t v96;
  wireless_diagnostics::google::protobuf::io::CodedInputStream *v97;
  int v98;
  unsigned int v99;
  __int128 v100;
  uint64_t v101;
  __n128 v102;
  unint64_t v103;
  __int128 v104;
  uint64_t v105;
  __n128 v106;
  unint64_t v107;
  __n128 v108;
  unint64_t v109;
  double v110;
  unsigned int v111[4];
  unint64_t v112;
  unsigned int v113[4];
  int64_t v114;
  unint64_t v115;
  char **v116;
  unsigned int v117[4];
  unint64_t v118;

  v6 = (unsigned __int8 *)*((_QWORD *)this + 1);
  if ((unint64_t)v6 >= *((_QWORD *)this + 2) || (char)*v6 < 0)
  {
    TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if ((_DWORD)TagFallback)
      goto LABEL_4;
LABEL_10:
    if (*((_BYTE *)this + 36))
      return;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
    goto LABEL_199;
  }
  TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((_QWORD *)this + 1) = v6 + 1;
  if (!(_DWORD)TagFallback)
    goto LABEL_10;
LABEL_4:
  v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  v9 = HIDWORD(v8);
  v10 = v8;
  v102 = *a2;
  v103 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a3 + 1), &v102, HIDWORD(v8), (uint64_t)&v104);
  v100 = v104;
  v101 = v105;
  BuiltinType = MetadataHelper::getBuiltinType((uint64_t)(a3 + 1), (MetadataHandle *)&v100);
  v12 = BuiltinType;
  DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(_QWORD *)v117 = 0;
          if (sub_24BA3E798(this, (unint64_t *)v117))
            goto LABEL_178;
          goto LABEL_151;
        case 1u:
          *(_QWORD *)v117 = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v117) & 1) != 0)goto LABEL_151;
LABEL_178:
          v70 = *(char ***)v117;
          goto LABEL_181;
        case 2u:
          v113[0] = 0;
          if ((sub_24BA3E7C8(this, v113) & 1) == 0)
            goto LABEL_151;
          sub_24BA38754(v117, v113[0]);
          Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v117);
          if ((Raw & 1) != 0)
            sub_24BA43C1C(a3, *(_BYTE **)v117, *(_QWORD *)&v117[2] - *(_QWORD *)v117, v9);
          goto LABEL_169;
        case 5u:
          v117[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v117))goto LABEL_151;
          v70 = (char **)v117[0];
LABEL_181:
          sub_24BA43B64(a3, v70, v9);
          break;
        default:
          goto LABEL_151;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      v115 = 0;
      switch(v10)
      {
        case 0u:
          v14 = (char *)*((_QWORD *)this + 1);
          if ((unint64_t)v14 < *((_QWORD *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            v115 = *v14;
            *((_QWORD *)this + 1) = v14 + 1;
LABEL_84:
            v42 = v115;
            switch(v12)
            {
              case 1:
              case 15:
                v46 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v115);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                v44 = sub_24BA39290((uint64_t)a3, (MetadataHandle *)v117, v9);
                v45 = (char ***)&v106.n128_u64[1];
                v106.n128_u8[0] = 7;
                v106.n128_f64[1] = v46;
                if (v12 == 11)
                {
                  *(__n128 *)v111 = v108;
                  v112 = v109;
                  sub_24BA3938C((uint64_t)a3, (MetadataHandle *)v111, v9, (unint64_t)v46, v113);
                  v76 = HIBYTE(v114);
                  v77 = HIBYTE(v114);
                  if (v114 < 0)
                    v76 = *(_QWORD *)&v113[2];
                  if (v76)
                  {
                    v78 = operator new(0x18uLL);
                    *(_OWORD *)v78 = *(_OWORD *)v113;
                    v78[2] = v114;
                    v114 = 0;
                    memset(v113, 0, sizeof(v113));
                    v79 = v106.n128_u8[0];
                    v106.n128_u8[0] = 3;
                    LOBYTE(__p) = v79;
                    v80 = (char **)v106.n128_u64[1];
                    v106.n128_u64[1] = (unint64_t)v78;
                    v95 = v80;
                    sub_24BA3C92C(&v95, v79);
                    v77 = HIBYTE(v114);
                  }
                  if (v77 < 0)
                    operator delete(*(void **)v113);
                }
                else if (v12 == 12)
                {
                  v106.n128_u8[0] = 4;
                  LOBYTE(v111[0]) = 7;
                  v106.n128_u64[1] = v46 != 0.0;
                  *(double *)&v111[2] = v46;
                  sub_24BA3C92C((char ***)&v111[2], 7);
                }
                goto LABEL_195;
              case 2:
              case 16:
                v43 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v115);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                v44 = sub_24BA39290((uint64_t)a3, (MetadataHandle *)v117, v9);
                v45 = (char ***)&v106.n128_u64[1];
                v106.n128_u8[0] = 7;
                v106.n128_f64[1] = v43;
                if (v12 == 11)
                {
                  *(__n128 *)v111 = v108;
                  v112 = v109;
                  sub_24BA3938C((uint64_t)a3, (MetadataHandle *)v111, v9, (unint64_t)v43, v113);
                  v71 = HIBYTE(v114);
                  v72 = HIBYTE(v114);
                  if (v114 < 0)
                    v71 = *(_QWORD *)&v113[2];
                  if (v71)
                  {
                    v73 = operator new(0x18uLL);
                    *(_OWORD *)v73 = *(_OWORD *)v113;
                    v73[2] = v114;
                    v114 = 0;
                    memset(v113, 0, sizeof(v113));
                    v74 = v106.n128_u8[0];
                    v106.n128_u8[0] = 3;
                    LOBYTE(__p) = v74;
                    v75 = (char **)v106.n128_u64[1];
                    v106.n128_u64[1] = (unint64_t)v73;
                    v95 = v75;
                    sub_24BA3C92C(&v95, v74);
                    v72 = HIBYTE(v114);
                  }
                  if (v72 < 0)
                    operator delete(*(void **)v113);
                }
                else if (v12 == 12)
                {
                  v106.n128_u8[0] = 4;
                  LOBYTE(v111[0]) = 7;
                  v106.n128_u64[1] = v43 != 0.0;
                  *(double *)&v111[2] = v43;
                  sub_24BA3C92C((char ***)&v111[2], 7);
                }
LABEL_195:
                *(__n128 *)v113 = v108;
                v114 = v109;
                v81 = sub_24BA39310((uint64_t)a3, (MetadataHandle *)v113, v9);
                sub_24BA544B0(a3, v44, (uint64_t)&v106, v81);
                v50 = v106.n128_u8[0];
                goto LABEL_196;
              case 3:
              case 11:
              case 17:
              case 25:
                goto LABEL_95;
              case 4:
              case 10:
              case 18:
              case 24:
                *(_QWORD *)v113 = v115;
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA43D44(a3, (char ***)v113, (__int128 *)v117, v9, v12);
                return;
              case 5:
              case 19:
                v42 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v115);
LABEL_95:
                *(_QWORD *)v113 = v42;
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA440F4(a3, (char ***)v113, (__int128 *)v117, v9, v12);
                return;
              case 6:
              case 20:
                v113[0] = v115;
                goto LABEL_97;
              case 7:
              case 9:
              case 21:
              case 23:
                v113[0] = v115;
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA43F1C(a3, v113, (__int128 *)v117, v9, v12);
                return;
              case 8:
              case 22:
                v113[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v115);
LABEL_97:
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA442CC(a3, (int *)v113, (__int128 *)v117, v9, v12);
                return;
              case 12:
              case 26:
                v47 = v115 != 0;
                *(__n128 *)v111 = *a2;
                v112 = a2[1].n128_u64[0];
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                v48 = sub_24BA39290((uint64_t)a3, (MetadataHandle *)v117, v9);
                v45 = (char ***)&v108.n128_u64[1];
                v108.n128_u8[0] = 4;
                v108.n128_u64[1] = v47;
                if (v12 == 12)
                {
                  v106.n128_u8[0] = 4;
                  v106.n128_u64[1] = v47;
                  sub_24BA3C92C((char ***)&v106.n128_u64[1], 4);
                }
                *(_OWORD *)v113 = *(_OWORD *)v111;
                v114 = v112;
                v49 = sub_24BA39310((uint64_t)a3, (MetadataHandle *)v113, v9);
                sub_24BA544B0(a3, v48, (uint64_t)&v108, v49);
                v50 = v108.n128_u8[0];
LABEL_196:
                sub_24BA3C92C(v45, v50);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x24BD2C6B0](exception, "This should never happen, no matter what the input!");
                goto LABEL_199;
            }
          }
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v115) & 1) != 0)
            goto LABEL_84;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_103;
          return;
        case 1u:
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, &v115) & 1) != 0)
            goto LABEL_84;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_103;
          return;
        case 2u:
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_103;
          return;
        case 5u:
          v117[0] = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v117) & 1) != 0)
          {
            v115 = v117[0];
            goto LABEL_84;
          }
          if (!(_DWORD)v9 && *((_BYTE *)this + 36))
            return;
LABEL_103:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_84;
      }
      goto LABEL_199;
    case 13:
      v113[0] = 0;
      v38 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v38 >= *((_QWORD *)this + 2) || *v38 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v113))goto LABEL_151;
      }
      else
      {
        v113[0] = *v38;
        *((_QWORD *)this + 1) = v38 + 1;
      }
      memset(v117, 0, sizeof(v117));
      v118 = 0;
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if ((Raw & 1) != 0)
      {
        v92 = *a2;
        v93 = a2[1].n128_u64[0];
        sub_24BA437EC(a3, (uint64_t)v117, (__int128 *)&v92, v9);
      }
      if ((SHIBYTE(v118) & 0x80000000) == 0)
        goto LABEL_172;
      v66 = *(void **)v117;
      goto LABEL_171;
    case 14:
      v113[0] = 0;
      v40 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v40 >= *((_QWORD *)this + 2) || *v40 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v113))goto LABEL_151;
        v41 = v113[0];
      }
      else
      {
        v41 = *v40;
        v113[0] = v41;
        *((_QWORD *)this + 1) = v40 + 1;
      }
      sub_24BA38754(v117, v41);
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v117);
      if ((Raw & 1) != 0)
      {
        v90 = *a2;
        v91 = a2[1].n128_u64[0];
        sub_24BA438D8(a3, (uint64_t)v117, (__int128 *)&v90, v9);
      }
LABEL_169:
      v66 = *(void **)v117;
      if (*(_QWORD *)v117)
      {
        *(_QWORD *)&v117[2] = *(_QWORD *)v117;
LABEL_171:
        operator delete(v66);
      }
LABEL_172:
      if ((Raw & 1) != 0)
        return;
      goto LABEL_151;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      v99 = 0;
      v16 = (unsigned __int8 *)*((_QWORD *)this + 1);
      if ((unint64_t)v16 >= *((_QWORD *)this + 2) || (char)*v16 < 0)
      {
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v99) & 1) != 0)
          goto LABEL_16;
LABEL_151:
        if (!(_DWORD)v9 && *((_BYTE *)this + 36))
          return;
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
LABEL_199:
        __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      v99 = *v16;
      *((_QWORD *)this + 1) = v16 + 1;
LABEL_16:
      v83 = a3;
      v85 = v9;
      UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      v97 = this;
      v98 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      __p = 0;
      v95 = 0;
      v96 = 0;
      while (1)
      {
        v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1)
          break;
        v19 = v95;
        if ((unint64_t)v95 >= v96)
        {
          v21 = (char **)__p;
          v22 = ((char *)v95 - (_BYTE *)__p) >> 3;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61)
            sub_24BA39774();
          v24 = v96 - (_QWORD)__p;
          if ((uint64_t)(v96 - (_QWORD)__p) >> 2 > v23)
            v23 = v24 >> 2;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
            v25 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v25 = v23;
          if (v25)
          {
            v26 = (char *)sub_24BA39788((uint64_t)&v96, v25);
            v21 = (char **)__p;
            v19 = v95;
          }
          else
          {
            v26 = 0;
          }
          v27 = (char **)&v26[8 * v22];
          *v27 = 0;
          v20 = v27 + 1;
          while (v19 != v21)
          {
            v28 = *--v19;
            *--v27 = v28;
          }
          __p = v27;
          v95 = v20;
          v96 = (unint64_t)&v26[8 * v25];
          if (v21)
            operator delete(v21);
        }
        else
        {
          *v95 = 0;
          v20 = v19 + 1;
        }
        v95 = v20;
        switch(WireTypeForType)
        {
          case 0:
            v29 = (unint64_t *)(v20 - 1);
            v30 = (char *)*((_QWORD *)this + 1);
            if ((unint64_t)v30 >= *((_QWORD *)this + 2) || *v30 < 0)
            {
              Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0)
                goto LABEL_148;
            }
            else
            {
              *v29 = *v30;
              *((_QWORD *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_148;
          case 5:
            v117[0] = 0;
            LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v117);
            *(v95 - 1) = (char *)v117[0];
            if ((LittleEndian32Fallback & 1) == 0)
              goto LABEL_148;
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_24BA400A0((uint64_t *)&__p, &v108);
          v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v117 = *a2;
          v118 = a2[1].n128_u64[0];
          v33 = sub_24BA39290((uint64_t)v83, (MetadataHandle *)v117, v85);
          v116 = 0;
          LOBYTE(v115) = 2;
          *(_QWORD *)v113 = 0;
          *(_QWORD *)v111 = 0;
          v116 = (char **)sub_24BA42860((uint64_t *)v113, (uint64_t *)v111);
          v35 = (double *)v108.n128_u64[1];
          for (i = (double *)v108.n128_u64[0]; i != v35; ++i)
          {
            v36 = *i;
            v110 = *i;
            if (UnpackedType == 11)
            {
              *(__n128 *)v111 = v106;
              v112 = v107;
              sub_24BA3938C((uint64_t)v83, (MetadataHandle *)v111, v85, (unint64_t)v36, v113);
              v37 = HIBYTE(v114);
              if (v114 < 0)
                v37 = *(_QWORD *)&v113[2];
              if (v37)
                sub_24BA44D0C((uint64_t)&v115, (uint64_t)v113);
              else
                sub_24BA4531C((uint64_t)&v115, (uint64_t *)&v110);
              if (SHIBYTE(v114) < 0)
                operator delete(*(void **)v113);
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v113[0]) = v36 != 0.0;
              sub_24BA44BC4((uint64_t)&v115, (unsigned __int8 *)v113);
            }
            else
            {
              sub_24BA4531C((uint64_t)&v115, (uint64_t *)&v110);
            }
          }
          goto LABEL_154;
        case 16:
          sub_24BA4036C((uint64_t *)&__p, &v108);
          v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v117 = *a2;
          v118 = a2[1].n128_u64[0];
          v33 = sub_24BA39290((uint64_t)v83, (MetadataHandle *)v117, v85);
          v116 = 0;
          LOBYTE(v115) = 2;
          *(_QWORD *)v113 = 0;
          *(_QWORD *)v111 = 0;
          v116 = (char **)sub_24BA42860((uint64_t *)v113, (uint64_t *)v111);
          v61 = (float *)v108.n128_u64[1];
          for (j = (float *)v108.n128_u64[0]; j != v61; ++j)
          {
            v62 = *j;
            *(float *)&v110 = *j;
            if (UnpackedType == 11)
            {
              *(__n128 *)v111 = v106;
              v112 = v107;
              sub_24BA3938C((uint64_t)v83, (MetadataHandle *)v111, v85, (unint64_t)v62, v113);
              v63 = HIBYTE(v114);
              if (v114 < 0)
                v63 = *(_QWORD *)&v113[2];
              if (v63)
                sub_24BA44D0C((uint64_t)&v115, (uint64_t)v113);
              else
                sub_24BA457BC((uint64_t)&v115, (float *)&v110);
              if (SHIBYTE(v114) < 0)
                operator delete(*(void **)v113);
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v113[0]) = v62 != 0.0;
              sub_24BA44BC4((uint64_t)&v115, (unsigned __int8 *)v113);
            }
            else
            {
              sub_24BA457BC((uint64_t)&v115, (float *)&v110);
            }
          }
LABEL_154:
          *(__n128 *)v113 = v106;
          v114 = v107;
          v64 = sub_24BA39310((uint64_t)v83, (MetadataHandle *)v113, v85);
          sub_24BA544B0(v83, v33, (uint64_t)&v115, v64);
          sub_24BA3C92C(&v116, v115);
          v59 = (void *)v108.n128_u64[0];
          if (!v108.n128_u64[0])
            break;
          v108.n128_u64[1] = v108.n128_u64[0];
          goto LABEL_147;
        case 17:
        case 25:
          sub_24BA40020((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA44834(v83, (uint64_t **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 18:
        case 24:
          sub_24BA40020((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA444A4(v83, (uint64_t **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 19:
          sub_24BA40638((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA44834(v83, (uint64_t **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 20:
          sub_24BA402EC((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA449FC(v83, (int **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 21:
        case 23:
          sub_24BA402EC((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA4466C(v83, (unsigned int **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 22:
          sub_24BA40884((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA449FC(v83, (int **)v117, (__int128 *)v113, v85, UnpackedType);
LABEL_145:
          v59 = *(void **)v117;
          if (!*(_QWORD *)v117)
            break;
          *(_QWORD *)&v117[2] = *(_QWORD *)v117;
LABEL_147:
          operator delete(v59);
          break;
        case 26:
          sub_24BA403F0((uint64_t)&__p, &v108);
          v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v117 = *a2;
          v118 = a2[1].n128_u64[0];
          v51 = sub_24BA39290((uint64_t)v83, (MetadataHandle *)v117, v85);
          v116 = 0;
          LOBYTE(v115) = 2;
          *(_QWORD *)v113 = 0;
          *(_QWORD *)v111 = 0;
          v116 = (char **)sub_24BA42860((uint64_t *)v113, (uint64_t *)v111);
          v52 = (_QWORD *)v108.n128_u64[0];
          v53 = v108.n128_u8[8] & 0x3F;
          if (v108.n128_u64[1] > 0x3F || (v108.n128_u8[8] & 0x3F) != 0)
          {
            v54 = 0;
            v55 = (_QWORD *)(v108.n128_u64[0] + 8 * (v108.n128_u64[1] >> 6));
            do
            {
              v56 = *v52 & (1 << v54);
              LOBYTE(v110) = v56 != 0;
              if (UnpackedType == 11)
              {
                *(__n128 *)v111 = v106;
                v112 = v107;
                sub_24BA3938C((uint64_t)v83, (MetadataHandle *)v111, v85, v56 != 0, v113);
                v57 = HIBYTE(v114);
                if (v114 < 0)
                  v57 = *(_QWORD *)&v113[2];
                if (v57)
                  sub_24BA44D0C((uint64_t)&v115, (uint64_t)v113);
                else
                  sub_24BA45A14((uint64_t)&v115, (unsigned __int8 *)&v110);
                if (SHIBYTE(v114) < 0)
                  operator delete(*(void **)v113);
              }
              else if (UnpackedType == 12)
              {
                LOBYTE(v113[0]) = v56 != 0;
                sub_24BA44BC4((uint64_t)&v115, (unsigned __int8 *)v113);
              }
              else
              {
                sub_24BA45A14((uint64_t)&v115, (unsigned __int8 *)&v110);
              }
              v52 += v54 == 63;
              if (v54 == 63)
                v54 = 0;
              else
                ++v54;
            }
            while (v52 != v55 || v54 != v53);
          }
          *(__n128 *)v113 = v106;
          v114 = v107;
          v58 = sub_24BA39310((uint64_t)v83, (MetadataHandle *)v113, v85);
          sub_24BA544B0(v83, v51, (uint64_t)&v115, v58);
          sub_24BA3C92C(&v116, v115);
          v59 = (void *)v108.n128_u64[0];
          if (!v108.n128_u64[0])
            break;
          goto LABEL_147;
        default:
          v82 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](v82, "This should never happen, no matter what the input!");
          __cxa_throw(v82, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
LABEL_148:
      if (__p)
      {
        v95 = (char **)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v97);
      LODWORD(v9) = v85;
      if (v18 > 0)
        goto LABEL_151;
      return;
    case 27:
      v111[0] = 0;
      v39 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v39 >= *((_QWORD *)this + 2) || *v39 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v111))goto LABEL_151;
      }
      else
      {
        v111[0] = *v39;
        *((_QWORD *)this + 1) = v39 + 1;
      }
      *(_QWORD *)v117 = this;
      v117[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(_QWORD *)v113 = this;
      v88 = *a2;
      v89 = a2[1].n128_u64[0];
      v86 = v104;
      v87 = v105;
      sub_24BA43A00(a3, this, (__int128 *)&v88, v9, &v86);
      sub_24BA43B2C((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v113);
      v67 = *((_DWORD *)this + 14);
      v68 = __OFSUB__(v67, 1);
      v69 = v67 - 1;
      if (v69 < 0 == v68)
        *((_DWORD *)this + 14) = v69;
      sub_24BA38A94((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v117);
      return;
    default:
      goto LABEL_151;
  }
}

void sub_24BA4241C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,unsigned __int8 a45)
{
  int v45;
  char ***v46;
  uint64_t v47;

  if (v45 < 0)
    operator delete(*(void **)(v47 - 192));
  sub_24BA3C92C(v46, a45);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA42608(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5)
{
  uint64_t v10;
  _BYTE **v11;
  _BYTE *v12;
  int v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *exception;
  uint64_t v19;
  uint64_t v20[3];

  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (!a3)
  {
LABEL_7:
    v13 = 1;
    if ((a4 & 1) != 0)
      goto LABEL_17;
    goto LABEL_10;
  }
  v10 = 32 * a3;
  v11 = (_BYTE **)(a2 + 16);
  while (1)
  {
    v12 = *v11;
    if (**v11 != 2
      || *(_QWORD *)(*((_QWORD *)v12 + 1) + 8) - **((_QWORD **)v12 + 1) != 32
      || *(_BYTE *)sub_24BA428C8((uint64_t)v12, 0) != 3)
    {
      break;
    }
    v11 += 4;
    v10 -= 32;
    if (!v10)
      goto LABEL_7;
  }
  v13 = 0;
  if ((a4 & 1) == 0)
  {
LABEL_10:
    if (a5 == 2)
      v14 = 0;
    else
      v14 = v13;
    if (a5 != 1)
      LOBYTE(v13) = 1;
    if ((v13 & 1) == 0)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      sub_24BA3C010(v20, "cannot create object from initializer list");
      sub_24BA3BD30(301, (uint64_t)v20, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v13 = v14;
  }
LABEL_17:
  v15 = a2 + 32 * a3;
  if (v13)
  {
    *(_BYTE *)a1 = 1;
    v16 = operator new(0x18uLL);
    v16[2] = 0;
    v16[1] = 0;
    *v16 = v16 + 1;
    *(_QWORD *)(a1 + 8) = v16;
    sub_24BA427C0(a2, v15, a1);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v19 = v15;
    v20[0] = a2;
    *(_QWORD *)(a1 + 8) = sub_24BA42860(v20, &v19);
  }
  return a1;
}

void sub_24BA42788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

uint64_t sub_24BA427C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _BYTE v7[8];
  char **v8;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      sub_24BA42A14(v5, (uint64_t)v7);
      sub_24BA435B8(*(uint64_t ***)(a3 + 8), *((const void ***)*v8 + 1), *((_QWORD *)*v8 + 1), (uint64_t)(*v8 + 16));
      sub_24BA3C92C(&v8, v7[0]);
      v5 += 32;
    }
    while (v5 != a2);
  }
  return a3;
}

void sub_24BA42848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  char ***v9;

  sub_24BA3C92C(v9, a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_24BA42860(uint64_t *a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = operator new(0x18uLL);
  v5 = *a1;
  v6 = *a2;
  v7 = (*a2 - *a1) >> 5;
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  sub_24BA4366C(v4, v5, v6, v7);
  return v4;
}

void sub_24BA428B4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA428C8(uint64_t a1, uint64_t a2)
{
  _QWORD *exception;
  char *v5;
  std::string *v6;
  __int128 v7;
  std::string v8;
  __int128 v9;
  std::string::size_type v10;

  if (*(_BYTE *)a1 != 2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    v5 = (char *)sub_24BA429EC((char *)a1);
    sub_24BA3C010(&v8, v5);
    v6 = std::string::insert(&v8, 0, "cannot use operator[] with a numeric argument with ");
    v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v10 = v6->__r_.__value_.__r.__words[2];
    v9 = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    sub_24BA3BD30(305, (uint64_t)&v9, exception);
    __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
  }
  return **(_QWORD **)(a1 + 8) + 16 * a2;
}

void sub_24BA4298C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

const char *sub_24BA429EC(char *a1)
{
  unint64_t v1;

  v1 = *a1;
  if (v1 > 9)
    return "number";
  else
    return off_251CCC7E8[v1];
}

uint64_t sub_24BA42A14@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 16);
  if (!*(_BYTE *)(result + 24))
    return sub_24BA42A44(a2, (const void ****)v2);
  *(_BYTE *)a2 = *(_BYTE *)v2;
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(v2 + 8);
  *(_BYTE *)v2 = 0;
  *(_QWORD *)(v2 + 8) = 0;
  return result;
}

uint64_t sub_24BA42A44(uint64_t a1, const void ****a2)
{
  int v3;
  uint64_t *v4;

  v3 = *(unsigned __int8 *)a2;
  *(_BYTE *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  switch(v3)
  {
    case 1:
      v4 = sub_24BA42AD4(a2[1]);
      goto LABEL_8;
    case 2:
      v4 = sub_24BA43238((uint64_t *)a2[1]);
      goto LABEL_8;
    case 3:
      v4 = sub_24BA4347C((uint64_t)a2[1]);
      goto LABEL_8;
    case 4:
      v4 = (uint64_t *)*((unsigned __int8 *)a2 + 8);
      goto LABEL_8;
    case 5:
    case 6:
    case 7:
      v4 = (uint64_t *)a2[1];
      goto LABEL_8;
    case 8:
      v4 = sub_24BA434E4((uint64_t)a2[1]);
LABEL_8:
      *(_QWORD *)(a1 + 8) = v4;
      break;
    default:
      return a1;
  }
  return a1;
}

uint64_t *sub_24BA42AD4(const void ***a1)
{
  uint64_t *v2;

  v2 = (uint64_t *)operator new(0x18uLL);
  sub_24BA42B1C(v2, a1);
  return v2;
}

void sub_24BA42B08(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_24BA42B1C(uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_24BA42B70(a1, *a2, a2 + 1);
  return a1;
}

void sub_24BA42B58(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_24BA3D168(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_24BA42B70(uint64_t *result, const void **a2, const void ***a3)
{
  const void **v4;
  uint64_t **v5;
  uint64_t *v6;
  const void **v7;
  const void ***v8;
  BOOL v9;

  if (a2 != (const void **)a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = sub_24BA42BF4(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          v8 = (const void ***)v7;
          v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (const void ***)v4[2];
          v9 = *v8 == v4;
          v4 = (const void **)v8;
        }
        while (!v9);
      }
      v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_24BA42BF4(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  uint64_t **v6;
  uint64_t *result;
  uint64_t *v8;
  uint64_t v9;
  const void **v10;

  v6 = (uint64_t **)sub_24BA42C74(a1, a2, &v10, &v9, a3);
  result = *v6;
  if (!*v6)
  {
    sub_24BA42E0C((uint64_t)a1, a4, (uint64_t)&v8);
    sub_24BA42E8C(a1, (uint64_t)v10, v6, v8);
    return v8;
  }
  return result;
}

const void **sub_24BA42C74(_QWORD *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  const void **v9;
  const void **v11;
  const void **v12;
  uint64_t v13;
  const void **v14;
  const void **v15;
  uint64_t *v16;
  BOOL v17;
  const void **v18;

  v9 = (const void **)(a1 + 1);
  if (a1 + 1 == a2 || sub_24BA42F7C((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      v12 = (const void **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }
      else
      {
        *a3 = (const void **)a2;
        return (const void **)a2;
      }
    }
    v11 = (const void **)*a2;
    if (*a2)
    {
      do
      {
        v12 = v11;
        v11 = (const void **)v11[1];
      }
      while (v11);
    }
    else
    {
      v16 = a2;
      do
      {
        v12 = (const void **)v16[2];
        v17 = *v12 == v16;
        v16 = (uint64_t *)v12;
      }
      while (v17);
    }
    if (sub_24BA42F7C((uint64_t)(a1 + 2), v12 + 4, a5))
      goto LABEL_16;
    return (const void **)sub_24BA42EE0((uint64_t)a1, a3, a5);
  }
  if (sub_24BA42F7C((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    v13 = a2[1];
    if (v13)
    {
      v14 = (const void **)a2[1];
      do
      {
        v15 = v14;
        v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      v18 = (const void **)a2;
      do
      {
        v15 = (const void **)v18[2];
        v17 = *v15 == v18;
        v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!sub_24BA42F7C((uint64_t)(a1 + 2), a5, v15 + 4))
        return (const void **)sub_24BA42EE0((uint64_t)a1, a3, a5);
      v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  *a3 = (const void **)a2;
  *a4 = (uint64_t)a2;
  return (const void **)a4;
}

char *sub_24BA42E0C@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  char *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x48uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = sub_24BA42FE4(v6 + 32, a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_24BA42E70(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;

  *v1 = 0;
  sub_24BA431F0(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_24BA42E8C(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = sub_24BA43058(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

_QWORD *sub_24BA42EE0(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!sub_24BA42F7C(v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!sub_24BA42F7C(v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

BOOL sub_24BA42F7C(uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

char *sub_24BA42FE4(char *__dst, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    sub_24BA39638(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *((_QWORD *)__dst + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  sub_24BA42A44(__dst + 24, (char *)a2 + 24);
  return __dst;
}

void sub_24BA4303C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_24BA43058(uint64_t *result, uint64_t *a2)
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

void sub_24BA431F0(uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
    sub_24BA3D1C4(*(_QWORD *)a1, (uint64_t)__p + 32);
  if (__p)
    operator delete(__p);
}

_QWORD *sub_24BA43238(uint64_t *a1)
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  sub_24BA43290(v2, *a1, a1[1], (a1[1] - *a1) >> 4);
  return v2;
}

void sub_24BA4327C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_24BA43290(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    sub_24BA43314(result, a4);
    result = (_QWORD *)sub_24BA43354((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_24BA432F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  sub_24BA3D204(&a9);
  _Unwind_Resume(a1);
}

char *sub_24BA43314(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    sub_24BA39774();
  result = (char *)sub_24BA3CE98((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t sub_24BA43354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      sub_24BA42A44(v4, v6);
      v6 += 16;
      v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  v9 = 1;
  sub_24BA433F4((uint64_t)v8);
  return v4;
}

void sub_24BA433E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_24BA433F4((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA433F4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_24BA43428(a1);
  return a1;
}

void sub_24BA43428(uint64_t a1)
{
  char ***v1;
  char ***v2;
  char ***v3;
  char ***v4;

  v1 = **(char *****)(a1 + 16);
  v2 = **(char *****)(a1 + 8);
  if (v1 != v2)
  {
    v3 = v1 - 1;
    do
    {
      v4 = v3 - 1;
      sub_24BA3C92C(v3, *((unsigned __int8 *)v3 - 8));
      v3 -= 2;
    }
    while (v4 != v2);
  }
}

_QWORD *sub_24BA4347C(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = operator new(0x18uLL);
  v3 = v2;
  if (*(char *)(a1 + 23) < 0)
  {
    sub_24BA39638(v2, *(void **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)v2 = *(_OWORD *)a1;
    v2[2] = *(_QWORD *)(a1 + 16);
  }
  return v3;
}

void sub_24BA434D0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_24BA434E4(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  sub_24BA43540(v2, *(const void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 8) - *(_QWORD *)a1);
  *((_WORD *)v2 + 12) = *(_WORD *)(a1 + 24);
  return v2;
}

void sub_24BA4352C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_24BA43540(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = sub_24BA4108C(result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_24BA4359C(_Unwind_Exception *exception_object)
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

_OWORD *sub_24BA435B8(uint64_t **a1, const void **a2, uint64_t a3, uint64_t a4)
{
  void **v7;
  _OWORD *v8;
  uint64_t **v9;
  uint64_t v11;

  v7 = (void **)sub_24BA42EE0((uint64_t)a1, &v11, a2);
  v8 = *v7;
  if (!*v7)
  {
    v9 = (uint64_t **)v7;
    v8 = operator new(0x48uLL);
    v8[2] = *(_OWORD *)a3;
    *((_QWORD *)v8 + 6) = *(_QWORD *)(a3 + 16);
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *((_BYTE *)v8 + 56) = *(_BYTE *)a4;
    *((_QWORD *)v8 + 8) = *(_QWORD *)(a4 + 8);
    *(_BYTE *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    sub_24BA42E8C(a1, v11, v9, (uint64_t *)v8);
  }
  return v8;
}

_QWORD *sub_24BA4366C(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    sub_24BA43314(result, a4);
    result = (_QWORD *)sub_24BA436F0((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_24BA436D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  sub_24BA3D204(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA436F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      sub_24BA43790(v4, v6);
      v6 += 32;
      v4 = v11 + 16;
      v11 += 16;
    }
    while (v6 != a3);
  }
  v9 = 1;
  sub_24BA433F4((uint64_t)v8);
  return v4;
}

void sub_24BA4377C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_24BA433F4((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA43790(uint64_t a1, uint64_t a2)
{
  _BYTE v4[8];
  char **v5;

  sub_24BA42A14(a2, (uint64_t)v4);
  *(_BYTE *)a1 = v4[0];
  *(_QWORD *)(a1 + 8) = v5;
  v4[0] = 0;
  v5 = 0;
  sub_24BA3C92C(&v5, 0);
  return a1;
}

void sub_24BA437EC(uint64_t *a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v8;
  char **v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  unsigned __int8 v13[8];
  char **v14;
  __int128 v15;
  uint64_t v16;

  v15 = *a3;
  v16 = *((_QWORD *)a3 + 2);
  v8 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v15, a4);
  v13[0] = 3;
  v9 = (char **)operator new(0x18uLL);
  *(_OWORD *)v9 = *(_OWORD *)a2;
  v9[2] = *(char **)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v14 = v9;
  v11 = *a3;
  v12 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_24BA544B0(a1, v8, (uint64_t)v13, v10);
  sub_24BA3C92C(&v14, v13[0]);
}

void sub_24BA438C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  char ***v13;

  sub_24BA3C92C(v13, a13);
  _Unwind_Resume(a1);
}

void sub_24BA438D8(uint64_t *a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v8;
  char **v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  std::string __p;
  unsigned __int8 v14[8];
  char **v15;
  __int128 v16;
  uint64_t v17;

  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v8 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA4F208(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2, *(_BYTE **)a2, &__p);
  v15 = 0;
  v14[0] = 3;
  v9 = (char **)operator new(0x18uLL);
  *(std::string *)v9 = __p;
  v15 = v9;
  v11 = *a3;
  v12 = *((_QWORD *)a3 + 2);
  memset(&__p, 0, sizeof(__p));
  v10 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_24BA544B0(a1, v8, (uint64_t)v14, v10);
  sub_24BA3C92C(&v15, v14[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24BA439D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA43A00(uint64_t *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, __int128 *a3, unsigned int a4, __int128 *a5)
{
  char *v10;
  uint64_t v11;
  int v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _BYTE v17[8];
  char **v18;
  __int128 v19;
  uint64_t v20;

  v19 = *a3;
  v20 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v19, a4);
  v11 = *a1;
  sub_24BA42608((uint64_t)v17, 0, 0, 0, 1);
  *a1 = (uint64_t)v17;
  while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    v15 = *a5;
    v16 = *((_QWORD *)a5 + 2);
    sub_24BA410CC(a2);
  }
  *a1 = v11;
  v13 = *a3;
  v14 = *((_QWORD *)a3 + 2);
  v12 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v13, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v17, v12);
  sub_24BA3C92C(&v18, v17[0]);
}

void sub_24BA43B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, ...)
{
  va_list va;

  va_start(va, a10);
  sub_24BA3C92C((char ***)va, a10);
  _Unwind_Resume(a1);
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_24BA43B2C(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(*a1);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(*a1);
  return a1;
}

void sub_24BA43B64(uint64_t *a1, char **a2, unsigned int __val)
{
  std::string *v5;
  unsigned __int8 v6[8];
  char **v7;
  std::string v8;

  std::to_string(&v8, __val);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v8;
  else
    v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
  v6[0] = 6;
  v7 = a2;
  sub_24BA544B0(a1, (char *)v5, (uint64_t)v6, 1);
  sub_24BA3C92C(&v7, v6[0]);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
}

void sub_24BA43BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned __int8 a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  char ***v17;

  sub_24BA3C92C(v17, a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_24BA43C1C(uint64_t *a1, _BYTE *a2, unint64_t a3, unsigned int __val)
{
  std::string *v7;
  char **v8;
  std::string __p;
  unsigned __int8 v10[8];
  char **v11;
  std::string v12;

  v7 = &v12;
  std::to_string(&v12, __val);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  sub_24BA4F208(a3, a2, &__p);
  v11 = 0;
  v10[0] = 3;
  v8 = (char **)operator new(0x18uLL);
  *(std::string *)v8 = __p;
  memset(&__p, 0, sizeof(__p));
  v11 = v8;
  sub_24BA544B0(a1, (char *)v7, (uint64_t)v10, 1);
  sub_24BA3C92C(&v11, v10[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_24BA43CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, unsigned __int8 a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  char ***v22;

  sub_24BA3C92C(v22, a15);
  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
    operator delete(a17);
  _Unwind_Resume(a1);
}

void sub_24BA43D44(uint64_t *a1, char ***a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  char **v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 6;
  v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 6;
    v29 = v11 != 0;
    v27 = v11;
    sub_24BA3C92C(&v27, 6);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA43EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA43F1C(uint64_t *a1, unsigned int *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 6;
  v29 = v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 6;
    v29 = (_DWORD)v11 != 0;
    v27 = (char **)v11;
    sub_24BA3C92C(&v27, 6);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA440C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA440F4(uint64_t *a1, char ***a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  char **v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 5;
  v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 5;
    v29 = v11 != 0;
    v27 = v11;
    sub_24BA3C92C(&v27, 5);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA4429C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA442CC(uint64_t *a1, int *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 5;
  v29 = v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 5;
    v29 = (_DWORD)v11 != 0;
    v27 = (char **)v11;
    sub_24BA3C92C(&v27, 5);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA44474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA444A4(uint64_t *a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  uint64_t v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA44EBC((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA44EBC((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA4462C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

void sub_24BA4466C(uint64_t *a1, unsigned int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  unsigned int v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA4556C((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = (_DWORD)v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA4556C((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA447F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

void sub_24BA44834(uint64_t *a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  uint64_t v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA45C64((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA45C64((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA449BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

void sub_24BA449FC(uint64_t *a1, int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  int *v11;
  int *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  int v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA45EB4((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = (_DWORD)v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA45EB4((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA44B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA44BC4(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA45004(v4, a2);
}

void sub_24BA44CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA44D0C(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *exception;
  char *v10;
  std::string *v11;
  __int128 v12;
  std::string v13;
  __int128 v14;
  std::string::size_type v15;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v10 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v13, v10);
      v11 = std::string::insert(&v13, 0, "cannot use emplace_back() with ");
      v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      v15 = v11->__r_.__value_.__r.__words[2];
      v14 = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v14, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  v5 = v4[1];
  if (v5 >= v4[2])
  {
    v7 = sub_24BA4510C(v4, a2);
  }
  else
  {
    *(_QWORD *)(v5 + 8) = 0;
    *(_BYTE *)v5 = 3;
    v6 = operator new(0x18uLL);
    *(_OWORD *)v6 = *(_OWORD *)a2;
    v6[2] = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(v5 + 8) = v6;
    v7 = v5 + 16;
    v4[1] = v5 + 16;
  }
  v4[1] = v7;
  return v7 - 16;
}

void sub_24BA44E50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)(v21 + 8) = v22;
  _Unwind_Resume(exception_object);
}

uint64_t sub_24BA44EBC(uint64_t a1, uint64_t *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA45214(v4, a2);
}

void sub_24BA44FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA45004(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      sub_24BA39774();
    v12 = v5 - *a1;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v19[4] = v4;
    v14 = (char *)sub_24BA3CE98(v4, v13);
    v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((_QWORD *)v15 + 1) = 0;
    v17 = *a2;
    *v15 = 4;
    *((_QWORD *)v15 + 1) = v17;
    v19[2] = v15 + 16;
    sub_24BA3CE24(a1, v19);
    v9 = a1[1];
    sub_24BA3CFD4((uint64_t)v19);
  }
  else
  {
    *(_QWORD *)(v7 + 8) = 0;
    v8 = *a2;
    *(_BYTE *)v7 = 4;
    *(_QWORD *)(v7 + 8) = v8;
    v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_24BA450F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA4510C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v15[2];
  char *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    sub_24BA39774();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)sub_24BA3CE98(v7, v9);
  else
    v10 = 0;
  v11 = &v10[16 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[16 * v9];
  *((_QWORD *)v11 + 1) = 0;
  *v11 = 3;
  v12 = operator new(0x18uLL);
  *(_OWORD *)v12 = *(_OWORD *)a2;
  v12[2] = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)v11 + 1) = v12;
  v16 = v11 + 16;
  sub_24BA3CE24(a1, v15);
  v13 = a1[1];
  sub_24BA3CFD4((uint64_t)v15);
  return v13;
}

void sub_24BA45200(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA45214(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      sub_24BA39774();
    v12 = v5 - *a1;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v19[4] = v4;
    v14 = (char *)sub_24BA3CE98(v4, v13);
    v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((_QWORD *)v15 + 1) = 0;
    v17 = *a2;
    *v15 = 6;
    *((_QWORD *)v15 + 1) = v17;
    v19[2] = v15 + 16;
    sub_24BA3CE24(a1, v19);
    v9 = a1[1];
    sub_24BA3CFD4((uint64_t)v19);
  }
  else
  {
    *(_QWORD *)(v7 + 8) = 0;
    v8 = *a2;
    *(_BYTE *)v7 = 6;
    *(_QWORD *)(v7 + 8) = v8;
    v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_24BA45308(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA4531C(uint64_t a1, uint64_t *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA45464(v4, a2);
}

void sub_24BA45404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA45464(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      sub_24BA39774();
    v12 = v5 - *a1;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v19[4] = v4;
    v14 = (char *)sub_24BA3CE98(v4, v13);
    v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((_QWORD *)v15 + 1) = 0;
    v17 = *a2;
    *v15 = 7;
    *((_QWORD *)v15 + 1) = v17;
    v19[2] = v15 + 16;
    sub_24BA3CE24(a1, v19);
    v9 = a1[1];
    sub_24BA3CFD4((uint64_t)v19);
  }
  else
  {
    *(_QWORD *)(v7 + 8) = 0;
    v8 = *a2;
    *(_BYTE *)v7 = 7;
    *(_QWORD *)(v7 + 8) = v8;
    v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_24BA45558(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA4556C(uint64_t a1, unsigned int *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA456B4(v4, a2);
}

void sub_24BA45654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA456B4(uint64_t *a1, unsigned int *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      sub_24BA39774();
    v12 = v5 - *a1;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v19[4] = v4;
    v14 = (char *)sub_24BA3CE98(v4, v13);
    v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((_QWORD *)v15 + 1) = 0;
    v17 = *a2;
    *v15 = 6;
    *((_QWORD *)v15 + 1) = v17;
    v19[2] = v15 + 16;
    sub_24BA3CE24(a1, v19);
    v9 = a1[1];
    sub_24BA3CFD4((uint64_t)v19);
  }
  else
  {
    *(_QWORD *)(v7 + 8) = 0;
    v8 = *a2;
    *(_BYTE *)v7 = 6;
    *(_QWORD *)(v7 + 8) = v8;
    v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_24BA457A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA457BC(uint64_t a1, float *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA45904(v4, a2);
}

void sub_24BA458A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA45904(uint64_t *a1, float *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  double v17;
  _QWORD v19[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      sub_24BA39774();
    v12 = v5 - *a1;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v19[4] = v4;
    v14 = (char *)sub_24BA3CE98(v4, v13);
    v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((_QWORD *)v15 + 1) = 0;
    v17 = *a2;
    *v15 = 7;
    *((double *)v15 + 1) = v17;
    v19[2] = v15 + 16;
    sub_24BA3CE24(a1, v19);
    v9 = a1[1];
    sub_24BA3CFD4((uint64_t)v19);
  }
  else
  {
    *(_QWORD *)(v7 + 8) = 0;
    v8 = *a2;
    *(_BYTE *)v7 = 7;
    *(double *)(v7 + 8) = v8;
    v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_24BA45A00(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA45A14(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA45B5C(v4, a2);
}

void sub_24BA45AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA45B5C(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      sub_24BA39774();
    v12 = v5 - *a1;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v19[4] = v4;
    v14 = (char *)sub_24BA3CE98(v4, v13);
    v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((_QWORD *)v15 + 1) = 0;
    v17 = *a2;
    *v15 = 4;
    *((_QWORD *)v15 + 1) = v17;
    v19[2] = v15 + 16;
    sub_24BA3CE24(a1, v19);
    v9 = a1[1];
    sub_24BA3CFD4((uint64_t)v19);
  }
  else
  {
    *(_QWORD *)(v7 + 8) = 0;
    v8 = *a2;
    *(_BYTE *)v7 = 4;
    *(_QWORD *)(v7 + 8) = v8;
    v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_24BA45C50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA45C64(uint64_t a1, uint64_t *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA45DAC(v4, a2);
}

void sub_24BA45D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA45DAC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      sub_24BA39774();
    v12 = v5 - *a1;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v19[4] = v4;
    v14 = (char *)sub_24BA3CE98(v4, v13);
    v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((_QWORD *)v15 + 1) = 0;
    v17 = *a2;
    *v15 = 5;
    *((_QWORD *)v15 + 1) = v17;
    v19[2] = v15 + 16;
    sub_24BA3CE24(a1, v19);
    v9 = a1[1];
    sub_24BA3CFD4((uint64_t)v19);
  }
  else
  {
    *(_QWORD *)(v7 + 8) = 0;
    v8 = *a2;
    *(_BYTE *)v7 = 5;
    *(_QWORD *)(v7 + 8) = v8;
    v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_24BA45EA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA45EB4(uint64_t a1, int *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA45FFC(v4, a2);
}

void sub_24BA45F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA45FFC(uint64_t *a1, int *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 4;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60)
      sub_24BA39774();
    v12 = v5 - *a1;
    if (v12 >> 3 > v11)
      v11 = v12 >> 3;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0)
      v13 = 0xFFFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v19[4] = v4;
    v14 = (char *)sub_24BA3CE98(v4, v13);
    v15 = &v14[16 * v10];
    v19[0] = v14;
    v19[1] = v15;
    v19[3] = &v14[16 * v16];
    *((_QWORD *)v15 + 1) = 0;
    v17 = *a2;
    *v15 = 5;
    *((_QWORD *)v15 + 1) = v17;
    v19[2] = v15 + 16;
    sub_24BA3CE24(a1, v19);
    v9 = a1[1];
    sub_24BA3CFD4((uint64_t)v19);
  }
  else
  {
    *(_QWORD *)(v7 + 8) = 0;
    v8 = *a2;
    *(_BYTE *)v7 = 5;
    *(_QWORD *)(v7 + 8) = v8;
    v9 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v9;
  return v9 - 16;
}

void sub_24BA460F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24BA46104(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t a3)
{
  unsigned __int8 *v6;
  uint64_t TagFallback;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 v10;
  uint64_t BuiltinType;
  int v12;
  uint64_t DecodingType;
  char *v14;
  void *exception;
  unsigned __int8 *v16;
  int WireTypeForType;
  int v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  unint64_t *v29;
  char *v30;
  char Varint64Fallback;
  char LittleEndian32Fallback;
  char *v33;
  double *v34;
  double *v35;
  const std::string::value_type *v36;
  std::string *(__cdecl *v37)(std::string *__return_ptr __struct_ptr, double);
  double v38;
  const char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  unsigned int v44;
  unint64_t v45;
  float v46;
  char *v47;
  const char *v48;
  double v49;
  const char *v50;
  char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t (*v54)(int, int);
  char *v55;
  int v56;
  uint64_t (*v57)(int, int);
  int v58;
  double *v59;
  uint64_t v60;
  int v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL8 v65;
  char *v66;
  double *v67;
  const std::string::value_type *v68;
  std::string *(__cdecl *v69)(std::string *__return_ptr __struct_ptr, float);
  float v70;
  const char *v71;
  uint64_t v72;
  double *v73;
  char Raw;
  void *v75;
  int v76;
  BOOL v77;
  int v78;
  unint64_t v79;
  uint64_t v80;
  std::string *(__cdecl *v81)(std::string *__return_ptr __struct_ptr, float);
  uint64_t v82;
  std::string *(__cdecl *v83)(std::string *__return_ptr __struct_ptr, double);
  void *v84;
  int UnpackedType;
  uint64_t v86;
  unsigned int v87;
  __n128 v88;
  unint64_t v89;
  __n128 v90;
  unint64_t v91;
  __n128 v92;
  unint64_t v93;
  void *__p;
  char *v95;
  char *v96;
  wireless_diagnostics::google::protobuf::io::CodedInputStream *v97;
  int v98;
  unsigned int v99;
  __n128 v100;
  uint64_t v101;
  __n128 v102;
  unint64_t v103;
  __n128 v104;
  uint64_t v105;
  unint64_t v106[2];
  unint64_t v107;
  __n128 v108;
  unint64_t v109;
  __n128 v110;
  unint64_t v111;
  __n128 v112;
  unint64_t v113;
  unsigned int v114[4];
  unint64_t v115;
  unsigned int v116[4];
  int64_t v117;
  unsigned int v118[4];
  unint64_t v119;

  v6 = (unsigned __int8 *)*((_QWORD *)this + 1);
  if ((unint64_t)v6 >= *((_QWORD *)this + 2) || (char)*v6 < 0)
  {
    TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if ((_DWORD)TagFallback)
      goto LABEL_4;
LABEL_10:
    if (*((_BYTE *)this + 36))
      return;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
    goto LABEL_233;
  }
  TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((_QWORD *)this + 1) = v6 + 1;
  if (!(_DWORD)TagFallback)
    goto LABEL_10;
LABEL_4:
  v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  v9 = HIDWORD(v8);
  v10 = v8;
  v102 = *a2;
  v103 = a2[1].n128_u64[0];
  DeviceConfigMetadataHelper::getSubfieldType(a3 + 16, &v102, HIDWORD(v8), &v104);
  v100 = v104;
  v101 = v105;
  BuiltinType = MetadataHelper::getBuiltinType(a3 + 16, (MetadataHandle *)&v100);
  v12 = BuiltinType;
  DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(_QWORD *)v118 = 0;
          if (sub_24BA3E798(this, (unint64_t *)v118))
            goto LABEL_205;
          goto LABEL_180;
        case 1u:
          *(_QWORD *)v118 = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v118) & 1) != 0)goto LABEL_180;
LABEL_205:
          v79 = *(_QWORD *)v118;
          goto LABEL_208;
        case 2u:
          v116[0] = 0;
          if ((sub_24BA3E7C8(this, v116) & 1) == 0)
            goto LABEL_180;
          sub_24BA38754(v118, v116[0]);
          Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v118);
          if ((Raw & 1) != 0)
            sub_24BA47968(a3, *(_BYTE **)v118, *(_QWORD *)&v118[2] - *(_QWORD *)v118, v9);
          goto LABEL_196;
        case 5u:
          v118[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118))goto LABEL_180;
          v79 = v118[0];
LABEL_208:
          sub_24BA478A8(a3, v79, v9);
          break;
        default:
          goto LABEL_180;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      v106[0] = 0;
      switch(v10)
      {
        case 0u:
          v14 = (char *)*((_QWORD *)this + 1);
          if ((unint64_t)v14 < *((_QWORD *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            v106[0] = *v14;
            *((_QWORD *)this + 1) = v14 + 1;
LABEL_91:
            v45 = v106[0];
            switch(v12)
            {
              case 1:
              case 15:
                v49 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v106[0]);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                v47 = sub_24BA480A0(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                v117 = 0;
                if (v12 == 11)
                {
                  v112 = v108;
                  v113 = v109;
                  sub_24BA48120(a3, (MetadataHandle *)&v112, v9, (unint64_t)v49, v114);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(_OWORD *)v116 = *(_OWORD *)v114;
                  v117 = v115;
                }
                else if (v12 == 12)
                {
                  v50 = sub_24BA4EF64(a3, v49 != 0.0);
                  MEMORY[0x24BD2C710](v116, v50);
                }
                v82 = HIBYTE(v117);
                if (v117 < 0)
                  v82 = *(_QWORD *)&v116[2];
                if (!v82)
                {
                  *(__n128 *)v114 = v108;
                  v115 = v109;
                  v83 = sub_24BA48390(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, double))v83)(&v110, a3, v49);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(__n128 *)v116 = v110;
                  v117 = v111;
                }
                goto LABEL_228;
              case 2:
              case 16:
                v46 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v106[0]);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                v47 = sub_24BA480A0(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                v117 = 0;
                if (v12 == 11)
                {
                  v112 = v108;
                  v113 = v109;
                  sub_24BA48120(a3, (MetadataHandle *)&v112, v9, (unint64_t)v46, v114);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(_OWORD *)v116 = *(_OWORD *)v114;
                  v117 = v115;
                }
                else if (v12 == 12)
                {
                  v48 = sub_24BA4EF64(a3, v46 != 0.0);
                  MEMORY[0x24BD2C710](v116, v48);
                }
                v80 = HIBYTE(v117);
                if (v117 < 0)
                  v80 = *(_QWORD *)&v116[2];
                if (!v80)
                {
                  *(__n128 *)v114 = v108;
                  v115 = v109;
                  v81 = sub_24BA486A0(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, float))v81)(&v110, a3, v46);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(__n128 *)v116 = v110;
                  v117 = v111;
                }
LABEL_228:
                sub_24BA4EEE0(a3, v47, (uint64_t)v116);
                goto LABEL_229;
              case 3:
              case 11:
              case 17:
              case 25:
                *(_QWORD *)v116 = v106[0];
                goto LABEL_103;
              case 4:
              case 10:
              case 18:
              case 24:
                *(_QWORD *)v116 = v106[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                sub_24BA47A30(a3, (uint64_t *)v116, (__int128 *)v118, v9, v12);
                return;
              case 5:
              case 19:
                *(_QWORD *)v116 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v106[0]);
LABEL_103:
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                sub_24BA47D68(a3, (uint64_t *)v116, (__int128 *)v118, v9, v12);
                return;
              case 6:
              case 20:
                v116[0] = v106[0];
                goto LABEL_105;
              case 7:
              case 9:
              case 21:
              case 23:
                v116[0] = v106[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                sub_24BA47BCC(a3, v116, (__int128 *)v118, v9, v12);
                return;
              case 8:
              case 22:
                v116[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v106[0]);
LABEL_105:
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                sub_24BA47F04(a3, v116, (__int128 *)v118, v9, v12);
                return;
              case 12:
              case 26:
                v110 = *a2;
                v111 = a2[1].n128_u64[0];
                *(__n128 *)v118 = *a2;
                v119 = a2[1].n128_u64[0];
                v51 = sub_24BA480A0(a3, (MetadataHandle *)v118, v9);
                memset(v116, 0, sizeof(v116));
                v117 = 0;
                if (v12 != 12)
                  goto LABEL_110;
                v52 = sub_24BA4EF64(a3, v45 != 0);
                MEMORY[0x24BD2C710](v116, v52);
                v53 = HIBYTE(v117);
                if (v117 < 0)
                  v53 = *(_QWORD *)&v116[2];
                if (!v53)
                {
LABEL_110:
                  *(__n128 *)v114 = v110;
                  v115 = v111;
                  v54 = sub_24BA4882C(a3, (MetadataHandle *)v114, v9);
                  ((void (*)(__n128 *__return_ptr, uint64_t, BOOL))v54)(&v112, a3, v45 != 0);
                  if (SHIBYTE(v117) < 0)
                    operator delete(*(void **)v116);
                  *(__n128 *)v116 = v112;
                  v117 = v113;
                }
                sub_24BA4EEE0(a3, v51, (uint64_t)v116);
LABEL_229:
                if (SHIBYTE(v117) < 0)
                  operator delete(*(void **)v116);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x24BD2C6B0](exception, "This should never happen, no matter what the input!");
                goto LABEL_233;
            }
          }
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v106) & 1) != 0)
            goto LABEL_91;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_116;
          return;
        case 1u:
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, v106) & 1) != 0)
            goto LABEL_91;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_116;
          return;
        case 2u:
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_116;
          return;
        case 5u:
          v118[0] = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118) & 1) != 0)
          {
            v106[0] = v118[0];
            goto LABEL_91;
          }
          if (!(_DWORD)v9 && *((_BYTE *)this + 36))
            return;
LABEL_116:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_91;
      }
      goto LABEL_233;
    case 13:
      v116[0] = 0;
      v41 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v41 >= *((_QWORD *)this + 2) || *v41 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v116))goto LABEL_180;
      }
      else
      {
        v116[0] = *v41;
        *((_QWORD *)this + 1) = v41 + 1;
      }
      memset(v118, 0, sizeof(v118));
      v119 = 0;
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if ((Raw & 1) != 0)
      {
        v92 = *a2;
        v93 = a2[1].n128_u64[0];
        sub_24BA47658(a3, (uint64_t)v118, (__int128 *)&v92, v9);
      }
      if ((SHIBYTE(v119) & 0x80000000) == 0)
        goto LABEL_199;
      v75 = *(void **)v118;
      goto LABEL_198;
    case 14:
      v116[0] = 0;
      v43 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v43 >= *((_QWORD *)this + 2) || *v43 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v116))goto LABEL_180;
        v44 = v116[0];
      }
      else
      {
        v44 = *v43;
        v116[0] = v44;
        *((_QWORD *)this + 1) = v43 + 1;
      }
      sub_24BA38754(v118, v44);
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v118);
      if ((Raw & 1) != 0)
      {
        v90 = *a2;
        v91 = a2[1].n128_u64[0];
        sub_24BA476E8(a3, (uint64_t)v118, (__int128 *)&v90, v9);
      }
LABEL_196:
      v75 = *(void **)v118;
      if (*(_QWORD *)v118)
      {
        *(_QWORD *)&v118[2] = *(_QWORD *)v118;
LABEL_198:
        operator delete(v75);
      }
LABEL_199:
      if ((Raw & 1) != 0)
        return;
      goto LABEL_180;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      v87 = v9;
      v99 = 0;
      v16 = (unsigned __int8 *)*((_QWORD *)this + 1);
      if ((unint64_t)v16 >= *((_QWORD *)this + 2) || (char)*v16 < 0)
      {
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v99) & 1) != 0)
          goto LABEL_16;
LABEL_180:
        if (!(_DWORD)v9 && *((_BYTE *)this + 36))
          return;
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
LABEL_233:
        __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      v99 = *v16;
      *((_QWORD *)this + 1) = v16 + 1;
LABEL_16:
      v86 = a3;
      UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      v97 = this;
      v98 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      __p = 0;
      v95 = 0;
      v96 = 0;
      while (1)
      {
        v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1)
          break;
        v19 = v95;
        if (v95 >= v96)
        {
          v21 = (char *)__p;
          v22 = (v95 - (_BYTE *)__p) >> 3;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61)
            sub_24BA39774();
          v24 = v96 - (_BYTE *)__p;
          if ((v96 - (_BYTE *)__p) >> 2 > v23)
            v23 = v24 >> 2;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
            v25 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v25 = v23;
          if (v25)
          {
            v26 = (char *)sub_24BA39788((uint64_t)&v96, v25);
            v21 = (char *)__p;
            v19 = v95;
          }
          else
          {
            v26 = 0;
          }
          v27 = &v26[8 * v22];
          *(_QWORD *)v27 = 0;
          v20 = v27 + 8;
          while (v19 != v21)
          {
            v28 = *((_QWORD *)v19 - 1);
            v19 -= 8;
            *((_QWORD *)v27 - 1) = v28;
            v27 -= 8;
          }
          __p = v27;
          v95 = v20;
          v96 = &v26[8 * v25];
          if (v21)
            operator delete(v21);
        }
        else
        {
          *(_QWORD *)v95 = 0;
          v20 = v19 + 8;
        }
        v95 = v20;
        switch(WireTypeForType)
        {
          case 0:
            v29 = (unint64_t *)(v20 - 8);
            v30 = (char *)*((_QWORD *)this + 1);
            if ((unint64_t)v30 >= *((_QWORD *)this + 2) || *v30 < 0)
            {
              Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0)
                goto LABEL_177;
            }
            else
            {
              *v29 = *v30;
              *((_QWORD *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_177;
          case 5:
            v118[0] = 0;
            LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v118);
            *((_QWORD *)v95 - 1) = v118[0];
            if ((LittleEndian32Fallback & 1) == 0)
              goto LABEL_177;
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_24BA400A0((uint64_t *)&__p, &v108);
          *(__n128 *)v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v118 = *a2;
          v119 = a2[1].n128_u64[0];
          v33 = sub_24BA480A0(v86, (MetadataHandle *)v118, v87);
          v34 = (double *)v108.n128_u64[1];
          v35 = (double *)v108.n128_u64[0];
          if (v108.n128_u64[0] == v108.n128_u64[1])
            goto LABEL_169;
          v36 = v33;
          v37 = 0;
          do
          {
            v38 = *v35;
            memset(v116, 0, sizeof(v116));
            v117 = 0;
            if (UnpackedType == 11)
            {
              v112 = *(__n128 *)v106;
              v113 = v107;
              sub_24BA48120(v86, (MetadataHandle *)&v112, v87, (unint64_t)v38, v114);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              *(_OWORD *)v116 = *(_OWORD *)v114;
              v117 = v115;
            }
            else if (UnpackedType == 12)
            {
              v39 = sub_24BA4EF64(v86, v38 != 0.0);
              MEMORY[0x24BD2C710](v116, v39);
            }
            v40 = HIBYTE(v117);
            if (v117 < 0)
              v40 = *(_QWORD *)&v116[2];
            if (!v40)
            {
              if (!v37)
              {
                v110 = *(__n128 *)v106;
                v111 = v107;
                v37 = sub_24BA48390(v86, (MetadataHandle *)&v110, v87);
              }
              ((void (*)(unsigned int *__return_ptr, uint64_t, double))v37)(v114, v86, v38);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              *(_OWORD *)v116 = *(_OWORD *)v114;
              v117 = v115;
            }
            sub_24BA4EEE0(v86, v36, (uint64_t)v116);
            if (SHIBYTE(v117) < 0)
              operator delete(*(void **)v116);
            ++v35;
          }
          while (v35 != v34);
          goto LABEL_168;
        case 16:
          sub_24BA4036C((uint64_t *)&__p, &v108);
          *(__n128 *)v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v118 = *a2;
          v119 = a2[1].n128_u64[0];
          v66 = sub_24BA480A0(v86, (MetadataHandle *)v118, v87);
          v67 = (double *)v108.n128_u64[1];
          v35 = (double *)v108.n128_u64[0];
          if (v108.n128_u64[0] == v108.n128_u64[1])
            goto LABEL_169;
          v68 = v66;
          v69 = 0;
          do
          {
            v70 = *(float *)v35;
            memset(v116, 0, sizeof(v116));
            v117 = 0;
            if (UnpackedType == 11)
            {
              v112 = *(__n128 *)v106;
              v113 = v107;
              sub_24BA48120(v86, (MetadataHandle *)&v112, v87, (unint64_t)v70, v114);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              *(_OWORD *)v116 = *(_OWORD *)v114;
              v117 = v115;
            }
            else if (UnpackedType == 12)
            {
              v71 = sub_24BA4EF64(v86, v70 != 0.0);
              MEMORY[0x24BD2C710](v116, v71);
            }
            v72 = HIBYTE(v117);
            if (v117 < 0)
              v72 = *(_QWORD *)&v116[2];
            if (!v72)
            {
              if (!v69)
              {
                v110 = *(__n128 *)v106;
                v111 = v107;
                v69 = sub_24BA486A0(v86, (MetadataHandle *)&v110, v87);
              }
              ((void (*)(unsigned int *__return_ptr, uint64_t, float))v69)(v114, v86, v70);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              *(_OWORD *)v116 = *(_OWORD *)v114;
              v117 = v115;
            }
            sub_24BA4EEE0(v86, v68, (uint64_t)v116);
            if (SHIBYTE(v117) < 0)
              operator delete(*(void **)v116);
            v35 = (double *)((char *)v35 + 4);
          }
          while (v35 != v67);
LABEL_168:
          v35 = (double *)v108.n128_u64[0];
LABEL_169:
          if (!v35)
            goto LABEL_177;
          v108.n128_u64[1] = (unint64_t)v35;
LABEL_171:
          v73 = v35;
          break;
        case 17:
        case 25:
          sub_24BA40020((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA49048(v86, (uint64_t **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 18:
        case 24:
          sub_24BA40020((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA48CB8(v86, (uint64_t **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 19:
          sub_24BA40638((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA49048(v86, (uint64_t **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 20:
          sub_24BA402EC((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA49210(v86, (int **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 21:
        case 23:
          sub_24BA402EC((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA48E80(v86, (unsigned int **)v118, (__int128 *)v116, v87, UnpackedType);
          goto LABEL_174;
        case 22:
          sub_24BA40884((uint64_t *)&__p, v118);
          *(__n128 *)v116 = *a2;
          v117 = a2[1].n128_i64[0];
          sub_24BA49210(v86, (int **)v118, (__int128 *)v116, v87, UnpackedType);
LABEL_174:
          v73 = *(double **)v118;
          if (!*(_QWORD *)v118)
            goto LABEL_177;
          *(_QWORD *)&v118[2] = *(_QWORD *)v118;
          break;
        case 26:
          sub_24BA403F0((uint64_t)&__p, &v108);
          *(__n128 *)v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v118 = *a2;
          v119 = a2[1].n128_u64[0];
          v55 = sub_24BA480A0(v86, (MetadataHandle *)v118, v87);
          v35 = (double *)v108.n128_u64[0];
          v56 = v108.n128_u8[8] & 0x3F;
          if (v108.n128_u64[1] > 0x3F || (v108.n128_u8[8] & 0x3F) != 0)
          {
            v57 = 0;
            v58 = 0;
            v59 = (double *)(v108.n128_u64[0] + 8 * (v108.n128_u64[1] >> 6));
            do
            {
              v60 = 1 << v58;
              memset(v116, 0, sizeof(v116));
              v117 = 0;
              v61 = v58;
              if (UnpackedType == 11)
              {
                v112 = *(__n128 *)v106;
                v113 = v107;
                sub_24BA48120(v86, (MetadataHandle *)&v112, v87, (*(_QWORD *)v35 >> v58) & 1, v114);
                if (SHIBYTE(v117) < 0)
                  operator delete(*(void **)v116);
                *(_OWORD *)v116 = *(_OWORD *)v114;
                v117 = v115;
              }
              else if (UnpackedType == 12)
              {
                v62 = sub_24BA4EF64(v86, (*(_QWORD *)v35 & v60) != 0);
                MEMORY[0x24BD2C710](v116, v62);
              }
              v63 = HIBYTE(v117);
              if (v117 < 0)
                v63 = *(_QWORD *)&v116[2];
              if (v63)
              {
                v64 = v86;
              }
              else
              {
                if (!v57)
                {
                  v110 = *(__n128 *)v106;
                  v111 = v107;
                  v57 = sub_24BA4882C(v86, (MetadataHandle *)&v110, v87);
                }
                v65 = (*(_QWORD *)v35 & v60) != 0;
                v64 = v86;
                ((void (*)(unsigned int *__return_ptr, uint64_t, _BOOL8))v57)(v114, v86, v65);
                if (SHIBYTE(v117) < 0)
                  operator delete(*(void **)v116);
                *(_OWORD *)v116 = *(_OWORD *)v114;
                v117 = v115;
              }
              sub_24BA4EEE0(v64, v55, (uint64_t)v116);
              if (SHIBYTE(v117) < 0)
                operator delete(*(void **)v116);
              v35 += v61 == 63;
              if (v61 == 63)
                v58 = 0;
              else
                v58 = v61 + 1;
            }
            while (v35 != v59 || v58 != v56);
            v35 = (double *)v108.n128_u64[0];
          }
          if (!v35)
            goto LABEL_177;
          goto LABEL_171;
        default:
          v84 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](v84, "This should never happen, no matter what the input!");
          __cxa_throw(v84, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      operator delete(v73);
LABEL_177:
      if (__p)
      {
        v95 = (char *)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v97);
      LODWORD(v9) = v87;
      if (v18 > 0)
        goto LABEL_180;
      return;
    case 27:
      v114[0] = 0;
      v42 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v42 >= *((_QWORD *)this + 2) || *v42 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v114))goto LABEL_180;
      }
      else
      {
        v114[0] = *v42;
        *((_QWORD *)this + 1) = v42 + 1;
      }
      *(_QWORD *)v118 = this;
      v118[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(_QWORD *)v116 = this;
      v88 = *a2;
      v89 = a2[1].n128_u64[0];
      sub_24BA47788(a3, this, (__int128 *)&v88, v9);
      sub_24BA47870((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v116);
      v76 = *((_DWORD *)this + 14);
      v77 = __OFSUB__(v76, 1);
      v78 = v76 - 1;
      if (v78 < 0 == v77)
        *((_DWORD *)this + 14) = v78;
      sub_24BA38A94((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v118);
      return;
    default:
      goto LABEL_180;
  }
}

void sub_24BA47464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50)
{
  void *v50;

  __cxa_free_exception(v50);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA47610(uint64_t a1)
{
  uint64_t v2;

  v2 = a1 + 80;
  sub_24BA387C4(a1 + 120);
  sub_24BA3B304(v2);
  sub_24BA3B304(a1 + 56);
  sub_24BA3B304(a1 + 16);
  return a1;
}

void sub_24BA47658(uint64_t a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v6;
  std::string v7;
  __int128 v8;
  uint64_t v9;

  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  v6 = sub_24BA480A0(a1, (MetadataHandle *)&v8, a4);
  sub_24BA4EFA8((unsigned __int8 *)a2, &v7);
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
  *(std::string *)a2 = v7;
  sub_24BA4EEE0(a1, v6, a2);
}

void sub_24BA476E8(uint64_t a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v6;
  std::string __p;
  __int128 v8;
  uint64_t v9;

  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  v6 = sub_24BA480A0(a1, (MetadataHandle *)&v8, a4);
  sub_24BA4F208(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2, *(_BYTE **)a2, &__p);
  sub_24BA4EEE0(a1, v6, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24BA4776C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *sub_24BA47788(uint64_t a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, __int128 *a3, unsigned int a4)
{
  char *v6;
  __int128 v8;
  uint64_t v9;

  v8 = *a3;
  v9 = *((_QWORD *)a3 + 2);
  v6 = sub_24BA480A0(a1, (MetadataHandle *)&v8, a4);
  sub_24BA4EECC(a1);
  std::string::append(*(std::string **)a1, v6);
  std::string::append(*(std::string **)a1, " {\n");
  ++*(_QWORD *)(a1 + 8);
  if ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    do
      sub_24BA46104(a2);
    while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) > 0);
  }
  --*(_QWORD *)(a1 + 8);
  sub_24BA4EECC(a1);
  return std::string::append(*(std::string **)a1, "}\n");
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_24BA47870(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(*a1);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(*a1);
  return a1;
}

void sub_24BA478A8(uint64_t a1, unint64_t a2, unsigned int __val)
{
  std::string *v5;
  std::string __p;
  std::string v7;

  sub_24BA4EF98(__val, &v7);
  sub_24BA4EF88(a2, &__p);
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v7;
  else
    v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
  sub_24BA4EEE0(a1, (const std::string::value_type *)v5, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
}

void sub_24BA47934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void sub_24BA47968(uint64_t a1, _BYTE *a2, unint64_t a3, unsigned int __val)
{
  std::string *v7;
  std::string __p;
  std::string v9;

  sub_24BA4EF98(__val, &v9);
  sub_24BA4F208(a3, a2, &__p);
  if ((v9.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v9;
  else
    v7 = (std::string *)v9.__r_.__value_.__r.__words[0];
  sub_24BA4EEE0(a1, (const std::string::value_type *)v7, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
}

void sub_24BA479FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void sub_24BA47A30(uint64_t a1, uint64_t *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  const char *v11;
  void *v12;
  uint64_t (*v13)(int, unint64_t);
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v22 = *a3;
  v23 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA480A0(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  v21 = 0;
  if (a5 == 11)
  {
    v16 = *a3;
    v17 = *((_QWORD *)a3 + 2);
    sub_24BA48120(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  else if (a5 == 12)
  {
    v11 = sub_24BA4EF64(a1, *a2 != 0);
    MEMORY[0x24BD2C710](__p, v11);
  }
  v12 = (void *)HIBYTE(v21);
  if (v21 < 0)
    v12 = __p[1];
  if (!v12)
  {
    v14 = *a3;
    v15 = *((_QWORD *)a3 + 2);
    v13 = sub_24BA4820C(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  sub_24BA4EEE0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
}

void sub_24BA47BA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA47BCC(uint64_t a1, _DWORD *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  const char *v11;
  void *v12;
  uint64_t (*v13)(int, unsigned int);
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v22 = *a3;
  v23 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA480A0(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  v21 = 0;
  if (a5 == 11)
  {
    v16 = *a3;
    v17 = *((_QWORD *)a3 + 2);
    sub_24BA48120(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  else if (a5 == 12)
  {
    v11 = sub_24BA4EF64(a1, *a2 != 0);
    MEMORY[0x24BD2C710](__p, v11);
  }
  v12 = (void *)HIBYTE(v21);
  if (v21 < 0)
    v12 = __p[1];
  if (!v12)
  {
    v14 = *a3;
    v15 = *((_QWORD *)a3 + 2);
    v13 = sub_24BA4851C(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(__int128 *__return_ptr, uint64_t, _QWORD))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  sub_24BA4EEE0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
}

void sub_24BA47D40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA47D68(uint64_t a1, uint64_t *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  const char *v11;
  void *v12;
  uint64_t (*v13)(int, uint64_t);
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v22 = *a3;
  v23 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA480A0(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  v21 = 0;
  if (a5 == 11)
  {
    v16 = *a3;
    v17 = *((_QWORD *)a3 + 2);
    sub_24BA48120(a1, (MetadataHandle *)&v16, a4, *a2, &v18);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  else if (a5 == 12)
  {
    v11 = sub_24BA4EF64(a1, *a2 != 0);
    MEMORY[0x24BD2C710](__p, v11);
  }
  v12 = (void *)HIBYTE(v21);
  if (v21 < 0)
    v12 = __p[1];
  if (!v12)
  {
    v14 = *a3;
    v15 = *((_QWORD *)a3 + 2);
    v13 = sub_24BA489B0(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  sub_24BA4EEE0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
}

void sub_24BA47EDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA47F04(uint64_t a1, unsigned int *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  const char *v11;
  void *v12;
  uint64_t (*v13)(int, int);
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v22 = *a3;
  v23 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA480A0(a1, (MetadataHandle *)&v22, a4);
  __p[0] = 0;
  __p[1] = 0;
  v21 = 0;
  if (a5 == 11)
  {
    v16 = *a3;
    v17 = *((_QWORD *)a3 + 2);
    sub_24BA48120(a1, (MetadataHandle *)&v16, a4, (int)*a2, &v18);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  else if (a5 == 12)
  {
    v11 = sub_24BA4EF64(a1, *a2 != 0);
    MEMORY[0x24BD2C710](__p, v11);
  }
  v12 = (void *)HIBYTE(v21);
  if (v21 < 0)
    v12 = __p[1];
  if (!v12)
  {
    v14 = *a3;
    v15 = *((_QWORD *)a3 + 2);
    v13 = sub_24BA48B34(a1, (MetadataHandle *)&v14, a4);
    ((void (*)(__int128 *__return_ptr, uint64_t, _QWORD))v13)(&v18, a1, *a2);
    if (SHIBYTE(v21) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v18;
    v21 = v19;
  }
  sub_24BA4EEE0(a1, v10, (uint64_t)__p);
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
}

void sub_24BA48078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *sub_24BA480A0(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  uint64_t Field;
  char *result;
  __n128 v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;

  v6 = *(__n128 *)a2;
  v7 = *((_QWORD *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v6, a3, &v8);
  *(__n128 *)a2 = v8;
  *((_QWORD *)a2 + 2) = v9;
  Field = MetadataHandle::getField(a2);
  if (!Field)
    return (char *)&unk_24BA5D72A;
  result = *(char **)(Field + 8);
  if (!result)
    return (char *)&unk_24BA5D72A;
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

_QWORD *sub_24BA48120@<X0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  _QWORD *result;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  __n128 v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;

  v15 = *(__n128 *)a2;
  v16 = *((_QWORD *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v15, a3, &v17);
  *(__n128 *)a2 = v17;
  *((_QWORD *)a2 + 2) = v18;
  result = (_QWORD *)MetadataHandle::getEnum(a2);
  if (!result)
    return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  v9 = (uint64_t *)result[1];
  v10 = (uint64_t *)result[2];
  if (v9 == v10)
    return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  while (1)
  {
    v11 = *v9;
    v12 = (*(_BYTE *)(*v9 + 32) & 2) != 0 ? 24 : 16;
    if (*(_QWORD *)(v11 + v12) == a4)
      break;
    if (++v9 == v10)
      return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  }
  v13 = *(__int128 **)(v11 + 8);
  if (*((char *)v13 + 23) < 0)
    return sub_24BA39638(a5, *(void **)v13, *((_QWORD *)v13 + 1));
  v14 = *v13;
  a5[2] = *((_QWORD *)v13 + 2);
  *(_OWORD *)a5 = v14;
  return result;
}

uint64_t (*sub_24BA4820C(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, unint64_t __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 72)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v7, a3, &v9),
        *(__n128 *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, unint64_t))off_251CCC838[v5];
  }
  else
  {
    return sub_24BA482A4;
  }
}

void sub_24BA482A8(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA482B0(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 5, a2, a3);
}

void sub_24BA482B8(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 5, a2, a3);
}

void sub_24BA482C0(unint64_t a1@<X1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA4832C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA48348(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA48350(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA48358(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA48360(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA48368(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA48370(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA48378(time_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA48380(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA48388(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

std::string *(__cdecl *sub_24BA48390(uint64_t a1, MetadataHandle *a2, unsigned int a3))(std::string *__return_ptr __struct_ptr retstr, double __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 72)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v7, a3, &v9),
        *(__n128 *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (std::string *(__cdecl *)(std::string *__return_ptr __struct_ptr, double))off_251CCC938[v5];
  }
  else
  {
    return j_std::to_string;
  }
}

void sub_24BA4842C(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58AB8((unint64_t)a2, a1);
}

void sub_24BA48434(__n128 *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  sub_24BA58DBC(a1 + 5, a3, a2);
}

void sub_24BA48440(__n128 *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  sub_24BA58E64(a1 + 5, a3, a2);
}

void sub_24BA4844C(std::string *a1@<X8>, double a2@<D0>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940((unint64_t)a2, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a1 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA484B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA484D4(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58EF4((unint64_t)a2, a1);
}

void sub_24BA484DC(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA5938C((unint64_t)a2, a1);
}

void sub_24BA484E4(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA594B0((unint64_t)a2, a1);
}

void sub_24BA484EC(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA595D4((unint64_t)a2, a1);
}

void sub_24BA484F4(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA596BC((unint64_t)a2, a1);
}

void sub_24BA484FC(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA59788((unint64_t)a2, a1);
}

void sub_24BA48504(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58D1C((unint64_t)a2, a1);
}

void sub_24BA4850C(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58C70((unint64_t)a2, a1);
}

void sub_24BA48514(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_24BA58C70((unint64_t)a2, a1);
}

uint64_t (*sub_24BA4851C(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, unsigned int __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 72)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v7, a3, &v9),
        *(__n128 *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, unsigned int))off_251CCCA38[v5];
  }
  else
  {
    return sub_24BA485B4;
  }
}

void sub_24BA485B8(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA485C0(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 5, a2, a3);
}

void sub_24BA485C8(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 5, a2, a3);
}

void sub_24BA485D0(unsigned int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA4863C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA48658(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA48660(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA48668(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA48670(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA48678(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA48680(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA48688(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA48690(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA48698(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

std::string *(__cdecl *sub_24BA486A0(uint64_t a1, MetadataHandle *a2, unsigned int a3))(std::string *__return_ptr __struct_ptr retstr, float __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 72)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v7, a3, &v9),
        *(__n128 *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (std::string *(__cdecl *)(std::string *__return_ptr __struct_ptr, float))off_251CCCB38[v5];
  }
  else
  {
    return j_std::to_string;
  }
}

void sub_24BA4873C(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58AB8((unint64_t)a2, a1);
}

void sub_24BA48744(__n128 *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  sub_24BA58DBC(a1 + 5, a3, a2);
}

void sub_24BA48750(__n128 *a1@<X0>, uint64_t a2@<X8>, float a3@<S0>)
{
  sub_24BA58E64(a1 + 5, a3, a2);
}

void sub_24BA4875C(std::string *a1@<X8>, float a2@<S0>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940((unint64_t)a2, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a1 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA487C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA487E4(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58EF4((unint64_t)a2, a1);
}

void sub_24BA487EC(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA5938C((unint64_t)a2, a1);
}

void sub_24BA487F4(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA594B0((unint64_t)a2, a1);
}

void sub_24BA487FC(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA595D4((unint64_t)a2, a1);
}

void sub_24BA48804(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA596BC((unint64_t)a2, a1);
}

void sub_24BA4880C(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA59788((unint64_t)a2, a1);
}

void sub_24BA48814(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58D1C((unint64_t)a2, a1);
}

void sub_24BA4881C(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58C70((unint64_t)a2, a1);
}

void sub_24BA48824(uint64_t a1@<X8>, float a2@<S0>)
{
  sub_24BA58C70((unint64_t)a2, a1);
}

uint64_t (*sub_24BA4882C(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, int __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 72)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v7, a3, &v9),
        *(__n128 *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, int))off_251CCCC38[v5];
  }
  else
  {
    return sub_24BA488C4;
  }
}

void sub_24BA488C8(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA488D0(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 5, a2, a3);
}

void sub_24BA488D8(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 5, a2, a3);
}

void sub_24BA488E0(unsigned int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA4894C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA48968(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA48970(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA48978(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA48980(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA48988(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA48990(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA48998(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA489A0(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA489A8(unsigned int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

uint64_t (*sub_24BA489B0(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, uint64_t __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 72)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v7, a3, &v9),
        *(__n128 *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, uint64_t))off_251CCCD38[v5];
  }
  else
  {
    return sub_24BA48A48;
  }
}

void sub_24BA48A4C(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA48A54(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 5, a2, a3);
}

void sub_24BA48A5C(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 5, a2, a3);
}

void sub_24BA48A64(unint64_t a1@<X1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA48AD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA48AEC(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA48AF4(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA48AFC(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA48B04(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA48B0C(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA48B14(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA48B1C(time_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA48B24(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA48B2C(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

uint64_t (*sub_24BA48B34(uint64_t a1, MetadataHandle *a2, unsigned int a3))(int, int __val)
{
  uint64_t Field;
  unsigned int v5;
  __n128 v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;

  if (*(_BYTE *)(a1 + 72)
    && (v7 = *(__n128 *)a2,
        v8 = *((_QWORD *)a2 + 2),
        DeviceConfigMetadataHelper::getSubfieldType(a1 + 16, &v7, a3, &v9),
        *(__n128 *)a2 = v9,
        *((_QWORD *)a2 + 2) = v10,
        (Field = MetadataHandle::getField(a2)) != 0)
    && (*(_WORD *)(Field + 52) & 0x20) != 0
    && (v5 = *(_DWORD *)(Field + 36) - 1, v5 <= 0x1F))
  {
    return (uint64_t (*)(int, int))off_251CCCE38[v5];
  }
  else
  {
    return sub_24BA48BCC;
  }
}

void sub_24BA48BD0(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58AB8(a1, a2);
}

void sub_24BA48BD8(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58DBC(a1 + 5, a2, a3);
}

void sub_24BA48BE0(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  sub_24BA58E64(a1 + 5, a2, a3);
}

void sub_24BA48BE8(int a1@<W1>, std::string *a2@<X8>)
{
  std::string *v3;
  std::string v4;

  sub_24BA58940(a1, &v4);
  v3 = std::string::insert(&v4, 0, "0x");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_24BA48C54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA48C70(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58EF4(a1, a2);
}

void sub_24BA48C78(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA5938C(a1, a2);
}

void sub_24BA48C80(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA594B0(a1, a2);
}

void sub_24BA48C88(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA595D4(a1, a2);
}

void sub_24BA48C90(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA596BC(a1, a2);
}

void sub_24BA48C98(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA59788(a1, a2);
}

void sub_24BA48CA0(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58D1C(a1, a2);
}

void sub_24BA48CA8(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA48CB0(int a1@<W1>, uint64_t a2@<X8>)
{
  sub_24BA58C70(a1, a2);
}

void sub_24BA48CB8(uint64_t a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  const std::string::value_type *v13;
  uint64_t (*v14)(int, unint64_t);
  uint64_t v15;
  const char *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v26 = *a3;
  v27 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA480A0(a1, (MetadataHandle *)&v26, a4);
  v11 = *a2;
  v12 = a2[1];
  if (*a2 != v12)
  {
    v13 = v10;
    v14 = 0;
    do
    {
      v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      v25 = 0;
      if (a5 == 11)
      {
        v20 = *a3;
        v21 = *((_QWORD *)a3 + 2);
        sub_24BA48120(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      else if (a5 == 12)
      {
        v16 = sub_24BA4EF64(a1, v15 != 0);
        MEMORY[0x24BD2C710](__p, v16);
      }
      v17 = (void *)HIBYTE(v25);
      if (v25 < 0)
        v17 = __p[1];
      if (!v17)
      {
        if (!v14)
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 2);
          v14 = sub_24BA4820C(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      sub_24BA4EEE0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0)
        operator delete(__p[0]);
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_24BA48E5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA48E80(uint64_t a1, unsigned int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  unsigned int *v11;
  unsigned int *v12;
  const std::string::value_type *v13;
  uint64_t (*v14)(int, unsigned int);
  uint64_t v15;
  const char *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v26 = *a3;
  v27 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA480A0(a1, (MetadataHandle *)&v26, a4);
  v11 = *a2;
  v12 = a2[1];
  if (*a2 != v12)
  {
    v13 = v10;
    v14 = 0;
    do
    {
      v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      v25 = 0;
      if (a5 == 11)
      {
        v20 = *a3;
        v21 = *((_QWORD *)a3 + 2);
        sub_24BA48120(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      else if (a5 == 12)
      {
        v16 = sub_24BA4EF64(a1, v15 != 0);
        MEMORY[0x24BD2C710](__p, v16);
      }
      v17 = (void *)HIBYTE(v25);
      if (v25 < 0)
        v17 = __p[1];
      if (!v17)
      {
        if (!v14)
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 2);
          v14 = sub_24BA4851C(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      sub_24BA4EEE0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0)
        operator delete(__p[0]);
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_24BA49024(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA49048(uint64_t a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  const std::string::value_type *v13;
  uint64_t (*v14)(int, uint64_t);
  uint64_t v15;
  const char *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v26 = *a3;
  v27 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA480A0(a1, (MetadataHandle *)&v26, a4);
  v11 = *a2;
  v12 = a2[1];
  if (*a2 != v12)
  {
    v13 = v10;
    v14 = 0;
    do
    {
      v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      v25 = 0;
      if (a5 == 11)
      {
        v20 = *a3;
        v21 = *((_QWORD *)a3 + 2);
        sub_24BA48120(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      else if (a5 == 12)
      {
        v16 = sub_24BA4EF64(a1, v15 != 0);
        MEMORY[0x24BD2C710](__p, v16);
      }
      v17 = (void *)HIBYTE(v25);
      if (v25 < 0)
        v17 = __p[1];
      if (!v17)
      {
        if (!v14)
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 2);
          v14 = sub_24BA489B0(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      sub_24BA4EEE0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0)
        operator delete(__p[0]);
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_24BA491EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA49210(uint64_t a1, int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  int *v11;
  int *v12;
  const std::string::value_type *v13;
  uint64_t (*v14)(int, int);
  uint64_t v15;
  const char *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v26 = *a3;
  v27 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA480A0(a1, (MetadataHandle *)&v26, a4);
  v11 = *a2;
  v12 = a2[1];
  if (*a2 != v12)
  {
    v13 = v10;
    v14 = 0;
    do
    {
      v15 = *v11;
      __p[0] = 0;
      __p[1] = 0;
      v25 = 0;
      if (a5 == 11)
      {
        v20 = *a3;
        v21 = *((_QWORD *)a3 + 2);
        sub_24BA48120(a1, (MetadataHandle *)&v20, a4, v15, &v22);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      else if (a5 == 12)
      {
        v16 = sub_24BA4EF64(a1, v15 != 0);
        MEMORY[0x24BD2C710](__p, v16);
      }
      v17 = (void *)HIBYTE(v25);
      if (v25 < 0)
        v17 = __p[1];
      if (!v17)
      {
        if (!v14)
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 2);
          v14 = sub_24BA48B34(a1, (MetadataHandle *)&v18, a4);
        }
        ((void (*)(__int128 *__return_ptr, uint64_t, uint64_t))v14)(&v22, a1, v15);
        if (SHIBYTE(v25) < 0)
          operator delete(__p[0]);
        *(_OWORD *)__p = v22;
        v25 = v23;
      }
      sub_24BA4EEE0(a1, v13, (uint64_t)__p);
      if (SHIBYTE(v25) < 0)
        operator delete(__p[0]);
      ++v11;
    }
    while (v11 != v12);
  }
}

void sub_24BA493B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA493D8(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t *a3)
{
  unsigned __int8 *v6;
  uint64_t TagFallback;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 v10;
  uint64_t BuiltinType;
  int v12;
  uint64_t DecodingType;
  char *v14;
  void *exception;
  unsigned __int8 *v16;
  int WireTypeForType;
  int v18;
  char **v19;
  char **v20;
  char **v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char **v27;
  char *v28;
  unint64_t *v29;
  char *v30;
  char Varint64Fallback;
  char LittleEndian32Fallback;
  char *v33;
  double *i;
  double *v35;
  double v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  unsigned int v41;
  unint64_t v42;
  float v43;
  char *v44;
  char ***v45;
  double v46;
  _BOOL8 v47;
  char *v48;
  int v49;
  int v50;
  char *v51;
  _QWORD *v52;
  int v53;
  int v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  void *v59;
  float *j;
  float *v61;
  float v62;
  uint64_t v63;
  int v64;
  char Raw;
  void *v66;
  int v67;
  BOOL v68;
  int v69;
  char **v70;
  uint64_t v71;
  char v72;
  _QWORD *v73;
  int v74;
  char **v75;
  uint64_t v76;
  char v77;
  _QWORD *v78;
  int v79;
  char **v80;
  int v81;
  void *v82;
  uint64_t *v83;
  int UnpackedType;
  unsigned int v85;
  __int128 v86;
  uint64_t v87;
  __n128 v88;
  unint64_t v89;
  __n128 v90;
  unint64_t v91;
  __n128 v92;
  unint64_t v93;
  void *__p;
  char **v95;
  unint64_t v96;
  wireless_diagnostics::google::protobuf::io::CodedInputStream *v97;
  int v98;
  unsigned int v99;
  __int128 v100;
  uint64_t v101;
  __n128 v102;
  unint64_t v103;
  __int128 v104;
  uint64_t v105;
  __n128 v106;
  unint64_t v107;
  __n128 v108;
  unint64_t v109;
  double v110;
  unsigned int v111[4];
  unint64_t v112;
  unsigned int v113[4];
  int64_t v114;
  unint64_t v115;
  char **v116;
  unsigned int v117[4];
  unint64_t v118;

  v6 = (unsigned __int8 *)*((_QWORD *)this + 1);
  if ((unint64_t)v6 >= *((_QWORD *)this + 2) || (char)*v6 < 0)
  {
    TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if ((_DWORD)TagFallback)
      goto LABEL_4;
LABEL_10:
    if (*((_BYTE *)this + 36))
      return;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
    goto LABEL_199;
  }
  TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((_QWORD *)this + 1) = v6 + 1;
  if (!(_DWORD)TagFallback)
    goto LABEL_10;
LABEL_4:
  v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  v9 = HIDWORD(v8);
  v10 = v8;
  v102 = *a2;
  v103 = a2[1].n128_u64[0];
  DeviceConfigMetadataHelper::getSubfieldType((uint64_t)(a3 + 1), &v102, HIDWORD(v8), (__n128 *)&v104);
  v100 = v104;
  v101 = v105;
  BuiltinType = MetadataHelper::getBuiltinType((uint64_t)(a3 + 1), (MetadataHandle *)&v100);
  v12 = BuiltinType;
  DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(_QWORD *)v117 = 0;
          if (sub_24BA3E798(this, (unint64_t *)v117))
            goto LABEL_178;
          goto LABEL_151;
        case 1u:
          *(_QWORD *)v117 = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v117) & 1) != 0)goto LABEL_151;
LABEL_178:
          v70 = *(char ***)v117;
          goto LABEL_181;
        case 2u:
          v113[0] = 0;
          if ((sub_24BA3E7C8(this, v113) & 1) == 0)
            goto LABEL_151;
          sub_24BA38754(v117, v113[0]);
          Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v117);
          if ((Raw & 1) != 0)
            sub_24BA4AD44(a3, *(_BYTE **)v117, *(_QWORD *)&v117[2] - *(_QWORD *)v117, v9);
          goto LABEL_169;
        case 5u:
          v117[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v117))goto LABEL_151;
          v70 = (char **)v117[0];
LABEL_181:
          sub_24BA4AC8C(a3, v70, v9);
          break;
        default:
          goto LABEL_151;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      v115 = 0;
      switch(v10)
      {
        case 0u:
          v14 = (char *)*((_QWORD *)this + 1);
          if ((unint64_t)v14 < *((_QWORD *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            v115 = *v14;
            *((_QWORD *)this + 1) = v14 + 1;
LABEL_84:
            v42 = v115;
            switch(v12)
            {
              case 1:
              case 15:
                v46 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v115);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                v44 = sub_24BA4B5CC((uint64_t)a3, (MetadataHandle *)v117, v9);
                v45 = (char ***)&v106.n128_u64[1];
                v106.n128_u8[0] = 7;
                v106.n128_f64[1] = v46;
                if (v12 == 11)
                {
                  *(__n128 *)v111 = v108;
                  v112 = v109;
                  sub_24BA4B64C((uint64_t)a3, (MetadataHandle *)v111, v9, (unint64_t)v46, v113);
                  v76 = HIBYTE(v114);
                  v77 = HIBYTE(v114);
                  if (v114 < 0)
                    v76 = *(_QWORD *)&v113[2];
                  if (v76)
                  {
                    v78 = operator new(0x18uLL);
                    *(_OWORD *)v78 = *(_OWORD *)v113;
                    v78[2] = v114;
                    v114 = 0;
                    memset(v113, 0, sizeof(v113));
                    v79 = v106.n128_u8[0];
                    v106.n128_u8[0] = 3;
                    LOBYTE(__p) = v79;
                    v80 = (char **)v106.n128_u64[1];
                    v106.n128_u64[1] = (unint64_t)v78;
                    v95 = v80;
                    sub_24BA3C92C(&v95, v79);
                    v77 = HIBYTE(v114);
                  }
                  if (v77 < 0)
                    operator delete(*(void **)v113);
                }
                else if (v12 == 12)
                {
                  v106.n128_u8[0] = 4;
                  LOBYTE(v111[0]) = 7;
                  v106.n128_u64[1] = v46 != 0.0;
                  *(double *)&v111[2] = v46;
                  sub_24BA3C92C((char ***)&v111[2], 7);
                }
                goto LABEL_195;
              case 2:
              case 16:
                v43 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v115);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                v44 = sub_24BA4B5CC((uint64_t)a3, (MetadataHandle *)v117, v9);
                v45 = (char ***)&v106.n128_u64[1];
                v106.n128_u8[0] = 7;
                v106.n128_f64[1] = v43;
                if (v12 == 11)
                {
                  *(__n128 *)v111 = v108;
                  v112 = v109;
                  sub_24BA4B64C((uint64_t)a3, (MetadataHandle *)v111, v9, (unint64_t)v43, v113);
                  v71 = HIBYTE(v114);
                  v72 = HIBYTE(v114);
                  if (v114 < 0)
                    v71 = *(_QWORD *)&v113[2];
                  if (v71)
                  {
                    v73 = operator new(0x18uLL);
                    *(_OWORD *)v73 = *(_OWORD *)v113;
                    v73[2] = v114;
                    v114 = 0;
                    memset(v113, 0, sizeof(v113));
                    v74 = v106.n128_u8[0];
                    v106.n128_u8[0] = 3;
                    LOBYTE(__p) = v74;
                    v75 = (char **)v106.n128_u64[1];
                    v106.n128_u64[1] = (unint64_t)v73;
                    v95 = v75;
                    sub_24BA3C92C(&v95, v74);
                    v72 = HIBYTE(v114);
                  }
                  if (v72 < 0)
                    operator delete(*(void **)v113);
                }
                else if (v12 == 12)
                {
                  v106.n128_u8[0] = 4;
                  LOBYTE(v111[0]) = 7;
                  v106.n128_u64[1] = v43 != 0.0;
                  *(double *)&v111[2] = v43;
                  sub_24BA3C92C((char ***)&v111[2], 7);
                }
LABEL_195:
                *(__n128 *)v113 = v108;
                v114 = v109;
                v81 = sub_24BA4B738((uint64_t)a3, (MetadataHandle *)v113, v9);
                sub_24BA544B0(a3, v44, (uint64_t)&v106, v81);
                v50 = v106.n128_u8[0];
                goto LABEL_196;
              case 3:
              case 11:
              case 17:
              case 25:
                goto LABEL_95;
              case 4:
              case 10:
              case 18:
              case 24:
                *(_QWORD *)v113 = v115;
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA4AE6C(a3, (char ***)v113, (__int128 *)v117, v9, v12);
                return;
              case 5:
              case 19:
                v42 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v115);
LABEL_95:
                *(_QWORD *)v113 = v42;
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA4B21C(a3, (char ***)v113, (__int128 *)v117, v9, v12);
                return;
              case 6:
              case 20:
                v113[0] = v115;
                goto LABEL_97;
              case 7:
              case 9:
              case 21:
              case 23:
                v113[0] = v115;
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA4B044(a3, v113, (__int128 *)v117, v9, v12);
                return;
              case 8:
              case 22:
                v113[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v115);
LABEL_97:
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA4B3F4(a3, (int *)v113, (__int128 *)v117, v9, v12);
                return;
              case 12:
              case 26:
                v47 = v115 != 0;
                *(__n128 *)v111 = *a2;
                v112 = a2[1].n128_u64[0];
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                v48 = sub_24BA4B5CC((uint64_t)a3, (MetadataHandle *)v117, v9);
                v45 = (char ***)&v108.n128_u64[1];
                v108.n128_u8[0] = 4;
                v108.n128_u64[1] = v47;
                if (v12 == 12)
                {
                  v106.n128_u8[0] = 4;
                  v106.n128_u64[1] = v47;
                  sub_24BA3C92C((char ***)&v106.n128_u64[1], 4);
                }
                *(_OWORD *)v113 = *(_OWORD *)v111;
                v114 = v112;
                v49 = sub_24BA4B738((uint64_t)a3, (MetadataHandle *)v113, v9);
                sub_24BA544B0(a3, v48, (uint64_t)&v108, v49);
                v50 = v108.n128_u8[0];
LABEL_196:
                sub_24BA3C92C(v45, v50);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x24BD2C6B0](exception, "This should never happen, no matter what the input!");
                goto LABEL_199;
            }
          }
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v115) & 1) != 0)
            goto LABEL_84;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_103;
          return;
        case 1u:
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, &v115) & 1) != 0)
            goto LABEL_84;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_103;
          return;
        case 2u:
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_103;
          return;
        case 5u:
          v117[0] = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v117) & 1) != 0)
          {
            v115 = v117[0];
            goto LABEL_84;
          }
          if (!(_DWORD)v9 && *((_BYTE *)this + 36))
            return;
LABEL_103:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_84;
      }
      goto LABEL_199;
    case 13:
      v113[0] = 0;
      v38 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v38 >= *((_QWORD *)this + 2) || *v38 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v113))goto LABEL_151;
      }
      else
      {
        v113[0] = *v38;
        *((_QWORD *)this + 1) = v38 + 1;
      }
      memset(v117, 0, sizeof(v117));
      v118 = 0;
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if ((Raw & 1) != 0)
      {
        v92 = *a2;
        v93 = a2[1].n128_u64[0];
        sub_24BA4A914(a3, (uint64_t)v117, (__int128 *)&v92, v9);
      }
      if ((SHIBYTE(v118) & 0x80000000) == 0)
        goto LABEL_172;
      v66 = *(void **)v117;
      goto LABEL_171;
    case 14:
      v113[0] = 0;
      v40 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v40 >= *((_QWORD *)this + 2) || *v40 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v113))goto LABEL_151;
        v41 = v113[0];
      }
      else
      {
        v41 = *v40;
        v113[0] = v41;
        *((_QWORD *)this + 1) = v40 + 1;
      }
      sub_24BA38754(v117, v41);
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v117);
      if ((Raw & 1) != 0)
      {
        v90 = *a2;
        v91 = a2[1].n128_u64[0];
        sub_24BA4AA00(a3, (uint64_t)v117, (__int128 *)&v90, v9);
      }
LABEL_169:
      v66 = *(void **)v117;
      if (*(_QWORD *)v117)
      {
        *(_QWORD *)&v117[2] = *(_QWORD *)v117;
LABEL_171:
        operator delete(v66);
      }
LABEL_172:
      if ((Raw & 1) != 0)
        return;
      goto LABEL_151;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      v99 = 0;
      v16 = (unsigned __int8 *)*((_QWORD *)this + 1);
      if ((unint64_t)v16 >= *((_QWORD *)this + 2) || (char)*v16 < 0)
      {
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v99) & 1) != 0)
          goto LABEL_16;
LABEL_151:
        if (!(_DWORD)v9 && *((_BYTE *)this + 36))
          return;
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
LABEL_199:
        __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      v99 = *v16;
      *((_QWORD *)this + 1) = v16 + 1;
LABEL_16:
      v83 = a3;
      v85 = v9;
      UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      v97 = this;
      v98 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      __p = 0;
      v95 = 0;
      v96 = 0;
      while (1)
      {
        v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1)
          break;
        v19 = v95;
        if ((unint64_t)v95 >= v96)
        {
          v21 = (char **)__p;
          v22 = ((char *)v95 - (_BYTE *)__p) >> 3;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61)
            sub_24BA39774();
          v24 = v96 - (_QWORD)__p;
          if ((uint64_t)(v96 - (_QWORD)__p) >> 2 > v23)
            v23 = v24 >> 2;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
            v25 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v25 = v23;
          if (v25)
          {
            v26 = (char *)sub_24BA39788((uint64_t)&v96, v25);
            v21 = (char **)__p;
            v19 = v95;
          }
          else
          {
            v26 = 0;
          }
          v27 = (char **)&v26[8 * v22];
          *v27 = 0;
          v20 = v27 + 1;
          while (v19 != v21)
          {
            v28 = *--v19;
            *--v27 = v28;
          }
          __p = v27;
          v95 = v20;
          v96 = (unint64_t)&v26[8 * v25];
          if (v21)
            operator delete(v21);
        }
        else
        {
          *v95 = 0;
          v20 = v19 + 1;
        }
        v95 = v20;
        switch(WireTypeForType)
        {
          case 0:
            v29 = (unint64_t *)(v20 - 1);
            v30 = (char *)*((_QWORD *)this + 1);
            if ((unint64_t)v30 >= *((_QWORD *)this + 2) || *v30 < 0)
            {
              Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0)
                goto LABEL_148;
            }
            else
            {
              *v29 = *v30;
              *((_QWORD *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_148;
          case 5:
            v117[0] = 0;
            LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v117);
            *(v95 - 1) = (char *)v117[0];
            if ((LittleEndian32Fallback & 1) == 0)
              goto LABEL_148;
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_24BA400A0((uint64_t *)&__p, &v108);
          v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v117 = *a2;
          v118 = a2[1].n128_u64[0];
          v33 = sub_24BA4B5CC((uint64_t)v83, (MetadataHandle *)v117, v85);
          v116 = 0;
          LOBYTE(v115) = 2;
          *(_QWORD *)v113 = 0;
          *(_QWORD *)v111 = 0;
          v116 = (char **)sub_24BA42860((uint64_t *)v113, (uint64_t *)v111);
          v35 = (double *)v108.n128_u64[1];
          for (i = (double *)v108.n128_u64[0]; i != v35; ++i)
          {
            v36 = *i;
            v110 = *i;
            if (UnpackedType == 11)
            {
              *(__n128 *)v111 = v106;
              v112 = v107;
              sub_24BA4B64C((uint64_t)v83, (MetadataHandle *)v111, v85, (unint64_t)v36, v113);
              v37 = HIBYTE(v114);
              if (v114 < 0)
                v37 = *(_QWORD *)&v113[2];
              if (v37)
                sub_24BA44D0C((uint64_t)&v115, (uint64_t)v113);
              else
                sub_24BA4531C((uint64_t)&v115, (uint64_t *)&v110);
              if (SHIBYTE(v114) < 0)
                operator delete(*(void **)v113);
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v113[0]) = v36 != 0.0;
              sub_24BA44BC4((uint64_t)&v115, (unsigned __int8 *)v113);
            }
            else
            {
              sub_24BA4531C((uint64_t)&v115, (uint64_t *)&v110);
            }
          }
          goto LABEL_154;
        case 16:
          sub_24BA4036C((uint64_t *)&__p, &v108);
          v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v117 = *a2;
          v118 = a2[1].n128_u64[0];
          v33 = sub_24BA4B5CC((uint64_t)v83, (MetadataHandle *)v117, v85);
          v116 = 0;
          LOBYTE(v115) = 2;
          *(_QWORD *)v113 = 0;
          *(_QWORD *)v111 = 0;
          v116 = (char **)sub_24BA42860((uint64_t *)v113, (uint64_t *)v111);
          v61 = (float *)v108.n128_u64[1];
          for (j = (float *)v108.n128_u64[0]; j != v61; ++j)
          {
            v62 = *j;
            *(float *)&v110 = *j;
            if (UnpackedType == 11)
            {
              *(__n128 *)v111 = v106;
              v112 = v107;
              sub_24BA4B64C((uint64_t)v83, (MetadataHandle *)v111, v85, (unint64_t)v62, v113);
              v63 = HIBYTE(v114);
              if (v114 < 0)
                v63 = *(_QWORD *)&v113[2];
              if (v63)
                sub_24BA44D0C((uint64_t)&v115, (uint64_t)v113);
              else
                sub_24BA457BC((uint64_t)&v115, (float *)&v110);
              if (SHIBYTE(v114) < 0)
                operator delete(*(void **)v113);
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v113[0]) = v62 != 0.0;
              sub_24BA44BC4((uint64_t)&v115, (unsigned __int8 *)v113);
            }
            else
            {
              sub_24BA457BC((uint64_t)&v115, (float *)&v110);
            }
          }
LABEL_154:
          *(__n128 *)v113 = v106;
          v114 = v107;
          v64 = sub_24BA4B738((uint64_t)v83, (MetadataHandle *)v113, v85);
          sub_24BA544B0(v83, v33, (uint64_t)&v115, v64);
          sub_24BA3C92C(&v116, v115);
          v59 = (void *)v108.n128_u64[0];
          if (!v108.n128_u64[0])
            break;
          v108.n128_u64[1] = v108.n128_u64[0];
          goto LABEL_147;
        case 17:
        case 25:
          sub_24BA40020((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA4BB44(v83, (uint64_t **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 18:
        case 24:
          sub_24BA40020((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA4B7B4(v83, (uint64_t **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 19:
          sub_24BA40638((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA4BB44(v83, (uint64_t **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 20:
          sub_24BA402EC((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA4BD0C(v83, (int **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 21:
        case 23:
          sub_24BA402EC((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA4B97C(v83, (unsigned int **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 22:
          sub_24BA40884((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA4BD0C(v83, (int **)v117, (__int128 *)v113, v85, UnpackedType);
LABEL_145:
          v59 = *(void **)v117;
          if (!*(_QWORD *)v117)
            break;
          *(_QWORD *)&v117[2] = *(_QWORD *)v117;
LABEL_147:
          operator delete(v59);
          break;
        case 26:
          sub_24BA403F0((uint64_t)&__p, &v108);
          v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v117 = *a2;
          v118 = a2[1].n128_u64[0];
          v51 = sub_24BA4B5CC((uint64_t)v83, (MetadataHandle *)v117, v85);
          v116 = 0;
          LOBYTE(v115) = 2;
          *(_QWORD *)v113 = 0;
          *(_QWORD *)v111 = 0;
          v116 = (char **)sub_24BA42860((uint64_t *)v113, (uint64_t *)v111);
          v52 = (_QWORD *)v108.n128_u64[0];
          v53 = v108.n128_u8[8] & 0x3F;
          if (v108.n128_u64[1] > 0x3F || (v108.n128_u8[8] & 0x3F) != 0)
          {
            v54 = 0;
            v55 = (_QWORD *)(v108.n128_u64[0] + 8 * (v108.n128_u64[1] >> 6));
            do
            {
              v56 = *v52 & (1 << v54);
              LOBYTE(v110) = v56 != 0;
              if (UnpackedType == 11)
              {
                *(__n128 *)v111 = v106;
                v112 = v107;
                sub_24BA4B64C((uint64_t)v83, (MetadataHandle *)v111, v85, v56 != 0, v113);
                v57 = HIBYTE(v114);
                if (v114 < 0)
                  v57 = *(_QWORD *)&v113[2];
                if (v57)
                  sub_24BA44D0C((uint64_t)&v115, (uint64_t)v113);
                else
                  sub_24BA45A14((uint64_t)&v115, (unsigned __int8 *)&v110);
                if (SHIBYTE(v114) < 0)
                  operator delete(*(void **)v113);
              }
              else if (UnpackedType == 12)
              {
                LOBYTE(v113[0]) = v56 != 0;
                sub_24BA44BC4((uint64_t)&v115, (unsigned __int8 *)v113);
              }
              else
              {
                sub_24BA45A14((uint64_t)&v115, (unsigned __int8 *)&v110);
              }
              v52 += v54 == 63;
              if (v54 == 63)
                v54 = 0;
              else
                ++v54;
            }
            while (v52 != v55 || v54 != v53);
          }
          *(__n128 *)v113 = v106;
          v114 = v107;
          v58 = sub_24BA4B738((uint64_t)v83, (MetadataHandle *)v113, v85);
          sub_24BA544B0(v83, v51, (uint64_t)&v115, v58);
          sub_24BA3C92C(&v116, v115);
          v59 = (void *)v108.n128_u64[0];
          if (!v108.n128_u64[0])
            break;
          goto LABEL_147;
        default:
          v82 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](v82, "This should never happen, no matter what the input!");
          __cxa_throw(v82, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
LABEL_148:
      if (__p)
      {
        v95 = (char **)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v97);
      LODWORD(v9) = v85;
      if (v18 > 0)
        goto LABEL_151;
      return;
    case 27:
      v111[0] = 0;
      v39 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v39 >= *((_QWORD *)this + 2) || *v39 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v111))goto LABEL_151;
      }
      else
      {
        v111[0] = *v39;
        *((_QWORD *)this + 1) = v39 + 1;
      }
      *(_QWORD *)v117 = this;
      v117[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(_QWORD *)v113 = this;
      v88 = *a2;
      v89 = a2[1].n128_u64[0];
      v86 = v104;
      v87 = v105;
      sub_24BA4AB28(a3, this, (__int128 *)&v88, v9, &v86);
      sub_24BA4AC54((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v113);
      v67 = *((_DWORD *)this + 14);
      v68 = __OFSUB__(v67, 1);
      v69 = v67 - 1;
      if (v69 < 0 == v68)
        *((_DWORD *)this + 14) = v69;
      sub_24BA38A94((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v117);
      return;
    default:
      goto LABEL_151;
  }
}

void sub_24BA4A728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,unsigned __int8 a45)
{
  int v45;
  char ***v46;
  uint64_t v47;

  if (v45 < 0)
    operator delete(*(void **)(v47 - 192));
  sub_24BA3C92C(v46, a45);
  _Unwind_Resume(a1);
}

void sub_24BA4A914(uint64_t *a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v8;
  char **v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  unsigned __int8 v13[8];
  char **v14;
  __int128 v15;
  uint64_t v16;

  v15 = *a3;
  v16 = *((_QWORD *)a3 + 2);
  v8 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v15, a4);
  v13[0] = 3;
  v9 = (char **)operator new(0x18uLL);
  *(_OWORD *)v9 = *(_OWORD *)a2;
  v9[2] = *(char **)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v14 = v9;
  v11 = *a3;
  v12 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_24BA544B0(a1, v8, (uint64_t)v13, v10);
  sub_24BA3C92C(&v14, v13[0]);
}

void sub_24BA4A9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  char ***v13;

  sub_24BA3C92C(v13, a13);
  _Unwind_Resume(a1);
}

void sub_24BA4AA00(uint64_t *a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v8;
  char **v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  std::string __p;
  unsigned __int8 v14[8];
  char **v15;
  __int128 v16;
  uint64_t v17;

  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v8 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA4F208(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2, *(_BYTE **)a2, &__p);
  v15 = 0;
  v14[0] = 3;
  v9 = (char **)operator new(0x18uLL);
  *(std::string *)v9 = __p;
  v15 = v9;
  v11 = *a3;
  v12 = *((_QWORD *)a3 + 2);
  memset(&__p, 0, sizeof(__p));
  v10 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_24BA544B0(a1, v8, (uint64_t)v14, v10);
  sub_24BA3C92C(&v15, v14[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24BA4AAF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA4AB28(uint64_t *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, __int128 *a3, unsigned int a4, __int128 *a5)
{
  char *v10;
  uint64_t v11;
  int v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _BYTE v17[8];
  char **v18;
  __int128 v19;
  uint64_t v20;

  v19 = *a3;
  v20 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v19, a4);
  v11 = *a1;
  sub_24BA42608((uint64_t)v17, 0, 0, 0, 1);
  *a1 = (uint64_t)v17;
  while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    v15 = *a5;
    v16 = *((_QWORD *)a5 + 2);
    sub_24BA493D8(a2);
  }
  *a1 = v11;
  v13 = *a3;
  v14 = *((_QWORD *)a3 + 2);
  v12 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v13, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v17, v12);
  sub_24BA3C92C(&v18, v17[0]);
}

void sub_24BA4AC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, ...)
{
  va_list va;

  va_start(va, a10);
  sub_24BA3C92C((char ***)va, a10);
  _Unwind_Resume(a1);
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_24BA4AC54(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(*a1);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(*a1);
  return a1;
}

void sub_24BA4AC8C(uint64_t *a1, char **a2, unsigned int __val)
{
  std::string *v5;
  unsigned __int8 v6[8];
  char **v7;
  std::string v8;

  std::to_string(&v8, __val);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v8;
  else
    v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
  v6[0] = 6;
  v7 = a2;
  sub_24BA544B0(a1, (char *)v5, (uint64_t)v6, 1);
  sub_24BA3C92C(&v7, v6[0]);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
}

void sub_24BA4AD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned __int8 a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  char ***v17;

  sub_24BA3C92C(v17, a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_24BA4AD44(uint64_t *a1, _BYTE *a2, unint64_t a3, unsigned int __val)
{
  std::string *v7;
  char **v8;
  std::string __p;
  unsigned __int8 v10[8];
  char **v11;
  std::string v12;

  v7 = &v12;
  std::to_string(&v12, __val);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  sub_24BA4F208(a3, a2, &__p);
  v11 = 0;
  v10[0] = 3;
  v8 = (char **)operator new(0x18uLL);
  *(std::string *)v8 = __p;
  memset(&__p, 0, sizeof(__p));
  v11 = v8;
  sub_24BA544B0(a1, (char *)v7, (uint64_t)v10, 1);
  sub_24BA3C92C(&v11, v10[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_24BA4AE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, unsigned __int8 a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  char ***v22;

  sub_24BA3C92C(v22, a15);
  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
    operator delete(a17);
  _Unwind_Resume(a1);
}

void sub_24BA4AE6C(uint64_t *a1, char ***a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  char **v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 6;
  v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA4B64C((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 6;
    v29 = v11 != 0;
    v27 = v11;
    sub_24BA3C92C(&v27, 6);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA4B014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA4B044(uint64_t *a1, unsigned int *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 6;
  v29 = v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA4B64C((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 6;
    v29 = (_DWORD)v11 != 0;
    v27 = (char **)v11;
    sub_24BA3C92C(&v27, 6);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA4B1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA4B21C(uint64_t *a1, char ***a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  char **v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 5;
  v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA4B64C((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 5;
    v29 = v11 != 0;
    v27 = v11;
    sub_24BA3C92C(&v27, 5);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA4B3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA4B3F4(uint64_t *a1, int *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 5;
  v29 = v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA4B64C((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 5;
    v29 = (_DWORD)v11 != 0;
    v27 = (char **)v11;
    sub_24BA3C92C(&v27, 5);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA4B59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

char *sub_24BA4B5CC(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  uint64_t Field;
  char *result;
  __n128 v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;

  v6 = *(__n128 *)a2;
  v7 = *((_QWORD *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 8, &v6, a3, &v8);
  *(__n128 *)a2 = v8;
  *((_QWORD *)a2 + 2) = v9;
  Field = MetadataHandle::getField(a2);
  if (!Field)
    return (char *)&unk_24BA5D72A;
  result = *(char **)(Field + 8);
  if (!result)
    return (char *)&unk_24BA5D72A;
  if (result[23] < 0)
    return *(char **)result;
  return result;
}

_QWORD *sub_24BA4B64C@<X0>(uint64_t a1@<X0>, MetadataHandle *a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  _QWORD *result;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  __n128 v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;

  v15 = *(__n128 *)a2;
  v16 = *((_QWORD *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 8, &v15, a3, &v17);
  *(__n128 *)a2 = v17;
  *((_QWORD *)a2 + 2) = v18;
  result = (_QWORD *)MetadataHandle::getEnum(a2);
  if (!result)
    return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  v9 = (uint64_t *)result[1];
  v10 = (uint64_t *)result[2];
  if (v9 == v10)
    return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  while (1)
  {
    v11 = *v9;
    v12 = (*(_BYTE *)(*v9 + 32) & 2) != 0 ? 24 : 16;
    if (*(_QWORD *)(v11 + v12) == a4)
      break;
    if (++v9 == v10)
      return sub_24BA3C010(a5, (char *)&unk_24BA5D72A);
  }
  v13 = *(__int128 **)(v11 + 8);
  if (*((char *)v13 + 23) < 0)
    return sub_24BA39638(a5, *(void **)v13, *((_QWORD *)v13 + 1));
  v14 = *v13;
  a5[2] = *((_QWORD *)v13 + 2);
  *(_OWORD *)a5 = v14;
  return result;
}

uint64_t sub_24BA4B738(uint64_t a1, MetadataHandle *a2, unsigned int a3)
{
  uint64_t result;
  __n128 v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;

  v5 = *(__n128 *)a2;
  v6 = *((_QWORD *)a2 + 2);
  DeviceConfigMetadataHelper::getSubfieldType(a1 + 8, &v5, a3, &v7);
  *(__n128 *)a2 = v7;
  *((_QWORD *)a2 + 2) = v8;
  result = MetadataHandle::getField(a2);
  if (result)
    return (*(_WORD *)(result + 52) & 0x400) != 0 && *(_BYTE *)(result + 50) != 0;
  return result;
}

void sub_24BA4B7B4(uint64_t *a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  uint64_t v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA4B64C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA44EBC((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA44EBC((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA4B93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

void sub_24BA4B97C(uint64_t *a1, unsigned int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  unsigned int v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA4B64C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA4556C((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = (_DWORD)v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA4556C((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA4BB04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

void sub_24BA4BB44(uint64_t *a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  uint64_t v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA4B64C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA45C64((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA45C64((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA4BCCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

void sub_24BA4BD0C(uint64_t *a1, int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  int *v11;
  int *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  int v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA4B5CC((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA4B64C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA45EB4((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = (_DWORD)v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA45EB4((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA4B738((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA4BE94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

uint64_t wis::reflect::getUnpackedType(uint64_t result)
{
  if ((result - 15) >= 0xC)
    return result;
  else
    return (result - 14);
}

uint64_t wis::reflect::getPackedType(int a1)
{
  if ((a1 - 1) > 0x19)
    return 0;
  else
    return dword_24BA5E8E0[a1 - 1];
}

uint64_t wis::protobuf::skipField(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  uint64_t result;
  char *v4;
  char *v5;
  unsigned int v6[2];

  result = 0;
  switch(a2)
  {
    case 0:
      *(_QWORD *)v6 = 0;
      v4 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v4 >= *((_QWORD *)this + 2) || *v4 < 0)
        return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, (unint64_t *)v6);
      *((_QWORD *)this + 1) = v4 + 1;
      return 1;
    case 1:
      *(_QWORD *)v6 = 0;
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v6);
    case 2:
      v6[0] = 0;
      v5 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v5 >= *((_QWORD *)this + 2) || *v5 < 0)
      {
        result = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v6);
        if (!(_DWORD)result)
          return result;
      }
      else
      {
        v6[0] = *v5;
        *((_QWORD *)this + 1) = v5 + 1;
      }
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(this);
    case 5:
      v6[0] = 0;
      return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v6);
    default:
      return result;
  }
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(unsigned int a1)
{
  return -(a1 & 1) ^ (a1 >> 1);
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)8>::encode(int a1)
{
  return (2 * a1) ^ (a1 >> 31);
}

unint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(unint64_t a1)
{
  return -(uint64_t)(a1 & 1) ^ (a1 >> 1);
}

uint64_t wis::protobuf::NumberConverter<(wis::reflect::Type)5>::encode(uint64_t a1)
{
  return (2 * a1) ^ (a1 >> 63);
}

double wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(uint64_t a1)
{
  return *(double *)&a1;
}

float wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(int a1)
{
  return *(float *)&a1;
}

uint64_t sub_24BA4C05C(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(this, a3);
  if (*(_QWORD *)(a1 + 8))
    PB::TextFormatter::format();
  v5 = *(_BYTE *)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "s_value");
    v5 = *(_BYTE *)(a1 + 32);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(this, "u_value");
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_24BA4C0DC(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  char v4;

  v3 = result;
  if (*(_QWORD *)(result + 8))
    result = PB::Writer::write();
  v4 = *(_BYTE *)(v3 + 32);
  if ((v4 & 2) != 0)
  {
    result = PB::Writer::writeVarInt(this);
    v4 = *(_BYTE *)(v3 + 32);
  }
  if ((v4 & 1) != 0)
    return PB::Writer::writeVarInt(this);
  return result;
}

_QWORD *sub_24BA4C148(_QWORD *result)
{
  *result = off_251CCCF98;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  return result;
}

void sub_24BA4C15C(void **a1)
{
  void **v2;

  *a1 = off_251CCCF98;
  v2 = a1 + 1;
  sub_24BA39574(&v2);
  PB::Base::~Base((PB::Base *)a1);
}

uint64_t sub_24BA4C1A4(void **a1)
{
  void **v3;

  *a1 = off_251CCCF98;
  v3 = a1 + 1;
  sub_24BA39574(&v3);
  PB::Base::~Base((PB::Base *)a1);
  return MEMORY[0x24BD2C8A8]();
}

uint64_t sub_24BA4C200(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(uint64_t **)(a1 + 8);
  v6 = *(uint64_t **)(a1 + 16);
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, this, "metrics");
  }
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_24BA4C26C(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t result;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t **)(a1 + 8);
    while (1)
    {
      v9 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        if (v11++ > 8)
          goto LABEL_20;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v12 >> 3) == 1)
      {
        sub_24BA4C40C(v8);
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 16) - 8);
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v21 + 16))(v21, this) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
        result = PB::Reader::skip(this);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)this + 1);
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || *((_BYTE *)this + 24))
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)this + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_21;
      v16 += 7;
      v2 = v18;
      if (v17++ >= 9)
      {
LABEL_20:
        v12 = 0;
        goto LABEL_21;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_24BA4C40C(uint64_t **a1)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t *v12;
  char *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  int64x2_t v17;
  uint64_t *v18;
  uint64_t v19;
  int64x2_t v20;
  char *v21;
  _QWORD *v22;

  v2 = operator new();
  sub_24BA56E6C(v2);
  result = (uint64_t)(a1 + 2);
  v4 = (unint64_t)a1[2];
  v5 = a1[1];
  if ((unint64_t)v5 >= v4)
  {
    v7 = v5 - *a1;
    if ((unint64_t)(v7 + 1) >> 61)
      sub_24BA39774();
    v8 = v4 - (_QWORD)*a1;
    v9 = v8 >> 2;
    if (v8 >> 2 <= (unint64_t)(v7 + 1))
      v9 = v7 + 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v10 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    v22 = a1 + 2;
    if (v10)
      v11 = (char *)sub_24BA39788(result, v10);
    else
      v11 = 0;
    v12 = (uint64_t *)&v11[8 * v7];
    v13 = &v11[8 * v10];
    v21 = v13;
    *v12 = v2;
    v6 = v12 + 1;
    v20.i64[1] = (uint64_t)(v12 + 1);
    v15 = *a1;
    v14 = a1[1];
    if (v14 == *a1)
    {
      v17 = vdupq_n_s64((unint64_t)v14);
    }
    else
    {
      do
      {
        v16 = *--v14;
        *v14 = 0;
        *--v12 = v16;
      }
      while (v14 != v15);
      v17 = *(int64x2_t *)a1;
      v6 = (uint64_t *)v20.i64[1];
      v13 = v21;
    }
    *a1 = v12;
    a1[1] = v6;
    v20 = v17;
    v18 = a1[2];
    a1[2] = (uint64_t *)v13;
    v21 = (char *)v18;
    v19 = v17.i64[0];
    result = sub_24BA36E48((uint64_t)&v19);
  }
  else
  {
    *v5 = v2;
    v6 = v5 + 1;
  }
  a1[1] = v6;
  return result;
}

void sub_24BA4C538(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA4C554(uint64_t result, PB::Writer *this)
{
  const PB::Base **v2;
  const PB::Base **i;
  const PB::Base *v5;

  v2 = *(const PB::Base ***)(result + 8);
  for (i = *(const PB::Base ***)(result + 16); v2 != i; result = PB::Writer::writeSubmessage(this, v5))
    v5 = *v2++;
  return result;
}

uint64_t LazyMetadataLoader::LazyMetadataLoader(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v8;

  v4 = *a3;
  *a3 = 0;
  v8 = v4;
  v5 = WISMetadataLoader::WISMetadataLoader(a1 + 8, a2, &v8);
  v6 = v8;
  v8 = 0;
  if (v6)
    (*(void (**)(uint64_t, double))(*(_QWORD *)v6 + 8))(v6, v5);
  *(_QWORD *)a1 = &off_251CCCFE8;
  *(_DWORD *)(a1 + 88) = 30000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 96) = a1 + 104;
  *(_QWORD *)(a1 + 80) = 0;
  return a1;
}

void sub_24BA4C61C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  _Unwind_Resume(exception_object);
}

void LazyMetadataLoader::~LazyMetadataLoader(LazyMetadataLoader *this)
{
  uint64_t v2;

  *(_QWORD *)this = &off_251CCCFE8;
  sub_24BA4CD38((uint64_t)this + 96, *((_QWORD **)this + 13));
  sub_24BA387C4((uint64_t)this + 40);
  sub_24BA3B304((uint64_t)this + 24);
  v2 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
}

{
  LazyMetadataLoader::~LazyMetadataLoader(this);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t LazyMetadataLoader::hasMetadataForComponent(LazyMetadataLoader *this, unsigned int a2)
{
  uint64_t v2;
  _DWORD *v3;
  unsigned int v4;
  BOOL v5;
  uint64_t *v6;

  v2 = *((_QWORD *)this + 13);
  if (!v2)
    return 0;
  v3 = (_DWORD *)((char *)this + 104);
  do
  {
    v4 = *(_DWORD *)(v2 + 32);
    v5 = v4 >= a2;
    if (v4 >= a2)
      v6 = (uint64_t *)v2;
    else
      v6 = (uint64_t *)(v2 + 8);
    if (v5)
      v3 = (_DWORD *)v2;
    v2 = *v6;
  }
  while (*v6);
  if (v3 != (_DWORD *)((char *)this + 104) && v3[8] <= a2)
    return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 72))(*((_QWORD *)this + 1));
  else
    return 0;
}

uint64_t LazyMetadataLoader::baseMetadataIsValid(LazyMetadataLoader *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 72))(*((_QWORD *)this + 1));
}

uint64_t LazyMetadataLoader::setBaseMetadata(LazyMetadataLoader *this, void *a2)
{
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  result = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 72))(*((_QWORD *)this + 1));
  if ((result & 1) == 0)
  {
    v5 = (_QWORD *)operator new();
    sub_24BA4CD84(v5, a2);
    if (v5[2])
    {
      v6 = *((_QWORD *)this + 1);
      v16[0] = v5;
      v16[1] = 0;
      result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v6 + 56))(v6, v16);
      v5 = (_QWORD *)v16[0];
      v16[0] = 0;
      if (!v5)
        return result;
    }
    else
    {
      v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v7)
        sub_24BA59E28(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    v15 = sub_24BA4CE28((uint64_t)v5);
    return MEMORY[0x24BD2C8A8](v15, 0x10A0C404E934A1DLL);
  }
  return result;
}

void sub_24BA4C800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_24BA4CDEC(&a9, 0);
  sub_24BA4CDEC(&a10, 0);
  _Unwind_Resume(a1);
}

uint64_t LazyMetadataLoader::shouldRequestMetadata(LazyMetadataLoader *this, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = *((_QWORD *)this + 10);
  if (v2)
  {
    v3 = a2 >= v2;
    v4 = a2 - v2;
    if (v4 == 0 || !v3 || v4 <= *((unsigned int *)this + 22))
      return 0;
  }
  *((_QWORD *)this + 10) = a2;
  return 1;
}

uint64_t LazyMetadataLoader::setMetadataForComponent(uint64_t **this, void *a2, unsigned int a3)
{
  uint64_t result;
  _QWORD *v6;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t **v11;
  unsigned int v12;
  unsigned int *v13;

  v12 = a3;
  result = LazyMetadataLoader::hasMetadataForComponent((LazyMetadataLoader *)this, a3);
  if ((result & 1) == 0)
  {
    v6 = (_QWORD *)operator new();
    sub_24BA4CD84(v6, a2);
    v7 = this + 12;
    v13 = &v12;
    v8 = sub_24BA4CE78(this + 12, &v12, (uint64_t)&unk_24BA5E9E4, &v13);
    sub_24BA4CDEC((uint64_t *)v8 + 5, (uint64_t)v6);
    v13 = &v12;
    result = (uint64_t)sub_24BA4CE78(this + 12, &v12, (uint64_t)&unk_24BA5E9E4, &v13);
    if (*(_QWORD *)(result + 40))
    {
      v13 = &v12;
      result = (uint64_t)sub_24BA4CE78(this + 12, &v12, (uint64_t)&unk_24BA5E9E4, &v13);
      if (*(_QWORD *)(*(_QWORD *)(result + 40) + 16))
      {
        v9 = this[1];
        v13 = &v12;
        v10 = sub_24BA4CE78(v7, &v12, (uint64_t)&unk_24BA5E9E4, &v13)[5][1];
        v13 = &v12;
        v11 = sub_24BA4CE78(v7, &v12, (uint64_t)&unk_24BA5E9E4, &v13);
        return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*v9 + 64))(v9, v10, v11[5][2]);
      }
    }
  }
  return result;
}

void sub_24BA4C9D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA4CDEC((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

uint64_t sCreateLazyMetadataLoaderDelegate@<X0>(uint64_t **a1@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  v2 = (uint64_t *)operator new();
  BestChoiceMetadataLoaderDelegate::BestChoiceMetadataLoaderDelegate((BestChoiceMetadataLoaderDelegate *)v2);
  *v2 = (uint64_t)&off_251CCD008;
  v2[16] = 0;
  result = sub_24BA4CDEC(v2 + 16, 0);
  *a1 = v2;
  return result;
}

void sub_24BA4CA6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD2C8A8](v1, 0x10A1C405745F166);
  _Unwind_Resume(a1);
}

void LazyRemoteMetadataLoaderDelegate::LazyRemoteMetadataLoaderDelegate(LazyRemoteMetadataLoaderDelegate *this)
{
  _QWORD *v1;

  BestChoiceMetadataLoaderDelegate::BestChoiceMetadataLoaderDelegate(this);
  *v1 = &off_251CCD008;
  v1[16] = 0;
  sub_24BA4CDEC(v1 + 16, 0);
}

{
  _QWORD *v1;

  BestChoiceMetadataLoaderDelegate::BestChoiceMetadataLoaderDelegate(this);
  *v1 = &off_251CCD008;
  v1[16] = 0;
  sub_24BA4CDEC(v1 + 16, 0);
}

void LazyRemoteMetadataLoaderDelegate::~LazyRemoteMetadataLoaderDelegate(LazyRemoteMetadataLoaderDelegate *this)
{
  *(_QWORD *)this = &off_251CCD008;
  sub_24BA4CDEC((uint64_t *)this + 16, 0);
  BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(this);
}

{
  *(_QWORD *)this = &off_251CCD008;
  sub_24BA4CDEC((uint64_t *)this + 16, 0);
  BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(this);
}

{
  *(_QWORD *)this = &off_251CCD008;
  sub_24BA4CDEC((uint64_t *)this + 16, 0);
  BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(this);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t LazyRemoteMetadataLoaderDelegate::setBaseMetadata(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *a2 = 0;
  sub_24BA4CDEC(a1 + 16, v3);
  return (*(uint64_t (**)(uint64_t *))(*a1 + 96))(a1);
}

uint64_t LazyRemoteMetadataLoaderDelegate::getMetadataBinary(LazyRemoteMetadataLoaderDelegate *this)
{
  uint64_t v1;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *((_QWORD *)this + 16);
  if (v1)
    return *(_QWORD *)(v1 + 8);
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v3)
    sub_24BA59E60(v3, v4, v5, v6, v7, v8, v9, v10);
  return 0;
}

_QWORD *LazyRemoteMetadataLoaderDelegate::ensureCacheReady(_QWORD *this)
{
  if (!this[8])
    return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 96))(this);
  return this;
}

uint64_t LazyRemoteMetadataLoaderDelegate::setMetadataForComponent(LazyRemoteMetadataLoaderDelegate *this, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  sub_24BA55920(a2, a3, (uint64_t)&v6);
  v4 = 128;
  if (v6 > *((_DWORD *)this + 30))
    v4 = 120;
  (*(void (**)(LazyRemoteMetadataLoaderDelegate *))(*(_QWORD *)this + v4))(this);
  sub_24BA4CCF0((uint64_t)&v8);
  return sub_24BA4CCF0((uint64_t)&v7);
}

void sub_24BA4CCC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_24BA4CCF0(v1 + 48);
  sub_24BA4CCF0(v1 + 8);
  _Unwind_Resume(a1);
}

BOOL LazyRemoteMetadataLoaderDelegate::baseMetadataIsValidInDelegate(LazyRemoteMetadataLoaderDelegate *this)
{
  return *((_QWORD *)this + 16) != 0;
}

uint64_t sub_24BA4CCF0(uint64_t a1)
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

void sub_24BA4CD38(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_24BA4CD38(a1, *a2);
    sub_24BA4CD38(a1, a2[1]);
    sub_24BA4CDEC(a2 + 5, 0);
    operator delete(a2);
  }
}

_QWORD *sub_24BA4CD84(_QWORD *a1, void *a2)
{
  void **v3;

  *a1 = 0;
  a1[1] = 0;
  v3 = (void **)(a1 + 1);
  a1[2] = 0;
  if (a2 && MEMORY[0x24BD2CA88](a2) == MEMORY[0x24BDACFE8])
    a1[2] = xpc_shmem_map(a2, v3);
  return a1;
}

uint64_t sub_24BA4CDEC(uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    sub_24BA4CE28(result);
    JUMPOUT(0x24BD2C8A8);
  }
  return result;
}

uint64_t sub_24BA4CE28(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 8);
  if (v2 != (void *)-1)
  {
    munmap(v2, *(_QWORD *)(a1 + 16));
    *(_QWORD *)(a1 + 8) = -1;
  }
  if (*(_QWORD *)a1)
  {
    fclose(*(FILE **)a1);
    *(_QWORD *)a1 = 0;
  }
  return a1;
}

uint64_t **sub_24BA4CE78(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  _DWORD *v11;

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
        v10 = *((_DWORD *)v6 + 8);
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
    v11[8] = **a4;
    *((_QWORD *)v11 + 5) = 0;
    sub_24BA42E8C(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

void sub_24BA4CF38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_24BA4CF48(uint64_t a1, uint64_t a2)
{
  uint64_t **v3;
  uint64_t result;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  v3 = (uint64_t **)(a1 + 8);
  result = sub_24BA4D374((char **)(a1 + 8), ((uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 3)+ ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 3));
  v5 = *(uint64_t **)(a2 + 8);
  v6 = *(uint64_t **)(a2 + 16);
  if (v5 != v6)
  {
    do
    {
      v7 = *v5++;
      result = sub_24BA4CFDC(v3, v7);
    }
    while (v5 != v6);
    v5 = *(uint64_t **)(a2 + 8);
    v8 = *(uint64_t **)(a2 + 16);
    while (v8 != v5)
    {
      v9 = *--v8;
      result = v9;
      *v8 = 0;
      if (v9)
        result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    }
  }
  *(_QWORD *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_24BA4CFDC(uint64_t **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t *v14;
  char *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  int64x2_t v19;
  uint64_t *v20;
  uint64_t v21;
  int64x2_t v22;
  char *v23;
  _QWORD *v24;

  v4 = operator new();
  sub_24BA56F78(v4, a2);
  result = (uint64_t)(a1 + 2);
  v6 = (unint64_t)a1[2];
  v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    v9 = v7 - *a1;
    if ((unint64_t)(v9 + 1) >> 61)
      sub_24BA39774();
    v10 = v6 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v24 = a1 + 2;
    if (v12)
      v13 = (char *)sub_24BA39788(result, v12);
    else
      v13 = 0;
    v14 = (uint64_t *)&v13[8 * v9];
    v15 = &v13[8 * v12];
    v23 = v15;
    *v14 = v4;
    v8 = v14 + 1;
    v22.i64[1] = (uint64_t)(v14 + 1);
    v17 = *a1;
    v16 = a1[1];
    if (v16 == *a1)
    {
      v19 = vdupq_n_s64((unint64_t)v16);
    }
    else
    {
      do
      {
        v18 = *--v16;
        *v16 = 0;
        *--v14 = v18;
      }
      while (v16 != v17);
      v19 = *(int64x2_t *)a1;
      v8 = (uint64_t *)v22.i64[1];
      v15 = v23;
    }
    *a1 = v14;
    a1[1] = v8;
    v22 = v19;
    v20 = a1[2];
    a1[2] = (uint64_t *)v15;
    v23 = (char *)v20;
    v21 = v19.i64[0];
    result = sub_24BA36E48((uint64_t)&v21);
  }
  else
  {
    *v7 = v4;
    v8 = v7 + 1;
  }
  a1[1] = v8;
  return result;
}

void sub_24BA4D110(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA4D12C(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  unsigned __int8 *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  unsigned __int8 **v21;
  BOOL v22;
  uint64_t v23;
  unsigned __int8 *v24;
  unsigned __int8 *v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint64_t v30;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(uint64_t **)(a1 + 16);
  v4 = 126 - 2 * __clz(((uint64_t)v3 - v2) >> 3);
  if (v3 == (uint64_t *)v2)
    v5 = 0;
  else
    v5 = v4;
  result = sub_24BA4D42C(v2, v3, v5, 1);
  v8 = *(uint64_t **)(a1 + 8);
  v9 = *(uint64_t **)(a1 + 16);
  if (v8 == v9)
  {
    v9 = *(uint64_t **)(a1 + 8);
    goto LABEL_57;
  }
  v10 = v8 + 1;
  if (v8 + 1 == v9)
    goto LABEL_55;
  v11 = *(_QWORD *)(*v8 + 8);
  while (1)
  {
    v12 = v8;
    v8 = v10;
    v13 = v11;
    v11 = *(_QWORD *)(v12[1] + 8);
    if (!v13 || !v11)
    {
      if (!(v13 | v11))
        break;
      goto LABEL_24;
    }
    v14 = *(unsigned __int8 *)(v13 + 23);
    if ((v14 & 0x80u) == 0)
      v15 = *(unsigned __int8 *)(v13 + 23);
    else
      v15 = *(_QWORD *)(v13 + 8);
    v16 = *(unsigned __int8 *)(v11 + 23);
    v17 = (char)v16;
    if ((v16 & 0x80u) != 0)
      v16 = *(_QWORD *)(v11 + 8);
    if (v15 == v16)
    {
      if (v17 >= 0)
        v7 = *(unsigned __int8 **)(v12[1] + 8);
      else
        v7 = *(unsigned __int8 **)v11;
      if ((v14 & 0x80) == 0)
      {
        if (!*(_BYTE *)(v13 + 23))
          break;
        while (*(unsigned __int8 *)v13 == *v7)
        {
          ++v13;
          ++v7;
          if (!--v14)
            goto LABEL_27;
        }
        goto LABEL_24;
      }
      result = memcmp(*(const void **)v13, v7, *(_QWORD *)(v13 + 8));
      if (!(_DWORD)result)
        break;
    }
LABEL_24:
    v10 = v8 + 1;
    if (v8 + 1 == v9)
      goto LABEL_55;
  }
LABEL_27:
  if (v12 == v9)
  {
LABEL_55:
    v8 = v9;
    goto LABEL_57;
  }
  v18 = v12 + 2;
  if (v12 + 2 == v9)
    goto LABEL_54;
  while (2)
  {
    v19 = *v18;
    v20 = *(_QWORD *)(*v12 + 8);
    v21 = *(unsigned __int8 ***)(*v18 + 8);
    if (v20)
      v22 = v21 == 0;
    else
      v22 = 1;
    if (v22)
    {
      if (v20 | (unint64_t)v21)
        goto LABEL_51;
    }
    else
    {
      v23 = *(unsigned __int8 *)(v20 + 23);
      if ((v23 & 0x80u) == 0)
        v24 = (unsigned __int8 *)*(unsigned __int8 *)(v20 + 23);
      else
        v24 = *(unsigned __int8 **)(v20 + 8);
      v25 = (unsigned __int8 *)*((unsigned __int8 *)v21 + 23);
      v26 = (char)v25;
      if ((char)v25 < 0)
        v25 = v21[1];
      if (v24 != v25)
        goto LABEL_51;
      if (v26 >= 0)
        v7 = *(unsigned __int8 **)(*v18 + 8);
      else
        v7 = *v21;
      if ((v23 & 0x80) != 0)
      {
        result = memcmp(*(const void **)v20, v7, *(_QWORD *)(v20 + 8));
        if ((_DWORD)result)
          goto LABEL_51;
      }
      else if (*(_BYTE *)(v20 + 23))
      {
        while (*(unsigned __int8 *)v20 == *v7)
        {
          ++v20;
          ++v7;
          if (!--v23)
            goto LABEL_52;
        }
LABEL_51:
        v27 = v12[1];
        ++v12;
        result = sub_24BA56F7C(v27, v19);
      }
    }
LABEL_52:
    if (++v18 != v9)
      continue;
    break;
  }
  v9 = *(uint64_t **)(a1 + 16);
LABEL_54:
  v8 = v9;
  v9 = v12 + 1;
LABEL_57:
  if ((char *)v8 - (char *)v9 >= 1)
  {
    v28 = (unint64_t)((char *)v8 - (char *)v9) >> 3;
    v29 = v8 - 1;
    v30 = v28 + 1;
    do
    {
      result = *v29;
      *v29 = 0;
      if (result)
        result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)result + 8))(result, v7);
      *(_QWORD *)(a1 + 16) = v29--;
      --v30;
    }
    while (v30 > 1);
  }
  return result;
}

uint64_t sub_24BA4D374(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int64x2_t v12;
  char *v13;
  uint64_t v14;
  int64x2_t v15;
  char *v16;
  uint64_t v17;

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61)
      sub_24BA39774();
    v5 = a1[1] - *a1;
    v17 = result;
    v6 = (char *)sub_24BA39788(result, a2);
    v9 = *a1;
    v8 = a1[1];
    if (v8 == *a1)
    {
      v12 = vdupq_n_s64((unint64_t)v8);
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *(_QWORD *)v8 = 0;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v15 = v12;
    v13 = a1[2];
    a1[2] = &v6[8 * v7];
    v16 = v13;
    v14 = v12.i64[0];
    return sub_24BA36E48((uint64_t)&v14);
  }
  return result;
}

uint64_t sub_24BA4D42C(uint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  uint64_t *v6;
  uint64_t *i;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  size_t v18;
  const void *v19;
  size_t v20;
  const void *v21;
  size_t v22;
  int v23;
  BOOL v24;
  uint64_t *v25;
  uint64_t v26;
  const void **v27;
  const void **v28;
  uint64_t *v29;
  int v30;
  int v31;
  size_t v32;
  const void *v33;
  size_t v34;
  const void *v35;
  size_t v36;
  int v37;
  _BOOL4 v38;
  uint64_t *v39;
  uint64_t *k;
  uint64_t v41;
  int v42;
  int v43;
  size_t v44;
  const void *v45;
  size_t v46;
  const void *v47;
  size_t v48;
  int v49;
  BOOL v50;
  const void **v51;
  uint64_t v52;
  int v53;
  int v54;
  size_t v55;
  const void *v56;
  size_t v57;
  const void *v58;
  size_t v59;
  int v60;
  BOOL v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  const void **v65;
  const void **m;
  int v67;
  int v68;
  size_t v69;
  const void *v70;
  size_t v71;
  const void *v72;
  size_t v73;
  int v74;
  _BOOL4 v75;
  uint64_t v76;
  uint64_t v77;
  const void **v78;
  int v79;
  int v80;
  size_t v81;
  const void *v82;
  size_t v83;
  const void *v84;
  size_t v85;
  int v86;
  BOOL v87;
  uint64_t *v88;
  char v89;
  const void **v90;
  uint64_t v91;
  int v92;
  int v93;
  size_t v94;
  const void *v95;
  size_t v96;
  const void *v97;
  size_t v98;
  int v99;
  _BOOL4 v100;
  uint64_t *v101;
  const void **v102;
  int v103;
  int v104;
  size_t v105;
  const void *v106;
  size_t v107;
  const void *v108;
  size_t v109;
  int v110;
  BOOL v111;
  uint64_t *j;
  uint64_t v113;
  int v114;
  int v115;
  size_t v116;
  const void *v117;
  size_t v118;
  const void *v119;
  size_t v120;
  int v121;
  _BOOL4 v122;
  uint64_t v123;
  uint64_t v124;
  const void **v125;
  uint64_t v126;
  int v127;
  int v128;
  size_t v129;
  const void *v130;
  size_t v131;
  const void *v132;
  size_t v133;
  int v134;
  BOOL v135;
  uint64_t v136;
  const void **v137;
  int v138;
  int v139;
  size_t v140;
  const void *v141;
  size_t v142;
  const void *v143;
  size_t v144;
  int v145;
  _BOOL4 v146;
  uint64_t *v147;
  uint64_t v148;
  int v149;
  int v150;
  size_t v151;
  const void *v152;
  size_t v153;
  const void *v154;
  size_t v155;
  int v156;
  BOOL v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  int v162;
  int v163;
  unint64_t v164;
  const void *v165;
  unint64_t v166;
  const void *v167;
  size_t v168;
  _BOOL4 v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  int v178;
  size_t v179;
  const void *v180;
  size_t v181;
  const void *v182;
  size_t v183;
  BOOL v184;
  _BOOL4 v185;
  uint64_t *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  int v190;
  int v191;
  size_t v192;
  const void *v193;
  size_t v194;
  const void *v195;
  size_t v196;
  int v197;
  _BOOL4 v198;
  int64_t v199;
  int64_t v200;
  uint64_t v201;
  uint64_t *v202;
  uint64_t *v203;
  uint64_t v204;
  uint64_t v205;
  int v206;
  int v207;
  size_t v208;
  const void *v209;
  size_t v210;
  const void *v211;
  size_t v212;
  int v213;
  _BOOL4 v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  int v218;
  int v219;
  size_t v220;
  const void *v221;
  size_t v222;
  const void *v223;
  size_t v224;
  int v225;
  BOOL v226;
  uint64_t *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t *v230;
  uint64_t v231;
  uint64_t v232;
  int v233;
  int v234;
  size_t v235;
  const void *v236;
  size_t v237;
  const void *v238;
  size_t v239;
  int v240;
  _BOOL4 v241;
  uint64_t v242;
  uint64_t v243;
  int v244;
  int v245;
  size_t v246;
  const void *v247;
  size_t v248;
  const void *v249;
  size_t v250;
  int v251;
  BOOL v252;
  uint64_t v253;
  uint64_t *v254;
  uint64_t *v255;
  uint64_t *v256;
  uint64_t v257;
  uint64_t *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t *v261;
  uint64_t v262;
  uint64_t v263;
  int v264;
  int v265;
  size_t v266;
  const void *v267;
  size_t v268;
  const void *v269;
  size_t v270;
  int v271;
  _BOOL4 v272;
  uint64_t *v273;
  uint64_t v274;
  unint64_t v275;
  unint64_t v276;
  uint64_t *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  int v281;
  int v282;
  size_t v283;
  const void *v284;
  size_t v285;
  const void *v286;
  size_t v287;
  int v288;
  _BOOL4 v289;
  uint64_t *v290;
  unint64_t v291;
  uint64_t v292;
  uint64_t v293;
  int v294;
  int v295;
  size_t v296;
  const void *v297;
  size_t v298;
  const void *v299;
  size_t v300;
  int v301;
  _BOOL4 v302;
  BOOL v303;
  uint64_t *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  int v308;
  int v309;
  size_t v310;
  const void *v311;
  size_t v312;
  const void *v313;
  size_t v314;
  _BOOL4 v315;
  const void **v316;
  uint64_t *v317;
  uint64_t v318;
  uint64_t v319;
  const void **v320;
  int v321;
  int v322;
  size_t v323;
  const void *v324;
  size_t v325;
  const void *v326;
  size_t v327;
  int v328;
  _BOOL4 v329;
  uint64_t *v330;
  uint64_t *v331;
  uint64_t *v333;
  uint64_t *v334;
  int64_t v335;
  uint64_t *v336;
  _BYTE v337[24];
  char v338[8];
  const void **v339;

  v6 = (uint64_t *)result;
LABEL_2:
  v333 = a2;
  v334 = a2 - 1;
  v330 = a2 - 3;
  v331 = a2 - 2;
  i = v6;
  while (2)
  {
    v8 = i;
    v9 = (char *)a2 - (char *)i;
    v10 = a2 - i;
    switch(v10)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v158 = *(a2 - 1);
        v159 = *(_QWORD *)(v158 + 8);
        if (v159)
        {
          v160 = *v8;
          v161 = *(_QWORD *)(*v8 + 8);
          if (!v161)
            return sub_24BA56EE4(v160, v158);
          v162 = *(char *)(v161 + 23);
          v163 = *(char *)(v159 + 23);
          v164 = v163 >= 0 ? *(unsigned __int8 *)(v159 + 23) : *(_QWORD *)(v159 + 8);
          v165 = v163 >= 0 ? *(const void **)(v158 + 8) : *(const void **)v159;
          v166 = v162 >= 0 ? *(unsigned __int8 *)(v161 + 23) : *(_QWORD *)(v161 + 8);
          v167 = v162 >= 0 ? *(const void **)(*v8 + 8) : *(const void **)v161;
          v168 = v166 >= v164 ? v164 : v166;
          result = memcmp(v165, v167, v168);
          v169 = v164 < v166;
          if ((_DWORD)result)
            v169 = (int)result < 0;
          if (v169)
            return sub_24BA56EE4(v160, v158);
        }
        return result;
      case 3:
        return sub_24BA4E754((uint64_t)v8, v8 + 1, v334);
      case 4:
        return sub_24BA4ED00(v8, v8 + 1, v8 + 2, v334);
      case 5:
        return sub_24BA4E508(v8, v8 + 1, v8 + 2, v8 + 3, v334);
      default:
        v336 = v8;
        if (v9 <= 191)
        {
          if ((a4 & 1) != 0)
          {
            if (v8 != a2)
            {
              v170 = v8 + 1;
              if (v8 + 1 != a2)
              {
                v171 = 0;
                v172 = v8;
                do
                {
                  v173 = v172;
                  v172 = v170;
                  v174 = v173[1];
                  v175 = *(_QWORD *)(v174 + 8);
                  if (v175)
                  {
                    v176 = *(_QWORD *)(*v173 + 8);
                    if (!v176)
                      goto LABEL_342;
                    v177 = *(char *)(v176 + 23);
                    v178 = *(char *)(v175 + 23);
                    if (v178 >= 0)
                      v179 = *(unsigned __int8 *)(v175 + 23);
                    else
                      v179 = *(_QWORD *)(v175 + 8);
                    if (v178 >= 0)
                      v180 = *(const void **)(v174 + 8);
                    else
                      v180 = *(const void **)v175;
                    if (v177 >= 0)
                      v181 = *(unsigned __int8 *)(v176 + 23);
                    else
                      v181 = *(_QWORD *)(v176 + 8);
                    if (v177 >= 0)
                      v182 = *(const void **)(*v173 + 8);
                    else
                      v182 = *(const void **)v176;
                    if (v181 >= v179)
                      v183 = v179;
                    else
                      v183 = v181;
                    result = memcmp(v180, v182, v183);
                    v184 = v179 >= v181;
                    v8 = v336;
                    a2 = v333;
                    v185 = !v184;
                    if ((_DWORD)result)
                      v185 = (int)result < 0;
                    if (v185)
                    {
LABEL_342:
                      sub_24BA56F78(v338, v174);
                      sub_24BA56F7C(v173[1], *v173);
                      v186 = v8;
                      if (v173 != v8)
                      {
                        v187 = v171;
                        while (1)
                        {
                          v186 = (uint64_t *)((char *)v336 + v187);
                          if (!v339)
                            break;
                          v188 = *(v186 - 1);
                          v189 = *(_QWORD *)(v188 + 8);
                          if (v189)
                          {
                            v190 = *(char *)(v189 + 23);
                            v191 = *((char *)v339 + 23);
                            if (v191 >= 0)
                              v192 = *((unsigned __int8 *)v339 + 23);
                            else
                              v192 = (size_t)v339[1];
                            if (v191 >= 0)
                              v193 = v339;
                            else
                              v193 = *v339;
                            if (v190 >= 0)
                              v194 = *(unsigned __int8 *)(v189 + 23);
                            else
                              v194 = *(_QWORD *)(v189 + 8);
                            if (v190 >= 0)
                              v195 = *(const void **)(v188 + 8);
                            else
                              v195 = *(const void **)v189;
                            if (v194 >= v192)
                              v196 = v192;
                            else
                              v196 = v194;
                            v197 = memcmp(v193, v195, v196);
                            v198 = v192 < v194;
                            if (v197)
                              v198 = v197 < 0;
                            if (!v198)
                            {
                              v186 = v173;
                              break;
                            }
                          }
                          --v173;
                          sub_24BA56F7C(*v186, v188);
                          v187 -= 8;
                          if (!v187)
                          {
                            v8 = v336;
                            v186 = v336;
                            a2 = v333;
                            goto LABEL_368;
                          }
                        }
                        a2 = v333;
                        v8 = v336;
                      }
LABEL_368:
                      sub_24BA56F7C(*v186, (uint64_t)v338);
                      result = sub_24BA56EBC((PB::Base *)v338);
                    }
                  }
                  v170 = v172 + 1;
                  v171 += 8;
                }
                while (v172 + 1 != a2);
              }
            }
          }
          else if (v8 != a2)
          {
            while (v8 + 1 != a2)
            {
              v304 = v8++;
              v305 = v304[1];
              v306 = *(_QWORD *)(v305 + 8);
              if (v306)
              {
                v307 = *(_QWORD *)(*v304 + 8);
                if (!v307)
                  goto LABEL_561;
                v308 = *(char *)(v307 + 23);
                v309 = *(char *)(v306 + 23);
                if (v309 >= 0)
                  v310 = *(unsigned __int8 *)(v306 + 23);
                else
                  v310 = *(_QWORD *)(v306 + 8);
                if (v309 >= 0)
                  v311 = *(const void **)(v305 + 8);
                else
                  v311 = *(const void **)v306;
                if (v308 >= 0)
                  v312 = *(unsigned __int8 *)(v307 + 23);
                else
                  v312 = *(_QWORD *)(v307 + 8);
                if (v308 >= 0)
                  v313 = *(const void **)(*v304 + 8);
                else
                  v313 = *(const void **)v307;
                if (v312 >= v310)
                  v314 = v310;
                else
                  v314 = v312;
                result = memcmp(v311, v313, v314);
                v315 = v310 < v312;
                if ((_DWORD)result)
                  v315 = (int)result < 0;
                if (v315)
                {
LABEL_561:
                  sub_24BA56F78(v338, v305);
                  sub_24BA56F7C(*v8, *v304);
                  v316 = v339;
                  if (v339)
                  {
                    v317 = v304;
                    while (1)
                    {
                      v319 = *--v317;
                      v318 = v319;
                      v320 = *(const void ***)(v319 + 8);
                      if (v320)
                      {
                        v321 = *((char *)v320 + 23);
                        v322 = *((char *)v316 + 23);
                        if (v322 >= 0)
                          v323 = *((unsigned __int8 *)v316 + 23);
                        else
                          v323 = (size_t)v316[1];
                        if (v322 >= 0)
                          v324 = v316;
                        else
                          v324 = *v316;
                        if (v321 >= 0)
                          v325 = *((unsigned __int8 *)v320 + 23);
                        else
                          v325 = (size_t)v320[1];
                        if (v321 >= 0)
                          v326 = v320;
                        else
                          v326 = *v320;
                        if (v325 >= v323)
                          v327 = v323;
                        else
                          v327 = v325;
                        v328 = memcmp(v324, v326, v327);
                        v329 = v323 < v325;
                        if (v328)
                          v329 = v328 < 0;
                        if (!v329)
                          break;
                      }
                      sub_24BA56F7C(*v304, v318);
                      v316 = v339;
                      v304 = v317;
                      if (!v339)
                        goto LABEL_585;
                    }
                  }
                  v317 = v304;
LABEL_585:
                  sub_24BA56F7C(*v317, (uint64_t)v338);
                  result = sub_24BA56EBC((PB::Base *)v338);
                }
              }
            }
          }
          return result;
        }
        if (!a3)
        {
          if (v8 != a2)
          {
            v199 = (unint64_t)(v10 - 2) >> 1;
            v335 = v199;
            do
            {
              v200 = v199;
              if (v335 >= v199)
              {
                v201 = (2 * v199) | 1;
                v202 = &v336[v201];
                if (2 * v199 + 2 < v10)
                {
                  v203 = v202 + 1;
                  v204 = *(_QWORD *)(*v202 + 8);
                  if (v204)
                  {
                    v205 = *(_QWORD *)(*v203 + 8);
                    if (!v205)
                      goto LABEL_395;
                    v206 = *(char *)(v205 + 23);
                    v207 = *(char *)(v204 + 23);
                    if (v207 >= 0)
                      v208 = *(unsigned __int8 *)(v204 + 23);
                    else
                      v208 = *(_QWORD *)(v204 + 8);
                    if (v207 >= 0)
                      v209 = *(const void **)(*v202 + 8);
                    else
                      v209 = *(const void **)v204;
                    if (v206 >= 0)
                      v210 = *(unsigned __int8 *)(v205 + 23);
                    else
                      v210 = *(_QWORD *)(v205 + 8);
                    if (v206 >= 0)
                      v211 = *(const void **)(*v203 + 8);
                    else
                      v211 = *(const void **)v205;
                    if (v210 >= v208)
                      v212 = v208;
                    else
                      v212 = v210;
                    v213 = memcmp(v209, v211, v212);
                    v214 = v208 < v210;
                    if (v213)
                      v214 = v213 < 0;
                    if (v214)
                    {
LABEL_395:
                      ++v202;
                      v201 = 2 * v200 + 2;
                    }
                  }
                }
                v215 = *(_QWORD *)(*v202 + 8);
                v216 = v336[v200];
                if (!v215)
                  goto LABEL_416;
                v217 = *(_QWORD *)(v216 + 8);
                if (v217)
                {
                  v218 = *(char *)(v217 + 23);
                  v219 = *(char *)(v215 + 23);
                  if (v219 >= 0)
                    v220 = *(unsigned __int8 *)(v215 + 23);
                  else
                    v220 = *(_QWORD *)(v215 + 8);
                  if (v219 >= 0)
                    v221 = *(const void **)(*v202 + 8);
                  else
                    v221 = *(const void **)v215;
                  if (v218 >= 0)
                    v222 = *(unsigned __int8 *)(v217 + 23);
                  else
                    v222 = *(_QWORD *)(v217 + 8);
                  if (v218 >= 0)
                    v223 = *(const void **)(v216 + 8);
                  else
                    v223 = *(const void **)v217;
                  if (v222 >= v220)
                    v224 = v220;
                  else
                    v224 = v222;
                  v225 = memcmp(v221, v223, v224);
                  v226 = v220 < v222;
                  if (v225)
                    v226 = v225 < 0;
                  if (!v226)
                  {
LABEL_416:
                    sub_24BA56F78(v338, v216);
                    sub_24BA56F7C(v336[v200], *v202);
                    if (v335 >= v201)
                    {
                      while (1)
                      {
                        v228 = 2 * v201;
                        v201 = (2 * v201) | 1;
                        v227 = &v336[v201];
                        v229 = v228 + 2;
                        if (v228 + 2 < v10)
                        {
                          v230 = v227 + 1;
                          v231 = *(_QWORD *)(*v227 + 8);
                          if (v231)
                          {
                            v232 = *(_QWORD *)(*v230 + 8);
                            if (!v232)
                              goto LABEL_439;
                            v233 = *(char *)(v232 + 23);
                            v234 = *(char *)(v231 + 23);
                            if (v234 >= 0)
                              v235 = *(unsigned __int8 *)(v231 + 23);
                            else
                              v235 = *(_QWORD *)(v231 + 8);
                            if (v234 >= 0)
                              v236 = *(const void **)(*v227 + 8);
                            else
                              v236 = *(const void **)v231;
                            if (v233 >= 0)
                              v237 = *(unsigned __int8 *)(v232 + 23);
                            else
                              v237 = *(_QWORD *)(v232 + 8);
                            if (v233 >= 0)
                              v238 = *(const void **)(*v230 + 8);
                            else
                              v238 = *(const void **)v232;
                            if (v237 >= v235)
                              v239 = v235;
                            else
                              v239 = v237;
                            v240 = memcmp(v236, v238, v239);
                            v241 = v235 < v237;
                            if (v240)
                              v241 = v240 < 0;
                            if (v241)
                            {
LABEL_439:
                              ++v227;
                              v201 = v229;
                            }
                          }
                        }
                        v242 = *v227;
                        v243 = *(_QWORD *)(*v227 + 8);
                        if (v243)
                        {
                          if (!v339)
                            break;
                          v244 = *((char *)v339 + 23);
                          v245 = *(char *)(v243 + 23);
                          if (v245 >= 0)
                            v246 = *(unsigned __int8 *)(v243 + 23);
                          else
                            v246 = *(_QWORD *)(v243 + 8);
                          if (v245 >= 0)
                            v247 = *(const void **)(*v227 + 8);
                          else
                            v247 = *(const void **)v243;
                          if (v244 >= 0)
                            v248 = *((unsigned __int8 *)v339 + 23);
                          else
                            v248 = (size_t)v339[1];
                          if (v244 >= 0)
                            v249 = v339;
                          else
                            v249 = *v339;
                          if (v248 >= v246)
                            v250 = v246;
                          else
                            v250 = v248;
                          v251 = memcmp(v247, v249, v250);
                          v252 = v246 < v248;
                          if (v251)
                            v252 = v251 < 0;
                          if (v252)
                            break;
                        }
                        sub_24BA56F7C(*v202, v242);
                        v202 = v227;
                        if (v335 < v201)
                          goto LABEL_461;
                      }
                    }
                    v227 = v202;
LABEL_461:
                    sub_24BA56F7C(*v227, (uint64_t)v338);
                    sub_24BA56EBC((PB::Base *)v338);
                  }
                }
              }
              v199 = v200 - 1;
            }
            while (v200);
            v253 = (unint64_t)v9 >> 3;
            v254 = v333;
            v255 = v336;
            do
            {
              v256 = v254;
              sub_24BA56F78(v337, *v255);
              v257 = 0;
              do
              {
                v258 = v255;
                v255 += v257 + 1;
                v259 = 2 * v257;
                v257 = (2 * v257) | 1;
                v260 = v259 + 2;
                if (v259 + 2 < v253)
                {
                  v261 = v255 + 1;
                  v262 = *(_QWORD *)(*v255 + 8);
                  if (v262)
                  {
                    v263 = *(_QWORD *)(*v261 + 8);
                    if (!v263)
                      goto LABEL_486;
                    v264 = *(char *)(v263 + 23);
                    v265 = *(char *)(v262 + 23);
                    if (v265 >= 0)
                      v266 = *(unsigned __int8 *)(v262 + 23);
                    else
                      v266 = *(_QWORD *)(v262 + 8);
                    if (v265 >= 0)
                      v267 = *(const void **)(*v255 + 8);
                    else
                      v267 = *(const void **)v262;
                    if (v264 >= 0)
                      v268 = *(unsigned __int8 *)(v263 + 23);
                    else
                      v268 = *(_QWORD *)(v263 + 8);
                    if (v264 >= 0)
                      v269 = *(const void **)(*v261 + 8);
                    else
                      v269 = *(const void **)v263;
                    if (v268 >= v266)
                      v270 = v266;
                    else
                      v270 = v268;
                    v271 = memcmp(v267, v269, v270);
                    v272 = v266 < v268;
                    if (v271)
                      v272 = v271 < 0;
                    if (v272)
                    {
LABEL_486:
                      ++v255;
                      v257 = v260;
                    }
                  }
                }
                sub_24BA56F7C(*v258, *v255);
              }
              while (v257 <= (uint64_t)((unint64_t)(v253 - 2) >> 1));
              v273 = v256 - 1;
              if (v255 == v273)
              {
                v254 = v273;
                sub_24BA56F7C(*v255, (uint64_t)v337);
              }
              else
              {
                sub_24BA56F7C(*v255, *v273);
                v254 = v273;
                sub_24BA56F7C(*v273, (uint64_t)v337);
                v274 = (char *)v255 - (char *)v336 + 8;
                if (v274 >= 9)
                {
                  v275 = ((unint64_t)v274 >> 3) - 2;
                  v276 = v275 >> 1;
                  v277 = &v336[v275 >> 1];
                  v278 = *(_QWORD *)(*v277 + 8);
                  if (v278)
                  {
                    v279 = *v255;
                    v280 = *(_QWORD *)(*v255 + 8);
                    if (!v280)
                      goto LABEL_510;
                    v281 = *(char *)(v280 + 23);
                    v282 = *(char *)(v278 + 23);
                    if (v282 >= 0)
                      v283 = *(unsigned __int8 *)(v278 + 23);
                    else
                      v283 = *(_QWORD *)(v278 + 8);
                    if (v282 >= 0)
                      v284 = *(const void **)(*v277 + 8);
                    else
                      v284 = *(const void **)v278;
                    if (v281 >= 0)
                      v285 = *(unsigned __int8 *)(v280 + 23);
                    else
                      v285 = *(_QWORD *)(v280 + 8);
                    if (v281 >= 0)
                      v286 = *(const void **)(*v255 + 8);
                    else
                      v286 = *(const void **)v280;
                    if (v285 >= v283)
                      v287 = v283;
                    else
                      v287 = v285;
                    v288 = memcmp(v284, v286, v287);
                    v289 = v283 < v285;
                    if (v288)
                      v289 = v288 < 0;
                    if (v289)
                    {
LABEL_510:
                      sub_24BA56F78(v338, v279);
                      sub_24BA56F7C(*v255, *v277);
                      if (v275 >= 2)
                      {
                        while (1)
                        {
                          v291 = v276 - 1;
                          v276 = (v276 - 1) >> 1;
                          v290 = &v336[v276];
                          v292 = *v290;
                          v293 = *(_QWORD *)(*v290 + 8);
                          if (!v293)
                            break;
                          if (v339)
                          {
                            v294 = *((char *)v339 + 23);
                            v295 = *(char *)(v293 + 23);
                            if (v295 >= 0)
                              v296 = *(unsigned __int8 *)(v293 + 23);
                            else
                              v296 = *(_QWORD *)(v293 + 8);
                            if (v295 >= 0)
                              v297 = *(const void **)(*v290 + 8);
                            else
                              v297 = *(const void **)v293;
                            if (v294 >= 0)
                              v298 = *((unsigned __int8 *)v339 + 23);
                            else
                              v298 = (size_t)v339[1];
                            if (v294 >= 0)
                              v299 = v339;
                            else
                              v299 = *v339;
                            if (v298 >= v296)
                              v300 = v296;
                            else
                              v300 = v298;
                            v301 = memcmp(v297, v299, v300);
                            v302 = v296 < v298;
                            if (v301)
                              v302 = v301 < 0;
                            if (!v302)
                              break;
                          }
                          sub_24BA56F7C(*v277, v292);
                          v277 = &v336[v276];
                          if (v291 <= 1)
                            goto LABEL_512;
                        }
                      }
                      v290 = v277;
LABEL_512:
                      sub_24BA56F7C(*v290, (uint64_t)v338);
                      sub_24BA56EBC((PB::Base *)v338);
                    }
                  }
                }
              }
              result = sub_24BA56EBC((PB::Base *)v337);
              v303 = v253-- <= 2;
              v255 = v336;
            }
            while (!v303);
          }
          return result;
        }
        v11 = (unint64_t)v10 >> 1;
        v12 = &v8[(unint64_t)v10 >> 1];
        if ((unint64_t)v9 < 0x401)
        {
          sub_24BA4E754((uint64_t)v12, v8, v334);
        }
        else
        {
          sub_24BA4E754((uint64_t)v8, v12, v334);
          sub_24BA4E754((uint64_t)(v8 + 1), v12 - 1, v331);
          sub_24BA4E754((uint64_t)(v8 + 2), &v8[v11 + 1], v330);
          sub_24BA4E754((uint64_t)(v12 - 1), v12, &v8[v11 + 1]);
          sub_24BA56EE4(*v8, *v12);
        }
        --a3;
        v13 = *v8;
        if ((a4 & 1) == 0)
        {
          v14 = *(_QWORD *)(*(v8 - 1) + 8);
          if (!v14)
            goto LABEL_153;
          v15 = *(_QWORD *)(v13 + 8);
          if (v15)
          {
            v16 = *(char *)(v15 + 23);
            v17 = *(char *)(v14 + 23);
            if (v17 >= 0)
              v18 = *(unsigned __int8 *)(v14 + 23);
            else
              v18 = *(_QWORD *)(v14 + 8);
            if (v17 >= 0)
              v19 = *(const void **)(*(v8 - 1) + 8);
            else
              v19 = *(const void **)v14;
            if (v16 >= 0)
              v20 = *(unsigned __int8 *)(v15 + 23);
            else
              v20 = *(_QWORD *)(v15 + 8);
            if (v16 >= 0)
              v21 = *(const void **)(v13 + 8);
            else
              v21 = *(const void **)v15;
            if (v20 >= v18)
              v22 = v18;
            else
              v22 = v20;
            v23 = memcmp(v19, v21, v22);
            v24 = v18 < v20;
            if (v23)
              v24 = v23 < 0;
            if (!v24)
            {
LABEL_153:
              sub_24BA56F78(v338, v13);
              v90 = v339;
              if (!v339)
                goto LABEL_265;
              v91 = *(_QWORD *)(*v334 + 8);
              if (!v91)
                goto LABEL_173;
              v92 = *(char *)(v91 + 23);
              v93 = *((char *)v339 + 23);
              if (v93 >= 0)
                v94 = *((unsigned __int8 *)v339 + 23);
              else
                v94 = (size_t)v339[1];
              if (v93 >= 0)
                v95 = v339;
              else
                v95 = *v339;
              if (v92 >= 0)
                v96 = *(unsigned __int8 *)(v91 + 23);
              else
                v96 = *(_QWORD *)(v91 + 8);
              if (v92 >= 0)
                v97 = *(const void **)(*v334 + 8);
              else
                v97 = *(const void **)v91;
              if (v96 >= v94)
                v98 = v94;
              else
                v98 = v96;
              v99 = memcmp(v95, v97, v98);
              v100 = v94 < v96;
              if (v99)
                v100 = v99 < 0;
              if (v100)
              {
LABEL_173:
                v101 = v8 + 1;
                do
                {
                  i = v101;
                  v102 = *(const void ***)(*v101 + 8);
                  if (!v102)
                    break;
                  v103 = *((char *)v102 + 23);
                  v104 = *((char *)v90 + 23);
                  if (v104 >= 0)
                    v105 = *((unsigned __int8 *)v90 + 23);
                  else
                    v105 = (size_t)v90[1];
                  if (v104 >= 0)
                    v106 = v90;
                  else
                    v106 = *v90;
                  if (v103 >= 0)
                    v107 = *((unsigned __int8 *)v102 + 23);
                  else
                    v107 = (size_t)v102[1];
                  if (v103 >= 0)
                    v108 = v102;
                  else
                    v108 = *v102;
                  if (v107 >= v105)
                    v109 = v105;
                  else
                    v109 = v107;
                  v110 = memcmp(v106, v108, v109);
                  v111 = v110 < 0;
                  if (!v110)
                    v111 = v105 < v107;
                  v101 = i + 1;
                }
                while (!v111);
              }
              else
              {
LABEL_265:
                for (i = v8 + 1; i < a2; ++i)
                {
                  if (v90)
                  {
                    v148 = *(_QWORD *)(*i + 8);
                    if (!v148)
                      break;
                    v149 = *(char *)(v148 + 23);
                    v150 = *((char *)v90 + 23);
                    if (v150 >= 0)
                      v151 = *((unsigned __int8 *)v90 + 23);
                    else
                      v151 = (size_t)v90[1];
                    if (v150 >= 0)
                      v152 = v90;
                    else
                      v152 = *v90;
                    if (v149 >= 0)
                      v153 = *(unsigned __int8 *)(v148 + 23);
                    else
                      v153 = *(_QWORD *)(v148 + 8);
                    if (v149 >= 0)
                      v154 = *(const void **)(*i + 8);
                    else
                      v154 = *(const void **)v148;
                    if (v153 >= v151)
                      v155 = v151;
                    else
                      v155 = v153;
                    v156 = memcmp(v152, v154, v155);
                    v157 = v151 < v153;
                    if (v156)
                      v157 = v156 < 0;
                    if (v157)
                      break;
                  }
                }
              }
              if (i < a2)
                j = v334;
              else
                j = a2;
              if (i < a2 && v90)
              {
                for (j = v334; ; --j)
                {
                  v113 = *(_QWORD *)(*j + 8);
                  if (v113)
                  {
                    v114 = *(char *)(v113 + 23);
                    v115 = *((char *)v90 + 23);
                    if (v115 >= 0)
                      v116 = *((unsigned __int8 *)v90 + 23);
                    else
                      v116 = (size_t)v90[1];
                    if (v115 >= 0)
                      v117 = v90;
                    else
                      v117 = *v90;
                    if (v114 >= 0)
                      v118 = *(unsigned __int8 *)(v113 + 23);
                    else
                      v118 = *(_QWORD *)(v113 + 8);
                    if (v114 >= 0)
                      v119 = *(const void **)(*j + 8);
                    else
                      v119 = *(const void **)v113;
                    if (v118 >= v116)
                      v120 = v116;
                    else
                      v120 = v118;
                    v121 = memcmp(v117, v119, v120);
                    v122 = v116 < v118;
                    if (v121)
                      v122 = v121 < 0;
                    if (!v122)
                      break;
                  }
                }
              }
              if (i < j)
              {
                v123 = *i;
                v124 = *j;
                do
                {
                  sub_24BA56EE4(v123, v124);
                  v125 = v339;
                  do
                  {
                    do
                      ++i;
                    while (!v125);
                    v123 = *i;
                    v126 = *(_QWORD *)(*i + 8);
                    if (!v126)
                      break;
                    v127 = *(char *)(v126 + 23);
                    v128 = *((char *)v125 + 23);
                    if (v128 >= 0)
                      v129 = *((unsigned __int8 *)v125 + 23);
                    else
                      v129 = (size_t)v125[1];
                    if (v128 >= 0)
                      v130 = v125;
                    else
                      v130 = *v125;
                    if (v127 >= 0)
                      v131 = *(unsigned __int8 *)(v126 + 23);
                    else
                      v131 = *(_QWORD *)(v126 + 8);
                    if (v127 >= 0)
                      v132 = *(const void **)(*i + 8);
                    else
                      v132 = *(const void **)v126;
                    if (v131 >= v129)
                      v133 = v129;
                    else
                      v133 = v131;
                    v134 = memcmp(v130, v132, v133);
                    v135 = v129 < v131;
                    if (v134)
                      v135 = v134 < 0;
                  }
                  while (!v135);
                  do
                  {
                    do
                    {
                      v136 = *--j;
                      v124 = v136;
                      v137 = *(const void ***)(v136 + 8);
                    }
                    while (!v137);
                    v138 = *((char *)v137 + 23);
                    v139 = *((char *)v125 + 23);
                    if (v139 >= 0)
                      v140 = *((unsigned __int8 *)v125 + 23);
                    else
                      v140 = (size_t)v125[1];
                    if (v139 >= 0)
                      v141 = v125;
                    else
                      v141 = *v125;
                    if (v138 >= 0)
                      v142 = *((unsigned __int8 *)v137 + 23);
                    else
                      v142 = (size_t)v137[1];
                    if (v138 >= 0)
                      v143 = v137;
                    else
                      v143 = *v137;
                    if (v142 >= v140)
                      v144 = v140;
                    else
                      v144 = v142;
                    v145 = memcmp(v141, v143, v144);
                    v146 = v140 < v142;
                    if (v145)
                      v146 = v145 < 0;
                  }
                  while (v146);
                }
                while (i < j);
              }
              v147 = i - 1;
              if (i - 1 != v336)
                sub_24BA56F7C(*v336, *v147);
              sub_24BA56F7C(*v147, (uint64_t)v338);
              result = sub_24BA56EBC((PB::Base *)v338);
              a4 = 0;
              a2 = v333;
              continue;
            }
          }
        }
        sub_24BA56F78(v338, v13);
        v25 = v8 + 1;
        v26 = v8[1];
        v27 = *(const void ***)(v26 + 8);
        if (!v27)
          goto LABEL_76;
        v28 = v339;
        while (1)
        {
          v29 = v25;
          if (v28)
          {
            v30 = *((char *)v28 + 23);
            v31 = *((char *)v27 + 23);
            if (v31 >= 0)
              v32 = *((unsigned __int8 *)v27 + 23);
            else
              v32 = (size_t)v27[1];
            if (v31 >= 0)
              v33 = v27;
            else
              v33 = *v27;
            if (v30 >= 0)
              v34 = *((unsigned __int8 *)v28 + 23);
            else
              v34 = (size_t)v28[1];
            if (v30 >= 0)
              v35 = v28;
            else
              v35 = *v28;
            if (v34 >= v32)
              v36 = v32;
            else
              v36 = v34;
            v37 = memcmp(v33, v35, v36);
            v38 = v32 < v34;
            if (v37)
              v38 = v37 < 0;
            if (!v38)
              break;
          }
          v25 = v29 + 1;
          v26 = v29[1];
          v27 = *(const void ***)(v26 + 8);
          v39 = v29;
          if (!v27)
            goto LABEL_54;
        }
        v39 = v29 - 1;
        v25 = v29;
LABEL_54:
        k = v334;
        if (v39 == v8)
        {
LABEL_76:
          if (v25 < a2)
          {
            v51 = v339;
            for (k = v334; ; --k)
            {
              v52 = *(_QWORD *)(*k + 8);
              if (v52)
              {
                if (!v51)
                  goto LABEL_103;
                v53 = *((char *)v51 + 23);
                v54 = *(char *)(v52 + 23);
                if (v54 >= 0)
                  v55 = *(unsigned __int8 *)(v52 + 23);
                else
                  v55 = *(_QWORD *)(v52 + 8);
                if (v54 >= 0)
                  v56 = *(const void **)(*k + 8);
                else
                  v56 = *(const void **)v52;
                if (v53 >= 0)
                  v57 = *((unsigned __int8 *)v51 + 23);
                else
                  v57 = (size_t)v51[1];
                if (v53 >= 0)
                  v58 = v51;
                else
                  v58 = *v51;
                if (v57 >= v55)
                  v59 = v55;
                else
                  v59 = v57;
                v60 = memcmp(v56, v58, v59);
                v61 = v55 >= v57;
                if (v60)
                  v61 = v60 >= 0;
                if (v25 >= k || !v61)
                  goto LABEL_103;
              }
              else if (v25 >= k)
              {
                goto LABEL_103;
              }
            }
          }
          k = a2;
        }
        else
        {
          while (1)
          {
            v41 = *(_QWORD *)(*k + 8);
            if (v41)
            {
              if (!v28)
                break;
              v42 = *((char *)v28 + 23);
              v43 = *(char *)(v41 + 23);
              if (v43 >= 0)
                v44 = *(unsigned __int8 *)(v41 + 23);
              else
                v44 = *(_QWORD *)(v41 + 8);
              if (v43 >= 0)
                v45 = *(const void **)(*k + 8);
              else
                v45 = *(const void **)v41;
              if (v42 >= 0)
                v46 = *((unsigned __int8 *)v28 + 23);
              else
                v46 = (size_t)v28[1];
              if (v42 >= 0)
                v47 = v28;
              else
                v47 = *v28;
              if (v46 >= v44)
                v48 = v44;
              else
                v48 = v46;
              v49 = memcmp(v45, v47, v48);
              v50 = v44 < v46;
              if (v49)
                v50 = v49 < 0;
              if (v50)
                break;
            }
            --k;
          }
        }
LABEL_103:
        i = v25;
        if (v25 < k)
        {
          v62 = *k;
          i = v25;
          v63 = (unint64_t)k;
          do
          {
            sub_24BA56EE4(v26, v62);
            v64 = i[1];
            ++i;
            v26 = v64;
            v65 = *(const void ***)(v64 + 8);
            for (m = v339; v65; v65 = *(const void ***)(v76 + 8))
            {
              if (m)
              {
                v67 = *((char *)m + 23);
                v68 = *((char *)v65 + 23);
                if (v68 >= 0)
                  v69 = *((unsigned __int8 *)v65 + 23);
                else
                  v69 = (size_t)v65[1];
                if (v68 >= 0)
                  v70 = v65;
                else
                  v70 = *v65;
                if (v67 >= 0)
                  v71 = *((unsigned __int8 *)m + 23);
                else
                  v71 = (size_t)m[1];
                if (v67 >= 0)
                  v72 = m;
                else
                  v72 = *m;
                if (v71 >= v69)
                  v73 = v69;
                else
                  v73 = v71;
                v74 = memcmp(v70, v72, v73);
                v75 = v69 < v71;
                if (v74)
                  v75 = v74 < 0;
                if (!v75)
                  break;
              }
              v76 = i[1];
              ++i;
              v26 = v76;
            }
            do
            {
              do
              {
                v77 = *(_QWORD *)(v63 - 8);
                v63 -= 8;
                v62 = v77;
                v78 = *(const void ***)(v77 + 8);
              }
              while (!v78);
              if (!m)
                break;
              v79 = *((char *)m + 23);
              v80 = *((char *)v78 + 23);
              if (v80 >= 0)
                v81 = *((unsigned __int8 *)v78 + 23);
              else
                v81 = (size_t)v78[1];
              if (v80 >= 0)
                v82 = v78;
              else
                v82 = *v78;
              if (v79 >= 0)
                v83 = *((unsigned __int8 *)m + 23);
              else
                v83 = (size_t)m[1];
              if (v79 >= 0)
                v84 = m;
              else
                v84 = *m;
              if (v83 >= v81)
                v85 = v81;
              else
                v85 = v83;
              v86 = memcmp(v82, v84, v85);
              v87 = v81 < v83;
              if (v86)
                v87 = v86 < 0;
            }
            while (!v87);
          }
          while ((unint64_t)i < v63);
        }
        v88 = i - 1;
        v6 = v336;
        if (i - 1 != v336)
          sub_24BA56F7C(*v336, *v88);
        sub_24BA56F7C(*v88, (uint64_t)v338);
        sub_24BA56EBC((PB::Base *)v338);
        a2 = v333;
        if (v25 < k)
        {
LABEL_152:
          result = sub_24BA4D42C(v336, i - 1, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v89 = sub_24BA4EA00(v336, i - 1);
        result = sub_24BA4EA00(i, v333);
        if (!(_DWORD)result)
        {
          if ((v89 & 1) != 0)
            continue;
          goto LABEL_152;
        }
        a2 = i - 1;
        if ((v89 & 1) == 0)
          goto LABEL_2;
        return result;
    }
  }
}

uint64_t sub_24BA4E508(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  size_t v17;
  const void *v18;
  size_t v19;
  const void *v20;
  size_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  size_t v29;
  const void *v30;
  size_t v31;
  const void *v32;
  size_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  size_t v41;
  const void *v42;
  size_t v43;
  const void *v44;
  size_t v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  unint64_t v53;
  const void *v54;
  unint64_t v55;
  const void *v56;
  size_t v57;
  _BOOL4 v58;

  result = sub_24BA4ED00(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *(_QWORD *)(v11 + 8);
  if (v12)
  {
    v13 = *a4;
    v14 = *(_QWORD *)(*a4 + 8);
    if (!v14)
      goto LABEL_21;
    v15 = *(char *)(v14 + 23);
    v16 = *(char *)(v12 + 23);
    if (v16 >= 0)
      v17 = *(unsigned __int8 *)(v12 + 23);
    else
      v17 = *(_QWORD *)(v12 + 8);
    if (v16 >= 0)
      v18 = *(const void **)(v11 + 8);
    else
      v18 = *(const void **)v12;
    if (v15 >= 0)
      v19 = *(unsigned __int8 *)(v14 + 23);
    else
      v19 = *(_QWORD *)(v14 + 8);
    if (v15 >= 0)
      v20 = *(const void **)(*a4 + 8);
    else
      v20 = *(const void **)v14;
    if (v19 >= v17)
      v21 = v17;
    else
      v21 = v19;
    result = memcmp(v18, v20, v21);
    v22 = v17 < v19;
    if ((_DWORD)result)
      v22 = (int)result < 0;
    if (v22)
    {
LABEL_21:
      result = sub_24BA56EE4(v13, v11);
      v23 = *a4;
      v24 = *(_QWORD *)(v23 + 8);
      if (v24)
      {
        v25 = *a3;
        v26 = *(_QWORD *)(*a3 + 8);
        if (!v26)
          goto LABEL_41;
        v27 = *(char *)(v26 + 23);
        v28 = *(char *)(v24 + 23);
        if (v28 >= 0)
          v29 = *(unsigned __int8 *)(v24 + 23);
        else
          v29 = *(_QWORD *)(v24 + 8);
        if (v28 >= 0)
          v30 = *(const void **)(v23 + 8);
        else
          v30 = *(const void **)v24;
        if (v27 >= 0)
          v31 = *(unsigned __int8 *)(v26 + 23);
        else
          v31 = *(_QWORD *)(v26 + 8);
        if (v27 >= 0)
          v32 = *(const void **)(*a3 + 8);
        else
          v32 = *(const void **)v26;
        if (v31 >= v29)
          v33 = v29;
        else
          v33 = v31;
        result = memcmp(v30, v32, v33);
        v34 = v29 < v31;
        if ((_DWORD)result)
          v34 = (int)result < 0;
        if (v34)
        {
LABEL_41:
          result = sub_24BA56EE4(v25, v23);
          v35 = *a3;
          v36 = *(_QWORD *)(v35 + 8);
          if (v36)
          {
            v37 = *a2;
            v38 = *(_QWORD *)(*a2 + 8);
            if (!v38)
              goto LABEL_61;
            v39 = *(char *)(v38 + 23);
            v40 = *(char *)(v36 + 23);
            if (v40 >= 0)
              v41 = *(unsigned __int8 *)(v36 + 23);
            else
              v41 = *(_QWORD *)(v36 + 8);
            if (v40 >= 0)
              v42 = *(const void **)(v35 + 8);
            else
              v42 = *(const void **)v36;
            if (v39 >= 0)
              v43 = *(unsigned __int8 *)(v38 + 23);
            else
              v43 = *(_QWORD *)(v38 + 8);
            if (v39 >= 0)
              v44 = *(const void **)(*a2 + 8);
            else
              v44 = *(const void **)v38;
            if (v43 >= v41)
              v45 = v41;
            else
              v45 = v43;
            result = memcmp(v42, v44, v45);
            v46 = v41 < v43;
            if ((_DWORD)result)
              v46 = (int)result < 0;
            if (v46)
            {
LABEL_61:
              result = sub_24BA56EE4(v37, v35);
              v47 = *a2;
              v48 = *(_QWORD *)(v47 + 8);
              if (v48)
              {
                v49 = *a1;
                v50 = *(_QWORD *)(v49 + 8);
                if (!v50)
                  return sub_24BA56EE4(v49, v47);
                v51 = *(char *)(v50 + 23);
                v52 = *(char *)(v48 + 23);
                v53 = v52 >= 0 ? *(unsigned __int8 *)(v48 + 23) : *(_QWORD *)(v48 + 8);
                v54 = v52 >= 0 ? *(const void **)(v47 + 8) : *(const void **)v48;
                v55 = v51 >= 0 ? *(unsigned __int8 *)(v50 + 23) : *(_QWORD *)(v50 + 8);
                v56 = v51 >= 0 ? *(const void **)(v49 + 8) : *(const void **)v50;
                v57 = v55 >= v53 ? v53 : v55;
                result = memcmp(v54, v56, v57);
                v58 = v53 < v55;
                if ((_DWORD)result)
                  v58 = (int)result < 0;
                if (v58)
                  return sub_24BA56EE4(v49, v47);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_24BA4E754(uint64_t result, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t v6;
  const void **v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  size_t v12;
  const void *v13;
  size_t v14;
  const void *v15;
  size_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  size_t v22;
  const void *v23;
  size_t v24;
  const void *v25;
  size_t v26;
  int v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  unint64_t v36;
  const void *v37;
  unint64_t v38;
  const void *v39;
  size_t v40;
  _BOOL4 v41;
  uint64_t v42;
  int v43;
  size_t v44;
  const void *v45;
  size_t v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const void **v51;
  int v52;
  int v53;
  size_t v54;
  const void *v55;
  size_t v56;
  const void *v57;
  size_t v58;
  _BOOL4 v59;

  v5 = (uint64_t *)result;
  v6 = *a2;
  v7 = *(const void ***)(*a2 + 8);
  if (!v7)
  {
    v29 = *a3;
    if (!*(_QWORD *)(*a3 + 8))
      return result;
LABEL_77:
    result = sub_24BA56EE4(v6, v29);
    v48 = *a2;
    v49 = *(_QWORD *)(v48 + 8);
    if (v49)
    {
      v50 = *v5;
      v51 = *(const void ***)(*v5 + 8);
      if (!v51)
        return sub_24BA56EE4(v50, v48);
      v52 = *((char *)v51 + 23);
      v53 = *(char *)(v49 + 23);
      if (v53 >= 0)
        v54 = *(unsigned __int8 *)(v49 + 23);
      else
        v54 = *(_QWORD *)(v49 + 8);
      if (v53 >= 0)
        v55 = *(const void **)(v48 + 8);
      else
        v55 = *(const void **)v49;
      if (v52 >= 0)
        v56 = *((unsigned __int8 *)v51 + 23);
      else
        v56 = (size_t)v51[1];
      if (v52 >= 0)
        v57 = v51;
      else
        v57 = *v51;
      if (v56 >= v54)
        v58 = v54;
      else
        v58 = v56;
      result = memcmp(v55, v57, v58);
      v59 = v54 < v56;
      if ((_DWORD)result)
        v59 = (int)result < 0;
      if (v59)
        return sub_24BA56EE4(v50, v48);
    }
    return result;
  }
  v8 = *(_QWORD *)result;
  v9 = *(_QWORD *)(*(_QWORD *)result + 8);
  if (!v9)
    goto LABEL_21;
  v10 = *(char *)(v9 + 23);
  v11 = *((char *)v7 + 23);
  if (v11 >= 0)
    v12 = *((unsigned __int8 *)v7 + 23);
  else
    v12 = (size_t)v7[1];
  if (v11 >= 0)
    v13 = *(const void **)(*a2 + 8);
  else
    v13 = *v7;
  if (v10 >= 0)
    v14 = *(unsigned __int8 *)(v9 + 23);
  else
    v14 = *(_QWORD *)(v9 + 8);
  if (v10 >= 0)
    v15 = *(const void **)(*(_QWORD *)result + 8);
  else
    v15 = *(const void **)v9;
  if (v14 >= v12)
    v16 = v12;
  else
    v16 = v14;
  result = memcmp(v13, v15, v16);
  v17 = v12 < v14;
  if ((_DWORD)result)
    v17 = (int)result < 0;
  if (v17)
  {
LABEL_21:
    v18 = *a3;
    v19 = *(_QWORD *)(*a3 + 8);
    if (!v19)
      goto LABEL_43;
    v20 = *((char *)v7 + 23);
    v21 = *(char *)(v19 + 23);
    if (v21 >= 0)
      v22 = *(unsigned __int8 *)(v19 + 23);
    else
      v22 = *(_QWORD *)(v19 + 8);
    if (v21 >= 0)
      v23 = *(const void **)(*a3 + 8);
    else
      v23 = *(const void **)v19;
    if (v20 >= 0)
      v24 = *((unsigned __int8 *)v7 + 23);
    else
      v24 = (size_t)v7[1];
    if (v20 >= 0)
      v25 = v7;
    else
      v25 = *v7;
    if (v24 >= v22)
      v26 = v22;
    else
      v26 = v24;
    v27 = memcmp(v23, v25, v26);
    v28 = v22 < v24;
    if (v27)
      v28 = v27 < 0;
    if (v28)
      return sub_24BA56EE4(v8, v18);
LABEL_43:
    result = sub_24BA56EE4(v8, v6);
    v30 = *a3;
    v31 = *(_QWORD *)(*a3 + 8);
    if (v31)
    {
      v32 = *a2;
      v33 = *(_QWORD *)(v32 + 8);
      if (!v33)
        return sub_24BA56EE4(v32, v30);
      v34 = *(char *)(v33 + 23);
      v35 = *(char *)(v31 + 23);
      v36 = v35 >= 0 ? *(unsigned __int8 *)(v31 + 23) : *(_QWORD *)(v31 + 8);
      v37 = v35 >= 0 ? *(const void **)(*a3 + 8) : *(const void **)v31;
      v38 = v34 >= 0 ? *(unsigned __int8 *)(v33 + 23) : *(_QWORD *)(v33 + 8);
      v39 = v34 >= 0 ? *(const void **)(v32 + 8) : *(const void **)v33;
      v40 = v38 >= v36 ? v36 : v38;
      result = memcmp(v37, v39, v40);
      v41 = v36 < v38;
      if ((_DWORD)result)
        v41 = (int)result < 0;
      if (v41)
        return sub_24BA56EE4(v32, v30);
    }
    return result;
  }
  v29 = *a3;
  v42 = *(_QWORD *)(v29 + 8);
  if (v42)
  {
    v43 = *(char *)(v42 + 23);
    if (v43 >= 0)
      v44 = *(unsigned __int8 *)(v42 + 23);
    else
      v44 = *(_QWORD *)(v42 + 8);
    if (v43 >= 0)
      v45 = *(const void **)(v29 + 8);
    else
      v45 = *(const void **)v42;
    if (v12 >= v44)
      v46 = v44;
    else
      v46 = v12;
    result = memcmp(v45, v13, v46);
    v47 = v44 < v12;
    if ((_DWORD)result)
      v47 = (int)result < 0;
    if (v47)
      goto LABEL_77;
  }
  return result;
}

uint64_t sub_24BA4EA00(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  unint64_t v11;
  const void *v12;
  unint64_t v13;
  const void *v14;
  size_t v15;
  int v16;
  _BOOL4 v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint64_t *v22;
  uint64_t v23;
  const void **v24;
  uint64_t v25;
  int v26;
  int v27;
  size_t v28;
  const void *v29;
  size_t v30;
  const void *v31;
  size_t v32;
  int v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  size_t v40;
  const void *v41;
  size_t v42;
  const void *v43;
  size_t v44;
  int v45;
  _BOOL4 v46;
  uint64_t *v48;
  char v49[8];
  const void **v50;

  v2 = a2;
  v4 = 1;
  switch(a2 - a1)
  {
    case 0:
    case 1:
      return v4;
    case 2:
      v5 = *(a2 - 1);
      v6 = *(_QWORD *)(v5 + 8);
      if (v6)
      {
        v7 = *a1;
        v8 = *(_QWORD *)(*a1 + 8);
        if (!v8)
          goto LABEL_22;
        v9 = *(char *)(v8 + 23);
        v10 = *(char *)(v6 + 23);
        v11 = v10 >= 0 ? *(unsigned __int8 *)(v6 + 23) : *(_QWORD *)(v6 + 8);
        v12 = v10 >= 0 ? *(const void **)(v5 + 8) : *(const void **)v6;
        v13 = v9 >= 0 ? *(unsigned __int8 *)(v8 + 23) : *(_QWORD *)(v8 + 8);
        v14 = v9 >= 0 ? *(const void **)(v7 + 8) : *(const void **)v8;
        v15 = v13 >= v11 ? v11 : v13;
        v16 = memcmp(v12, v14, v15);
        v17 = v11 < v13;
        if (v16)
          v17 = v16 < 0;
        if (v17)
LABEL_22:
          sub_24BA56EE4(v7, v5);
        return 1;
      }
      return v4;
    case 3:
      sub_24BA4E754((uint64_t)a1, a1 + 1, a2 - 1);
      return v4;
    case 4:
      sub_24BA4ED00(a1, a1 + 1, a1 + 2, a2 - 1);
      return v4;
    case 5:
      sub_24BA4E508(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return v4;
    default:
      v18 = a1 + 2;
      sub_24BA4E754((uint64_t)a1, a1 + 1, a1 + 2);
      v19 = a1 + 3;
      if (a1 + 3 == v2)
        return 1;
      v20 = 0;
      v21 = 0;
      v48 = v2;
      break;
  }
  while (1)
  {
    v22 = v18;
    v18 = v19;
    v23 = *v19;
    v24 = *(const void ***)(*v19 + 8);
    if (!v24)
      goto LABEL_74;
    v25 = *(_QWORD *)(*v22 + 8);
    if (v25)
    {
      v26 = *(char *)(v25 + 23);
      v27 = *((char *)v24 + 23);
      if (v27 >= 0)
        v28 = *((unsigned __int8 *)v24 + 23);
      else
        v28 = (size_t)v24[1];
      if (v27 >= 0)
        v29 = v24;
      else
        v29 = *v24;
      if (v26 >= 0)
        v30 = *(unsigned __int8 *)(v25 + 23);
      else
        v30 = *(_QWORD *)(v25 + 8);
      if (v26 >= 0)
        v31 = *(const void **)(*v22 + 8);
      else
        v31 = *(const void **)v25;
      if (v30 >= v28)
        v32 = v28;
      else
        v32 = v30;
      v33 = memcmp(v29, v31, v32);
      v2 = v48;
      v34 = v28 < v30;
      if (v33)
        v34 = v33 < 0;
      if (!v34)
        goto LABEL_74;
    }
    sub_24BA56F78(v49, v23);
    sub_24BA56F7C(*v18, *v22);
    if (v22 == a1)
    {
      v22 = a1;
    }
    else
    {
      v35 = v20;
      while (v50)
      {
        v36 = *(uint64_t *)((char *)a1 + v35 + 8);
        v37 = *(_QWORD *)(v36 + 8);
        if (v37)
        {
          v38 = *(char *)(v37 + 23);
          v39 = *((char *)v50 + 23);
          if (v39 >= 0)
            v40 = *((unsigned __int8 *)v50 + 23);
          else
            v40 = (size_t)v50[1];
          if (v39 >= 0)
            v41 = v50;
          else
            v41 = *v50;
          if (v38 >= 0)
            v42 = *(unsigned __int8 *)(v37 + 23);
          else
            v42 = *(_QWORD *)(v37 + 8);
          if (v38 >= 0)
            v43 = *(const void **)(v36 + 8);
          else
            v43 = *(const void **)v37;
          if (v42 >= v40)
            v44 = v40;
          else
            v44 = v42;
          v45 = memcmp(v41, v43, v44);
          v46 = v40 < v42;
          if (v45)
            v46 = v45 < 0;
          if (!v46)
          {
            v22 = (uint64_t *)((char *)a1 + v35 + 16);
            break;
          }
        }
        --v22;
        sub_24BA56F7C(*(uint64_t *)((char *)a1 + v35 + 16), v36);
        v35 -= 8;
        if (v35 == -16)
        {
          v22 = a1;
          break;
        }
      }
      v2 = v48;
    }
    sub_24BA56F7C(*v22, (uint64_t)v49);
    if (++v21 == 8)
      break;
    sub_24BA56EBC((PB::Base *)v49);
LABEL_74:
    v19 = v18 + 1;
    v20 += 8;
    if (v18 + 1 == v2)
      return 1;
  }
  v4 = v18 + 1 == v2;
  sub_24BA56EBC((PB::Base *)v49);
  return v4;
}

uint64_t sub_24BA4ED00(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  size_t v15;
  const void *v16;
  size_t v17;
  const void *v18;
  size_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  size_t v27;
  const void *v28;
  size_t v29;
  const void *v30;
  size_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  unint64_t v39;
  const void *v40;
  unint64_t v41;
  const void *v42;
  size_t v43;
  _BOOL4 v44;

  result = sub_24BA4E754((uint64_t)a1, a2, a3);
  v9 = *a4;
  v10 = *(_QWORD *)(v9 + 8);
  if (v10)
  {
    v11 = *a3;
    v12 = *(_QWORD *)(*a3 + 8);
    if (!v12)
      goto LABEL_21;
    v13 = *(char *)(v12 + 23);
    v14 = *(char *)(v10 + 23);
    if (v14 >= 0)
      v15 = *(unsigned __int8 *)(v10 + 23);
    else
      v15 = *(_QWORD *)(v10 + 8);
    if (v14 >= 0)
      v16 = *(const void **)(v9 + 8);
    else
      v16 = *(const void **)v10;
    if (v13 >= 0)
      v17 = *(unsigned __int8 *)(v12 + 23);
    else
      v17 = *(_QWORD *)(v12 + 8);
    if (v13 >= 0)
      v18 = *(const void **)(*a3 + 8);
    else
      v18 = *(const void **)v12;
    if (v17 >= v15)
      v19 = v15;
    else
      v19 = v17;
    result = memcmp(v16, v18, v19);
    v20 = v15 < v17;
    if ((_DWORD)result)
      v20 = (int)result < 0;
    if (v20)
    {
LABEL_21:
      result = sub_24BA56EE4(v11, v9);
      v21 = *a3;
      v22 = *(_QWORD *)(v21 + 8);
      if (v22)
      {
        v23 = *a2;
        v24 = *(_QWORD *)(*a2 + 8);
        if (!v24)
          goto LABEL_41;
        v25 = *(char *)(v24 + 23);
        v26 = *(char *)(v22 + 23);
        if (v26 >= 0)
          v27 = *(unsigned __int8 *)(v22 + 23);
        else
          v27 = *(_QWORD *)(v22 + 8);
        if (v26 >= 0)
          v28 = *(const void **)(v21 + 8);
        else
          v28 = *(const void **)v22;
        if (v25 >= 0)
          v29 = *(unsigned __int8 *)(v24 + 23);
        else
          v29 = *(_QWORD *)(v24 + 8);
        if (v25 >= 0)
          v30 = *(const void **)(*a2 + 8);
        else
          v30 = *(const void **)v24;
        if (v29 >= v27)
          v31 = v27;
        else
          v31 = v29;
        result = memcmp(v28, v30, v31);
        v32 = v27 < v29;
        if ((_DWORD)result)
          v32 = (int)result < 0;
        if (v32)
        {
LABEL_41:
          result = sub_24BA56EE4(v23, v21);
          v33 = *a2;
          v34 = *(_QWORD *)(v33 + 8);
          if (v34)
          {
            v35 = *a1;
            v36 = *(_QWORD *)(v35 + 8);
            if (!v36)
              return sub_24BA56EE4(v35, v33);
            v37 = *(char *)(v36 + 23);
            v38 = *(char *)(v34 + 23);
            v39 = v38 >= 0 ? *(unsigned __int8 *)(v34 + 23) : *(_QWORD *)(v34 + 8);
            v40 = v38 >= 0 ? *(const void **)(v33 + 8) : *(const void **)v34;
            v41 = v37 >= 0 ? *(unsigned __int8 *)(v36 + 23) : *(_QWORD *)(v36 + 8);
            v42 = v37 >= 0 ? *(const void **)(v35 + 8) : *(const void **)v36;
            v43 = v41 >= v39 ? v39 : v41;
            result = memcmp(v40, v42, v43);
            v44 = v39 < v41;
            if ((_DWORD)result)
              v44 = (int)result < 0;
            if (v44)
              return sub_24BA56EE4(v35, v33);
          }
        }
      }
    }
  }
  return result;
}

std::string *sub_24BA4EECC(uint64_t a1)
{
  return std::string::append(*(std::string **)a1, 2 * *(_QWORD *)(a1 + 8), 32);
}

void sub_24BA4EEE0(uint64_t a1, const std::string::value_type *a2, uint64_t a3)
{
  int v6;
  const std::string::value_type *v7;
  std::string::size_type v8;

  std::string::append(*(std::string **)a1, 2 * *(_QWORD *)(a1 + 8), 32);
  std::string::append(*(std::string **)a1, a2);
  std::string::append(*(std::string **)a1, ": ");
  v6 = *(char *)(a3 + 23);
  if (v6 >= 0)
    v7 = (const std::string::value_type *)a3;
  else
    v7 = *(const std::string::value_type **)a3;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a3 + 23);
  else
    v8 = *(_QWORD *)(a3 + 8);
  std::string::append(*(std::string **)a1, v7, v8);
  std::string::push_back(*(std::string **)a1, 10);
}

const char *sub_24BA4EF64(uint64_t a1, int a2)
{
  if (a2)
    return "true";
  else
    return "false";
}

std::string *sub_24BA4EF80@<X0>(uint64_t __val@<X1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *sub_24BA4EF88@<X0>(unint64_t __val@<X1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *sub_24BA4EF90@<X0>(int __val@<W1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *sub_24BA4EF98@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

void sub_24BA4EFA8(unsigned __int8 *a1@<X1>, std::string *a2@<X8>)
{
  uint64_t v4;
  int v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  std::string::value_type v11;
  int v12;
  std::string *p_p;
  std::string::size_type size;
  std::string __p;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v4 = a1[23];
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a1 + 1);
  std::string::reserve(a2, v4 + 2);
  std::string::push_back(a2, 34);
  v5 = (char)a1[23];
  if (v5 >= 0)
    v6 = a1;
  else
    v6 = *(unsigned __int8 **)a1;
  if (v5 >= 0)
    v7 = a1[23];
  else
    v7 = *((_QWORD *)a1 + 1);
  if (v7)
  {
    v8 = 0;
    v9 = MEMORY[0x24BDAC740];
    do
    {
      v10 = *v6;
      v11 = v10;
      if ((char)v10 > 33)
      {
        switch((char)v10)
        {
          case '"':
            std::string::push_back(a2, 92);
            v11 = 34;
            goto LABEL_30;
          case '\'':
            std::string::push_back(a2, 92);
            v11 = 39;
            goto LABEL_30;
          case '\\':
            std::string::push_back(a2, 92);
            goto LABEL_30;
        }
      }
      else
      {
        switch((char)v10)
        {
          case 9:
            std::string::push_back(a2, 92);
            v11 = 116;
            goto LABEL_30;
          case 10:
            std::string::push_back(a2, 92);
            v11 = 110;
            goto LABEL_30;
          case 13:
            std::string::push_back(a2, 92);
            v11 = 114;
            goto LABEL_30;
        }
      }
      if ((char)v10 < 0)
        v12 = __maskrune((char)v10, 0x40000uLL);
      else
        v12 = *(_DWORD *)(v9 + 4 * (char)v10 + 60) & 0x40000;
      if (!v12
        || (v10 & 0x80u) == 0
        && (v8 & 1) != 0
        && (*(_DWORD *)(v9 + 4 * (char)v10 + 60) & 0x10000) != 0)
      {
        std::string::push_back(a2, 92);
        std::string::push_back(a2, 120);
        sub_24BA58A20(v10, 2uLL, &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          size = __p.__r_.__value_.__l.__size_;
        std::string::append(a2, (const std::string::value_type *)p_p, size);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v8 = 1;
        goto LABEL_31;
      }
LABEL_30:
      std::string::push_back(a2, v11);
      v8 = 0;
LABEL_31:
      ++v6;
      --v7;
    }
    while (v7);
  }
  std::string::push_back(a2, 34);
}

void sub_24BA4F1C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

std::string *sub_24BA4F208@<X0>(unint64_t __val@<X2>, _BYTE *a2@<X1>, std::string *a3@<X8>)
{
  return sub_24BA4F214(__val, a2, a3);
}

std::string *sub_24BA4F214@<X0>(unint64_t __val@<X1>, _BYTE *a2@<X0>, std::string *a3@<X8>)
{
  unint64_t v3;
  std::string *v6;
  __int128 v7;
  std::string *v8;
  __int128 v9;
  std::string::size_type size;
  uint64_t v11;
  int v12;
  std::string::size_type v13;
  std::string::size_type v14;
  std::string v16;
  std::string v17;

  v3 = __val;
  std::to_string(&v16, __val);
  v6 = std::string::insert(&v16, 0, "[");
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  v8 = std::string::append(&v17, " bytes] ");
  v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  a3->__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0)
    size = a3->__r_.__value_.__l.__size_;
  std::string::reserve(a3, size + 3 * v3);
  for (; v3; --v3)
  {
    std::string::push_back(a3, a0123456789abcd[(unint64_t)*a2 >> 4]);
    std::string::push_back(a3, a0123456789abcd[*a2 & 0xF]);
    std::string::push_back(a3, 32);
    ++a2;
  }
  v11 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  v12 = (char)v11;
  v13 = (std::string::size_type)a3 + v11;
  if (v12 >= 0)
  {
    v14 = (std::string::size_type)a3;
  }
  else
  {
    v13 = a3->__r_.__value_.__r.__words[0] + a3->__r_.__value_.__l.__size_;
    v14 = a3->__r_.__value_.__r.__words[0];
  }
  return std::string::erase(a3, ~v14 + v13, 1uLL);
}

void sub_24BA4F36C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (*(char *)(v21 + 23) < 0)
    operator delete(*(void **)v21);
  _Unwind_Resume(exception_object);
}

uint64_t sCreateWISMetadataLoaderForXpcConversion@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  v4 = 1;
  sCreateBestChoiceMetadataLoaderDelegate(&v3);
  sub_24BA5040C(&v4, &v3, a1);
  result = v3;
  v3 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void sub_24BA4F41C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    (*(void (**)(uint64_t))(*(_QWORD *)a9 + 8))(a9);
  _Unwind_Resume(exception_object);
}

uint64_t *sCreateLazyWISMetadataLoaderForXpcConversion@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *result;
  uint64_t *v3;
  unsigned int v4;

  v4 = 1;
  sCreateLazyMetadataLoaderDelegate(&v3);
  sub_24BA50604(&v4, (uint64_t *)&v3, a1);
  result = v3;
  v3 = 0;
  if (result)
    return (uint64_t *)(*(uint64_t (**)(uint64_t *))(*result + 8))(result);
  return result;
}

void sub_24BA4F4A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    (*(void (**)(uint64_t))(*(_QWORD *)a9 + 8))(a9);
  _Unwind_Resume(exception_object);
}

xpc_object_t *sub_24BA4F4C4(xpc_object_t *a1)
{
  uint64_t v2;

  v2 = (uint64_t)(a1 + 1);
  sub_24BA387C4((uint64_t)(a1 + 6));
  sub_24BA3B304(v2);
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

void sub_24BA4F508(void *a1, char *a2, __int128 *a3, unsigned int a4)
{
  char *v8;
  char *v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  xpc_object_t v13;
  xpc_object_t object;
  __int128 v15;
  uint64_t v16;

  v15 = *a3;
  v16 = *((_QWORD *)a3 + 2);
  v8 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v15, a4);
  if (a2[23] >= 0)
    v9 = a2;
  else
    v9 = *(char **)a2;
  sub_24BA38958(v9, &object);
  v13 = object;
  if (object)
    xpc_retain(object);
  else
    v13 = xpc_null_create();
  v11 = *a3;
  v12 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_24BA351E4(a1, (uint64_t)v8, &v13, v10);
  xpc_release(v13);
  v13 = 0;
  xpc_release(object);
}

void sub_24BA4F5F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, xpc_object_t object, xpc_object_t a14)
{
  xpc_release(object);
  xpc_release(a14);
  _Unwind_Resume(a1);
}

void sub_24BA4F61C(void *a1, uint64_t a2, unsigned int __val)
{
  std::string *v5;
  xpc_object_t object;
  xpc_object_t v7;
  std::string v8;

  std::to_string(&v8, __val);
  sub_24BA389A4(a2, &v7);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v8;
  else
    v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
  object = v7;
  if (v7)
    xpc_retain(v7);
  else
    object = xpc_null_create();
  sub_24BA351E4(a1, (uint64_t)v5, &object, 1);
  xpc_release(object);
  object = 0;
  xpc_release(v7);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
}

void sub_24BA4F6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, xpc_object_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc_release(object);
  xpc_release(a11);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_24BA4F718(void *a1, void *a2, size_t a3, unsigned int __val)
{
  int v7;
  std::string::size_type v8;
  std::string *v9;
  xpc_object_t object;
  std::string v11;

  std::to_string(&v11, __val);
  v7 = SHIBYTE(v11.__r_.__value_.__r.__words[2]);
  v8 = v11.__r_.__value_.__r.__words[0];
  sub_24BA38918(a2, a3, &object);
  if (v7 >= 0)
    v9 = &v11;
  else
    v9 = (std::string *)v8;
  sub_24BA351E4(a1, (uint64_t)v9, &object, 1);
  xpc_release(object);
  object = 0;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
}

void sub_24BA4F7B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  xpc_release(object);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_24BA4F7EC(void *a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  char *v23;
  __int128 v25;
  uint64_t v26;
  xpc_object_t object;
  xpc_object_t v28;
  xpc_object_t v29;
  __int128 v30;
  uint64_t v31;
  void *__p[2];
  char v33;
  xpc_object_t v34;
  __int128 v35;
  uint64_t v36;

  v35 = *a3;
  v36 = *((_QWORD *)a3 + 2);
  v9 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v35, a4);
  v10 = xpc_array_create(0, 0);
  if (v10 || (v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2CA88](v10) == MEMORY[0x24BDACF78])
    {
      xpc_retain(v10);
      v11 = v10;
    }
    else
    {
      v11 = xpc_null_create();
    }
  }
  else
  {
    v11 = xpc_null_create();
    v10 = 0;
  }
  v23 = v9;
  xpc_release(v10);
  v12 = *a2;
  v13 = a2[1];
  if (*a2 != v13)
  {
    v14 = MEMORY[0x24BDACFE0];
    do
    {
      v15 = *v12;
      v16 = xpc_null_create();
      if (a5 != 11)
      {
        if (a5 == 12)
        {
          sub_24BA38A58(v15 != 0, &v34);
          v17 = v34;
          v34 = v16;
          xpc_release(v16);
          v34 = 0;
          v16 = v17;
        }
        goto LABEL_19;
      }
      v30 = *a3;
      v31 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v30, a4, v15, __p);
      if (v33 < 0)
      {
        if (!__p[1])
          goto LABEL_18;
        v18 = (char *)__p[0];
      }
      else
      {
        if (!v33)
          goto LABEL_19;
        v18 = (char *)__p;
      }
      sub_24BA38958(v18, &v29);
      v19 = v29;
      v29 = v16;
      xpc_release(v16);
      v29 = 0;
      v16 = v19;
      if (v33 < 0)
LABEL_18:
        operator delete(__p[0]);
LABEL_19:
      if (MEMORY[0x24BD2CA88](v16) == v14)
      {
        sub_24BA389A4(v15, &v28);
        v20 = v28;
        v28 = v16;
        xpc_release(v16);
        v28 = 0;
        v16 = v20;
      }
      xpc_array_append_value(v11, v16);
      xpc_release(v16);
      ++v12;
    }
    while (v12 != v13);
  }
  object = v11;
  if (v11)
  {
    xpc_retain(v11);
    v21 = (uint64_t)v23;
  }
  else
  {
    v21 = (uint64_t)v23;
    object = xpc_null_create();
  }
  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v22 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA351E4(a1, v21, &object, v22);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
}

void sub_24BA4FA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;

  xpc_release(object);
  xpc_release(v26);
  _Unwind_Resume(a1);
}

void sub_24BA4FAF4(void *a1, unsigned int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  unsigned int *v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  char *v23;
  __int128 v25;
  uint64_t v26;
  xpc_object_t object;
  xpc_object_t v28;
  xpc_object_t v29;
  __int128 v30;
  uint64_t v31;
  void *__p[2];
  char v33;
  xpc_object_t v34;
  __int128 v35;
  uint64_t v36;

  v35 = *a3;
  v36 = *((_QWORD *)a3 + 2);
  v9 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v35, a4);
  v10 = xpc_array_create(0, 0);
  if (v10 || (v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2CA88](v10) == MEMORY[0x24BDACF78])
    {
      xpc_retain(v10);
      v11 = v10;
    }
    else
    {
      v11 = xpc_null_create();
    }
  }
  else
  {
    v11 = xpc_null_create();
    v10 = 0;
  }
  v23 = v9;
  xpc_release(v10);
  v12 = *a2;
  v13 = a2[1];
  if (*a2 != v13)
  {
    v14 = MEMORY[0x24BDACFE0];
    do
    {
      v15 = *v12;
      v16 = xpc_null_create();
      if (a5 != 11)
      {
        if (a5 == 12)
        {
          sub_24BA38A58((_DWORD)v15 != 0, &v34);
          v17 = v34;
          v34 = v16;
          xpc_release(v16);
          v34 = 0;
          v16 = v17;
        }
        goto LABEL_19;
      }
      v30 = *a3;
      v31 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v30, a4, v15, __p);
      if (v33 < 0)
      {
        if (!__p[1])
          goto LABEL_18;
        v18 = (char *)__p[0];
      }
      else
      {
        if (!v33)
          goto LABEL_19;
        v18 = (char *)__p;
      }
      sub_24BA38958(v18, &v29);
      v19 = v29;
      v29 = v16;
      xpc_release(v16);
      v29 = 0;
      v16 = v19;
      if (v33 < 0)
LABEL_18:
        operator delete(__p[0]);
LABEL_19:
      if (MEMORY[0x24BD2CA88](v16) == v14)
      {
        sub_24BA389E0(v15, &v28);
        v20 = v28;
        v28 = v16;
        xpc_release(v16);
        v28 = 0;
        v16 = v20;
      }
      xpc_array_append_value(v11, v16);
      xpc_release(v16);
      ++v12;
    }
    while (v12 != v13);
  }
  object = v11;
  if (v11)
  {
    xpc_retain(v11);
    v21 = (uint64_t)v23;
  }
  else
  {
    v21 = (uint64_t)v23;
    object = xpc_null_create();
  }
  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v22 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA351E4(a1, v21, &object, v22);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
}

void sub_24BA4FD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;

  xpc_release(object);
  xpc_release(v26);
  _Unwind_Resume(a1);
}

void sub_24BA4FDFC(void *a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  char *v23;
  __int128 v25;
  uint64_t v26;
  xpc_object_t object;
  xpc_object_t v28;
  xpc_object_t v29;
  __int128 v30;
  uint64_t v31;
  void *__p[2];
  char v33;
  xpc_object_t v34;
  __int128 v35;
  uint64_t v36;

  v35 = *a3;
  v36 = *((_QWORD *)a3 + 2);
  v9 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v35, a4);
  v10 = xpc_array_create(0, 0);
  if (v10 || (v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2CA88](v10) == MEMORY[0x24BDACF78])
    {
      xpc_retain(v10);
      v11 = v10;
    }
    else
    {
      v11 = xpc_null_create();
    }
  }
  else
  {
    v11 = xpc_null_create();
    v10 = 0;
  }
  v23 = v9;
  xpc_release(v10);
  v12 = *a2;
  v13 = a2[1];
  if (*a2 != v13)
  {
    v14 = MEMORY[0x24BDACFE0];
    do
    {
      v15 = *v12;
      v16 = xpc_null_create();
      if (a5 != 11)
      {
        if (a5 == 12)
        {
          sub_24BA38A58(v15 != 0, &v34);
          v17 = v34;
          v34 = v16;
          xpc_release(v16);
          v34 = 0;
          v16 = v17;
        }
        goto LABEL_19;
      }
      v30 = *a3;
      v31 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v30, a4, v15, __p);
      if (v33 < 0)
      {
        if (!__p[1])
          goto LABEL_18;
        v18 = (char *)__p[0];
      }
      else
      {
        if (!v33)
          goto LABEL_19;
        v18 = (char *)__p;
      }
      sub_24BA38958(v18, &v29);
      v19 = v29;
      v29 = v16;
      xpc_release(v16);
      v29 = 0;
      v16 = v19;
      if (v33 < 0)
LABEL_18:
        operator delete(__p[0]);
LABEL_19:
      if (MEMORY[0x24BD2CA88](v16) == v14)
      {
        sub_24BA5088C(v15, &v28);
        v20 = v28;
        v28 = v16;
        xpc_release(v16);
        v28 = 0;
        v16 = v20;
      }
      xpc_array_append_value(v11, v16);
      xpc_release(v16);
      ++v12;
    }
    while (v12 != v13);
  }
  object = v11;
  if (v11)
  {
    xpc_retain(v11);
    v21 = (uint64_t)v23;
  }
  else
  {
    v21 = (uint64_t)v23;
    object = xpc_null_create();
  }
  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v22 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA351E4(a1, v21, &object, v22);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
}

void sub_24BA50098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;

  xpc_release(object);
  xpc_release(v26);
  _Unwind_Resume(a1);
}

void sub_24BA50104(void *a1, int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  int *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  char *v23;
  __int128 v25;
  uint64_t v26;
  xpc_object_t object;
  xpc_object_t v28;
  xpc_object_t v29;
  __int128 v30;
  uint64_t v31;
  void *__p[2];
  char v33;
  xpc_object_t v34;
  __int128 v35;
  uint64_t v36;

  v35 = *a3;
  v36 = *((_QWORD *)a3 + 2);
  v9 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v35, a4);
  v10 = xpc_array_create(0, 0);
  if (v10 || (v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24BD2CA88](v10) == MEMORY[0x24BDACF78])
    {
      xpc_retain(v10);
      v11 = v10;
    }
    else
    {
      v11 = xpc_null_create();
    }
  }
  else
  {
    v11 = xpc_null_create();
    v10 = 0;
  }
  v23 = v9;
  xpc_release(v10);
  v12 = *a2;
  v13 = a2[1];
  if (*a2 != v13)
  {
    v14 = MEMORY[0x24BDACFE0];
    do
    {
      v15 = *v12;
      v16 = xpc_null_create();
      if (a5 != 11)
      {
        if (a5 == 12)
        {
          sub_24BA38A58((_DWORD)v15 != 0, &v34);
          v17 = v34;
          v34 = v16;
          xpc_release(v16);
          v34 = 0;
          v16 = v17;
        }
        goto LABEL_19;
      }
      v30 = *a3;
      v31 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v30, a4, v15, __p);
      if (v33 < 0)
      {
        if (!__p[1])
          goto LABEL_18;
        v18 = (char *)__p[0];
      }
      else
      {
        if (!v33)
          goto LABEL_19;
        v18 = (char *)__p;
      }
      sub_24BA38958(v18, &v29);
      v19 = v29;
      v29 = v16;
      xpc_release(v16);
      v29 = 0;
      v16 = v19;
      if (v33 < 0)
LABEL_18:
        operator delete(__p[0]);
LABEL_19:
      if (MEMORY[0x24BD2CA88](v16) == v14)
      {
        sub_24BA38A1C(v15, &v28);
        v20 = v28;
        v28 = v16;
        xpc_release(v16);
        v28 = 0;
        v16 = v20;
      }
      xpc_array_append_value(v11, v16);
      xpc_release(v16);
      ++v12;
    }
    while (v12 != v13);
  }
  object = v11;
  if (v11)
  {
    xpc_retain(v11);
    v21 = (uint64_t)v23;
  }
  else
  {
    v21 = (uint64_t)v23;
    object = xpc_null_create();
  }
  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v22 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA351E4(a1, v21, &object, v22);
  xpc_release(object);
  object = 0;
  xpc_release(v11);
}

void sub_24BA503A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;

  xpc_release(object);
  xpc_release(v26);
  _Unwind_Resume(a1);
}

_QWORD *sub_24BA5040C@<X0>(int *a1@<X1>, uint64_t *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x60uLL);
  result = sub_24BA5046C(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_24BA50458(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_24BA5046C(_QWORD *a1, int *a2, uint64_t *a3)
{
  char v5;

  a1[2] = 0;
  *a1 = &unk_251CCD0F0;
  a1[1] = 0;
  sub_24BA50540((uint64_t)&v5, (uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_24BA504BC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_24BA504D0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_251CCD0F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_24BA504E4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_251CCD0F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t sub_24BA50518(uint64_t a1)
{
  char v2;

  return sub_24BA505B8((uint64_t)&v2, (uint64_t *)(a1 + 24));
}

uint64_t sub_24BA50540(uint64_t a1, uint64_t a2, int *a3, uint64_t *a4)
{
  int v5;
  uint64_t v6;
  double v7;
  uint64_t result;
  uint64_t v9;

  v5 = *a3;
  v6 = *a4;
  *a4 = 0;
  v9 = v6;
  v7 = WISMetadataLoader::WISMetadataLoader(a2, v5, &v9);
  result = v9;
  v9 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)result + 8))(result, v7);
  return result;
}

void sub_24BA50594(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  _Unwind_Resume(exception_object);
}

uint64_t sub_24BA505B8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  sub_24BA387C4((uint64_t)(a2 + 4));
  sub_24BA3B304((uint64_t)(a2 + 2));
  result = *a2;
  *a2 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

_QWORD *sub_24BA50604@<X0>(unsigned int *a1@<X1>, uint64_t *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x90uLL);
  result = sub_24BA50664(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_24BA50650(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_24BA50664(_QWORD *a1, unsigned int *a2, uint64_t *a3)
{
  char v5;

  a1[2] = 0;
  *a1 = &unk_251CCD140;
  a1[1] = 0;
  sub_24BA50720((uint64_t)&v5, (uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_24BA506B4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_24BA506C8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_251CCD140;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_24BA506DC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_251CCD140;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t sub_24BA50710(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t sub_24BA50720(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v5 = *a3;
  v6 = *a4;
  *a4 = 0;
  v8 = v6;
  LazyMetadataLoader::LazyMetadataLoader(a2, v5, &v8);
  result = v8;
  v8 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void sub_24BA50774(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  _Unwind_Resume(exception_object);
}

xpc_object_t sub_24BA50798(void **a1, void **a2, xpc_object_t *a3)
{
  void *v6;
  void *v7;
  xpc_object_t v8;
  xpc_object_t v10[2];
  xpc_object_t v11[2];
  xpc_object_t object[3];

  v6 = *a1;
  v11[0] = v6;
  if (v6)
    xpc_retain(v6);
  else
    v11[0] = xpc_null_create();
  v11[1] = a1[1];
  v7 = *a2;
  v10[0] = v7;
  if (v7)
    xpc_retain(v7);
  else
    v10[0] = xpc_null_create();
  v10[1] = a2[1];
  sub_24BA50984(v11, v10, a3, object);
  v8 = object[2];
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v10[0]);
  v10[0] = 0;
  xpc_release(v11[0]);
  return v8;
}

void sub_24BA5085C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, xpc_object_t a12)
{
  xpc_release(object);
  xpc_release(a12);
  _Unwind_Resume(a1);
}

xpc_object_t sub_24BA5088C@<X0>(int64_t value@<X1>, _QWORD *a2@<X8>)
{
  xpc_object_t result;

  result = xpc_int64_create(value);
  *a2 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a2 = result;
  }
  return result;
}

xpc_object_t sub_24BA508C8@<X0>(_QWORD *a1@<X8>, double a2@<D0>)
{
  xpc_object_t result;

  result = xpc_double_create(a2);
  *a1 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a1 = result;
  }
  return result;
}

xpc_object_t sub_24BA50900@<X0>(_QWORD *a1@<X8>, float a2@<S0>)
{
  xpc_object_t result;

  result = xpc_double_create(a2);
  *a1 = result;
  if (!result)
  {
    result = xpc_null_create();
    *a1 = result;
  }
  return result;
}

void **sub_24BA5093C(void **a1, void **a2, void *a3)
{
  void *v5;

  v5 = *a2;
  *a1 = *a2;
  if (v5)
    xpc_retain(v5);
  else
    *a1 = xpc_null_create();
  a1[1] = a3;
  return a1;
}

void sub_24BA50984(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, _QWORD *a4@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v9[2];

  v9[0] = *a1;
  *a1 = xpc_null_create();
  v9[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  sub_24BA50A4C(v9, object, a3, a4);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9[0]);
}

void sub_24BA50A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
  xpc_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

void sub_24BA50A4C(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, _QWORD *a4@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v9[2];

  v9[0] = *a1;
  *a1 = xpc_null_create();
  v9[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  sub_24BA50B14(v9, object, a3, a4);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9[0]);
}

void sub_24BA50AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
  xpc_release(object);
  xpc_release(a11);
  _Unwind_Resume(a1);
}

void sub_24BA50B14(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, _QWORD *a4@<X8>)
{
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11[2];
  xpc_object_t v12[2];
  _QWORD v13[2];
  xpc_object_t object[2];
  xpc_object_t v15[2];
  xpc_object_t v16[3];
  xpc_object_t v17[2];
  xpc_object_t v18[2];
  xpc_object_t v19[2];
  xpc_object_t v20;
  void *v21;

  v8 = *a1;
  v18[0] = v8;
  if (v8)
    xpc_retain(v8);
  else
    v18[0] = xpc_null_create();
  v18[1] = a1[1];
  v17[0] = *a2;
  *a2 = xpc_null_create();
  v17[1] = a2[1];
  sub_24BA50D40((uint64_t)v18, (uint64_t)v17, v19);
  xpc_release(v17[0]);
  v17[0] = 0;
  xpc_release(v18[0]);
  v18[0] = 0;
  v15[0] = v19[0];
  v19[0] = xpc_null_create();
  v15[1] = v19[1];
  object[0] = v20;
  v20 = xpc_null_create();
  object[1] = v21;
  sub_24BA50E4C((uint64_t)v15, object, a3, v16);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v15[0]);
  v15[0] = 0;
  v12[0] = *a1;
  *a1 = xpc_null_create();
  v12[1] = a1[1];
  v11[0] = v16[0];
  v16[0] = xpc_null_create();
  v11[1] = v16[1];
  sub_24BA50F08(v12, v11, v13);
  v9 = v16[2];
  *a4 = v13[0];
  v10 = xpc_null_create();
  v13[0] = v10;
  a4[1] = v13[1];
  a4[2] = v9;
  xpc_release(v10);
  v13[0] = 0;
  xpc_release(v11[0]);
  v11[0] = 0;
  xpc_release(v12[0]);
  v12[0] = 0;
  xpc_release(v16[0]);
  xpc_release(v20);
  v20 = 0;
  xpc_release(v19[0]);
}

void sub_24BA50CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, xpc_object_t object, uint64_t a17, xpc_object_t a18)
{
  uint64_t v18;

  xpc_release(object);
  xpc_release(a18);
  sub_24BA50FA0((xpc_object_t *)(v18 - 64));
  _Unwind_Resume(a1);
}

void sub_24BA50D40(uint64_t a1@<X0>, uint64_t a2@<X1>, xpc_object_t *a3@<X8>)
{
  void *v6;
  void *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  void *v10;
  void *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t object[2];
  xpc_object_t v15[2];

  v6 = *(void **)a1;
  *(_QWORD *)a1 = xpc_null_create();
  v7 = *(void **)(a1 + 8);
  if (v6)
  {
    xpc_retain(v6);
    v8 = v6;
  }
  else
  {
    v8 = xpc_null_create();
  }
  v15[0] = v8;
  v9 = xpc_null_create();
  v15[1] = v7;
  xpc_release(v9);
  v10 = *(void **)a2;
  *(_QWORD *)a2 = xpc_null_create();
  v11 = *(void **)(a2 + 8);
  if (v10)
  {
    xpc_retain(v10);
    v12 = v10;
  }
  else
  {
    v12 = xpc_null_create();
  }
  object[0] = v12;
  v13 = xpc_null_create();
  object[1] = v11;
  xpc_release(v13);
  sub_24BA50FE0(a3, v15, object);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v10);
  xpc_release(v15[0]);
  v15[0] = 0;
  xpc_release(v6);
}

xpc_object_t *sub_24BA50E4C@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X2>, xpc_object_t *a3@<X3>, xpc_object_t *a4@<X8>)
{
  uint64_t i;
  _QWORD v10[2];
  xpc_object_t value;
  xpc_object_t *v12;

  v12 = a3;
  for (i = *(_QWORD *)(a1 + 8); i != a2[1] || *(_QWORD *)a1 != *a2; *(_QWORD *)(a1 + 8) = i)
  {
    v10[0] = a1;
    v10[1] = i;
    sub_24BA51044((uint64_t)v10, &value);
    xpc_array_append_value(*a3, value);
    xpc_release(value);
    i = *(_QWORD *)(a1 + 8) + 1;
  }
  return sub_24BA51088(a4, (xpc_object_t *)a1, (xpc_object_t *)&v12);
}

void sub_24BA50EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void sub_24BA50F08(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, _QWORD *a3@<X8>)
{
  xpc_object_t object[2];
  xpc_object_t v7[2];

  v7[0] = *a1;
  *a1 = xpc_null_create();
  v7[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  sub_24BA510DC(v7, object, a3);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v7[0]);
}

xpc_object_t *sub_24BA50FA0(xpc_object_t *a1)
{
  xpc_release(a1[2]);
  a1[2] = 0;
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

xpc_object_t *sub_24BA50FE0(xpc_object_t *a1, xpc_object_t *a2, xpc_object_t *a3)
{
  xpc_object_t v6;

  *a1 = *a2;
  *a2 = xpc_null_create();
  v6 = *a3;
  a1[1] = a2[1];
  a1[2] = v6;
  *a3 = xpc_null_create();
  a1[3] = a3[1];
  return a1;
}

xpc_object_t sub_24BA51044@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t value;
  xpc_object_t result;

  value = xpc_array_get_value(**(xpc_object_t **)a1, *(_QWORD *)(a1 + 8));
  *a2 = value;
  if (value)
    return xpc_retain(value);
  result = xpc_null_create();
  *a2 = result;
  return result;
}

xpc_object_t *sub_24BA51088(xpc_object_t *a1, xpc_object_t *a2, xpc_object_t *a3)
{
  *a1 = *a2;
  *a2 = xpc_null_create();
  a1[1] = a2[1];
  a1[2] = *a3;
  return a1;
}

void sub_24BA510DC(void **a1@<X0>, xpc_object_t *a2@<X1>, _QWORD *a3@<X8>)
{
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;

  v5 = *a1;
  *a1 = xpc_null_create();
  v6 = *a2;
  *a2 = xpc_null_create();
  v7 = a2[1];
  *a3 = v6;
  v8 = xpc_null_create();
  a3[1] = v7;
  xpc_release(v8);
  xpc_release(v5);
}

double WISMetadataLoader::WISMetadataLoader(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v3;
  double result;

  v3 = *a3;
  *a3 = 0;
  *(_QWORD *)a1 = v3;
  *(_DWORD *)(a1 + 8) = a2;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_DWORD *)(a1 + 64) = 1065353216;
  return result;
}

{
  uint64_t v3;
  double result;

  v3 = *a3;
  *a3 = 0;
  *(_QWORD *)a1 = v3;
  *(_DWORD *)(a1 + 8) = a2;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_DWORD *)(a1 + 64) = 1065353216;
  return result;
}

uint64_t sub_24BA511B4(uint64_t a1, __int128 *a2)
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

double WISMetadataLoader::loadDeviceConfigMetadata@<D0>(WISMetadataLoader *this@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)this + 24))(&v4);
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t WISMetadataLoader::getComponentsAvailable(WISMetadataLoader *this)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)this + 40))(*(_QWORD *)this, *((unsigned int *)this + 2));
}

uint64_t WISMetadataLoader::getMetricIndex(WISMetadataLoader *this)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)this + 48))(*(_QWORD *)this);
}

uint64_t sub_24BA51280()
{
  return 0;
}

uint64_t *sMetricToJsonTransform@<X0>(wis *this@<X1>, unsigned __int8 *a2@<X2>, uint64_t *result@<X0>, uint64_t a4@<X8>)
{
  int v5;
  uint64_t *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD v17[3];
  int v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int128 v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  uint64_t v35;

  if (this && (v5 = (int)a2, a2))
  {
    v7 = result;
    v26[0] = 0;
    v26[1] = 0;
    v27 = 0;
    wis::GetProtobufTag((uint64_t)this, a2, v26);
    v17[0] = 0;
    v17[1] = (char *)this + v26[0];
    v17[2] = (char *)this + v26[0] + v5 - LODWORD(v26[0]);
    v18 = v5 - LODWORD(v26[0]);
    v19 = 0;
    v20 = 0;
    v21 = v5 - LODWORD(v26[0]);
    v22 = xmmword_24BA5DBB0;
    v23 = *MEMORY[0x24BEDD6F0];
    v24 = 0;
    v25 = 0;
    sub_24BA42608(a4, 0, 0, 0, 1);
    v8 = (std::__shared_weak_count *)v7[1];
    v30 = *v7;
    v31 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v32 = a4;
    MetricFileMetadataHelper::MetricFileMetadataHelper((uint64_t)&v33, &v30, v27);
    v11 = v31;
    if (v31)
    {
      v12 = (unint64_t *)&v31->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    while (!(_BYTE)v20)
    {
      v28 = 0uLL;
      v29 = 0xFFFFFFFFLL;
      sub_24BA516CC((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v17, &v28, &v32);
    }
    sub_24BA387C4((uint64_t)&v35);
    v14 = v34;
    if (v34)
    {
      v15 = (unint64_t *)&v34->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    return (uint64_t *)MEMORY[0x24BD2C524](v17);
  }
  else
  {
    *(_BYTE *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
  }
  return result;
}

void sub_24BA5143C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  char ***v25;

  sub_24BA3B304((uint64_t)&a25);
  sub_24BA3C92C(v25 + 1, *(unsigned __int8 *)v25);
  MEMORY[0x24BD2C524](&a9);
  _Unwind_Resume(a1);
}

uint64_t sConvertTriggerToJson@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  __n128 v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD v16[3];
  int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int128 v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  __n128 v25;
  uint64_t v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  uint64_t v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;

  if (a2 && a3)
  {
    v5 = (uint64_t *)result;
    v16[0] = 0;
    v16[1] = a2;
    v16[2] = a2 + (int)a3;
    v17 = a3;
    v18 = 0;
    v19 = 0;
    v20 = a3;
    v21 = xmmword_24BA5DBB0;
    v22 = *MEMORY[0x24BEDD6F0];
    v23 = 0;
    v24 = 0;
    sub_24BA42608(a4, 0, 0, 0, 1);
    v6 = (std::__shared_weak_count *)v5[1];
    v27 = *v5;
    v28 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v29 = a4;
    v9 = MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)&v30, &v27);
    v10 = v28;
    if (v28)
    {
      v11 = (unint64_t *)&v28->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v10->__on_zero_shared)(v10, v9);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    while (!(_BYTE)v19)
    {
      v25 = 0uLL;
      v26 = 0xFFFFFFFFLL;
      sub_24BA516CC((wireless_diagnostics::google::protobuf::io::CodedInputStream *)v16, &v25, &v29);
    }
    sub_24BA387C4((uint64_t)&v32);
    v13 = v31;
    if (v31)
    {
      v14 = (unint64_t *)&v31->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    return MEMORY[0x24BD2C524](v16);
  }
  else
  {
    *(_BYTE *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
  }
  return result;
}

void sub_24BA51600(_Unwind_Exception *a1, uint64_t a2, ...)
{
  char ***v2;
  uint64_t v4;
  va_list va;
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
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  sub_24BA3B304((uint64_t)va1);
  sub_24BA3C92C(v2 + 1, *(unsigned __int8 *)v2);
  MEMORY[0x24BD2C524]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t sCreateWISMetadataLoaderForJsonConversion@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  v4 = 1;
  sCreateBestChoiceMetadataLoaderDelegate(&v3);
  sub_24BA5040C(&v4, &v3, a1);
  result = v3;
  v3 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

void sub_24BA516A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    (*(void (**)(uint64_t))(*(_QWORD *)a9 + 8))(a9);
  _Unwind_Resume(exception_object);
}

void sub_24BA516CC(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, __n128 *a2, uint64_t *a3)
{
  unsigned __int8 *v6;
  uint64_t TagFallback;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 v10;
  uint64_t BuiltinType;
  int v12;
  uint64_t DecodingType;
  char *v14;
  void *exception;
  unsigned __int8 *v16;
  int WireTypeForType;
  int v18;
  char **v19;
  char **v20;
  char **v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char **v27;
  char *v28;
  unint64_t *v29;
  char *v30;
  char Varint64Fallback;
  char LittleEndian32Fallback;
  char *v33;
  double *i;
  double *v35;
  double v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  unsigned int v41;
  unint64_t v42;
  float v43;
  char *v44;
  char ***v45;
  double v46;
  _BOOL8 v47;
  char *v48;
  int v49;
  int v50;
  char *v51;
  _QWORD *v52;
  int v53;
  int v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  void *v59;
  float *j;
  float *v61;
  float v62;
  uint64_t v63;
  int v64;
  char Raw;
  void *v66;
  int v67;
  BOOL v68;
  int v69;
  char **v70;
  uint64_t v71;
  char v72;
  _QWORD *v73;
  int v74;
  char **v75;
  uint64_t v76;
  char v77;
  _QWORD *v78;
  int v79;
  char **v80;
  int v81;
  void *v82;
  uint64_t *v83;
  int UnpackedType;
  unsigned int v85;
  __int128 v86;
  uint64_t v87;
  __n128 v88;
  unint64_t v89;
  __n128 v90;
  unint64_t v91;
  __n128 v92;
  unint64_t v93;
  void *__p;
  char **v95;
  unint64_t v96;
  wireless_diagnostics::google::protobuf::io::CodedInputStream *v97;
  int v98;
  unsigned int v99;
  __int128 v100;
  uint64_t v101;
  __n128 v102;
  unint64_t v103;
  __int128 v104;
  uint64_t v105;
  __n128 v106;
  unint64_t v107;
  __n128 v108;
  unint64_t v109;
  double v110;
  unsigned int v111[4];
  unint64_t v112;
  unsigned int v113[4];
  int64_t v114;
  unint64_t v115;
  char **v116;
  unsigned int v117[4];
  unint64_t v118;

  v6 = (unsigned __int8 *)*((_QWORD *)this + 1);
  if ((unint64_t)v6 >= *((_QWORD *)this + 2) || (char)*v6 < 0)
  {
    TagFallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
    *((_DWORD *)this + 8) = TagFallback;
    if ((_DWORD)TagFallback)
      goto LABEL_4;
LABEL_10:
    if (*((_BYTE *)this + 36))
      return;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
    goto LABEL_199;
  }
  TagFallback = *v6;
  *((_DWORD *)this + 8) = TagFallback;
  *((_QWORD *)this + 1) = v6 + 1;
  if (!(_DWORD)TagFallback)
    goto LABEL_10;
LABEL_4:
  v8 = wis::reflect::decodeTag((wis::reflect *)TagFallback);
  v9 = HIDWORD(v8);
  v10 = v8;
  v102 = *a2;
  v103 = a2[1].n128_u64[0];
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)(a3 + 1), &v102, HIDWORD(v8), (uint64_t)&v104);
  v100 = v104;
  v101 = v105;
  BuiltinType = MetadataHelper::getBuiltinType((uint64_t)(a3 + 1), (MetadataHandle *)&v100);
  v12 = BuiltinType;
  DecodingType = wis::reflect::getDecodingType(BuiltinType, v10);
  switch((int)DecodingType)
  {
    case 0:
      switch(v10)
      {
        case 0u:
          *(_QWORD *)v117 = 0;
          if (sub_24BA3E798(this, (unint64_t *)v117))
            goto LABEL_178;
          goto LABEL_151;
        case 1u:
          *(_QWORD *)v117 = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v117) & 1) != 0)goto LABEL_151;
LABEL_178:
          v70 = *(char ***)v117;
          goto LABEL_181;
        case 2u:
          v113[0] = 0;
          if ((sub_24BA3E7C8(this, v113) & 1) == 0)
            goto LABEL_151;
          sub_24BA38754(v117, v113[0]);
          Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v117);
          if ((Raw & 1) != 0)
            sub_24BA53038(a3, *(_BYTE **)v117, *(_QWORD *)&v117[2] - *(_QWORD *)v117, v9);
          goto LABEL_169;
        case 5u:
          v117[0] = 0;
          if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v117))goto LABEL_151;
          v70 = (char **)v117[0];
LABEL_181:
          sub_24BA52F80(a3, v70, v9);
          break;
        default:
          goto LABEL_151;
      }
      return;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      v115 = 0;
      switch(v10)
      {
        case 0u:
          v14 = (char *)*((_QWORD *)this + 1);
          if ((unint64_t)v14 < *((_QWORD *)this + 2) && (*v14 & 0x80000000) == 0)
          {
            v115 = *v14;
            *((_QWORD *)this + 1) = v14 + 1;
LABEL_84:
            v42 = v115;
            switch(v12)
            {
              case 1:
              case 15:
                v46 = wis::protobuf::NumberConverter<(wis::reflect::Type)1>::decode(v115);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                v44 = sub_24BA39290((uint64_t)a3, (MetadataHandle *)v117, v9);
                v45 = (char ***)&v106.n128_u64[1];
                v106.n128_u8[0] = 7;
                v106.n128_f64[1] = v46;
                if (v12 == 11)
                {
                  *(__n128 *)v111 = v108;
                  v112 = v109;
                  sub_24BA3938C((uint64_t)a3, (MetadataHandle *)v111, v9, (unint64_t)v46, v113);
                  v76 = HIBYTE(v114);
                  v77 = HIBYTE(v114);
                  if (v114 < 0)
                    v76 = *(_QWORD *)&v113[2];
                  if (v76)
                  {
                    v78 = operator new(0x18uLL);
                    *(_OWORD *)v78 = *(_OWORD *)v113;
                    v78[2] = v114;
                    v114 = 0;
                    memset(v113, 0, sizeof(v113));
                    v79 = v106.n128_u8[0];
                    v106.n128_u8[0] = 3;
                    LOBYTE(__p) = v79;
                    v80 = (char **)v106.n128_u64[1];
                    v106.n128_u64[1] = (unint64_t)v78;
                    v95 = v80;
                    sub_24BA3C92C(&v95, v79);
                    v77 = HIBYTE(v114);
                  }
                  if (v77 < 0)
                    operator delete(*(void **)v113);
                }
                else if (v12 == 12)
                {
                  v106.n128_u8[0] = 4;
                  LOBYTE(v111[0]) = 7;
                  v106.n128_u64[1] = v46 != 0.0;
                  *(double *)&v111[2] = v46;
                  sub_24BA3C92C((char ***)&v111[2], 7);
                }
                goto LABEL_195;
              case 2:
              case 16:
                v43 = wis::protobuf::NumberConverter<(wis::reflect::Type)2>::decode(v115);
                v108 = *a2;
                v109 = a2[1].n128_u64[0];
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                v44 = sub_24BA39290((uint64_t)a3, (MetadataHandle *)v117, v9);
                v45 = (char ***)&v106.n128_u64[1];
                v106.n128_u8[0] = 7;
                v106.n128_f64[1] = v43;
                if (v12 == 11)
                {
                  *(__n128 *)v111 = v108;
                  v112 = v109;
                  sub_24BA3938C((uint64_t)a3, (MetadataHandle *)v111, v9, (unint64_t)v43, v113);
                  v71 = HIBYTE(v114);
                  v72 = HIBYTE(v114);
                  if (v114 < 0)
                    v71 = *(_QWORD *)&v113[2];
                  if (v71)
                  {
                    v73 = operator new(0x18uLL);
                    *(_OWORD *)v73 = *(_OWORD *)v113;
                    v73[2] = v114;
                    v114 = 0;
                    memset(v113, 0, sizeof(v113));
                    v74 = v106.n128_u8[0];
                    v106.n128_u8[0] = 3;
                    LOBYTE(__p) = v74;
                    v75 = (char **)v106.n128_u64[1];
                    v106.n128_u64[1] = (unint64_t)v73;
                    v95 = v75;
                    sub_24BA3C92C(&v95, v74);
                    v72 = HIBYTE(v114);
                  }
                  if (v72 < 0)
                    operator delete(*(void **)v113);
                }
                else if (v12 == 12)
                {
                  v106.n128_u8[0] = 4;
                  LOBYTE(v111[0]) = 7;
                  v106.n128_u64[1] = v43 != 0.0;
                  *(double *)&v111[2] = v43;
                  sub_24BA3C92C((char ***)&v111[2], 7);
                }
LABEL_195:
                *(__n128 *)v113 = v108;
                v114 = v109;
                v81 = sub_24BA39310((uint64_t)a3, (MetadataHandle *)v113, v9);
                sub_24BA544B0(a3, v44, (uint64_t)&v106, v81);
                v50 = v106.n128_u8[0];
                goto LABEL_196;
              case 3:
              case 11:
              case 17:
              case 25:
                goto LABEL_95;
              case 4:
              case 10:
              case 18:
              case 24:
                *(_QWORD *)v113 = v115;
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA53160(a3, (char ***)v113, (__int128 *)v117, v9, v12);
                return;
              case 5:
              case 19:
                v42 = wis::protobuf::NumberConverter<(wis::reflect::Type)5>::decode(v115);
LABEL_95:
                *(_QWORD *)v113 = v42;
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA53510(a3, (char ***)v113, (__int128 *)v117, v9, v12);
                return;
              case 6:
              case 20:
                v113[0] = v115;
                goto LABEL_97;
              case 7:
              case 9:
              case 21:
              case 23:
                v113[0] = v115;
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA53338(a3, v113, (__int128 *)v117, v9, v12);
                return;
              case 8:
              case 22:
                v113[0] = wis::protobuf::NumberConverter<(wis::reflect::Type)8>::decode(v115);
LABEL_97:
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                sub_24BA536E8(a3, (int *)v113, (__int128 *)v117, v9, v12);
                return;
              case 12:
              case 26:
                v47 = v115 != 0;
                *(__n128 *)v111 = *a2;
                v112 = a2[1].n128_u64[0];
                *(__n128 *)v117 = *a2;
                v118 = a2[1].n128_u64[0];
                v48 = sub_24BA39290((uint64_t)a3, (MetadataHandle *)v117, v9);
                v45 = (char ***)&v108.n128_u64[1];
                v108.n128_u8[0] = 4;
                v108.n128_u64[1] = v47;
                if (v12 == 12)
                {
                  v106.n128_u8[0] = 4;
                  v106.n128_u64[1] = v47;
                  sub_24BA3C92C((char ***)&v106.n128_u64[1], 4);
                }
                *(_OWORD *)v113 = *(_OWORD *)v111;
                v114 = v112;
                v49 = sub_24BA39310((uint64_t)a3, (MetadataHandle *)v113, v9);
                sub_24BA544B0(a3, v48, (uint64_t)&v108, v49);
                v50 = v108.n128_u8[0];
LABEL_196:
                sub_24BA3C92C(v45, v50);
                return;
              default:
                exception = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x24BD2C6B0](exception, "This should never happen, no matter what the input!");
                goto LABEL_199;
            }
          }
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, &v115) & 1) != 0)
            goto LABEL_84;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_103;
          return;
        case 1u:
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, &v115) & 1) != 0)
            goto LABEL_84;
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_103;
          return;
        case 2u:
          if ((_DWORD)v9 || !*((_BYTE *)this + 36))
            goto LABEL_103;
          return;
        case 5u:
          v117[0] = 0;
          if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v117) & 1) != 0)
          {
            v115 = v117[0];
            goto LABEL_84;
          }
          if (!(_DWORD)v9 && *((_BYTE *)this + 36))
            return;
LABEL_103:
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
          break;
        default:
          goto LABEL_84;
      }
      goto LABEL_199;
    case 13:
      v113[0] = 0;
      v38 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v38 >= *((_QWORD *)this + 2) || *v38 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v113))goto LABEL_151;
      }
      else
      {
        v113[0] = *v38;
        *((_QWORD *)this + 1) = v38 + 1;
      }
      memset(v117, 0, sizeof(v117));
      v118 = 0;
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString();
      if ((Raw & 1) != 0)
      {
        v92 = *a2;
        v93 = a2[1].n128_u64[0];
        sub_24BA52C08(a3, (uint64_t)v117, (__int128 *)&v92, v9);
      }
      if ((SHIBYTE(v118) & 0x80000000) == 0)
        goto LABEL_172;
      v66 = *(void **)v117;
      goto LABEL_171;
    case 14:
      v113[0] = 0;
      v40 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v40 >= *((_QWORD *)this + 2) || *v40 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v113))goto LABEL_151;
        v41 = v113[0];
      }
      else
      {
        v41 = *v40;
        v113[0] = v41;
        *((_QWORD *)this + 1) = v40 + 1;
      }
      sub_24BA38754(v117, v41);
      Raw = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(this, *(void **)v117);
      if ((Raw & 1) != 0)
      {
        v90 = *a2;
        v91 = a2[1].n128_u64[0];
        sub_24BA52CF4(a3, (uint64_t)v117, (__int128 *)&v90, v9);
      }
LABEL_169:
      v66 = *(void **)v117;
      if (*(_QWORD *)v117)
      {
        *(_QWORD *)&v117[2] = *(_QWORD *)v117;
LABEL_171:
        operator delete(v66);
      }
LABEL_172:
      if ((Raw & 1) != 0)
        return;
      goto LABEL_151;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
      v99 = 0;
      v16 = (unsigned __int8 *)*((_QWORD *)this + 1);
      if ((unint64_t)v16 >= *((_QWORD *)this + 2) || (char)*v16 < 0)
      {
        if ((wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, &v99) & 1) != 0)
          goto LABEL_16;
LABEL_151:
        if (!(_DWORD)v9 && *((_BYTE *)this + 36))
          return;
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24BD2C6B0](exception, "Parsing failed in metric");
LABEL_199:
        __cxa_throw(exception, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
      v99 = *v16;
      *((_QWORD *)this + 1) = v16 + 1;
LABEL_16:
      v83 = a3;
      v85 = v9;
      UnpackedType = wis::reflect::getUnpackedType(DecodingType);
      WireTypeForType = wis::reflect::getWireTypeForType(UnpackedType);
      v97 = this;
      v98 = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      __p = 0;
      v95 = 0;
      v96 = 0;
      while (1)
      {
        v18 = wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
        if (v18 < 1)
          break;
        v19 = v95;
        if ((unint64_t)v95 >= v96)
        {
          v21 = (char **)__p;
          v22 = ((char *)v95 - (_BYTE *)__p) >> 3;
          v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61)
            sub_24BA39774();
          v24 = v96 - (_QWORD)__p;
          if ((uint64_t)(v96 - (_QWORD)__p) >> 2 > v23)
            v23 = v24 >> 2;
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
            v25 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v25 = v23;
          if (v25)
          {
            v26 = (char *)sub_24BA39788((uint64_t)&v96, v25);
            v21 = (char **)__p;
            v19 = v95;
          }
          else
          {
            v26 = 0;
          }
          v27 = (char **)&v26[8 * v22];
          *v27 = 0;
          v20 = v27 + 1;
          while (v19 != v21)
          {
            v28 = *--v19;
            *--v27 = v28;
          }
          __p = v27;
          v95 = v20;
          v96 = (unint64_t)&v26[8 * v25];
          if (v21)
            operator delete(v21);
        }
        else
        {
          *v95 = 0;
          v20 = v19 + 1;
        }
        v95 = v20;
        switch(WireTypeForType)
        {
          case 0:
            v29 = (unint64_t *)(v20 - 1);
            v30 = (char *)*((_QWORD *)this + 1);
            if ((unint64_t)v30 >= *((_QWORD *)this + 2) || *v30 < 0)
            {
              Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, v29);
LABEL_42:
              if ((Varint64Fallback & 1) == 0)
                goto LABEL_148;
            }
            else
            {
              *v29 = *v30;
              *((_QWORD *)this + 1) = v30 + 1;
            }
            break;
          case 1:
            Varint64Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, (unint64_t *)v20 - 1);
            goto LABEL_42;
          case 2:
            goto LABEL_148;
          case 5:
            v117[0] = 0;
            LittleEndian32Fallback = wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, v117);
            *(v95 - 1) = (char *)v117[0];
            if ((LittleEndian32Fallback & 1) == 0)
              goto LABEL_148;
            continue;
          default:
            continue;
        }
      }
      switch((int)DecodingType)
      {
        case 15:
          sub_24BA400A0((uint64_t *)&__p, &v108);
          v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v117 = *a2;
          v118 = a2[1].n128_u64[0];
          v33 = sub_24BA39290((uint64_t)v83, (MetadataHandle *)v117, v85);
          v116 = 0;
          LOBYTE(v115) = 2;
          *(_QWORD *)v113 = 0;
          *(_QWORD *)v111 = 0;
          v116 = (char **)sub_24BA42860((uint64_t *)v113, (uint64_t *)v111);
          v35 = (double *)v108.n128_u64[1];
          for (i = (double *)v108.n128_u64[0]; i != v35; ++i)
          {
            v36 = *i;
            v110 = *i;
            if (UnpackedType == 11)
            {
              *(__n128 *)v111 = v106;
              v112 = v107;
              sub_24BA3938C((uint64_t)v83, (MetadataHandle *)v111, v85, (unint64_t)v36, v113);
              v37 = HIBYTE(v114);
              if (v114 < 0)
                v37 = *(_QWORD *)&v113[2];
              if (v37)
                sub_24BA44D0C((uint64_t)&v115, (uint64_t)v113);
              else
                sub_24BA4531C((uint64_t)&v115, (uint64_t *)&v110);
              if (SHIBYTE(v114) < 0)
                operator delete(*(void **)v113);
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v113[0]) = v36 != 0.0;
              sub_24BA44BC4((uint64_t)&v115, (unsigned __int8 *)v113);
            }
            else
            {
              sub_24BA4531C((uint64_t)&v115, (uint64_t *)&v110);
            }
          }
          goto LABEL_154;
        case 16:
          sub_24BA4036C((uint64_t *)&__p, &v108);
          v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v117 = *a2;
          v118 = a2[1].n128_u64[0];
          v33 = sub_24BA39290((uint64_t)v83, (MetadataHandle *)v117, v85);
          v116 = 0;
          LOBYTE(v115) = 2;
          *(_QWORD *)v113 = 0;
          *(_QWORD *)v111 = 0;
          v116 = (char **)sub_24BA42860((uint64_t *)v113, (uint64_t *)v111);
          v61 = (float *)v108.n128_u64[1];
          for (j = (float *)v108.n128_u64[0]; j != v61; ++j)
          {
            v62 = *j;
            *(float *)&v110 = *j;
            if (UnpackedType == 11)
            {
              *(__n128 *)v111 = v106;
              v112 = v107;
              sub_24BA3938C((uint64_t)v83, (MetadataHandle *)v111, v85, (unint64_t)v62, v113);
              v63 = HIBYTE(v114);
              if (v114 < 0)
                v63 = *(_QWORD *)&v113[2];
              if (v63)
                sub_24BA44D0C((uint64_t)&v115, (uint64_t)v113);
              else
                sub_24BA457BC((uint64_t)&v115, (float *)&v110);
              if (SHIBYTE(v114) < 0)
                operator delete(*(void **)v113);
            }
            else if (UnpackedType == 12)
            {
              LOBYTE(v113[0]) = v62 != 0.0;
              sub_24BA44BC4((uint64_t)&v115, (unsigned __int8 *)v113);
            }
            else
            {
              sub_24BA457BC((uint64_t)&v115, (float *)&v110);
            }
          }
LABEL_154:
          *(__n128 *)v113 = v106;
          v114 = v107;
          v64 = sub_24BA39310((uint64_t)v83, (MetadataHandle *)v113, v85);
          sub_24BA544B0(v83, v33, (uint64_t)&v115, v64);
          sub_24BA3C92C(&v116, v115);
          v59 = (void *)v108.n128_u64[0];
          if (!v108.n128_u64[0])
            break;
          v108.n128_u64[1] = v108.n128_u64[0];
          goto LABEL_147;
        case 17:
        case 25:
          sub_24BA40020((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA53C50(v83, (uint64_t **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 18:
        case 24:
          sub_24BA40020((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA538C0(v83, (uint64_t **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 19:
          sub_24BA40638((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA53C50(v83, (uint64_t **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 20:
          sub_24BA402EC((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA53E18(v83, (int **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 21:
        case 23:
          sub_24BA402EC((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA53A88(v83, (unsigned int **)v117, (__int128 *)v113, v85, UnpackedType);
          goto LABEL_145;
        case 22:
          sub_24BA40884((uint64_t *)&__p, v117);
          *(__n128 *)v113 = *a2;
          v114 = a2[1].n128_i64[0];
          sub_24BA53E18(v83, (int **)v117, (__int128 *)v113, v85, UnpackedType);
LABEL_145:
          v59 = *(void **)v117;
          if (!*(_QWORD *)v117)
            break;
          *(_QWORD *)&v117[2] = *(_QWORD *)v117;
LABEL_147:
          operator delete(v59);
          break;
        case 26:
          sub_24BA403F0((uint64_t)&__p, &v108);
          v106 = *a2;
          v107 = a2[1].n128_u64[0];
          *(__n128 *)v117 = *a2;
          v118 = a2[1].n128_u64[0];
          v51 = sub_24BA39290((uint64_t)v83, (MetadataHandle *)v117, v85);
          v116 = 0;
          LOBYTE(v115) = 2;
          *(_QWORD *)v113 = 0;
          *(_QWORD *)v111 = 0;
          v116 = (char **)sub_24BA42860((uint64_t *)v113, (uint64_t *)v111);
          v52 = (_QWORD *)v108.n128_u64[0];
          v53 = v108.n128_u8[8] & 0x3F;
          if (v108.n128_u64[1] > 0x3F || (v108.n128_u8[8] & 0x3F) != 0)
          {
            v54 = 0;
            v55 = (_QWORD *)(v108.n128_u64[0] + 8 * (v108.n128_u64[1] >> 6));
            do
            {
              v56 = *v52 & (1 << v54);
              LOBYTE(v110) = v56 != 0;
              if (UnpackedType == 11)
              {
                *(__n128 *)v111 = v106;
                v112 = v107;
                sub_24BA3938C((uint64_t)v83, (MetadataHandle *)v111, v85, v56 != 0, v113);
                v57 = HIBYTE(v114);
                if (v114 < 0)
                  v57 = *(_QWORD *)&v113[2];
                if (v57)
                  sub_24BA44D0C((uint64_t)&v115, (uint64_t)v113);
                else
                  sub_24BA45A14((uint64_t)&v115, (unsigned __int8 *)&v110);
                if (SHIBYTE(v114) < 0)
                  operator delete(*(void **)v113);
              }
              else if (UnpackedType == 12)
              {
                LOBYTE(v113[0]) = v56 != 0;
                sub_24BA44BC4((uint64_t)&v115, (unsigned __int8 *)v113);
              }
              else
              {
                sub_24BA45A14((uint64_t)&v115, (unsigned __int8 *)&v110);
              }
              v52 += v54 == 63;
              if (v54 == 63)
                v54 = 0;
              else
                ++v54;
            }
            while (v52 != v55 || v54 != v53);
          }
          *(__n128 *)v113 = v106;
          v114 = v107;
          v58 = sub_24BA39310((uint64_t)v83, (MetadataHandle *)v113, v85);
          sub_24BA544B0(v83, v51, (uint64_t)&v115, v58);
          sub_24BA3C92C(&v116, v115);
          v59 = (void *)v108.n128_u64[0];
          if (!v108.n128_u64[0])
            break;
          goto LABEL_147;
        default:
          v82 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24BD2C6B0](v82, "This should never happen, no matter what the input!");
          __cxa_throw(v82, MEMORY[0x24BEDB730], (void (*)(void *))MEMORY[0x24BEDAB60]);
      }
LABEL_148:
      if (__p)
      {
        v95 = (char **)__p;
        operator delete(__p);
      }
      wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(v97);
      LODWORD(v9) = v85;
      if (v18 > 0)
        goto LABEL_151;
      return;
    case 27:
      v111[0] = 0;
      v39 = (char *)*((_QWORD *)this + 1);
      if ((unint64_t)v39 >= *((_QWORD *)this + 2) || *v39 < 0)
      {
        if (!wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, v111))goto LABEL_151;
      }
      else
      {
        v111[0] = *v39;
        *((_QWORD *)this + 1) = v39 + 1;
      }
      *(_QWORD *)v117 = this;
      v117[2] = wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this);
      ++*((_DWORD *)this + 14);
      *(_QWORD *)v113 = this;
      v88 = *a2;
      v89 = a2[1].n128_u64[0];
      v86 = v104;
      v87 = v105;
      sub_24BA52E1C(a3, this, (__int128 *)&v88, v9, &v86);
      sub_24BA52F48((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v113);
      v67 = *((_DWORD *)this + 14);
      v68 = __OFSUB__(v67, 1);
      v69 = v67 - 1;
      if (v69 < 0 == v68)
        *((_DWORD *)this + 14) = v69;
      sub_24BA38A94((wireless_diagnostics::google::protobuf::io::CodedInputStream **)v117);
      return;
    default:
      goto LABEL_151;
  }
}

void sub_24BA52A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,unsigned __int8 a45)
{
  int v45;
  char ***v46;
  uint64_t v47;

  if (v45 < 0)
    operator delete(*(void **)(v47 - 192));
  sub_24BA3C92C(v46, a45);
  _Unwind_Resume(a1);
}

void sub_24BA52C08(uint64_t *a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v8;
  char **v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  unsigned __int8 v13[8];
  char **v14;
  __int128 v15;
  uint64_t v16;

  v15 = *a3;
  v16 = *((_QWORD *)a3 + 2);
  v8 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v15, a4);
  v13[0] = 3;
  v9 = (char **)operator new(0x18uLL);
  *(_OWORD *)v9 = *(_OWORD *)a2;
  v9[2] = *(char **)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v14 = v9;
  v11 = *a3;
  v12 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_24BA544B0(a1, v8, (uint64_t)v13, v10);
  sub_24BA3C92C(&v14, v13[0]);
}

void sub_24BA52CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13)
{
  char ***v13;

  sub_24BA3C92C(v13, a13);
  _Unwind_Resume(a1);
}

void sub_24BA52CF4(uint64_t *a1, uint64_t a2, __int128 *a3, unsigned int a4)
{
  char *v8;
  char **v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  std::string __p;
  unsigned __int8 v14[8];
  char **v15;
  __int128 v16;
  uint64_t v17;

  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v8 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA4F208(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2, *(_BYTE **)a2, &__p);
  v15 = 0;
  v14[0] = 3;
  v9 = (char **)operator new(0x18uLL);
  *(std::string *)v9 = __p;
  v15 = v9;
  v11 = *a3;
  v12 = *((_QWORD *)a3 + 2);
  memset(&__p, 0, sizeof(__p));
  v10 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v11, a4);
  sub_24BA544B0(a1, v8, (uint64_t)v14, v10);
  sub_24BA3C92C(&v15, v14[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_24BA52DEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA52E1C(uint64_t *a1, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, __int128 *a3, unsigned int a4, __int128 *a5)
{
  char *v10;
  uint64_t v11;
  int v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _BYTE v17[8];
  char **v18;
  __int128 v19;
  uint64_t v20;

  v19 = *a3;
  v20 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v19, a4);
  v11 = *a1;
  sub_24BA42608((uint64_t)v17, 0, 0, 0, 1);
  *a1 = (uint64_t)v17;
  while ((int)wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(a2) >= 1)
  {
    v15 = *a5;
    v16 = *((_QWORD *)a5 + 2);
    sub_24BA516CC(a2);
  }
  *a1 = v11;
  v13 = *a3;
  v14 = *((_QWORD *)a3 + 2);
  v12 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v13, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v17, v12);
  sub_24BA3C92C(&v18, v17[0]);
}

void sub_24BA52F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, ...)
{
  va_list va;

  va_start(va, a10);
  sub_24BA3C92C((char ***)va, a10);
  _Unwind_Resume(a1);
}

wireless_diagnostics::google::protobuf::io::CodedInputStream **sub_24BA52F48(wireless_diagnostics::google::protobuf::io::CodedInputStream **a1)
{
  wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(*a1);
  wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(*a1);
  return a1;
}

void sub_24BA52F80(uint64_t *a1, char **a2, unsigned int __val)
{
  std::string *v5;
  unsigned __int8 v6[8];
  char **v7;
  std::string v8;

  std::to_string(&v8, __val);
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v8;
  else
    v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
  v6[0] = 6;
  v7 = a2;
  sub_24BA544B0(a1, (char *)v5, (uint64_t)v6, 1);
  sub_24BA3C92C(&v7, v6[0]);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
}

void sub_24BA53010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned __int8 a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  char ***v17;

  sub_24BA3C92C(v17, a10);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_24BA53038(uint64_t *a1, _BYTE *a2, unint64_t a3, unsigned int __val)
{
  std::string *v7;
  char **v8;
  std::string __p;
  unsigned __int8 v10[8];
  char **v11;
  std::string v12;

  v7 = &v12;
  std::to_string(&v12, __val);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v7 = (std::string *)v12.__r_.__value_.__r.__words[0];
  sub_24BA4F208(a3, a2, &__p);
  v11 = 0;
  v10[0] = 3;
  v8 = (char **)operator new(0x18uLL);
  *(std::string *)v8 = __p;
  memset(&__p, 0, sizeof(__p));
  v11 = v8;
  sub_24BA544B0(a1, (char *)v7, (uint64_t)v10, 1);
  sub_24BA3C92C(&v11, v10[0]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
}

void sub_24BA53118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, unsigned __int8 a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  char ***v22;

  sub_24BA3C92C(v22, a15);
  if (a14 < 0)
    operator delete(__p);
  if (a22 < 0)
    operator delete(a17);
  _Unwind_Resume(a1);
}

void sub_24BA53160(uint64_t *a1, char ***a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  char **v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 6;
  v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 6;
    v29 = v11 != 0;
    v27 = v11;
    sub_24BA3C92C(&v27, 6);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA53308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA53338(uint64_t *a1, unsigned int *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 6;
  v29 = v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 6;
    v29 = (_DWORD)v11 != 0;
    v27 = (char **)v11;
    sub_24BA3C92C(&v27, 6);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA534E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA53510(uint64_t *a1, char ***a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  char **v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 5;
  v29 = (unint64_t)v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, (uint64_t)v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 5;
    v29 = v11 != 0;
    v27 = v11;
    sub_24BA3C92C(&v27, 5);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA536B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA536E8(uint64_t *a1, int *a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t v11;
  void *v12;
  char v13;
  _QWORD *v14;
  int v15;
  char **v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  char **v21;
  __int128 v22;
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  char v26;
  char **v27;
  unsigned __int8 v28[8];
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  v30 = *a3;
  v31 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v30, a4);
  v11 = *a2;
  v28[0] = 5;
  v29 = v11;
  if (a5 == 11)
  {
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v22, a4, v11, __p);
    v12 = (void *)HIBYTE(v25);
    v13 = HIBYTE(v25);
    if (v25 < 0)
      v12 = __p[1];
    if (v12)
    {
      v14 = operator new(0x18uLL);
      *(_OWORD *)v14 = *(_OWORD *)__p;
      v14[2] = v25;
      __p[1] = 0;
      v25 = 0;
      __p[0] = 0;
      v15 = v28[0];
      v28[0] = 3;
      v20 = v15;
      v16 = (char **)v29;
      v29 = (unint64_t)v14;
      v21 = v16;
      sub_24BA3C92C(&v21, v15);
      v13 = HIBYTE(v25);
    }
    if (v13 < 0)
      operator delete(__p[0]);
  }
  else if (a5 == 12)
  {
    v28[0] = 4;
    v26 = 5;
    v29 = (_DWORD)v11 != 0;
    v27 = (char **)v11;
    sub_24BA3C92C(&v27, 5);
  }
  v18 = *a3;
  v19 = *((_QWORD *)a3 + 2);
  v17 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v18, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v28, v17);
  sub_24BA3C92C((char ***)&v29, v28[0]);
}

void sub_24BA53890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,unsigned __int8 a23)
{
  char ***v23;
  int v24;

  if (v24 < 0)
    operator delete(__p);
  sub_24BA3C92C(v23, a23);
  _Unwind_Resume(a1);
}

void sub_24BA538C0(uint64_t *a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  uint64_t v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA44EBC((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA44EBC((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA53A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

void sub_24BA53A88(uint64_t *a1, unsigned int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  unsigned int v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA4556C((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = (_DWORD)v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA4556C((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA53C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

void sub_24BA53C50(uint64_t *a1, uint64_t **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  uint64_t v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA45C64((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA45C64((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA53DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

void sub_24BA53E18(uint64_t *a1, int **a2, __int128 *a3, unsigned int a4, int a5)
{
  char *v10;
  int *v11;
  int *v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  void *__p[2];
  unsigned __int8 v21;
  int v22;
  char v23[8];
  char **v24;
  __int128 v25;
  uint64_t v26;

  v25 = *a3;
  v26 = *((_QWORD *)a3 + 2);
  v10 = sub_24BA39290((uint64_t)a1, (MetadataHandle *)&v25, a4);
  sub_24BA42608((uint64_t)v23, 0, 0, 0, 2);
  v12 = *a2;
  v11 = a2[1];
  while (v12 != v11)
  {
    v13 = *v12;
    v22 = *v12;
    if (a5 == 11)
    {
      v18 = *a3;
      v19 = *((_QWORD *)a3 + 2);
      sub_24BA3938C((uint64_t)a1, (MetadataHandle *)&v18, a4, v13, __p);
      v14 = v21;
      if ((v21 & 0x80u) != 0)
        v14 = (unint64_t)__p[1];
      if (v14)
        sub_24BA44D0C((uint64_t)v23, (uint64_t)__p);
      else
        sub_24BA45EB4((uint64_t)v23, &v22);
      if ((char)v21 < 0)
        operator delete(__p[0]);
    }
    else if (a5 == 12)
    {
      LOBYTE(__p[0]) = (_DWORD)v13 != 0;
      sub_24BA44BC4((uint64_t)v23, (unsigned __int8 *)__p);
    }
    else
    {
      sub_24BA45EB4((uint64_t)v23, &v22);
    }
    ++v12;
  }
  v16 = *a3;
  v17 = *((_QWORD *)a3 + 2);
  v15 = sub_24BA39310((uint64_t)a1, (MetadataHandle *)&v16, a4);
  sub_24BA544B0(a1, v10, (uint64_t)v23, v15);
  sub_24BA3C92C(&v24, v23[0]);
}

void sub_24BA53FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,unsigned __int8 a24,char **a25)
{
  sub_24BA3C92C(&a25, a24);
  _Unwind_Resume(a1);
}

uint64_t MetadataHandle::getMessage(MetadataHandle *this)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)this;
  if (*(_QWORD *)this
    && (v2 = *((_QWORD *)this + 1), v4 = v1 + 32, v3 = *(_QWORD *)(v1 + 32), v2 < (*(_QWORD *)(v4 + 8) - v3) >> 3))
  {
    return *(_QWORD *)(v3 + 8 * v2);
  }
  else
  {
    return 0;
  }
}

_QWORD *MetadataHelper::MetadataHelper(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  result[2] = 0;
  result[3] = 0;
  result[4] = 0xFFFFFFFFLL;
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  result[2] = 0;
  result[3] = 0;
  result[4] = 0xFFFFFFFFLL;
  return result;
}

uint64_t MetadataHelper::getField(uint64_t a1, MetadataHandle *a2)
{
  return MetadataHandle::getField(a2);
}

double MetricFileMetadataHelper::getHandleForMetric@<D0>(__n128 *this@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  double result;
  __n128 v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;

  v5 = this[5];
  v6 = this[6].n128_u64[0];
  MetricFileMetadataHelper::resolveSubfieldInMetricHandle((MetricFileMetadataHelper *)this, &v5, a2, (uint64_t)&v7);
  result = *(double *)&v7;
  *(_OWORD *)a3 = v7;
  *(_QWORD *)(a3 + 16) = v8;
  return result;
}

void sub_24BA5416C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_24BA387C4(v1 + 40);
  sub_24BA3B304(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_24BA54188(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

uint64_t MetricFileMetadataHelper::getComponentIds(WISMetadataLoader **this)
{
  return WISMetadataLoader::getComponentsAvailable(*this);
}

void MetricFileMetadataHelper::getMetricsInComponent(MetricFileMetadataHelper *this@<X0>, unsigned int a2@<W1>, char **a3@<X8>)
{
  uint64_t MetadataForComponent;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  int v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  int v20;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  MetadataForComponent = MetricFileMetadataHelper::getMetadataForComponent(this, a2);
  if (MetadataForComponent)
  {
    v5 = *(uint64_t **)(MetadataForComponent + 32);
    if (v5 != *(uint64_t **)(MetadataForComponent + 40))
    {
      v6 = *v5;
      v7 = *(_QWORD *)(v6 + 8);
      v8 = *(_QWORD *)(v6 + 16);
      if (v7 != v8)
      {
        v9 = 0;
        v10 = a3 + 2;
        do
        {
          if ((*(_WORD *)(*(_QWORD *)v7 + 52) & 0x40) != 0)
          {
            v11 = *(_DWORD *)(*(_QWORD *)v7 + 40);
            if ((unint64_t)v9 >= *v10)
            {
              v13 = *a3;
              v14 = (v9 - *a3) >> 2;
              v15 = v14 + 1;
              if ((unint64_t)(v14 + 1) >> 62)
                sub_24BA39774();
              v16 = *v10 - (_QWORD)v13;
              if (v16 >> 1 > v15)
                v15 = v16 >> 1;
              if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
                v17 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v17 = v15;
              if (v17)
              {
                v18 = (char *)sub_24BA40BCC((uint64_t)(a3 + 2), v17);
                v13 = *a3;
                v9 = a3[1];
              }
              else
              {
                v18 = 0;
              }
              v19 = &v18[4 * v14];
              *(_DWORD *)v19 = v11;
              v12 = v19 + 4;
              while (v9 != v13)
              {
                v20 = *((_DWORD *)v9 - 1);
                v9 -= 4;
                *((_DWORD *)v19 - 1) = v20;
                v19 -= 4;
              }
              *a3 = v19;
              a3[1] = v12;
              a3[2] = &v18[4 * v17];
              if (v13)
                operator delete(v13);
            }
            else
            {
              *(_DWORD *)v9 = v11;
              v12 = v9 + 4;
            }
            a3[1] = v12;
            v9 = v12;
          }
          v7 += 8;
        }
        while (v7 != v8);
      }
    }
  }
}

void sub_24BA54340(_Unwind_Exception *exception_object)
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

uint64_t DeviceConfigMetadataHelper::DeviceConfigMetadataHelper(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0xFFFFFFFFLL;
  WISMetadataLoader::loadDeviceConfigMetadata(*(WISMetadataLoader **)a2, (_OWORD *)(a1 + 40));
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a1 + 40);
  return a1;
}

void sub_24BA543C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_24BA3B304(v1);
  _Unwind_Resume(a1);
}

double DeviceConfigMetadataHelper::getSubfieldType@<D0>(uint64_t a1@<X0>, __n128 *a2@<X1>, unsigned int a3@<W2>, __n128 *a4@<X8>)
{
  double result;
  __n128 v6;
  unint64_t v7;
  __n128 v8;
  unint64_t v9;

  v6 = *a2;
  v7 = a2[1].n128_u64[0];
  MetadataHelper::resolveSubfieldInHandle(a1, &v6, a3, &v8);
  result = v8.n128_f64[0];
  *a4 = v8;
  a4[1].n128_u64[0] = v9;
  return result;
}

void sub_24BA5442C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251CCD200;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_24BA5443C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251CCD200;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24BD2C8A8);
}

void sub_24BA5446C(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_24BA3B304((uint64_t)v2 + 24);
    operator delete(v2);
  }
}

void sub_24BA544B0(uint64_t *a1, char *a2, uint64_t a3, int a4)
{
  char *v5;
  int v6;
  char **v7;
  uint64_t *v8;
  unsigned __int8 *v9;
  uint64_t v10;
  char *v11;
  int v12;
  char **v13;
  unsigned __int8 v14;
  char **v15;
  char v16[8];
  char **v17;
  unsigned __int8 *v18[5];
  _QWORD v19[5];
  _BYTE v20[48];

  if (a4)
  {
    v5 = sub_24BA545FC(*a1, a2);
    if (!*v5)
    {
      sub_24BA42608((uint64_t)v16, 0, 0, 0, 2);
      v6 = *v5;
      *v5 = v16[0];
      v16[0] = v6;
      v7 = (char **)*((_QWORD *)v5 + 1);
      *((_QWORD *)v5 + 1) = v17;
      v17 = v7;
      sub_24BA3C92C(&v17, v6);
    }
    if (*(_BYTE *)a3 == 2)
    {
      v8 = *(uint64_t **)(a3 + 8);
      v10 = *v8;
      v9 = (unsigned __int8 *)v8[1];
      v19[2] = v10;
      v19[3] = 0;
      v19[4] = 0x8000000000000000;
      v18[2] = v9;
      v18[3] = 0;
      v18[4] = (unsigned __int8 *)0x8000000000000000;
      v19[0] = a3;
      v19[1] = 0;
      v18[0] = (unsigned __int8 *)a3;
      v18[1] = 0;
      sub_24BA54A98((uint64_t)v19, v18, (uint64_t)v5, (uint64_t)v20);
    }
    else
    {
      sub_24BA547A8((uint64_t)v5, (char *)a3);
    }
  }
  else
  {
    v14 = *(_BYTE *)a3;
    v15 = *(char ***)(a3 + 8);
    *(_BYTE *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v11 = sub_24BA545FC(*a1, a2);
    v12 = *v11;
    *v11 = v14;
    v13 = (char **)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v15;
    v15 = v13;
    sub_24BA3C92C(&v15, v12);
  }
}

void sub_24BA545E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  char ***v10;

  sub_24BA3C92C(v10, a10);
  _Unwind_Resume(a1);
}

char *sub_24BA545FC(uint64_t a1, char *a2)
{
  _QWORD *v4;
  uint64_t **v5;
  _OWORD *v6;
  _QWORD *exception;
  char *v9;
  std::string *v10;
  __int128 v11;
  std::string v12;
  void *__p[2];
  std::string::size_type v14;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 1)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v9 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v12, v9);
      v10 = std::string::insert(&v12, 0, "cannot use operator[] with a string argument with ");
      v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
      v14 = v10->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v11;
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(305, (uint64_t)__p, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
  }
  else
  {
    *(_BYTE *)a1 = 1;
    v4 = operator new(0x18uLL);
    v4[2] = 0;
    v4[1] = 0;
    *v4 = v4 + 1;
    *(_QWORD *)(a1 + 8) = v4;
  }
  v5 = *(uint64_t ***)(a1 + 8);
  sub_24BA3C010(__p, a2);
  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
  v6 = sub_24BA549FC(v5, (const void **)__p, (uint64_t)&unk_24BA5E9E4, &v12);
  if (SHIBYTE(v14) < 0)
    operator delete(__p[0]);
  return (char *)v6 + 56;
}

void sub_24BA54730(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_24BA547A8(uint64_t a1, char *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use emplace_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(311, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA550B0(v4, a2);
}

void sub_24BA54890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA548F0(uint64_t *a1, char *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(result - 8);
  if (v7 >= v6)
  {
    v9 = (uint64_t)(v7 - *a1) >> 4;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60)
      sub_24BA39774();
    v11 = v5 - *a1;
    if (v11 >> 3 > v10)
      v10 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    v16[4] = result;
    v13 = (char *)sub_24BA3CE98(result, v12);
    v14 = &v13[16 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[16 * v15];
    *v14 = *a2;
    *((_QWORD *)v14 + 1) = *((_QWORD *)a2 + 1);
    *a2 = 0;
    *((_QWORD *)a2 + 1) = 0;
    v16[2] = v14 + 16;
    sub_24BA3CE24(a1, v16);
    v8 = a1[1];
    result = sub_24BA3CFD4((uint64_t)v16);
  }
  else
  {
    *(_BYTE *)v7 = *a2;
    *(_QWORD *)(v7 + 8) = *((_QWORD *)a2 + 1);
    *a2 = 0;
    *((_QWORD *)a2 + 1) = 0;
    v8 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v8;
  return result;
}

void sub_24BA549E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

_OWORD *sub_24BA549FC(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v6 = (void **)sub_24BA42EE0((uint64_t)a1, &v12, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x48uLL);
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    *((_BYTE *)v7 + 56) = 0;
    *((_QWORD *)v7 + 8) = 0;
    sub_24BA42E8C(a1, v12, v8, (uint64_t *)v7);
  }
  return v7;
}

__n128 sub_24BA54A98@<Q0>(uint64_t a1@<X1>, unsigned __int8 **a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  char *v8;
  __n128 result;

  while (!sub_24BA54B90((unsigned __int8 **)a1, a2))
  {
    v8 = sub_24BA54E30(a1);
    sub_24BA54F68(a3, v8);
    sub_24BA54B20((unsigned __int8 **)a1);
  }
  *(_QWORD *)a4 = *(_QWORD *)a1;
  *(_OWORD *)(a4 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(a4 + 24) = result;
  *(_QWORD *)(a4 + 40) = a3;
  return result;
}

unsigned __int8 **sub_24BA54B20(unsigned __int8 **result)
{
  int v1;
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  BOOL v5;

  v1 = **result;
  if (v1 == 2)
  {
    result[2] += 16;
  }
  else if (v1 == 1)
  {
    v2 = result[1];
    v3 = (unsigned __int8 *)*((_QWORD *)v2 + 1);
    if (v3)
    {
      do
      {
        v4 = v3;
        v3 = *(unsigned __int8 **)v3;
      }
      while (v3);
    }
    else
    {
      do
      {
        v4 = (unsigned __int8 *)*((_QWORD *)v2 + 2);
        v5 = *(_QWORD *)v4 == (_QWORD)v2;
        v2 = v4;
      }
      while (!v5);
    }
    result[1] = v4;
  }
  else
  {
    ++result[4];
  }
  return result;
}

BOOL sub_24BA54B90(unsigned __int8 **a1, unsigned __int8 **a2)
{
  int v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  _QWORD *exception;
  _QWORD v7[3];

  if (*a1 != *a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    sub_24BA3C010(v7, "cannot compare iterators of different containers");
    sub_24BA54C8C(212, (uint64_t)v7, exception);
    __cxa_throw(exception, (struct type_info *)&unk_251CCD240, (void (*)(void *))sub_24BA54DBC);
  }
  v2 = **a1;
  if (v2 == 2)
  {
    v3 = a1[2];
    v4 = a2[2];
  }
  else if (v2 == 1)
  {
    v3 = a1[1];
    v4 = a2[1];
  }
  else
  {
    v3 = a1[4];
    v4 = a2[4];
  }
  return v3 == v4;
}

void sub_24BA54C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void sub_24BA54C8C(int a1@<W0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  int v6;
  const std::string::value_type *v7;
  std::string::size_type v8;
  std::string *v9;
  __int128 v10;
  void **v11;
  void *__p;
  char v13;
  std::string v14;
  void *v15[2];
  int64_t v16;

  sub_24BA3C010(&__p, "invalid_iterator");
  sub_24BA3BE90(a1, &v14);
  v6 = *(char *)(a2 + 23);
  if (v6 >= 0)
    v7 = (const std::string::value_type *)a2;
  else
    v7 = *(const std::string::value_type **)a2;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(a2 + 23);
  else
    v8 = *(_QWORD *)(a2 + 8);
  v9 = std::string::append(&v14, v7, v8);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16 = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)v15 = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  if (v13 < 0)
    operator delete(__p);
  if (v16 >= 0)
    v11 = v15;
  else
    v11 = (void **)v15[0];
  sub_24BA3C0C0((uint64_t)a3, a1, (uint64_t)v11);
  *a3 = &off_251CCD268;
  if (SHIBYTE(v16) < 0)
    operator delete(v15[0]);
}

void sub_24BA54D74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA54DBC(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&off_251CCC0D0;
  MEMORY[0x24BD2C6BC](&a1[2]);
  std::exception::~exception(a1);
}

void sub_24BA54DEC(std::exception *a1)
{
  a1->__vftable = (std::exception_vtbl *)&off_251CCC0D0;
  MEMORY[0x24BD2C6BC](&a1[2]);
  std::exception::~exception(a1);
  JUMPOUT(0x24BD2C8A8);
}

_BYTE *sub_24BA54E30(uint64_t a1)
{
  _BYTE *result;
  int v3;
  _QWORD *v4;
  _QWORD *exception;
  _QWORD v6[3];

  result = *(_BYTE **)a1;
  v3 = *result;
  if (v3 == 1)
    return (_BYTE *)(*(_QWORD *)(a1 + 8) + 56);
  if (v3 == 2)
    return *(_BYTE **)(a1 + 16);
  if (!*result)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    sub_24BA3C010(v6, "cannot get value");
    sub_24BA54C8C(214, (uint64_t)v6, exception);
    __cxa_throw(exception, (struct type_info *)&unk_251CCD240, (void (*)(void *))sub_24BA54DBC);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = __cxa_allocate_exception(0x20uLL);
    sub_24BA3C010(v6, "cannot get value");
    sub_24BA54C8C(214, (uint64_t)v6, v4);
    __cxa_throw(v4, (struct type_info *)&unk_251CCD240, (void (*)(void *))sub_24BA54DBC);
  }
  return result;
}

void sub_24BA54F30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  char v16;

  if (a15 < 0)
    operator delete(__p);
  if ((v16 & 1) != 0)
    __cxa_free_exception(v15);
  _Unwind_Resume(exception_object);
}

uint64_t sub_24BA54F68(uint64_t a1, char *a2)
{
  uint64_t *v4;
  _QWORD *exception;
  char *v7;
  std::string *v8;
  __int128 v9;
  std::string v10;
  __int128 v11;
  std::string::size_type v12;

  if (*(_BYTE *)a1)
  {
    if (*(_BYTE *)a1 != 2)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v7 = (char *)sub_24BA429EC((char *)a1);
      sub_24BA3C010(&v10, v7);
      v8 = std::string::insert(&v10, 0, "cannot use push_back() with ");
      v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
      v12 = v8->__r_.__value_.__r.__words[2];
      v11 = v9;
      v8->__r_.__value_.__l.__size_ = 0;
      v8->__r_.__value_.__r.__words[2] = 0;
      v8->__r_.__value_.__r.__words[0] = 0;
      sub_24BA3BD30(308, (uint64_t)&v11, exception);
      __cxa_throw(exception, (struct type_info *)&unk_251CCC080, (void (*)(void *))sub_24BA3BE60);
    }
    v4 = *(uint64_t **)(a1 + 8);
  }
  else
  {
    *(_BYTE *)a1 = 2;
    v4 = (uint64_t *)operator new(0x18uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)(a1 + 8) = v4;
  }
  return sub_24BA548F0(v4, a2);
}

void sub_24BA55050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v22 & 1) == 0)
LABEL_8:
      _Unwind_Resume(a1);
  }
  else if (!v22)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v21);
  goto LABEL_8;
}

uint64_t sub_24BA550B0(uint64_t *a1, char *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD v17[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v9 = (uint64_t)(v7 - *a1) >> 4;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60)
      sub_24BA39774();
    v11 = v5 - *a1;
    if (v11 >> 3 > v10)
      v10 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    v17[4] = v4;
    v13 = (char *)sub_24BA3CE98(v4, v12);
    v14 = &v13[16 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[16 * v15];
    *v14 = *a2;
    *((_QWORD *)v14 + 1) = *((_QWORD *)a2 + 1);
    *a2 = 0;
    *((_QWORD *)a2 + 1) = 0;
    v17[2] = v14 + 16;
    sub_24BA3CE24(a1, v17);
    v8 = a1[1];
    sub_24BA3CFD4((uint64_t)v17);
  }
  else
  {
    *(_BYTE *)v7 = *a2;
    *(_QWORD *)(v7 + 8) = *((_QWORD *)a2 + 1);
    *a2 = 0;
    *((_QWORD *)a2 + 1) = 0;
    v8 = v7 + 16;
    a1[1] = v7 + 16;
  }
  a1[1] = v8;
  return v8 - 16;
}

void sub_24BA551AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA3CFD4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24BA551C0(uint64_t *a1)
{
  *a1 = (uint64_t)&off_251CCD290;
  sub_24BA4CDEC(a1 + 1, 0);
  WISMetadataLoaderDelegate::~WISMetadataLoaderDelegate((WISMetadataLoaderDelegate *)a1);
}

void sub_24BA551F4(uint64_t *a1)
{
  *a1 = (uint64_t)&off_251CCD290;
  sub_24BA4CDEC(a1 + 1, 0);
  WISMetadataLoaderDelegate::~WISMetadataLoaderDelegate((WISMetadataLoaderDelegate *)a1);
}

void sub_24BA55228(uint64_t *a1)
{
  *a1 = (uint64_t)&off_251CCD290;
  sub_24BA4CDEC(a1 + 1, 0);
  WISMetadataLoaderDelegate::~WISMetadataLoaderDelegate((WISMetadataLoaderDelegate *)a1);
  JUMPOUT(0x24BD2C8A8);
}

void sub_24BA55270(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  _DWORD *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;

  v7 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  v9 = (unsigned __int8 *)sub_24BA552B8(v7, v8, a2, a3);
  sub_24BA38380(v9, v10, a4);
}

char *sub_24BA552B8(_DWORD *a1, uint64_t a2, int a3, int a4)
{
  char *v4;
  unint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  BOOL v14;
  char v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;

  if (!a1 || a2 < 4)
    return 0;
  v4 = 0;
  if (a2 != 4 && *a1 == 1296324417)
  {
    v6 = (unint64_t)a1 + a2;
    v7 = (unsigned __int16 *)(a1 + 1);
    while (1)
    {
      v8 = v7[1];
      v9 = v7 + 2;
      v10 = (unint64_t)&v7[2 * v8 + 2] <= v6 ? *v7 | (unint64_t)(v8 << 32) : 0;
      if (!(_WORD)v10)
        break;
      v11 = HIDWORD(v10);
      v12 = (unsigned __int16)v10;
      v13 = v10 & 0xFFFE;
      if (a3)
        v14 = 1;
      else
        v14 = (unsigned __int16)v10 == 2;
      v15 = !v14;
      if (v13 == 2 && (v15 & 1) == 0)
      {
        v16 = a3 != 1 || v12 == 3;
        v17 = !v16;
        if (v11 >= 3 && !v17)
        {
          v18 = *((unsigned int *)v7 + 3);
          v4 = (char *)a1 + *((unsigned int *)v7 + 2);
          if ((unint64_t)&v4[v18] <= v6 && *v9 == a4)
            return v4;
        }
      }
      v7 = (unsigned __int16 *)&v9[v11];
      if ((unint64_t)v7 >= v6)
        return 0;
    }
    return 0;
  }
  return v4;
}

void sub_24BA55398(uint64_t a1@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  _DWORD *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;

  v5 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  v7 = (unsigned __int8 *)sub_24BA552B8(v5, v6, a2, 0);
  sub_24BA38380(v7, v8, a3);
}

void sub_24BA553D4(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;

  v3 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  v5 = (unsigned __int8 *)sub_24BA55404(v3, v4);
  sub_24BA38380(v5, v6, a2);
}

char *sub_24BA55404(_DWORD *a1, uint64_t a2)
{
  char *v2;
  unint64_t v4;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;

  if (!a1 || a2 < 4)
    return 0;
  v2 = 0;
  if (a2 != 4 && *a1 == 1296324417)
  {
    v4 = (unint64_t)a1 + a2;
    v5 = (unsigned __int16 *)(a1 + 1);
    while (1)
    {
      v6 = v5[1];
      v7 = v5 + 2;
      v8 = *v5 | (unint64_t)(v6 << 32);
      if ((unint64_t)&v5[2 * v6 + 2] > v4)
        v8 = 0;
      if (!(_WORD)v8)
        break;
      if (v8 >> 33)
        v9 = (unsigned __int16)v8 == 5;
      else
        v9 = 0;
      if (v9)
      {
        v10 = *((unsigned int *)v5 + 2);
        v2 = (char *)a1 + *((unsigned int *)v5 + 1);
        if ((unint64_t)&v2[v10] <= v4)
          return v2;
      }
      v5 = (unsigned __int16 *)((char *)v7 + (v8 >> 30));
      if ((unint64_t)v5 >= v4)
        return 0;
    }
    return 0;
  }
  return v2;
}

void sub_24BA554B0(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;

  v3 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  v5 = (unsigned __int8 *)sub_24BA55578(v3, v4);
  sub_24BA554E0(v5, v6, a2);
}

void sub_24BA554E0(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;

  if (a1 && a2)
  {
    PB::Reader::Reader((PB::Reader *)&v5, a1);
    v4 = operator new(0x38uLL);
    v4[1] = 0;
    v4[2] = 0;
    *v4 = &off_251CCD310;
    *a3 = sub_24BA4C148(v4 + 3);
    a3[1] = v4;
    if (((*(uint64_t (**)(void))(v4[3] + 16))() & 1) == 0)
      sub_24BA558C4(a3);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_24BA55564(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_24BA3B304(v1);
  _Unwind_Resume(a1);
}

char *sub_24BA55578(_DWORD *a1, uint64_t a2)
{
  char *v2;
  unint64_t v4;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;

  if (!a1 || a2 < 4)
    return 0;
  v2 = 0;
  if (a2 != 4 && *a1 == 1296324417)
  {
    v4 = (unint64_t)a1 + a2;
    v5 = (unsigned __int16 *)(a1 + 1);
    while (1)
    {
      v6 = v5[1];
      v7 = v5 + 2;
      v8 = *v5 | (unint64_t)(v6 << 32);
      if ((unint64_t)&v5[2 * v6 + 2] > v4)
        v8 = 0;
      if (!(_WORD)v8)
        break;
      if (v8 >> 33)
        v9 = (unsigned __int16)v8 == 6;
      else
        v9 = 0;
      if (v9)
      {
        v10 = *((unsigned int *)v5 + 2);
        v2 = (char *)a1 + *((unsigned int *)v5 + 1);
        if ((unint64_t)&v2[v10] <= v4)
          return v2;
      }
      v5 = (unsigned __int16 *)((char *)v7 + (v8 >> 30));
      if ((unint64_t)v5 >= v4)
        return 0;
    }
    return 0;
  }
  return v2;
}

void sub_24BA55624(uint64_t a1@<X0>, int a2@<W1>, char **a3@<X8>)
{
  _DWORD *v5;
  uint64_t v6;
  _DWORD *v7;
  BOOL v8;
  char *v10;
  unint64_t v11;
  unsigned __int16 *v12;
  _QWORD *v13;
  uint64_t v14;
  int *v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  BOOL v20;
  char v21;
  BOOL v22;
  BOOL v23;
  int v24;
  char *v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  int v33;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v5 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  v7 = v5;
  if (v5)
    v8 = v6 < 4;
  else
    v8 = 1;
  if (!v8 && v6 != 4 && *v5 == 1296324417)
  {
    v10 = 0;
    v11 = (unint64_t)v5 + v6;
    v12 = (unsigned __int16 *)(v5 + 1);
    v13 = a3 + 2;
    do
    {
      v14 = v12[1];
      v15 = (int *)(v12 + 2);
      if ((unint64_t)&v12[2 * v14 + 2] <= v11)
        v16 = *v12 | (unint64_t)(v14 << 32);
      else
        v16 = 0;
      if (!(_WORD)v16)
        break;
      v17 = HIDWORD(v16);
      v18 = (unsigned __int16)v16;
      v19 = v16 & 0xFFFE;
      if (a2)
        v20 = 1;
      else
        v20 = (unsigned __int16)v16 == 2;
      v21 = !v20;
      if (v19 == 2 && (v21 & 1) == 0)
      {
        v22 = a2 != 1 || v18 == 3;
        v23 = !v22;
        if (v17 >= 3 && !v23)
        {
          if ((unint64_t)v7 + *((unsigned int *)v12 + 2) + *((unsigned int *)v12 + 3) <= v11)
            v24 = *v15;
          else
            v24 = 0;
          if ((unint64_t)v10 >= *v13)
          {
            v26 = *a3;
            v27 = (v10 - *a3) >> 2;
            v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 62)
              sub_24BA39774();
            v29 = *v13 - (_QWORD)v26;
            if (v29 >> 1 > v28)
              v28 = v29 >> 1;
            if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL)
              v30 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v30 = v28;
            if (v30)
            {
              v31 = (char *)sub_24BA40BCC((uint64_t)(a3 + 2), v30);
              v26 = *a3;
              v10 = a3[1];
            }
            else
            {
              v31 = 0;
            }
            v32 = &v31[4 * v27];
            *(_DWORD *)v32 = v24;
            v25 = v32 + 4;
            while (v10 != v26)
            {
              v33 = *((_DWORD *)v10 - 1);
              v10 -= 4;
              *((_DWORD *)v32 - 1) = v33;
              v32 -= 4;
            }
            *a3 = v32;
            a3[1] = v25;
            a3[2] = &v31[4 * v30];
            if (v26)
              operator delete(v26);
          }
          else
          {
            *(_DWORD *)v10 = v24;
            v25 = v10 + 4;
          }
          a3[1] = v25;
          v10 = v25;
        }
      }
      v12 = (unsigned __int16 *)&v15[v17];
    }
    while ((unint64_t)v12 < v11);
  }
}

void sub_24BA557FC(_Unwind_Exception *exception_object)
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

uint64_t sub_24BA55820(uint64_t a1)
{
  _QWORD *v1;
  uint64_t *v2;
  FILE **v3;
  uint64_t result;

  v2 = (uint64_t *)(a1 + 8);
  v1 = *(_QWORD **)(a1 + 8);
  if (!v1)
  {
    v3 = (FILE **)operator new();
    sub_24BA55AF0(v3, "/System/Library/PrivateFrameworks/WirelessInsights.framework/Support/AWDMetadata.bin");
    sub_24BA4CDEC(v2, (uint64_t)v3);
    v1 = (_QWORD *)*v2;
  }
  if (!*v1)
    return 0;
  result = v1[1];
  if (result == -1)
    return 0;
  return result;
}

void sub_24BA558A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24BD2C8A8](v1, 0x10A0C404E934A1DLL);
  _Unwind_Resume(a1);
}

void sub_24BA558C4(_QWORD *a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = (std::__shared_weak_count *)a1[1];
  *a1 = 0;
  a1[1] = 0;
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

_QWORD *sub_24BA55920@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  char *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unsigned int v19;
  char *v20;
  uint64_t v21;
  unsigned int *v22;

  *(_DWORD *)a3 = 0;
  *(_OWORD *)(a3 + 8) = 0u;
  v4 = a3 + 8;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_DWORD *)(a3 + 40) = 1065353216;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_DWORD *)(a3 + 80) = 1065353216;
  *(_QWORD *)(a3 + 88) = 0;
  *(_QWORD *)(a3 + 96) = 0;
  if (result)
  {
    if (a2 >= 4)
    {
      v5 = result;
      if (a2 != 4 && *(_DWORD *)result == 1296324417)
      {
        v6 = (unint64_t)result + a2;
        v7 = (unsigned int *)result + 1;
        do
        {
          v8 = *((unsigned __int16 *)v7 + 1);
          v9 = v7 + 1;
          v10 = *(unsigned __int16 *)v7 | (unint64_t)(v8 << 32);
          if ((unint64_t)&v7[v8 + 1] > v6)
            v10 = 0;
          if (!(_WORD)v10)
            break;
          v11 = HIDWORD(v10);
          if ((unsigned __int16)v10 - 2 < 2)
          {
            if (HIDWORD(v10) >= 3)
            {
              v13 = v7[3];
              v14 = (char *)v5 + v7[2];
              if ((unint64_t)&v14[v13] <= v6)
              {
                v15 = *v9;
                v20 = v14;
                v21 = v13;
                v19 = v15;
                v22 = &v19;
                if ((unsigned __int16)v10 == 2)
                  result = sub_24BA55BCC(v4, &v19, (uint64_t)&unk_24BA5E9E4, &v22);
                else
                  result = sub_24BA55BCC(a3 + 48, &v19, (uint64_t)&unk_24BA5E9E4, &v22);
                result[3] = v14;
                result[4] = v13;
              }
            }
          }
          else if ((unsigned __int16)v10 == 6)
          {
            if (HIDWORD(v10) >= 2)
            {
              v17 = v7[1];
              v16 = v7[2];
              v18 = (char *)v5 + v17;
              if ((unint64_t)&v18[v16] <= v6)
              {
                *(_QWORD *)(a3 + 88) = v18;
                *(_QWORD *)(a3 + 96) = v16;
                return result;
              }
            }
          }
          else if ((unsigned __int16)v10 == 1 && HIDWORD(v10) != 0)
          {
            *(_DWORD *)a3 = *v9;
          }
          v7 = &v9[v11];
        }
        while ((unint64_t)v7 < v6);
      }
    }
  }
  return result;
}

void sub_24BA55AD4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_24BA4CCF0(v2);
  sub_24BA4CCF0(v1);
  _Unwind_Resume(a1);
}

FILE **sub_24BA55AF0(FILE **a1, char *__filename)
{
  FILE *v3;
  int v4;
  int v5;
  size_t st_size;
  stat v8;

  *a1 = 0;
  a1[1] = (FILE *)-1;
  a1[2] = 0;
  v3 = fopen(__filename, "rb");
  *a1 = v3;
  if (v3)
  {
    v4 = fileno(v3);
    if ((v4 & 0x80000000) == 0)
    {
      v5 = v4;
      if (!fstat(v4, &v8))
      {
        st_size = v8.st_size;
        a1[2] = (FILE *)v8.st_size;
        a1[1] = (FILE *)mmap(0, st_size, 1, 1025, v5, 0);
      }
    }
  }
  return a1;
}

void sub_24BA55B7C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251CCD310;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_24BA55B8C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251CCD310;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t sub_24BA55BBC(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

_QWORD *sub_24BA55BCC(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

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
      v11 = *v10;
      if (*v10)
      {
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
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x28uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0;
  v11[4] = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    sub_24BA3814C(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_24BA55DDC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

const char *wis::asString(unsigned int a1)
{
  if (a1 > 2)
    return "???";
  else
    return off_251CCD360[(char)a1];
}

const char *wis::asString(wis *this)
{
  const char *v1;

  v1 = "???";
  if ((_DWORD)this == 1)
    v1 = "24h";
  if ((_DWORD)this == 2)
    return "1h";
  else
    return v1;
}

unint64_t wis::getWISTimestamp(wis *this)
{
  timeval v2;

  gettimeofday(&v2, 0);
  return 1000 * v2.tv_sec + v2.tv_usec / 0x3E8uLL;
}

unint64_t wis::timevalToTimestamp(wis *this, timeval *a2)
{
  return 1000 * *(_QWORD *)this + *((int *)this + 2) / 0x3E8uLL;
}

void *wis::tagSerializedProtobuf(int a1, uint64_t a2)
{
  int v3;
  char *v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  size_t v9;
  uint64_t v10;
  unsigned int v11;
  size_t v12;
  void *result;
  char v14;
  _BYTE v15[5];
  _BYTE __src[5];

  v3 = *(_DWORD *)(a2 + 8);
  v4 = *(char **)a2;
  v5 = v3 - (_DWORD)v4;
  v6 = (8 * a1) | 2;
  if (v6 < 0x80)
  {
    LODWORD(v7) = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      __src[v7++] = v6 | 0x80;
      v8 = v6 >> 14;
      v6 >>= 7;
    }
    while (v8);
  }
  v9 = (v7 + 1);
  __src[v7] = v6;
  if (v5 < 0x80)
  {
    LODWORD(v10) = 0;
  }
  else
  {
    v10 = 0;
    do
    {
      v15[v10++] = v5 | 0x80;
      v11 = v5 >> 14;
      v5 >>= 7;
    }
    while (v11);
  }
  v12 = (v10 + 1);
  v15[v10] = v5;
  v14 = 0;
  result = sub_24BA55FBC((char **)a2, v4, (v12 + v9), &v14);
  if ((_DWORD)v9)
    result = memcpy(*(void **)a2, __src, v9);
  if ((_DWORD)v12)
    return memcpy((void *)(*(_QWORD *)a2 + v9), v15, v12);
  return result;
}

char *sub_24BA55FBC(char **a1, char *__src, unint64_t a3, char *a4)
{
  char *v5;
  unint64_t v6;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  size_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  unint64_t v20;
  char *v21;
  char *v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char v35;
  char *v36;
  char *v37;

  if (!a3)
    return __src;
  v5 = a4;
  v6 = a3;
  v9 = a1[1];
  v8 = a1[2];
  if (v8 - v9 >= a3)
  {
    v16 = v9 - __src;
    v17 = a3 - (v9 - __src);
    if (a3 <= v9 - __src)
    {
      v18 = a1[1];
      v20 = a3;
      goto LABEL_17;
    }
    v18 = &__src[a3];
    v19 = a1[1];
    do
    {
      *v19++ = *a4;
      --v17;
    }
    while (v17);
    a1[1] = v18;
    if (v16)
    {
      v20 = v9 - __src;
LABEL_17:
      v21 = &__src[a3];
      v22 = v18;
      if (&v18[-a3] < v9)
      {
        if (a3 <= v16)
          v23 = v9 - __src;
        else
          v23 = a3;
        v24 = &__src[-a3];
        v25 = __src;
        v26 = __src;
        do
        {
          v25[v23] = v24[v23];
          ++v26;
          ++v24;
          ++v25;
        }
        while (&v26[v23 - (_QWORD)v9 - a3]);
        if (a3 > v16)
          v16 = a3;
        v22 = &v25[v16];
      }
      a1[1] = v22;
      if (v18 != v21)
        memmove(&__src[a3], __src, v18 - v21);
      if (__src <= v5)
      {
        if (a1[1] <= v5)
          v27 = 0;
        else
          v27 = v6;
        v5 += v27;
      }
      v28 = __src;
      do
      {
        *v28++ = *v5;
        --v20;
      }
      while (v20);
    }
    return __src;
  }
  v10 = *a1;
  v11 = v9 - *a1 + a3;
  if (v11 < 0)
    sub_24BA39774();
  v12 = (char *)(__src - v10);
  v13 = v8 - v10;
  if (2 * v13 > v11)
    v11 = 2 * v13;
  if (v13 >= 0x3FFFFFFFFFFFFFFFLL)
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v14 = v11;
  if (v14)
    v15 = operator new(v14);
  else
    v15 = 0;
  v29 = &v12[(_QWORD)v15];
  v30 = &v29[v6];
  v31 = v29;
  do
  {
    *v31++ = *v5;
    --v6;
  }
  while (v6);
  v32 = *a1;
  if (*a1 == __src)
  {
    v34 = v29;
  }
  else
  {
    v33 = __src;
    v34 = v29;
    do
    {
      v35 = *--v33;
      *--v34 = v35;
    }
    while (v33 != v32);
    v9 = a1[1];
  }
  v36 = (char *)v15 + v14;
  if (v9 != __src)
    memmove(v30, __src, v9 - __src);
  v37 = *a1;
  *a1 = v34;
  a1[1] = &v30[v9 - __src];
  a1[2] = v36;
  if (v37)
    operator delete(v37);
  return v29;
}

uint64_t wis::serializeMetric@<X0>(wis *this@<X0>, const wireless_diagnostics::google::protobuf::MessageLite *a2@<X1>, unint64_t *a3@<X8>)
{
  signed int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v6 = (*(uint64_t (**)(wis *))(*(_QWORD *)this + 72))(this);
  wis::createTagForProtobuf(a2, v6, a3);
  v7 = *a3;
  v8 = a3[1] - *a3;
  v9 = v8 + v6;
  if (v8 >= v9)
  {
    if (v8 > v9)
      a3[1] = v7 + v9;
  }
  else
  {
    sub_24BA565B0(a3, v6);
    v7 = *a3;
  }
  return MEMORY[0x24BD2C650](this, v7 + v8, v6);
}

void sub_24BA56268(_Unwind_Exception *exception_object)
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

void wis::serializeMetric(wis *this@<X0>, const PB::Base *a2@<X1>, uint64_t a3@<X8>)
{
  char *v6;
  char *v7;

  PB::Writer::Writer((PB::Writer *)&v6);
  (*(void (**)(wis *, char **))(*(_QWORD *)this + 24))(this, &v6);
  wis::createTagForProtobuf(a2, (_DWORD)v6 - (_DWORD)v7, (unint64_t *)a3);
  sub_24BA566D8(a3, *(char **)(a3 + 8), v7, v6, v6 - v7);
  PB::Writer::~Writer((PB::Writer *)&v6);
}

void sub_24BA56304(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  void *v4;
  va_list va;

  va_start(va, a2);
  v4 = *(void **)v2;
  if (*(_QWORD *)v2)
  {
    *(_QWORD *)(v2 + 8) = v4;
    operator delete(v4);
  }
  PB::Writer::~Writer((PB::Writer *)va);
  _Unwind_Resume(a1);
}

uint64_t wis::getComponentForMetricId(wis *this)
{
  return this >> 16;
}

uint64_t wis::getCoreAnalyticsEventName(wis *this)
{
  _QWORD *v1;
  _QWORD v3[11];
  char v4;
  uint64_t v5;

  sub_24BA56430((uint64_t)v3);
  v1 = sub_24BA568C0(v3, (uint64_t)"com.apple.wis.0x", 16);
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 8) = *(_DWORD *)((_BYTE *)v1 + *(_QWORD *)(*v1 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  std::stringbuf::str();
  v3[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v3 + *(_QWORD *)(v3[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v3[1] = MEMORY[0x24BEDB848] + 16;
  if (v4 < 0)
    operator delete((void *)v3[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x24BD2C818](&v5);
}

void sub_24BA5641C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_24BA5651C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA56430(uint64_t a1)
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

void sub_24BA564F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x24BD2C818](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA5651C(uint64_t a1)
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
  MEMORY[0x24BD2C818](a1 + 112);
  return a1;
}

BOOL wis::isTimerIdSupported(wis *this)
{
  return ((_DWORD)this - 1) < 2;
}

void sub_24BA565B0(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      sub_24BA39774();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

char *sub_24BA566D8(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  char *v5;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  size_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  int64_t v25;
  char v26;
  char *v27;
  char *v28;
  size_t v29;
  char *v30;
  char *v31;
  char *v32;

  v5 = __dst;
  if (a5 < 1)
    return v5;
  v10 = *(char **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    v11 = *(char **)a1;
    v12 = (uint64_t)&v10[a5 - *(_QWORD *)a1];
    if (v12 < 0)
      sub_24BA39774();
    v13 = (char *)(__dst - v11);
    v14 = v9 - (_QWORD)v11;
    if (2 * v14 > v12)
      v12 = 2 * v14;
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v12;
    if (v15)
    {
      v16 = v15;
      v17 = (char *)operator new(v15);
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    v27 = &v13[(_QWORD)v17];
    memcpy(&v13[(_QWORD)v17], __src, a5);
    v28 = &v13[(_QWORD)v17];
    v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(_QWORD)v17 - 1] = v13[(_QWORD)(v11 - 1)];
        --v13;
      }
      while (v13);
      v10 = *(char **)(a1 + 8);
      v28 = v17;
    }
    v30 = &v27[a5];
    v31 = &v17[v29];
    if (v10 != v5)
      memmove(v30, v5, v10 - v5);
    v32 = *(char **)a1;
    *(_QWORD *)a1 = v28;
    *(_QWORD *)(a1 + 8) = &v30[v10 - v5];
    *(_QWORD *)(a1 + 16) = v31;
    if (v32)
      operator delete(v32);
    return v27;
  }
  v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v19 = &__src[a5];
    v21 = *(char **)(a1 + 8);
LABEL_17:
    v22 = &v5[a5];
    v23 = &v21[-a5];
    v24 = v21;
    if (&v21[-a5] < v10)
    {
      v25 = &v10[a5] - v21;
      v24 = v21;
      do
      {
        v26 = *v23++;
        *v24++ = v26;
        --v25;
      }
      while (v25);
    }
    *(_QWORD *)(a1 + 8) = v24;
    if (v21 != v22)
      memmove(&v5[a5], v5, v21 - v22);
    if (v19 != __src)
      memmove(v5, __src, v19 - __src);
    return v5;
  }
  v19 = &__src[v18];
  v20 = a4 - &__src[v18];
  if (a4 != &__src[v18])
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  v21 = &v10[v20];
  *(_QWORD *)(a1 + 8) = &v10[v20];
  if (v18 >= 1)
    goto LABEL_17;
  return v5;
}

_QWORD *sub_24BA568C0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x24BD2C764](v13, a1);
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
    if (!sub_24BA56A24(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x24BD2C770](v13);
  return a1;
}

void sub_24BA569C8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x24BD2C770](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x24BA569A8);
}

void sub_24BA56A10(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_24BA56A24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_24BA56B60(__p, v12, __c);
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

void sub_24BA56B44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_24BA56B60(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_24BA396C4();
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

const __CFString *createDescriptionForMetriclogFile(CFStringRef theString)
{
  const __CFString *v1;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  std::string *v4;
  std::string::size_type size;
  std::string *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void **v11;
  void *__p[2];
  char v14;
  std::string v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  FILE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v1 = theString;
  if (theString)
  {
    Length = CFStringGetLength(theString);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x600u);
    memset(&v15, 0, sizeof(v15));
    std::string::resize(&v15, MaximumSizeForEncoding + 1, 0);
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v4 = &v15;
    else
      v4 = (std::string *)v15.__r_.__value_.__r.__words[0];
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v15.__r_.__value_.__r.__words[2]);
    else
      size = v15.__r_.__value_.__l.__size_;
    if (CFStringGetCString(v1, (char *)v4, size, 0x8000100u))
    {
      if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v6 = &v15;
      else
        v6 = (std::string *)v15.__r_.__value_.__r.__words[0];
      sub_24BA55AF0(&v18, (char *)v6);
      if (!v18 || v19 == -1)
      {
        sub_24BA3C010(__p, (char *)&unk_24BA5D72A);
      }
      else
      {
        sCreateBestChoiceMetadataLoaderDelegate(&v22);
        v21 = 1;
        sub_24BA5040C(&v21, &v22, &v16);
        v7 = v22;
        v22 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
        sDumpMetricFile((uint64_t)&v16, v19, v20, 0);
        v8 = v17;
        if (v17)
        {
          p_shared_owners = (unint64_t *)&v17->__shared_owners_;
          do
            v10 = __ldaxr(p_shared_owners);
          while (__stlxr(v10 - 1, p_shared_owners));
          if (!v10)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
      }
      sub_24BA4CE28((uint64_t)&v18);
      if (v14 >= 0)
        v11 = __p;
      else
        v11 = (void **)__p[0];
      v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)v11, 0x600u);
      if (v14 < 0)
        operator delete(__p[0]);
    }
    else
    {
      v1 = 0;
    }
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v15.__r_.__value_.__l.__data_);
  }
  return v1;
}

void sub_24BA56DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, uint64_t a19, char a20)
{
  sub_24BA3B304((uint64_t)&a18);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x24BA56D54);
  }
  sub_24BA4CE28((uint64_t)&a20);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA56E6C(uint64_t result)
{
  *(_QWORD *)result = &off_251CCD388;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 20) = 0;
  return result;
}

void sub_24BA56E80(PB::Base *this)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &off_251CCD388;
  v4 = *((_QWORD *)this + 1);
  v2 = (_QWORD *)((char *)this + 8);
  v3 = v4;
  *v2 = 0;
  if (v4)
    sub_24BA395F0((uint64_t)v2, v3);
  PB::Base::~Base(this);
}

void sub_24BA56EC0(PB::Base *a1)
{
  sub_24BA56E80(a1);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t sub_24BA56EE4(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v3;

  v2 = *(_DWORD *)(result + 20);
  *(_DWORD *)(result + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = v2;
  v3 = *(_QWORD *)(result + 8);
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = v3;
  LODWORD(v3) = *(_DWORD *)(result + 16);
  *(_DWORD *)(result + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t sub_24BA56F18(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = &off_251CCD388;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v6 = *v4;
  *v4 = v5;
  if (v6)
    sub_24BA395F0((uint64_t)v4, v6);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t sub_24BA56F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[8];
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_24BA56F18((uint64_t)v6, a2);
    v3 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v7;
    v7 = v3;
    v4 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v8;
    v8 = v4;
    sub_24BA56E80((PB::Base *)v6);
  }
  return a1;
}

uint64_t sub_24BA56FDC(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  PB::TextFormatter::beginObject(this, a3);
  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    PB::TextFormatter::format(this, "metric_id");
  if (*(_QWORD *)(a1 + 8))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_24BA57040(uint64_t a1, PB::Reader *this)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t result;
  char v33;
  unsigned int v34;
  unint64_t v35;
  char v36;
  uint64_t v38;

  v2 = *((_QWORD *)this + 1);
  v3 = *((_QWORD *)this + 2);
  v4 = *((unsigned __int8 *)this + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t *)(a1 + 8);
    while (1)
    {
      v9 = *(_QWORD *)this;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)this + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v12 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 20) |= 1u;
        v24 = *((_QWORD *)this + 1);
        v25 = *((_QWORD *)this + 2);
        v26 = *(_QWORD *)this;
        if (v24 > 0xFFFFFFFFFFFFFFF5 || v24 + 10 > v25)
        {
          v33 = 0;
          v34 = 0;
          v29 = 0;
          if (v25 <= v24)
            v25 = *((_QWORD *)this + 1);
          while (1)
          {
            if (v25 == v24)
            {
              LODWORD(v29) = 0;
              *((_BYTE *)this + 24) = 1;
              goto LABEL_47;
            }
            v35 = v24 + 1;
            v36 = *(_BYTE *)(v26 + v24);
            *((_QWORD *)this + 1) = v35;
            v29 |= (unint64_t)(v36 & 0x7F) << v33;
            if ((v36 & 0x80) == 0)
              break;
            v33 += 7;
            v24 = v35;
            v15 = v34++ > 8;
            if (v15)
            {
LABEL_43:
              LODWORD(v29) = 0;
              goto LABEL_47;
            }
          }
          if (*((_BYTE *)this + 24))
            LODWORD(v29) = 0;
        }
        else
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = v24 + 1;
            *((_QWORD *)this + 1) = v24 + 1;
            v31 = *(_BYTE *)(v26 + v24);
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0)
              break;
            v27 += 7;
            v24 = v30;
            v15 = v28++ > 8;
            if (v15)
              goto LABEL_43;
          }
        }
LABEL_47:
        *(_DWORD *)(a1 + 16) = v29;
      }
      else if ((v12 >> 3) == 1)
      {
        v21 = (_QWORD *)operator new();
        v21[1] = 0;
        v21[2] = 0;
        *v21 = 0;
        v38 = 0;
        v22 = *v8;
        *v8 = (uint64_t)v21;
        if (v22)
        {
          sub_24BA395F0((uint64_t)v8, v22);
          v23 = v38;
          v38 = 0;
          if (v23)
            sub_24BA395F0((uint64_t)&v38, v23);
        }
        PB::Reader::read();
      }
      else
      {
        result = PB::Reader::skip(this);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)this + 1);
      v3 = *((_QWORD *)this + 2);
      v4 = *((unsigned __int8 *)this + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)this + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_21;
      v16 += 7;
      v2 = v18;
      if (v17++ >= 9)
      {
LABEL_20:
        v12 = 0;
        goto LABEL_21;
      }
    }
    v4 = 1;
    *((_BYTE *)this + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sub_24BA572DC(uint64_t result, PB::Writer *this)
{
  uint64_t v3;

  v3 = result;
  if (*(_QWORD *)(result + 8))
    result = PB::Writer::write();
  if ((*(_BYTE *)(v3 + 20) & 1) != 0)
    return PB::Writer::writeVarInt(this);
  return result;
}

uint64_t sub_24BA57334(uint64_t a1, PB::TextFormatter *this, char *a3)
{
  __int16 v5;
  __int16 v6;

  PB::TextFormatter::beginObject(this, a3);
  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(this, "enum_type_index");
    v5 = *(_WORD *)(a1 + 52);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)(a1 + 52) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(this, "has_loc");
  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PB::TextFormatter::format(this, "has_pii");
  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PB::TextFormatter::format(this, "is_repeated");
  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PB::TextFormatter::format(this, "message_type_index");
  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PB::TextFormatter::format(this, "metric_query_type");
  v5 = *(_WORD *)(a1 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_23:
  PB::TextFormatter::format(this, "metric_range_to");
  if ((*(_WORD *)(a1 + 52) & 0x10) != 0)
LABEL_9:
    PB::TextFormatter::format(this, "metric_type");
LABEL_10:
  if (*(_QWORD *)(a1 + 8))
    PB::TextFormatter::format();
  v6 = *(_WORD *)(a1 + 52);
  if ((v6 & 0x20) == 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_14;
LABEL_26:
    PB::TextFormatter::format(this, "tag");
    if ((*(_WORD *)(a1 + 52) & 0x80) == 0)
      return PB::TextFormatter::endObject(this);
    goto LABEL_15;
  }
  PB::TextFormatter::format(this, "number_pretty_format");
  v6 = *(_WORD *)(a1 + 52);
  if ((v6 & 0x40) != 0)
    goto LABEL_26;
LABEL_14:
  if ((v6 & 0x80) != 0)
LABEL_15:
    PB::TextFormatter::format(this, "type");
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_24BA574DC(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  __int16 v4;
  __int16 v5;

  v3 = result;
  v4 = *(_WORD *)(result + 52);
  if ((v4 & 0x40) != 0)
  {
    result = PB::Writer::writeVarInt(this);
    v4 = *(_WORD *)(v3 + 52);
    if ((v4 & 0x80) == 0)
    {
LABEL_3:
      if ((v4 & 0x400) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v4 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  result = PB::Writer::writeVarInt(this);
  if ((*(_WORD *)(v3 + 52) & 0x400) != 0)
LABEL_4:
    result = PB::Writer::write(this);
LABEL_5:
  if (*(_QWORD *)(v3 + 8))
    result = PB::Writer::write();
  v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 0x200) != 0)
  {
    result = PB::Writer::write(this);
    v5 = *(_WORD *)(v3 + 52);
    if ((v5 & 0x100) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)(v3 + 52) & 0x100) == 0)
  {
    goto LABEL_9;
  }
  result = PB::Writer::write(this);
  v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  result = PB::Writer::writeVarInt(this);
  v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  result = PB::Writer::writeVarInt(this);
  v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  result = PB::Writer::writeVarInt(this);
  v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 8) == 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  result = PB::Writer::writeVarInt(this);
  v5 = *(_WORD *)(v3 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0)
      return result;
    return PB::Writer::writeVarInt(this);
  }
LABEL_25:
  result = PB::Writer::writeVarInt(this);
  if ((*(_WORD *)(v3 + 52) & 4) != 0)
    return PB::Writer::writeVarInt(this);
  return result;
}

void sub_24BA57648(void **a1)
{
  sub_24BA33228(a1);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t sub_24BA5766C(_QWORD *a1, PB::TextFormatter *this, char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;

  PB::TextFormatter::beginObject(this, a3);
  v5 = (uint64_t *)a1[1];
  v6 = (uint64_t *)a1[2];
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, this, "enums");
  }
  v8 = (uint64_t *)a1[4];
  v9 = (uint64_t *)a1[5];
  while (v8 != v9)
  {
    v10 = *v8++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v10 + 32))(v10, this, "messages");
  }
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_24BA57714(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  const PB::Base **v4;
  const PB::Base **v5;
  const PB::Base *v6;
  const PB::Base **v7;
  const PB::Base **v8;
  const PB::Base *v9;

  v3 = result;
  v4 = *(const PB::Base ***)(result + 32);
  v5 = *(const PB::Base ***)(result + 40);
  while (v4 != v5)
  {
    v6 = *v4++;
    result = PB::Writer::writeSubmessage(this, v6);
  }
  v8 = *(const PB::Base ***)(v3 + 8);
  v7 = *(const PB::Base ***)(v3 + 16);
  while (v8 != v7)
  {
    v9 = *v8++;
    result = PB::Writer::writeSubmessage(this, v9);
  }
  return result;
}

double sCreateBestChoiceMetadataLoaderDelegate@<D0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  double result;

  v2 = operator new();
  *(_QWORD *)v2 = &off_251CCD478;
  *(_QWORD *)(v2 + 8) = 0;
  result = 0.0;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_QWORD *)(v2 + 64) = 0;
  *(_DWORD *)(v2 + 72) = 1065353216;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_DWORD *)(v2 + 112) = 1065353216;
  *(_DWORD *)(v2 + 120) = 0;
  *a1 = v2;
  return result;
}

void BestChoiceMetadataLoaderDelegate::BestChoiceMetadataLoaderDelegate(BestChoiceMetadataLoaderDelegate *this)
{
  *(_QWORD *)this = &off_251CCD478;
  *((_QWORD *)this + 1) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_QWORD *)this + 8) = 0;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *((_DWORD *)this + 30) = 0;
}

{
  *(_QWORD *)this = &off_251CCD478;
  *((_QWORD *)this + 1) = 0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_QWORD *)this + 8) = 0;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *((_DWORD *)this + 30) = 0;
}

void BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(BestChoiceMetadataLoaderDelegate *this)
{
  void **v2;
  void **v3;

  *(_QWORD *)this = &off_251CCD478;
  v2 = (void **)((char *)this + 16);
  sub_24BA4CCF0((uint64_t)this + 80);
  sub_24BA4CCF0((uint64_t)this + 40);
  v3 = v2;
  sub_24BA58130(&v3);
  sub_24BA551C0((uint64_t *)this);
}

{
  BestChoiceMetadataLoaderDelegate::~BestChoiceMetadataLoaderDelegate(this);
  JUMPOUT(0x24BD2C8A8);
}

uint64_t BestChoiceMetadataLoaderDelegate::loadBaseMetadata(BestChoiceMetadataLoaderDelegate *this)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v6;
  uint64_t v7[5];
  uint64_t v8[7];

  v2 = (_QWORD *)(*(uint64_t (**)(BestChoiceMetadataLoaderDelegate *))(*(_QWORD *)this + 80))(this);
  sub_24BA55920(v2, v3, (uint64_t)&v6);
  sub_24BA581A0((uint64_t)this + 40, v7);
  sub_24BA581A0((uint64_t)this + 80, v8);
  v4 = v6;
  *((_DWORD *)this + 30) = v6;
  sub_24BA4CCF0((uint64_t)v8);
  sub_24BA4CCF0((uint64_t)v7);
  return v4;
}

void BestChoiceMetadataLoaderDelegate::loadOverrideMetadata(BestChoiceMetadataLoaderDelegate *this, uint64_t a2)
{
  std::__fs::filesystem::directory_iterator v4;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  const std::__fs::filesystem::directory_entry *v11;
  const std::__fs::filesystem::directory_entry *v12;
  std::__shared_weak_count *v13;
  uint64_t *v14;
  unint64_t v15;
  std::__fs::filesystem::directory_entry::_Path __p;
  std::__fs::filesystem::directory_iterator v17;
  std::__fs::filesystem::directory_iterator v18;

  v18.__imp_.__ptr_ = 0;
  v18.__imp_.__cntrl_ = 0;
  sub_24BA582A4(&__p.__pn_, &off_251CCD500);
  MEMORY[0x24BD2C7D0](&v17, &__p, 0, 0);
  v4 = v17;
  v17 = (std::__fs::filesystem::directory_iterator)0;
  cntrl = v18.__imp_.__cntrl_;
  v18 = v4;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
  }
  v8 = v17.__imp_.__cntrl_;
  if (v17.__imp_.__cntrl_)
  {
    v9 = (unint64_t *)&v17.__imp_.__cntrl_->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  v17 = (std::__fs::filesystem::directory_iterator)0;
  while (v18.__imp_.__ptr_)
  {
    v11 = std::__fs::filesystem::directory_iterator::__dereference(&v18);
    std::__fs::filesystem::__status(&v11->__p_, 0);
    if (__p.__pn_.__r_.__value_.__s.__data_[0] == 1)
    {
      v12 = std::__fs::filesystem::directory_iterator::__dereference(&v18);
      if (SHIBYTE(v12->__p_.__pn_.__r_.__value_.__r.__words[2]) < 0)
        sub_24BA39638(&__p, v12->__p_.__pn_.__r_.__value_.__l.__data_, v12->__p_.__pn_.__r_.__value_.__l.__size_);
      else
        __p.__pn_ = (std::__fs::filesystem::path::string_type)v12->__p_;
      (*(void (**)(BestChoiceMetadataLoaderDelegate *, uint64_t, std::__fs::filesystem::directory_entry::_Path *))(*(_QWORD *)this + 112))(this, a2, &__p);
      if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__pn_.__r_.__value_.__l.__data_);
    }
    std::__fs::filesystem::directory_iterator::__increment(&v18, 0);
  }
  v13 = v18.__imp_.__cntrl_;
  if (v18.__imp_.__cntrl_)
  {
    v14 = &v18.__imp_.__cntrl_->__shared_owners_;
    do
      v15 = __ldaxr((unint64_t *)v14);
    while (__stlxr(v15 - 1, (unint64_t *)v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

void sub_24BA57B38(_Unwind_Exception *a1)
{
  uint64_t v2;

  sub_24BA3B304(&v2);
  _Unwind_Resume(a1);
}

void sub_24BA57B40(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  if (a14 < 0)
    operator delete(__p);
  sub_24BA3B304((uint64_t)&a16);
  JUMPOUT(0x24BA57B68);
}

uint64_t BestChoiceMetadataLoaderDelegate::readOverrideFile(_QWORD *a1, uint64_t a2, char *a3)
{
  char *v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[5];

  if (a3[23] >= 0)
    v5 = a3;
  else
    v5 = *(char **)a3;
  sub_24BA55AF0((FILE **)&v23, v5);
  if ((_QWORD)v23)
    v6 = *((_QWORD *)&v23 + 1) == -1;
  else
    v6 = 1;
  if (!v6)
  {
    sub_24BA55920(*((_QWORD **)&v23 + 1), v24, (uint64_t)&v20);
    if (v20 <= a2)
    {
      v10 = 16;
    }
    else
    {
      v7 = a1[4];
      v8 = a1[3];
      if (v8 >= v7)
      {
        v11 = a1[2];
        v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - v11) >> 3);
        v13 = v12 + 1;
        if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_24BA39774();
        v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v11) >> 3);
        if (2 * v14 > v13)
          v13 = 2 * v14;
        if (v14 >= 0x555555555555555)
          v15 = 0xAAAAAAAAAAAAAAALL;
        else
          v15 = v13;
        v25[4] = a1 + 4;
        v16 = (char *)sub_24BA585A0((uint64_t)(a1 + 4), v15);
        v17 = &v16[24 * v12];
        v25[0] = v16;
        v25[1] = v17;
        v25[3] = &v16[24 * v18];
        *(_OWORD *)v17 = v23;
        *((_QWORD *)v17 + 2) = v24;
        *(_QWORD *)&v23 = 0;
        *((_QWORD *)&v23 + 1) = -1;
        v24 = 0;
        v25[2] = v17 + 24;
        sub_24BA58518(a1 + 2, v25);
        v9 = a1[3];
        sub_24BA585E4((uint64_t)v25);
      }
      else
      {
        *(_OWORD *)v8 = v23;
        *(_QWORD *)(v8 + 16) = v24;
        *(_QWORD *)&v23 = 0;
        *((_QWORD *)&v23 + 1) = -1;
        v24 = 0;
        v9 = v8 + 24;
      }
      a1[3] = v9;
      v10 = 15;
    }
    (*(void (**)(_QWORD *, uint64_t, unsigned int *))(*a1 + 8 * v10))(a1, a2, &v20);
    sub_24BA4CCF0((uint64_t)&v22);
    sub_24BA4CCF0((uint64_t)&v21);
  }
  return sub_24BA4CE28((uint64_t)&v23);
}

void sub_24BA57D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  sub_24BA585E4(v3 - 72);
  sub_24BA4CCF0((uint64_t)va1);
  sub_24BA4CCF0((uint64_t)va);
  sub_24BA4CE28(v3 - 96);
  _Unwind_Resume(a1);
}

_QWORD *BestChoiceMetadataLoaderDelegate::markOverrideFileUsed(_QWORD *result, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  unsigned int *i;
  char v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v4 = result;
  for (i = *(unsigned int **)(a3 + 24); i; i = *(unsigned int **)i)
  {
    result = sub_24BA58630((uint64_t)(v4 + 5), i + 4, (uint64_t)(i + 4));
    if (!v6)
    {
      v7 = *((_QWORD *)i + 4);
      result[3] = *((_QWORD *)i + 3);
      result[4] = v7;
    }
  }
  v8 = *(unsigned int **)(a3 + 64);
  if (v8)
  {
    v9 = (uint64_t)(v4 + 10);
    do
    {
      result = sub_24BA58630(v9, v8 + 4, (uint64_t)(v8 + 4));
      if (!v10)
      {
        v11 = *((_QWORD *)v8 + 4);
        result[3] = *((_QWORD *)v8 + 3);
        result[4] = v11;
      }
      v8 = *(unsigned int **)v8;
    }
    while (v8);
  }
  return result;
}

uint64_t BestChoiceMetadataLoaderDelegate::pickMap(uint64_t a1, int a2)
{
  uint64_t v4;

  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
  v4 = a1 + 80;
  if (a2 != 1)
    v4 = a1 + 40;
  if (a2)
    return v4;
  else
    return a1 + 40;
}

uint64_t BestChoiceMetadataLoaderDelegate::readMetricFileMetadata(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 32))(a1, a2, 0);
}

void BestChoiceMetadataLoaderDelegate::getComponentsAvailable(uint64_t a1@<X0>, int a2@<W1>, char **a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  char *v9;
  _QWORD *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  int v19;

  v6 = a1 + 80;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
  v7 = a1 + 40;
  if (a2 == 1)
    v7 = v6;
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v8 = *(uint64_t **)(v7 + 16);
  if (v8)
  {
    v9 = 0;
    v10 = a3 + 2;
    do
    {
      if ((unint64_t)v9 >= *v10)
      {
        v12 = *a3;
        v13 = (v9 - *a3) >> 2;
        v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 62)
          sub_24BA39774();
        v15 = *v10 - (_QWORD)v12;
        if (v15 >> 1 > v14)
          v14 = v15 >> 1;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL)
          v16 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v16 = v14;
        if (v16)
        {
          v17 = (char *)sub_24BA40BCC((uint64_t)(a3 + 2), v16);
          v12 = *a3;
          v9 = a3[1];
        }
        else
        {
          v17 = 0;
        }
        v18 = &v17[4 * v13];
        *(_DWORD *)v18 = *((_DWORD *)v8 + 4);
        v11 = v18 + 4;
        while (v9 != v12)
        {
          v19 = *((_DWORD *)v9 - 1);
          v9 -= 4;
          *((_DWORD *)v18 - 1) = v19;
          v18 -= 4;
        }
        *a3 = v18;
        a3[1] = v11;
        a3[2] = &v17[4 * v16];
        if (v12)
          operator delete(v12);
      }
      else
      {
        *(_DWORD *)v9 = *((_DWORD *)v8 + 4);
        v11 = v9 + 4;
      }
      a3[1] = v11;
      v8 = (uint64_t *)*v8;
      v9 = v11;
    }
    while (v8);
  }
}

void sub_24BA57F74(_Unwind_Exception *exception_object)
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

void BestChoiceMetadataLoaderDelegate::getMetricIndex(BestChoiceMetadataLoaderDelegate *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  _QWORD *v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  _QWORD *v25;
  std::__shared_weak_count *v26;

  sub_24BA554B0((uint64_t)this, &v25);
  if (!v25)
  {
    v18 = (std::__shared_weak_count *)operator new(0x38uLL);
    v18->__shared_owners_ = 0;
    v18->__shared_weak_owners_ = 0;
    v18->__vftable = (std::__shared_weak_count_vtbl *)&off_251CCD310;
    v19 = sub_24BA4C148(&v18[1].__vftable);
    v20 = v26;
    v25 = v19;
    v26 = v18;
    if (v20)
    {
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
  }
  v4 = *((_QWORD *)this + 2);
  v5 = *((_QWORD *)this + 3);
  while (v4 != v5)
  {
    v6 = (unsigned __int8 *)sub_24BA55578(*(_DWORD **)(v4 + 8), *(_QWORD *)(v4 + 16));
    sub_24BA554E0(v6, v7, &v23);
    if (v23)
      sub_24BA4CF48((uint64_t)v25, v23);
    v8 = v24;
    if (v24)
    {
      v9 = (unint64_t *)&v24->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v4 += 24;
  }
  sub_24BA4D12C((uint64_t)v25);
  v11 = (_DWORD *)(*(uint64_t (**)(BestChoiceMetadataLoaderDelegate *))(*(_QWORD *)this + 80))(this);
  v13 = (unsigned __int8 *)sub_24BA55578(v11, v12);
  sub_24BA554E0(v13, v14, a2);
  v15 = v26;
  if (v26)
  {
    v16 = (unint64_t *)&v26->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
}

void sub_24BA58104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_24BA3B304((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_24BA58130(void ***a1)
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
        v4 = sub_24BA4CE28(v4 - 24);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_24BA581A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  sub_24BA58240((_QWORD *)a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

_QWORD *sub_24BA58240(_QWORD *result)
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

std::string *sub_24BA582A4(std::string *this, char **a2)
{
  char *v3;
  char *v4;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = *a2;
  v4 = v3 - 1;
  while (*++v4)
    ;
  sub_24BA58300(this, v3, v4);
  return this;
}

void sub_24BA582E4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

std::string *sub_24BA58300(std::string *this, char *a2, char *a3)
{
  char *v4;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  void **v12;
  std::string::size_type v13;
  std::string *v14;
  _BYTE *i;
  char v16;
  std::string::size_type v17;
  void *__p[2];
  unsigned __int8 v20;

  v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v14 = this;
    if ((v6 & 0x80) != 0)
      v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    for (i = (char *)v14 + size; v4 != a3; ++i)
    {
      v16 = *v4++;
      *i = v16;
    }
    *i = 0;
    v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v17;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
  }
  else
  {
    sub_24BA58474(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    if ((v20 & 0x80u) == 0)
      v13 = v20;
    else
      v13 = (std::string::size_type)__p[1];
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0)
      operator delete(__p[0]);
  }
  return this;
}

void sub_24BA58458(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_24BA58474(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    sub_24BA396C4();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

uint64_t *sub_24BA58518(uint64_t *result, _QWORD *a2)
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

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  if (v2 != *result)
  {
    v5 = 0;
    do
    {
      v6 = v4 + v5;
      v7 = v2 + v5;
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(_QWORD *)(v6 - 8) = *(_QWORD *)(v2 + v5 - 8);
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = -1;
      *(_QWORD *)(v7 - 8) = 0;
      v5 -= 24;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  v8 = *result;
  *result = v4;
  a2[1] = v8;
  v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

void *sub_24BA585A0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_24BA3974C();
  return operator new(24 * a2);
}

uint64_t sub_24BA585E4(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 24;
    sub_24BA4CE28(i - 24);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD *sub_24BA58630(uint64_t a1, unsigned int *a2, uint64_t a3)
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
      v3 = ((_DWORD)v7 - 1) & v6;
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
  v10 = operator new(0x28uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_OWORD *)v10 + 1) = *(_OWORD *)a3;
  v10[4] = *(_QWORD *)(a3 + 16);
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
    sub_24BA3814C(a1, v17);
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
      v3 = ((_DWORD)v7 - 1) & v6;
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

void sub_24BA58840(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA58858(_QWORD *a1, PB::TextFormatter *this, char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;

  PB::TextFormatter::beginObject(this, a3);
  v5 = (uint64_t *)a1[1];
  v6 = (uint64_t *)a1[2];
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, this, "fields");
  }
  if (a1[4])
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(this);
}

uint64_t sub_24BA588E4(uint64_t result, PB::Writer *this)
{
  uint64_t v3;
  const PB::Base **v4;
  const PB::Base **v5;
  const PB::Base *v6;

  v3 = result;
  if (*(_QWORD *)(result + 32))
    result = PB::Writer::write();
  v5 = *(const PB::Base ***)(v3 + 8);
  v4 = *(const PB::Base ***)(v3 + 16);
  while (v5 != v4)
  {
    v6 = *v5++;
    result = PB::Writer::writeSubmessage(this, v6);
  }
  return result;
}

void sub_24BA58940(unint64_t a1@<X0>, std::string *a2@<X8>)
{
  std::string *v2;
  unint64_t v3;
  BOOL v4;
  std::string::size_type size;
  std::string *v6;
  unint64_t v7;
  std::string::value_type v8;

  v2 = a2;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  if (!a1)
    goto LABEL_14;
  v3 = a1;
  do
  {
    std::string::push_back(v2, a0123456789abcd_0[v3 & 0xF]);
    v4 = v3 >= 0x10;
    v3 >>= 4;
  }
  while (v4);
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
  {
    size = v2->__r_.__value_.__l.__size_;
    if (!size)
    {
LABEL_14:
      std::string::push_back(v2, 48);
      return;
    }
    v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(v2->__r_.__value_.__r.__words[2]);
    if (!*((_BYTE *)&v2->__r_.__value_.__s + 23))
      goto LABEL_14;
  }
  v6 = (std::string *)((char *)v2 + size - 1);
  if (v6 > v2)
  {
    v7 = (unint64_t)v2->__r_.__value_.__r.__words + 1;
    do
    {
      v8 = *(_BYTE *)(v7 - 1);
      *(_BYTE *)(v7 - 1) = v6->__r_.__value_.__s.__data_[0];
      v6->__r_.__value_.__s.__data_[0] = v8;
      v6 = (std::string *)((char *)v6 - 1);
      v4 = v7++ >= (unint64_t)v6;
    }
    while (!v4);
  }
}

void sub_24BA58A00(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_24BA58A20(unint64_t a1@<X0>, std::string::size_type a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v5;
  int v6;
  uint64_t *v7;
  uint64_t *v8;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a3, a2, 0);
  v5 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  v6 = (char)v5;
  v7 = (uint64_t *)((char *)a3 + v5);
  if (v6 >= 0)
  {
    v8 = (uint64_t *)a3;
  }
  else
  {
    v7 = (uint64_t *)(a3->__r_.__value_.__r.__words[0] + a3->__r_.__value_.__l.__size_);
    v8 = (uint64_t *)a3->__r_.__value_.__r.__words[0];
  }
  for (; v7 != v8; a1 >>= 4)
  {
    *((_BYTE *)v7 - 1) = a0123456789abcd_0[a1 & 0xF];
    v7 = (uint64_t *)((char *)v7 - 1);
  }
}

void sub_24BA58A9C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_24BA58AB8(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  tm *v4;
  time_t v5;
  char v6[80];
  uint64_t v7;

  v2 = a1;
  v7 = *MEMORY[0x24BDAC8D0];
  v5 = a1 / 0x3E8;
  v4 = localtime(&v5);
  if (!strftime(v6, 0x50uLL, "%a %F %T", v4))
    v6[0] = 0;
  sub_24BA58B80("%llu (%s.%03d)", a2, v2);
}

void sub_24BA58B80(const char *a1@<X0>, uint64_t a2@<X8>, char a3)
{
  int v5;
  char *v6;
  size_t v7;
  int v8;
  std::string::size_type v9;
  uint64_t v10;
  int v11;
  char *v12;
  size_t v13;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  std::string::resize((std::string *)a2, 0x17uLL, 0);
  v5 = *(char *)(a2 + 23);
  if (v5 >= 0)
    v6 = (char *)a2;
  else
    v6 = *(char **)a2;
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(a2 + 23);
  else
    v7 = *(_QWORD *)(a2 + 8);
  v8 = vsnprintf(v6, v7, a1, &a3);
  v9 = v8;
  v10 = *(unsigned __int8 *)(a2 + 23);
  if ((v10 & 0x80u) != 0)
    v10 = *(_QWORD *)(a2 + 8);
  if (v10 <= v8)
  {
    std::string::resize((std::string *)a2, v8 + 1, 0);
    v11 = *(char *)(a2 + 23);
    if (v11 >= 0)
      v12 = (char *)a2;
    else
      v12 = *(char **)a2;
    if (v11 >= 0)
      v13 = *(unsigned __int8 *)(a2 + 23);
    else
      v13 = *(_QWORD *)(a2 + 8);
    v9 = vsnprintf(v12, v13, a1, &a3);
  }
  std::string::resize((std::string *)a2, v9, 0);
}

void sub_24BA58C50(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_24BA58C70(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  tm *v4;
  time_t v5;
  char v6[80];
  uint64_t v7;

  v2 = a1;
  v7 = *MEMORY[0x24BDAC8D0];
  v5 = a1 + 978307200;
  v4 = localtime(&v5);
  if (!strftime(v6, 0x50uLL, "%a %F %T", v4))
    v6[0] = 0;
  sub_24BA58B80("%llu (%s)", a2, v2);
}

void sub_24BA58D1C(time_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  tm *v4;
  time_t v5;
  char v6[80];
  uint64_t v7;

  v2 = a1;
  v7 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v4 = localtime(&v5);
  if (!strftime(v6, 0x50uLL, "%a %F %T", v4))
    v6[0] = 0;
  sub_24BA58B80("%llu (%s)", a2, v2);
}

void sub_24BA58DBC(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  char v3;

  v3 = a2;
  sub_24BA58E0C(a1, a2);
  sub_24BA58B80("0x%x (%s)", a3, v3);
}

uint64_t sub_24BA58E0C(__n128 *a1, unsigned int a2)
{
  uint64_t result;
  _BYTE v3[16];
  uint64_t v4;

  MetricFileMetadataHelper::getHandleForMetric(a1, a2, (uint64_t)v3);
  if (v4 == 0xFFFFFFFFLL)
    return 0;
  result = MetadataHandle::getField((MetadataHandle *)v3);
  if (result)
  {
    result = *(_QWORD *)(result + 8);
    if (result)
    {
      if (*(char *)(result + 23) < 0)
        return *(_QWORD *)result;
    }
  }
  return result;
}

void sub_24BA58E64(__n128 *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  char v3;

  v3 = a2;
  if (sub_24BA58E0C(a1, a2))
    sub_24BA58B80("0x%x (%s metric)", a3, v3);
  else
    sub_24BA58B80("0x%x (%s)", a3, v3);
}

void sub_24BA58EF4(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  void *__p;
  char v5;

  v2 = a1;
  if ((uint64_t)a1 < 1000)
  {
    sub_24BA58B80("%lldns", a2, a1);
  }
  else
  {
    sub_24BA59010(((a1 / 0x3B9ACA00) - 60 * (a1 / 0xDF8475800)) | ((a1 % 0x3B9ACA00) << 32), (a1 / 0x34630B8A000) | ((a1 / 0xDF8475800 - 60 * (a1 / 0x34630B8A000)) << 32), (uint64_t)&__p);
    sub_24BA58B80("%lldns (%s)", a2, v2);
    if (v5 < 0)
      operator delete(__p);
  }
}

void sub_24BA58FF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA59010(unint64_t __val@<X1>, unint64_t a2@<X0>, uint64_t a3@<X8>)
{
  unsigned int v3;
  unint64_t v5;
  unint64_t v6;
  int v7;
  std::string *v8;
  std::string::size_type v9;
  char v10;
  std::string::size_type v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  std::string *v17;
  __int128 v18;
  std::string *v19;
  std::string::size_type size;
  std::string *v21;
  std::string::size_type v22;
  std::string *v23;
  std::string::size_type v24;
  std::string v25;
  std::string v26;
  uint64_t v27;

  v3 = __val;
  v27 = *MEMORY[0x24BDAC8D0];
  v5 = HIDWORD(a2);
  v6 = HIDWORD(__val);
  v7 = HIDWORD(a2) | a2;
  if (!(HIDWORD(a2) | a2 | __val))
  {
    v12 = v6 - 1000000 * (HIDWORD(__val) / 0xF4240);
    v13 = v12 / 1000;
    v14 = v12 % 1000;
    v15 = v12 + 999;
    if (__val >= 0xF424000000000)
    {
      if (v15 <= 0x7CE && v14 == 0)
        sub_24BA58B80("%lldms", a3, HIDWORD(__val) / 0xF4240);
      else
        sub_24BA58B80("%lld.%03lldms", a3, HIDWORD(__val) / 0xF4240);
    }
    else if (v15 >= 0x7CF)
    {
      if (v14)
        sub_24BA58B80("%lld.%03lldus", a3, v13);
      else
        sub_24BA58B80("%lldus", a3, v13);
    }
    else
    {
      sub_24BA58B80("%lldns", a3, v14);
    }
    return;
  }
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  if (!(_DWORD)a2)
  {
    if (!HIDWORD(a2))
      goto LABEL_29;
    goto LABEL_20;
  }
  std::to_string(&v25, a2);
  v8 = std::string::append(&v25, "h");
  v9 = v8->__r_.__value_.__r.__words[0];
  v26.__r_.__value_.__r.__words[0] = v8->__r_.__value_.__l.__size_;
  *(std::string::size_type *)((char *)v26.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v8->__r_.__value_.__r.__words[1] + 7);
  v10 = HIBYTE(v8->__r_.__value_.__r.__words[2]);
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (*(char *)(a3 + 23) < 0)
    operator delete(*(void **)a3);
  v11 = v26.__r_.__value_.__r.__words[0];
  *(_QWORD *)a3 = v9;
  *(_QWORD *)(a3 + 8) = v11;
  *(_QWORD *)(a3 + 15) = *(std::string::size_type *)((char *)v26.__r_.__value_.__r.__words + 7);
  *(_BYTE *)(a3 + 23) = v10;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);
  if ((_DWORD)v5 || v3 || (_DWORD)v6)
  {
LABEL_20:
    std::to_string(&v26, v5);
    v17 = std::string::append(&v26, "m");
    v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    v25.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = &v25;
    else
      v19 = (std::string *)v25.__r_.__value_.__r.__words[0];
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v25.__r_.__value_.__r.__words[2]);
    else
      size = v25.__r_.__value_.__l.__size_;
    std::string::append((std::string *)a3, (const std::string::value_type *)v19, size);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v26.__r_.__value_.__l.__data_);
      if (v3)
      {
LABEL_30:
        if (!(_DWORD)v6)
        {
          std::to_string(&v25, v3);
          if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v21 = &v25;
          else
            v21 = (std::string *)v25.__r_.__value_.__r.__words[0];
          if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v22 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
          else
            v22 = v25.__r_.__value_.__l.__size_;
          std::string::append((std::string *)a3, (const std::string::value_type *)v21, v22);
          if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v25.__r_.__value_.__l.__data_);
          std::string::append((std::string *)a3, "s");
          return;
        }
        goto LABEL_46;
      }
LABEL_44:
      if (!v7 || !(_DWORD)v6)
        return;
LABEL_46:
      sub_24BA58B80("%u.%01us", (uint64_t)&v25, v3);
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v23 = &v25;
      else
        v23 = (std::string *)v25.__r_.__value_.__r.__words[0];
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v24 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
      else
        v24 = v25.__r_.__value_.__l.__size_;
      std::string::append((std::string *)a3, (const std::string::value_type *)v23, v24);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v25.__r_.__value_.__l.__data_);
      return;
    }
LABEL_29:
    if (v3)
      goto LABEL_30;
    goto LABEL_44;
  }
}

void sub_24BA59314(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;

  if (*(char *)(v23 + 23) < 0)
    operator delete(*(void **)v23);
  _Unwind_Resume(exception_object);
}

void sub_24BA5938C(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  void *__p;
  char v5;

  v2 = a1;
  if ((uint64_t)a1 < 1000)
  {
    sub_24BA58B80("%lldus", a2, a1);
  }
  else
  {
    sub_24BA59010((0x3E800000000 * (a1 + 4293967296u * (a1 / 0xF4240))) | ((a1 / 0xF4240)- 60 * (a1 / 0x3938700)), ((unint64_t)((a1 / 0x3938700) - 60 * (a1 / 0xD693A400)) << 32) | (a1 / 0xD693A400), (uint64_t)&__p);
    sub_24BA58B80("%lldus (%s)", a2, v2);
    if (v5 < 0)
      operator delete(__p);
  }
}

void sub_24BA59494(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA594B0(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  void *__p;
  char v5;

  v2 = a1;
  if ((uint64_t)a1 < 1000)
  {
    sub_24BA58B80("%lldms", a2, a1);
  }
  else
  {
    sub_24BA59010((0xF424000000000 * (a1 + 4294966296u * (a1 / 0x3E8))) | ((a1 / 0x3E8)- 60 * (a1 / 0xEA60)), (a1 / 0x36EE80) | ((unint64_t)((a1 / 0xEA60)- 60 * (a1 / 0x36EE80)) << 32), (uint64_t)&__p);
    sub_24BA58B80("%lldms (%s)", a2, v2);
    if (v5 < 0)
      operator delete(__p);
  }
}

void sub_24BA595B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA595D4(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  void *__p;
  char v5;

  v2 = a1;
  if ((uint64_t)a1 < 60)
  {
    sub_24BA58B80("%llds", a2, a1);
  }
  else
  {
    sub_24BA59010(a1 % 0x3C, (a1 / 0xE10) | ((unint64_t)((a1 / 0x3C) - 60 * (a1 / 0xE10)) << 32), (uint64_t)&__p);
    sub_24BA58B80("%llds (%s)", a2, v2);
    if (v5 < 0)
      operator delete(__p);
  }
}

void sub_24BA596A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA596BC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  void *__p;
  char v5;

  v2 = a1;
  if (a1 < 60)
  {
    sub_24BA58B80("%ldm", a2, a1);
  }
  else
  {
    sub_24BA59010(0, (a1 / 0x3CuLL) | ((a1 % 0x3CuLL) << 32), (uint64_t)&__p);
    sub_24BA58B80("%ldm (%s)", a2, v2);
    if (v5 < 0)
      operator delete(__p);
  }
}

void sub_24BA5976C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_24BA59788(char a1@<W0>, uint64_t a2@<X8>)
{
  sub_24BA58B80("%ldh", a2, a1);
}

void sGetMetricName(_QWORD *a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t Field;
  __int128 *v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  __n128 v11;
  uint64_t v12;
  _BYTE v13[24];
  _BYTE v14[8];
  std::__shared_weak_count *v15;
  uint64_t v16;

  MetricFileMetadataHelper::MetricFileMetadataHelper((MetricFileMetadataHelper *)v14, a1);
  v11 = 0uLL;
  v12 = 0xFFFFFFFFLL;
  MetricFileMetadataHelper::getSubfieldType((MetricFileMetadataHelper *)v14, &v11, a2, (uint64_t)v13);
  Field = MetadataHandle::getField((MetadataHandle *)v13);
  if (Field && (v6 = *(__int128 **)(Field + 8)) != 0)
  {
    if (*((char *)v6 + 23) < 0)
    {
      sub_24BA39638((_BYTE *)a3, *(void **)v6, *((_QWORD *)v6 + 1));
    }
    else
    {
      v7 = *v6;
      *(_QWORD *)(a3 + 16) = *((_QWORD *)v6 + 2);
      *(_OWORD *)a3 = v7;
    }
  }
  else
  {
    sub_24BA3C010((_QWORD *)a3, "unknown");
  }
  sub_24BA387C4((uint64_t)&v16);
  v8 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_24BA59898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  sub_24BA387C4((uint64_t)va1);
  sub_24BA3B304((uint64_t)va);
  _Unwind_Resume(a1);
}

void sMetricNamesResolver(WISMetadataLoader **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  char v8;
  size_t v9;
  const void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  size_t v16;
  const void *v17;
  size_t v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned __int8 *v27;
  std::string *v28;
  std::__shared_weak_count *v29;
  unint64_t *p_shared_owners;
  unint64_t v31;
  uint64_t v33;
  uint64_t *v34;
  unsigned int v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  unsigned int *v38;

  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)(a3 + 32) = 1065353216;
  if (*(_QWORD *)(a2 + 24))
  {
    WISMetadataLoader::getMetricIndex(&v36, *a1);
    if (v36)
    {
      v4 = *(uint64_t **)(a2 + 16);
      if (v4)
      {
        v5 = *(uint64_t **)(v36 + 16);
        v33 = ((uint64_t)v5 - *(_QWORD *)(v36 + 8)) >> 3;
        v34 = *(uint64_t **)(v36 + 8);
        while (1)
        {
          v6 = v34;
          v7 = v5;
          if (v5 != v34)
          {
            v8 = *((_BYTE *)v4 + 39);
            if (v8 >= 0)
              v9 = *((unsigned __int8 *)v4 + 39);
            else
              v9 = v4[3];
            if (v8 >= 0)
              v10 = v4 + 2;
            else
              v10 = (const void *)v4[2];
            v11 = v33;
            v6 = v34;
            do
            {
              v12 = v11 >> 1;
              v13 = &v6[v11 >> 1];
              v14 = *(_QWORD *)(*v13 + 8);
              if (v14)
              {
                v15 = *(char *)(v14 + 23);
                if (v15 >= 0)
                  v16 = *(unsigned __int8 *)(v14 + 23);
                else
                  v16 = *(_QWORD *)(v14 + 8);
                if (v15 >= 0)
                  v17 = *(const void **)(*v13 + 8);
                else
                  v17 = *(const void **)v14;
                if (v9 >= v16)
                  v18 = v16;
                else
                  v18 = v9;
                v19 = memcmp(v17, v10, v18);
                v20 = v16 < v9;
                if (v19)
                  v20 = v19 < 0;
                if (v20)
                {
                  v6 = v13 + 1;
                  v12 = v11 + ~v12;
                }
              }
              v11 = v12;
            }
            while (v12);
          }
          v5 = v7;
          if (v6 == v7)
            goto LABEL_45;
          v21 = *v6;
          v22 = *(unsigned __int8 **)(*v6 + 8);
          v23 = v22[23];
          if ((v23 & 0x80u) == 0)
            v24 = v22[23];
          else
            v24 = *((_QWORD *)v22 + 1);
          v25 = *((unsigned __int8 *)v4 + 39);
          v26 = (char)v25;
          if ((v25 & 0x80u) != 0)
            v25 = v4[3];
          if (v24 != v25)
            goto LABEL_45;
          v27 = v26 >= 0 ? (unsigned __int8 *)(v4 + 2) : (unsigned __int8 *)v4[2];
          if ((v23 & 0x80) == 0)
            break;
          if (!memcmp(*(const void **)v22, v27, *((_QWORD *)v22 + 1)))
            goto LABEL_44;
LABEL_45:
          v4 = (uint64_t *)*v4;
          if (!v4)
            goto LABEL_46;
        }
        if (v22[23])
        {
          while (*v22 == *v27)
          {
            ++v22;
            ++v27;
            if (!--v23)
              goto LABEL_44;
          }
          goto LABEL_45;
        }
LABEL_44:
        v35 = *(_DWORD *)(v21 + 16);
        v38 = &v35;
        v28 = (std::string *)sub_24BA59B88(a3, &v35, (uint64_t)&unk_24BA5E9E4, &v38);
        std::string::operator=(v28 + 1, (const std::string *)(v4 + 2));
        goto LABEL_45;
      }
    }
LABEL_46:
    v29 = v37;
    if (v37)
    {
      p_shared_owners = (unint64_t *)&v37->__shared_owners_;
      do
        v31 = __ldaxr(p_shared_owners);
      while (__stlxr(v31 - 1, p_shared_owners));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
  }
}

void sub_24BA59AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_24BA59B0C(a9);
  _Unwind_Resume(a1);
}

uint64_t sub_24BA59B0C(uint64_t a1)
{
  void *v2;

  sub_24BA59B44(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_24BA59B44(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 47) < 0)
        operator delete(v2[3]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

_QWORD *sub_24BA59B88(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
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
      v11 = *v10;
      if (*v10)
      {
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
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  v11 = operator new(0x30uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    sub_24BA3814C(a1, v19);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *v11 = *v21;
LABEL_38:
    *v21 = v11;
    goto LABEL_39;
  }
  *v11 = *v13;
  *v13 = v11;
  *(_QWORD *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    v22 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8)
        v22 %= v8;
    }
    else
    {
      v22 &= v8 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_24BA59DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  sub_24BA59DDC(v11, v10);
  _Unwind_Resume(a1);
}

void sub_24BA59DDC(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 47) < 0)
      operator delete(__p[3]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void sub_24BA59E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24BA4CF38(&dword_24BA32000, MEMORY[0x24BDACB70], a3, "CoreAnalytics shim: Failed to get base metadata shmem from xpc object!", a5, a6, a7, a8, 0);
}

void sub_24BA59E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_24BA4CF38(&dword_24BA32000, MEMORY[0x24BDACB70], a3, "CoreAnalytics shim: Failed to get metadata binary!", a5, a6, a7, a8, 0);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadString()
{
  return MEMORY[0x24BEDD6D0]();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD6D8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x24BEDD6E0](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x24BEDD6E8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x24BEDD6F8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x24BEDD700](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD708](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadRaw(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, void *a2)
{
  return MEMORY[0x24BEDD710](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD720](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD728](this);
}

void wireless_diagnostics::google::protobuf::io::CodedInputStream::~CodedInputStream(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  MEMORY[0x24BEDD730](this);
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x24BE7B1E8](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x24BE7B1F8]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x24BE7B200](this, a2);
}

{
  return MEMORY[0x24BE7B218](this, a2);
}

{
  return MEMORY[0x24BE7B220](this, a2);
}

{
  return MEMORY[0x24BE7B228](this, a2);
}

{
  return MEMORY[0x24BE7B230](this, a2);
}

uint64_t PB::TextFormatter::endObject(PB::TextFormatter *this)
{
  return MEMORY[0x24BE7B238](this);
}

void PB::Base::~Base(PB::Base *this)
{
  MEMORY[0x24BE7B240](this);
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x24BE7B258]();
}

uint64_t PB::Reader::read()
{
  return MEMORY[0x24BE7B268]();
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x24BE7B270](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x24BE7B278]();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BE7B280](this, a2);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x24BE7B288](this);
}

{
  return MEMORY[0x24BE7B290](this);
}

{
  return MEMORY[0x24BE7B298](this);
}

{
  return MEMORY[0x24BE7B2A0](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x24BE7B2A8](this, a2);
}

uint64_t PB::Writer::write()
{
  return MEMORY[0x24BE7B2B8]();
}

uint64_t PB::Writer::write(PB::Writer *this)
{
  return MEMORY[0x24BE7B2C0](this);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x24BE7B2E8](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x24BE7B2F0](this);
}

uint64_t ctu::hex(ctu *this)
{
  return MEMORY[0x24BED9BC8](this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToArray(wireless_diagnostics::google::protobuf::MessageLite *this, void *a2)
{
  return MEMORY[0x24BEDDA90](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDDAB8](this);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x24BEDA978](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x24BEDA9F0](this);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB60](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
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

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF50]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x24BEDB2A0](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x24BEDB2A8](this, a2, a3, a4);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x24BEDB5F8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x24BEDB600](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

{
  return (std::string *)MEMORY[0x24BEDB630](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB628](retstr, __val);
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

void operator delete(void *__p)
{
  off_251CCBDA8(__p);
}

uint64_t operator delete()
{
  return off_251CCBDB0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251CCBDB8(__sz);
}

uint64_t operator new()
{
  return off_251CCBDC0();
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x24BDAEA90]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x24BDB09E8](value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x24BDB0B70](xshmem, region);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

