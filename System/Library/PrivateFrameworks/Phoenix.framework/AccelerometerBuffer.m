@implementation AccelerometerBuffer

- (AccelerometerBuffer)initWithCapacity:(unint64_t)a3 accelerometerSampleRateInHz:(unint64_t)a4
{
  id v4;
  uint64_t v5;
  NSMutableArray *accelBuffer;
  AccelerometerBuffer *v8;
  objc_super v9;
  unint64_t v10;
  unint64_t v11;
  SEL v12;
  AccelerometerBuffer *v13;

  v12 = a2;
  v11 = a3;
  v10 = a4;
  v13 = 0;
  v9.receiver = self;
  v9.super_class = (Class)AccelerometerBuffer;
  v13 = -[AccelerometerBuffer init](&v9, sel_init);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v5 = objc_msgSend(v4, "initWithCapacity:", v11);
    accelBuffer = v13->_accelBuffer;
    v13->_accelBuffer = (NSMutableArray *)v5;

    v13->_bufferSize = v11;
    v13->_sampleRate = v10;
    v13->_movingSum.x = 0.0;
    v13->_movingSum.y = 0.0;
    v13->_movingSum.z = 0.0;
  }
  v8 = v13;
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (id)buffer
{
  return self->_accelBuffer;
}

- (AccelerometerBuffer)bufferWithMovingSum:(id *)a3
{
  if (a3)
    *($83A9B0F16167884A9BDC45564D3E7367 *)a3 = self->_movingSum;
  return (AccelerometerBuffer *)self->_accelBuffer;
}

- (void)addData:(id)a3 timestamp:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  AccelerometerData *v11;
  NSMutableArray *accelBuffer;
  AccelerometerData *v13;
  double v14;
  id location;
  double v16;
  SEL v17;
  AccelerometerBuffer *v18;
  $1AB5FA073B851C12C2339EC22442E995 v19;

  v19 = a3;
  v18 = self;
  v17 = a2;
  v16 = a4;
  if (-[NSMutableArray count](self->_accelBuffer, "count") < self->_bufferSize)
  {
    -[AccelerometerBuffer _fillAccelBufferBeforeFirstSampleTimestamp:](v18, "_fillAccelBufferBeforeFirstSampleTimestamp:", v16);
  }
  else
  {
    location = (id)-[NSMutableArray firstObject](v18->_accelBuffer, "firstObject");
    if (location)
    {
      objc_msgSend(location, "x");
      v18->_movingSum.x = v18->_movingSum.x - v4;
      objc_msgSend(location, "y");
      v18->_movingSum.y = v18->_movingSum.y - v5;
      objc_msgSend(location, "z");
      v18->_movingSum.z = v18->_movingSum.z - v6;
      -[NSMutableArray removeObject:](v18->_accelBuffer, "removeObject:", location);
    }
    objc_storeStrong(&location, 0);
  }
  v18->_movingSum.x = v18->_movingSum.x + v19.var0;
  v18->_movingSum.y = v18->_movingSum.y + v19.var1;
  v18->_movingSum.z = v18->_movingSum.z + v19.var2;
  v14 = v18->_movingSum.z / (double)v18->_bufferSize;
  -[AccelerometerBuffer localMaxAboveAverage](v18, "localMaxAboveAverage");
  -[AccelerometerBuffer setLocalMaxAboveAverage:](v18, "setLocalMaxAboveAverage:", fmax(v7, v19.var2 - v14));
  -[AccelerometerBuffer localMinBelowAverage](v18, "localMinBelowAverage");
  -[AccelerometerBuffer setLocalMinBelowAverage:](v18, "setLocalMinBelowAverage:", fmin(v8, v19.var2 - v14));
  -[AccelerometerBuffer localMax](v18, "localMax");
  -[AccelerometerBuffer setLocalMax:](v18, "setLocalMax:", fmax(v9, v19.var2));
  -[AccelerometerBuffer localMin](v18, "localMin");
  -[AccelerometerBuffer setLocalMin:](v18, "setLocalMin:", fmin(v10, v19.var2));
  accelBuffer = v18->_accelBuffer;
  v11 = [AccelerometerData alloc];
  v13 = -[AccelerometerData initWithData:timestamp:](v11, "initWithData:timestamp:", v19.var0, v19.var1, v19.var2, v16);
  -[NSMutableArray addObject:](accelBuffer, "addObject:");

}

