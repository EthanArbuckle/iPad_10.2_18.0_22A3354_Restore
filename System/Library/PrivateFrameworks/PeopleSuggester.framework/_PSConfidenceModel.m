@implementation _PSConfidenceModel

- (_PSConfidenceModel)initWithBufferSize:(int)a3 minimumInstanceCount:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  _PSConfidenceModel *v6;
  _PSConfidenceModel *v7;
  objc_super v9;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)_PSConfidenceModel;
  v6 = -[_PSConfidenceModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[_PSConfidenceModel setSum:](v6, "setSum:", 0.0);
    -[_PSConfidenceModel setBufferSize:](v7, "setBufferSize:", v5);
    -[_PSConfidenceModel setBufferHead:](v7, "setBufferHead:", 0);
    -[_PSConfidenceModel setMinimumInstanceCount:](v7, "setMinimumInstanceCount:", v4);
    -[_PSConfidenceModel resetBuffer](v7, "resetBuffer");
  }
  return v7;
}

- (_PSConfidenceModel)initWithBufferSize:(int)a3 sum:(double)a4 circularBuffer:(id)a5 bufferHead:(int)a6
{
  uint64_t v6;
  uint64_t v8;
  id v10;
  _PSConfidenceModel *v11;
  _PSConfidenceModel *v12;
  objc_super v14;

  v6 = *(_QWORD *)&a6;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_PSConfidenceModel;
  v11 = -[_PSConfidenceModel init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[_PSConfidenceModel setSum:](v11, "setSum:", a4);
    -[_PSConfidenceModel setBufferSize:](v12, "setBufferSize:", v8);
    -[_PSConfidenceModel setCircularBuffer:](v12, "setCircularBuffer:", v10);
    -[_PSConfidenceModel setBufferHead:](v12, "setBufferHead:", v6);
  }

  return v12;
}

- (void)resetBuffer
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_PSConfidenceModel bufferSize](self, "bufferSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSConfidenceModel setCircularBuffer:](self, "setCircularBuffer:", v3);

  -[_PSConfidenceModel setBufferHead:](self, "setBufferHead:", 0);
}

- (void)addEvent:(id)a3
{
  id v4;
  int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  v5 = -[_PSConfidenceModel bufferHead](self, "bufferHead");
  -[_PSConfidenceModel circularBuffer](self, "circularBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[_PSConfidenceModel circularBuffer](self, "circularBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 <= v5)
  {
    objc_msgSend(v8, "addObject:", v4);
  }
  else
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", -[_PSConfidenceModel bufferHead](self, "bufferHead"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    -[_PSConfidenceModel sum](self, "sum");
    -[_PSConfidenceModel setSum:](self, "setSum:", v13 - v12);

    -[_PSConfidenceModel circularBuffer](self, "circularBuffer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceObjectAtIndex:withObject:", -[_PSConfidenceModel bufferHead](self, "bufferHead"), v4);
  }

  objc_msgSend(v4, "doubleValue");
  v15 = v14;

  -[_PSConfidenceModel sum](self, "sum");
  -[_PSConfidenceModel setSum:](self, "setSum:", v15 + v16);
  -[_PSConfidenceModel setBufferHead:](self, "setBufferHead:", ((-[_PSConfidenceModel bufferHead](self, "bufferHead") + 1)% -[_PSConfidenceModel bufferSize](self, "bufferSize")));
}

- (double)getConfidence
{
  void *v3;
  void *v4;
  unint64_t v5;
  int v6;
  double v7;
  void *v8;
  unint64_t v9;
  int v10;
  double v11;
  double v12;
  void *v13;

  -[_PSConfidenceModel circularBuffer](self, "circularBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[_PSConfidenceModel circularBuffer](self, "circularBuffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = -[_PSConfidenceModel minimumInstanceCount](self, "minimumInstanceCount");

    v7 = -1.0;
    if (v5 < v6)
      return v7;
  }
  else
  {

  }
  -[_PSConfidenceModel circularBuffer](self, "circularBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = -[_PSConfidenceModel minimumInstanceCount](self, "minimumInstanceCount");

  v7 = -1.0;
  if (v9 >= v10)
  {
    -[_PSConfidenceModel sum](self, "sum");
    v12 = v11;
    -[_PSConfidenceModel circularBuffer](self, "circularBuffer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12 / (double)(unint64_t)objc_msgSend(v13, "count");

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSMutableArray copyWithZone:](self->_circularBuffer, "copyWithZone:", a3);
  objc_msgSend(v5, "setCircularBuffer:", v6);

  objc_msgSend(v5, "setBufferHead:", self->_bufferHead);
  objc_msgSend(v5, "setSum:", self->_sum);
  objc_msgSend(v5, "setBufferSize:", self->_bufferSize);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  -[_PSConfidenceModel circularBuffer](self, "circularBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_circularBuffer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[_PSConfidenceModel sum](self, "sum");
  v8 = v7;
  NSStringFromSelector("sum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v9, v8);

  v10 = -[_PSConfidenceModel bufferSize](self, "bufferSize");
  NSStringFromSelector(sel_bufferSize);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v10, v11);

  v12 = -[_PSConfidenceModel bufferHead](self, "bufferHead");
  NSStringFromSelector(sel_bufferHead);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", v12, v13);

}

- (_PSConfidenceModel)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _PSConfidenceModel *v19;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_circularBuffer);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector("sum");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDoubleForKey:", v12);
  v14 = v13;

  NSStringFromSelector(sel_bufferSize);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v5, "decodeInt32ForKey:", v15);

  NSStringFromSelector(sel_bufferHead);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "decodeInt32ForKey:", v17);

  v19 = -[_PSConfidenceModel initWithBufferSize:sum:circularBuffer:bufferHead:](self, "initWithBufferSize:sum:circularBuffer:bufferHead:", v16, v11, v18, v14);
  return v19;
}

- (NSMutableArray)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setCircularBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_circularBuffer, a3);
}

- (int)bufferHead
{
  return self->_bufferHead;
}

- (void)setBufferHead:(int)a3
{
  self->_bufferHead = a3;
}

- (double)sum
{
  return self->_sum;
}

- (void)setSum:(double)a3
{
  self->_sum = a3;
}

- (int)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(int)a3
{
  self->_bufferSize = a3;
}

- (int)minimumInstanceCount
{
  return self->_minimumInstanceCount;
}

- (void)setMinimumInstanceCount:(int)a3
{
  self->_minimumInstanceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularBuffer, 0);
}

@end
