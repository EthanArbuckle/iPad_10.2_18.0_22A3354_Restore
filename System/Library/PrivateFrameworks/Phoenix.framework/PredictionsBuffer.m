@implementation PredictionsBuffer

- (PredictionsBuffer)initWithConfiguration:(id)a3
{
  PredictionsBuffer *v3;
  uint64_t v4;
  NSMutableArray *predictions;
  uint64_t v6;
  NSMutableArray *counts;
  PredictionsBuffer *v9;
  id v10;
  objc_super v11;
  id location[2];
  PredictionsBuffer *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)PredictionsBuffer;
  v13 = -[PredictionsBuffer init](&v11, sel_init);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v4 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(location[0], "maxPredictionBufferSize"));
    predictions = v13->_predictions;
    v13->_predictions = (NSMutableArray *)v4;

    objc_storeStrong((id *)&v13->_configuration, location[0]);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
    counts = v13->_counts;
    v13->_counts = (NSMutableArray *)v6;

    -[NSMutableArray setObject:atIndexedSubscript:](v13->_counts, "setObject:atIndexedSubscript:");
    -[NSMutableArray setObject:atIndexedSubscript:](v13->_counts, "setObject:atIndexedSubscript:", &unk_24F1967D0, 1);
    -[NSMutableArray setObject:atIndexedSubscript:](v13->_counts, "setObject:atIndexedSubscript:", &unk_24F1967D0, 2);
  }
  v9 = v13;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v9;
}

- (id)predictionCounts
{
  return self->_counts;
}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_predictions, "removeAllObjects");
  -[NSMutableArray setObject:atIndexedSubscript:](self->_counts, "setObject:atIndexedSubscript:");
  -[NSMutableArray setObject:atIndexedSubscript:](self->_counts, "setObject:atIndexedSubscript:", &unk_24F1967D0, 1);
  -[NSMutableArray setObject:atIndexedSubscript:](self->_counts, "setObject:atIndexedSubscript:", &unk_24F1967D0, 2);
}

