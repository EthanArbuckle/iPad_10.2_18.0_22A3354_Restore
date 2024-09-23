@implementation UPModelBundle

- (UPModelBundle)initWithPreprocessor:(id)a3 parserModel:(id)a4 calibrationModel:(id)a5
{
  id v9;
  id v10;
  id v11;
  UPModelBundle *v12;
  UPModelBundle *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)UPModelBundle;
  v12 = -[UPModelBundle init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preprocessor, a3);
    objc_storeStrong((id *)&v13->_parserModel, a4);
    objc_storeStrong((id *)&v13->_calibrationModel, a5);
  }

  return v13;
}

- (UPModelBundle)initWithLoadedModelConfiguration:(id)a3 parserModel:(id)a4 calibrationModel:(id)a5
{
  id v8;
  id v9;
  void *v10;
  UPModelBundle *v11;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "preprocessor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UPModelBundle initWithPreprocessor:parserModel:calibrationModel:](self, "initWithPreprocessor:parserModel:calibrationModel:", v10, v8, v9);

  return v11;
}

- (UPParserModel)parserModel
{
  return self->_parserModel;
}

- (UPCalibrationModel)calibrationModel
{
  return self->_calibrationModel;
}

- (UPPreprocessor)preprocessor
{
  return self->_preprocessor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_calibrationModel, 0);
  objc_storeStrong((id *)&self->_parserModel, 0);
}

@end
