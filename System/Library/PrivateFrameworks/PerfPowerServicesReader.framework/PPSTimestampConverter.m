@implementation PPSTimestampConverter

- (PPSTimestampConverter)initWithSubsystem:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  PPSTimestampConverter *v8;
  uint64_t v9;
  NSURL *filepath;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSTimestampConverter;
  v8 = -[PPSTimestampConverter init](&v12, sel_init);
  if (v8)
  {
    +[PPSOnDeviceIngesterUtilities filepathForSubsystem:category:](PPSOnDeviceIngesterUtilities, "filepathForSubsystem:category:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    filepath = v8->_filepath;
    v8->_filepath = (NSURL *)v9;

  }
  return v8;
}

- (PPSTimestampConverter)initWithFilepath:(id)a3
{
  id v5;
  PPSTimestampConverter *v6;
  PPSTimestampConverter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSTimestampConverter;
  v6 = -[PPSTimestampConverter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_filepath, a3);

  return v7;
}

- (vector<std::pair<double,)systemOffsets
{
  PPSTimestampConverter *v4;
  void **p_begin;
  void *v6;
  void *v7;
  __int128 v9;
  void *v10;

  v4 = self;
  objc_sync_enter(v4);
  p_begin = &v4->_systemOffsets.__begin_;
  if (v4->_systemOffsets.__begin_ == v4->_systemOffsets.__end_)
  {
    -[PPSTimestampConverter _tableNameForSystemOffset](v4, "_tableNameForSystemOffset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSTimestampConverter _systemOffsetsForTableName:](v4, "_systemOffsetsForTableName:", v6);
    v7 = *p_begin;
    if (*p_begin)
    {
      v4->_systemOffsets.__end_ = v7;
      operator delete(v7);
      *p_begin = 0;
      v4->_systemOffsets.__end_ = 0;
      v4->_systemOffsets.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v4->_systemOffsets.__begin_ = v9;
    v4->_systemOffsets.__end_cap_.__value_ = v10;

  }
  objc_sync_exit(v4);

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::pair<double, double>, std::allocator<std::pair<double, double>>> *)std::vector<std::pair<double,double>>::__init_with_size[abi:ne180100]<std::pair<double,double>*,std::pair<double,double>*>((char *)retstr, (__int128 *)v4->_systemOffsets.__begin_, (__int128 *)v4->_systemOffsets.__end_, ((char *)v4->_systemOffsets.__end_- (char *)v4->_systemOffsets.__begin_) >> 4);
}

- (vector<std::pair<double,)timeZoneOffsets
{
  PPSTimestampConverter *v4;
  void **p_begin;
  void *v6;
  void *v7;
  __int128 v9;
  void *v10;

  v4 = self;
  objc_sync_enter(v4);
  p_begin = &v4->_timeZoneOffsets.__begin_;
  if (v4->_timeZoneOffsets.__begin_ == v4->_timeZoneOffsets.__end_)
  {
    -[PPSTimestampConverter _tableNameForTimeZoneOffset](v4, "_tableNameForTimeZoneOffset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSTimestampConverter _timeZoneOffsetsForTableName:](v4, "_timeZoneOffsetsForTableName:", v6);
    v7 = *p_begin;
    if (*p_begin)
    {
      v4->_timeZoneOffsets.__end_ = v7;
      operator delete(v7);
      *p_begin = 0;
      v4->_timeZoneOffsets.__end_ = 0;
      v4->_timeZoneOffsets.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v4->_timeZoneOffsets.__begin_ = v9;
    v4->_timeZoneOffsets.__end_cap_.__value_ = v10;

  }
  objc_sync_exit(v4);

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::pair<double, double>, std::allocator<std::pair<double, double>>> *)std::vector<std::pair<double,double>>::__init_with_size[abi:ne180100]<std::pair<double,double>*,std::pair<double,double>*>((char *)retstr, (__int128 *)v4->_timeZoneOffsets.__begin_, (__int128 *)v4->_timeZoneOffsets.__end_, ((char *)v4->_timeZoneOffsets.__end_- (char *)v4->_timeZoneOffsets.__begin_) >> 4);
}

- (double)epochTimeFromMonotonicTime:(double)a3
{
  double v4;

  -[PPSTimestampConverter systemOffsetFromMonotonicTime:](self, "systemOffsetFromMonotonicTime:");
  return v4 + a3;
}

- (double)localTimeFromMonotonicTime:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[PPSTimestampConverter epochTimeFromMonotonicTime:](self, "epochTimeFromMonotonicTime:");
  v6 = v5;
  -[PPSTimestampConverter timeZoneOffsetForMonotonicTime:](self, "timeZoneOffsetForMonotonicTime:", a3);
  return v6 + v7;
}

- (double)monotonicTimeFromEpochTime:(double)a3
{
  double v3;
  unint64_t v5;
  double *v6;
  unint64_t v7;
  double *v8;
  double *v9;
  double v10;
  double v11;
  uint64_t v12;
  double *v14;
  double *v15;

  v3 = 0.0;
  if (a3 > 0.0)
  {
    -[PPSTimestampConverter systemOffsets](self, "systemOffsets");
    if (v14 != v15)
    {
      v5 = ((char *)v15 - (char *)v14) >> 4;
      v6 = v14;
      do
      {
        v7 = v5 >> 1;
        v8 = &v6[2 * (v5 >> 1)];
        v10 = *v8;
        v11 = v8[1];
        v9 = v8 + 2;
        v5 += ~(v5 >> 1);
        if (v10 + v11 > a3)
          v5 = v7;
        else
          v6 = v9;
      }
      while (v5);
      if (v6 == v14)
        v12 = 0;
      else
        v12 = -1;
      v3 = a3 - v6[2 * v12 + 1];
    }
    if (v14)
      operator delete(v14);
  }
  return v3;
}

- (double)systemOffsetFromMonotonicTime:(double)a3
{
  unint64_t v4;
  double *v5;
  unint64_t v6;
  double *v7;
  double *v8;
  double v9;
  uint64_t v10;
  double v11;
  double *v13;
  double *v14;

  -[PPSTimestampConverter systemOffsets](self, "systemOffsets");
  if (v13 == v14)
  {
    v11 = 0.0;
    if (!v13)
      return v11;
    goto LABEL_11;
  }
  v4 = ((char *)v14 - (char *)v13) >> 4;
  v5 = v13;
  do
  {
    v6 = v4 >> 1;
    v7 = &v5[2 * (v4 >> 1)];
    v9 = *v7;
    v8 = v7 + 2;
    v4 += ~(v4 >> 1);
    if (v9 > a3)
      v4 = v6;
    else
      v5 = v8;
  }
  while (v4);
  if (v5 == v13)
    v10 = 0;
  else
    v10 = -1;
  v11 = v5[2 * v10 + 1];
  if (v13)
LABEL_11:
    operator delete(v13);
  return v11;
}

- (double)timeZoneOffsetForMonotonicTime:(double)a3
{
  unint64_t v4;
  double *v5;
  unint64_t v6;
  double *v7;
  double *v8;
  double v9;
  uint64_t v10;
  double v11;
  double *v13;
  double *v14;

  -[PPSTimestampConverter timeZoneOffsets](self, "timeZoneOffsets");
  if (v13 == v14)
  {
    v11 = 0.0;
    if (!v13)
      return v11;
    goto LABEL_11;
  }
  v4 = ((char *)v14 - (char *)v13) >> 4;
  v5 = v13;
  do
  {
    v6 = v4 >> 1;
    v7 = &v5[2 * (v4 >> 1)];
    v9 = *v7;
    v8 = v7 + 2;
    v4 += ~(v4 >> 1);
    if (v9 > a3)
      v4 = v6;
    else
      v5 = v8;
  }
  while (v4);
  if (v5 == v13)
    v10 = 0;
  else
    v10 = -1;
  v11 = v5[2 * v10 + 1];
  if (v13)
LABEL_11:
    operator delete(v13);
  return v11;
}

- (vector<std::pair<double,)_systemOffsetsForTableName:()std:(double>>> *__return_ptr)retstr :(PPSTimestampConverter *)self allocator<std:(SEL)a3 :(id)a4 pair<double
{
  PPSSQLiteEntity *v6;
  void *v7;
  PPSSQLiteEntity *v8;
  PPSSQLiteQueryDescriptor *v9;
  void *v10;
  void *v11;
  PPSSQLiteDatabase *v12;
  PPSSQLiteQuery *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  __n128 *v19;
  __n128 *v20;
  __n128 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  vector<std::pair<double, double>, std::allocator<std::pair<double, double>>> *result;
  id v26;
  _QWORD v27[6];
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  __n128 (*v33)(__n128 *, __n128 *);
  void (*v34)(uint64_t);
  void *v35;
  void *__p;
  void *v37;
  uint64_t v38;
  _QWORD v39[4];
  char v40;
  _QWORD v41[2];
  const __CFString *v42;
  const __CFString *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v26 = a4;
  v6 = [PPSSQLiteEntity alloc];
  v44[0] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPSSQLiteEntity initWithTableNames:](v6, "initWithTableNames:", v7);

  v9 = -[PPSSQLiteQueryDescriptor initWithEntity:predicate:limitCount:offsetCount:]([PPSSQLiteQueryDescriptor alloc], "initWithEntity:predicate:limitCount:offsetCount:", v8, 0, 0, 0);
  v43 = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteQueryDescriptor setOrderByProperties:](v9, "setOrderByProperties:", v10);

  v42 = CFSTR("ASC");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteQueryDescriptor setOrderByDirections:](v9, "setOrderByDirections:", v11);

  v12 = -[PPSSQLiteDatabase initWithDatabaseURL:]([PPSSQLiteDatabase alloc], "initWithDatabaseURL:", self->_filepath);
  v13 = -[PPSSQLiteQuery initWithDatabase:descriptor:]([PPSSQLiteQuery alloc], "initWithDatabase:descriptor:", v12, v9);
  v41[0] = CFSTR("timestamp");
  v41[1] = CFSTR("system");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0xFFEFFFFFFFFFFFFFLL;
  v30 = 0;
  v31 = &v30;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v32 = 0x4812000000;
  v35 = &unk_243A83AB9;
  __p = 0;
  v37 = 0;
  v38 = 0;
  v29 = 0;
  -[PPSSQLiteDatabase openForReadingWithError:](v12, "openForReadingWithError:", &v29);
  v15 = v29;
  v28 = v15;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __52__PPSTimestampConverter__systemOffsetsForTableName___block_invoke;
  v27[3] = &unk_25142CEA0;
  v27[4] = v39;
  v27[5] = &v30;
  -[PPSSQLiteQuery enumerateProperties:error:enumerationHandler:](v13, "enumerateProperties:error:enumerationHandler:", v14, &v28, v27);
  v16 = v28;

  v17 = v16;
  -[PPSSQLiteDatabase close](v12, "close");
  v20 = (__n128 *)v31[6];
  v19 = (__n128 *)v31[7];
  if ((char *)v19 - (char *)v20 < 1)
  {
    v21 = 0;
    v23 = 0;
  }
  else
  {
    v21 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<std::pair<double,double>>(v19 - v20);
    v23 = v22;
  }
  std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<std::pair<double,double> *>>(v20, v19, (uint64_t)&v40, v19 - v20, v21, v23, v18);
  if (v21)
    operator delete(v21);
  v24 = v31;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<std::pair<double,double>>::__init_with_size[abi:ne180100]<std::pair<double,double>*,std::pair<double,double>*>((char *)retstr, (__int128 *)v24[6], (__int128 *)v24[7], (v24[7] - v24[6]) >> 4);

  _Block_object_dispose(&v30, 8);
  if (__p)
  {
    v37 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(v39, 8);

  return result;
}

