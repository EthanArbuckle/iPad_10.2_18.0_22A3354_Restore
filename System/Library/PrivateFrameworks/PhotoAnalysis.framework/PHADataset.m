@implementation PHADataset

- (PHADataset)initWithLabeledFeatureVectors:(id)a3 inputName:(id)a4 labelName:(id)a5
{
  id v9;
  id v10;
  id v11;
  PHADataset *v12;
  PHADataset *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHADataset;
  v12 = -[PHADataset init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_labeledDataSamples, a3);
    objc_storeStrong((id *)&v13->_inputName, a4);
    objc_storeStrong((id *)&v13->_labelName, a5);
  }

  return v13;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[5];
  _QWORD v33[5];
  uint64_t v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  if (-[PHADataset numberOfDataPoints](self, "numberOfDataPoints") <= a3)
  {
    if (!a4)
      return MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Index (%lu) is larger than total number of data points (%lu)."), a3, -[PHADataset numberOfDataPoints](self, "numberOfDataPoints"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotoAnalysis.PHADataset"), 0, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    -[PHADataset labeledDataSamples](self, "labeledDataSamples");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatVector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0D1F498]);
    objc_msgSend(v9, "data");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "bytes");
    v33[0] = &unk_1E85403B8;
    v33[1] = &unk_1E85403B8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v13;
    v33[3] = &unk_1E85403B8;
    v33[4] = &unk_1E85403B8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithData:type:shape:strides:", v12, 2, v14, &unk_1E8540C20);

    -[PHADataset labeledDataSamples](self, "labeledDataSamples");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc(MEMORY[0x1E0D1F498]);
    objc_msgSend(v18, "data");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "bytes");
    v32[0] = &unk_1E85403B8;
    v32[1] = &unk_1E85403B8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v22;
    v32[3] = &unk_1E85403B8;
    v32[4] = &unk_1E85403B8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v19, "initWithData:type:shape:strides:", v21, 2, v23, &unk_1E8540C38);

    -[PHADataset inputName](self, "inputName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    v31[0] = v15;
    -[PHADataset labelName](self, "labelName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v26;
    v31[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v27;
}

- (unint64_t)numberOfDataPoints
{
  void *v2;
  unint64_t v3;

  -[PHADataset labeledDataSamples](self, "labeledDataSamples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSArray)labeledDataSamples
{
  return self->_labeledDataSamples;
}

- (NSString)inputName
{
  return self->_inputName;
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_labeledDataSamples, 0);
}

@end
