@implementation PGEventLabelerE5Model

- (PGEventLabelerE5Model)initWithFilePath:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  uint64_t InputPorts;
  unsigned __int8 *v15;
  _QWORD *v16;
  E5RT::OperandDescriptor *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  std::__shared_weak_count_vtbl *v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint8x8_t v34;
  unint64_t v35;
  unsigned __int8 **v36;
  unsigned __int8 *i;
  unint64_t v38;
  _QWORD *v39;
  std::string *v40;
  __int128 v41;
  float v42;
  float v43;
  _BOOL8 v44;
  unint64_t v45;
  unint64_t v46;
  int8x8_t prime;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  uint8x8_t v53;
  unint64_t v54;
  uint8x8_t v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  uint64_t v59;
  unsigned __int8 **v60;
  unint64_t v61;
  std::__shared_weak_count *v62;
  void *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  void *v75;
  uint64_t OutputPorts;
  _QWORD *j;
  std::__shared_weak_count_vtbl *v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  std::__shared_weak_count *v85;
  std::__shared_weak_count_vtbl *v86;
  unint64_t *v87;
  unint64_t v88;
  unint64_t *v89;
  unint64_t v90;
  std::__shared_weak_count *v91;
  unint64_t *v92;
  unint64_t v93;
  std::__shared_weak_count *v94;
  unint64_t *v95;
  unint64_t v96;
  std::__shared_weak_count_vtbl *v97;
  uint64_t v98;
  std::__shared_weak_count_vtbl *v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  unint64_t *v103;
  unint64_t v104;
  id v106;
  std::__shared_weak_count *v107;
  std::__shared_weak_count *v108;
  std::__shared_weak_count *v109;
  void *__p;
  std::__shared_weak_count *v111;
  char v112;
  E5RT::OperandDescriptor *v113;
  std::__shared_weak_count *v114;
  char v115;
  uint64_t v116;
  objc_super v117;
  std::__shared_weak_count_vtbl *v118;
  std::__shared_weak_count *v119;
  char v120;
  char v121;

  v5 = a3;
  v117.receiver = self;
  v117.super_class = (Class)PGEventLabelerE5Model;
  v6 = -[PGEventLabelerE5Model init](&v117, sel_init);
  if (v6)
  {
    v106 = v5;
    std::string::basic_string[abi:ne180100]<0>(&v118, "op");
    std::string::basic_string[abi:ne180100]<0>(&v113, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&__p, "main");
    E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp();
    v7 = v116;
    if (v116)
    {
      v8 = (_QWORD *)operator new();
      v9 = v116;
      *v8 = &off_1E842F638;
      v8[1] = 0;
      v8[2] = 0;
      v8[3] = v9;
    }
    else
    {
      v8 = 0;
    }
    v116 = 0;
    v10 = (std::__shared_weak_count *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 1) = v7;
    *((_QWORD *)v6 + 2) = v8;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = v116;
    v116 = 0;
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    if (v112 < 0)
      operator delete(__p);
    if (v115 < 0)
      operator delete(v113);
    if (v121 < 0)
      operator delete(v118);
    InputPorts = E5RT::ExecutionStreamOperation::GetInputPorts(*((E5RT::ExecutionStreamOperation **)v6 + 1));
    if (v6 + 32 != (char *)InputPorts)
    {
      *((_DWORD *)v6 + 16) = *(_DWORD *)(InputPorts + 32);
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,void *> *>>((_QWORD *)v6 + 4, *(uint64_t **)(InputPorts + 16));
    }
    v15 = (unsigned __int8 *)*((_QWORD *)v6 + 6);
    if (v15)
    {
      v16 = v6 + 88;
      while (1)
      {
        v17 = (E5RT::OperandDescriptor *)*((_QWORD *)v15 + 5);
        v18 = (std::__shared_weak_count *)*((_QWORD *)v15 + 6);
        v113 = v17;
        v114 = v18;
        if (v18)
        {
          v19 = (unint64_t *)&v18->__shared_owners_;
          do
            v20 = __ldxr(v19);
          while (__stxr(v20 + 1, v19));
        }
        E5RT::IOPort::GetPortDescriptor(v17);
        E5RT::OperandDescriptor::TensorDescriptor((E5RT::OperandDescriptor *)v118);
        v21 = v119;
        if (v119)
        {
          v22 = (unint64_t *)&v119->__shared_owners_;
          do
            v23 = __ldaxr(v22);
          while (__stlxr(v23 - 1, v22));
          if (!v23)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
        E5RT::TensorDescriptor::AllocateMemory();
        __p = v118;
        if (v118)
        {
          v24 = (std::__shared_weak_count *)operator new();
          v25 = v118;
          v24->__shared_owners_ = 0;
          v26 = (unint64_t *)&v24->__shared_owners_;
          v24->__vftable = (std::__shared_weak_count_vtbl *)&off_1E842F688;
          v24->__shared_weak_owners_ = 0;
          v24[1].__vftable = v25;
          v111 = v24;
          v109 = v24;
          do
            v27 = __ldxr(v26);
          while (__stxr(v27 + 1, v26));
        }
        else
        {
          v111 = 0;
          v109 = 0;
        }
        E5RT::IOPort::BindMemoryObject();
        v28 = (unint64_t)v109;
        if (v109)
        {
          v29 = (unint64_t *)&v109->__shared_owners_;
          do
            v30 = __ldaxr(v29);
          while (__stlxr(v30 - 1, v29));
          if (!v30)
          {
            ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
            std::__shared_weak_count::__release_weak(v109);
          }
        }
        v31 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(v15 + 16));
        v32 = v31;
        v33 = *((_QWORD *)v6 + 10);
        if (v33)
        {
          v34 = (uint8x8_t)vcnt_s8((int8x8_t)v33);
          v34.i16[0] = vaddlv_u8(v34);
          v35 = v34.u32[0];
          if (v34.u32[0] > 1uLL)
          {
            v28 = v31;
            if (v31 >= v33)
              v28 = v31 % v33;
          }
          else
          {
            v28 = (v33 - 1) & v31;
          }
          v36 = *(unsigned __int8 ***)(*((_QWORD *)v6 + 9) + 8 * v28);
          if (v36)
          {
            for (i = *v36; i; i = *(unsigned __int8 **)i)
            {
              v38 = *((_QWORD *)i + 1);
              if (v38 == v32)
              {
                if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, v15 + 16))
                  goto LABEL_115;
              }
              else
              {
                if (v35 > 1)
                {
                  if (v38 >= v33)
                    v38 %= v33;
                }
                else
                {
                  v38 &= v33 - 1;
                }
                if (v38 != v28)
                  break;
              }
            }
          }
        }
        v39 = operator new(0x38uLL);
        v118 = (std::__shared_weak_count_vtbl *)v39;
        v119 = (std::__shared_weak_count *)(v6 + 88);
        v120 = 0;
        *v39 = 0;
        v39[1] = v32;
        v40 = (std::string *)(v39 + 2);
        if ((char)v15[39] < 0)
        {
          std::string::__init_copy_ctor_external(v40, *((const std::string::value_type **)v15 + 2), *((_QWORD *)v15 + 3));
        }
        else
        {
          v41 = *((_OWORD *)v15 + 1);
          v39[4] = *((_QWORD *)v15 + 4);
          *(_OWORD *)&v40->__r_.__value_.__l.__data_ = v41;
        }
        v39[5] = 0;
        v39[6] = 0;
        v120 = 1;
        v42 = (float)(unint64_t)(*((_QWORD *)v6 + 12) + 1);
        v43 = *((float *)v6 + 26);
        if (!v33 || (float)(v43 * (float)v33) < v42)
          break;
LABEL_105:
        v60 = *(unsigned __int8 ***)(*((_QWORD *)v6 + 9) + 8 * v28);
        i = (unsigned __int8 *)v118;
        if (v60)
        {
          v118->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))*v60;
        }
        else
        {
          v118->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))*((_QWORD *)v6 + 11);
          *((_QWORD *)v6 + 11) = i;
          *(_QWORD *)(*((_QWORD *)v6 + 9) + 8 * v28) = v16;
          if (!*(_QWORD *)i)
            goto LABEL_114;
          v61 = *(_QWORD *)(*(_QWORD *)i + 8);
          if ((v33 & (v33 - 1)) != 0)
          {
            if (v61 >= v33)
              v61 %= v33;
          }
          else
          {
            v61 &= v33 - 1;
          }
          v60 = (unsigned __int8 **)(*((_QWORD *)v6 + 9) + 8 * v61);
        }
        *v60 = i;