uint64_t __52__PPSTimestampConverter__systemOffsetsForTableName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD *v12;
  double *v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  double *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;

  v5 = a2;
  v6 = (void *)MEMORY[0x2494FEED8]();
  v7 = PPSSQLiteColumnValueWithNameAsDouble(a3, CFSTR("timestamp"));
  v8 = PPSSQLiteColumnValueWithNameAsDouble(a3, CFSTR("system"));
  v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v10 = fabs(v9);
  v11 = fmax(fabs(v8), 1.0);
  if (v11 < v10)
    v11 = v10;
  if (vabdd_f64(v8, v9) > v11 * 2.22044605e-16)
  {
    v12 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v13 = (double *)v12[7];
    v14 = v12[8];
    if ((unint64_t)v13 >= v14)
    {
      v16 = v12[6];
      v17 = ((uint64_t)v13 - v16) >> 4;
      v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60)
        std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
      v19 = v14 - v16;
      if (v19 >> 3 > v18)
        v18 = v19 >> 3;
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
        v20 = 0xFFFFFFFFFFFFFFFLL;
      else
        v20 = v18;
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,double>>>((uint64_t)(v12 + 8), v20);
      v22 = (double *)&v21[16 * v17];
      v24 = &v21[16 * v23];
      *v22 = v7;
      v22[1] = v8;
      v15 = v22 + 2;
      v26 = (char *)v12[6];
      v25 = (char *)v12[7];
      if (v25 != v26)
      {
        do
        {
          *((_OWORD *)v22 - 1) = *((_OWORD *)v25 - 1);
          v22 -= 2;
          v25 -= 16;
        }
        while (v25 != v26);
        v25 = (char *)v12[6];
      }
      v12[6] = v22;
      v12[7] = v15;
      v12[8] = v24;
      if (v25)
        operator delete(v25);
    }
    else
    {
      *v13 = v7;
      v13[1] = v8;
      v15 = v13 + 2;
    }
    v12[7] = v15;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  }
  objc_autoreleasePoolPop(v6);

  return 1;
}

