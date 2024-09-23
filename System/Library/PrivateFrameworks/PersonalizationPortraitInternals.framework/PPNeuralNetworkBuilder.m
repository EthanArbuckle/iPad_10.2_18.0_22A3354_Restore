@implementation PPNeuralNetworkBuilder

- (PPNeuralNetworkBuilder)initWithInputSize:(unint64_t)a3
{
  PPNeuralNetworkBuilder *v4;
  PPNeuralNetworkBuilder *v5;
  uint64_t v6;
  NSMutableData *descriptors;
  uint64_t v8;
  NSMutableArray *weightsAndBiases;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PPNeuralNetworkBuilder;
  v4 = -[PPNeuralNetworkBuilder init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_prevSize = a3;
    v4->_nlayers = 0;
    v6 = objc_opt_new();
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSMutableData *)v6;

    v8 = objc_opt_new();
    weightsAndBiases = v5->_weightsAndBiases;
    v5->_weightsAndBiases = (NSMutableArray *)v8;

    *(_WORD *)&v5->_haveOutputLayer = 0;
  }
  return v5;
}

- (void)addHiddenLayer:(unint64_t)a3 weights:(const float *)a4 bias:(const float *)a5 activation:(unsigned __int8)a6 skip:(BOOL)a7
{
  _BOOL4 v7;
  unint64_t prevSize;
  NSMutableArray *weightsAndBiases;
  id v16;
  void *v17;
  NSMutableArray *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  unsigned __int8 v27;
  BOOL v28;
  __int16 v29;

  v7 = a7;
  if (self->_done)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNeuralNetwork.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_done"));

    if (a3)
      goto LABEL_3;
  }
  else if (a3)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNeuralNetwork.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputSize > 0"));

LABEL_3:
  prevSize = self->_prevSize;
  v23 = prevSize;
  v24 = a3;
  v25 = 0;
  v26 = 0;
  v27 = a6;
  v28 = v7;
  v29 = 0;
  if (!v7)
    prevSize = 0;
  self->_prevSize = prevSize + a3;
  -[NSMutableData appendBytes:length:](self->_descriptors, "appendBytes:length:", &v23, 20);
  weightsAndBiases = self->_weightsAndBiases;
  v16 = objc_alloc(MEMORY[0x1E0C99D50]);
  v17 = (void *)objc_msgSend(v16, "initWithBytes:length:", a4, 4 * v24 * v23);
  -[NSMutableArray addObject:](weightsAndBiases, "addObject:", v17);

  v18 = self->_weightsAndBiases;
  v19 = objc_alloc(MEMORY[0x1E0C99D50]);
  v20 = (void *)objc_msgSend(v19, "initWithBytes:length:", a5, 4 * v24);
  -[NSMutableArray addObject:](v18, "addObject:", v20);

  ++self->_nlayers;
}

- (void)addOutputLayer:(unint64_t)a3 weights:(const float *)a4 bias:(const float *)a5 activation:(unsigned __int8)a6 softmax:(BOOL)a7
{
  unsigned int v11;
  NSMutableArray *weightsAndBiases;
  id v15;
  void *v16;
  NSMutableArray *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int prevSize;
  unsigned int v23;
  int v24;
  int v25;
  unsigned __int8 v26;
  char v27;
  BOOL v28;
  char v29;

  v11 = a3;
  if (self->_haveOutputLayer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNeuralNetwork.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_haveOutputLayer"));

  }
  if (self->_done)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNeuralNetwork.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_done"));

  }
  prevSize = self->_prevSize;
  v23 = v11;
  v24 = 0;
  v25 = 0;
  v26 = a6;
  v27 = 0;
  v28 = a7;
  v29 = 0;
  -[NSMutableData appendBytes:length:](self->_descriptors, "appendBytes:length:", &prevSize, 20);
  weightsAndBiases = self->_weightsAndBiases;
  v15 = objc_alloc(MEMORY[0x1E0C99D50]);
  v16 = (void *)objc_msgSend(v15, "initWithBytes:length:", a4, 4 * v23 * prevSize);
  -[NSMutableArray addObject:](weightsAndBiases, "addObject:", v16);

  v17 = self->_weightsAndBiases;
  v18 = objc_alloc(MEMORY[0x1E0C99D50]);
  v19 = (void *)objc_msgSend(v18, "initWithBytes:length:", a5, 4 * v23);
  -[NSMutableArray addObject:](v17, "addObject:", v19);

  ++self->_nlayers;
  self->_haveOutputLayer = 1;
}

- (id)serialize
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v14;
  void *v15;
  int nlayers;

  if (!self->_haveOutputLayer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNeuralNetwork.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_haveOutputLayer"));

  }
  if (self->_done)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNeuralNetwork.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_done"));

  }
  v4 = (void *)objc_opt_new();
  nlayers = self->_nlayers;
  objc_msgSend(v4, "appendBytes:length:", &nlayers, 4);
  objc_msgSend(v4, "appendData:", self->_descriptors);
  if (self->_nlayers)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_weightsAndBiases, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = offsetFromAppendingData(v4, v8);

      -[NSMutableArray objectAtIndexedSubscript:](self->_weightsAndBiases, "objectAtIndexedSubscript:", v7 + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = offsetFromAppendingData(v4, v10);

      v12 = objc_msgSend(objc_retainAutorelease(v4), "mutableBytes") + v5;
      *(_DWORD *)(v12 + 12) = v9;
      *(_DWORD *)(v12 + 16) = v11;
      ++v6;
      v5 += 20;
      v7 += 2;
    }
    while (v6 < self->_nlayers);
  }
  self->_done = 1;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightsAndBiases, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
}

@end
