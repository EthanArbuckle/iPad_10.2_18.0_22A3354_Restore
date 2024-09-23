@implementation RKEventIdentifier

- (RKEventIdentifier)init
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  RKEventIdentifier *v6;
  uint64_t i;
  RKEventIdentifier *v8;
  RKEventIdentifier *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    v6 = self;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v8 = -[RKEventIdentifier initWithLanguageID:](v6, "initWithLanguageID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        if (v8)
        {
          self = v8;
          v9 = self;
          goto LABEL_12;
        }
        v6 = 0;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = 0;
      self = 0;
      v9 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (RKEventIdentifier)initWithLanguageID:(id)a3
{
  id v4;
  RKEventIdentifier *v5;
  RKNLEventTokenizer *v6;
  RKNLEventTokenizer *tokenizer;
  uint64_t v8;
  RKMontrealModel *model;
  RKEventIdentifier *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RKEventIdentifier;
  v5 = -[RKEventIdentifier init](&v12, sel_init);
  if (!v5)
    goto LABEL_3;
  v6 = -[RKNLEventTokenizer initWithLanguageID:]([RKNLEventTokenizer alloc], "initWithLanguageID:", v4);
  tokenizer = v5->_tokenizer;
  v5->_tokenizer = v6;

  +[RKMontrealModel modelForLanguage:](RKMontrealModel, "modelForLanguage:", v4);
  v8 = objc_claimAutoreleasedReturnValue();
  model = v5->_model;
  v5->_model = (RKMontrealModel *)v8;

  if (!v5->_model)
    v10 = 0;
  else
LABEL_3:
    v10 = v5;

  return v10;
}

- (void)resetEventIdentifierModel
{
  RKMontrealModel *model;

  model = self->_model;
  if (model)
    -[RKMontrealModel reset](model, "reset");
}

- (id)_identifyOwnedTokenSequences:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int *outputPermutation;
  _DWORD *v16;
  uint64_t j;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  char *v26;
  uint64_t m;
  uint64_t n;
  id v29;
  RKEventIdentification *v30;
  RKEventIdentification *v31;
  uint64_t v33;
  _DWORD *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v39 = -[RKMontrealModel model](self->_model, "model");
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v5 = v4;
  v35 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  v36 = v5;
  if (!v6)
  {

LABEL_33:
    v31 = 0;
    v29 = v36;
    goto LABEL_34;
  }
  v7 = 0;
  v8 = *(_QWORD *)v46;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v46 != v8)
        objc_enumerationMutation(v5);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "count");
      v11 = kMaxSequenceLength;
      if (v10 < kMaxSequenceLength)
        v11 = v10;
      v7 += v11;
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  }
  while (v6);

  if (!v7)
    goto LABEL_33;
  v34 = malloc_type_calloc(v7, 0x14uLL, 0x100004052888210uLL);
  v12 = weak_MRLModelStateCreate(v39);
  v13 = 0x2549B1000uLL;
  if (!v12)
    __assert_rtn("-[RKEventIdentifier _identifyOwnedTokenSequences:]", "RKEventIdentifier.mm", 266, "modelState");
  v33 = v12;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v37 = v36;
  v14 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v14)
  {
    outputPermutation = self->_outputPermutation;
    v40 = *(_QWORD *)v42;
    v38 = 15;
    v16 = v34;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v42 != v40)
          objc_enumerationMutation(v37);
        v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        v19 = objc_msgSend(v18, "count", v33);
        if (v19 >= *(int *)(v13 + 2712))
          v20 = *(int *)(v13 + 2712);
        else
          v20 = v19;
        v21 = operator new[]();
        v22 = v21;
        if (v20)
        {
          v23 = v14;
          for (k = 0; k != v20; ++k)
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", k);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(v22 + 4 * k) = objc_msgSend(v25, "tokenID");

          }
          v26 = (char *)&v33 - ((v38 + 20 * v20) & 0xFFFFFFFFFFFFFFF0);
          weak_MRLModelRecognizeSequence(v39, v22, v20, v26, 1);
          for (m = 0; m != v20; ++m)
          {
            for (n = 0; n != 5; ++n)
              v16[outputPermutation[n]] = *(_DWORD *)&v26[n * 4];
            v16 += 5;
            v26 += 20;
          }
          MEMORY[0x212BA1620](v22, 0x1000C8052888210);
          v14 = v23;
          v13 = 0x2549B1000;
        }
        else
        {
          MEMORY[0x212BA1620](v21, 0x1000C8052888210);
        }
      }
      v14 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v14);
  }

  weak_MRLModelStateRelease(v39, v33);
  v29 = v36;
  v30 = [RKEventIdentification alloc];
  v31 = -[RKEventIdentification initWithOwnedTokenSequences:probabilities:](v30, "initWithOwnedTokenSequences:probabilities:", v37, v34);
