@implementation PPScoreInterpreter

- (PPScoreInterpreter)initWithParseRoot:(id)a3 scalarSubscoreCount:(unint64_t)a4 arraySubscoreCount:(unint64_t)a5 objectSubscoreCount:(unint64_t)a6
{
  id v10;
  void *v11;
  PPScoreInterpreterBytecode *v12;
  void *v14;

  v10 = a3;
  v11 = v10;
  if (self)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithParseRoot_scalarSubscoreCount_arraySubscoreCount_objectSubscoreCount_scoreInputSet_, self, CFSTR("PPScoreInterpreter.mm"), 828, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("root"));

    }
    v12 = -[PPScoreInterpreterBytecode initWithParseRoot:scalarSubscoreCount:arraySubscoreCount:objectSubscoreCount:]([PPScoreInterpreterBytecode alloc], "initWithParseRoot:scalarSubscoreCount:arraySubscoreCount:objectSubscoreCount:", v11, a4, a5, a6);
    self = -[PPScoreInterpreter initWithBytecode:scoreInputSet:](self, "initWithBytecode:scoreInputSet:", v12, 0);

  }
  return self;
}

- (PPScoreInterpreter)initWithBytecode:(id)a3
{
  return -[PPScoreInterpreter initWithBytecode:scoreInputSet:](self, "initWithBytecode:scoreInputSet:", a3, 0);
}

- (PPScoreInterpreter)initWithBytecode:(id)a3 scoreInputSet:(id)a4
{
  id v7;
  id v8;
  PPScoreInterpreter *v9;
  PPScoreInterpreter *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _PASLock *reusableContext;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPScoreInterpreter;
  v9 = -[PPScoreInterpreter init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bytecode, a3);
    objc_storeStrong((id *)&v10->_scoreInputSet, a4);
    v11 = objc_alloc(MEMORY[0x1E0D815F0]);
    v12 = (void *)objc_opt_new();
    v13 = objc_msgSend(v11, "initWithGuardedData:", v12);
    reusableContext = v10->_reusableContext;
    v10->_reusableContext = (_PASLock *)v13;

  }
  return v10;
}

- (void)evaluateWithPreviousStageSubscores:(id)a3 scoreInputInitializationBlock:(id)a4 scoreInputAssignmentBlock:(id)a5 outputBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _PASLock *reusableContext;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1C3BD6630]();
  reusableContext = self->_reusableContext;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __125__PPScoreInterpreter_evaluateWithPreviousStageSubscores_scoreInputInitializationBlock_scoreInputAssignmentBlock_outputBlock___block_invoke;
  v20[3] = &unk_1E7E15A60;
  v20[4] = self;
  v16 = v11;
  v22 = v16;
  v19 = v10;
  v21 = v19;
  v17 = v12;
  v23 = v17;
  v18 = v13;
  v24 = v18;
  -[_PASLock runWithLockAcquired:](reusableContext, "runWithLockAcquired:", v20);

  objc_autoreleasePoolPop(v14);
}

- (void)cleanupReusableComponents
{
  -[_PASLock runWithLockAcquired:](self->_reusableContext, "runWithLockAcquired:", &__block_literal_global_149);
}

- (id)evaluateWithScoreInputs:(id)a3 previousSubscores:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id *v15;
  NSObject *v16;
  id v17;
  unint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_bytecode->_bytecodeDataBySubscoreTypeAndIndex;
  -[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v15 = -[PPScoreInterpreterCtx initWithScoreInputs:previousSubscores:scalarSubscoreCount:arraySubscoreCount:objectSubscoreCount:]((id *)[PPScoreInterpreterCtx alloc], v6, v7, v10, v12, v14);
  -[PPScoreInterpreter evaluateScoresWithContext:]((uint64_t)self, v15);
  if (*((_QWORD *)v15[1] + 1) != *(_QWORD *)v15[1])
  {
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v15[1] + 1) - *(_QWORD *)v15[1]) >> 3);
      v20 = 134217984;
      v21 = v19;
      _os_log_fault_impl(&dword_1C392E000, v16, OS_LOG_TYPE_FAULT, "%lu items left on score interpreter stack", (uint8_t *)&v20, 0xCu);
    }

  }
  v17 = v15[4];

  return v17;
}

- (id)evaluateWithScoreInputs:(id)a3
{
  -[PPScoreInterpreter evaluateWithScoreInputs:previousSubscores:](self, "evaluateWithScoreInputs:previousSubscores:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableContext, 0);
  objc_storeStrong((id *)&self->_scoreInputSet, 0);
  objc_storeStrong((id *)&self->_bytecode, 0);
}

- (void)evaluateScoresWithContext:(uint64_t)a1
{
  id *v3;
  __int128 v4;
  unsigned __int8 **v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned int v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  double Double;
  double v14;
  NSObject *v15;
  PPScoreInterpreterValue *v16;
  id *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id *v21;
  void *v22;
  void *v23;
  id v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  NSObject *v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  __int128 v40;
  _BYTE v41[24];
  uint64_t v42;
  std::__shared_weak_count *v43;
  char v44;
  double v45;
  char v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  _BYTE buf[22];
  PPScoreInterpreterCtx v50;

  v50._subscores = (PPScoreDict *)*MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v5 = *(unsigned __int8 ***)(*(_QWORD *)(a1 + 8) + 8);
    v7 = *v5;
    v6 = v5[1];
    if (*v5 != v6)
    {
      *(_QWORD *)&v4 = 67109120;
      v40 = v4;
      do
      {
        v8 = *v7;
        v9 = *((unsigned __int16 *)v7 + 1);
        if (v8 == 2)
        {
          v17 = v3;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 16), "objectAtIndexedSubscript:", 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPScoreInterpreter _runBytecode:context:](a1, v19, v17);

          memset(&v50, 0, 24);
          pop(&v50, v17);
          PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)&v50);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3[4], "setObject:forIndex:", v20, v9);
          PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v41, v20);

          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v50);
          v16 = (PPScoreInterpreterValue *)v41;
        }
        else if (v8 == 1)
        {
          v21 = v3;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 16), "objectAtIndexedSubscript:", 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", v9);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPScoreInterpreter _runBytecode:context:](a1, v23, v21);

          memset(&v50, 0, 24);
          pop(&v50, v21);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)&v50, buf);
          v24 = v3[4];
          v47 = *(_QWORD *)buf;
          v48 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v25 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v26 = __ldxr(v25);
            while (__stxr(v26 + 1, v25));
          }
          objc_msgSend(v24, "setArraySharedPtr:forIndex:", &v47, v9, v40);
          v27 = v48;
          if (v48)
          {
            p_shared_owners = (unint64_t *)&v48->__shared_owners_;
            do
              v29 = __ldaxr(p_shared_owners);
            while (__stlxr(v29 - 1, p_shared_owners));
            if (!v29)
            {
              ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
              std::__shared_weak_count::__release_weak(v27);
            }
          }
          v30 = *(_QWORD *)buf;
          v31 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v32 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v33 = __ldxr(v32);
            while (__stxr(v33 + 1, v32));
            v42 = v30;
            v43 = v31;
            do
              v34 = __ldxr(v32);
            while (__stxr(v34 + 1, v32));
            v44 = 1;
            do
              v35 = __ldaxr(v32);
            while (__stlxr(v35 - 1, v32));
            if (!v35)
            {
              ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
              std::__shared_weak_count::__release_weak(v31);
            }
          }
          else
          {
            v42 = *(_QWORD *)buf;
            v43 = 0;
            v44 = 1;
          }
          v37 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v38 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v39 = __ldaxr(v38);
            while (__stlxr(v39 - 1, v38));
            if (!v39)
            {
              ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
              std::__shared_weak_count::__release_weak(v37);
            }
          }
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v50);

          v16 = (PPScoreInterpreterValue *)&v42;
        }
        else
        {
          if (*v7)
          {
            pp_default_log_handle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
            {
              v50.super.isa = (Class)__PAIR64__(v8, v40);
              _os_log_fault_impl(&dword_1C392E000, v36, OS_LOG_TYPE_FAULT, "Invalid subscoreType of %d", (uint8_t *)&v50, 8u);
            }

            goto LABEL_41;
          }
          v10 = v3;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 16), "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPScoreInterpreter _runBytecode:context:](a1, v12, v10);

          memset(&v50, 0, 24);
          pop(&v50, v10);
          Double = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)&v50);
          v14 = fabs(Double);
          if (v14 == INFINITY)
          {
            pp_score_interpreter_log_handle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v9;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = Double;
              _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_INFO, "Score for variable %tu returned Nan or Inf: %f", buf, 0x16u);
            }

          }
          *(float *)&v14 = Double;
          objc_msgSend(v3[4], "setScalarValue:forIndex:", v9, v14, v40);
          v45 = Double;
          v46 = 0;
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v50);

          v16 = (PPScoreInterpreterValue *)&v45;
        }
        PPScoreInterpreterValue::~PPScoreInterpreterValue(v16);
LABEL_41:
        v7 += 4;
      }
      while (v7 != v6);
    }
  }

}

- (void)_runBytecode:(void *)a3 context:
{
  id v5;
  id *v6;
  _WORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  size_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  NSObject *v17;
  float v18;
  double *v19;
  char *v20;
  id v21;
  size_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  double v26;
  double v27;
  PPScoreInterpreterCtx *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  float v33;
  void *v34;
  BOOL v35;
  id v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  NSObject *v42;
  float v43;
  id v44;
  unint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  char *v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t *v52;
  unint64_t *v53;
  double Double;
  NSObject *v55;
  _BYTE v56[24];
  _BYTE v57[24];
  _BYTE v58[24];
  _BYTE v59[24];
  _QWORD v60[2];
  std::__shared_weak_count *v61;
  _QWORD v62[2];
  char v63;
  std::__shared_weak_count *v64;
  std::__shared_weak_count *v65;
  _QWORD v66[2];
  char v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  char v72;
  uint64_t v73;
  std::__shared_weak_count *v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  char v77;
  double v78[2];
  char v79;
  _QWORD v80[2];
  char v81;
  double v82[2];
  char v83;
  _QWORD v84[2];
  char v85;
  double v86[2];
  char v87;
  _QWORD v88[2];
  char v89;
  PPScoreInterpreterCtx v90;
  uint64_t __dst;
  uint8_t buf[4];
  int scoreInputs_low;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (_WORD *)objc_msgSend(v5, "bytes");
  v8 = objc_msgSend(v5, "length");
  __dst = 0;
  if (v8 >= 2)
  {
    v9 = (char *)v7 + v8;
    v10 = (char *)(v7 + 1);
    v11 = 2;
    do
    {
      v12 = (unsigned __int16)*v7;
      if ((unsigned __int16)*v7 <= 0x190u)
      {
        switch(*v7)
        {
          case 0xC9:
            HIDWORD(__dst) = 0;
            v13 = &v10[v11];
            if (&v10[v11] > v9)
              goto LABEL_2;
            memcpy((char *)&__dst + 4, v10, v11);
            objc_msgSend(v6[2], "scalarValueForIndex:", HIDWORD(__dst));
            v86[0] = v18;
            v87 = 0;
            push(v6, (const PPScoreInterpreterValue *)v86);
            v19 = v86;
            goto LABEL_73;
          case 0xCA:
            HIDWORD(__dst) = 0;
            v13 = &v10[v11];
            if (&v10[v11] > v9)
              goto LABEL_2;
            memcpy((char *)&__dst + 4, v10, v11);
            objc_msgSend(v6[4], "scalarValueForIndex:", HIDWORD(__dst));
            v82[0] = v43;
            v83 = 0;
            push(v6, (const PPScoreInterpreterValue *)v82);
            v19 = v82;
            goto LABEL_73;
          case 0xCB:
            HIDWORD(__dst) = 0;
            v13 = &v10[v11];
            if (&v10[v11] > v9)
              goto LABEL_2;
            memcpy((char *)&__dst + 4, v10, v11);
            v32 = v6[3];
            if (v32)
            {
              objc_msgSend(v32, "scalarValueForIndex:", HIDWORD(__dst));
              v78[0] = v33;
              v79 = 0;
              push(v6, (const PPScoreInterpreterValue *)v78);
              v19 = v78;
            }
            else
            {
              v80[0] = 0xC0DE9A8000000000;
              v81 = 0;
              push(v6, (const PPScoreInterpreterValue *)v80);
              v19 = (double *)v80;
            }
LABEL_73:
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v19);
            goto LABEL_91;
          case 0xCC:
            v13 = (char *)(v7 + 5);
            if (v13 > v9)
              goto LABEL_2;
            v84[0] = *(_QWORD *)v10;
            v85 = 0;
            push(v6, (const PPScoreInterpreterValue *)v84);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v84);
            goto LABEL_92;
          default:
            switch(*v7)
            {
              case 0x12D:
                HIDWORD(__dst) = 0;
                v13 = &v10[v11];
                if (&v10[v11] > v9)
                  goto LABEL_2;
                memcpy((char *)&__dst + 4, v10, v11);
                v14 = v6[2];
                if (v14)
                {
                  objc_msgSend(v14, "arraySharedPtrForIndex:", HIDWORD(__dst));
                  v75 = v73;
                  v76 = v74;
                  if (v74)
                  {
                    p_shared_owners = (unint64_t *)&v74->__shared_owners_;
                    do
                      v16 = __ldxr(p_shared_owners);
                    while (__stxr(v16 + 1, p_shared_owners));
                  }
                }
                else
                {
                  v73 = 0;
                  v74 = 0;
                  v75 = 0;
                  v76 = 0;
                }
                v77 = 1;
                push(v6, (const PPScoreInterpreterValue *)&v75);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v75);
                v39 = v74;
                if (!v74)
                  goto LABEL_91;
                v52 = (unint64_t *)&v74->__shared_owners_;
                do
                  v41 = __ldaxr(v52);
                while (__stlxr(v41 - 1, v52));
                goto LABEL_89;
              case 0x12E:
                HIDWORD(__dst) = 0;
                v13 = &v10[v11];
                if (&v10[v11] > v9)
                  goto LABEL_2;
                memcpy((char *)&__dst + 4, v10, v11);
                v44 = v6[4];
                if (v44)
                {
                  objc_msgSend(v44, "arraySharedPtrForIndex:", HIDWORD(__dst));
                  v70 = v68;
                  v71 = v69;
                  if (v69)
                  {
                    v45 = (unint64_t *)&v69->__shared_owners_;
                    do
                      v46 = __ldxr(v45);
                    while (__stxr(v46 + 1, v45));
                  }
                }
                else
                {
                  v68 = 0;
                  v69 = 0;
                  v70 = 0;
                  v71 = 0;
                }
                v72 = 1;
                push(v6, (const PPScoreInterpreterValue *)&v70);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v70);
                v39 = v69;
                if (!v69)
                  goto LABEL_91;
                v53 = (unint64_t *)&v69->__shared_owners_;
                do
                  v41 = __ldaxr(v53);
                while (__stlxr(v41 - 1, v53));
                goto LABEL_89;
              case 0x12F:
                HIDWORD(__dst) = 0;
                v13 = &v10[v11];
                if (&v10[v11] > v9)
                  goto LABEL_2;
                memcpy((char *)&__dst + 4, v10, v11);
                v36 = v6[3];
                if (v36)
                {
                  objc_msgSend(v36, "arraySharedPtrForIndex:", HIDWORD(__dst));
                  v62[0] = v60[1];
                  v62[1] = v61;
                  if (v61)
                  {
                    v37 = (unint64_t *)&v61->__shared_owners_;
                    do
                      v38 = __ldxr(v37);
                    while (__stxr(v38 + 1, v37));
                  }
                  v63 = 1;
                  push(v6, (const PPScoreInterpreterValue *)v62);
                  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v62);
                  v39 = v61;
                  if (v61)
                  {
                    v40 = (unint64_t *)&v61->__shared_owners_;
                    do
                      v41 = __ldaxr(v40);
                    while (__stlxr(v41 - 1, v40));
LABEL_89:
                    if (!v41)
                    {
LABEL_90:
                      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
                      std::__shared_weak_count::__release_weak(v39);
                    }
                  }
                }
                else
                {
                  v39 = (std::__shared_weak_count *)operator new(0x30uLL);
                  v39->__shared_owners_ = 0;
                  v49 = (unint64_t *)&v39->__shared_owners_;
                  v39->__shared_weak_owners_ = 0;
                  v39->__vftable = (std::__shared_weak_count_vtbl *)&off_1E7E17F30;
                  v39[1].__shared_owners_ = 0;
                  v39[1].__shared_weak_owners_ = 0;
                  v39[1].__vftable = 0;
                  v64 = v39 + 1;
                  v65 = v39;
                  v66[0] = v39 + 1;
                  v66[1] = v39;
                  do
                    v50 = __ldxr(v49);
                  while (__stxr(v50 + 1, v49));
                  v67 = 1;
                  push(v6, (const PPScoreInterpreterValue *)v66);
                  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v66);
                  do
                    v51 = __ldaxr(v49);
                  while (__stlxr(v51 - 1, v49));
                  if (!v51)
                    goto LABEL_90;
                }
