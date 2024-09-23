@implementation USOEntityNode

- (USOEntityNode)initWithCppEntityNode:(void *)a3
{
  USOEntityNode *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)USOEntityNode;
  result = -[USOGraphNode initWithCppGraphNode:](&v5, sel_initWithCppGraphNode_);
  if (result)
    result->_usoEntityNode = a3;
  return result;
}

- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5
{
  -[USOEntityNode addIdentifierWithValue:appBundleId:namespaceString:probability:nluComponent:](self, "addIdentifierWithValue:appBundleId:namespaceString:probability:nluComponent:", a3, a4, a5, 0, 0, 0);
}

- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5 probability:(optional<double>)a6 nluComponent:(optional<siri::ontology::UsoIdentifier::NluComponent>)a7
{
  -[USOEntityNode addIdentifierWithValue:appBundleId:namespaceString:probability:nluComponent:groupIndex:](self, "addIdentifierWithValue:appBundleId:namespaceString:probability:nluComponent:groupIndex:", a3, a4, a5, *(_QWORD *)&a6.var0.var1, *(_QWORD *)&a6.var1, a7, 0);
}

- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5 probability:(optional<double>)a6 nluComponent:(optional<siri:(optional<unsigned int>)a8 :ontology::UsoIdentifier::NluComponent>)a7 groupIndex:
{
  -[USOEntityNode addIdentifierWithValue:appBundleId:namespaceString:probability:nluComponent:groupIndex:interpretationGroup:](self, "addIdentifierWithValue:appBundleId:namespaceString:probability:nluComponent:groupIndex:interpretationGroup:", a3, a4, a5, *(_QWORD *)&a6.var0.var1, *(_QWORD *)&a6.var1, a7, a8, 0);
}

- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5 probability:(optional<double>)a6 nluComponent:(optional<siri:(optional<unsigned int>)a8 :(optional<unsigned int>)a9 ontology::UsoIdentifier::NluComponent>)a7 groupIndex:interpretationGroup:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  void *__p[2];
  uint64_t v20;
  char v21;
  void *v22[2];
  char v23;
  void *__dst[2];
  char v25;
  optional<siri::ontology::UsoIdentifier::NluComponent> v26;
  optional<double> v27;

  v27 = a6;
  v26 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = objc_retainAutorelease(v12);
  std::string::basic_string[abi:ne180100](__dst, (void *)objc_msgSend(v15, "UTF8String"), objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4));
  v16 = objc_retainAutorelease(v13);
  std::string::basic_string[abi:ne180100](v22, (void *)objc_msgSend(v16, "UTF8String"), objc_msgSend(v16, "lengthOfBytesUsingEncoding:", 4));
  LOBYTE(__p[0]) = 0;
  v21 = 0;
  if (v14)
  {
    std::string::basic_string[abi:ne180100]<0>(&v17, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
    *(_OWORD *)__p = v17;
    v20 = v18;
    v21 = 1;
  }
  siri::ontology::UsoEntityNode::addIdentifier((_QWORD *)self->_usoEntityNode, (uint64_t)__dst, (uint64_t)v22, (__int128 *)__p, (__int128 *)&v27.var0, (uint64_t *)&v26, (uint64_t *)&a8, (uint64_t *)&a9);
  if (v14 && SHIBYTE(v20) < 0)
    operator delete(__p[0]);
  if (v23 < 0)
    operator delete(v22[0]);
  if (v25 < 0)
    operator delete(__dst[0]);

}

- (void)addUtteranceAlignmentWithAsrIndex:(unsigned int)a3 StartIndex:(unsigned int)a4 endIndex:(unsigned int)a5 startUnicodeScalarIndex:(unsigned int)a6 endUnicodeScalarIndex:(unsigned int)a7
{
  siri::ontology::UsoEntityNode::addUtteranceAlignment((_QWORD *)self->_usoEntityNode, a3, a4, a5, a6, a7, 0, 0);
}