LABEL_34:

  return v31;
}

- (id)_identifyStrings:(id)a3 otherDateCount:(unint64_t)a4 otherDates:(RKEventIdentifierRange *)a5
{
  RKEventIdentifier *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  RKEventIdentifierRange *v12;
  unint64_t var0;
  NSUInteger location;
  NSUInteger length;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  __int128 v23;
  unint64_t v24;
  NSUInteger v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  char *v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  int *outputPermutation;
  uint64_t i;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  __int128 v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  char *v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  RKNLEventToken *v85;
  void *v86;
  void *v87;
  unint64_t j;
  void *v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  id v93;
  char *v94;
  size_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  char *v100;
  size_t v101;
  id v103;
  uint64_t v104;
  id obj;
  uint64_t v106;
  id v107;
  uint64_t v108;
  void *context;
  uint64_t v110;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  int v117;
  void *__p;
  char *v119;
  char *v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v103 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v7->_ioMappings)
  {
    if (-[RKMontrealModel model](v7->_model, "model"))
    {
      v32 = ((uint64_t (*)(void *))weak_MRLModelGetIOMappings)(-[RKMontrealModel model](v7->_model, "model"));
      v7->_ioMappings = (const void *)v32;
      if (v32)
      {
        v33 = 0;
        __p = 0;
        v119 = 0;
        v120 = 0;
        do
        {
          v34 = (uint64_t)v7->_ioMappings + 48;
          v117 = kOutputMappingCodesForEventIds[v33];
          v35 = *(_DWORD *)std::map<int,int>::at(v34, &v117);
          v36 = v119;
          if (v119 >= v120)
          {
            v38 = (v119 - (_BYTE *)__p) >> 3;
            v39 = v38 + 1;
            if ((unint64_t)(v38 + 1) >> 61)
              std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
            v40 = v120 - (_BYTE *)__p;
            if ((v120 - (_BYTE *)__p) >> 2 > v39)
              v39 = v40 >> 2;
            if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
              v41 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v41 = v39;
            v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,int>>>((uint64_t)&v120, v41);
            v44 = &v42[8 * v38];
            *(_DWORD *)v44 = v35;
            *((_DWORD *)v44 + 1) = v33;
            v46 = (char *)__p;
            v45 = v119;
            v47 = v44;
            if (v119 != __p)
            {
              do
              {
                v48 = *((_QWORD *)v45 - 1);
                v45 -= 8;
                *((_QWORD *)v47 - 1) = v48;
                v47 -= 8;
              }
              while (v45 != v46);
              v45 = (char *)__p;
            }
            v37 = v44 + 8;
            __p = v47;
            v119 = v44 + 8;
            v120 = &v42[8 * v43];
            if (v45)
              operator delete(v45);
          }
          else
          {
            *(_DWORD *)v119 = v35;
            *((_DWORD *)v36 + 1) = v33;
            v37 = v36 + 8;
          }
          v119 = v37;
          ++v33;
        }
        while (v33 != 5);
        v49 = 126 - 2 * __clz((v37 - (_BYTE *)__p) >> 3);
        if (v37 == __p)
          v50 = 0;
        else
          v50 = v49;
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,false>((uint64_t)__p, (int *)v37, (uint64_t)&v117, v50, 1);
        v51 = (char *)__p;
        outputPermutation = v7->_outputPermutation;
        for (i = 4; i != 44; i += 8)
          *outputPermutation++ = *(_DWORD *)&v51[i];
        v119 = v51;
        operator delete(v51);
      }
    }
  }
  objc_sync_exit(v7);

  if (v7->_ioMappings)
  {
    __p = 0;
    v119 = 0;
    v120 = 0;
    if (a5)
    {
      if (a4)
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = &a5[v11];
          var0 = v12->var0;
          location = v12->var1.location;
          length = v12->var1.length;
          if (v10 >= v9)
          {
            v17 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v8) >> 3) + 1;
            if (v17 > 0xAAAAAAAAAAAAAAALL)
              std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((v9 - v8) >> 3) > v17)
              v17 = 0x5555555555555556 * ((v9 - v8) >> 3);
            v18 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3) >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v17;
            if (v18)
            {
              if (v18 > 0xAAAAAAAAAAAAAAALL)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v19 = var0;
              v20 = (char *)operator new(24 * v18);
              var0 = v19;
            }
            else
            {
              v20 = 0;
            }
            v21 = &v20[8 * ((v10 - v8) >> 3)];
            *(_QWORD *)v21 = var0;
            *((_QWORD *)v21 + 1) = location;
            v21[16] = 1;
            if (v10 == v8)
            {
              v8 = &v20[8 * ((v10 - v8) >> 3)];
            }
            else
            {
              v22 = &v20[8 * ((v10 - v8) >> 3)];
              do
              {
                v23 = *(_OWORD *)(v10 - 24);
                *((_QWORD *)v22 - 1) = *((_QWORD *)v10 - 1);
                *(_OWORD *)(v22 - 24) = v23;
                v22 -= 24;
                v10 -= 24;
              }
              while (v10 != v8);
              v10 = v8;
              v8 = v22;
            }
            v9 = &v20[24 * v18];
            v16 = (unint64_t *)(v21 + 24);
            if (v10)
            {
              v24 = var0;
              operator delete(v10);
              var0 = v24;
            }
          }
          else
          {
            *(_QWORD *)v10 = var0;
            *((_QWORD *)v10 + 1) = location;
            v16 = (unint64_t *)(v10 + 24);
            v10[16] = 1;
          }
          v25 = length + location;
          if (v16 >= (unint64_t *)v9)
            break;
          *v16 = var0;
          v16[1] = v25;
          v10 = (char *)(v16 + 3);
          *((_BYTE *)v16 + 16) = 0;