LABEL_91:
                v11 = 2;
LABEL_92:
                v10 = v13;
                goto LABEL_104;
              case 0x130:
LABEL_22:
                LODWORD(__dst) = 0;
                v20 = &v10[v11];
                if (&v10[v11] > v9)
                  goto LABEL_2;
                memcpy(&__dst, v10, v11);
                v21 = objc_alloc(MEMORY[0x1E0C99DF0]);
                v22 = __dst;
                v23 = (void *)objc_msgSend(v21, "initWithLength:", __dst);
                v10 = &v20[v22];
                if (&v20[v22] > v9)
                {

                  goto LABEL_2;
                }
                v24 = objc_retainAutorelease(v23);
                memcpy((void *)objc_msgSend(v24, "mutableBytes"), v20, v22);
                v60[0] = 0;
                objc_msgSend(MEMORY[0x1E0D815D0], "propertyListWithData:error:", v24, v60);
                v25 = objc_claimAutoreleasedReturnValue();

                if (!v25)
                  __assert_rtn("-[PPScoreInterpreter _runBytecode:context:]", "PPScoreInterpreter.mm", 2154, "plpObject");
                PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v59, v25);
                push(v6, (const PPScoreInterpreterValue *)v59);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v59);

                break;
              default:
LABEL_67:
                objc_opt_self();
                if (((0xBE0009uLL >> v12) & 1) != 0)
                {
                  HIDWORD(__dst) = 0;
                  v48 = &v10[v11];
                  if (&v10[v11] > v9)
                    goto LABEL_2;
                  memcpy((char *)&__dst + 4, v10, v11);
                  v47 = (std::__shared_weak_count *)HIDWORD(__dst);
                  v11 = 2;
                  v10 = v48;
                }
                else
                {
                  v47 = (std::__shared_weak_count *)qword_1C3AE4FB0[v12 + 1];
                }
                -[PPScoreInterpreter _runOperator:arity:context:](v12, v47, v6);
                goto LABEL_104;
            }
            break;
        }
      }
      else
      {
        switch(*v7)
        {
          case 0xFFFB:
            if (v11 != 2)
              __assert_rtn("-[PPScoreInterpreter _runBytecode:context:]", "PPScoreInterpreter.mm", 2025, "nextUIntArgumentSize == sizeof(uint16_t)");
            v11 = 4;
            goto LABEL_104;
          case 0xFFFC:
            HIDWORD(__dst) = 0;
            v13 = &v10[v11];
            if (&v10[v11] > v9)
              goto LABEL_2;
            memcpy((char *)&__dst + 4, v10, v11);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 24), "objectAtIndexedSubscript:", HIDWORD(__dst));
            v42 = objc_claimAutoreleasedReturnValue();
            PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)&v90._previousSubscores, v42);
            push(v6, (const PPScoreInterpreterValue *)&v90._previousSubscores);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v90._previousSubscores);

            goto LABEL_91;
          case 0xFFFD:
            memset(&v90, 0, 24);
            pop(&v90, v6);
            if (LOBYTE(v90._scoreInputs))
            {
              if (LOBYTE(v90._scoreInputs) != 2)
              {
                pp_score_interpreter_log_handle();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  scoreInputs_low = LOBYTE(v90._scoreInputs);
                  _os_log_error_impl(&dword_1C392E000, v55, OS_LOG_TYPE_ERROR, "Attempted to compute IfThenElse with an invalid value type of %d in the if condition", buf, 8u);
                }

                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v90);
LABEL_102:
                v10 += v11;
                if (v10 > v9)
                  goto LABEL_2;
                break;
              }
              PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)&v90);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34 == 0;

              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v90);
              if (v35)
                goto LABEL_102;
            }
            else
            {
              Double = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)&v90);
              if (Double == -31337.0)
              {
                v29 = &v90;
LABEL_95:
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v29);
              }
              else
              {
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v90);
                if ((*(_QWORD *)&Double & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL && Double > 0.0)
                  goto LABEL_102;
              }
            }
LABEL_96:
            HIDWORD(__dst) = 0;
            if (&v10[v11] > v9)
              goto LABEL_2;
            memcpy((char *)&__dst + 4, v10, v11);
            v10 += v11 + HIDWORD(__dst);
            if (v10 >= v9)
              goto LABEL_2;
            break;
          case 0xFFFE:
            pop(&v90, v6);
            v26 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)&v90);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v90);
            if (v26 == -31338.0)
              v27 = -31337.0;
            else
              v27 = v26;
            if (v27 == -31337.0 || (*(_QWORD *)&v27 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
              goto LABEL_102;
            *(double *)v88 = v27;
            v89 = 0;
            push(v6, (const PPScoreInterpreterValue *)v88);
            v29 = (PPScoreInterpreterCtx *)v88;
            goto LABEL_95;
          case 0xFFFF:
            goto LABEL_96;
          default:
            switch(*v7)
            {
              case 0x191:
                HIDWORD(__dst) = 0;
                v13 = &v10[v11];
                if (&v10[v11] > v9)
                  goto LABEL_2;
                memcpy((char *)&__dst + 4, v10, v11);
                objc_msgSend(v6[2], "objectForIndex:", HIDWORD(__dst));
                v17 = objc_claimAutoreleasedReturnValue();
                PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v58, v17);
                push(v6, (const PPScoreInterpreterValue *)v58);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v58);

                break;
              case 0x192:
                HIDWORD(__dst) = 0;
                v13 = &v10[v11];
                if (&v10[v11] > v9)
                  goto LABEL_2;
                memcpy((char *)&__dst + 4, v10, v11);
                objc_msgSend(v6[4], "objectForIndex:", HIDWORD(__dst));
                v30 = objc_claimAutoreleasedReturnValue();
                PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v57, v30);
                push(v6, (const PPScoreInterpreterValue *)v57);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v57);

                break;
              case 0x193:
                HIDWORD(__dst) = 0;
                v13 = &v10[v11];
                if (&v10[v11] > v9)
                  goto LABEL_2;
                memcpy((char *)&__dst + 4, v10, v11);
                objc_msgSend(v6[3], "objectForIndex:", HIDWORD(__dst));
                v31 = objc_claimAutoreleasedReturnValue();
                PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v56, v31);
                push(v6, (const PPScoreInterpreterValue *)v56);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v56);

                break;
              case 0x194:
                goto LABEL_22;
              default:
                goto LABEL_67;
            }
            goto LABEL_91;
        }
      }
      v11 = 2;
LABEL_104:
      v7 = v10;
      __dst = 0;
      v10 += 2;
    }
    while (v10 <= v9);
  }
LABEL_2:

}