- (void)addEntitySpan:(id)a3
{
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t i;
  id v70;
  int v71;
  int v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  int v79;
  size_t v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  _QWORD *v84;
  uint64_t v85;
  unint64_t v86;
  void **v87;
  _BYTE *v88;
  unint64_t v89;
  char *v90;
  void *v91;
  char *v92;
  void *v93;
  BOOL v94;
  uint64_t v95;
  unsigned int v96;
  uint64_t j;
  id v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  BOOL v107;
  void *v108;
  unsigned int v109;
  uint64_t v110;
  void *v111;
  BOOL v112;
  void *v113;
  int v114;
  char v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  void *v124;
  BOOL v125;
  void *v126;
  void *v127;
  BOOL v128;
  void *v129;
  void *v130;
  BOOL v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t k;
  id v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  int v142;
  char v143;
  uint64_t v144;
  unint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t v150;
  uint64_t *v151;
  void *v152;
  id v153;
  void *v154;
  void *v155;
  int64x2_t *usoEntityNode;
  siri::ontology::UsoEntitySpan *v157;
  void **v158;
  uint64_t v159;
  unsigned int v160;
  uint64_t v161;
  unsigned int v162;
  uint64_t v163;
  int v165;
  void *v166;
  uint64_t v167;
  id v168;
  unsigned int v169;
  _QWORD *v170;
  id v171;
  int v172;
  id obj;
  id obja;
  int objb;
  siri::ontology::UsoEntitySpan *v176;
  std::string v177;
  char v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __n128 v183;
  unint64_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  unint64_t v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  std::string v195;
  char v196;
  std::string v197;
  char v198;
  std::string __dst;
  unint64_t v200;
  unint64_t *v201;
  std::string v202;
  char v203;
  __n128 v204;
  unint64_t v205;
  __int128 v206;
  unint64_t v207;
  uint64_t v208;
  char v209;
  std::string __p;
  char v211;
  __n128 *v212;
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  uint64_t v216;

  v216 = *MEMORY[0x1E0C80C00];
  v197.__r_.__value_.__s.__data_[0] = 0;
  v198 = 0;
  v168 = a3;
  objc_msgSend(v168, "originAppId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v168, "originAppId");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (void *)objc_msgSend(v5, "UTF8String");
    objc_msgSend(v168, "originAppId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100](&__dst, v6, objc_msgSend(v7, "lengthOfBytesUsingEncoding:", 4));
    v197 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    v198 = 1;

  }
  objc_msgSend(v168, "sourceComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    v163 = 0;
    LOBYTE(v165) = 0;
    v162 = 0;
  }
  else
  {
    objc_msgSend(v168, "sourceComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = objc_msgSend(v10, "unsignedIntValue");

    v162 = v165 & 0xFFFFFF00;
    v163 = 0x100000000;
  }
  v195.__r_.__value_.__s.__data_[0] = 0;
  v196 = 0;
  objc_msgSend(v168, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (!v12)
  {
    objc_msgSend(v168, "label");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (void *)objc_msgSend(v13, "UTF8String");
    objc_msgSend(v168, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100](&__dst, v14, objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4));
    v195 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    v196 = 1;

  }
  objc_msgSend(v168, "matchInfo");
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v166)
  {
    v167 = 0;
    goto LABEL_72;
  }
  objc_msgSend(v168, "matchInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "matchSignalBitSet");
  v18 = operator new();
  *(_DWORD *)v18 = v17;
  *(_QWORD *)(v18 + 72) = 0;
  v170 = (_QWORD *)(v18 + 72);
  *(_OWORD *)(v18 + 4) = 0u;
  *(_OWORD *)(v18 + 20) = 0u;
  *(_OWORD *)(v18 + 36) = 0u;
  *(_OWORD *)(v18 + 52) = 0u;
  *(_QWORD *)(v18 + 80) = 0;
  *(_QWORD *)(v18 + 88) = 0;
  v167 = v18;

  objc_msgSend(v168, "matchInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "matchScore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (!v21)
  {
    objc_msgSend(v168, "matchInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "matchScore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    *(_DWORD *)(v167 + 4) = v24;
    *(_BYTE *)(v167 + 8) = 1;

  }
  objc_msgSend(v168, "matchInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "maxTokenCount");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 == 0;

  if (!v27)
  {
    objc_msgSend(v168, "matchInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "maxTokenCount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v167 + 12) = objc_msgSend(v29, "unsignedIntValue");
    *(_BYTE *)(v167 + 16) = 1;

  }
  objc_msgSend(v168, "matchInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "matchedTokenCount");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31 == 0;

  if (!v32)
  {
    objc_msgSend(v168, "matchInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "matchedTokenCount");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v167 + 20) = objc_msgSend(v34, "unsignedIntValue");
    *(_BYTE *)(v167 + 24) = 1;

  }
  objc_msgSend(v168, "matchInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "maxStopWordCount");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36 == 0;

  if (!v37)
  {
    objc_msgSend(v168, "matchInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "maxStopWordCount");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v167 + 28) = objc_msgSend(v39, "unsignedIntValue");
    *(_BYTE *)(v167 + 32) = 1;

  }
  objc_msgSend(v168, "matchInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "matchedStopWordCount");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41 == 0;

  if (!v42)
  {
    objc_msgSend(v168, "matchInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "matchedStopWordCount");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v167 + 36) = objc_msgSend(v44, "unsignedIntValue");
    *(_BYTE *)(v167 + 40) = 1;

  }
  objc_msgSend(v168, "matchInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "editDistance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46 == 0;

  if (!v47)
  {
    objc_msgSend(v168, "matchInfo");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "editDistance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v167 + 44) = objc_msgSend(v49, "unsignedIntValue");
    *(_BYTE *)(v167 + 48) = 1;

  }
  objc_msgSend(v168, "matchInfo");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "maxAliasCount");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51 == 0;

  if (!v52)
  {
    objc_msgSend(v168, "matchInfo");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "maxAliasCount");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v167 + 52) = objc_msgSend(v54, "unsignedIntValue");
    *(_BYTE *)(v167 + 56) = 1;

  }
  objc_msgSend(v168, "matchInfo");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "matchedAliasCount");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56 == 0;

  if (!v57)
  {
    objc_msgSend(v168, "matchInfo");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "matchedAliasCount");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v167 + 60) = objc_msgSend(v59, "unsignedIntValue");
    *(_BYTE *)(v167 + 64) = 1;

  }
  objc_msgSend(v168, "matchInfo");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "matchedAliasTypes");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61 == 0;

  if (v62)
  {
    v64 = 0;
    v65 = 0;
  }
  else
  {
    v193 = 0u;
    v194 = 0u;
    v191 = 0u;
    v192 = 0u;
    objc_msgSend(v168, "matchInfo");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "matchedAliasTypes");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v64 = 0;
    v65 = 0;
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v191, v215, 16);
    if (v66)
    {
      v67 = 0;
      v68 = *(_QWORD *)v192;
      do
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v192 != v68)
            objc_enumerationMutation(obj);
          v70 = *(id *)(*((_QWORD *)&v191 + 1) + 8 * i);
          v71 = objc_msgSend(v70, "unsignedIntValue");
          v72 = v71;
          if ((unint64_t)v65 >= v67)
          {
            v73 = (v65 - v64) >> 2;
            v74 = v73 + 1;
            if ((unint64_t)(v73 + 1) >> 62)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v67 - (_QWORD)v64) >> 1 > v74)
              v74 = (uint64_t)(v67 - (_QWORD)v64) >> 1;
            if (v67 - (unint64_t)v64 >= 0x7FFFFFFFFFFFFFFCLL)
              v75 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v75 = v74;
            if (v75)
              v75 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v75);
            else
              v76 = 0;
            v77 = (char *)(v75 + 4 * v73);
            *(_DWORD *)v77 = v72;
            v78 = v77 + 4;
            while (v65 != v64)
            {
              v79 = *((_DWORD *)v65 - 1);
              v65 -= 4;
              *((_DWORD *)v77 - 1) = v79;
              v77 -= 4;
            }
            v67 = v75 + 4 * v76;
            if (v64)
              operator delete(v64);
            v64 = v77;
            v65 = v78;
          }
          else
          {
            *(_DWORD *)v65 = v71;
            v65 += 4;
          }

        }
        v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v191, v215, 16);
      }
      while (v66);
    }

  }
  v80 = v65 - v64;
  v81 = (v65 - v64) >> 2;
  v82 = *(_QWORD *)(v167 + 88);
  v83 = *(char **)(v167 + 72);
  if (v81 > (v82 - (uint64_t)v83) >> 2)
  {
    if (v83)
    {
      *(_QWORD *)(v167 + 80) = v83;
      operator delete(v83);
      v82 = 0;
      v84 = v170;
      *v170 = 0;
      v170[1] = 0;
      v170[2] = 0;
      if ((v80 & 0x8000000000000000) == 0)
      {
LABEL_56:
        v85 = v82 >> 1;
        if (v82 >> 1 <= v81)
          v85 = (v65 - v64) >> 2;
        if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFFCLL)
          v86 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v86 = v85;
        std::vector<siri::ontology::MatchInfo::AliasType>::__vallocate[abi:ne180100](v84, v86);
        v87 = (void **)(v167 + 80);
        v83 = *(char **)(v167 + 80);
        goto LABEL_67;
      }
    }
    else
    {
      v84 = v170;
      if ((v80 & 0x8000000000000000) == 0)
        goto LABEL_56;
    }
    std::vector<int>::__throw_length_error[abi:ne180100]();
  }
  v87 = (void **)(v167 + 80);
  v88 = *(_BYTE **)(v167 + 80);
  v89 = (v88 - v83) >> 2;
  if (v89 < v81)
  {
    v90 = &v64[4 * v89];
    if (v88 != v83)
    {
      memmove(*(void **)(v167 + 72), v64, v88 - v83);
      v83 = (char *)*v87;
    }
    v80 = v65 - v90;
    if (v65 == v90)
      goto LABEL_70;
    v91 = v83;
    v92 = v90;
    goto LABEL_69;
  }
