@implementation ATXScoreNormalizationModel

- (ATXScoreNormalizationModel)initWithParameters:(id)a3
{
  return -[ATXScoreNormalizationModel initWithParameters:circularBuffer:bufferHead:isBufferSorted:](self, "initWithParameters:circularBuffer:bufferHead:isBufferSorted:", a3, 0, 0, 1);
}

- (ATXScoreNormalizationModel)initWithParameters:(id)a3 circularBuffer:(id)a4 bufferHead:(int)a5 isBufferSorted:(BOOL)a6
{
  uint64_t v7;
  id v10;
  id v11;
  ATXScoreNormalizationModel *v12;
  ATXScoreNormalizationModel *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXScoreNormalizationModel;
  v12 = -[ATXScoreNormalizationModel init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_isBufferSorted = a6;
    objc_msgSend(v10, "bufferSize");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXScoreNormalizationModel setBufferSize:](v13, "setBufferSize:", objc_msgSend(v14, "intValue"));

    -[ATXScoreNormalizationModel setCircularBuffer:](v13, "setCircularBuffer:", v11);
    -[ATXScoreNormalizationModel setBufferHead:](v13, "setBufferHead:", v7);
    -[ATXScoreNormalizationModel setParameters:](v13, "setParameters:", v10);
    -[ATXScoreNormalizationModel circularBuffer](v13, "circularBuffer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      -[ATXScoreNormalizationModel resetBuffer](v13, "resetBuffer");
  }

  return v13;
}

- (void)addScore:(id)a3
{
  id v4;
  int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[ATXScoreNormalizationModel bufferHead](self, "bufferHead");
  -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 <= v5)
    objc_msgSend(v8, "addObject:", v4);
  else
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", -[ATXScoreNormalizationModel bufferHead](self, "bufferHead"), v4);

  -[ATXScoreNormalizationModel setBufferHead:](self, "setBufferHead:", ((-[ATXScoreNormalizationModel bufferHead](self, "bufferHead") + 1)% -[ATXScoreNormalizationModel bufferSize](self, "bufferSize")));
  -[ATXScoreNormalizationModel setIsBufferSorted:](self, "setIsBufferSorted:", 0);
}

- (void)resetBuffer
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[ATXScoreNormalizationModel bufferSize](self, "bufferSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXScoreNormalizationModel setCircularBuffer:](self, "setCircularBuffer:", v3);

  -[ATXScoreNormalizationModel setBufferHead:](self, "setBufferHead:", 0);
}

- (id)normalizeScore:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v4 = a3;
  -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    if (!-[ATXScoreNormalizationModel isBufferSorted](self, "isBufferSorted"))
      -[ATXScoreNormalizationModel getStateReadyForNormalization](self, "getStateReadyForNormalization");
    -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    v9 = 0;
    if (v8)
    {
      do
      {
        -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;
        objc_msgSend(v4, "doubleValue");
        v15 = v14;

        if (v13 > v15)
          break;
        ++v9;
        -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

      }
      while (v17 > v9);
      v18 = (double)(int)v9;
    }
    else
    {
      v18 = 0.0;
    }
    -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count") - 1;

    if (v21 == v9)
    {
      v19 = &unk_1E57EC428;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB37E8];
      -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "numberWithDouble:", v18 / (double)(unint64_t)objc_msgSend(v23, "count") * 100.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v19 = &unk_1E57EC440;
  }

  return v19;
}

- (void)getStateReadyForNormalization
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingDescriptors:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSMutableArray copyWithZone:](self->_circularBuffer, "copyWithZone:", a3);
  objc_msgSend(v5, "setCircularBuffer:", v6);

  objc_msgSend(v5, "setIsBufferSorted:", self->_isBufferSorted);
  objc_msgSend(v5, "setBufferHead:", self->_bufferHead);
  objc_msgSend(v5, "setBufferSize:", self->_bufferSize);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ATXScoreNormalizationModel circularBuffer](self, "circularBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("circularBuffer"));

  objc_msgSend(v5, "encodeBool:forKey:", -[ATXScoreNormalizationModel isBufferSorted](self, "isBufferSorted"), CFSTR("isBufferSorted"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[ATXScoreNormalizationModel bufferSize](self, "bufferSize"), CFSTR("bufferSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[ATXScoreNormalizationModel bufferHead](self, "bufferHead"), CFSTR("bufferHead"));

}

- (ATXScoreNormalizationModel)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ATXScoreNormalizationParameters *v12;
  void *v13;
  ATXScoreNormalizationParameters *v14;
  ATXScoreNormalizationModel *v15;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("circularBuffer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("isBufferSorted"));
  v10 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("bufferSize"));
  v11 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("bufferHead"));

  v12 = [ATXScoreNormalizationParameters alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXScoreNormalizationParameters initWithBufferSize:](v12, "initWithBufferSize:", v13);

  v15 = -[ATXScoreNormalizationModel initWithParameters:circularBuffer:bufferHead:isBufferSorted:](self, "initWithParameters:circularBuffer:bufferHead:isBufferSorted:", v14, v8, v11, v9);
  return v15;
}

- (ATXScoreNormalizationParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
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

- (int)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(int)a3
{
  self->_bufferSize = a3;
}

- (BOOL)isBufferSorted
{
  return self->_isBufferSorted;
}

- (void)setIsBufferSorted:(BOOL)a3
{
  self->_isBufferSorted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularBuffer, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