- (void)_runOperator:(uint64_t)a1 arity:(std:(void *)a3 :__shared_weak_count *)a2 context:
{
  PPScoreInterpreterCtx *v5;
  PPScoreInterpreterCtx *v6;
  int v7;
  char v8;
  double *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  NSObject *v17;
  double v18;
  double v19;
  double v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  double v33;
  id v34;
  double v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  double v41;
  unint64_t v42;
  double v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  double v47;
  uint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  double v62;
  uint64_t v63;
  long double v64;
  double v65;
  uint64_t v66;
  double v67;
  long double v68;
  NSObject *v69;
  _QWORD *v70;
  unint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  void *v75;
  float *v76;
  float v77;
  PPScoreInterpreterValue *v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  id v82;
  double v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  double v87;
  uint64_t v88;
  double v89;
  double v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  double v94;
  uint64_t v95;
  double v96;
  double v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  double v101;
  uint64_t v102;
  double v103;
  double v104;
  uint64_t v105;
  double v106;
  double v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  double v111;
  uint64_t v112;
  double v113;
  double v114;
  uint64_t v115;
  double v116;
  double v117;
  NSObject *v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  double v122;
  uint64_t v123;
  double v124;
  double v125;
  uint64_t v126;
  unint64_t v127;
  double v128;
  double v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  double v133;
  uint64_t v134;
  double v135;
  double v136;
  uint64_t v137;
  double v138;
  double v139;
  uint64_t v140;
  double v141;
  double v142;
  double v143;
  double v144;
  NSObject *v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  uint64_t v149;
  double v150;
  float v151;
  PPScoreInterpreterValue *v152;
  uint64_t v153;
  double v154;
  float *v155;
  double v156;
  float v157;
  double v158;
  std::__shared_weak_count *v159;
  unint64_t *v160;
  unint64_t v161;
  uint64_t v162;
  NSObject *v163;
  double v164;
  void *v165;
  NSObject *v166;
  NSObject *v167;
  NSObject *v168;
  NSObject *v169;
  float *v170;
  float *v171;
  float v172;
  float v173;
  double v174;
  std::__shared_weak_count *v175;
  unint64_t *v176;
  unint64_t v177;
  uint64_t v178;
  NSObject *v179;
  double v180;
  void *v181;
  NSObject *v182;
  NSObject *v183;
  NSObject *v184;
  NSObject *v185;
  float *v186;
  float *v187;
  float v188;
  float v189;
  double v190;
  std::__shared_weak_count *v191;
  unint64_t *v192;
  unint64_t v193;
  uint64_t v194;
  unint64_t v195;
  unint64_t v196;
  double v197;
  uint64_t v198;
  double v199;
  double v200;
  double v201;
  double v202;
  uint64_t v203;
  unint64_t v204;
  unint64_t v205;
  void *v206;
  uint64_t v207;
  NSObject *v208;
  uint64_t v209;
  unint64_t v210;
  unint64_t v211;
  void *v212;
  unint64_t v213;
  uint64_t v214;
  unint64_t v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  unint64_t v219;
  unint64_t v220;
  double v221;
  uint64_t v222;
  double v223;
  double v224;
  double v225;
  double v226;
  BOOL v227;
  double v228;
  _QWORD *value;
  unint64_t v230;
  uint64_t v231;
  _QWORD *v232;
  uint64_t v233;
  float *v234;
  uint64_t v235;
  unint64_t v236;
  long double v237;
  NSObject *v238;
  uint64_t v239;
  unint64_t v240;
  unint64_t v241;
  double v242;
  uint64_t v243;
  long double v244;
  long double v245;
  NSObject *v246;
  const char *v247;
  NSObject *v248;
  uint32_t v249;
  uint64_t v250;
  double v251;
  float *v252;
  double v253;
  float v254;
  double Double;
  std::__shared_weak_count *v256;
  unint64_t *v257;
  unint64_t v258;
  uint64_t v259;
  unint64_t v260;
  unint64_t v261;
  void *v262;
  uint64_t v263;
  double v264;
  void *v265;
  uint64_t v266;
  unint64_t v267;
  unint64_t v268;
  void *v269;
  uint64_t v270;
  void *v271;
  id v272;
  id v273;
  uint64_t v274;
  unint64_t v275;
  PPScoreInterpreterValue *v276;
  uint64_t v277;
  unint64_t v278;
  float *v279;
  double v280;
  float *v281;
  float v282;
  uint64_t v283;
  unint64_t v284;
  unint64_t v285;
  void *v286;
  uint64_t v287;
  NSObject *v288;
  uint64_t v289;
  unint64_t v290;
  float *v291;
  float *v292;
  uint64_t v293;
  double v294;
  float *v295;
  float v296;
  double v297;
  double v298;
  float v299;
  PPScoreInterpreterValue *v300;
  NSObject *v301;
  void *v302;
  PPScoreInterpreterValue *v303;
  NSObject *v304;
  double v305;
  uint8_t *v306;
  void *v307;
  uint64_t v308;
  NSObject *v309;
  double v310;
  PPScoreInterpreterValue *v311;
  NSObject *v312;
  double v313;
  NSObject *v314;
  id v315;
  unint64_t v316;
  NSObject *v317;
  NSObject *v318;
  NSObject *v319;
  void *v320;
  NSObject *v321;
  NSObject *v322;
  float *v323;
  float *v324;
  NSObject *v325;
  NSObject *v326;
  void *v327;
  uint64_t v328;
  NSObject *v329;
  id v330;
  uint64_t v331;
  unint64_t v332;
  uint64_t v333;
  uint64_t j;
  double v335;
  NSObject *v336;
  double v337;
  _DWORD *v338;
  _DWORD *v339;
  void *v340;
  NSObject *v341;
  NSObject *v342;
  NSObject *v343;
  void *v344;
  uint64_t v345;
  void *v346;
  NSObject *v347;
  NSObject *v348;
  NSObject *v349;
  NSObject *v350;
  id v351;
  double v352;
  std::__shared_weak_count *v353;
  unint64_t *v354;
  unint64_t v355;
  NSObject *v356;
  NSObject *v357;
  NSObject *v358;
  PPScoreInterpreterValue *v359;
  NSObject *v360;
  PPScoreInterpreterValue *v361;
  NSObject *v362;
  NSObject *v363;
  NSObject *v364;
  NSObject *v365;
  NSObject *v366;
  void *v367;
  NSObject *v368;
  const char *v369;
  NSObject *v370;
  uint32_t v371;
  void *v372;
  NSObject *v373;
  void *v374;
  unint64_t i;
  void *v376;
  objc_class *v377;
  void *v378;
  objc_class *v379;
  void *v380;
  objc_class *v381;
  void *v382;
  NSObject *v383;
  PPScoreInterpreterValue *v384;
  NSObject *v385;
  objc_class *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;
  NSObject *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  NSObject *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  objc_class *v414;
  void *v415;
  NSObject *v416;
  _QWORD v417[2];
  char v418;
  _QWORD v419[2];
  char v420;
  _QWORD v421[2];
  char v422;
  _QWORD v423[2];
  char v424;
  _QWORD v425[2];
  char v426;
  _QWORD v427[2];
  char v428;
  double v429[2];
  char v430;
  _QWORD v431[2];
  char v432;
  _BYTE v433[24];
  _QWORD v434[2];
  char v435;
  _QWORD v436[2];
  char v437;
  _BYTE v438[24];
  _QWORD v439[2];
  char v440;
  _BYTE v441[24];
  _QWORD v442[2];
  char v443;
  _QWORD v444[2];
  char v445;
  double v446[2];
  char v447;
  _QWORD v448[2];
  char v449;
  _QWORD v450[2];
  char v451;
  double v452[2];
  char v453;
  double v454[2];
  char v455;
  double v456[2];
  char v457;
  _QWORD v458[5];
  double v459[2];
  char v460;
  _QWORD v461[2];
  char v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  double v467[2];
  char v468;
  _QWORD v469[2];
  char v470;
  _QWORD v471[2];
  char v472;
  double v473[2];
  char v474;
  double v475[2];
  char v476;
  double v477[2];
  char v478;
  double v479[2];
  char v480;
  _QWORD v481[2];
  char v482;
  _QWORD v483[2];
  char v484;
  _QWORD v485[2];
  char v486;
  double v487[2];
  char v488;
  _QWORD v489[2];
  char v490;
  _QWORD v491[2];
  char v492;
  _QWORD v493[2];
  char v494;
  _QWORD v495[2];
  char v496;
  _QWORD v497[2];
  char v498;
  _QWORD v499[2];
  char v500;
  _BYTE v501[24];
  _QWORD v502[2];
  char v503;
  _BYTE v504[24];
  _QWORD v505[2];
  char v506;
  _QWORD v507[2];
  char v508;
  _QWORD v509[2];
  char v510;
  _QWORD v511[2];
  char v512;
  double v513[2];
  char v514;
  _QWORD v515[2];
  char v516;
  _QWORD v517[2];
  char v518;
  _QWORD v519[2];
  char v520;
  _QWORD v521[2];
  char v522;
  _QWORD v523[2];
  char v524;
  _QWORD v525[2];
  char v526;
  _QWORD v527[2];
  char v528;
  _QWORD v529[2];
  char v530;
  _QWORD v531[2];
  char v532;
  _QWORD v533[2];
  char v534;
  _QWORD v535[2];
  char v536;
  _QWORD v537[2];
  char v538;
  double v539[2];
  char v540;
  _QWORD v541[2];
  char v542;
  double v543[2];
  char v544;
  _QWORD v545[2];
  char v546;
  _QWORD v547[2];
  char v548;
  _QWORD v549[2];
  char v550;
  _BYTE v551[24];
  _QWORD v552[2];
  char v553;
  _QWORD v554[2];
  char v555;
  _QWORD v556[2];
  char v557;
  _QWORD v558[2];
  char v559;
  _QWORD v560[2];
  char v561;
  _BYTE v562[24];
  _QWORD v563[2];
  char v564;
  _QWORD v565[2];
  char v566;
  _QWORD v567[2];
  char v568;
  _QWORD v569[2];
  char v570;
  _QWORD v571[2];
  char v572;
  _QWORD v573[2];
  char v574;
  _QWORD v575[2];
  char v576;
  double v577[2];
  char v578;
  _QWORD v579[2];
  char v580;
  double v581[2];
  char v582;
  _QWORD v583[2];
  char v584;
  _QWORD v585[2];
  char v586;
  double v587[2];
  char v588;
  _QWORD v589[2];
  char v590;
  _QWORD v591[2];
  char v592;
  _QWORD v593[2];
  char v594;
  _QWORD v595[2];
  char v596;
  _QWORD v597[2];
  char v598;
  _QWORD v599[2];
  char v600;
  _QWORD v601[2];
  char v602;
  _QWORD v603[2];
  char v604;
  double v605[2];
  char v606;
  _QWORD v607[2];
  char v608;
  _QWORD v609[2];
  char v610;
  double v611[2];
  char v612;
  _QWORD v613[2];
  char v614;
  _QWORD v615[2];
  char v616;
  _QWORD v617[2];
  char v618;
  _QWORD v619[2];
  char v620;
  _QWORD v621[2];
  char v622;
  _QWORD v623[2];
  char v624;
  _QWORD v625[2];
  char v626;
  _QWORD v627[2];
  char v628;
  double v629[2];
  char v630;
  _QWORD v631[2];
  char v632;
  double v633[2];
  char v634;
  _QWORD v635[2];
  char v636;
  _QWORD v637[2];
  char v638;
  _QWORD v639[2];
  char v640;
  _QWORD v641[2];
  char v642;
  uint8_t buf[32];
  _OWORD v644[2];
  _BYTE v645[128];
  __int128 v646;
  __int128 v647;
  uint64_t v648;
  uint64_t v649;

  v649 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v7 = 0;
  v8 = 1;
  switch(a1)
  {
    case 0:
      if ((shouldReturnUndefined(v5, a2) & 1) != 0)
      {
        drop(v6, (unint64_t)a2);
        v641[0] = 0xC0DE9A4000000000;
        v642 = 0;
        push(v6, (const PPScoreInterpreterValue *)v641);
        v9 = (double *)v641;
        goto LABEL_571;
      }
      if (!a2)
      {
        v251 = 0.0;
LABEL_417:
        *(double *)v637 = v251;
        v638 = 0;
        push(v6, (const PPScoreInterpreterValue *)v637);
        v9 = (double *)v637;
        goto LABEL_571;
      }
      v250 = 0;
      v251 = 0.0;
      while (2)
      {
        memset(buf, 0, 24);
        pop((PPScoreInterpreterCtx *)buf, v6);
        if (!buf[16])
        {
          Double = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
          if (Double == -31338.0)
            v253 = 0.0;
          else
            v253 = Double;
          goto LABEL_356;
        }
        if (buf[16] == 1)
        {
          v647 = 0uLL;
          PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v647);
          v252 = *(float **)v647;
          v253 = 0.0;
          while (v252 != *(float **)(v647 + 8))
          {
            v254 = *v252++;
            v253 = v253 + v254;
          }
          v256 = (std::__shared_weak_count *)*((_QWORD *)&v647 + 1);
          if (*((_QWORD *)&v647 + 1))
          {
            v257 = (unint64_t *)(*((_QWORD *)&v647 + 1) + 8);
            do
              v258 = __ldaxr(v257);
            while (__stlxr(v258 - 1, v257));
            if (!v258)
            {
              ((void (*)(std::__shared_weak_count *))v256->__on_zero_shared)(v256);
              std::__shared_weak_count::__release_weak(v256);
            }
          }
LABEL_356:
          v251 = v251 + v253;
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
          if ((std::__shared_weak_count *)++v250 == a2)
            goto LABEL_417;
          continue;
        }
        break;
      }
      pp_score_interpreter_log_handle();
      v350 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v350, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v647) = 67109120;
        DWORD1(v647) = buf[16];
        _os_log_error_impl(&dword_1C392E000, v350, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorSum", (uint8_t *)&v647, 8u);
      }

      v639[0] = 0xC0DE9A4000000000;
      v640 = 0;
      push(v6, (const PPScoreInterpreterValue *)v639);
      v311 = (PPScoreInterpreterValue *)v639;
      goto LABEL_554;
    case 1:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v635[0] = 0xC0DE9A4000000000;
        v636 = 0;
        push(v6, (const PPScoreInterpreterValue *)v635);
        v9 = (double *)v635;
      }
      else
      {
        v194 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v195 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v194) >> 3);
        v196 = v195 - (_QWORD)a2;
        if (v195 <= v195 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v197 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v194 + 24 * v196));
        v198 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v198) >> 3) <= v196 + 1)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v199 = v197;
        v200 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v198 + 24 * (v196 + 1)));
        drop(v6, (unint64_t)a2);
        if (v199 == -31338.0)
          v201 = 0.0;
        else
          v201 = v199;
        if (v200 == -31338.0)
          v202 = 0.0;
        else
          v202 = v200;
        v633[0] = v201 - v202;
        v634 = 0;
        push(v6, (const PPScoreInterpreterValue *)v633);
        v9 = v633;
      }
      goto LABEL_571;
    case 2:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v631[0] = 0xC0DE9A4000000000;
        v632 = 0;
        push(v6, (const PPScoreInterpreterValue *)v631);
        v9 = (double *)v631;
        goto LABEL_571;
      }
      value = v6->_stack.__ptr_.__value_;
      v230 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(value[1] - *value) >> 3) - (_QWORD)a2;
      memset(buf, 0, 24);
      v232 = value;
      v231 = *value;
      if (0xAAAAAAAAAAAAAAABLL * ((v232[1] - v231) >> 3) <= v230)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v231 + 24 * v230));
      drop(v6, (unint64_t)a2);
      if (buf[16])
      {
        if (buf[16] == 1)
        {
          PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v646);
          v648 = 0;
          v647 = 0uLL;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v647, *(const void **)v646, *(_QWORD *)(v646 + 8), (uint64_t)(*(_QWORD *)(v646 + 8) - *(_QWORD *)v646) >> 2);
          std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100]((uint64_t)&v646);
          v233 = *((_QWORD *)&v647 + 1);
          v75 = (void *)v647;
          if ((_QWORD)v647 != *((_QWORD *)&v647 + 1))
          {
            v234 = (float *)v647;
            do
            {
              *v234 = -*v234;
              ++v234;
            }
            while (v234 != (float *)v233);
          }
          std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>(v627, v75, v233);
          v628 = 1;
          push(v6, (const PPScoreInterpreterValue *)v627);
          v78 = (PPScoreInterpreterValue *)v627;
          goto LABEL_323;
        }
        pp_score_interpreter_log_handle();
        v314 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v314, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v647) = 67109120;
          DWORD1(v647) = buf[16];
          _os_log_error_impl(&dword_1C392E000, v314, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorNegate", (uint8_t *)&v647, 8u);
        }

        v625[0] = 0xC0DE9A4000000000;
        v626 = 0;
        push(v6, (const PPScoreInterpreterValue *)v625);
        v311 = (PPScoreInterpreterValue *)v625;
      }
      else
      {
        v313 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
        if (v313 == -31338.0)
          v313 = 0.0;
        v629[0] = -v313;
        v630 = 0;
        push(v6, (const PPScoreInterpreterValue *)v629);
        v311 = (PPScoreInterpreterValue *)v629;
      }
      goto LABEL_554;
    case 3:
      if ((shouldReturnUndefined(v5, a2) & 1) != 0)
      {
        drop(v6, (unint64_t)a2);
        v623[0] = 0xC0DE9A4000000000;
        v624 = 0;
        push(v6, (const PPScoreInterpreterValue *)v623);
        v9 = (double *)v623;
        goto LABEL_571;
      }
      if (!a2)
      {
        v154 = 1.0;
LABEL_411:
        *(double *)v619 = v154;
        v620 = 0;
        push(v6, (const PPScoreInterpreterValue *)v619);
        v9 = (double *)v619;
        goto LABEL_571;
      }
      v153 = 0;
      v154 = 1.0;
      while (2)
      {
        memset(buf, 0, 24);
        pop((PPScoreInterpreterCtx *)buf, v6);
        if (!buf[16])
        {
          v158 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
          if (v158 == -31338.0)
            v156 = 1.0;
          else
            v156 = v158;
          goto LABEL_214;
        }
        if (buf[16] == 1)
        {
          v647 = 0uLL;
          PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v647);
          v155 = *(float **)v647;
          v156 = 1.0;
          while (v155 != *(float **)(v647 + 8))
          {
            v157 = *v155++;
            v156 = v156 * v157;
          }
          v159 = (std::__shared_weak_count *)*((_QWORD *)&v647 + 1);
          if (*((_QWORD *)&v647 + 1))
          {
            v160 = (unint64_t *)(*((_QWORD *)&v647 + 1) + 8);
            do
              v161 = __ldaxr(v160);
            while (__stlxr(v161 - 1, v160));
            if (!v161)
            {
              ((void (*)(std::__shared_weak_count *))v159->__on_zero_shared)(v159);
              std::__shared_weak_count::__release_weak(v159);
            }
          }
LABEL_214:
          v154 = v154 * v156;
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
          if ((std::__shared_weak_count *)++v153 == a2)
            goto LABEL_411;
          continue;
        }
        break;
      }
      pp_score_interpreter_log_handle();
      v349 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v349, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v647) = 67109120;
        DWORD1(v647) = buf[16];
        _os_log_error_impl(&dword_1C392E000, v349, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorProduct", (uint8_t *)&v647, 8u);
      }

      v621[0] = 0xC0DE9A4000000000;
      v622 = 0;
      push(v6, (const PPScoreInterpreterValue *)v621);
      v311 = (PPScoreInterpreterValue *)v621;
