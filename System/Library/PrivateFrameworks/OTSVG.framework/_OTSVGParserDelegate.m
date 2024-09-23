@implementation _OTSVGParserDelegate

- (_OTSVGParserDelegate)initWithUnitsPerEm:(unsigned int)a3
{
  uint64_t v3;
  _OTSVGParserDelegate *v4;
  _OTSVGParserDelegate *v5;
  void *v6;
  void *v8[2];
  __int128 v9;
  int v10;
  void *__p;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v3 = *(_QWORD *)&a3;
  v14.receiver = self;
  v14.super_class = (Class)_OTSVGParserDelegate;
  v4 = -[_OTSVGParserDelegate init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    -[_OTSVGParserDelegate setErrorOccurred:](v4, "setErrorOccurred:", 0);
    -[_OTSVGParserDelegate setSkipDepth:](v5, "setSkipDepth:", 0);
    -[_OTSVGParserDelegate setUnitsPerEm:](v5, "setUnitsPerEm:", v3);
    -[_OTSVGParserDelegate setRoot:](v5, "setRoot:", 0);
    __p = 0;
    v12 = 0;
    v13 = 0;
    -[_OTSVGParserDelegate setStack:](v5, "setStack:", &__p);
    if (__p)
    {
      v12 = __p;
      operator delete(__p);
    }
    *(_OWORD *)v8 = 0u;
    v9 = 0u;
    v10 = 1065353216;
    -[_OTSVGParserDelegate setNamespaces:](v5, "setNamespaces:", v8);
    std::__hash_table<std::__hash_value_type<std::string,std::stack<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::stack<std::string>>>>::__deallocate_node((_QWORD *)v9);
    v6 = v8[0];
    v8[0] = 0;
    if (v6)
      operator delete(v6);
  }
  return v5;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  std::string::size_type size;
  std::string *v18;
  std::string::size_type v19;
  std::string::size_type v20;
  std::string::size_type v21;
  uint64_t data_low;
  BOOL v23;
  BOOL v24;
  id v26;
  uint64_t v27;
  void *v28;
  size_t v29;
  std::string *data;
  _BYTE *v31;
  std::string::size_type v32;
  BOOL v33;
  std::string *v34;
  std::string::size_type v35;
  unint64_t v36;
  unint64_t v37;
  uint8x8_t v38;
  unint64_t v39;
  unint64_t v40;
  const std::string *p_p;
  unsigned __int8 **v42;
  unsigned __int8 *v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint8x8_t v50;
  unint64_t v51;
  unsigned __int8 **v52;
  unsigned __int8 *i;
  unint64_t v54;
  char *v55;
  __int128 v56;
  float v57;
  _BOOL8 v58;
  unint64_t v59;
  unint64_t v60;
  int8x8_t prime;
  void *v62;
  void *v63;
  uint64_t v64;
  _QWORD **v65;
  unint64_t v66;
  uint8x8_t v67;
  unint64_t v68;
  uint8x8_t v69;
  uint64_t v70;
  _QWORD *j;
  unint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  unint64_t v75;
  void *v76;
  unint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  _OWORD *v84;
  uint64_t v85;
  unsigned int v86;
  uint64_t v87;
  char *value;
  char *end;
  void *v90;
  uint64_t v91;
  _BYTE *begin;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  void *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  char *v111;
  char *v112;
  void *v113;
  _BYTE *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  _QWORD *v120;
  void *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  void **v125;
  void **v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  id v140;
  void *v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  id obj;
  _QWORD *v146;
  int8x8_t v147;
  _QWORD *v148;
  uint64_t v149;
  void *v150[2];
  void *v151[2];
  unint64_t v152;
  std::string __p;
  std::string v154;
  std::string v155;
  std::string v156[2];
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  char v161;
  void *v162;
  _QWORD *v163;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (-[_OTSVGParserDelegate skipDepth](self, "skipDepth"))
  {
    -[_OTSVGParserDelegate setSkipDepth:](self, "setSkipDepth:", -[_OTSVGParserDelegate skipDepth](self, "skipDepth") + 1);
    goto LABEL_22;
  }
  memset(&__p, 170, sizeof(__p));
  SVG::convertString((SVG *)&__p, v14);
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  if (size == 26)
  {
    v18 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__p
        : (std::string *)__p.__r_.__value_.__r.__words[0];
    v19 = v18->__r_.__value_.__r.__words[0];
    v20 = v18->__r_.__value_.__l.__size_;
    v21 = v18->__r_.__value_.__r.__words[2];
    data_low = LOWORD(v18[1].__r_.__value_.__l.__data_);
    v23 = v19 == *(_QWORD *)"http://www.w3.org/2000/svg" && v20 == *(_QWORD *)"ww.w3.org/2000/svg";
    v24 = v23 && v21 == *(_QWORD *)"g/2000/svg";
    if (v24 && data_low == *(unsigned __int16 *)"vg")
    {
      v140 = v14;
      v141 = v12;
      v142 = v13;
      -[_OTSVGParserDelegate namespaces](self, "namespaces");
      v139 = v16;
      v26 = v16;
      *(_OWORD *)v150 = 0u;
      *(_OWORD *)v151 = 0u;
      v152 = 0xAAAAAAAA3F800000;
      v157 = 0u;
      v158 = 0u;
      v159 = 0u;
      v160 = 0u;
      obj = v26;
      v144 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v157, &v162, 16);
      if (v144)
      {
        v143 = *(_QWORD *)v158;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v158 != v143)
              objc_enumerationMutation(obj);
            v28 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v27);
            memset(v156, 0, sizeof(v156));
            SVG::convertString((SVG *)&v155, v28);
            if (SHIBYTE(v156[1].__r_.__value_.__r.__words[2]) < 0)
              operator delete(v156[1].__r_.__value_.__l.__data_);
            v156[1] = v155;
            if ((v155.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v29 = HIBYTE(v156[1].__r_.__value_.__r.__words[2]);
            else
              v29 = v156[1].__r_.__value_.__l.__size_;
            if (!v29
              || ((v155.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                ? (data = &v156[1])
                : (data = (std::string *)v156[1].__r_.__value_.__l.__data_),
                  (v31 = memchr(data, 58, v29), v32 = v31 - (_BYTE *)data, v31) ? (v33 = v32 == -1) : (v33 = 1),
                  v33))
            {
              std::string::operator=(v156, &__p);
            }
            else
            {
              memset(&v155, 170, sizeof(v155));
              std::string::basic_string(&v155, &v156[1], 0, v32, (std::allocator<char> *)&v154);
              std::string::basic_string(&v154, &v156[1], v32 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v161);
              if (SHIBYTE(v156[1].__r_.__value_.__r.__words[2]) < 0)
                operator delete(v156[1].__r_.__value_.__l.__data_);
              v156[1] = v154;
              if ((v155.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v34 = &v155;
              else
                v34 = (std::string *)v155.__r_.__value_.__r.__words[0];
              if ((v155.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v35 = HIBYTE(v155.__r_.__value_.__r.__words[2]);
              else
                v35 = v155.__r_.__value_.__l.__size_;
              v36 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v154, (uint64_t *)v34, v35);
              if (v147)
              {
                v37 = v36;
                v38 = (uint8x8_t)vcnt_s8(v147);
                v38.i16[0] = vaddlv_u8(v38);
                v39 = v38.u32[0];
                if (v38.u32[0] > 1uLL)
                {
                  v40 = v36;
                  if (v36 >= *(_QWORD *)&v147)
                    v40 = v36 % *(_QWORD *)&v147;
                }
                else
                {
                  v40 = (*(_QWORD *)&v147 - 1) & v36;
                }
                v42 = (unsigned __int8 **)v146[v40];
                if (!v42 || (v43 = *v42) == 0)
                {
LABEL_68:
                  p_p = &__p;
                  goto LABEL_69;
                }
                while (1)
                {
                  v44 = *((_QWORD *)v43 + 1);
                  if (v37 == v44)
                  {
                    if ((std::equal_to<std::string>::operator()[abi:nn180100]((uint64_t)&v149, v43 + 16, (unsigned __int8 *)&v155) & 1) != 0)
                    {
                      v77 = *((_QWORD *)v43 + 10) + *((_QWORD *)v43 + 9) - 1;
                      p_p = (const std::string *)(*(_QWORD *)(*((_QWORD *)v43 + 6) + 8 * (v77 / 0xAA))
                                                + 24 * (v77 % 0xAA));
                      goto LABEL_69;
                    }
                  }
                  else
                  {
                    if (v39 > 1)
                    {
                      if (v44 >= *(_QWORD *)&v147)
                        v44 %= *(_QWORD *)&v147;
                    }
                    else
                    {
                      v44 &= *(_QWORD *)&v147 - 1;
                    }
                    if (v44 != v40)
                      goto LABEL_68;
                  }
                  v43 = *(unsigned __int8 **)v43;
                  if (!v43)
                    goto LABEL_68;
                }
              }
              p_p = &__p;
LABEL_69:
              std::string::operator=(v156, p_p);
              if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v155.__r_.__value_.__l.__data_);
            }
            v45 = 0xAAAAAAAAAAAAAAAALL;
            memset(&v155, 170, sizeof(v155));
            objc_msgSend(obj, "objectForKeyedSubscript:", v28);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            SVG::convertString((SVG *)&v155, v46);

            v47 = SVG::QualifiedNameHash::operator()((uint64_t)&v151[1], (uint64_t)v156);
            v48 = v47;
            v49 = (unint64_t)v150[1];
            if (v150[1])
            {
              v50 = (uint8x8_t)vcnt_s8((int8x8_t)v150[1]);
              v50.i16[0] = vaddlv_u8(v50);
              v51 = v50.u32[0];
              if (v50.u32[0] > 1uLL)
              {
                v45 = v47;
                if ((void *)v47 >= v150[1])
                  v45 = v47 % (unint64_t)v150[1];
              }
              else
              {
                v45 = ((unint64_t)v150[1] - 1) & v47;
              }
              v52 = (unsigned __int8 **)*((_QWORD *)v150[0] + v45);
              if (v52)
              {
                for (i = *v52; i; i = *(unsigned __int8 **)i)
                {
                  v54 = *((_QWORD *)i + 1);
                  if (v54 == v48)
                  {
                    if ((SVG::QualifiedNamePredicate::operator()((uint64_t)&v152, i + 16, (unsigned __int8 *)v156) & 1) != 0)
                      goto LABEL_143;
                  }
                  else
                  {
                    if (v51 > 1)
                    {
                      if (v54 >= v49)
                        v54 %= v49;
                    }
                    else
                    {
                      v54 &= v49 - 1;
                    }
                    if (v54 != v45)
                      break;
                  }
                }
              }
            }
            v55 = (char *)operator new(0x58uLL);
            *(_QWORD *)v55 = 0;
            *((_QWORD *)v55 + 1) = v48;
            *(std::string *)(v55 + 16) = v156[0];
            memset(v156, 0, 24);
            *(std::string *)(v55 + 40) = v156[1];
            memset(&v156[1], 0, sizeof(std::string));
            v56 = *(_OWORD *)&v155.__r_.__value_.__l.__data_;
            *((_QWORD *)v55 + 10) = *((_QWORD *)&v155.__r_.__value_.__l + 2);
            *((_OWORD *)v55 + 4) = v56;
            memset(&v155, 0, sizeof(v155));
            v57 = (float)((unint64_t)v151[1] + 1);
            if (!v49 || (float)(*(float *)&v152 * (float)v49) < v57)
            {
              v58 = (v49 & (v49 - 1)) != 0;
              if (v49 < 3)
                v58 = 1;
              v59 = v58 | (2 * v49);
              v60 = vcvtps_u32_f32(v57 / *(float *)&v152);
              if (v59 <= v60)
                prime = (int8x8_t)v60;
              else
                prime = (int8x8_t)v59;
              if (*(_QWORD *)&prime == 1)
              {
                prime = (int8x8_t)2;
              }
              else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
              {
                prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
                v49 = (unint64_t)v150[1];
              }
              if (*(_QWORD *)&prime <= v49)
              {
                if (*(_QWORD *)&prime < v49)
                {
                  v68 = vcvtps_u32_f32((float)(unint64_t)v151[1] / *(float *)&v152);
                  if (v49 < 3
                    || (v69 = (uint8x8_t)vcnt_s8((int8x8_t)v49), v69.i16[0] = vaddlv_u8(v69), v69.u32[0] > 1uLL))
                  {
                    v68 = std::__next_prime(v68);
                  }
                  else
                  {
                    v70 = 1 << -(char)__clz(v68 - 1);
                    if (v68 >= 2)
                      v68 = v70;
                  }
                  if (*(_QWORD *)&prime <= v68)
                    prime = (int8x8_t)v68;
                  if (*(_QWORD *)&prime >= v49)
                  {
                    v49 = (unint64_t)v150[1];
                  }
                  else
                  {
                    if (prime)
                      goto LABEL_99;
                    v76 = v150[0];
                    v150[0] = 0;
                    if (v76)
                      operator delete(v76);
                    v49 = 0;
                    v150[1] = 0;
                  }
                }
              }
              else
              {
LABEL_99:
                if (*(_QWORD *)&prime >> 61)
                  std::__throw_bad_array_new_length[abi:nn180100]();
                v62 = operator new(8 * *(_QWORD *)&prime);
                v63 = v150[0];
                v150[0] = v62;
                if (v63)
                  operator delete(v63);
                v64 = 0;
                v150[1] = (void *)prime;
                do
                  *((_QWORD *)v150[0] + v64++) = 0;
                while (*(_QWORD *)&prime != v64);
                v65 = (_QWORD **)v151[0];
                if (v151[0])
                {
                  v66 = *((_QWORD *)v151[0] + 1);
                  v67 = (uint8x8_t)vcnt_s8(prime);
                  v67.i16[0] = vaddlv_u8(v67);
                  if (v67.u32[0] > 1uLL)
                  {
                    if (v66 >= *(_QWORD *)&prime)
                      v66 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v66 &= *(_QWORD *)&prime - 1;
                  }
                  *((_QWORD *)v150[0] + v66) = v151;
                  for (j = *v65; j; v66 = v72)
                  {
                    v72 = j[1];
                    if (v67.u32[0] > 1uLL)
                    {
                      if (v72 >= *(_QWORD *)&prime)
                        v72 %= *(_QWORD *)&prime;
                    }
                    else
                    {
                      v72 &= *(_QWORD *)&prime - 1;
                    }
                    if (v72 != v66)
                    {
                      if (!*((_QWORD *)v150[0] + v72))
                      {
                        *((_QWORD *)v150[0] + v72) = v65;
                        goto LABEL_124;
                      }
                      *v65 = (_QWORD *)*j;
                      *j = **((_QWORD **)v150[0] + v72);
                      **((_QWORD **)v150[0] + v72) = j;
                      j = v65;
                    }
                    v72 = v66;
LABEL_124:
                    v65 = (_QWORD **)j;
                    j = (_QWORD *)*j;
                  }
                }
                v49 = (unint64_t)prime;
              }
              if ((v49 & (v49 - 1)) != 0)
              {
                if (v48 >= v49)
                  v45 = v48 % v49;
                else
                  v45 = v48;
              }
              else
              {
                v45 = (v49 - 1) & v48;
              }
            }
            v73 = v150[0];
            v74 = (_QWORD *)*((_QWORD *)v150[0] + v45);
            if (v74)
            {
              *(_QWORD *)v55 = *v74;
LABEL_141:
              *v74 = v55;
              goto LABEL_142;
            }
            *(void **)v55 = v151[0];
            v151[0] = v55;
            v73[v45] = v151;
            if (*(_QWORD *)v55)
            {
              v75 = *(_QWORD *)(*(_QWORD *)v55 + 8);
              if ((v49 & (v49 - 1)) != 0)
              {
                if (v75 >= v49)
                  v75 %= v49;
              }
              else
              {
                v75 &= v49 - 1;
              }
              v74 = (char *)v150[0] + 8 * v75;
              goto LABEL_141;
            }
LABEL_142:
            ++v151[1];
LABEL_143:
            if (SHIBYTE(v155.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v155.__r_.__value_.__l.__data_);
            if (SHIBYTE(v156[1].__r_.__value_.__r.__words[2]) < 0)
              operator delete(v156[1].__r_.__value_.__l.__data_);
            if (SHIBYTE(v156[0].__r_.__value_.__r.__words[2]) < 0)
              operator delete(v156[0].__r_.__value_.__l.__data_);
            ++v27;
          }
          while (v27 != v144);
          v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, &v162, 16);
          v144 = v78;
        }
        while (v78);
      }

      std::__hash_table<std::__hash_value_type<std::string,std::stack<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::stack<std::string>>>>::__deallocate_node(v148);
      if (v146)
        operator delete(v146);
      v13 = v142;
      v79 = objc_msgSend(v142, "isEqualToString:", CFSTR("svg"));
      v80 = *(_QWORD *)-[_OTSVGParserDelegate root](self, "root");
      v12 = v141;
      if (v79)
      {
        if (v80)
        {
          -[_OTSVGParserDelegate setSkipDepth:](self, "setSkipDepth:", 1);
          v14 = v140;
          v16 = v139;
LABEL_228:
          v125 = (void **)v151[0];
          if (v151[0])
          {
            do
            {
              v126 = (void **)*v125;
              if (*((char *)v125 + 87) < 0)
                operator delete(v125[8]);
              if (*((char *)v125 + 63) < 0)
                operator delete(v125[5]);
              if (*((char *)v125 + 39) < 0)
                operator delete(v125[2]);
              operator delete(v125);
              v125 = v126;
            }
            while (v126);
          }
          v127 = v150[0];
          v150[0] = 0;
          if (v127)
            operator delete(v127);
          goto LABEL_20;
        }
        v86 = -[_OTSVGParserDelegate unitsPerEm](self, "unitsPerEm");
        v87 = operator new();
        SVG::SVGElement::SVGElement(v87, v86, 0, v150);
        end = (char *)self->stack.__end_;
        value = (char *)self->stack.__end_cap_.__value_;
        if (end < value)
        {
          *(_QWORD *)end = v87;
          v90 = end + 8;
          v14 = v140;
          v16 = v139;
          goto LABEL_193;
        }
        begin = self->stack.__begin_;
        v93 = (end - begin) >> 3;
        if (!((unint64_t)(v93 + 1) >> 61))
        {
          v94 = value - begin;
          v95 = v94 >> 2;
          if (v94 >> 2 <= (unint64_t)(v93 + 1))
            v95 = v93 + 1;
          if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFFF8)
            v96 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v96 = v95;
          v14 = v140;
          v16 = v139;
          if (v96)
            v96 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<SVG::Recorder::State *>>(v96);
          else
            v97 = 0;
          v99 = (uint64_t *)(v96 + 8 * v93);
          v100 = (void *)(v96 + 8 * v97);
          *v99 = v87;
          v90 = v99 + 1;
          v102 = (char *)self->stack.__begin_;
          v101 = (char *)self->stack.__end_;
          if (v101 != v102)
          {
            do
            {
              v103 = *((_QWORD *)v101 - 1);
              v101 -= 8;
              *--v99 = v103;
            }
            while (v101 != v102);
            v101 = (char *)self->stack.__begin_;
          }
          self->stack.__begin_ = v99;
          self->stack.__end_ = v90;
          self->stack.__end_cap_.__value_ = v100;
          if (v101)
            operator delete(v101);
LABEL_193:
          self->stack.__end_ = v90;
          v104 = -[_OTSVGParserDelegate root](self, "root");
          v105 = *v104;
          *v104 = v87;
          if (!v105)
            goto LABEL_228;
          goto LABEL_227;
        }
LABEL_263:
        abort();
      }
      v14 = v140;
      v16 = v139;
      if (!v80)
        goto LABEL_172;
      -[_OTSVGParserDelegate stack](self, "stack");
      v81 = v162;
      v82 = v163;
      if (v162)
      {
        v163 = v162;
        operator delete(v162);
      }
      if (v81 == v82)
      {
LABEL_172:
        -[_OTSVGParserDelegate setErrorOccurred:](self, "setErrorOccurred:", 1);
        objc_msgSend(v141, "abortParsing");
        goto LABEL_228;
      }
      *(_QWORD *)&v157 = 0;
      if (objc_msgSend(v142, "isEqualToString:", CFSTR("g")))
      {
        -[_OTSVGParserDelegate stack](self, "stack");
        v83 = *(v163 - 1);
        v84 = (_OWORD *)operator new();
        v85 = SVG::GElement::GElement((uint64_t)v84, v83, v150);
      }
      else if (objc_msgSend(v142, "isEqualToString:", CFSTR("defs")))
      {
        -[_OTSVGParserDelegate stack](self, "stack");
        v91 = *(v163 - 1);
        v84 = (_OWORD *)operator new();
        v85 = SVG::DefsElement::DefsElement((uint64_t)v84, v91, v150);
      }
      else if (objc_msgSend(v142, "isEqualToString:", CFSTR("use")))
      {
        -[_OTSVGParserDelegate stack](self, "stack");
        v98 = *(v163 - 1);
        v84 = (_OWORD *)operator new();
        v85 = SVG::UseElement::UseElement((uint64_t)v84, v98, v150);
      }
      else if (objc_msgSend(v142, "isEqualToString:", CFSTR("image")))
      {
        -[_OTSVGParserDelegate stack](self, "stack");
        v106 = *(v163 - 1);
        v84 = (_OWORD *)operator new();
        v85 = SVG::ImageElement::ImageElement((uint64_t)v84, v106, v150);
      }
      else if (objc_msgSend(v142, "isEqualToString:", CFSTR("path")))
      {
        -[_OTSVGParserDelegate stack](self, "stack");
        v107 = *(v163 - 1);
        v84 = (_OWORD *)operator new();
        SVG::PathElement::PathElement((uint64_t)v84, v107, v150);
      }
      else if (objc_msgSend(v142, "isEqualToString:", CFSTR("rect")))
      {
        -[_OTSVGParserDelegate stack](self, "stack");
        v108 = *(v163 - 1);
        v84 = (_OWORD *)operator new();
        v85 = (uint64_t)SVG::RectElement::RectElement(v84, v108, v150);
      }
      else
      {
        if (!objc_msgSend(v142, "isEqualToString:", CFSTR("circle")))
        {
          if (objc_msgSend(v142, "isEqualToString:", CFSTR("ellipse")))
          {
            -[_OTSVGParserDelegate stack](self, "stack");
            v128 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = (uint64_t)SVG::EllipseElement::EllipseElement(v84, v128, v150);
          }
          else if (objc_msgSend(v142, "isEqualToString:", CFSTR("line")))
          {
            -[_OTSVGParserDelegate stack](self, "stack");
            v130 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = (uint64_t)SVG::LineElement::LineElement(v84, v130, v150);
          }
          else if (objc_msgSend(v142, "isEqualToString:", CFSTR("polyline")))
          {
            -[_OTSVGParserDelegate stack](self, "stack");
            v131 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = SVG::PolyLineElement::PolyLineElement((uint64_t)v84, v131, v150);
          }
          else if (objc_msgSend(v142, "isEqualToString:", CFSTR("polygon")))
          {
            -[_OTSVGParserDelegate stack](self, "stack");
            v132 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = SVG::PolygonElement::PolygonElement((uint64_t)v84, v132, v150);
          }
          else if (objc_msgSend(v142, "isEqualToString:", CFSTR("linearGradient")))
          {
            -[_OTSVGParserDelegate stack](self, "stack");
            v133 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = SVG::LinearGradientElement::LinearGradientElement((uint64_t)v84, v133, v150);
          }
          else if (objc_msgSend(v142, "isEqualToString:", CFSTR("radialGradient")))
          {
            -[_OTSVGParserDelegate stack](self, "stack");
            v134 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = SVG::RadialGradientElement::RadialGradientElement((uint64_t)v84, v134, v150);
          }
          else if (objc_msgSend(v142, "isEqualToString:", CFSTR("stop")))
          {
            -[_OTSVGParserDelegate stack](self, "stack");
            v135 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = SVG::StopElement::StopElement((uint64_t)v84, v135, v150);
          }
          else if (objc_msgSend(v142, "isEqualToString:", CFSTR("pattern")))
          {
            -[_OTSVGParserDelegate stack](self, "stack");
            v136 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = SVG::PatternElement::PatternElement((uint64_t)v84, v136, v150);
          }
          else if (objc_msgSend(v142, "isEqualToString:", CFSTR("clipPath")))
          {
            -[_OTSVGParserDelegate stack](self, "stack");
            v137 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = SVG::ClipPathElement::ClipPathElement((uint64_t)v84, v137, v150);
          }
          else
          {
            if (!objc_msgSend(v142, "isEqualToString:", CFSTR("mask")))
            {
              -[_OTSVGParserDelegate setSkipDepth:](self, "setSkipDepth:", 1);
              v12 = v141;
              v13 = v142;
              v14 = v140;
              v16 = v139;
              goto LABEL_226;
            }
            -[_OTSVGParserDelegate stack](self, "stack");
            v138 = *(v163 - 1);
            v84 = (_OWORD *)operator new();
            v129 = SVG::MaskElement::MaskElement((uint64_t)v84, v138, v150);
          }
          *(_QWORD *)&v157 = v129;
          if (v162)
          {
            v163 = v162;
            operator delete(v162);
          }
          v12 = v141;
          v13 = v142;
          v14 = v140;
          v16 = v139;
LABEL_205:
          -[_OTSVGParserDelegate stack](self, "stack");
          v110 = (*(uint64_t (**)(_QWORD, __int128 *))(*(_QWORD *)*(v163 - 1) + 16))(*(v163 - 1), &v157);
          if (v162)
          {
            v163 = v162;
            operator delete(v162);
          }
          if (v110)
          {
            v112 = (char *)self->stack.__end_;
            v111 = (char *)self->stack.__end_cap_.__value_;
            if (v112 >= v111)
            {
              v114 = self->stack.__begin_;
              v115 = (v112 - v114) >> 3;
              if ((unint64_t)(v115 + 1) >> 61)
                goto LABEL_263;
              v116 = v111 - v114;
              v117 = v116 >> 2;
              if (v116 >> 2 <= (unint64_t)(v115 + 1))
                v117 = v115 + 1;
              if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFF8)
                v118 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v118 = v117;
              if (v118)
                v118 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<SVG::Recorder::State *>>(v118);
              else
                v119 = 0;
              v120 = (_QWORD *)(v118 + 8 * v115);
              v121 = (void *)(v118 + 8 * v119);
              *v120 = v84;
              v113 = v120 + 1;
              v123 = (char *)self->stack.__begin_;
              v122 = (char *)self->stack.__end_;
              if (v122 != v123)
              {
                do
                {
                  v124 = *((_QWORD *)v122 - 1);
                  v122 -= 8;
                  *--v120 = v124;
                }
                while (v122 != v123);
                v122 = (char *)self->stack.__begin_;
              }
              self->stack.__begin_ = v120;
              self->stack.__end_ = v113;
              self->stack.__end_cap_.__value_ = v121;
              if (v122)
                operator delete(v122);
            }
            else
            {
              *(_QWORD *)v112 = v84;
              v113 = v112 + 8;
            }
            self->stack.__end_ = v113;
          }
          else
          {
            -[_OTSVGParserDelegate setSkipDepth:](self, "setSkipDepth:", 1);
          }
LABEL_226:
          v105 = v157;
          *(_QWORD *)&v157 = 0;
          if (!v105)
            goto LABEL_228;
LABEL_227:
          (*(void (**)(uint64_t))(*(_QWORD *)v105 + 8))(v105);
          goto LABEL_228;
        }
        -[_OTSVGParserDelegate stack](self, "stack");
        v109 = *(v163 - 1);
        v84 = (_OWORD *)operator new();
        v85 = (uint64_t)SVG::CircleElement::CircleElement(v84, v109, v150);
      }
      *(_QWORD *)&v157 = v85;
      if (v162)
      {
        v163 = v162;
        operator delete(v162);
      }
      goto LABEL_205;
    }
  }
  -[_OTSVGParserDelegate setSkipDepth:](self, "setSkipDepth:", 1);