- (void)addPrediction:(id)a3
{
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  void *v23;
  id v24;
  id v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  double v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  double v35;
  void *v36;
  id v37;
  id v38;
  double v39;
  void *v40;
  id v41;
  id v42;
  double v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  id location[2];
  PredictionsBuffer *v48;

  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = -[NSMutableArray count](v48->_predictions, "count");
  if (v45 >= -[AXPhoenixClassifierConfiguration maxPredictionBufferSize](v48->_configuration, "maxPredictionBufferSize"))
  {
    v46 = (id)-[NSMutableArray objectAtIndex:](v48->_predictions, "objectAtIndex:", 0);
    v44 = objc_msgSend(v46, "predictedClass");
    if (v44)
    {
      if (v44 == 1)
      {
        objc_msgSend(v46, "maxConfidence");
        v39 = v7;
        -[AXPhoenixClassifierConfiguration predictionConfidenceThreshold](v48->_configuration, "predictionConfidenceThreshold");
        v9 = v8;
        v3 = v39;
        if (v39 > v9)
        {
          v36 = (void *)MEMORY[0x24BDD16E0];
          v38 = (id)-[NSMutableArray objectAtIndex:](v48->_counts, "objectAtIndex:", v39);
          v37 = (id)objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v38, "unsignedIntegerValue") - 1);
          -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");

        }
      }
      else if (v44 == 2)
      {
        objc_msgSend(v46, "maxConfidence");
        v35 = v10;
        -[AXPhoenixClassifierConfiguration predictionConfidenceThreshold](v48->_configuration, "predictionConfidenceThreshold");
        v12 = v11;
        v3 = v35;
        if (v35 > v12)
        {
          v32 = (void *)MEMORY[0x24BDD16E0];
          v34 = (id)-[NSMutableArray objectAtIndex:](v48->_counts, "objectAtIndex:", v35);
          v33 = (id)objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v34, "unsignedIntegerValue") - 1);
          -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");

        }
      }
    }
    else
    {
      objc_msgSend(v46, "maxConfidence");
      v43 = v4;
      -[AXPhoenixClassifierConfiguration predictionConfidenceThreshold](v48->_configuration, "predictionConfidenceThreshold");
      v6 = v5;
      v3 = v43;
      if (v43 > v6)
      {
        v40 = (void *)MEMORY[0x24BDD16E0];
        v42 = (id)-[NSMutableArray objectAtIndex:](v48->_counts, "objectAtIndex:", v43);
        v41 = (id)objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v42, "unsignedIntegerValue") - 1);
        -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");

      }
    }
    -[NSMutableArray removeObjectAtIndex:](v48->_predictions, "removeObjectAtIndex:", 0, v3);
    objc_storeStrong(&v46, 0);
  }
  -[NSMutableArray addObject:](v48->_predictions, "addObject:", location[0]);
  v31 = objc_msgSend(location[0], "predictedClass");
  if (v31)
  {
    if (v31 == 1)
    {
      objc_msgSend(location[0], "maxConfidence");
      v26 = v15;
      -[AXPhoenixClassifierConfiguration predictionConfidenceThreshold](v48->_configuration, "predictionConfidenceThreshold");
      if (v26 > v16)
      {
        v23 = (void *)MEMORY[0x24BDD16E0];
        v25 = (id)-[NSMutableArray objectAtIndex:](v48->_counts, "objectAtIndex:", v26);
        v24 = (id)objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v25, "unsignedIntegerValue") + 1);
        -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");

      }
    }
    else if (v31 == 2)
    {
      objc_msgSend(location[0], "maxConfidence");
      v22 = v17;
      -[AXPhoenixClassifierConfiguration predictionConfidenceThreshold](v48->_configuration, "predictionConfidenceThreshold");
      if (v22 > v18)
      {
        v19 = (void *)MEMORY[0x24BDD16E0];
        v21 = (id)-[NSMutableArray objectAtIndex:](v48->_counts, "objectAtIndex:", v22);
        v20 = (id)objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v21, "unsignedIntegerValue") + 1);
        -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");

      }
    }
  }
  else
  {
    objc_msgSend(location[0], "maxConfidence");
    v30 = v13;
    -[AXPhoenixClassifierConfiguration predictionConfidenceThreshold](v48->_configuration, "predictionConfidenceThreshold");
    if (v30 > v14)
    {
      v27 = (void *)MEMORY[0x24BDD16E0];
      v29 = (id)-[NSMutableArray objectAtIndex:](v48->_counts, "objectAtIndex:", v30);
      v28 = (id)objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v29, "unsignedIntegerValue") + 1);
      -[NSMutableArray setObject:atIndexedSubscript:](v48->_counts, "setObject:atIndexedSubscript:");

    }
  }
  objc_storeStrong(location, 0);
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)bestPredictionUsingPolicyOption:(int)a3
{
  unint64_t v3;
  unint64_t v4;
  id v5;
  unint64_t v6;
  id v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v13 = a3;
  v12 = 0;
  v9 = (id)-[NSMutableArray objectAtIndexedSubscript:](self->_counts, "objectAtIndexedSubscript:", 0);
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = v10;
  if ((v13 & 1) != 0)
  {
    v7 = (id)-[NSMutableArray objectAtIndexedSubscript:](self->_counts, "objectAtIndexedSubscript:", 1);
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if (v8 > v10)
    {
      v11 = v8;
      v12 = 1;
    }
  }
  if ((v13 & 2) != 0)
  {
    v5 = (id)-[NSMutableArray objectAtIndexedSubscript:](self->_counts, "objectAtIndexedSubscript:", 2);
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    if (v6 > v11)
    {
      v11 = v6;
      v12 = 2;
    }
  }
  v3 = v12;
  v4 = v11;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (id)logBuffer
{
  NSMutableArray *predictions;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *, void *, void *, void *);
  void *v9;
  id v10;
  id v11[2];
  PredictionsBuffer *v12;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  predictions = v12->_predictions;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __30__PredictionsBuffer_logBuffer__block_invoke;
  v9 = &unk_24F18F738;
  v10 = v11[0];
  -[NSMutableArray enumerateObjectsUsingBlock:](predictions, "enumerateObjectsUsingBlock:");
  v4 = v11[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  return v4;
}

void __30__PredictionsBuffer_logBuffer__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14[4];
  id location[2];
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[3] = a3;
  v14[2] = a4;
  v14[1] = a1;
  v16[0] = CFSTR("noneScore");
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "noneScore");
  v12 = (id)objc_msgSend(v6, "numberWithDouble:");
  v17[0] = v12;
  v16[1] = CFSTR("doubleTapScore");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "doubleTapScore");
  v11 = (id)objc_msgSend(v7, "numberWithDouble:");
  v17[1] = v11;
  v16[2] = CFSTR("tripleTapScore");
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(location[0], "tripleTapScore");
  v10 = (id)objc_msgSend(v8, "numberWithDouble:");
  v17[2] = v10;
  v16[3] = CFSTR("predictedClass");
  v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(location[0], "predictedClass"));
  v17[3] = v9;
  v14[0] = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);

  objc_msgSend(a1[4], "addObject:", v14[0]);
  objc_storeStrong(v14, 0);
  objc_storeStrong(location, 0);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v5 = -[PredictionsBuffer logBuffer](self, "logBuffer");
  v4 = (id)objc_msgSend(v5, "componentsJoinedByString:", CFSTR(":"));
  v6 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("predictions[none,double,triple,class]: %@"), v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_counts, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
}

@end