LABEL_554:
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v311);
LABEL_555:
      v9 = (double *)buf;
      goto LABEL_571;
    case 4:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v617[0] = 0xC0DE9A4000000000;
        v618 = 0;
        push(v6, (const PPScoreInterpreterValue *)v617);
        v9 = (double *)v617;
      }
      else
      {
        v218 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v219 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v218) >> 3);
        v220 = v219 - (_QWORD)a2;
        if (v219 <= v219 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v221 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v218 + 24 * v220));
        v222 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v222) >> 3) <= v220 + 1)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v223 = v221;
        v224 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v222 + 24 * (v220 + 1)));
        drop(v6, (unint64_t)a2);
        if (v223 == -31338.0)
          v225 = 0.0;
        else
          v225 = v223;
        if (v224 == -31338.0)
          v226 = 0.0;
        else
          v226 = v224;
        v227 = v225 < v226;
        v228 = 1.0;
        if (v227)
          v228 = 0.0;
        *(double *)v615 = v228;
        v616 = 0;
        push(v6, (const PPScoreInterpreterValue *)v615);
        v9 = (double *)v615;
      }
      goto LABEL_571;
    case 5:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v613[0] = 0xC0DE9A4000000000;
        v614 = 0;
        push(v6, (const PPScoreInterpreterValue *)v613);
        v9 = (double *)v613;
        goto LABEL_571;
      }
      v239 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v240 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v239) >> 3);
      v241 = v240 - (_QWORD)a2;
      if (v240 <= v240 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      v242 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v239 + 24 * v241));
      v243 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v243) >> 3) <= v241 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      v244 = v242;
      v245 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v243 + 24 * (v241 + 1)));
      drop(v6, (unint64_t)a2);
      if (v244 <= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v395 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
        v396 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v395, "handleFailureInFunction:file:lineNumber:description:", v396, CFSTR("PPScoreInterpreter.mm"), 1206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value > 0"));

      }
      if (v245 <= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v397 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
        v398 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v397, "handleFailureInFunction:file:lineNumber:description:", v398, CFSTR("PPScoreInterpreter.mm"), 1207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("base > 0"));

      }
      if (v244 <= 0.0)
      {
        pp_score_interpreter_log_handle();
        v246 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
          goto LABEL_406;
        *(_DWORD *)buf = 134217984;
        *(long double *)&buf[4] = v244;
        v247 = "Attempted to compute log10 of non-positive number %f (value arg of Logarithm operator) --  output is NaN";
        v248 = v246;
        v249 = 12;
        goto LABEL_624;
      }
      if (v245 > 0.0)
        goto LABEL_407;
      pp_score_interpreter_log_handle();
      v246 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(long double *)&buf[4] = v244;
        *(_WORD *)&buf[12] = 2048;
        *(long double *)&buf[14] = v245;
        v247 = "Attempted to compute log10 of number %f with negative base of %f -- output is NaN";
        v248 = v246;
        v249 = 22;
LABEL_624:
        _os_log_error_impl(&dword_1C392E000, v248, OS_LOG_TYPE_ERROR, v247, buf, v249);
      }
LABEL_406:

LABEL_407:
      v305 = log2(v244);
      v611[0] = v305 / log2(v245);
      v612 = 0;
      push(v6, (const PPScoreInterpreterValue *)v611);
      v9 = v611;
      goto LABEL_571;
    case 6:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v609[0] = 0xC0DE9A4000000000;
        v610 = 0;
        push(v6, (const PPScoreInterpreterValue *)v609);
        v9 = (double *)v609;
      }
      else
      {
        v119 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v120 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v119) >> 3);
        v121 = v120 - (_QWORD)a2;
        if (v120 <= v120 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v122 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v119 + 24 * v121));
        v123 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v123) >> 3) <= v121 + 1)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v124 = v122;
        v125 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v123 + 24 * (v121 + 1)));
        drop(v6, (unint64_t)a2);
        if (v125 == 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v392 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
          v393 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v392, "handleFailureInFunction:file:lineNumber:description:", v393, CFSTR("PPScoreInterpreter.mm"), 1218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("denominator != 0"));

          pp_score_interpreter_log_handle();
          v394 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v394, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(double *)&buf[4] = v124;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v125;
            _os_log_error_impl(&dword_1C392E000, v394, OS_LOG_TYPE_ERROR, "Divide by zero error (%f / %f) -- setting output to PPScoreNotSet", buf, 0x16u);
          }

          v607[0] = 0xC0DE9A4000000000;
          v608 = 0;
          push(v6, (const PPScoreInterpreterValue *)v607);
          v9 = (double *)v607;
        }
        else
        {
          v605[0] = v124 / v125;
          v606 = 0;
          push(v6, (const PPScoreInterpreterValue *)v605);
          v9 = v605;
        }
      }
      goto LABEL_571;
    case 7:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v603[0] = 0xC0DE9A4000000000;
        v604 = 0;
        push(v6, (const PPScoreInterpreterValue *)v603);
        v9 = (double *)v603;
      }
      else
      {
        v235 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v236 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v235) >> 3);
        if (v236 <= v236 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v237 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v235 + 24 * (v236 - (_QWORD)a2)));
        drop(v6, (unint64_t)a2);
        if (v237 <= 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v388 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
          v389 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v388, "handleFailureInFunction:file:lineNumber:description:", v389, CFSTR("PPScoreInterpreter.mm"), 1228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value > 0"));

          pp_score_interpreter_log_handle();
          v238 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(long double *)&buf[4] = v237;
            _os_log_error_impl(&dword_1C392E000, v238, OS_LOG_TYPE_ERROR, "Attempted to compute NatLog of non-positive number %f -- output is NaN", buf, 0xCu);
          }

        }
        v601[0] = log(v237);
        v602 = 0;
        push(v6, (const PPScoreInterpreterValue *)v601);
        v9 = (double *)v601;
      }
      goto LABEL_571;
    case 8:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v599[0] = 0xC0DE9A4000000000;
        v600 = 0;
        push(v6, (const PPScoreInterpreterValue *)v599);
        v9 = (double *)v599;
      }
      else
      {
        v126 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v127 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v126) >> 3);
        if (v127 <= v127 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v128 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v126 + 24 * (v127 - (_QWORD)a2)));
        drop(v6, (unint64_t)a2);
        v129 = 0.0;
        if (v128 != -31338.0)
          v129 = v128;
        v597[0] = exp(v129);
        v598 = 0;
        push(v6, (const PPScoreInterpreterValue *)v597);
        v9 = (double *)v597;
      }
      goto LABEL_571;
    case 9:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v595[0] = 0xC0DE9A4000000000;
        v596 = 0;
        push(v6, (const PPScoreInterpreterValue *)v595);
        v9 = (double *)v595;
      }
      else
      {
        v84 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v85 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v84) >> 3);
        v86 = v85 - (_QWORD)a2;
        if (v85 <= v85 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v87 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v84 + 24 * v86));
        v88 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v88) >> 3) <= v86 + 1)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v89 = v87;
        v90 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v88 + 24 * (v86 + 1)));
        drop(v6, (unint64_t)a2);
        if (v89 == -31338.0)
          v89 = 0.0;
        if (v90 == -31338.0)
          v90 = 0.0;
        if (v89 <= 0.0 && (v89 != 0.0 || v90 < 0.0) && v90 != (double)(int)v90)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v399 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
          v400 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v399, "handleFailureInFunction:file:lineNumber:description:", v400, CFSTR("PPScoreInterpreter.mm"), 1247, CFSTR("Attempted to compute pow(%f, %f)"), *(_QWORD *)&v89, *(_QWORD *)&v90);

          pp_score_interpreter_log_handle();
          v401 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v401, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(double *)&buf[4] = v89;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v90;
            _os_log_error_impl(&dword_1C392E000, v401, OS_LOG_TYPE_ERROR, "Attempted to compute pow(%f,%f) -- output is NaN", buf, 0x16u);
          }

        }
        v593[0] = pow(v89, v90);
        v594 = 0;
        push(v6, (const PPScoreInterpreterValue *)v593);
        v9 = (double *)v593;
      }
      goto LABEL_571;
    case 11:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)3))
      {
        drop(v6, (unint64_t)a2);
        v591[0] = 0xC0DE9A4000000000;
        v592 = 0;
        push(v6, (const PPScoreInterpreterValue *)v591);
        v9 = (double *)v591;
        goto LABEL_571;
      }
      v108 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v109 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v108) >> 3);
      v110 = v109 - (_QWORD)a2;
      if (v109 <= v109 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      v111 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v108 + 24 * v110));
      v112 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v112) >> 3) <= v110 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      v113 = v111;
      v114 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v112 + 24 * (v110 + 1)));
      v115 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v115) >> 3) <= v110 + 2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      v116 = v114;
      v117 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v115 + 24 * (v110 + 2)));
      drop(v6, (unint64_t)a2);
      if (v113 < 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v406 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
        v407 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v406, "handleFailureInFunction:file:lineNumber:description:", v407, CFSTR("PPScoreInterpreter.mm"), 1259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("age >= 0"));

      }
      if (v116 <= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v408 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
        v409 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v408, "handleFailureInFunction:file:lineNumber:description:", v409, CFSTR("PPScoreInterpreter.mm"), 1260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("halflife > 0"));

      }
      if (v113 < 0.0)
      {
        pp_score_interpreter_log_handle();
        v118 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v113;
          _os_log_error_impl(&dword_1C392E000, v118, OS_LOG_TYPE_ERROR, "Attempted to compute ExpDecay with negative age: %f  -- output is NaN", buf, 0xCu);
        }

        goto LABEL_409;
      }
      if (v116 > 0.0)
      {
LABEL_409:
        v587[0] = exp(v113 * (-0.693147181 / v116)) * v117;
        v588 = 0;
        push(v6, (const PPScoreInterpreterValue *)v587);
        v9 = v587;
        goto LABEL_571;
      }
      pp_score_interpreter_log_handle();
      v336 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&buf[4] = v116;
        _os_log_error_impl(&dword_1C392E000, v336, OS_LOG_TYPE_ERROR, "Attempted to compute ExpDecay with non-positive half-life: %f -- forcing output to PPScoreNotSet", buf, 0xCu);
      }

      v589[0] = 0xC0DE9A4000000000;
      v590 = 0;
      push(v6, (const PPScoreInterpreterValue *)v589);
      v9 = (double *)v589;
      goto LABEL_571;
    case 12:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)3))
      {
        drop(v6, (unint64_t)a2);
        v585[0] = 0xC0DE9A4000000000;
        v586 = 0;
        push(v6, (const PPScoreInterpreterValue *)v585);
        v9 = (double *)v585;
      }
      else
      {
        v59 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v60 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v59) >> 3);
        v61 = v60 - (_QWORD)a2;
        if (v60 <= v60 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v62 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v59 + 24 * v61));
        v63 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v63) >> 3) <= v61 + 1)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v64 = v62;
        v65 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v63 + 24 * (v61 + 1)));
        v66 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v66) >> 3) <= v61 + 2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v67 = v65;
        v68 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v66 + 24 * (v61 + 2)));
        drop(v6, (unint64_t)a2);
        if (v68 == 1.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v402 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
          v403 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v402, "handleFailureInFunction:file:lineNumber:description:", v403, CFSTR("PPScoreInterpreter.mm"), 1272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ratio != 1"));

        }
        if (v68 < 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v404 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
          v405 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v404, "handleFailureInFunction:file:lineNumber:description:", v405, CFSTR("PPScoreInterpreter.mm"), 1273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ratio >= 0"));

        }
        if (v68 == 1.0)
        {
          pp_score_interpreter_log_handle();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1C392E000, v69, OS_LOG_TYPE_ERROR, "Attempted to compute GeometricSum with a ratio of 1 -- setting output to PPScoreNotSet", buf, 2u);
          }

          v583[0] = 0xC0DE9A4000000000;
          v584 = 0;
          push(v6, (const PPScoreInterpreterValue *)v583);
          v9 = (double *)v583;
        }
        else
        {
          if (v68 < 0.0 && v64 != (double)(int)v64)
          {
            pp_score_interpreter_log_handle();
            v309 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v309, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(long double *)&buf[4] = v68;
              *(_WORD *)&buf[12] = 2048;
              *(long double *)&buf[14] = v64;
              _os_log_error_impl(&dword_1C392E000, v309, OS_LOG_TYPE_ERROR, "Attempted to compute GeometricSum with ratio of %f and terms of %f -- result will be NaN", buf, 0x16u);
            }

          }
          v581[0] = v67 * ((1.0 - pow(v68, v64)) / (1.0 - v68));
          v582 = 0;
          push(v6, (const PPScoreInterpreterValue *)v581);
          v9 = v581;
        }
      }
      goto LABEL_571;
    case 13:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)3))
      {
        drop(v6, (unint64_t)a2);
        v579[0] = 0xC0DE9A4000000000;
        v580 = 0;
        push(v6, (const PPScoreInterpreterValue *)v579);
        v9 = (double *)v579;
      }
      else
      {
        v98 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v99 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v98) >> 3);
        v100 = v99 - (_QWORD)a2;
        if (v99 <= v99 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v101 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v98 + 24 * v100));
        v102 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v102) >> 3) <= v100 + 1)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v103 = v101;
        v104 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v102 + 24 * (v100 + 1)));
        v105 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v105) >> 3) <= v100 + 2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v106 = v104;
        v107 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v105 + 24 * (v100 + 2)));
        drop(v6, (unint64_t)a2);
        v577[0] = v106 / (exp(-(v107 * v103)) + 1.0);
        v578 = 0;
        push(v6, (const PPScoreInterpreterValue *)v577);
        v9 = v577;
      }
      goto LABEL_571;
    case 15:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)4))
      {
        drop(v6, (unint64_t)a2);
        v575[0] = 0xC0DE9A4000000000;
        v576 = 0;
        push(v6, (const PPScoreInterpreterValue *)v575);
        v9 = (double *)v575;
      }
      else
      {
        v130 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v131 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v130) >> 3);
        v132 = v131 - (_QWORD)a2;
        if (v131 <= v131 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v133 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v130 + 24 * v132));
        v134 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v134) >> 3) <= v132 + 1)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v135 = v133;
        v136 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v134 + 24 * (v132 + 1)));
        v137 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v137) >> 3) <= v132 + 2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v138 = v136;
        v139 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v137 + 24 * (v132 + 2)));
        v140 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v140) >> 3) <= v132 + 3)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v141 = v139;
        v142 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v140 + 24 * (v132 + 3)));
        drop(v6, (unint64_t)a2);
        if (v138 > v142)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v410 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
          v411 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v410, "handleFailureInFunction:file:lineNumber:description:", v411, CFSTR("PPScoreInterpreter.mm"), 1294, CFSTR("ClampToRange: minVal (%f) must be <= defaultVal (%f) "), *(_QWORD *)&v138, *(_QWORD *)&v142);

        }
        if (v142 > v141)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v412 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
          v413 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v412, "handleFailureInFunction:file:lineNumber:description:", v413, CFSTR("PPScoreInterpreter.mm"), 1295, CFSTR("ClampToRange: defaultVal (%f) must be <= maxVal (%f) "), *(_QWORD *)&v142, *(_QWORD *)&v141);

        }
        v143 = v135;
        if (v135 < v138)
          v143 = v138;
        if (v143 >= v141)
          v144 = v141;
        else
          v144 = v143;
        if (v144 != v135)
        {
          pp_score_interpreter_log_handle();
          v145 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134219008;
            *(double *)&buf[4] = v135;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v138;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&buf[24] = v141;
            LOWORD(v644[0]) = 2048;
            *(double *)((char *)v644 + 2) = v142;
            WORD5(v644[0]) = 2048;
            *(double *)((char *)v644 + 12) = v144;
            _os_log_impl(&dword_1C392E000, v145, OS_LOG_TYPE_INFO, "ClampToRange(input=%f, min=%f, max=%f, default=%f): input coerced to %f", buf, 0x34u);
          }

        }
        *(double *)v573 = v144;
        v574 = 0;
        push(v6, (const PPScoreInterpreterValue *)v573);
        v9 = (double *)v573;
      }
      goto LABEL_571;
    case 16:
      pop((PPScoreInterpreterCtx *)buf, v5);
      v18 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
      pop((PPScoreInterpreterCtx *)buf, v6);
      v19 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
      if (v18 == -31337.0 || (*(_QWORD *)&v18 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
        v18 = 1.0;
      if (v19 >= 0.0)
        v21 = v19 * v18;
      else
        v21 = v19 / fmax(v18, 0.0000001);
      *(double *)v571 = v21;
      v572 = 0;
      push(v6, (const PPScoreInterpreterValue *)v571);
      v9 = (double *)v571;
      goto LABEL_571;
    case 17:
      if ((shouldReturnUndefined(v5, a2) & 1) != 0)
      {
        drop(v6, (unint64_t)a2);
        v569[0] = 0xC0DE9A4000000000;
        v570 = 0;
        push(v6, (const PPScoreInterpreterValue *)v569);
        v9 = (double *)v569;
        goto LABEL_571;
      }
      if (!a2)
      {
        v180 = -INFINITY;
LABEL_415:
        *(double *)v560 = v180;
        v561 = 0;
        push(v6, (const PPScoreInterpreterValue *)v560);
        v9 = (double *)v560;
        goto LABEL_571;
      }
      v178 = 0;
      v179 = 0;
      v180 = -INFINITY;
      while (2)
      {
        memset(buf, 0, 24);
        pop((PPScoreInterpreterCtx *)buf, v6);
        if (buf[16])
        {
          if (buf[16] != 1)
          {
            if (buf[16] == 2)
            {
              PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & (v180 == -INFINITY)) != 0)
              {
                v182 = v181;
                v183 = v182;
                if (v179)
                {
                  if (-[NSObject compare:](v182, "compare:", v179) == 1)
                    v184 = v183;
                  else
                    v184 = v179;
                  v185 = v184;

                  v179 = v185;
                }
                else
                {
                  v179 = v182;
                }

              }
LABEL_281:
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
              if ((std::__shared_weak_count *)++v178 == a2)
              {
                if (v179)
                {
                  PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v562, v179);
                  push(v6, (const PPScoreInterpreterValue *)v562);
                  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v562);

                  goto LABEL_572;
                }
                goto LABEL_415;
              }
              continue;
            }
            pp_score_interpreter_log_handle();
            v360 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v647) = 67109120;
              DWORD1(v647) = buf[16];
              _os_log_error_impl(&dword_1C392E000, v360, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMaximum", (uint8_t *)&v647, 8u);
            }

            v563[0] = 0xC0DE9A4000000000;
            v564 = 0;
            v361 = (PPScoreInterpreterValue *)v563;
            push(v6, (const PPScoreInterpreterValue *)v563);
            break;
          }
          if (!v179)
          {
            v647 = 0uLL;
            PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v647);
            v186 = *(float **)v647;
            v187 = *(float **)(v647 + 8);
            if (*(float **)v647 == v187)
            {
              v188 = -INFINITY;
            }
            else
            {
              v188 = -INFINITY;
              do
              {
                v189 = *v186++;
                v188 = fmaxf(v188, v189);
              }
              while (v186 != v187);
            }
            v191 = (std::__shared_weak_count *)*((_QWORD *)&v647 + 1);
            if (*((_QWORD *)&v647 + 1))
            {
              v192 = (unint64_t *)(*((_QWORD *)&v647 + 1) + 8);
              do
                v193 = __ldaxr(v192);
              while (__stlxr(v193 - 1, v192));
              if (!v193)
              {
                ((void (*)(std::__shared_weak_count *))v191->__on_zero_shared)(v191);
                std::__shared_weak_count::__release_weak(v191);
              }
            }
            v179 = 0;
            v190 = v188;