- (void)_fillAccelBufferBeforeFirstSampleTimestamp:(double)a3
{
  NSMutableArray *accelBuffer;
  AccelerometerData *v4;
  unint64_t i;
  unint64_t v6;

  v6 = self->_bufferSize - 1;
  for (i = 0; i < v6; ++i)
  {
    accelBuffer = self->_accelBuffer;
    v4 = -[AccelerometerData initWithData:timestamp:]([AccelerometerData alloc], "initWithData:timestamp:", 0.0, 0.0, 0.0, a3 - (double)((v6 - i) / self->_sampleRate));
    -[NSMutableArray addObject:](accelBuffer, "addObject:");

  }
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_accelBuffer, "removeAllObjects");
  -[AccelerometerBuffer resetMovingSum](self, "resetMovingSum");
}

- (void)resetMovingSum
{
  self->_movingSum.x = 0.0;
  self->_movingSum.y = 0.0;
  self->_movingSum.z = 0.0;
  -[AccelerometerBuffer setLocalMaxAboveAverage:](self, "setLocalMaxAboveAverage:");
  -[AccelerometerBuffer setLocalMinBelowAverage:](self, "setLocalMinBelowAverage:", 0.0);
  -[AccelerometerBuffer setLocalMax:](self, "setLocalMax:", 0.0);
  -[AccelerometerBuffer setLocalMin:](self, "setLocalMin:", 0.0);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)data
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  id v15;
  double v17;
  double v18;
  double v19;
  double v20;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v15 = (id)-[NSMutableArray firstObject](self->_accelBuffer, "firstObject");
  objc_msgSend(v15, "timestamp");
  v17 = v2;
  v13 = (id)-[NSMutableArray lastObject](self->_accelBuffer, "lastObject");
  objc_msgSend(v13, "timestamp");
  v18 = v3;
  -[AccelerometerBuffer localMaxAboveAverage](self, "localMaxAboveAverage");
  v12 = v4;
  -[AccelerometerBuffer localMinBelowAverage](self, "localMinBelowAverage");
  v19 = v12 - v5;
  -[AccelerometerBuffer localMax](self, "localMax");
  v14 = v6;
  -[AccelerometerBuffer localMin](self, "localMin");
  v20 = v14 - v7;

  v8 = v17;
  v9 = v18;
  v10 = v19;
  v11 = v20;
  result.var3 = v11;
  result.var2 = v10;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (id)logBuffer
{
  id v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  NSMutableArray *accelBuffer;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(id *, void *, void *, void *);
  void *v13;
  id v14;
  id v15;
  id location;
  os_log_type_t v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t, void *, void *, void *);
  void *v23;
  id v24[3];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  SEL v32;
  AccelerometerBuffer *v33;
  uint8_t v34[40];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  v32 = a2;
  v31 = 25;
  v26 = 0;
  v27 = &v26;
  v28 = 0x20000000;
  v29 = 32;
  v30 = 0;
  v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v25 = (id)objc_msgSend(v8, "initWithCapacity:", v31);
  accelBuffer = v33->_accelBuffer;
  v19 = MEMORY[0x24BDAC760];
  v20 = -1073741824;
  v21 = 0;
  v22 = __32__AccelerometerBuffer_logBuffer__block_invoke;
  v23 = &unk_24F18F6E8;
  v24[0] = v25;
  v24[2] = (id)v31;
  v24[1] = &v26;
  -[NSMutableArray enumerateObjectsUsingBlock:](accelBuffer, "enumerateObjectsUsingBlock:", &v19);
  if (objc_msgSend(v25, "count"))
  {
    v18 = (id)AXLogBackTap();
    v17 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
    {
      v6 = v27[3];
      v5 = (id)objc_msgSend(v25, "componentsJoinedByString:", CFSTR(":"));
      location = v5;
      __os_log_helper_16_2_3_8_32_8_0_8_64((uint64_t)v34, (uint64_t)"-[AccelerometerBuffer logBuffer]", v6, (uint64_t)location);
      _os_log_impl(&dword_228CDB000, (os_log_t)v18, v17, "[PHOENIX] %s [ix=%lu] accelerometer[t,x,y,z]:%@", v34, 0x20u);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(&v18, 0);
    objc_msgSend(v25, "removeAllObjects");
  }
  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = v33->_accelBuffer;
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __32__AccelerometerBuffer_logBuffer__block_invoke_37;
  v13 = &unk_24F18F710;
  v14 = v15;
  -[NSMutableArray enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:", &v9);
  v3 = v15;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v24, 0);
  objc_storeStrong(&v25, 0);
  _Block_object_dispose(&v26, 8);
  return v3;
}