LABEL_44:
          if (++v11 == a4)
            goto LABEL_71;
        }
        v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v16 - v8) >> 3) + 1;
        if (v26 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * ((v9 - v8) >> 3) > v26)
          v26 = 0x5555555555555556 * ((v9 - v8) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3) >= 0x555555555555555)
          v27 = 0xAAAAAAAAAAAAAAALL;
        else
          v27 = v26;
        if (v27)
        {
          if (v27 > 0xAAAAAAAAAAAAAAALL)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v28 = var0;
          v29 = (char *)operator new(24 * v27);
          var0 = v28;
        }
        else
        {
          v29 = 0;
        }
        v30 = &v29[8 * (((char *)v16 - v8) >> 3)];
        v9 = &v29[24 * v27];
        *(_QWORD *)v30 = var0;
        *((_QWORD *)v30 + 1) = v25;
        v30[16] = 0;
        v10 = v30 + 24;
        if (v16 == (unint64_t *)v8)
        {
          v8 = (char *)v16;
        }
        else
        {
          do
          {
            v31 = *(_OWORD *)(v16 - 3);
            *((_QWORD *)v30 - 1) = *(v16 - 1);
            *(_OWORD *)(v30 - 24) = v31;
            v30 -= 24;
            v16 -= 3;
          }
          while (v16 != (unint64_t *)v8);
          if (!v8)
            goto LABEL_43;
        }
        operator delete(v8);
LABEL_43:
        v8 = v30;
        goto LABEL_44;
      }
      v8 = 0;
      v10 = 0;
