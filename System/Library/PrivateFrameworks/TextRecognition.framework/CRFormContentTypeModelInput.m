@implementation CRFormContentTypeModelInput

- (CRFormContentTypeModelInput)initWithFieldArray:(id)a3 labelArray:(id)a4 fieldCount:(unint64_t)a5 labelCount:(unint64_t)a6 useFloatOnly:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  CRFormContentTypeModelInput *v15;
  CRFormContentTypeModelInput *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  MLMultiArray *length;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  MLMultiArray *v32;
  id v33;
  uint64_t v34;
  MLMultiArray *num_labels;
  objc_super v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[2];

  v7 = a7;
  v41[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CRFormContentTypeModelInput;
  v15 = -[CRFormContentTypeModelInput init](&v37, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fields, a3);
    objc_storeStrong((id *)&v16->_labels, a4);
    v17 = objc_alloc(MEMORY[0x1E0C9E970]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v7)
    {
      v41[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "initWithScalars:shape:dataType:", v20, &unk_1E993F848, 65568);
      length = v16->_length;
      v16->_length = (MLMultiArray *)v21;

      v23 = objc_alloc(MEMORY[0x1E0C9E970]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = &unk_1E993F860;
      v27 = v23;
      v28 = v25;
      v29 = 65568;
    }
    else
    {
      v39 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v17, "initWithScalars:shape:dataType:", v30, &unk_1E993F878, 131104);
      v32 = v16->_length;
      v16->_length = (MLMultiArray *)v31;

      v33 = objc_alloc(MEMORY[0x1E0C9E970]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = &unk_1E993F890;
      v27 = v33;
      v28 = v25;
      v29 = 131104;
    }
    v34 = objc_msgSend(v27, "initWithScalars:shape:dataType:", v28, v26, v29);
    num_labels = v16->_num_labels;
    v16->_num_labels = (MLMultiArray *)v34;

  }
  return v16;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993F8A8);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("fields")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[CRFormContentTypeModelInput fields](self, "fields");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("labels")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[CRFormContentTypeModelInput labels](self, "labels");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("length")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[CRFormContentTypeModelInput length](self, "length");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("num_labels")))
    {
      v8 = 0;
      goto LABEL_10;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[CRFormContentTypeModelInput num_labels](self, "num_labels");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v8;
}

- (MLMultiArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
  objc_storeStrong((id *)&self->_fields, a3);
}

- (MLMultiArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (MLMultiArray)length
{
  return self->_length;
}

- (void)setLength:(id)a3
{
  objc_storeStrong((id *)&self->_length, a3);
}

- (MLMultiArray)num_labels
{
  return self->_num_labels;
}

- (void)setNum_labels:(id)a3
{
  objc_storeStrong((id *)&self->_num_labels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_num_labels, 0);
  objc_storeStrong((id *)&self->_length, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_fields, 0);
}

@end
