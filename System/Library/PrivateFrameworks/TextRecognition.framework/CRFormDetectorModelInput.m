@implementation CRFormDetectorModelInput

- (CRFormDetectorModelInput)initWithMLMultiArray:(id)a3
{
  id v5;
  CRFormDetectorModelInput *v6;
  CRFormDetectorModelInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRFormDetectorModelInput;
  v6 = -[CRFormDetectorModelInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_array, a3);

  return v7;
}

- (NSSet)featureNames
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("img_input");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (id)featureValueForName:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("img_input")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", self->_array);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MLMultiArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
{
  objc_storeStrong((id *)&self->_array, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