LABEL_277:
            v180 = fmax(v180, v190);
            goto LABEL_281;
          }
          pp_score_interpreter_log_handle();
          v363 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v363, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v647) = 67109120;
            DWORD1(v647) = buf[16];
            _os_log_error_impl(&dword_1C392E000, v363, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMaximum", (uint8_t *)&v647, 8u);
          }

          v565[0] = 0xC0DE9A4000000000;
          v566 = 0;
          v361 = (PPScoreInterpreterValue *)v565;
          push(v6, (const PPScoreInterpreterValue *)v565);
        }
        else
        {
          if (!v179)
          {
            v190 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
            v179 = 0;
            if (v190 == -31338.0)
              v190 = -INFINITY;
            goto LABEL_277;
          }
          pp_score_interpreter_log_handle();
          v365 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v365, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v647) = 67109120;
            DWORD1(v647) = buf[16];
            _os_log_error_impl(&dword_1C392E000, v365, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMaximum", (uint8_t *)&v647, 8u);
          }

          v567[0] = 0xC0DE9A4000000000;
          v568 = 0;
          v361 = (PPScoreInterpreterValue *)v567;
          push(v6, (const PPScoreInterpreterValue *)v567);
        }
        break;
      }
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v361);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

      goto LABEL_572;
    case 18:
      if ((shouldReturnUndefined(v5, a2) & 1) != 0)
      {
        drop(v6, (unint64_t)a2);
        v558[0] = 0xC0DE9A4000000000;
        v559 = 0;
        push(v6, (const PPScoreInterpreterValue *)v558);
        v9 = (double *)v558;
        goto LABEL_571;
      }
      if (!a2)
      {
        v164 = INFINITY;
LABEL_413:
        *(double *)v549 = v164;
        v550 = 0;
        push(v6, (const PPScoreInterpreterValue *)v549);
        v9 = (double *)v549;
        goto LABEL_571;
      }
      v162 = 0;
      v163 = 0;
      v164 = INFINITY;
      while (2)
      {
        memset(buf, 0, 24);
        pop((PPScoreInterpreterCtx *)buf, v6);
        if (buf[16])
        {
          if (buf[16] != 1)
          {
            if (buf[16] == 2)
            {
              PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
              v165 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & (v164 == INFINITY)) != 0)
              {
                v166 = v165;
                v167 = v166;
                if (v163)
                {
                  if (-[NSObject compare:](v166, "compare:", v163) == -1)
                    v168 = v167;
                  else
                    v168 = v163;
                  v169 = v168;

                  v163 = v169;
                }
                else
                {
                  v163 = v166;
                }

              }
LABEL_247:
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
              if ((std::__shared_weak_count *)++v162 == a2)
              {
                if (v163)
                {
                  PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v551, v163);
                  push(v6, (const PPScoreInterpreterValue *)v551);
                  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v551);

                  goto LABEL_572;
                }
                goto LABEL_413;
              }
              continue;
            }
            pp_score_interpreter_log_handle();
            v358 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v358, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v647) = 67109120;
              DWORD1(v647) = buf[16];
              _os_log_error_impl(&dword_1C392E000, v358, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMinimum", (uint8_t *)&v647, 8u);
            }

            v552[0] = 0xC0DE9A4000000000;
            v553 = 0;
            v359 = (PPScoreInterpreterValue *)v552;
            push(v6, (const PPScoreInterpreterValue *)v552);
            break;
          }
          if (!v163)
          {
            v647 = 0uLL;
            PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v647);
            v170 = *(float **)v647;
            v171 = *(float **)(v647 + 8);
            if (*(float **)v647 == v171)
            {
              v172 = INFINITY;
            }
            else
            {
              v172 = INFINITY;
              do
              {
                v173 = *v170++;
                v172 = fminf(v172, v173);
              }
              while (v170 != v171);
            }
            v175 = (std::__shared_weak_count *)*((_QWORD *)&v647 + 1);
            if (*((_QWORD *)&v647 + 1))
            {
              v176 = (unint64_t *)(*((_QWORD *)&v647 + 1) + 8);
              do
                v177 = __ldaxr(v176);
              while (__stlxr(v177 - 1, v176));
              if (!v177)
              {
                ((void (*)(std::__shared_weak_count *))v175->__on_zero_shared)(v175);
                std::__shared_weak_count::__release_weak(v175);
              }
            }
            v163 = 0;
            v174 = v172;
LABEL_243:
            v164 = fmin(v164, v174);
            goto LABEL_247;
          }
          pp_score_interpreter_log_handle();
          v362 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v362, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v647) = 67109120;
            DWORD1(v647) = buf[16];
            _os_log_error_impl(&dword_1C392E000, v362, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMinimum", (uint8_t *)&v647, 8u);
          }

          v554[0] = 0xC0DE9A4000000000;
          v555 = 0;
          v359 = (PPScoreInterpreterValue *)v554;
          push(v6, (const PPScoreInterpreterValue *)v554);
        }
        else
        {
          if (!v163)
          {
            v174 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
            v163 = 0;
            if (v174 == -31338.0)
              v174 = INFINITY;
            goto LABEL_243;
          }
          pp_score_interpreter_log_handle();
          v364 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v364, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v647) = 67109120;
            DWORD1(v647) = buf[16];
            _os_log_error_impl(&dword_1C392E000, v364, OS_LOG_TYPE_ERROR, "Invalid value of type %d passed to PPOperatorMinimum", (uint8_t *)&v647, 8u);
          }

          v556[0] = 0xC0DE9A4000000000;
          v557 = 0;
          v359 = (PPScoreInterpreterValue *)v556;
          push(v6, (const PPScoreInterpreterValue *)v556);
        }
        break;
      }
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v359);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

      goto LABEL_572;
    case 19:
      drop(v5, (unint64_t)a2);
      pp_score_interpreter_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C392E000, v17, OS_LOG_TYPE_ERROR, "PPOperatorNeuralNet is not supported anymore", buf, 2u);
      }

      v547[0] = 0xC0DE9A4000000000;
      v548 = 0;
      push(v6, (const PPScoreInterpreterValue *)v547);
      v9 = (double *)v547;
      goto LABEL_571;
    case 21:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v545[0] = 0xC0DE9A4000000000;
        v546 = 0;
        push(v6, (const PPScoreInterpreterValue *)v545);
        v9 = (double *)v545;
        goto LABEL_571;
      }
      v266 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v267 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v266) >> 3);
      v268 = v267 - (_QWORD)a2;
      if (v267 <= v267 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v266 + 24 * v268));
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      v270 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v270) >> 3) <= v268 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v270 + 24 * (v268 + 1)));
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      drop(v6, (unint64_t)a2);
      v272 = v269;
      v273 = v271;
      objc_msgSend(v272, "length");
      v543[0] = (double)objc_msgSend(v273, "containsObject:", v272);
      v544 = 0;
      push(v6, (const PPScoreInterpreterValue *)v543);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v543);

      goto LABEL_572;
    case 22:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v541[0] = 0xC0DE9A4000000000;
        v542 = 0;
        push(v6, (const PPScoreInterpreterValue *)v541);
        v9 = (double *)v541;
      }
      else
      {
        v91 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v92 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v91) >> 3);
        v93 = v92 - (_QWORD)a2;
        if (v92 <= v92 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v94 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v91 + 24 * v93));
        v95 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v95) >> 3) <= v93 + 1)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v96 = v94;
        v97 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v95 + 24 * (v93 + 1)));
        drop(v6, (unint64_t)a2);
        if (v96 > v97)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v390 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PPScoreInterpreter _runOperator:arity:context:]");
          v391 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v390, "handleFailureInFunction:file:lineNumber:description:", v391, CFSTR("PPScoreInterpreter.mm"), 1463, CFSTR("RandomUniform: start (%f) must be <= end (%f) "), *(_QWORD *)&v96, *(_QWORD *)&v97);

        }
        v539[0] = v96 + (v97 - v96) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0);
        v540 = 0;
        push(v6, (const PPScoreInterpreterValue *)v539);
        v9 = v539;
      }
      goto LABEL_571;
    case 24:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v537[0] = 0xC0DE9A4000000000;
        v538 = 0;
        push(v6, (const PPScoreInterpreterValue *)v537);
        v9 = (double *)v537;
        goto LABEL_571;
      }
      v70 = v6->_stack.__ptr_.__value_;
      v71 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v70[1] - *v70) >> 3) - (_QWORD)a2;
      memset(buf, 0, 24);
      v73 = v70;
      v72 = *v70;
      if (0xAAAAAAAAAAAAAAABLL * ((v73[1] - v72) >> 3) <= v71)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v72 + 24 * v71));
      drop(v6, (unint64_t)a2);
      if (!buf[16])
      {
        v310 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
        if (v310 == -31338.0)
          v310 = 0.0;
        v535[0] = fabs(v310);
        v536 = 0;
        push(v6, (const PPScoreInterpreterValue *)v535);
        v311 = (PPScoreInterpreterValue *)v535;
        goto LABEL_554;
      }
      if (buf[16] != 1)
      {
        pp_score_interpreter_log_handle();
        v312 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v312, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v647) = 67109120;
          DWORD1(v647) = buf[16];
          _os_log_error_impl(&dword_1C392E000, v312, OS_LOG_TYPE_ERROR, "Invalid value of type %d in argument to PPOperatorAbsVal", (uint8_t *)&v647, 8u);
        }

        v531[0] = 0xC0DE9A4000000000;
        v532 = 0;
        push(v6, (const PPScoreInterpreterValue *)v531);
        v311 = (PPScoreInterpreterValue *)v531;
        goto LABEL_554;
      }
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v646);
      v648 = 0;
      v647 = 0uLL;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v647, *(const void **)v646, *(_QWORD *)(v646 + 8), (uint64_t)(*(_QWORD *)(v646 + 8) - *(_QWORD *)v646) >> 2);
      std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100]((uint64_t)&v646);
      v74 = *((_QWORD *)&v647 + 1);
      v75 = (void *)v647;
      if ((_QWORD)v647 != *((_QWORD *)&v647 + 1))
      {
        v76 = (float *)v647;
        do
        {
          v77 = *v76;
          if (*v76 < 0.0)
            v77 = -*v76;
          *v76++ = v77;
        }
        while (v76 != (float *)v74);
      }
      std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>(v533, v75, v74);
      v534 = 1;
      push(v6, (const PPScoreInterpreterValue *)v533);
      v78 = (PPScoreInterpreterValue *)v533;
