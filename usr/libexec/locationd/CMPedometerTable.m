@implementation CMPedometerTable

- (id)copyBins
{
  id v3;

  objc_sync_enter(self);
  v3 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", self->_bins);
  objc_sync_exit(self);
  return v3;
}

- (BOOL)isNativeValueOutAvailableInBinsFromIndex:(unint64_t)a3 withLength:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = -[CMPedometerTable copyBins](self, "copyBins");
  if (objc_msgSend(v6, "count")
    && (v16 = 0u,
        v17 = 0u,
        v14 = 0u,
        v15 = 0u,
        v7 = objc_msgSend(v6, "subarrayWithRange:", a3, a4, 0),
        (v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16)) != 0))
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if ((uint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "state") > 1)
        {
          v12 = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v12 = 0;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

- (BOOL)isWalkNativeValueOutAvailable
{
  return -[CMPedometerTable isNativeValueOutAvailableInBinsFromIndex:withLength:](self, "isNativeValueOutAvailableInBinsFromIndex:withLength:", -[CMPedometerTable binIndexForValueIn:](self, "binIndexForValueIn:", *self->_binBoundariesWalk.__begin_), self->_binBoundariesWalk.__end_ - self->_binBoundariesWalk.__begin_);
}

- (BOOL)isValueInRun:(double)a3
{
  return *(self->_binBoundariesWalk.__end_ - 1) < a3;
}

- (unint64_t)binIndexForValueIn:(double)a3
{
  unint64_t result;
  uint64_t v6;
  double *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;

  if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:")
    && (result = -[CMPedometerTable walkBinCount](self, "walkBinCount")) != 0)
  {
    v6 = 64;
  }
  else
  {
    result = 0;
    v6 = 40;
  }
  v8 = (char *)self + v6;
  v7 = *(double **)((char *)&self->super.isa + v6);
  v9 = *((_QWORD *)v8 + 1) - (_QWORD)v7;
  if (!v9)
    return self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 2;
  v10 = v9 >> 3;
  if (v10 <= 1)
    v10 = 1;
  while (*v7 < a3)
  {
    ++result;
    ++v7;
    if (!--v10)
      return self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 2;
  }
  return result;
}

- (CMPedometerTable)initWithTableName:(id)a3 valueInName:(id)a4 valueOutName:(id)a5 defaultValue:(double)a6 binBoundariesWalk:()vector<double binBoundariesRun:(std:()vector<double :(std:(BOOL)a9 :allocator<double>> *)a8 allocator<double>> *)a7 testMode:
{
  _BOOL4 v9;
  char *v16;
  void **v17;
  unint64_t v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSSet *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  objc_super v44;
  uint8_t buf[8];
  __int16 v46;
  const char *v47;
  __int16 v48;
  id v49;

  v9 = a9;
  v44.receiver = self;
  v44.super_class = (Class)CMPedometerTable;
  v16 = -[CMPedometerTable init](&v44, "init");
  if (!v16)
    return (CMPedometerTable *)v16;
  *((_QWORD *)v16 + 1) = a3;
  *((_QWORD *)v16 + 2) = a4;
  *((_QWORD *)v16 + 3) = a5;
  *((double *)v16 + 4) = a6;
  if (v16 + 40 != (char *)a7)
    sub_10034F2B0(v16 + 40, (char *)a7->__begin_, (uint64_t)a7->__end_, a7->__end_ - a7->__begin_);
  if (v16 + 64 != (char *)a8)
    sub_10034F2B0(v16 + 64, (char *)a8->__begin_, (uint64_t)a8->__end_, a8->__end_ - a8->__begin_);
  v17 = (void **)(v16 + 88);
  sub_100407BF8((void **)v16 + 11, a7->__end_ - a7->__begin_ + a8->__end_ - a8->__begin_ + 1);
  v18 = *((_QWORD *)v16 + 13);
  v19 = (char *)*((_QWORD *)v16 + 12);
  if ((unint64_t)v19 >= v18)
  {
    v21 = (char *)*v17;
    v22 = (v19 - (_BYTE *)*v17) >> 3;
    v23 = v22 + 1;
    if ((unint64_t)(v22 + 1) >> 61)
      sub_100259694();
    v24 = v18 - (_QWORD)v21;
    if (v24 >> 2 > v23)
      v23 = v24 >> 2;
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
      v25 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v25 = v23;
    if (v25)
    {
      v26 = (char *)sub_10025E6A0((uint64_t)(v16 + 104), v25);
      v21 = (char *)*((_QWORD *)v16 + 11);
      v19 = (char *)*((_QWORD *)v16 + 12);
    }
    else
    {
      v26 = 0;
    }
    v27 = &v26[8 * v22];
    v28 = &v26[8 * v25];
    *(_QWORD *)v27 = 0;
    v20 = v27 + 8;
    while (v19 != v21)
    {
      v29 = *((_QWORD *)v19 - 1);
      v19 -= 8;
      *((_QWORD *)v27 - 1) = v29;
      v27 -= 8;
    }
    *((_QWORD *)v16 + 11) = v27;
    *((_QWORD *)v16 + 12) = v20;
    *((_QWORD *)v16 + 13) = v28;
    if (v21)
      operator delete(v21);
  }
  else
  {
    *(_QWORD *)v19 = 0;
    v20 = v19 + 8;
  }
  *((_QWORD *)v16 + 12) = v20;
  sub_100C35794(a7->__begin_, a7->__end_, (uint64_t)(v16 + 88));
  sub_100C35794(a8->__begin_, a8->__end_, (uint64_t)(v16 + 88));
  v16[112] = v9;
  if (v9)
  {
    v30 = objc_msgSend(v16, "defaultBins");
  }
  else
  {
    v31 = sub_1001FD94C();
    *((_QWORD *)v16 + 15) = v31;
    *(_QWORD *)buf = 0;
    v33 = 0;
    if (sub_100219F40(v31, *((_QWORD *)v16 + 1), (CFTypeRef *)buf))
      v34 = *(_QWORD *)buf;
    else
      v34 = 0;
    if (!v34)
    {
      v35 = objc_msgSend(v16, "defaultBins");
      v33 = v35;
      objc_msgSend(v16, "binArrayToArchivedData:", v35);
      sub_10023EC14(*((_QWORD *)v16 + 15));
      (*(void (**)(_QWORD))(**((_QWORD **)v16 + 15) + 944))(*((_QWORD *)v16 + 15));
    }
    v36 = objc_opt_class(CMPedometerBin, v32);
    v38 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v36, objc_opt_class(NSArray, v37), 0);
    if (!v34)
      goto LABEL_32;
    v30 = objc_msgSend(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v38, v34, 0), "mutableCopy");
  }
  v33 = v30;