LABEL_71:
      v55 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v10 - v8) >> 3));
      if (v10 == v8)
        v56 = 0;
      else
        v56 = v55;
      std::__introsort<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *,false>((uint64_t)v8, (unint64_t)v10, v56, 1);
      if (v10 != v8)
      {
        v57 = 0;
        v58 = 0;
        v59 = 0;
        v60 = v8;
        do
        {
          if (v60[16])
          {
            if (v57)
            {
              ++v57;
            }
            else
            {
              v58 = *(_QWORD *)v60;
              v59 = *((_QWORD *)v60 + 1);
              v57 = 1;
            }
          }
          else if (!--v57)
          {
            if (v58 == *(_QWORD *)v60)
            {
              v61 = *((_QWORD *)v60 + 1) - v59;
              v62 = v119;
              if (v119 >= v120)
              {
                v64 = (char *)__p;
                v65 = 0xAAAAAAAAAAAAAAABLL * ((v119 - (_BYTE *)__p) >> 3);
                v66 = v65 + 1;
                if (v65 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
                if (0x5555555555555556 * ((v120 - (_BYTE *)__p) >> 3) > v66)
                  v66 = 0x5555555555555556 * ((v120 - (_BYTE *)__p) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * ((v120 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
                  v67 = 0xAAAAAAAAAAAAAAALL;
                else
                  v67 = v66;
                if (v67)
                {
                  v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RKEventIdentifierRange>>((uint64_t)&v120, v67);
                  v64 = (char *)__p;
                  v62 = v119;
                }
                else
                {
                  v68 = 0;
                }
                v69 = &v68[24 * v65];
                *(_QWORD *)v69 = v58;
                *((_QWORD *)v69 + 1) = v59;
                *((_QWORD *)v69 + 2) = v61;
                v70 = v69;
                if (v62 != v64)
                {
                  do
                  {
                    v71 = *(_OWORD *)(v62 - 24);
                    *((_QWORD *)v70 - 1) = *((_QWORD *)v62 - 1);
                    *(_OWORD *)(v70 - 24) = v71;
                    v70 -= 24;
                    v62 -= 24;
                  }
                  while (v62 != v64);
                  v64 = (char *)__p;
                }
                v63 = v69 + 24;
                __p = v70;
                v119 = v69 + 24;
                v120 = &v68[24 * v67];
                if (v64)
                  operator delete(v64);
              }
              else
              {
                *(_QWORD *)v119 = v58;
                *((_QWORD *)v62 + 1) = v59;
                v63 = v62 + 24;
                *((_QWORD *)v62 + 2) = v61;
              }
              v57 = 0;
              v119 = v63;
            }
            else
            {
              v57 = 0;
            }
          }
          v60 += 24;
        }
        while (v60 != v10);
      }
      if (v8)
        operator delete(v8);
    }
    v107 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    obj = v103;
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
    if (v72)
    {
      v73 = 0;
      v104 = 0;
      v106 = *(_QWORD *)v114;
      do
      {
        v74 = 0;
        v112 = v104;
        v104 += v72;
        v108 = v72;
        do
        {
          if (*(_QWORD *)v114 != v106)
            objc_enumerationMutation(obj);
          v110 = v74;
          v75 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v74);
          context = (void *)MEMORY[0x212BA17B8]();
          v76 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v77 = (char *)__p;
          if (v73 >= 0xAAAAAAAAAAAAAAABLL * ((v119 - (_BYTE *)__p) >> 3))
          {
            v78 = 0;
          }
          else
          {
            v78 = 0;
            v79 = 24 * v73;
            do
            {
              if (*(_QWORD *)&v77[v79] != v112)
                break;
              v80 = &v77[v79];
              v82 = *((_QWORD *)v80 + 1);
              v81 = *((_QWORD *)v80 + 2);
              objc_msgSend(v75, "substringWithRange:", v78, v82 - v78);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              -[RKNLEventTokenizer buildTokenSquence:withOffset:](v7->_tokenizer, "buildTokenSquence:withOffset:", v83, v78);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v84, "count"))
                objc_msgSend(v76, "addObjectsFromArray:", v84);
              v85 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", CFSTR("DATE_TIME"), v82, v81);
              -[RKNLEventToken setTokenID:](v85, "setTokenID:", IOMappings::lookupInput((IOMappings *)v7->_ioMappings, "DATE_TIME", 9uLL));
              objc_msgSend(v76, "addObject:", v85);

              v78 = v81 + v82;
              ++v73;
              v77 = (char *)__p;
              v79 += 24;
            }
            while (v73 < 0xAAAAAAAAAAAAAAABLL * ((v119 - (_BYTE *)__p) >> 3));
          }
          if (v78 < objc_msgSend(v75, "length"))
          {
            objc_msgSend(v75, "substringWithRange:", v78, objc_msgSend(v75, "length") - v78);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            -[RKNLEventTokenizer buildTokenSquence:withOffset:](v7->_tokenizer, "buildTokenSquence:withOffset:", v86, v78);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v87, "count"))
              objc_msgSend(v76, "addObjectsFromArray:", v87);

          }
          for (j = 0; objc_msgSend(v76, "count") > j; ++j)
          {
            objc_msgSend(v76, "objectAtIndexedSubscript:", j);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "string");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = +[RKNLEventTokenizer isSpecialToken:](RKNLEventTokenizer, "isSpecialToken:", v90);

            objc_msgSend(v76, "objectAtIndexedSubscript:", j);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "string");
            if (v91)
            {
              v93 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v94 = (char *)objc_msgSend(v93, "UTF8String");

              v95 = strlen(v94);
              v96 = IOMappings::lookupInput((IOMappings *)v7->_ioMappings, v94, v95);
            }
            else
            {
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "lowercaseString");
              v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v100 = (char *)objc_msgSend(v99, "UTF8String");

              v101 = strlen(v100);
              v96 = IOMappings::lookupInput((IOMappings *)v7->_ioMappings, v100, v101);
            }
            objc_msgSend(v76, "objectAtIndexedSubscript:", j);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "setTokenID:", v96);

          }
          objc_msgSend(v107, "addObject:", v76);

          objc_autoreleasePoolPop(context);
          ++v112;
          v74 = v110 + 1;
        }
        while (v110 + 1 != v108);
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v121, 16);
      }
      while (v72);
    }

    -[RKEventIdentifier _identifyOwnedTokenSequences:](v7, "_identifyOwnedTokenSequences:", v107);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (__p)
    {
      v119 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    v54 = 0;
  }

  return v54;
}