LABEL_67:
  if (v65 == v64)
    goto LABEL_70;
  v91 = v83;
  v92 = v64;
LABEL_69:
  memmove(v91, v92, v80);
LABEL_70:
  *v87 = &v83[v80];
  if (v64)
    operator delete(v64);
LABEL_72:
  v189 = 0uLL;
  v190 = 0;
  objc_msgSend(v168, "properties");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93 == 0;

  if (!v94)
  {
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    objc_msgSend(v168, "properties");
    v171 = (id)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v185, v214, 16);
    if (v95)
    {
      v96 = 0;
      obja = *(id *)v186;
      do
      {
        for (j = 0; j != v95; ++j)
        {
          if (*(id *)v186 != obja)
            objc_enumerationMutation(v171);
          v98 = *(id *)(*((_QWORD *)&v185 + 1) + 8 * j);
          objc_msgSend(v98, "key");
          v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v100 = (void *)objc_msgSend(v99, "UTF8String");
          objc_msgSend(v98, "key");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          std::string::basic_string[abi:ne180100](&v177, v100, objc_msgSend(v101, "lengthOfBytesUsingEncoding:", 4));

          __p.__r_.__value_.__s.__data_[0] = 0;
          v211 = 0;
          objc_msgSend(v98, "valueString");
          v102 = (void *)objc_claimAutoreleasedReturnValue();

          if (v102)
          {
            objc_msgSend(v98, "valueString");
            v103 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v104 = (void *)objc_msgSend(v103, "UTF8String");
            objc_msgSend(v98, "valueString");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            std::string::basic_string[abi:ne180100](&__dst, v104, objc_msgSend(v105, "lengthOfBytesUsingEncoding:", 4));
            __p = __dst;
            memset(&__dst, 0, sizeof(__dst));
            v211 = 1;

          }
          objc_msgSend(v98, "valueInt");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v106 == 0;

          if (v107)
          {
            v110 = 0;
            LOBYTE(v109) = 0;
          }
          else
          {
            objc_msgSend(v98, "valueInt");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = objc_msgSend(v108, "intValue");

            v96 = v109 >> 8;
            v110 = 0x100000000;
          }
          objc_msgSend(v98, "valueFloat");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = v111 == 0;

          if (v112)
          {
            v115 = 0;
            v3 &= 0xFFFFFF00;
          }
          else
          {
            objc_msgSend(v98, "valueFloat");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "floatValue");
            v3 = v114;

            v115 = 1;
          }
          v116 = operator new();
          if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&v202, v177.__r_.__value_.__l.__data_, v177.__r_.__value_.__l.__size_);
          else
            v202 = v177;
          std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__dst, (__int128 *)&__p);
          *(std::string *)v116 = v202;
          *(_BYTE *)(v116 + 24) = 0;
          *(_BYTE *)(v116 + 48) = 0;
          if ((_BYTE)v200)
          {
            *(std::string *)(v116 + 24) = __dst;
            *(_BYTE *)(v116 + 48) = 1;
          }
          *(_QWORD *)(v116 + 56) = v110 | v109 | (v96 << 8);
          *(_DWORD *)(v116 + 64) = v3;
          *(_BYTE *)(v116 + 68) = v115;
          v117 = *((_QWORD *)&v189 + 1);
          if (*((_QWORD *)&v189 + 1) >= v190)
          {
            v119 = (uint64_t)(*((_QWORD *)&v189 + 1) - v189) >> 3;
            if ((unint64_t)(v119 + 1) >> 61)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            v120 = (uint64_t)(v190 - v189) >> 2;
            if (v120 <= v119 + 1)
              v120 = v119 + 1;
            if (v190 - (unint64_t)v189 >= 0x7FFFFFFFFFFFFFF8)
              v121 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v121 = v120;
            v201 = &v190;
            if (v121)
              v121 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siri::ontology::SpanProperty>>>(v121);
            else
              v122 = 0;
            v123 = (uint64_t *)(v121 + 8 * v119);
            __dst.__r_.__value_.__r.__words[0] = v121;
            __dst.__r_.__value_.__l.__size_ = (std::string::size_type)v123;
            v200 = v121 + 8 * v122;
            *v123 = v116;
            __dst.__r_.__value_.__r.__words[2] = (std::string::size_type)(v123 + 1);
            std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__swap_out_circular_buffer(&v189, &__dst);
            v118 = *((_QWORD *)&v189 + 1);
            std::__split_buffer<std::unique_ptr<siri::ontology::SpanProperty>>::~__split_buffer((uint64_t)&__dst);
          }
          else
          {
            **((_QWORD **)&v189 + 1) = v116;
            v118 = v117 + 8;
          }
          *((_QWORD *)&v189 + 1) = v118;
          if (v102 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v177.__r_.__value_.__l.__data_);

        }
        v95 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v185, v214, 16);
      }
      while (v95);
    }

  }
  objc_msgSend(v168, "startIndex");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v124 == 0;

  if (v125)
  {
    v169 = 0;
    LOBYTE(objb) = 0;
    v161 = 0;
  }
  else
  {
    objc_msgSend(v168, "startIndex");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objb = objc_msgSend(v126, "unsignedIntValue");

    v169 = objb & 0xFFFFFF00;
    v161 = 0x100000000;
  }
  objc_msgSend(v168, "endIndex");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v127 == 0;

  if (v128)
  {
    v160 = 0;
    LOBYTE(v172) = 0;
    v159 = 0;
  }
  else
  {
    objc_msgSend(v168, "endIndex");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v129, "unsignedIntValue");

    v160 = v172 & 0xFFFFFF00;
    v159 = 0x100000000;
  }
  v183 = 0uLL;
  v184 = 0;
  objc_msgSend(v168, "alternatives");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v130 == 0;

  if (!v131)
  {
    v181 = 0u;
    v182 = 0u;
    v179 = 0u;
    v180 = 0u;
    objc_msgSend(v168, "alternatives");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v179, v213, 16);
    if (v133)
    {
      v134 = *(_QWORD *)v180;
      do
      {
        for (k = 0; k != v133; ++k)
        {
          if (*(_QWORD *)v180 != v134)
            objc_enumerationMutation(v132);
          v136 = *(id *)(*((_QWORD *)&v179 + 1) + 8 * k);
          objc_msgSend(v136, "value");
          v137 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v138 = (void *)objc_msgSend(v137, "UTF8String");
          objc_msgSend(v136, "value");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          std::string::basic_string[abi:ne180100](&__p, v138, objc_msgSend(v139, "lengthOfBytesUsingEncoding:", 4));

          objc_msgSend(v136, "probability");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v137) = v140 == 0;

          if ((v137 & 1) != 0)
          {
            v143 = 0;
            v3 &= 0xFFFFFF00;
          }
          else
          {
            objc_msgSend(v136, "probability");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "floatValue");
            v3 = v142;

            v143 = 1;
          }
          v144 = operator new();
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&__dst, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          else
            __dst = __p;
          *(std::string *)v144 = __dst;
          *(_DWORD *)(v144 + 24) = v3;
          *(_BYTE *)(v144 + 28) = v143;
          v145 = v183.n128_u64[1];
          if (v183.n128_u64[1] >= v184)
          {
            v147 = (uint64_t)(v183.n128_u64[1] - v183.n128_u64[0]) >> 3;
            if ((unint64_t)(v147 + 1) >> 61)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            v148 = (uint64_t)(v184 - v183.n128_u64[0]) >> 2;
            if (v148 <= v147 + 1)
              v148 = v147 + 1;
            if (v184 - v183.n128_u64[0] >= 0x7FFFFFFFFFFFFFF8)
              v149 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v149 = v148;
            v201 = &v184;
            if (v149)
              v149 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siri::ontology::SpanProperty>>>(v149);
            else
              v150 = 0;
            v151 = (uint64_t *)(v149 + 8 * v147);
            __dst.__r_.__value_.__r.__words[0] = v149;
            __dst.__r_.__value_.__l.__size_ = (std::string::size_type)v151;
            v200 = v149 + 8 * v150;
            *v151 = v144;
            __dst.__r_.__value_.__r.__words[2] = (std::string::size_type)(v151 + 1);
            std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__swap_out_circular_buffer(&v183, &__dst);
            v146 = v183.n128_u64[1];
            std::__split_buffer<std::unique_ptr<siri::ontology::AsrAlternative>>::~__split_buffer((uint64_t)&__dst);
          }
          else
          {
            *(_QWORD *)v183.n128_u64[1] = v144;
            v146 = v145 + 8;
          }
          v183.n128_u64[1] = v146;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);

        }
        v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v179, v213, 16);
      }
      while (v133);
    }

  }
  v177.__r_.__value_.__s.__data_[0] = 0;
  v178 = 0;
  objc_msgSend(v168, "originEntityId");
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  if (v152)
  {
    objc_msgSend(v168, "originEntityId");
    v153 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v154 = (void *)objc_msgSend(v153, "UTF8String");
    objc_msgSend(v168, "originEntityId");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100](&__dst, v154, objc_msgSend(v155, "lengthOfBytesUsingEncoding:", 4));
    v177 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    v178 = 1;

  }
  usoEntityNode = (int64x2_t *)self->_usoEntityNode;
  v157 = (siri::ontology::UsoEntitySpan *)operator new();
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__dst, (__int128 *)&v197);
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (__int128 *)&v195);
  LOBYTE(v208) = 0;
  v209 = 0;
  if (v166)
  {
    v208 = v167;
    v209 = 1;
    v167 = 0;
  }
  v206 = v189;
  v207 = v190;
  v190 = 0;
  v189 = 0uLL;
  v204 = v183;
  v205 = v184;
  v183 = 0uLL;
  v184 = 0;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v202, (__int128 *)&v177);
  siri::ontology::UsoEntitySpan::UsoEntitySpan((uint64_t)v157, (__int128 *)&__dst, v163 | v162 | v165, (__int128 *)&__p, &v208, (uint64_t)&v206, v161 | v169 | objb, v159 | v160 | v172, &v204, (__n128 *)&v202);
  v176 = v157;
  if (v203 && SHIBYTE(v202.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v202.__r_.__value_.__l.__data_);
  v212 = &v204;
  std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v212);
  v212 = (__n128 *)&v206;
  std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v212);
  if (v209 && v208)
    std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v208);
  if (v211 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if ((_BYTE)v200 && SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  siri::ontology::UsoEntityNode::addEntitySpan(usoEntityNode, (uint64_t *)&v176);
  v158 = (void **)v176;
  v176 = 0;
  if (v158)
  {
    siri::ontology::UsoEntitySpan::~UsoEntitySpan(v158);
    MEMORY[0x1C3BD1618]();
  }
  if (v152 && SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v177.__r_.__value_.__l.__data_);
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&v183;
  std::vector<std::unique_ptr<siri::ontology::AsrAlternative>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__dst);
  __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&v189;
  std::vector<std::unique_ptr<siri::ontology::SpanProperty>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__dst);
  if (v166 && v167)
    std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v167);
  if (v196 && SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v195.__r_.__value_.__l.__data_);
  if (v198 && SHIBYTE(v197.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v197.__r_.__value_.__l.__data_);

}

@end