LABEL_323:
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v78);
      if (v75)
        operator delete(v75);
      goto LABEL_555;
    case 25:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v529[0] = 0xC0DE9A4000000000;
        v530 = 0;
        push(v6, (const PPScoreInterpreterValue *)v529);
        v9 = (double *)v529;
        goto LABEL_571;
      }
      v146 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v147 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v146) >> 3);
      v148 = v147 - (_QWORD)a2;
      v647 = 0uLL;
      if (v147 <= v147 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v146 + 24 * v148), &v647);
      v149 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v149) >> 3) <= v148 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      v150 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v149 + 24 * (v148 + 1)));
      drop(v6, (unint64_t)a2);
      memset(buf, 0, 24);
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(buf, *(const void **)v647, *(_QWORD *)(v647 + 8), (uint64_t)(*(_QWORD *)(v647 + 8) - *(_QWORD *)v647) >> 2);
      v151 = v150;
      *(float *)&v646 = v151;
      std::vector<float>::push_back[abi:ne180100]((uint64_t)buf, &v646);
      v38 = *(void **)buf;
      std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>(v527, *(const void **)buf, *(uint64_t *)&buf[8]);
      v528 = 1;
      push(v6, (const PPScoreInterpreterValue *)v527);
      v152 = (PPScoreInterpreterValue *)v527;
      goto LABEL_422;
    case 26:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v525[0] = 0xC0DE9A4000000000;
        v526 = 0;
        push(v6, (const PPScoreInterpreterValue *)v525);
        v9 = (double *)v525;
        goto LABEL_571;
      }
      v277 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v278 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v277) >> 3);
      *(_QWORD *)&buf[8] = 0;
      *(_QWORD *)buf = 0;
      if (v278 <= v278 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v277 + 24 * (v278 - (_QWORD)a2)), buf);
      drop(v6, (unint64_t)a2);
      v279 = *(float **)(*(_QWORD *)buf + 8);
      v280 = 0.0;
      if (**(float ***)buf != v279)
      {
        v281 = **(float ***)buf;
        do
        {
          v282 = *v281++;
          v280 = v280 + v282;
        }
        while (v281 != v279);
        v280 = v280 / (double)(unint64_t)(((uint64_t)v279 - **(_QWORD **)buf) >> 2);
      }
      *(double *)v523 = v280;
      v524 = 0;
      push(v6, (const PPScoreInterpreterValue *)v523);
      v276 = (PPScoreInterpreterValue *)v523;
      goto LABEL_420;
    case 27:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v521[0] = 0xC0DE9A4000000000;
        v522 = 0;
        push(v6, (const PPScoreInterpreterValue *)v521);
        v9 = (double *)v521;
LABEL_571:
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v9);
        goto LABEL_572;
      }
      v36 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v37 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v36) >> 3);
      v647 = 0uLL;
      if (v37 <= v37 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v36 + 24 * (v37 - (_QWORD)a2)), &v647);
      drop(v6, (unint64_t)a2);
      memset(buf, 0, 24);
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(buf, *(const void **)v647, *(_QWORD *)(v647 + 8), (uint64_t)(*(_QWORD *)(v647 + 8) - *(_QWORD *)v647) >> 2);
      v38 = *(void **)buf;
      v39 = *(_QWORD *)&buf[8] - *(_QWORD *)buf;
      if (*(_QWORD *)&buf[8] == *(_QWORD *)buf)
      {
        v519[0] = 0xC0DE9A4000000000;
        v520 = 0;
        push(v6, (const PPScoreInterpreterValue *)v519);
        v152 = (PPScoreInterpreterValue *)v519;
LABEL_422:
        PPScoreInterpreterValue::~PPScoreInterpreterValue(v152);
        if (!v38)
        {
LABEL_540:
          v306 = (uint8_t *)&v647;
LABEL_541:
          std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100]((uint64_t)v306);
          goto LABEL_572;
        }
LABEL_539:
        operator delete(v38);
        goto LABEL_540;
      }
      LOBYTE(v646) = 0;
      std::__sort<std::__less<float,float> &,float *>();
      v40 = v39 >> 2;
      v41 = (double)(unint64_t)(v39 >> 2) * 0.5 + -1.0;
      v42 = (int)v41;
      if (v41 == (double)(int)v41)
      {
        if (v40 > v42 && v40 > (int)v42 + 1)
        {
          v43 = (float)(*((float *)v38 + v42) + *((float *)v38 + (int)v42 + 1)) * 0.5;
LABEL_538:
          *(double *)v517 = v43;
          v518 = 0;
          push(v6, (const PPScoreInterpreterValue *)v517);
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v517);
          goto LABEL_539;
        }
      }
      else if (v40 > v42)
      {
        v43 = *((float *)v38 + v42);
        goto LABEL_538;
      }
LABEL_657:
      std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
    case 28:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v515[0] = 0xC0DE9A4000000000;
        v516 = 0;
        push(v6, (const PPScoreInterpreterValue *)v515);
        v9 = (double *)v515;
        goto LABEL_571;
      }
      v274 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v275 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v274) >> 3);
      *(_QWORD *)&buf[8] = 0;
      *(_QWORD *)buf = 0;
      if (v275 <= v275 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v274 + 24 * (v275 - (_QWORD)a2)), buf);
      drop(v6, (unint64_t)a2);
      v513[0] = (double)(unint64_t)((uint64_t)(*(_QWORD *)(*(_QWORD *)buf + 8) - **(_QWORD **)buf) >> 2);
      v514 = 0;
      push(v6, (const PPScoreInterpreterValue *)v513);
      v276 = (PPScoreInterpreterValue *)v513;
      goto LABEL_420;
    case 29:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v511[0] = 0xC0DE9A4000000000;
        v512 = 0;
        push(v6, (const PPScoreInterpreterValue *)v511);
        v9 = (double *)v511;
        goto LABEL_571;
      }
      v289 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v290 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v289) >> 3);
      *(_QWORD *)&buf[8] = 0;
      *(_QWORD *)buf = 0;
      if (v290 <= v290 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)(v289 + 24 * (v290 - (_QWORD)a2)), buf);
      drop(v6, (unint64_t)a2);
      v291 = **(float ***)buf;
      v292 = *(float **)(*(_QWORD *)buf + 8);
      if (**(float ***)buf == v292)
      {
        v509[0] = 0;
        v510 = 0;
        v300 = (PPScoreInterpreterValue *)v509;
        push(v6, (const PPScoreInterpreterValue *)v509);
      }
      else
      {
        v293 = v292 - v291;
        v294 = 0.0;
        v295 = **(float ***)buf;
        do
        {
          v296 = *v295++;
          v294 = v294 + v296;
        }
        while (v295 != v292);
        v297 = v294 / (double)(unint64_t)v293;
        v298 = 0.0;
        do
        {
          v299 = *v291++;
          v298 = v298 + (v299 - v297) * (v299 - v297);
        }
        while (v291 != v292);
        v507[0] = sqrt(v298 / (double)(unint64_t)v293);
        v508 = 0;
        v300 = (PPScoreInterpreterValue *)v507;
        push(v6, (const PPScoreInterpreterValue *)v507);
      }
      v276 = v300;
LABEL_420:
      PPScoreInterpreterValue::~PPScoreInterpreterValue(v276);
      v306 = buf;
      goto LABEL_541;
    case 30:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v505[0] = 0xC0DE9A4000000000;
        v506 = 0;
        push(v6, (const PPScoreInterpreterValue *)v505);
        v9 = (double *)v505;
        goto LABEL_571;
      }
      v203 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v204 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v203) >> 3);
      v205 = v204 - (_QWORD)a2;
      if (v204 <= v204 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v203 + 24 * v205));
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      memset(buf, 0, 24);
      v207 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v207) >> 3) <= v205 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v207 + 24 * (v205 + 1)));
      drop(v6, (unint64_t)a2);
      if (!v206)
        goto LABEL_459;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v208 = v206;
      }
      else
      {
        pp_score_interpreter_log_handle();
        v318 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v318, OS_LOG_TYPE_ERROR))
        {
          v377 = (objc_class *)objc_opt_class();
          NSStringFromClass(v377);
          v378 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v647) = 138412290;
          *(_QWORD *)((char *)&v647 + 4) = v378;
          _os_log_error_impl(&dword_1C392E000, v318, OS_LOG_TYPE_ERROR, "PPOperatorUpdateItemCounts was passed an existingCountsObj of the wrong type: %@", (uint8_t *)&v647, 0xCu);

        }
LABEL_459:
        v208 = objc_opt_new();
      }
      v319 = v208;
      if (buf[16] == 2)
      {
        PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
        v341 = objc_claimAutoreleasedReturnValue();
        if (v341)
          -[NSObject addObject:](v319, "addObject:", v341);
LABEL_517:

        goto LABEL_518;
      }
      if (buf[16] != 1)
      {
        if (!buf[16])
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf));
          v320 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v319, "addObject:", v320);

          goto LABEL_518;
        }
        pp_score_interpreter_log_handle();
        v341 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v341, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v647) = 67109120;
          DWORD1(v647) = buf[16];
          _os_log_error_impl(&dword_1C392E000, v341, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in argument to PPOperatorUpdateItemCounts", (uint8_t *)&v647, 8u);
        }
        goto LABEL_517;
      }
      v647 = 0uLL;
      PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v647);
      v338 = *(_DWORD **)v647;
      v339 = *(_DWORD **)(v647 + 8);
      if (*(_DWORD **)v647 != v339)
      {
        do
        {
          LODWORD(v337) = *v338;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v337);
          v340 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v319, "addObject:", v340);

          ++v338;
        }
        while (v338 != v339);
      }
      std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100]((uint64_t)&v647);
LABEL_518:
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v504, v319);
      push(v6, (const PPScoreInterpreterValue *)v504);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v504);

      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
      goto LABEL_572;
    case 31:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v502[0] = 0xC0DE9A4000000000;
        v503 = 0;
        push(v6, (const PPScoreInterpreterValue *)v502);
        v9 = (double *)v502;
        goto LABEL_571;
      }
      v283 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v284 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v283) >> 3);
      v285 = v284 - (_QWORD)a2;
      if (v284 <= v284 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v283 + 24 * v285));
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      memset(buf, 0, 24);
      v287 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v287) >> 3) <= v285 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v287 + 24 * (v285 + 1)));
      drop(v6, (unint64_t)a2);
      if (!v286)
        goto LABEL_467;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v288 = v286;
      }
      else
      {
        pp_score_interpreter_log_handle();
        v321 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v321, OS_LOG_TYPE_ERROR))
        {
          v379 = (objc_class *)objc_opt_class();
          NSStringFromClass(v379);
          v380 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v647) = 138412290;
          *(_QWORD *)((char *)&v647 + 4) = v380;
          _os_log_error_impl(&dword_1C392E000, v321, OS_LOG_TYPE_ERROR, "PPOperatorUpdateCompactNumericItemCounts was passed an existingCountsObj of the wrong type: %@", (uint8_t *)&v647, 0xCu);

        }
