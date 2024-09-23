@implementation PMLEspressoDataProvider

- (PMLEspressoDataProvider)initWithRowsData:(id)a3 labelsData:(id)a4 inputName:(id)a5 inputDim:(unint64_t)a6 trueLabelName:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  PMLEspressoDataProvider *v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t numberOfDataPoints;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  float v26;
  uint64_t v27;
  NSMutableData *inputBuffer;
  uint64_t v29;
  NSMutableData *trueLabelBuffer;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  SEL v36;
  unint64_t v37;
  id v38;
  objc_super v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PMLEspressoDataProvider;
  v18 = -[PMLEspressoDataProvider init](&v39, sel_init);
  if (v18)
  {
    v36 = a2;
    v37 = a6;
    v19 = objc_msgSend(v15, "length");
    if (objc_msgSend(v14, "count") != v19 >> 2)
    {
      v32 = v19 >> 2;
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v36, v18, CFSTR("PMLEspressoDataProvider.m"), 45, CFSTR("Number of dimensions in rows data (%lu) number of labels (%lu)"), objc_msgSend(v14, "count"), v32);

    }
    if (objc_msgSend(v16, "isEqualToString:", v17))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v36, v18, CFSTR("PMLEspressoDataProvider.m"), 48, CFSTR("The names of the input and trueLabel can not be the same: %s"), objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));

    }
    v38 = v16;
    v18->_numberOfDataPoints = objc_msgSend(v14, "count");
    v20 = objc_retainAutorelease(v15);
    v21 = objc_msgSend(v20, "bytes");
    numberOfDataPoints = v18->_numberOfDataPoints;
    if (numberOfDataPoints)
    {
      v23 = v21;
      v24 = 0;
      v25 = 0x24BDD1000uLL;
      do
      {
        v26 = *(float *)(v23 + 4 * v24);
        if (v26 < 0.0)
        {
          objc_msgSend(*(id *)(v25 + 1096), "currentHandler");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v36, v18, CFSTR("PMLEspressoDataProvider.m"), 55, CFSTR("Label value %f must be greater than 0"), v26);

          v25 = 0x24BDD1000;
          numberOfDataPoints = v18->_numberOfDataPoints;
        }
        ++v24;
      }
      while (numberOfDataPoints > v24);
    }
    objc_storeStrong((id *)&v18->_rowsData, a3);
    objc_storeStrong((id *)&v18->_labelsData, v20);
    objc_storeStrong((id *)&v18->_inputName, a5);
    v18->_inputDim = v37;
    objc_storeStrong((id *)&v18->_trueLabelName, a7);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 4 * v18->_inputDim);
    inputBuffer = v18->_inputBuffer;
    v18->_inputBuffer = (NSMutableData *)v27;

    v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 4);
    trueLabelBuffer = v18->_trueLabelBuffer;
    v18->_trueLabelBuffer = (NSMutableData *)v29;

    v16 = v38;
  }

  return v18;
}

- (void)clearBuffers
{
  -[NSMutableData resetBytesInRange:](self->_inputBuffer, "resetBytesInRange:", 0, -[NSMutableData length](self->_inputBuffer, "length"));
  -[NSMutableData resetBytesInRange:](self->_trueLabelBuffer, "resetBytesInRange:", 0, -[NSMutableData length](self->_trueLabelBuffer, "length"));
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t numberOfDataPoints;
  unint64_t inputDim;
  void *v30;
  id v31;
  _QWORD v32[4];
  _QWORD v33[4];
  uint8_t buf[4];
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (self->_numberOfDataPoints <= a3)
  {
    PML_LogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      numberOfDataPoints = self->_numberOfDataPoints;
      *(_DWORD *)buf = 134218240;
      v35 = a3;
      v36 = 2048;
      v37 = numberOfDataPoints;
      _os_log_error_impl(&dword_2159BB000, v26, OS_LOG_TYPE_ERROR, "Out of range index %lu requested from PMLEspressoDataProvider of size %lu", buf, 0x16u);
    }

    v14 = (void *)MEMORY[0x24BDBD1B8];
  }
  else
  {
    -[PMLEspressoDataProvider clearBuffers](self, "clearBuffers");
    *(_DWORD *)buf = *(_DWORD *)(-[NSData bytes](self->_labelsData, "bytes") + 4 * a3);
    -[NSMutableData replaceBytesInRange:withBytes:](self->_trueLabelBuffer, "replaceBytesInRange:withBytes:", 0, 4, buf);
    inputDim = self->_inputDim;
    -[NSArray objectAtIndexedSubscript:](self->_rowsData, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "first");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)objc_msgSend(v7, "length") >> 2;
    -[NSArray objectAtIndexedSubscript:](self->_rowsData, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "first");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "bytes");
    -[NSArray objectAtIndexedSubscript:](self->_rowsData, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "second");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    +[PMLSparseVector sparseVectorWithLength:numberOfNonZeroValues:isSparseIndexInt64:sparseIndices:sparseValues:toDenseValues:withLength:](PMLSparseVector, "sparseVectorWithLength:numberOfNonZeroValues:isSparseIndexInt64:sparseIndices:sparseValues:toDenseValues:withLength:", inputDim, v8, 0, v11, objc_msgSend(v13, "bytes"), -[NSMutableData mutableBytes](self->_inputBuffer, "mutableBytes"), self->_inputDim);

    v14 = (void *)objc_opt_new();
    v31 = objc_alloc(MEMORY[0x24BE2F3A8]);
    v30 = -[NSMutableData mutableBytes](self->_inputBuffer, "mutableBytes");
    v33[0] = &unk_24D3EAD90;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_inputDim);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v15;
    v33[2] = &unk_24D3EAD90;
    v33[3] = &unk_24D3EAD90;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_inputDim);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v17;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_inputDim);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_inputDim);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v19;
    v32[3] = &unk_24D3EAD90;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v31, "initWithData:type:shape:strides:", v30, 2, v16, v20);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, self->_inputName);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_inputDim);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", self->_inputName);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMaxNumberOfElements:", v22);

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2F3A8]), "initWithData:type:shape:strides:", -[NSMutableData mutableBytes](self->_trueLabelBuffer, "mutableBytes"), 2, &unk_24D3EB3F8, &unk_24D3EB410);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, self->_trueLabelName);

    objc_msgSend(v14, "objectForKeyedSubscript:", self->_trueLabelName);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setMaxNumberOfElements:", &unk_24D3EAD90);

  }
  return v14;
}

- (unint64_t)numberOfDataPoints
{
  return self->_numberOfDataPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trueLabelBuffer, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
  objc_storeStrong((id *)&self->_trueLabelName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_labelsData, 0);
  objc_storeStrong((id *)&self->_rowsData, 0);
}

@end