void __32__AccelerometerBuffer_logBuffer__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *log;
  os_log_type_t type;
  id v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v19;
  char v20;
  id v21;
  id v22[4];
  id location[2];
  uint8_t v24[40];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v22[3] = a3;
  v22[2] = a4;
  v22[1] = (id)a1;
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(location[0], "timestamp");
  v14 = v4;
  objc_msgSend(location[0], "x");
  v15 = v5;
  objc_msgSend(location[0], "y");
  v16 = v6;
  objc_msgSend(location[0], "z");
  v22[0] = (id)objc_msgSend(v17, "stringWithFormat:", CFSTR("%.5f,%.5f,%.5f,%.5f"), v14, v15, v16, v7);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v22[0]);
  if (objc_msgSend(*(id *)(a1 + 32), "count") == *(_QWORD *)(a1 + 48))
  {
    v21 = (id)AXLogBackTap();
    v20 = 1;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
    {
      log = v21;
      type = v20;
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v11 = (id)objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(":"));
      v19 = v11;
      __os_log_helper_16_2_3_8_32_8_0_8_64((uint64_t)v24, (uint64_t)"-[AccelerometerBuffer logBuffer]_block_invoke", v8, (uint64_t)v19);
      _os_log_impl(&dword_228CDB000, log, type, "[PHOENIX] %s [ix=%lu] accelerometer[t,x,y,z]:%@", v24, 0x20u);

      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong(&v21, 0);
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  objc_storeStrong(v22, 0);
  objc_storeStrong(location, 0);
}

void __32__AccelerometerBuffer_logBuffer__block_invoke_37(id *a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15[4];
  id location[2];
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15[3] = a3;
  v15[2] = a4;
  v15[1] = a1;
  v17[0] = CFSTR("timestamp");
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "timestamp");
  v13 = (id)objc_msgSend(v6, "numberWithDouble:");
  v18[0] = v13;
  v17[1] = CFSTR("x");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "x");
  v12 = (id)objc_msgSend(v7, "numberWithDouble:");
  v18[1] = v12;
  v17[2] = CFSTR("y");
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "y");
  v11 = (id)objc_msgSend(v8, "numberWithDouble:");
  v18[2] = v11;
  v17[3] = CFSTR("z");
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "z");
  v10 = (id)objc_msgSend(v9, "numberWithDouble:");
  v18[3] = v10;
  v15[0] = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);

  objc_msgSend(a1[4], "addObject:", v15[0]);
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
}

- (id)csv
{
  NSMutableArray *accelBuffer;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *);
  void *v9;
  id v10;
  id v11[2];
  AccelerometerBuffer *v12;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v11[0], "appendString:", CFSTR("timestamp,x,y,z\n"));
  accelBuffer = v12->_accelBuffer;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __26__AccelerometerBuffer_csv__block_invoke;
  v9 = &unk_24F18F710;
  v10 = v11[0];
  -[NSMutableArray enumerateObjectsUsingBlock:](accelBuffer, "enumerateObjectsUsingBlock:");
  v4 = v11[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  return v4;
}

void __26__AccelerometerBuffer_csv__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = (void *)a1[4];
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "timestamp");
  v11 = (id)objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "x");
  v10 = (id)objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "y");
  v9 = (id)objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "z");
  v8 = (id)objc_msgSend(v6, "numberWithDouble:");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@,%@,%@,%@\n"), v11, v10, v9, v8);

  objc_storeStrong(location, 0);
}

- (unint64_t)capacity
{
  return self->_bufferSize;
}

- (id)description
{
  NSMutableArray *accelBuffer;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(_QWORD *, void *);
  void *v9;
  id v10;
  id v11[2];
  AccelerometerBuffer *v12;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = objc_alloc_init(MEMORY[0x24BDD16A8]);
  accelBuffer = v12->_accelBuffer;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __34__AccelerometerBuffer_description__block_invoke;
  v9 = &unk_24F18F710;
  v10 = v11[0];
  -[NSMutableArray enumerateObjectsUsingBlock:](accelBuffer, "enumerateObjectsUsingBlock:");
  v4 = v11[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  return v4;
}

void __34__AccelerometerBuffer_description__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (void *)a1[4];
  v4 = (id)objc_msgSend(location[0], "description");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v4);

  objc_storeStrong(location, 0);
}

- (double)localMinBelowAverage
{
  return self->_localMinBelowAverage;
}

- (void)setLocalMinBelowAverage:(double)a3
{
  self->_localMinBelowAverage = a3;
}

- (double)localMaxAboveAverage
{
  return self->_localMaxAboveAverage;
}

- (void)setLocalMaxAboveAverage:(double)a3
{
  self->_localMaxAboveAverage = a3;
}

- (double)localMin
{
  return self->_localMin;
}

- (void)setLocalMin:(double)a3
{
  self->_localMin = a3;
}

- (double)localMax
{
  return self->_localMax;
}

- (void)setLocalMax:(double)a3
{
  self->_localMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelBuffer, 0);
}

@end