- (id)identifyStrings:(id)a3
{
  -[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:](self, "_identifyStrings:otherDateCount:otherDates:", a3, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)identifyText:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v15;
  id obj;
  void *v18;
  _QWORD v19[6];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __n128 (*v27)(__n128 *, __n128 *);
  void (*v28)(uint64_t);
  const char *v29;
  void *__p;
  void *v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v18 = (void *)objc_opt_new();
  v24 = 0;
  v25 = &v24;
  v26 = 0x4812000000;
  v27 = __Block_byref_object_copy__47;
  v28 = __Block_byref_object_dispose__48;
  v29 = "";
  __p = 0;
  v31 = 0;
  v32 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v15;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v33, 16, v15);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v21;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "string");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v9);
        v10 = objc_msgSend(v9, "length");
        v19[0] = v6;
        v19[1] = 3221225472;
        v19[2] = __34__RKEventIdentifier_identifyText___block_invoke;
        v19[3] = &unk_24C6AFC98;
        v19[4] = &v24;
        v19[5] = v4 + i;
        objc_msgSend(v8, "enumerateAnnotationsInRange:usingBlock:", 0, v10, v19);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
      v4 += i;
    }
    while (v3);
  }

  v11 = v25[7] - v25[6];
  if (v11)
    v12 = v25[6];
  else
    v12 = 0;
  -[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:](self, "_identifyStrings:otherDateCount:otherDates:", v18, 0xAAAAAAAAAAAAAAABLL * (v11 >> 3), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v24, 8);
  if (__p)
  {
    v31 = __p;
    operator delete(__p);
  }

  return v13;
}

void __34__RKEventIdentifier_identifyText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  unint64_t v9;
  _QWORD *v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;

  if ((unint64_t)(a2 - 1) <= 1)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v8 = (char *)v7[7];
    v9 = v7[8];
    if ((unint64_t)v8 >= v9)
    {
      v11 = (char *)v7[6];
      v12 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v11) >> 3);
      v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
      v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (_QWORD)v11) >> 3);
      if (2 * v14 > v13)
        v13 = 2 * v14;
      if (v14 >= 0x555555555555555)
        v15 = 0xAAAAAAAAAAAAAAALL;
      else
        v15 = v13;
      if (v15)
      {
        v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RKEventIdentifierRange>>((uint64_t)(v7 + 8), v15);
        v11 = (char *)v7[6];
        v8 = (char *)v7[7];
      }
      else
      {
        v16 = 0;
      }
      v17 = &v16[24 * v12];
      v18 = &v16[24 * v15];
      *(_QWORD *)v17 = v6;
      *((_QWORD *)v17 + 1) = a3;
      *((_QWORD *)v17 + 2) = a4;
      v10 = v17 + 24;
      if (v8 != v11)
      {
        do
        {
          v19 = *(_OWORD *)(v8 - 24);
          *((_QWORD *)v17 - 1) = *((_QWORD *)v8 - 1);
          *(_OWORD *)(v17 - 24) = v19;
          v17 -= 24;
          v8 -= 24;
        }
        while (v8 != v11);
        v11 = (char *)v7[6];
      }
      v7[6] = v17;
      v7[7] = v10;
      v7[8] = v18;
      if (v11)
        operator delete(v11);
    }
    else
    {
      *(_QWORD *)v8 = v6;
      *((_QWORD *)v8 + 1) = a3;
      v10 = v8 + 24;
      *((_QWORD *)v8 + 2) = a4;
    }
    v7[7] = v10;
  }
}