LABEL_467:
        v288 = objc_opt_new();
      }
      v322 = v288;
      if (buf[16] == 1)
      {
        v647 = 0uLL;
        PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v647);
        v323 = *(float **)v647;
        v324 = *(float **)(v647 + 8);
        while (v323 != v324)
          -[NSObject addValue:](v322, "addValue:", (unsigned __int16)(int)*v323++);
        std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100]((uint64_t)&v647);
      }
      else if (buf[16])
      {
        pp_score_interpreter_log_handle();
        v325 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v325, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v647) = 67109120;
          DWORD1(v647) = buf[16];
          _os_log_error_impl(&dword_1C392E000, v325, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in argument to PPOperatorUpdateCompactNumericItemCounts", (uint8_t *)&v647, 8u);
        }

      }
      else
      {
        -[NSObject addValue:](v288, "addValue:", (unsigned __int16)(int)PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf));
      }
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v501, v322);
      push(v6, (const PPScoreInterpreterValue *)v501);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v501);

      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
      goto LABEL_572;
    case 32:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v499[0] = 0xC0DE9A4000000000;
        v500 = 0;
        push(v6, (const PPScoreInterpreterValue *)v499);
        v9 = (double *)v499;
        goto LABEL_571;
      }
      v259 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v260 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v259) >> 3);
      v261 = v260 - (_QWORD)a2;
      if (v260 <= v260 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v259 + 24 * v261));
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      memset(buf, 0, 24);
      v263 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v263) >> 3) <= v261 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v263 + 24 * (v261 + 1)));
      drop(v6, (unint64_t)a2);
      if (buf[16])
      {
        if (buf[16] != 2)
        {
          pp_score_interpreter_log_handle();
          v317 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v317, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v647) = 67109120;
            DWORD1(v647) = buf[16];
            _os_log_error_impl(&dword_1C392E000, v317, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in 2nd argument to PPOperatorCountsForItem", (uint8_t *)&v647, 8u);
          }

          v497[0] = 0xC0DE9A4000000000;
          v498 = 0;
          push(v6, (const PPScoreInterpreterValue *)v497);
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v497);
          goto LABEL_622;
        }
        PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
        v264 = -31337.0;
        v265 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v265 = 0;
        v264 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
      }
      if (!v262)
      {
        v495[0] = 0;
        v496 = 0;
        push(v6, (const PPScoreInterpreterValue *)v495);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v495);

        goto LABEL_622;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v315 = v262;
        if (v264 != -31337.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v264);
          v367 = (void *)objc_claimAutoreleasedReturnValue();
          v316 = objc_msgSend(v315, "countForObject:", v367);

          goto LABEL_609;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v316 = objc_msgSend(v315, "countForObject:", v265);
LABEL_609:

          v487[0] = (double)v316;
          v488 = 0;
          push(v6, (const PPScoreInterpreterValue *)v487);
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v487);

          goto LABEL_622;
        }
        pp_score_interpreter_log_handle();
        v368 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v368, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v647) = 138412290;
          *(_QWORD *)((char *)&v647 + 4) = v265;
          _os_log_error_impl(&dword_1C392E000, v368, OS_LOG_TYPE_ERROR, "Invalid key passed to PPOperatorCountsForItem using NSCountedSet: %@", (uint8_t *)&v647, 0xCu);
        }

        v493[0] = 0xC0DE9A4000000000;
        v494 = 0;
        push(v6, (const PPScoreInterpreterValue *)v493);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v493);

LABEL_622:
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

        goto LABEL_572;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        pp_score_interpreter_log_handle();
        v366 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v366, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v647) = 138412290;
          *(_QWORD *)((char *)&v647 + 4) = v262;
          _os_log_error_impl(&dword_1C392E000, v366, OS_LOG_TYPE_ERROR, "Invalid counted set object passed to PPOperatorCountsForItem: %@", (uint8_t *)&v647, 0xCu);
        }

        v489[0] = 0xC0DE9A4000000000;
        v490 = 0;
        push(v6, (const PPScoreInterpreterValue *)v489);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v489);

        goto LABEL_622;
      }
      v351 = v262;
      if (v264 == -31337.0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          pp_score_interpreter_log_handle();
          v373 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v373, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v647) = 138412290;
            *(_QWORD *)((char *)&v647 + 4) = v265;
            _os_log_error_impl(&dword_1C392E000, v373, OS_LOG_TYPE_ERROR, "Invalid key passed to PPOperatorCountsForItem using PPU16CountedSet: %@", (uint8_t *)&v647, 0xCu);
          }

          v491[0] = 0xC0DE9A4000000000;
          v492 = 0;
          push(v6, (const PPScoreInterpreterValue *)v491);
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v491);

          goto LABEL_622;
        }
        objc_msgSend(v265, "doubleValue");
        v264 = v352;
      }
      v316 = objc_msgSend(v351, "countForValue:", (unsigned __int16)(int)v264);
      goto LABEL_609;
    case 33:
      goto LABEL_64;
    case 34:
      v8 = 0;
LABEL_64:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v485[0] = 0xC0DE9A4000000000;
        v486 = 0;
        push(v6, (const PPScoreInterpreterValue *)v485);
        v9 = (double *)v485;
        goto LABEL_571;
      }
      v22 = v6->_stack.__ptr_.__value_;
      v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22[1] - *v22) >> 3) - (_QWORD)a2;
      v648 = 0;
      v647 = 0uLL;
      v25 = v22;
      v24 = *v22;
      if (0xAAAAAAAAAAAAAAABLL * ((v25[1] - v24) >> 3) <= v23)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)&v647, (const PPScoreInterpreterValue *)(v24 + 24 * v23));
      drop(v6, (unint64_t)a2);
      v646 = 0uLL;
      if (!(_BYTE)v648)
      {
        v483[0] = 0x3FF0000000000000;
        v484 = 0;
        push(v6, (const PPScoreInterpreterValue *)v483);
        v303 = (PPScoreInterpreterValue *)v483;
        goto LABEL_563;
      }
      if (v648 == 1)
      {
        PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)&v647, buf);
        std::shared_ptr<std::vector<float>>::operator=[abi:ne180100]((uint64_t)&v646, (__int128 *)buf);
        std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100]((uint64_t)buf);
        if ((v8 & 1) != 0)
        {
LABEL_399:
          if ((_QWORD)v646)
          {
            *(_QWORD *)&v644[0] = 0;
            memset(buf, 0, sizeof(buf));
            std::unordered_set<float>::unordered_set<std::__wrap_iter<float *>>((uint64_t *)buf, *(float **)v646, *(float **)(v646 + 8));
            v467[0] = (double)*(unint64_t *)&buf[24];
            v468 = 0;
            push(v6, (const PPScoreInterpreterValue *)v467);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v467);
            std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table((uint64_t)buf);
LABEL_564:
            v27 = 0;
            goto LABEL_565;
          }
          v469[0] = 0;
          v470 = 0;
          push(v6, (const PPScoreInterpreterValue *)v469);
          v303 = (PPScoreInterpreterValue *)v469;
LABEL_563:
          PPScoreInterpreterValue::~PPScoreInterpreterValue(v303);
          goto LABEL_564;
        }
      }
      else
      {
        if (v648 != 2)
        {
          pp_score_interpreter_log_handle();
          v304 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v304, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v648;
            _os_log_error_impl(&dword_1C392E000, v304, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in 2nd argument to PPOperator<Distinct/Total>ItemCount", buf, 8u);
          }

          v481[0] = 0xC0DE9A4000000000;
          v482 = 0;
          push(v6, (const PPScoreInterpreterValue *)v481);
          v303 = (PPScoreInterpreterValue *)v481;
          goto LABEL_563;
        }
        PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)&v647);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (id)v26;
        if ((v8 & 1) != 0)
        {
          if (v26)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = v27;
              v479[0] = (double)(unint64_t)objc_msgSend(v27, "count");
              v480 = 0;
              push(v6, (const PPScoreInterpreterValue *)v479);
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v479);

              goto LABEL_565;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = v27;
              v477[0] = (double)(unint64_t)objc_msgSend(v27, "uniqueValueCount");
              v478 = 0;
              push(v6, (const PPScoreInterpreterValue *)v477);
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v477);

              goto LABEL_565;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = v27;
              v372 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v27);
              v475[0] = (double)(unint64_t)objc_msgSend(v372, "count");
              v476 = 0;
              push(v6, (const PPScoreInterpreterValue *)v475);
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v475);

              goto LABEL_565;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v27 = v27;
              v374 = (void *)objc_opt_new();
              for (i = 0; i < objc_msgSend(v27, "length"); ++i)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v27, "characterAtIndex:", i));
                v376 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v374, "addObject:", v376);

              }
              v473[0] = (double)(unint64_t)objc_msgSend(v374, "count");
              v474 = 0;
              push(v6, (const PPScoreInterpreterValue *)v473);
              PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v473);

              goto LABEL_565;
            }
            pp_score_interpreter_log_handle();
            v383 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v383, OS_LOG_TYPE_ERROR))
            {
              v386 = (objc_class *)objc_opt_class();
              NSStringFromClass(v386);
              v387 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v387;
              _os_log_error_impl(&dword_1C392E000, v383, OS_LOG_TYPE_ERROR, "Unhandled object type of %@ encountered in PPOperator<Distinct/Total>ItemCount", buf, 0xCu);

            }
            v471[0] = 0xC0DE9A4000000000;
            v472 = 0;
            push(v6, (const PPScoreInterpreterValue *)v471);
            v384 = (PPScoreInterpreterValue *)v471;
            goto LABEL_644;
          }
          goto LABEL_399;
        }
        if (v26)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v27;
            objc_msgSend(v27, "objectEnumerator");
            v465 = 0u;
            v466 = 0u;
            v463 = 0u;
            v464 = 0u;
            v330 = (id)objc_claimAutoreleasedReturnValue();
            v331 = objc_msgSend(v330, "countByEnumeratingWithState:objects:count:", &v463, v645, 16);
            if (v331)
            {
              v332 = 0;
              v333 = *(_QWORD *)v464;
              do
              {
                for (j = 0; j != v331; ++j)
                {
                  if (*(_QWORD *)v464 != v333)
                    objc_enumerationMutation(v330);
                  v332 += objc_msgSend(v27, "countForObject:", *(_QWORD *)(*((_QWORD *)&v463 + 1) + 8 * j));
                }
                v331 = objc_msgSend(v330, "countByEnumeratingWithState:objects:count:", &v463, v645, 16);
              }
              while (v331);
              v335 = (double)v332;
            }
            else
            {
              v335 = 0.0;
            }

            *(double *)v461 = v335;
            v462 = 0;
            push(v6, (const PPScoreInterpreterValue *)v461);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v461);

            goto LABEL_565;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v27;
            v459[0] = (double)(unint64_t)objc_msgSend(v27, "count");
            v460 = 0;
            push(v6, (const PPScoreInterpreterValue *)v459);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v459);

            goto LABEL_565;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v27;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_OWORD *)&buf[16] = 0x2020000000uLL;
            v458[0] = MEMORY[0x1E0C809B0];
            v458[1] = 3221225472;
            v458[2] = __49__PPScoreInterpreter__runOperator_arity_context___block_invoke;
            v458[3] = &unk_1E7E15AC8;
            v458[4] = buf;
            objc_msgSend(v27, "enumerateValuesAndCountsUsingBlock:", v458);
            v456[0] = (double)*(unint64_t *)(*(_QWORD *)&buf[8] + 24);
            v457 = 0;
            push(v6, (const PPScoreInterpreterValue *)v456);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v456);
            _Block_object_dispose(buf, 8);

            goto LABEL_565;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v27;
            v454[0] = (double)(unint64_t)objc_msgSend(v27, "count");
            v455 = 0;
            push(v6, (const PPScoreInterpreterValue *)v454);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v454);

            goto LABEL_565;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v27;
            v452[0] = (double)(unint64_t)objc_msgSend(v27, "length");
            v453 = 0;
            push(v6, (const PPScoreInterpreterValue *)v452);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v452);

            goto LABEL_565;
          }
          pp_score_interpreter_log_handle();
          v385 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v385, OS_LOG_TYPE_ERROR))
          {
            v414 = (objc_class *)objc_opt_class();
            NSStringFromClass(v414);
            v415 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v415;
            _os_log_error_impl(&dword_1C392E000, v385, OS_LOG_TYPE_ERROR, "Unhandled object type of %@ encountered in PPOperator<Distinct/Total>ItemCount", buf, 0xCu);

          }
          v450[0] = 0xC0DE9A4000000000;
          v451 = 0;
          push(v6, (const PPScoreInterpreterValue *)v450);
          v384 = (PPScoreInterpreterValue *)v450;
LABEL_644:
          PPScoreInterpreterValue::~PPScoreInterpreterValue(v384);
LABEL_565:
          v353 = (std::__shared_weak_count *)*((_QWORD *)&v646 + 1);
          if (*((_QWORD *)&v646 + 1))
          {
            v354 = (unint64_t *)(*((_QWORD *)&v646 + 1) + 8);
            do
              v355 = __ldaxr(v354);
            while (__stlxr(v355 - 1, v354));
            if (!v355)
            {
              ((void (*)(std::__shared_weak_count *))v353->__on_zero_shared)(v353);
              std::__shared_weak_count::__release_weak(v353);
            }
          }

          v9 = (double *)&v647;
          goto LABEL_571;
        }
      }
      if ((_QWORD)v646)
      {
        v446[0] = (double)(unint64_t)((uint64_t)(*(_QWORD *)(v646 + 8) - *(_QWORD *)v646) >> 2);
        v447 = 0;
        push(v6, (const PPScoreInterpreterValue *)v446);
        v303 = (PPScoreInterpreterValue *)v446;
      }
      else
      {
        v448[0] = 0;
        v449 = 0;
        push(v6, (const PPScoreInterpreterValue *)v448);
        v303 = (PPScoreInterpreterValue *)v448;
      }
      goto LABEL_563;
    case 35:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v434[0] = 0xC0DE9A4000000000;
        v435 = 0;
        push(v6, (const PPScoreInterpreterValue *)v434);
        v9 = (double *)v434;
        goto LABEL_571;
      }
      v209 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v210 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v209) >> 3);
      v211 = v210 - (_QWORD)a2;
      if (v210 <= v210 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v209 + 24 * v211));
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      v213 = v211 + 1;
      memset(buf, 0, 24);
      v214 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v214) >> 3) <= v211 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      v215 = v211 + 2;
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v214 + 24 * v213));
      v648 = 0;
      v647 = 0uLL;
      v216 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v216) >> 3) <= v215)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)&v647, (const PPScoreInterpreterValue *)(v216 + 24 * v215));
      drop(v6, (unint64_t)a2);
      if (!v212)
        goto LABEL_482;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v217 = v212;
      }
      else
      {
        pp_score_interpreter_log_handle();
        v326 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v326, OS_LOG_TYPE_ERROR))
        {
          v381 = (objc_class *)objc_opt_class();
          NSStringFromClass(v381);
          v382 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v646) = 138412290;
          *(_QWORD *)((char *)&v646 + 4) = v382;
          _os_log_error_impl(&dword_1C392E000, v326, OS_LOG_TYPE_ERROR, "PPOperatorAddToDictionary was passed an existingDictObj of the wrong type: %@", (uint8_t *)&v646, 0xCu);

        }