- (id)_tableNameForSystemOffset
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;

  v3 = +[PPSDataIngesterCommonUtilities fileTypeForFilepath:](PPSDataIngesterCommonUtilities, "fileTypeForFilepath:", self->_filepath)- 1;
  if (v3 > 4)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v4 = off_25142CEC0[v3];
    v5 = off_25142CEE8[v3];
  }
  +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:subsystem:category:](PPSOffDeviceIngesterUtilities, "dataSourceForFilepath:subsystem:category:", self->_filepath, v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_tableNameForTimeZoneOffset
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;

  +[PPSOffDeviceIngesterUtilities metricDefinitionForFilepath:subsystem:category:metricName:](PPSOffDeviceIngesterUtilities, "metricDefinitionForFilepath:subsystem:category:metricName:", self->_filepath, CFSTR("TimeZone"), CFSTR("LocaleMetrics"), CFSTR("SecondsFromGMT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:](PPSDataIngesterCommonUtilities, "dataSourceForMetricDefinition:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5 = +[PPSDataIngesterCommonUtilities fileTypeForFilepath:](PPSDataIngesterCommonUtilities, "fileTypeForFilepath:", self->_filepath)- 1;
    if (v5 >= 5)
    {
      v7 = CFSTR("TimeZone");
      v6 = CFSTR("LocaleMetrics");
    }
    else
    {
      v6 = off_25142CF10[v5];
      v7 = off_25142CF38[v5];
    }
    +[PPSOffDeviceIngesterUtilities dataSourceForFilepath:subsystem:category:](PPSOffDeviceIngesterUtilities, "dataSourceForFilepath:subsystem:category:", self->_filepath, v7, v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }

  return v4;
}

- (vector<std::pair<double,)_timeZoneOffsetsForTableName:()std:(double>>> *__return_ptr)retstr :(PPSTimestampConverter *)self allocator<std:(SEL)a3 :(id)a4 pair<double
{
  PPSSQLiteEntity *v6;
  void *v7;
  PPSSQLiteEntity *v8;
  PPSSQLiteQueryDescriptor *v9;
  void *v10;
  void *v11;
  PPSSQLiteDatabase *v12;
  PPSSQLiteQuery *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  __n128 *v19;
  __n128 *v20;
  __n128 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  vector<std::pair<double, double>, std::allocator<std::pair<double, double>>> *result;
  id v26;
  _QWORD v27[6];
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  __n128 (*v33)(__n128 *, __n128 *);
  void (*v34)(uint64_t);
  void *v35;
  void *__p;
  void *v37;
  uint64_t v38;
  _QWORD v39[4];
  char v40;
  _QWORD v41[2];
  const __CFString *v42;
  const __CFString *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v26 = a4;
  v6 = [PPSSQLiteEntity alloc];
  v44[0] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPSSQLiteEntity initWithTableNames:](v6, "initWithTableNames:", v7);

  v9 = -[PPSSQLiteQueryDescriptor initWithEntity:predicate:limitCount:offsetCount:]([PPSSQLiteQueryDescriptor alloc], "initWithEntity:predicate:limitCount:offsetCount:", v8, 0, 0, 0);
  v43 = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteQueryDescriptor setOrderByProperties:](v9, "setOrderByProperties:", v10);

  v42 = CFSTR("ASC");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSQLiteQueryDescriptor setOrderByDirections:](v9, "setOrderByDirections:", v11);

  v12 = -[PPSSQLiteDatabase initWithDatabaseURL:]([PPSSQLiteDatabase alloc], "initWithDatabaseURL:", self->_filepath);
  v13 = -[PPSSQLiteQuery initWithDatabase:descriptor:]([PPSSQLiteQuery alloc], "initWithDatabase:descriptor:", v12, v9);
  v41[0] = CFSTR("timestamp");
  v41[1] = CFSTR("SecondsFromGMT");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0xFFEFFFFFFFFFFFFFLL;
  v30 = 0;
  v31 = &v30;
  v33 = __Block_byref_object_copy__5;
  v34 = __Block_byref_object_dispose__5;
  v32 = 0x4812000000;
  v35 = &unk_243A83AB9;
  __p = 0;
  v37 = 0;
  v38 = 0;
  v29 = 0;
  -[PPSSQLiteDatabase openForReadingWithError:](v12, "openForReadingWithError:", &v29);
  v15 = v29;
  v28 = v15;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __54__PPSTimestampConverter__timeZoneOffsetsForTableName___block_invoke;
  v27[3] = &unk_25142CEA0;
  v27[4] = v39;
  v27[5] = &v30;
  -[PPSSQLiteQuery enumerateProperties:error:enumerationHandler:](v13, "enumerateProperties:error:enumerationHandler:", v14, &v28, v27);
  v16 = v28;

  v17 = v16;
  -[PPSSQLiteDatabase close](v12, "close");
  v20 = (__n128 *)v31[6];
  v19 = (__n128 *)v31[7];
  if ((char *)v19 - (char *)v20 < 1)
  {
    v21 = 0;
    v23 = 0;
  }
  else
  {
    v21 = (__n128 *)std::get_temporary_buffer[abi:ne180100]<std::pair<double,double>>(v19 - v20);
    v23 = v22;
  }
  std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<std::pair<double,double> *>>(v20, v19, (uint64_t)&v40, v19 - v20, v21, v23, v18);
  if (v21)
    operator delete(v21);
  v24 = v31;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<std::pair<double,double>>::__init_with_size[abi:ne180100]<std::pair<double,double>*,std::pair<double,double>*>((char *)retstr, (__int128 *)v24[6], (__int128 *)v24[7], (v24[7] - v24[6]) >> 4);

  _Block_object_dispose(&v30, 8);
  if (__p)
  {
    v37 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(v39, 8);

  return result;
}