LABEL_114:
        v118 = 0;
        ++*((_QWORD *)v6 + 12);
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v118);
LABEL_115:
        v63 = __p;
        v62 = v111;
        if (v111)
        {
          v64 = (unint64_t *)&v111->__shared_owners_;
          do
            v65 = __ldxr(v64);
          while (__stxr(v65 + 1, v64));
        }
        v66 = (std::__shared_weak_count *)*((_QWORD *)i + 6);
        *((_QWORD *)i + 5) = v63;
        *((_QWORD *)i + 6) = v62;
        if (v66)
        {
          v67 = (unint64_t *)&v66->__shared_owners_;
          do
            v68 = __ldaxr(v67);
          while (__stlxr(v68 - 1, v67));
          if (!v68)
          {
            ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
            std::__shared_weak_count::__release_weak(v66);
          }
        }
        v69 = v111;
        if (v111)
        {
          v70 = (unint64_t *)&v111->__shared_owners_;
          do
            v71 = __ldaxr(v70);
          while (__stlxr(v71 - 1, v70));
          if (!v71)
          {
            ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
            std::__shared_weak_count::__release_weak(v69);
          }
        }
        v72 = v114;
        if (v114)
        {
          v73 = (unint64_t *)&v114->__shared_owners_;
          do
            v74 = __ldaxr(v73);
          while (__stlxr(v74 - 1, v73));
          if (!v74)
          {
            ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
            std::__shared_weak_count::__release_weak(v72);
          }
        }
        v15 = *(unsigned __int8 **)v15;
        if (!v15)
          goto LABEL_144;
      }
      v44 = (v33 & (v33 - 1)) != 0;
      if (v33 < 3)
        v44 = 1;
      v45 = v44 | (2 * v33);
      v46 = vcvtps_u32_f32(v42 / v43);
      if (v45 <= v46)
        prime = (int8x8_t)v46;
      else
        prime = (int8x8_t)v45;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      }
      v33 = *((_QWORD *)v6 + 10);
      if (*(_QWORD *)&prime > v33)
        goto LABEL_71;
      if (*(_QWORD *)&prime < v33)
      {
        v54 = vcvtps_u32_f32((float)*((unint64_t *)v6 + 12) / *((float *)v6 + 26));
        if (v33 < 3 || (v55 = (uint8x8_t)vcnt_s8((int8x8_t)v33), v55.i16[0] = vaddlv_u8(v55), v55.u32[0] > 1uLL))
        {
          v54 = std::__next_prime(v54);
        }
        else
        {
          v56 = 1 << -(char)__clz(v54 - 1);
          if (v54 >= 2)
            v54 = v56;
        }
        if (*(_QWORD *)&prime <= v54)
          prime = (int8x8_t)v54;
        if (*(_QWORD *)&prime >= v33)
        {
          v33 = *((_QWORD *)v6 + 10);
        }
        else
        {
          if (prime)
          {
LABEL_71:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v48 = operator new(8 * *(_QWORD *)&prime);
            v49 = (void *)*((_QWORD *)v6 + 9);
            *((_QWORD *)v6 + 9) = v48;
            if (v49)
              operator delete(v49);
            v50 = 0;
            *((int8x8_t *)v6 + 10) = prime;
            do
              *(_QWORD *)(*((_QWORD *)v6 + 9) + 8 * v50++) = 0;
            while (*(_QWORD *)&prime != v50);
            v51 = (_QWORD *)*v16;
            if (*v16)
            {
              v52 = v51[1];
              v53 = (uint8x8_t)vcnt_s8(prime);
              v53.i16[0] = vaddlv_u8(v53);
              if (v53.u32[0] > 1uLL)
              {
                if (v52 >= *(_QWORD *)&prime)
                  v52 %= *(_QWORD *)&prime;
              }
              else
              {
                v52 &= *(_QWORD *)&prime - 1;
              }
              *(_QWORD *)(*((_QWORD *)v6 + 9) + 8 * v52) = v16;
              v57 = (_QWORD *)*v51;
              if (*v51)
              {
                do
                {
                  v58 = v57[1];
                  if (v53.u32[0] > 1uLL)
                  {
                    if (v58 >= *(_QWORD *)&prime)
                      v58 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v58 &= *(_QWORD *)&prime - 1;
                  }
                  if (v58 != v52)
                  {
                    v59 = *((_QWORD *)v6 + 9);
                    if (!*(_QWORD *)(v59 + 8 * v58))
                    {
                      *(_QWORD *)(v59 + 8 * v58) = v51;
                      goto LABEL_96;
                    }
                    *v51 = *v57;
                    *v57 = **(_QWORD **)(*((_QWORD *)v6 + 9) + 8 * v58);
                    **(_QWORD **)(*((_QWORD *)v6 + 9) + 8 * v58) = v57;
                    v57 = v51;
                  }
                  v58 = v52;
LABEL_96:
                  v51 = v57;
                  v57 = (_QWORD *)*v57;
                  v52 = v58;
                }
                while (v57);
              }
            }
            v33 = (unint64_t)prime;
            goto LABEL_100;
          }
          v75 = (void *)*((_QWORD *)v6 + 9);
          *((_QWORD *)v6 + 9) = 0;
          if (v75)
            operator delete(v75);
          v33 = 0;
          *((_QWORD *)v6 + 10) = 0;
        }
      }