LABEL_482:
        v217 = (id)objc_opt_new();
      }
      v327 = v217;
      if (v648 == 2)
      {
        PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)&v647);
        v328 = objc_claimAutoreleasedReturnValue();
      }
      else if (v648 == 1)
      {
        PPScoreInterpreterValue::getNumericArray((PPScoreInterpreterValue *)&v647);
        v328 = objc_claimAutoreleasedReturnValue();
      }
      else if ((_BYTE)v648)
      {
        pp_score_interpreter_log_handle();
        v342 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v342, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v646) = 67109120;
          DWORD1(v646) = v648;
          _os_log_error_impl(&dword_1C392E000, v342, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in PPOperatorAddToDictionary", (uint8_t *)&v646, 8u);
        }

        pp_score_interpreter_log_handle();
        v343 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v343, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v646) = 0;
          _os_log_error_impl(&dword_1C392E000, v343, OS_LOG_TYPE_ERROR, "Attempted to store nil object value in PPOperatorAddToDictionary", (uint8_t *)&v646, 2u);
        }

        v328 = objc_opt_new();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)&v647));
        v328 = objc_claimAutoreleasedReturnValue();
      }
      v344 = (void *)v328;
      if (buf[16] != 2)
      {
        if (!buf[16])
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf));
          v345 = objc_claimAutoreleasedReturnValue();
          goto LABEL_534;
        }
        pp_score_interpreter_log_handle();
        v347 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
          goto LABEL_533;
        LODWORD(v646) = 67109120;
        DWORD1(v646) = buf[16];
        v369 = "Attempted to store invalid key of type %d in PPOperatorAddToDictionary";
        v370 = v347;
        v371 = 8;
LABEL_628:
        _os_log_error_impl(&dword_1C392E000, v370, OS_LOG_TYPE_ERROR, v369, (uint8_t *)&v646, v371);
        goto LABEL_533;
      }
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
      v346 = (void *)objc_claimAutoreleasedReturnValue();
      if (v346)
        goto LABEL_535;
      if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EF8E8438) & 1) != 0)
      {
        v346 = 0;
        goto LABEL_535;
      }
      pp_score_interpreter_log_handle();
      v347 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v646) = 0;
        v369 = "Attempted to store nil object key in PPOperatorAddToDictionary";
        v370 = v347;
        v371 = 2;
        goto LABEL_628;
      }
LABEL_533:

      v345 = objc_opt_new();
LABEL_534:
      v346 = (void *)v345;
LABEL_535:
      objc_msgSend(v327, "setObject:forKeyedSubscript:", v344, v346);
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)v433, (const PPScoreInterpreterValue *)&v647);
      push(v6, (const PPScoreInterpreterValue *)v433);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v433);

      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)&v647);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

LABEL_572:
      return;
    case 36:
      goto LABEL_22;
    case 37:
      v7 = 1;
      goto LABEL_22;
    case 38:
      v7 = 2;
LABEL_22:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v444[0] = 0xC0DE9A4000000000;
        v445 = 0;
        push(v6, (const PPScoreInterpreterValue *)v444);
        v9 = (double *)v444;
        goto LABEL_571;
      }
      v10 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v11 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v10) >> 3);
      v12 = v11 - (_QWORD)a2;
      if (v11 <= v11 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v10 + 24 * v12));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      memset(buf, 0, 24);
      v14 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v14) >> 3) <= v12 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v14 + 24 * (v12 + 1)));
      drop(v6, (unint64_t)a2);
      if (buf[16])
      {
        if (buf[16] != 2)
        {
          pp_score_interpreter_log_handle();
          v301 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v301, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v647) = 67109120;
            DWORD1(v647) = buf[16];
            _os_log_error_impl(&dword_1C392E000, v301, OS_LOG_TYPE_ERROR, "Attempted to store invalid value of type %d in 2nd argument to PPOperator<Type>ForKey", (uint8_t *)&v647, 8u);
          }
          v16 = 0;
          goto LABEL_490;
        }
        PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)buf);
        v15 = -31337.0;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf);
        v16 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v301 = v13;
        if (v15 != -31337.0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v301, "objectForKeyedSubscript:", v307);
          v302 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_425;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[NSObject objectForKeyedSubscript:](v301, "objectForKeyedSubscript:", v16);
          v302 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_425:

          if (v7 != 1)
          {
            if (!v7)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v302, "doubleValue");
                v442[0] = v308;
                v443 = 0;
                push(v6, (const PPScoreInterpreterValue *)v442);
                PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v442);

                goto LABEL_580;
              }
              pp_score_interpreter_log_handle();
              v356 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v356, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v647) = 138412290;
                *(_QWORD *)((char *)&v647 + 4) = v301;
                _os_log_error_impl(&dword_1C392E000, v356, OS_LOG_TYPE_ERROR, "Invalid dictionary object (expected NSNumber) passed to PPOperator<Type>ForKey: %@", (uint8_t *)&v647, 0xCu);
              }

              goto LABEL_492;
            }
            pp_score_interpreter_log_handle();
            v348 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v348, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v647) = 67109120;
              DWORD1(v647) = v7;
              _os_log_error_impl(&dword_1C392E000, v348, OS_LOG_TYPE_ERROR, "Invalid type of %d requested from PPOperator<Type>ForKey", (uint8_t *)&v647, 8u);
            }

            goto LABEL_547;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            PPScoreInterpreterValue::PPScoreInterpreterValue((uint64_t)v441, v302);
            push(v6, (const PPScoreInterpreterValue *)v441);
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v441);

LABEL_580:
            PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);

            goto LABEL_572;
          }
          pp_score_interpreter_log_handle();
          v357 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v357, OS_LOG_TYPE_ERROR))
          {
            LODWORD(v647) = 138412290;
            *(_QWORD *)((char *)&v647 + 4) = v301;
            _os_log_error_impl(&dword_1C392E000, v357, OS_LOG_TYPE_ERROR, "Invalid dictionary object (expected NSArray) passed to PPOperator<Type>ForKey: %@", (uint8_t *)&v647, 0xCu);
          }

          goto LABEL_579;
        }
        pp_score_interpreter_log_handle();
        v329 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v329, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v647) = 138412290;
          *(_QWORD *)((char *)&v647 + 4) = v16;
          _os_log_error_impl(&dword_1C392E000, v329, OS_LOG_TYPE_ERROR, "Invalid key passed to PPOperator<Type>ForKey: %@", (uint8_t *)&v647, 0xCu);
        }

      }
      else
      {
        pp_score_interpreter_log_handle();
        v301 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v301, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v647) = 138412290;
          *(_QWORD *)((char *)&v647 + 4) = v13;
          _os_log_error_impl(&dword_1C392E000, v301, OS_LOG_TYPE_ERROR, "Invalid dictionary object passed to PPOperator<Type>ForKey: %@", (uint8_t *)&v647, 0xCu);
        }
      }
LABEL_490:

      v302 = 0;
      if (v7 == 2)
      {
LABEL_547:
        v437 = 2;
        v436[0] = 0;
        push(v6, (const PPScoreInterpreterValue *)v436);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v436);

        goto LABEL_580;
      }
      if (v7 != 1)
      {
LABEL_492:
        v439[0] = 0xC0DE9A4000000000;
        v440 = 0;
        push(v6, (const PPScoreInterpreterValue *)v439);
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v439);

        goto LABEL_580;
      }
LABEL_579:
      PPScoreInterpreterValue::PPScoreInterpreterValue((uint64_t)v438, MEMORY[0x1E0C9AA60]);
      push(v6, (const PPScoreInterpreterValue *)v438);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v438);

      goto LABEL_580;
    case 39:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)3))
      {
        drop(v6, (unint64_t)a2);
        v431[0] = 0xC0DE9A4000000000;
        v432 = 0;
        push(v6, (const PPScoreInterpreterValue *)v431);
        v9 = (double *)v431;
      }
      else
      {
        v44 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        v45 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v44) >> 3);
        v46 = v45 - (_QWORD)a2;
        if (v45 <= v45 - (unint64_t)a2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v47 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v44 + 24 * v46));
        v48 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v48) >> 3) <= v46 + 1)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v49 = v47;
        v50 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v48 + 24 * (v46 + 1)));
        v51 = *(_QWORD *)v6->_stack.__ptr_.__value_;
        if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v51) >> 3) <= v46 + 2)
          std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
        v52 = v50;
        v53 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v51 + 24 * (v46 + 2)));
        drop(v6, (unint64_t)a2);
        v429[0] = v49 * exp(-fabs(v52 * v53));
        v430 = 0;
        push(v6, (const PPScoreInterpreterValue *)v429);
        v9 = v429;
      }
      goto LABEL_571;
    case 40:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v427[0] = 0xC0DE9A4000000000;
        v428 = 0;
        push(v6, (const PPScoreInterpreterValue *)v427);
        v9 = (double *)v427;
        goto LABEL_571;
      }
      v54 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v55 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v54) >> 3);
      if (v55 <= v55 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v54 + 24 * (v55 - (_QWORD)a2)));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      drop(v6, (unint64_t)a2);
      v57 = v56;
      objc_msgSend(v57, "timeIntervalSince1970");
      v425[0] = v58;
      v426 = 0;
      push(v6, (const PPScoreInterpreterValue *)v425);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v425);

      goto LABEL_572;
    case 41:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)1))
      {
        drop(v6, (unint64_t)a2);
        v423[0] = 0xC0DE9A4000000000;
        v424 = 0;
        push(v6, (const PPScoreInterpreterValue *)v423);
        v9 = (double *)v423;
        goto LABEL_571;
      }
      v79 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v80 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v79) >> 3);
      if (v80 <= v80 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v79 + 24 * (v80 - (_QWORD)a2)));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      drop(v6, (unint64_t)a2);
      v82 = v81;
      memset(v644, 0, 24);
      memset(buf, 0, sizeof(buf));
      v83 = -1.0;
      if (v82 && (objc_msgSend(MEMORY[0x1E0D70D00], "localizedTimeStructForDate:tm:", v82, buf) & 1) != 0)
        v83 = (double)(*(_DWORD *)&buf[24] + 1);
      *(double *)v421 = v83;
      v422 = 0;
      push(v6, (const PPScoreInterpreterValue *)v421);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v421);

      goto LABEL_572;
    case 42:
      if (shouldReturnUndefined(v5, (std::__shared_weak_count *)2))
      {
        drop(v6, (unint64_t)a2);
        v419[0] = 0xC0DE9A4000000000;
        v420 = 0;
        push(v6, (const PPScoreInterpreterValue *)v419);
        v9 = (double *)v419;
        goto LABEL_571;
      }
      v28 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      v29 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v28) >> 3);
      v30 = v29 - (_QWORD)a2;
      if (v29 <= v29 - (unint64_t)a2)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      PPScoreInterpreterValue::getObject((PPScoreInterpreterValue *)(v28 + 24 * v30));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)v6->_stack.__ptr_.__value_;
      if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v6->_stack.__ptr_.__value_ + 1) - v32) >> 3) <= v30 + 1)
        std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
      v33 = PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)(v32 + 24 * (v30 + 1)));
      drop(v6, (unint64_t)a2);
      v34 = v31;
      memset(v644, 0, 24);
      memset(buf, 0, sizeof(buf));
      v35 = -1.0;
      if (v34 && (objc_msgSend(MEMORY[0x1E0D70D00], "localizedTimeStructForDate:tm:", v34, buf) & 1) != 0)
        v35 = (double)((3600 * *(_DWORD *)&buf[8] + 60 * *(_DWORD *)&buf[4] + *(_DWORD *)buf) / (86400 / (int)v33));
      *(double *)v417 = v35;
      v418 = 0;
      push(v6, (const PPScoreInterpreterValue *)v417);
      PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)v417);

      goto LABEL_572;
    default:
      pp_score_interpreter_log_handle();
      v416 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v416, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = a1;
        _os_log_error_impl(&dword_1C392E000, v416, OS_LOG_TYPE_ERROR, "Undefined operator of value %tu", buf, 0xCu);
      }

      __break(1u);
      goto LABEL_657;
  }
}

uint64_t __49__PPScoreInterpreter__runOperator_arity_context___block_invoke(uint64_t result, uint64_t a2, unsigned int a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

void __47__PPScoreInterpreter_cleanupReusableComponents__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;

}

void __125__PPScoreInterpreter_evaluateWithPreviousStageSubscores_scoreInputInitializationBlock_scoreInputAssignmentBlock_outputBlock___block_invoke(uint64_t a1, void *a2)
{
  void **v3;
  id *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)v3[1];
  if (v4)
  {
    v5 = v4[4];
    v6 = v4[3];
    v4[3] = v5;
  }
  else
  {
    v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PPScoreInterpreterCtx initWithScoreInputs:previousSubscores:scalarSubscoreCount:arraySubscoreCount:objectSubscoreCount:]((id *)[PPScoreInterpreterCtx alloc], v13, *(void **)(a1 + 40), v8, v10, v12);
    v15 = v3[1];
    v3[1] = v14;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  -[PPScoreInterpreter evaluateScoresWithContext:](*(_QWORD *)(a1 + 32), v3[1]);
  if (*(_QWORD *)(*((_QWORD *)v3[1] + 1) + 8) != **((_QWORD **)v3[1] + 1))
  {
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v18 = 0xAAAAAAAAAAAAAAABLL
          * ((uint64_t)(*(_QWORD *)(*((_QWORD *)v3[1] + 1) + 8) - **((_QWORD **)v3[1] + 1)) >> 3);
      v19 = 134217984;
      v20 = v18;
      _os_log_fault_impl(&dword_1C392E000, v16, OS_LOG_TYPE_FAULT, "%lu items left on score interpreter stack", (uint8_t *)&v19, 0xCu);
    }

  }
  v17 = *(_QWORD *)(a1 + 64);
  if (v17)
    (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, *((_QWORD *)v3[1] + 4));

}

+ (id)scoreInterpreterFromAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[PPScoreInterpreterBytecode bytecodeFromAsset:](PPScoreInterpreterBytecode, "bytecodeFromAsset:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithBytecode:", v6);

  return v7;
}

+ (id)scoreInterpreterFromFactorName:(id)a3 namespaceName:(id)a4
{
  void *v5;
  void *v6;

  +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBytecode:", v5);
  else
    v6 = 0;

  return v6;
}

@end