uint64_t __54__PPSTimestampConverter__timeZoneOffsetsForTableName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD *v12;
  double *v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  double *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;

  v5 = a2;
  v6 = (void *)MEMORY[0x2494FEED8]();
  v7 = PPSSQLiteColumnValueWithNameAsDouble(a3, CFSTR("timestamp"));
  v8 = PPSSQLiteColumnValueWithNameAsDouble(a3, CFSTR("SecondsFromGMT"));
  v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v10 = fabs(v9);
  v11 = fmax(fabs(v8), 1.0);
  if (v11 < v10)
    v11 = v10;
  if (vabdd_f64(v8, v9) > v11 * 2.22044605e-16)
  {
    v12 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v13 = (double *)v12[7];
    v14 = v12[8];
    if ((unint64_t)v13 >= v14)
    {
      v16 = v12[6];
      v17 = ((uint64_t)v13 - v16) >> 4;
      v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60)
        std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
      v19 = v14 - v16;
      if (v19 >> 3 > v18)
        v18 = v19 >> 3;
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
        v20 = 0xFFFFFFFFFFFFFFFLL;
      else
        v20 = v18;
      v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,double>>>((uint64_t)(v12 + 8), v20);
      v22 = (double *)&v21[16 * v17];
      v24 = &v21[16 * v23];
      *v22 = v7;
      v22[1] = v8;
      v15 = v22 + 2;
      v26 = (char *)v12[6];
      v25 = (char *)v12[7];
      if (v25 != v26)
      {
        do
        {
          *((_OWORD *)v22 - 1) = *((_OWORD *)v25 - 1);
          v22 -= 2;
          v25 -= 16;
        }
        while (v25 != v26);
        v25 = (char *)v12[6];
      }
      v12[6] = v22;
      v12[7] = v15;
      v12[8] = v24;
      if (v25)
        operator delete(v25);
    }
    else
    {
      *v13 = v7;
      v13[1] = v8;
      v15 = v13 + 2;
    }
    v12[7] = v15;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  }
  objc_autoreleasePoolPop(v6);

  return 1;
}

