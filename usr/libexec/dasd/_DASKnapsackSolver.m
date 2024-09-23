@implementation _DASKnapsackSolver

- (_DASKnapsackSolver)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DASKnapsackSolver;
  v2 = -[_DASKnapsackSolver init](&v6, "init");
  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("DASKnapsackSolver")));
  v4 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v3;

  v2[8] = 0;
  *((_DWORD *)v2 + 3) = 0;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  return (_DASKnapsackSolver *)v2;
}

- (id)solveKnapsackWithCapacity:(id)a3 forItemWeights:(id)a4 andItemValues:(id)a5
{
  id v8;
  id v9;
  id v10;
  _DASKnapsackSolver *v11;
  NSObject *logger;
  const char *v13;
  unsigned int v14;
  size_t v15;
  id v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  const char *v28;
  NSObject *v30;
  unsigned __int16 **v31;
  unsigned __int8 v32;
  unsigned __int16 **v33;
  unsigned __int16 *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unsigned __int16 *v38;
  unsigned int v39;
  BOOL *v40;
  unsigned __int8 n_rows;
  uint64_t v42;
  unsigned __int16 **J;
  unsigned int *weight_vect;
  unsigned int v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  unsigned __int8 v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  const char *v55;
  NSObject *v56;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if ((unint64_t)objc_msgSend(v10, "count") >= 0xFF)
  {
    logger = v11->_logger;
    if (!os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v13 = "Error: Exceeded the maximum number of solver inputs (UINT8_MAX - 1).";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    goto LABEL_27;
  }
  if ((unint64_t)objc_msgSend(v8, "unsignedLongValue") >> 32)
  {
    logger = v11->_logger;
    if (!os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v13 = "Error: Exceeded the maximum solver capacity UINT32_MAX.";
    goto LABEL_7;
  }
  v14 = objc_msgSend(v8, "unsignedIntValue");
  v15 = (size_t)objc_msgSend(v10, "count");
  v16 = objc_msgSend(v9, "count");
  v17 = v14 + 1;
  v11->_n_cols = v17;
  v11->_n_rows = v15 + 1;
  if (v16 != (id)v15 || (unint64_t)v16 < 2 || v17 < 3 || (v15 + 1) <= 2u)
  {
    v27 = v11->_logger;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v28 = "Error: Invalid solver input.";
    goto LABEL_26;
  }
  v11->_values_vect = (char *)malloc_type_malloc(v15, 0x100004077774924uLL);
  v18 = (unsigned int *)malloc_type_malloc(4 * v15, 0x100004052888210uLL);
  v11->_weight_vect = v18;
  if (!v18 || !v11->_values_vect)
  {
    v27 = v11->_logger;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v28 = "Error: Failed to allocate memory for I/O vectorization.";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
    goto LABEL_27;
  }
  v19 = 0;
  do
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndex:", v19));
    if ((unint64_t)objc_msgSend(v20, "longValue") >= 0x100)
    {
      v30 = v11->_logger;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Error: Item values must be positive and less than UINT8_MAX.", buf, 2u);
      }
      -[_DASKnapsackSolver reset](v11, "reset");
      v26 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_10016E528, 0);

      goto LABEL_28;
    }
    v11->_values_vect[v19] = objc_msgSend(v20, "unsignedCharValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v19));
    v11->_weight_vect[v19] = objc_msgSend(v21, "unsignedIntValue");

    ++v19;
  }
  while (v15 != v19);
  v22 = 0;
  v23 = 0;
  v24 = -1;
  do
  {
    v25 = v11->_weight_vect[v22];
    v23 += v25;
    if (v25 < v24)
      v24 = v11->_weight_vect[v22];
    ++v22;
  }
  while (v15 != v22);
  if (v24 > v14)
  {
    v26 = objc_alloc_init((Class)NSSet);
LABEL_61:
    -[_DASKnapsackSolver reset](v11, "reset");
    goto LABEL_28;
  }
  if (v23 <= v14)
  {
    v47 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v15));
    v52 = 0;
    do
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v52));
      objc_msgSend(v47, "addObject:", v53);

      ++v52;
    }
    while (v15 != v52);
    v51 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v47);