LABEL_32:
  *((_QWORD *)v16 + 16) = v33;
  if (!objc_msgSend(v33, "count"))
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10217B0F8);
    v39 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_FAULT))
    {
      v40 = objc_msgSend(*((id *)v16 + 1), "UTF8String");
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      v46 = 2082;
      v47 = "";
      v48 = 2081;
      v49 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Pedometer Calibration Table Empty After Initialization\", \"tableName\":%{private, location:escape_only}s}", buf, 0x1Cu);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10217B0F8);
    }
    v41 = qword_10229FCD8;
    if (os_signpost_enabled((os_log_t)qword_10229FCD8))
    {
      v42 = objc_msgSend(*((id *)v16 + 1), "UTF8String");
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      v46 = 2082;
      v47 = "";
      v48 = 2081;
      v49 = v42;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Pedometer Calibration Table Empty After Initialization", "{\"msg%{public}.0s\":\"Pedometer Calibration Table Empty After Initialization\", \"tableName\":%{private, location:escape_only}s}", buf, 0x1Cu);
    }
  }
  return (CMPedometerTable *)v16;
}

- (id)binArrayToArchivedData:(id)a3
{
  if ((objc_opt_respondsToSelector(NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:") & 1) != 0)return +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", a3), 1, 0);
  else
    return 0;
}

- (id)defaultBins
{
  id v3;
  double *i;
  id v5;
  double v6;
  double v7;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 1);
  for (i = self->_binBoundaries.__begin_; i != self->_binBoundaries.__end_ - 1; ++i)
  {
    v5 = objc_alloc((Class)CMPedometerBin);
    v6 = *i;
    v7 = i[1];
    objc_msgSend(v3, "addObject:", objc_msgSend(v5, "initWithValueOut:begin:end:state:", 0, self->_defaultValue, v6, v7));
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMPedometerTable;
  -[CMPedometerTable dealloc](&v3, "dealloc");
}

- (double)valueOutForValueIn:(double)a3
{
  id v5;
  double defaultValue;
  unint64_t v7;
  char *v8;
  int64_t v9;
  double v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char *v18;
  int64_t v20;
  void *v21;
  char *v22;
  double v23;
  uint64_t v24;
  id v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v5 = -[CMPedometerTable copyBins](self, "copyBins");
  defaultValue = self->_defaultValue;
  v7 = -[CMPedometerTable binIndexForValueIn:](self, "binIndexForValueIn:", a3);
  if (objc_msgSend(v5, "count") && v7 < (unint64_t)objc_msgSend(v5, "count"))
  {
    if (-[CMPedometerTable isValueInRun:](self, "isValueInRun:", a3))
    {
      v8 = (char *)objc_msgSend(v5, "count");
      v9 = -[CMPedometerTable walkBinCount](self, "walkBinCount");
    }
    else
    {
      v8 = -[CMPedometerTable walkBinCount](self, "walkBinCount");
      v9 = 0;
    }
    objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "valueOut");
    defaultValue = v10;
    v11 = (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "state");
    v12 = v7 - 1;
    if (v11 <= 1)
    {
      v13 = (char *)(v7 + 1);
      if (v11 != 1
        || (v12 < v9
         || (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7 - 1), "state") < 2
         || (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "upperQuartile"), v14 < a3))
        && ((uint64_t)v13 >= (uint64_t)v8
         || (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7 + 1), "state") < 2
         || (objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "lowerQuartile"), v15 >= a3)))
      {
        objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "upperQuartile");
        if (v16 >= a3)
          v13 = (char *)v7;
        if ((uint64_t)v13 < (uint64_t)v8)
        {
          while ((uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v13), "state") <= 0)
          {
            if (v8 == ++v13)
            {
              v13 = v8;
              break;
            }
          }
        }
        objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v7), "lowerQuartile");
        if (v17 < a3)
          v12 = v7;
        if (v12 >= v9)
        {
          while ((uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v12), "state") <= 0)
          {
            v18 = (char *)(v12 - 1);
            if (v12-- <= v9)
              goto LABEL_27;
          }
        }
        v18 = (char *)v12;