LABEL_20:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_22:

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (-[_OTSVGParserDelegate skipDepth](self, "skipDepth", a3, a4, a5, a6))
    -[_OTSVGParserDelegate setSkipDepth:](self, "setSkipDepth:", -[_OTSVGParserDelegate skipDepth](self, "skipDepth") - 1);
  else
    self->stack.__end_ = (char *)self->stack.__end_ - 8;
}

- (void)parser:(id)a3 didStartMappingPrefix:(id)a4 toURI:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t value;
  uint8x8_t v16;
  unint64_t v17;
  unint64_t v18;
  unordered_map<std::string, std::stack<std::string>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::stack<std::string>>>> *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  char *v25;
  unint64_t v26;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *>>> *p_p1;
  float v28;
  float v29;
  _BOOL8 v30;
  unint64_t v31;
  unint64_t v32;
  size_t v33;
  void **v34;
  void **v35;
  unint64_t v36;
  char *v37;
  char *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  int64_t v57;
  char *v58;
  char *v59;
  char *v60;
  unint64_t v61;
  uint64_t v62;
  _QWORD *i;
  void *v64;
  __int128 v65;
  void *v66;
  unint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  void *v77;
  _QWORD *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  int64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  __int128 v98;
  id v99;
  id v100;
  id v101;
  unordered_map<std::string, std::stack<std::string>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::stack<std::string>>>> *p_namespaces;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  void *__p[2];
  uint64_t v107;
  __int128 v108;
  unint64_t v109;

  p_namespaces = &self->namespaces;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  SVG::convertString((SVG *)__p, v9);
  v104 = 0u;
  v105 = 0u;
  v103 = 0u;
  if (v107 >= 0)
    v11 = (uint64_t *)__p;
  else
    v11 = (uint64_t *)__p[0];
  if (v107 >= 0)
    v12 = HIBYTE(v107);
  else
    v12 = (unint64_t)__p[1];
  v13 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v108, v11, v12);
  v14 = v13;
  value = self->namespaces.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  v99 = v9;
  v100 = v8;
  v101 = v10;
  if (value)
  {
    v16 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v16.i16[0] = vaddlv_u8(v16);
    v17 = v16.u32[0];
    if (v16.u32[0] > 1uLL)
    {
      v18 = v13;
      v19 = p_namespaces;
      if (v13 >= value)
        v18 = v13 % value;
    }
    else
    {
      v18 = (value - 1) & v13;
      v19 = p_namespaces;
    }
    v24 = (void **)v19->__table_.__bucket_list_.__ptr_.__value_[v18];
    if (!v24 || (v25 = (char *)*v24) == 0)
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v98 = 0u;
      goto LABEL_26;
    }
    while (1)
    {
      v26 = *((_QWORD *)v25 + 1);
      if (v26 == v14)
      {
        if ((std::equal_to<std::string>::operator()[abi:nn180100]((uint64_t)&self->namespaces.__table_.__p3_, (unsigned __int8 *)v25 + 16, (unsigned __int8 *)__p) & 1) != 0)
        {
          v66 = v101;
          goto LABEL_48;
        }
      }
      else
      {
        if (v17 > 1)
        {
          if (v26 >= value)
            v26 %= value;
        }
        else
        {
          v26 &= value - 1;
        }
        if (v26 != v18)
        {
LABEL_24:
          v98 = v103;
          v22 = *((_QWORD *)&v104 + 1);
          v23 = v104;
          v20 = *((_QWORD *)&v105 + 1);
          v21 = v105;
          goto LABEL_26;
        }
      }
      v25 = *(char **)v25;
      if (!v25)
        goto LABEL_24;
    }
  }
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v98 = 0u;
  v18 = 0xAAAAAAAAAAAAAAAALL;