LABEL_60:
    v26 = v51;

    goto LABEL_61;
  }
  v31 = (unsigned __int16 **)malloc_type_calloc(v11->_n_rows, 8uLL, 0x10040436913F5uLL);
  v11->_J = v31;
  if (!v31)
  {
    v54 = v11->_logger;
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v55 = "Error: Failed to allocate memory for solver core.";
    goto LABEL_68;
  }
  *v11->_J = (unsigned __int16 *)malloc_type_calloc(v11->_n_cols, 2uLL, 0x1000040BDFB0063uLL);
  if (!*v11->_J)
  {
    v54 = v11->_logger;
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v55 = "Error: Failed to allocate memory for solver core.";
    goto LABEL_68;
  }
  if (v11->_n_rows < 2u)
  {
LABEL_46:
    v40 = (BOOL *)malloc_type_calloc(v15, 1uLL, 0x100004077774924uLL);
    v11->_index_vect = v40;
    if (v40)
    {
      n_rows = v11->_n_rows;
      LOBYTE(v42) = n_rows - 1;
      if (n_rows != 1)
      {
        weight_vect = v11->_weight_vect;
        J = v11->_J;
        v45 = v11->_n_cols - 1;
        v42 = v42;
        do
        {
          v46 = (v42 - 1);
          if (J[v42][v45] > J[v46][v45])
          {
            v45 -= weight_vect[v46];
            v40[v46] = 1;
          }
          --v42;
        }
        while (v46);
      }
      v47 = objc_alloc_init((Class)NSMutableSet);
      v48 = 0;
      v49 = 0;
      do
      {
        if (v11->_index_vect[v48])
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v49));
          objc_msgSend(v47, "addObject:", v50);

        }
        v48 = ++v49;
      }
      while (v15 > v49);
      v51 = objc_msgSend(v47, "copy");
      goto LABEL_60;
    }
    v54 = v11->_logger;
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v55 = "Error: Failed to allocate memory for I/O vectorization.";
LABEL_68:
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, v55, buf, 2u);
    goto LABEL_27;
  }
  v32 = 1;
  while (1)
  {
    v11->_J[v32] = (unsigned __int16 *)malloc_type_malloc(2 * v11->_n_cols, 0x1000040BDFB0063uLL);
    v33 = v11->_J;
    v34 = v33[v32];
    if (!v34)
      break;
    v35 = 0;
    v36 = (v32 - 1);
    v37 = v11->_weight_vect[v36];
    v38 = v33[v36];
    do
    {
      v39 = v38[v35];
      if (v35 >= v37 && v38[(v35 - v37)] + v11->_values_vect[v36] > v39)
        LOWORD(v39) = v38[(v35 - v37)] + v11->_values_vect[v36];
      v34[v35++] = v39;
    }
    while (v17 != v35);
    if (v11->_n_rows <= ++v32)
      goto LABEL_46;
  }
  v56 = v11->_logger;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Error: Failed to allocate memory for solver core.", buf, 2u);
  }
LABEL_27:
  -[_DASKnapsackSolver reset](v11, "reset");
  v26 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_10016E528, 0);
LABEL_28:
  objc_sync_exit(v11);

  return v26;
}

- (void)reset
{
  unsigned __int16 **J;
  unint64_t v4;

  free(self->_index_vect);
  free(self->_weight_vect);
  free(self->_values_vect);
  J = self->_J;
  if (J)
  {
    if (self->_n_rows)
    {
      v4 = 0;
      do
        free(self->_J[v4++]);
      while (v4 < self->_n_rows);
      J = self->_J;
    }
    free(J);
  }
  self->_n_rows = 0;
  self->_n_cols = 0;
}

- (OS_os_log)logger
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)index_vect
{
  return self->_index_vect;
}

- (void)setIndex_vect:(BOOL *)a3
{
  self->_index_vect = a3;
}

- (char)values_vect
{
  return self->_values_vect;
}

- (void)setValues_vect:(char *)a3
{
  self->_values_vect = a3;
}

- (unsigned)weight_vect
{
  return self->_weight_vect;
}

- (void)setWeight_vect:(unsigned int *)a3
{
  self->_weight_vect = a3;
}

- (unsigned)n_rows
{
  return self->_n_rows;
}

- (void)setN_rows:(unsigned __int8)a3
{
  self->_n_rows = a3;
}

- (unsigned)n_cols
{
  return self->_n_cols;
}

- (void)setN_cols:(unsigned int)a3
{
  self->_n_cols = a3;
}

- (unsigned)J
{
  return self->_J;
}

- (void)setJ:(unsigned __int16 *)a3
{
  self->_J = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