- (void)_addSystemOffset:(double)a3 withMonotonicTime:(double)a4
{
  __compressed_pair<std::pair<double, double> *, std::allocator<std::pair<double, double>>> *p_end_cap;
  double *value;
  double *end;
  void *v10;
  vector<std::pair<double, double>, std::allocator<std::pair<double, double>>> *p_systemOffsets;
  double *begin;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  double *v18;
  char *v19;

  p_end_cap = &self->_systemOffsets.__end_cap_;
  value = (double *)self->_systemOffsets.__end_cap_.__value_;
  end = (double *)self->_systemOffsets.__end_;
  if (end >= value)
  {
    p_systemOffsets = &self->_systemOffsets;
    begin = (double *)self->_systemOffsets.__begin_;
    v13 = ((char *)end - (char *)begin) >> 4;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60)
      std::vector<boost::histogram::axis::variant<boost::histogram::axis::regular<double,boost::use_default,boost::use_default,boost::use_default>,boost::histogram::axis::variable<double,boost::use_default,boost::use_default,std::allocator<double>>,boost::histogram::axis::integer<int,boost::use_default,boost::histogram::axis::option::bit<1u>>>>::__throw_length_error[abi:ne180100]();
    v15 = (char *)value - (char *)begin;
    if (v15 >> 3 > v14)
      v14 = v15 >> 3;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
      v16 = 0xFFFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    if (v16)
    {
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,double>>>((uint64_t)p_end_cap, v16);
      begin = (double *)self->_systemOffsets.__begin_;
      end = (double *)self->_systemOffsets.__end_;
    }
    else
    {
      v17 = 0;
    }
    v18 = (double *)&v17[16 * v13];
    v19 = &v17[16 * v16];
    *v18 = a4;
    v18[1] = a3;
    v10 = v18 + 2;
    if (end != begin)
    {
      do
      {
        *((_OWORD *)v18 - 1) = *((_OWORD *)end - 1);
        v18 -= 2;
        end -= 2;
      }
      while (end != begin);
      begin = (double *)p_systemOffsets->__begin_;
    }
    self->_systemOffsets.__begin_ = v18;
    self->_systemOffsets.__end_ = v10;
    self->_systemOffsets.__end_cap_.__value_ = v19;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = a4;
    end[1] = a3;
    v10 = end + 2;
  }
  self->_systemOffsets.__end_ = v10;
}

- (void).cxx_destruct
{
  void *begin;
  void *v4;

  begin = self->_timeZoneOffsets.__begin_;
  if (begin)
  {
    self->_timeZoneOffsets.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_systemOffsets.__begin_;
  if (v4)
  {
    self->_systemOffsets.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_filepath, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end