LABEL_26:
  p_p1 = &self->namespaces.__table_.__p1_;
  v109 = 0xAAAAAAAAAAAAAA01;
  v25 = (char *)operator new(0x58uLL);
  *(_QWORD *)&v108 = v25;
  *((_QWORD *)&v108 + 1) = &self->namespaces.__table_.__p1_;
  *(_QWORD *)v25 = 0;
  *((_QWORD *)v25 + 1) = v14;
  *((_OWORD *)v25 + 1) = *(_OWORD *)__p;
  *((_QWORD *)v25 + 4) = v107;
  __p[0] = 0;
  __p[1] = 0;
  v107 = 0;
  *(_OWORD *)(v25 + 40) = v98;
  *((_QWORD *)v25 + 7) = v23;
  *((_QWORD *)v25 + 8) = v22;
  v103 = 0u;
  v104 = 0u;
  *((_QWORD *)v25 + 9) = v21;
  *((_QWORD *)v25 + 10) = v20;
  v105 = 0uLL;
  v28 = (float)(self->namespaces.__table_.__p2_.__value_ + 1);
  v29 = self->namespaces.__table_.__p3_.__value_;
  v9 = v99;
  v8 = v100;
  if (!value || (float)(v29 * (float)value) < v28)
  {
    v30 = 1;
    if (value >= 3)
      v30 = (value & (value - 1)) != 0;
    v31 = v30 | (2 * value);
    v32 = vcvtps_u32_f32(v28 / v29);
    if (v31 <= v32)
      v33 = v32;
    else
      v33 = v31;
    std::__hash_table<SVG::GradientElement const*,std::hash<SVG::GradientElement const*>,std::equal_to<SVG::GradientElement const*>,std::allocator<SVG::GradientElement const*>>::__rehash<true>((uint64_t)p_namespaces, v33);
    value = self->namespaces.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if ((value & (value - 1)) != 0)
    {
      if (v14 >= value)
        v18 = v14 % value;
      else
        v18 = v14;
    }
    else
    {
      v18 = (value - 1) & v14;
    }
  }
  v34 = p_namespaces->__table_.__bucket_list_.__ptr_.__value_;
  v35 = (void **)p_namespaces->__table_.__bucket_list_.__ptr_.__value_[v18];
  if (v35)
  {
    *(_QWORD *)v25 = *v35;
    v66 = v101;
LABEL_46:
    *v35 = v25;
    goto LABEL_47;
  }
  *(__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *>>> *)v25 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *>>>)p_p1->__value_.__next_;
  p_p1->__value_.__next_ = v25;
  v34[v18] = p_p1;
  v66 = v101;
  if (*(_QWORD *)v25)
  {
    v36 = *(_QWORD *)(*(_QWORD *)v25 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v36 >= value)
        v36 %= value;
    }
    else
    {
      v36 &= value - 1;
    }
    v35 = &p_namespaces->__table_.__bucket_list_.__ptr_.__value_[v36];
    goto LABEL_46;
  }
