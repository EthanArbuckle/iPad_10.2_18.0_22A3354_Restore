@implementation EvaluationDataSourceEspressoWrapper

- (EvaluationDataSourceEspressoWrapper)initWithEvaluatorDataSource:(id)a3
{
  id v5;
  EvaluationDataSourceEspressoWrapper *v6;
  EvaluationDataSourceEspressoWrapper *v7;
  EvaluationDataSourceEspressoWrapper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EvaluationDataSourceEspressoWrapper;
  v6 = -[EvaluationDataSourceEspressoWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = v7;
  }

  return v7;
}

- (id)dataProcessAtIndex:(int)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t i;
  void *v40;
  double v41;
  BOOL v42;
  float *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x24BDAC8D0];
  -[EvaluationDataSourceEspressoWrapper dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "batchSize");

  -[EvaluationDataSourceEspressoWrapper dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v7;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v57, "count");
  v8 = objc_alloc(MEMORY[0x24BDBFFF0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v61);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v68 = (void *)objc_msgSend(v8, "initWithShape:dataType:error:", v11, 65600, &v71);
  v12 = v71;

  v13 = objc_alloc(MEMORY[0x24BDBFFF0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v14;
  v78[1] = &unk_24F959898;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v12;
  v62 = (void *)objc_msgSend(v13, "initWithShape:dataType:error:", v15, 65600, &v70);
  v60 = v70;

  v63 = objc_alloc_init(MEMORY[0x24BE2F3A0]);
  v16 = v60;
  if ((int)v5 >= 1)
  {
    v17 = 0;
    v58 = v5;
    v59 = (int)v5 * a3;
    do
    {
      -[EvaluationDataSourceEspressoWrapper dataSource](self, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v17 + v59;
      objc_msgSend(v18, "dataForRecord:", v17 + v59);
      v65 = (id)objc_claimAutoreleasedReturnValue();

      -[EvaluationDataSourceEspressoWrapper dataSource](self, "dataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "modelFeatures");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length") == 0;

      if (v22)
      {
        v25 = v65;
      }
      else
      {
        -[EvaluationDataSourceEspressoWrapper dataSource](self, "dataSource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "extractFeatureDataForRecord:", v19);
        v24 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v24;
      }
      v66 = v25;
      v26 = objc_msgSend(v25, "length");
      v67 = objc_retainAutorelease(v66);
      objc_msgSend(v63, "setData:size:forKey:freeWhenDone:", objc_msgSend(v67, "bytes"), v26 >> 2, CFSTR("data"), 0);
      v27 = objc_msgSend(v63, "bufferWithKey:", CFSTR("data"));
      if ((int)v61 >= 1)
      {
        v29 = v27;
        v30 = 0;
        do
        {
          LODWORD(v28) = *(_DWORD *)(v29 + 4 * v30);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v77[0] = v32;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v77[1] = v33;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "setObject:forKeyedSubscript:", v31, v34);

          ++v30;
        }
        while (v61 != v30);
      }
      -[EvaluationDataSourceEspressoWrapper dataSource](self, "dataSource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "classificationForRecord:", v19);

      -[EvaluationDataSourceEspressoWrapper dataSource](self, "dataSource");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "vectorForClassification:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      for (i = 0; i < (int)objc_msgSend(v38, "count"); ++i)
      {
        objc_msgSend(v38, "objectAtIndex:", i);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "doubleValue");
        v42 = v41 == 0.9999;

        if (v42)
        {
          LODWORD(v36) = i;
          break;
        }
      }
      v43 = (float *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
      *v43 = (float)(int)v36;
      objc_msgSend(v63, "setData:size:forKey:freeWhenDone:", v43, 1, CFSTR("label"), 0);
      *(float *)&v44 = *v43;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v46;
      v76[1] = &unk_24F9598B0;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setObject:forKeyedSubscript:", v45, v47);

      ++v17;
      v16 = v60;
    }
    while (v17 != v58);
  }
  -[EvaluatorDataSource modelInputSchemaInputName](self->_dataSource, "modelInputSchemaInputName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[EvaluatorDataSource modelInputSchemaLabelName](self->_dataSource, "modelInputSchemaLabelName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_alloc(MEMORY[0x24BDBFF80]);
  v74[0] = v48;
  v74[1] = v49;
  v75[0] = v68;
  v75[1] = v62;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v16;
  v52 = (void *)objc_msgSend(v50, "initWithDictionary:error:", v51, &v69);
  v53 = v69;

  v72[0] = CFSTR("ETDataPoint");
  v72[1] = CFSTR("MLDictionaryFeatureProvider");
  v73[0] = v63;
  v73[1] = v52;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (id)dataPointAtIndex:(int)a3
{
  void *v3;
  void *v4;

  -[EvaluationDataSourceEspressoWrapper dataProcessAtIndex:](self, "dataProcessAtIndex:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ETDataPoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)featureProviderAtIndex:(int)a3
{
  void *v3;
  void *v4;

  -[EvaluationDataSourceEspressoWrapper dataProcessAtIndex:](self, "dataProcessAtIndex:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MLDictionaryFeatureProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)numberOfDataPoints
{
  void *v2;
  int v3;

  -[EvaluationDataSourceEspressoWrapper dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recordCount");

  return v3;
}

- (EvaluatorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