LABEL_27:
        if (v13 != v18)
        {
          v20 = v9 - 1;
          if (v13 == v8)
          {
            if (v18 != (char *)v20)
            {
              v21 = v5;
              v22 = v18;
LABEL_33:
              objc_msgSend(objc_msgSend(v21, "objectAtIndexedSubscript:", v22), "valueOut");
              defaultValue = v23;
            }
          }
          else
          {
            v21 = v5;
            if (v18 == (char *)v20)
            {
              v22 = v13;
              goto LABEL_33;
            }
            v24 = (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v18), "state");
            v25 = objc_msgSend(v5, "objectAtIndexedSubscript:", v18);
            if (v24 < 2)
              objc_msgSend(v25, "upperQuartile");
            else
              objc_msgSend(v25, "end");
            v27 = v26;
            v28 = (uint64_t)objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v13), "state");
            v29 = objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
            if (v28 < 2)
              objc_msgSend(v29, "lowerQuartile");
            else
              objc_msgSend(v29, "begin");
            v31 = v30;
            objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v18), "valueOut");
            v33 = v32;
            objc_msgSend(objc_msgSend(v5, "objectAtIndexedSubscript:", v13), "valueOut");
            defaultValue = v33 + (a3 - v27) * (v34 - v33) / (v31 - v27);
          }
        }
      }
    }
  }

  return defaultValue;
}

- (BOOL)isRunNativeValueOutAvailable
{
  return -[CMPedometerTable isNativeValueOutAvailableInBinsFromIndex:withLength:](self, "isNativeValueOutAvailableInBinsFromIndex:withLength:", -[CMPedometerTable binIndexForValueIn:](self, "binIndexForValueIn:", *self->_binBoundariesRun.__begin_), self->_binBoundariesRun.__end_ - self->_binBoundariesRun.__begin_);
}