LABEL_47:
  *(_QWORD *)&v108 = 0;
  ++self->namespaces.__table_.__p2_.__value_;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::stack<std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::stack<std::string>>,void *>>>>::reset[abi:nn180100]((uint64_t)&v108);
LABEL_48:
  std::deque<std::string>::~deque[abi:nn180100]((uint64_t)&v103);
  if (SHIBYTE(v107) < 0)
    operator delete(__p[0]);
  SVG::convertString((SVG *)&v108, v8);
  v37 = (char *)*((_QWORD *)v25 + 7);
  v38 = (char *)*((_QWORD *)v25 + 6);
  v39 = (v37 - v38) >> 3;
  if (v37 == v38)
    v40 = 0;
  else
    v40 = 170 * v39 - 1;
  v41 = *((_QWORD *)v25 + 9);
  v42 = *((_QWORD *)v25 + 10) + v41;
  if (v40 == v42)
  {
    v43 = v25 + 40;
    if (v41 < 0xAA)
    {
      v59 = (char *)*((_QWORD *)v25 + 8);
      v60 = (char *)*((_QWORD *)v25 + 5);
      if (v39 >= (v59 - v60) >> 3)
      {
        if (v59 == v60)
          v61 = 1;
        else
          v61 = (v59 - v60) >> 2;
        *(_QWORD *)&v105 = v25 + 64;
        *(_QWORD *)&v103 = std::__allocate_at_least[abi:nn180100]<std::allocator<SVG::Recorder::State *>>(v61);
        *((_QWORD *)&v103 + 1) = v103 + 8 * v39;
        *(_QWORD *)&v104 = *((_QWORD *)&v103 + 1);
        *((_QWORD *)&v104 + 1) = v103 + 8 * v62;
        __p[0] = operator new(0xFF0uLL);
        std::__split_buffer<std::string *>::push_back(&v103, __p);
        for (i = (_QWORD *)*((_QWORD *)v25 + 7);
              i != *((_QWORD **)v25 + 6);
              std::__split_buffer<std::string *>::push_front((uint64_t)&v103, i))
        {
          --i;
        }
        v64 = (void *)*((_QWORD *)v25 + 5);
        v65 = v104;
        *(_OWORD *)(v25 + 40) = v103;
        *(_OWORD *)(v25 + 56) = v65;
        if (v64)
          operator delete(v64);
        goto LABEL_85;
      }
      if (v59 != v37)
      {
        *(_QWORD *)&v103 = operator new(0xFF0uLL);
        std::__split_buffer<std::string *>::push_back((_QWORD *)v25 + 5, &v103);
LABEL_85:
        v38 = (char *)*((_QWORD *)v25 + 6);
        v42 = *((_QWORD *)v25 + 10) + *((_QWORD *)v25 + 9);
        goto LABEL_86;
      }
      *(_QWORD *)&v103 = operator new(0xFF0uLL);
      std::__split_buffer<std::string *>::push_front((uint64_t)(v25 + 40), &v103);
      v78 = (_QWORD *)*((_QWORD *)v25 + 6);
      v37 = (char *)*((_QWORD *)v25 + 7);
      v80 = *v78;
      v79 = (char *)(v78 + 1);
      v45 = v80;
      *((_QWORD *)v25 + 6) = v79;
      if (v37 == *((char **)v25 + 8))
      {
        v83 = (uint64_t)&v79[-*v43];
        if ((unint64_t)v79 > *v43)
        {
          v48 = v9;
          v49 = v8;
          v84 = v83 >> 3;
          v51 = v83 >> 3 < -1;
          v85 = (v83 >> 3) + 2;
          if (v51)
            v86 = v85;
          else
            v86 = v84 + 1;
          v87 = -(v86 >> 1);
          v88 = v86 >> 1;
          v89 = &v79[-8 * v88];
          v90 = v37 - v79;
          if (v37 != v79)
          {
            memmove(&v79[-8 * v88], v79, v37 - v79);
            v79 = (char *)*((_QWORD *)v25 + 6);
          }
          v37 = &v89[v90];
          v58 = &v79[8 * v87];
          goto LABEL_63;
        }
        if (v37 == (char *)*v43)
          v91 = 1;
        else
          v91 = (uint64_t)&v37[-*v43] >> 2;
        v68 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<SVG::Recorder::State *>>(v91);
        v69 = &v68[8 * (v91 >> 2)];
        v71 = &v68[8 * v92];
        v93 = (uint64_t *)*((_QWORD *)v25 + 6);
        v37 = v69;
        v94 = *((_QWORD *)v25 + 7) - (_QWORD)v93;
        if (v94)
        {
          v37 = &v69[v94 & 0xFFFFFFFFFFFFFFF8];
          v95 = 8 * (v94 >> 3);
          v96 = &v68[8 * (v91 >> 2)];
          do
          {
            v97 = *v93++;
            *(_QWORD *)v96 = v97;
            v96 += 8;
            v95 -= 8;
          }
          while (v95);
        }
LABEL_81:
        v77 = (void *)*((_QWORD *)v25 + 5);
        *((_QWORD *)v25 + 5) = v68;
        *((_QWORD *)v25 + 6) = v69;
        *((_QWORD *)v25 + 7) = v37;
        *((_QWORD *)v25 + 8) = v71;
        if (v77)
        {
          operator delete(v77);
          v37 = (char *)*((_QWORD *)v25 + 7);
        }
      }
    }
    else
    {
      *((_QWORD *)v25 + 9) = v41 - 170;
      v46 = *(_QWORD *)v38;
      v44 = v38 + 8;
      v45 = v46;
      *((_QWORD *)v25 + 6) = v44;
      if (v37 == *((char **)v25 + 8))
      {
        v47 = (uint64_t)&v44[-*v43];
        if ((unint64_t)v44 > *v43)
        {
          v48 = v9;
          v49 = v8;
          v50 = v47 >> 3;
          v51 = v47 >> 3 < -1;
          v52 = (v47 >> 3) + 2;
          if (v51)
            v53 = v52;
          else
            v53 = v50 + 1;
          v54 = -(v53 >> 1);
          v55 = v53 >> 1;
          v56 = &v44[-8 * v55];
          v57 = v37 - v44;
          if (v37 != v44)
          {
            memmove(&v44[-8 * v55], v44, v37 - v44);
            v37 = (char *)*((_QWORD *)v25 + 6);
          }
          v58 = &v37[8 * v54];
          v37 = &v56[v57];
LABEL_63:
          *((_QWORD *)v25 + 6) = v58;
          *((_QWORD *)v25 + 7) = v37;
          v8 = v49;
          v9 = v48;
          goto LABEL_84;
        }
        if (v37 == (char *)*v43)
          v67 = 1;
        else
          v67 = (uint64_t)&v37[-*v43] >> 2;
        v68 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<SVG::Recorder::State *>>(v67);
        v69 = &v68[8 * (v67 >> 2)];
        v71 = &v68[8 * v70];
        v72 = (uint64_t *)*((_QWORD *)v25 + 6);
        v37 = v69;
        v73 = *((_QWORD *)v25 + 7) - (_QWORD)v72;
        if (v73)
        {
          v37 = &v69[v73 & 0xFFFFFFFFFFFFFFF8];
          v74 = 8 * (v73 >> 3);
          v75 = &v68[8 * (v67 >> 2)];
          do
          {
            v76 = *v72++;
            *(_QWORD *)v75 = v76;
            v75 += 8;
            v74 -= 8;
          }
          while (v74);
        }
        goto LABEL_81;
      }
    }
LABEL_84:
    *(_QWORD *)v37 = v45;
    *((_QWORD *)v25 + 7) += 8;
    goto LABEL_85;
  }