LABEL_100:
      if ((v33 & (v33 - 1)) != 0)
      {
        if (v32 >= v33)
          v28 = v32 % v33;
        else
          v28 = v32;
      }
      else
      {
        v28 = (v33 - 1) & v32;
      }
      goto LABEL_105;
    }
LABEL_144:
    OutputPorts = E5RT::ExecutionStreamOperation::GetOutputPorts(*((E5RT::ExecutionStreamOperation **)v6 + 1));
    if (v6 + 112 != (char *)OutputPorts)
    {
      *((_DWORD *)v6 + 36) = *(_DWORD *)(OutputPorts + 32);
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,void *> *>>((_QWORD *)v6 + 14, *(uint64_t **)(OutputPorts + 16));
    }
    for (j = (_QWORD *)*((_QWORD *)v6 + 16); j; j = (_QWORD *)*j)
    {
      v78 = (std::__shared_weak_count_vtbl *)j[5];
      v79 = (std::__shared_weak_count *)j[6];
      v118 = v78;
      v119 = v79;
      if (v79)
      {
        v80 = (unint64_t *)&v79->__shared_owners_;
        do
          v81 = __ldxr(v80);
        while (__stxr(v81 + 1, v80));
      }
      E5RT::IOPort::GetPortDescriptor((E5RT::IOPort *)v78);
      E5RT::OperandDescriptor::TensorDescriptor(v113);
      v82 = v114;
      if (v114)
      {
        v83 = (unint64_t *)&v114->__shared_owners_;
        do
          v84 = __ldaxr(v83);
        while (__stlxr(v84 - 1, v83));
        if (!v84)
        {
          ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
          std::__shared_weak_count::__release_weak(v82);
        }
      }
      E5RT::TensorDescriptor::AllocateMemory();
      v113 = (E5RT::OperandDescriptor *)__p;
      if (__p)
      {
        v85 = (std::__shared_weak_count *)operator new();
        v86 = (std::__shared_weak_count_vtbl *)__p;
        v85->__shared_owners_ = 0;
        v87 = (unint64_t *)&v85->__shared_owners_;
        v85->__vftable = (std::__shared_weak_count_vtbl *)&off_1E842F688;
        v85->__shared_weak_owners_ = 0;
        v85[1].__vftable = v86;
        v114 = v85;
        v108 = v85;
        do
          v88 = __ldxr(v87);
        while (__stxr(v88 + 1, v87));
      }
      else
      {
        v114 = 0;
        v108 = 0;
      }
      OutputPorts = E5RT::IOPort::BindMemoryObject();
      if (v108)
      {
        v89 = (unint64_t *)&v108->__shared_owners_;
        do
          v90 = __ldaxr(v89);
        while (__stlxr(v90 - 1, v89));
        if (!v90)
        {
          ((void (*)(std::__shared_weak_count *))v108->__on_zero_shared)(v108);
          std::__shared_weak_count::__release_weak(v108);
        }
      }
      v91 = v114;
      if (v114)
      {
        v92 = (unint64_t *)&v114->__shared_owners_;
        do
          v93 = __ldaxr(v92);
        while (__stlxr(v93 - 1, v92));
        if (!v93)
        {
          ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
          std::__shared_weak_count::__release_weak(v91);
        }
      }
      v94 = v119;
      if (v119)
      {
        v95 = (unint64_t *)&v119->__shared_owners_;
        do
          v96 = __ldaxr(v95);
        while (__stlxr(v96 - 1, v95));
        if (!v96)
        {
          ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
          std::__shared_weak_count::__release_weak(v94);
        }
      }
    }
    E5RT::ExecutionStream::CreateExecutionStream((E5RT::ExecutionStream *)OutputPorts);
    v97 = v118;
    v118 = 0;
    v98 = *((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v97;
    v5 = v106;
    if (v98)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v98 + 8))(v98);
      v99 = v118;
      v118 = 0;
      if (v99)
        (*((void (**)(std::__shared_weak_count_vtbl *))v99->~__shared_weak_count + 1))(v99);
    }
    v100 = (std::__shared_weak_count *)*((_QWORD *)v6 + 2);
    v107 = v100;
    if (v100)
    {
      v101 = (unint64_t *)&v100->__shared_owners_;
      do
        v102 = __ldxr(v101);
      while (__stxr(v102 + 1, v101));
    }
    E5RT::ExecutionStream::EncodeOperation();
    if (v107)
    {
      v103 = (unint64_t *)&v107->__shared_owners_;
      do
        v104 = __ldaxr(v103);
      while (__stlxr(v104 - 1, v103));
      if (!v104)
      {
        ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
        std::__shared_weak_count::__release_weak(v107);
      }
    }
  }

  return (PGEventLabelerE5Model *)v6;
}