- (void)updateNativeBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5
{
  id v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;

  v9 = -[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:");
  objc_msgSend(v9, "valueOut");
  v11 = a4 * a5 + v10 * (1.0 - a4);
  v12 = objc_alloc((Class)CMPedometerBin);
  objc_msgSend(v9, "begin");
  v14 = v13;
  objc_msgSend(v9, "end");
  v16 = v15;
  v17 = (uint64_t)objc_msgSend(v9, "state");
  if (v17 <= 1)
    v18 = 1;
  else
    v18 = v17;
  -[NSMutableArray setObject:atIndexedSubscript:](self->_bins, "setObject:atIndexedSubscript:", objc_msgSend(v12, "initWithValueOut:begin:end:state:", v18 + 1, v11, v14, v16), a3);
}

- (void)updateAdjacentBin:(unint64_t)a3 withAlpha:(double)a4 valueOut:(double)a5 nativeBin:(unint64_t)a6
{
  id v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;

  if (-[CMPedometerTable isBin:sameActivityAsBin:](self, "isBin:sameActivityAsBin:", a3, a6))
  {
    v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", a3);
    if ((uint64_t)objc_msgSend(v10, "state") <= 10)
    {
      objc_msgSend(v10, "valueOut");
      v12 = a4 * a5 + v11 * (1.0 - a4);
      v13 = objc_alloc((Class)CMPedometerBin);
      objc_msgSend(v10, "begin");
      v15 = v14;
      objc_msgSend(v10, "end");
      v17 = v16;
      v18 = (uint64_t)objc_msgSend(v10, "state");
      if (v18 <= 1)
        v19 = 1;
      else
        v19 = v18;
      -[NSMutableArray setObject:atIndexedSubscript:](self->_bins, "setObject:atIndexedSubscript:", objc_msgSend(v13, "initWithValueOut:begin:end:state:", v19, v12, v15, v17), a3);
    }
  }
}

- (BOOL)isBin:(unint64_t)a3 sameActivityAsBin:(unint64_t)a4
{
  unint64_t v4;
  BOOL v9;

  v4 = self->_binBoundaries.__end_ - self->_binBoundaries.__begin_ - 1;
  if (v4 <= a3 || v4 <= a4)
    return 0;
  v9 = -[CMPedometerTable walkBinCount](self, "walkBinCount") <= a3;
  return v9 ^ (-[CMPedometerTable walkBinCount](self, "walkBinCount") > a4);
}

- (BOOL)isValueInValid:(double)a3
{
  return a3 >= 0.0 && *(self->_binBoundariesRun.__end_ - 1) >= a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)binIntervalForValueIn:(double)a3
{
  double *begin;
  double *end;
  double v6;
  uint64_t v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  begin = self->_binBoundaries.__begin_;
  end = self->_binBoundaries.__end_;
  v6 = -1.0;
  if (begin == end)
    goto LABEL_10;
  v7 = 0;
  while (begin[v7] < a3)
  {
    if (&begin[++v7] == end)
      goto LABEL_10;
  }
  if (!(v7 * 8))
  {
LABEL_10:
    v8 = -1.0;
  }
  else
  {
    v8 = -1.0;
    if (&begin[v7] != end)
    {
      v6 = begin[v7 - 1];
      v8 = begin[v7];
    }
  }
  result.var1 = v8;
  result.var0 = v6;
  return result;
}

- (void)setBins:(id)a3
{
  NSMutableArray *bins;

  objc_sync_enter(self);
  bins = self->_bins;
  if (bins != a3)
  {

    self->_bins = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  }
  objc_sync_exit(self);
  if (!self->_testMode)
  {
    -[CMPedometerTable binArrayToArchivedData:](self, "binArrayToArchivedData:", a3);
    sub_10023EC14((uint64_t)self->_persistentStore);
    (*(void (**)(void *))(*(_QWORD *)self->_persistentStore + 944))(self->_persistentStore);
  }
  -[CMPedometerTable logBins](self, "logBins");
  -[CMPedometerTable binsDidChange](self, "binsDidChange");
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (unint64_t)walkBinCount
{
  return self->_binBoundariesWalk.__end_ - self->_binBoundariesWalk.__begin_;
}

- (id)description
{
  id v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  __CFString *v12;

  v3 = -[CMPedometerTable copyBins](self, "copyBins");
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_100207178;
  v11 = sub_100207C84;
  v12 = 0;
  v12 = &stru_1021D8FB8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C34EE4;
  v6[3] = &unk_10217B088;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)updateBinsWithValueOut:(double)a3 valueIn:(double)a4 alpha:(double)a5
{
  unint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint8_t *v24;
  int v25;
  unint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint8_t buf[4];
  unint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  double v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;

  objc_sync_enter(self);
  v9 = -[CMPedometerTable binIndexForValueIn:](self, "binIndexForValueIn:", a4);
  if (v9 >= (unint64_t)-[NSMutableArray count](self->_bins, "count"))
  {
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10217B0F8);
    v16 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      v44 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "binIndex %{public}lu invalid", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10217B0F8);
      v25 = 134349056;
      v26 = v9;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FCD8, 17, "binIndex %{public}lu invalid", &v25, 12);
      v18 = (uint8_t *)v17;
      sub_100512490("Generic", 1, 0, 0, "-[CMPedometerTable updateBinsWithValueOut:valueIn:alpha:]", "%s\n", v17);
      if (v18 != buf)
        free(v18);
    }
  }
  else
  {
    v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", v9);
    -[CMPedometerTable updateNativeBin:withAlpha:valueOut:](self, "updateNativeBin:withAlpha:valueOut:", v9, a5, a3);
    -[CMPedometerTable updateAdjacentBin:withAlpha:valueOut:nativeBin:](self, "updateAdjacentBin:withAlpha:valueOut:nativeBin:", v9 - 1, v9, a5, a3);
    -[CMPedometerTable updateAdjacentBin:withAlpha:valueOut:nativeBin:](self, "updateAdjacentBin:withAlpha:valueOut:nativeBin:", v9 + 1, v9, a5, a3);
    -[CMPedometerTable setBins:](self, "setBins:", self->_bins);
    v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_bins, "objectAtIndexedSubscript:", v9);
    if (qword_10229FCD0 != -1)
      dispatch_once(&qword_10229FCD0, &stru_10217B0F8);
    v12 = qword_10229FCD8;
    if (os_log_type_enabled((os_log_t)qword_10229FCD8, OS_LOG_TYPE_INFO))
    {
      v13 = -[NSString UTF8String](self->_tableName, "UTF8String");
      v14 = -[NSString UTF8String](self->_valueInName, "UTF8String");
      v15 = -[NSString UTF8String](self->_valueOutName, "UTF8String");
      *(_DWORD *)buf = 136317186;
      v44 = (unint64_t)v13;
      v45 = 2080;
      v46 = v14;
      v47 = 2048;
      v48 = a4;
      v49 = 2080;
      v50 = v15;
      v51 = 2048;
      v52 = a3;
      v53 = 2048;
      v54 = a5;
      v55 = 2048;
      v56 = v9;
      v57 = 2080;
      v58 = objc_msgSend(objc_msgSend(v10, "description"), "UTF8String");
      v59 = 2080;
      v60 = objc_msgSend(objc_msgSend(v11, "description"), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,NativeBinIndex,%lu,OldBinStatus,%s,NewBinStatus,%s", buf, 0x5Cu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FCD0 != -1)
        dispatch_once(&qword_10229FCD0, &stru_10217B0F8);
      v19 = qword_10229FCD8;
      v20 = -[NSString UTF8String](self->_tableName, "UTF8String");
      v21 = -[NSString UTF8String](self->_valueInName, "UTF8String");
      v22 = -[NSString UTF8String](self->_valueOutName, "UTF8String");
      v25 = 136317186;
      v26 = (unint64_t)v20;
      v27 = 2080;
      v28 = v21;
      v29 = 2048;
      v30 = a4;
      v31 = 2080;
      v32 = v22;
      v33 = 2048;
      v34 = a3;
      v35 = 2048;
      v36 = a5;
      v37 = 2048;
      v38 = v9;
      v39 = 2080;
      v40 = objc_msgSend(objc_msgSend(v10, "description"), "UTF8String");
      v41 = 2080;
      v42 = objc_msgSend(objc_msgSend(v11, "description"), "UTF8String");
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v19, 1, "%s,Updated,With,%s,%0.4f,%s,%0.4f,Alpha,%0.4f,NativeBinIndex,%lu,OldBinStatus,%s,NewBinStatus,%s", (const char *)&v25, 92);
      v24 = (uint8_t *)v23;
      sub_100512490("Generic", 1, 0, 2, "-[CMPedometerTable updateBinsWithValueOut:valueIn:alpha:]", "%s\n", v23);
      if (v24 != buf)
        free(v24);
    }

  }
  objc_sync_exit(self);
}

+ (id)convertToCMPedometerBins:(id)a3
{
  id v4;
  _QWORD v6[5];

  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(a3, "count"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C35540;
  v6[3] = &unk_10217B0B0;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v6);
  return v4;
}

+ (id)convertToCMStrideCalibrationData:(id)a3
{
  id v4;
  _QWORD v6[5];

  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(a3, "count"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C35668;
  v6[3] = &unk_10217B0D8;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v6);
  return v4;
}

- (void).cxx_destruct
{
  double *begin;
  double *v4;
  double *v5;

  begin = self->_binBoundaries.__begin_;
  if (begin)
  {
    self->_binBoundaries.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_binBoundariesRun.__begin_;
  if (v4)
  {
    self->_binBoundariesRun.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_binBoundariesWalk.__begin_;
  if (v5)
  {
    self->_binBoundariesWalk.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end