LABEL_86:
  v81 = *(_QWORD *)&v38[8 * (v42 / 0xAA)] + 24 * (v42 % 0xAA);
  v82 = v108;
  *(_QWORD *)(v81 + 16) = v109;
  *(_OWORD *)v81 = v82;
  v109 = 0;
  v108 = 0uLL;
  ++*((_QWORD *)v25 + 10);

  if (SHIBYTE(v109) < 0)
    operator delete((void *)v108);
}

- (void)parser:(id)a3 didEndMappingPrefix:(id)a4
{
  id v6;
  id v7;
  uint64_t *p_p;
  unint64_t v9;
  unint64_t v10;
  unint64_t value;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unint64_t v15;
  void **v16;
  unsigned __int8 *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint8x8_t v24;
  void **v25;
  unsigned __int8 *v26;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *>>> *v27;
  unint64_t next;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  void *__p;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *>>> *p_p1;
  char v34;
  unsigned __int8 v35;
  char v36;

  v6 = a4;
  v7 = a3;
  SVG::convertString((SVG *)&__p, v6);
  if ((v35 & 0x80u) == 0)
    p_p = (uint64_t *)&__p;
  else
    p_p = (uint64_t *)__p;
  if ((v35 & 0x80u) == 0)
    v9 = v35;
  else
    v9 = (unint64_t)p_p1;
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v36, p_p, v9);
  value = self->namespaces.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value)
    goto LABEL_24;
  v12 = v10;
  v13 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v13.i16[0] = vaddlv_u8(v13);
  v14 = v13.u32[0];
  if (v13.u32[0] > 1uLL)
  {
    v15 = v10;
    if (v10 >= value)
      v15 = v10 % value;
  }
  else
  {
    v15 = (value - 1) & v10;
  }
  v16 = (void **)self->namespaces.__table_.__bucket_list_.__ptr_.__value_[v15];
  if (v16)
  {
    v17 = (unsigned __int8 *)*v16;
    if (*v16)
    {
      do
      {
        v18 = *((_QWORD *)v17 + 1);
        if (v18 == v12)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100]((uint64_t)&self->namespaces.__table_.__p3_, v17 + 16, (unsigned __int8 *)&__p) & 1) != 0)break;
        }
        else
        {
          if (v14 > 1)
          {
            if (v18 >= value)
              v18 %= value;
          }
          else
          {
            v18 &= value - 1;
          }
          if (v18 != v15)
            goto LABEL_24;
        }
        v17 = *(unsigned __int8 **)v17;
      }
      while (v17);
    }
  }
  else
  {
LABEL_24:
    v17 = 0;
  }
  if ((char)v35 < 0)
    operator delete(__p);
  v19 = *((_QWORD *)v17 + 10) - 1;
  v20 = *(_QWORD *)(*((_QWORD *)v17 + 6) + 8 * ((v19 + *((_QWORD *)v17 + 9)) / 0xAAuLL))
      + 24 * ((v19 + *((_QWORD *)v17 + 9)) % 0xAAuLL);
  if (*(char *)(v20 + 23) < 0)
  {
    operator delete(*(void **)v20);
    v19 = *((_QWORD *)v17 + 10) - 1;
  }
  *((_QWORD *)v17 + 10) = v19;
  std::deque<std::string>::__maybe_remove_back_spare[abi:nn180100]((_QWORD *)v17 + 5);
  v21 = *((_QWORD *)v17 + 10);

  if (!v21)
  {
    v22 = self->namespaces.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    v23 = *((_QWORD *)v17 + 1);
    v24 = (uint8x8_t)vcnt_s8((int8x8_t)v22);
    v24.i16[0] = vaddlv_u8(v24);
    if (v24.u32[0] > 1uLL)
    {
      if (v23 >= v22)
        v23 %= v22;
    }
    else
    {
      v23 &= v22 - 1;
    }
    v25 = self->namespaces.__table_.__bucket_list_.__ptr_.__value_;
    v26 = (unsigned __int8 *)v25[v23];
    do
    {
      v27 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, std::stack<std::string>>, void *>>> *)v26;
      v26 = *(unsigned __int8 **)v26;
    }
    while (v26 != v17);
    if (v27 == &self->namespaces.__table_.__p1_)
      goto LABEL_47;
    next = (unint64_t)v27[1].__value_.__next_;
    if (v24.u32[0] > 1uLL)
    {
      if (next >= v22)
        next %= v22;
    }
    else
    {
      next &= v22 - 1;
    }
    if (next != v23)
    {
LABEL_47:
      if (!*(_QWORD *)v17)
        goto LABEL_48;
      v29 = *(_QWORD *)(*(_QWORD *)v17 + 8);
      if (v24.u32[0] > 1uLL)
      {
        if (v29 >= v22)
          v29 %= v22;
      }
      else
      {
        v29 &= v22 - 1;
      }
      if (v29 != v23)
LABEL_48:
        v25[v23] = 0;
    }
    v30 = *(unint64_t **)v17;
    if (*(_QWORD *)v17)
    {
      v31 = v30[1];
      if (v24.u32[0] > 1uLL)
      {
        if (v31 >= v22)
          v31 %= v22;
      }
      else
      {
        v31 &= v22 - 1;
      }
      if (v31 != v23)
      {
        self->namespaces.__table_.__bucket_list_.__ptr_.__value_[v31] = v27;
        v30 = *(unint64_t **)v17;
      }
    }
    v27->__value_.__next_ = v30;
    *(_QWORD *)v17 = 0;
    --self->namespaces.__table_.__p2_.__value_;
    __p = v17;
    p_p1 = &self->namespaces.__table_.__p1_;
    v34 = 1;
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::stack<std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::stack<std::string>>,void *>>>>::reset[abi:nn180100]((uint64_t)&__p);
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5;

  v5 = a3;
  if (!-[_OTSVGParserDelegate errorOccurred](self, "errorOccurred"))
  {
    -[_OTSVGParserDelegate setErrorOccurred:](self, "setErrorOccurred:", 1);
    objc_msgSend(v5, "abortParsing");
  }

}