- (id)inputNamesWithError:(id *)a3
{
  void *v4;
  char *i;
  _QWORD *v6;
  void *v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", self->_inputPortByName.__table_.__p2_.__value_);
  for (i = (char *)self->_inputPortByName.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    v6 = i + 16;
    if (i[39] < 0)
      v6 = (_QWORD *)*v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  return v4;
}

- (id)inputSizeByNameWithError:(id *)a3
{
  void *v4;
  char *i;
  E5RT::IOPort *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  E5RT::TensorDescriptor *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t TensorShape;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  unint64_t *v20;
  unint64_t v21;
  E5RT::OperandDescriptor *v23;
  std::__shared_weak_count *v24;
  std::__shared_weak_count *v25;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_inputPortByName.__table_.__p2_.__value_);
  for (i = (char *)self->_inputPortByName.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    v6 = (E5RT::IOPort *)*((_QWORD *)i + 5);
    v7 = (std::__shared_weak_count *)*((_QWORD *)i + 6);
    v25 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    E5RT::IOPort::GetPortDescriptor(v6);
    v10 = (E5RT::TensorDescriptor *)E5RT::OperandDescriptor::TensorDescriptor(v23);
    if (v24)
    {
      v11 = (unint64_t *)&v24->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)())v24->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    TensorShape = E5RT::TensorDescriptor::GetTensorShape(v10);
    v14 = *(uint64_t **)TensorShape;
    v15 = 1;
    while (v14 != *(uint64_t **)(TensorShape + 8))
    {
      v16 = *v14++;
      v15 *= v16;
    }
    v17 = i + 16;
    if (i[39] < 0)
      v17 = (_QWORD *)*v17;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v18);

    if (v25)
    {
      v20 = (unint64_t *)&v25->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
  }
  return v4;
}