- (id)identifyMessage:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  id obj;
  void *v20;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  __n128 (*v29)(__n128 *, __n128 *);
  void (*v30)(uint64_t);
  const char *v31;
  void *__p;
  void *v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v20 = (void *)objc_opt_new();
  v26 = 0;
  v27 = &v26;
  v28 = 0x4812000000;
  v29 = __Block_byref_object_copy__47;
  v30 = __Block_byref_object_dispose__48;
  v31 = "";
  __p = 0;
  v33 = 0;
  v34 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v17;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v35, 16, v17);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "string");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingString:", CFSTR(" "));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingString:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "addObject:", v11);
        v12 = objc_msgSend(v11, "length");
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __37__RKEventIdentifier_identifyMessage___block_invoke;
        v21[3] = &unk_24C6AFC98;
        v21[4] = &v26;
        v21[5] = v4 + i;
        objc_msgSend(v7, "enumerateAnnotationsInRange:usingBlock:", 0, v12, v21);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v35, 16);
      v4 += i;
    }
    while (v3);
  }

  v13 = v27[7] - v27[6];
  if (v13)
    v14 = v27[6];
  else
    v14 = 0;
  -[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:](self, "_identifyStrings:otherDateCount:otherDates:", v20, 0xAAAAAAAAAAAAAAABLL * (v13 >> 3), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v26, 8);
  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }

  return v15;
}

void __37__RKEventIdentifier_identifyMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  unint64_t v9;
  _QWORD *v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;

  if ((unint64_t)(a2 - 1) <= 1)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v8 = (char *)v7[7];
    v9 = v7[8];
    if ((unint64_t)v8 >= v9)
    {
      v11 = (char *)v7[6];
      v12 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v11) >> 3);
      v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]();
      v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (_QWORD)v11) >> 3);
      if (2 * v14 > v13)
        v13 = 2 * v14;
      if (v14 >= 0x555555555555555)
        v15 = 0xAAAAAAAAAAAAAAALL;
      else
        v15 = v13;
      if (v15)
      {
        v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RKEventIdentifierRange>>((uint64_t)(v7 + 8), v15);
        v11 = (char *)v7[6];
        v8 = (char *)v7[7];
      }
      else
      {
        v16 = 0;
      }
      v17 = &v16[24 * v12];
      v18 = &v16[24 * v15];
      *(_QWORD *)v17 = v6;
      *((_QWORD *)v17 + 1) = a3;
      *((_QWORD *)v17 + 2) = a4;
      v10 = v17 + 24;
      if (v8 != v11)
      {
        do
        {
          v19 = *(_OWORD *)(v8 - 24);
          *((_QWORD *)v17 - 1) = *((_QWORD *)v8 - 1);
          *(_OWORD *)(v17 - 24) = v19;
          v17 -= 24;
          v8 -= 24;
        }
        while (v8 != v11);
        v11 = (char *)v7[6];
      }
      v7[6] = v17;
      v7[7] = v10;
      v7[8] = v18;
      if (v11)
        operator delete(v11);
    }
    else
    {
      *(_QWORD *)v8 = v6;
      *((_QWORD *)v8 + 1) = a3;
      v10 = v8 + 24;
      *((_QWORD *)v8 + 2) = a4;
    }
    v7[7] = v10;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)_identifyStrings:(uint64_t)a3 otherDateCount:(char)a4 otherDates:
{
  unint64_t *v8;
  unint64_t i;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unsigned int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t k;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  __int128 v36;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  __int128 v43;
  BOOL v44;
  unsigned int v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t j;
  unint64_t v51;
  unint64_t v52;
  __int128 v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  BOOL v58;
  unint64_t v59;
  __int128 v60;
  unint64_t v61;
  unint64_t v62;
  __int128 *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  __int128 v67;
  uint64_t v68;
  BOOL v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unsigned int v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  int64_t v83;
  int64_t v84;
  int64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unsigned int v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  int64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int64_t v109;
  unint64_t v110;
  __int128 v111;
  unint64_t v112;
  unint64_t v113;
  __int128 v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unsigned int v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  __int128 v126;
  unint64_t v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unsigned int v132;
  uint64_t v133;
  unint64_t v134;
  BOOL v135;
  unint64_t v136;
  _BYTE v137[7];
  _BYTE v138[7];
  _BYTE v139[7];
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[7];
  _BYTE v145[7];
  __int128 v146;
  _BYTE v147[7];
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;

@end