- (void)parser:(id)a3 validationErrorOccurred:(id)a4
{
  id v5;

  v5 = a3;
  if (!-[_OTSVGParserDelegate errorOccurred](self, "errorOccurred"))
  {
    -[_OTSVGParserDelegate setErrorOccurred:](self, "setErrorOccurred:", 1);
    objc_msgSend(v5, "abortParsing");
  }

}

- (BOOL)errorOccurred
{
  return self->errorOccurred;
}

- (void)setErrorOccurred:(BOOL)a3
{
  self->errorOccurred = a3;
}

- (unsigned)skipDepth
{
  return self->skipDepth;
}

- (void)setSkipDepth:(unsigned int)a3
{
  self->skipDepth = a3;
}

- (unsigned)unitsPerEm
{
  return self->unitsPerEm;
}

- (void)setUnitsPerEm:(unsigned int)a3
{
  self->unitsPerEm = a3;
}

- (void)root
{
  return self->root;
}

- (void)setRoot:(void *)a3
{
  self->root = a3;
}

- (vector<std::reference_wrapper<SVG::Element>,)stack
{
  vector<std::reference_wrapper<SVG::Element>, std::allocator<std::reference_wrapper<SVG::Element>>> *result;

  objc_copyCppObjectAtomic(retstr, &self->stack, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (void)setStack:()vector<std:(std::allocator<std::reference_wrapper<SVG::Element>>> *)a3 :reference_wrapper<SVG::Element>
{
  objc_copyCppObjectAtomic(&self->stack, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (unordered_map<std::string,)namespaces
{
  unordered_map<std::string, std::stack<std::string>, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, std::stack<std::string>>>> *result;

  objc_copyCppObjectAtomic(retstr, &self->namespaces, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__35);
  return result;
}

- (void)setNamespaces:()unordered_map<std:()std:()std:()std:(std:(std::stack<std::string>>>> *)a3 :allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string> :stack<std::string> :string
{
  objc_copyCppObjectAtomic(&self->namespaces, a3, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property__36);
}

- (void).cxx_destruct
{
  void *begin;

  std::__hash_table<std::__hash_value_type<std::string,std::stack<std::string>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::stack<std::string>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::stack<std::string>>>>::~__hash_table((uint64_t)&self->namespaces);
  begin = self->stack.__begin_;
  if (begin)
  {
    self->stack.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end