- (id)computeWithFeatures:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  char *i;
  E5RT::IOPort *v8;
  std::string::size_type v9;
  unint64_t *v10;
  unint64_t v11;
  E5RT::BufferObject *v12;
  uint64_t DataSpan;
  unint64_t v14;
  uint64_t v15;
  uint64_t *p_shared_owners;
  unint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  unint64_t j;
  void *v22;
  float v23;
  unint64_t *v30;
  unint64_t v31;
  __int128 *k;
  E5RT::IOPort *v33;
  unint64_t *v34;
  unint64_t v35;
  E5RT::BufferObject *v36;
  uint64_t v37;
  unint64_t v38;
  __int16 *v39;
  unint64_t *v40;
  unint64_t v41;
  std::string *p_p;
  void *v44;
  void *v45;
  double v47;
  void *v48;
  std::__shared_weak_count *v49;
  uint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  void *v55;
  E5RT::MemoryObject *v58;
  std::__shared_weak_count *v59;
  std::string __p;
  E5RT::MemoryObject *v61;
  std::__shared_weak_count *v62;
  E5RT::MemoryObject *v63;
  std::__shared_weak_count *v64;

  v5 = a3;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", self->_outputPortByName.__table_.__p2_.__value_);
  if (-[PGEventLabelerE5Model _areFeaturesValidForFeatures:error:](self, "_areFeaturesValidForFeatures:error:", v5, a4))
  {
    for (i = (char *)self->_inputPortByName.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
    {
      v8 = (E5RT::IOPort *)*((_QWORD *)i + 5);
      v9 = *((_QWORD *)i + 6);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
      __p.__r_.__value_.__l.__size_ = v9;
      if (v9)
      {
        v10 = (unint64_t *)(v9 + 8);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      E5RT::IOPort::GetMemoryObject(v8);
      v12 = (E5RT::BufferObject *)E5RT::MemoryObject::TryAsBuffer(v63);
      DataSpan = E5RT::BufferObject::GetDataSpan(v12);
      if (v14 >= 2)
        v15 = DataSpan;
      else
        v15 = 0;
      if (v64)
      {
        p_shared_owners = &v64->__shared_owners_;
        do
          v17 = __ldaxr((unint64_t *)p_shared_owners);
        while (__stlxr(v17 - 1, (unint64_t *)p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
          std::__shared_weak_count::__release_weak(v64);
        }
      }
      v18 = i + 16;
      if (i[39] < 0)
        v18 = (_QWORD *)*v18;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j < objc_msgSend(v20, "count"); ++j)
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", j);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        if (v23 < -65504.0)
          v23 = -65504.0;
        if (v23 <= 65504.0)
          _S10 = v23;
        else
          _S10 = 65504.0;

        __asm { FCVT            H0, S10 }
        *(_WORD *)(v15 + 2 * j) = _H0;
      }

      if (__p.__r_.__value_.__l.__size_)
      {
        v30 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
        if (!v31)
        {
          (*(void (**)(std::string::size_type))(*(_QWORD *)__p.__r_.__value_.__l.__size_ + 16))(__p.__r_.__value_.__l.__size_);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
        }
      }
    }
    E5RT::ExecutionStream::ExecuteStreamSync((E5RT::ExecutionStream *)self->_stream.__ptr_.__value_);
    for (k = (__int128 *)self->_outputPortByName.__table_.__p1_.__value_.__next_; k; k = *(__int128 **)k)
    {
      std::pair<std::string const,std::shared_ptr<E5RT::IOPort>>::pair[abi:ne180100](&__p, k + 1);
      v33 = v61;
      v63 = v61;
      v64 = v62;
      if (v62)
      {
        v34 = (unint64_t *)&v62->__shared_owners_;
        do
          v35 = __ldxr(v34);
        while (__stxr(v35 + 1, v34));
      }
      E5RT::IOPort::GetMemoryObject(v33);
      v36 = (E5RT::BufferObject *)E5RT::MemoryObject::TryAsBuffer(v58);
      v37 = E5RT::BufferObject::GetDataSpan(v36);
      if (v38 >= 2)
        v39 = (__int16 *)v37;
      else
        v39 = 0;
      if (v59)
      {
        v40 = (unint64_t *)&v59->__shared_owners_;
        do
          v41 = __ldaxr(v40);
        while (__stlxr(v41 - 1, v40));
        if (!v41)
        {
          ((void (*)())v59->__on_zero_shared)();
          std::__shared_weak_count::__release_weak(v59);
        }
      }
      _H8 = *v39;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "lowercaseString");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      __asm { FCVT            S8, H8 }

      LODWORD(v47) = _S8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v48, v45);

      v49 = v64;
      if (v64)
      {
        v50 = &v64->__shared_owners_;
        do
          v51 = __ldaxr((unint64_t *)v50);
        while (__stlxr(v51 - 1, (unint64_t *)v50));
        if (!v51)
        {
          ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
          std::__shared_weak_count::__release_weak(v49);
        }
      }
      v52 = v62;
      if (v62)
      {
        v53 = (unint64_t *)&v62->__shared_owners_;
        do
          v54 = __ldaxr(v53);
        while (__stlxr(v54 - 1, v53));
        if (!v54)
        {
          ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
          std::__shared_weak_count::__release_weak(v52);
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    v6 = v6;
    v55 = v6;
  }
  else
  {
    v55 = 0;
  }

  return v55;
}

- (BOOL)_areFeaturesValidForFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  -[PGEventLabelerE5Model inputSizeByNameWithError:](self, "inputSizeByNameWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__47193;
    v18 = __Block_byref_object_dispose__47194;
    v19 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__PGEventLabelerE5Model__areFeaturesValidForFeatures_error___block_invoke;
    v10[3] = &unk_1E842F608;
    v11 = v6;
    v12 = &v20;
    v13 = &v14;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
    if (a4)
      *a4 = objc_retainAutorelease((id)v15[5]);
    v8 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;
  ExecutionStream *v6;

  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table((uint64_t)&self->_outputPortByName);
  next = self->_inputBufferByName.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::BufferObject>>,0>((uint64_t)(next + 2));
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_inputBufferByName.__table_.__bucket_list_.__ptr_.__value_;
  self->_inputBufferByName.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table((uint64_t)&self->_inputPortByName);
  v6 = self->_stream.__ptr_.__value_;
  self->_stream.__ptr_.__value_ = 0;
  if (v6)
    (*(void (**)(ExecutionStream *))(*(_QWORD *)v6 + 8))(v6);
  std::shared_ptr<E5RT::ExecutionStreamOperation>::~shared_ptr[abi:ne180100]((uint64_t)&self->_esop);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_DWORD *)self + 36) = 1065353216;
  return self;
}

void __60__PGEventLabelerE5Model__areFeaturesValidForFeatures_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = objc_msgSend(v7, "unsignedIntValue");
  if (v9 != v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PGEventLabelerE5Model] Invalid feature count: %lu, input spec count: %lu, for feature: %@"), v9, v10, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDescription:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *a4 = 1;
  }

}

@end
