@implementation PMLEspressoTrainingVariables

- (PMLEspressoTrainingVariables)initWithTrainingNetworkPath:(id)a3 inputName:(id)a4 inputDim:(unint64_t)a5 outputName:(id)a6 trueLabelName:(id)a7 lossValueName:(id)a8 trainingOutputName:(id)a9 trainingControlVariableName:(id)a10 initializerName:(id)a11 globalsToGetGradientsFor:(id)a12 layerWeightsToGetGradientsFor:(id)a13 layerBiasesToGetGradientsFor:(id)a14
{
  id v18;
  id v19;
  PMLEspressoTrainingVariables *v20;
  void *v21;
  void *v22;
  char v23;
  PMLEspressoTrainingVariables *v24;
  NSObject *v25;
  void *v27;
  id v28;
  id v30;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v30 = a4;
  v18 = a4;
  v32 = a6;
  v19 = a6;
  v33 = a7;
  v43 = a7;
  v42 = a8;
  v41 = a9;
  v40 = a10;
  v39 = a11;
  v38 = a12;
  v37 = a13;
  v36 = a14;
  v45.receiver = self;
  v45.super_class = (Class)PMLEspressoTrainingVariables;
  v20 = -[PMLEspressoTrainingVariables init](&v45, sel_init);
  if (!v20)
    goto LABEL_4;
  v28 = v19;
  v35 = v18;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isReadableFileAtPath:", v22);

  if ((v23 & 1) != 0)
  {
    v20->_initializedWithNSData = 0;
    objc_storeStrong((id *)&v20->_trainingNetworkPath, a3);
    objc_storeStrong((id *)&v20->_inputName, v30);
    v20->_inputDim = a5;
    objc_storeStrong((id *)&v20->_outputName, v32);
    objc_storeStrong((id *)&v20->_trueLabelName, v33);
    objc_storeStrong((id *)&v20->_lossValueName, a8);
    objc_storeStrong((id *)&v20->_trainingOutputName, a9);
    objc_storeStrong((id *)&v20->_trainingControlVariableName, a10);
    objc_storeStrong((id *)&v20->_initializerName, a11);
    objc_storeStrong((id *)&v20->_globalsToGetGradientsFor, a12);
    objc_storeStrong((id *)&v20->_layerWeightsToGetGradientsFor, a13);
    objc_storeStrong((id *)&v20->_layerBiasesToGetGradientsFor, a14);
    v18 = v35;
    v19 = v28;
LABEL_4:
    v24 = v20;
    goto LABEL_8;
  }
  PML_LogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v44, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v47 = v27;
    _os_log_error_impl(&dword_2159BB000, v25, OS_LOG_TYPE_ERROR, "Unable to read Espresso network file at: %@", buf, 0xCu);

  }
  v24 = 0;
  v18 = v35;
  v19 = v28;
LABEL_8:

  return v24;
}

- (BOOL)isEqualToEspressoTrainingVariables:(id)a3
{
  id *v4;
  NSString *inputName;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  unint64_t inputDim;
  NSString *outputName;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *trueLabelName;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSString *lossValueName;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  NSString *trainingOutputName;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  char v30;
  NSString *trainingControlVariableName;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  char v35;
  NSString *initializerName;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  char v40;
  NSArray *layerWeightsToGetGradientsFor;
  NSArray *v42;
  NSArray *v43;
  NSArray *v44;
  char v45;
  NSArray *layerBiasesToGetGradientsFor;
  NSArray *v47;
  NSArray *v48;
  NSArray *v49;
  char v50;
  char v51;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;

  v4 = (id *)a3;
  inputName = self->_inputName;
  v6 = (NSString *)v4[3];
  if (inputName == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = inputName;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_36;
  }
  inputDim = self->_inputDim;
  if (inputDim != objc_msgSend(v4, "inputDim"))
  {
LABEL_36:
    v51 = 0;
    goto LABEL_37;
  }
  outputName = self->_outputName;
  v12 = (NSString *)v4[5];
  if (outputName == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = outputName;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_36;
  }
  trueLabelName = self->_trueLabelName;
  v17 = (NSString *)v4[6];
  if (trueLabelName == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = trueLabelName;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_36;
  }
  lossValueName = self->_lossValueName;
  v22 = (NSString *)v4[7];
  if (lossValueName == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = lossValueName;
    v25 = -[NSString isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_36;
  }
  trainingOutputName = self->_trainingOutputName;
  v27 = (NSString *)v4[8];
  if (trainingOutputName == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = trainingOutputName;
    v30 = -[NSString isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_36;
  }
  trainingControlVariableName = self->_trainingControlVariableName;
  v32 = (NSString *)v4[9];
  if (trainingControlVariableName == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = trainingControlVariableName;
    v35 = -[NSString isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
      goto LABEL_36;
  }
  initializerName = self->_initializerName;
  v37 = (NSString *)v4[10];
  if (initializerName == v37)
  {

  }
  else
  {
    v38 = v37;
    v39 = initializerName;
    v40 = -[NSString isEqual:](v39, "isEqual:", v38);

    if ((v40 & 1) == 0)
      goto LABEL_36;
  }
  layerWeightsToGetGradientsFor = self->_layerWeightsToGetGradientsFor;
  v42 = (NSArray *)v4[12];
  if (layerWeightsToGetGradientsFor == v42)
  {

  }
  else
  {
    v43 = v42;
    v44 = layerWeightsToGetGradientsFor;
    v45 = -[NSArray isEqual:](v44, "isEqual:", v43);

    if ((v45 & 1) == 0)
      goto LABEL_36;
  }
  layerBiasesToGetGradientsFor = self->_layerBiasesToGetGradientsFor;
  v47 = (NSArray *)v4[13];
  if (layerBiasesToGetGradientsFor == v47)
  {

  }
  else
  {
    v48 = v47;
    v49 = layerBiasesToGetGradientsFor;
    v50 = -[NSArray isEqual:](v49, "isEqual:", v48);

    if ((v50 & 1) == 0)
      goto LABEL_36;
  }
  -[NSURL absoluteString](self->_trainingNetworkPath, "absoluteString");
  v53 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trainingNetworkPath");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "absoluteString");
  v55 = objc_claimAutoreleasedReturnValue();

  if (v53 | v55)
  {
    v51 = 0;
    if (v53 && v55)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v53);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v55);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v56, "isEqual:", v57);

    }
  }
  else
  {
    v51 = 1;
  }

LABEL_37:
  return v51;
}

- (BOOL)isEqual:(id)a3
{
  PMLEspressoTrainingVariables *v4;
  PMLEspressoTrainingVariables *v5;
  BOOL v6;

  v4 = (PMLEspressoTrainingVariables *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PMLEspressoTrainingVariables isEqualToEspressoTrainingVariables:](self, "isEqualToEspressoTrainingVariables:", v5);

  return v6;
}

- (id)toPlistWithChunks:(id)a3
{
  unint64_t inputDim;
  void *v5;
  NSString *outputName;
  NSString *trueLabelName;
  NSString *initializerName;
  __int128 v9;
  void *v10;
  _QWORD v12[11];
  _QWORD v13[4];
  __int128 v14;
  NSString *trainingControlVariableName;
  NSString *v16;
  __int128 v17;
  NSArray *layerBiasesToGetGradientsFor;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  inputDim = self->_inputDim;
  v13[0] = self->_inputName;
  v12[0] = CFSTR("PML_ESPRESSO_INPUT_NAME");
  v12[1] = CFSTR("PML_ESPRESSO_INPUT_DIM");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", inputDim);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  outputName = self->_outputName;
  trueLabelName = self->_trueLabelName;
  v13[1] = v5;
  v13[2] = outputName;
  v12[2] = CFSTR("PML_ESPRESSO_OUTPUT_NAME");
  v12[3] = CFSTR("PML_ESPRESSO_TRUE_LABEL_NAME");
  v13[3] = trueLabelName;
  v14 = *(_OWORD *)&self->_lossValueName;
  v12[4] = CFSTR("PML_ESPRESSO_LOSS_VALUE_NAME");
  v12[5] = CFSTR("PML_ESPRESSO_TRAINING_OUTPUT_NAME");
  v12[6] = CFSTR("PML_ESPRESSO_TRAINING_CONTROL_VARIABLE_NAME");
  v12[7] = CFSTR("PML_ESPRESSO_INITIALIZER_NAME");
  initializerName = self->_initializerName;
  trainingControlVariableName = self->_trainingControlVariableName;
  v16 = initializerName;
  v9 = *(_OWORD *)&self->_globalsToGetGradientsFor;
  v12[8] = CFSTR("PML_ESPRESSO_GLOBALS_TO_GET_GRADIENTS_FOR");
  v12[9] = CFSTR("PML_ESPRESSO_LAYER_WEIGHTS_TO_GET_GRADIENTS_FOR");
  v17 = v9;
  v12[10] = CFSTR("PML_ESPRESSO_LAYER_BIASES_TO_GET_GRADIENTS_FOR");
  layerBiasesToGetGradientsFor = self->_layerBiasesToGetGradientsFor;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PMLEspressoTrainingVariables)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PMLEspressoTrainingVariables *v26;
  void *v27;
  void *v28;
  void *v29;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_TRAINING_NETWORK_PATH"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PMLEspressoTrainingVariables.m"), 130, CFSTR("Can't instantiate %@. Missing \"%@\" dependency."), v22, CFSTR("PML_ESPRESSO_TRAINING_NETWORK_PATH"));

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_TRAINING_NETWORK_PATH"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_INPUT_NAME"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_INPUT_DIM"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v29, "unsignedIntegerValue");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_OUTPUT_NAME"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_TRUE_LABEL_NAME"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_LOSS_VALUE_NAME"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_TRAINING_OUTPUT_NAME"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_TRAINING_CONTROL_VARIABLE_NAME"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_INITIALIZER_NAME"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_GLOBALS_TO_GET_GRADIENTS_FOR"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_LAYER_WEIGHTS_TO_GET_GRADIENTS_FOR"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PML_ESPRESSO_LAYER_BIASES_TO_GET_GRADIENTS_FOR"));
  v28 = v8;
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[PMLEspressoTrainingVariables initWithTrainingNetworkPath:inputName:inputDim:outputName:trueLabelName:lossValueName:trainingOutputName:trainingControlVariableName:initializerName:globalsToGetGradientsFor:layerWeightsToGetGradientsFor:layerBiasesToGetGradientsFor:](self, "initWithTrainingNetworkPath:inputName:inputDim:outputName:trueLabelName:lossValueName:trainingOutputName:trainingControlVariableName:initializerName:globalsToGetGradientsFor:layerWeightsToGetGradientsFor:layerBiasesToGetGradientsFor:", v11, v12, v13, v27, v25, v24, v23, v14, v15, v16, v17, v18);
  return v26;
}

- (NSURL)trainingNetworkPath
{
  return self->_trainingNetworkPath;
}

- (NSString)inputName
{
  return self->_inputName;
}

- (unint64_t)inputDim
{
  return self->_inputDim;
}

- (NSString)outputName
{
  return self->_outputName;
}

- (NSString)trueLabelName
{
  return self->_trueLabelName;
}

- (NSString)lossValueName
{
  return self->_lossValueName;
}

- (NSString)trainingOutputName
{
  return self->_trainingOutputName;
}

- (NSString)trainingControlVariableName
{
  return self->_trainingControlVariableName;
}

- (NSString)initializerName
{
  return self->_initializerName;
}

- (NSArray)globalsToGetGradientsFor
{
  return self->_globalsToGetGradientsFor;
}

- (NSArray)layerWeightsToGetGradientsFor
{
  return self->_layerWeightsToGetGradientsFor;
}

- (NSArray)layerBiasesToGetGradientsFor
{
  return self->_layerBiasesToGetGradientsFor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerBiasesToGetGradientsFor, 0);
  objc_storeStrong((id *)&self->_layerWeightsToGetGradientsFor, 0);
  objc_storeStrong((id *)&self->_globalsToGetGradientsFor, 0);
  objc_storeStrong((id *)&self->_initializerName, 0);
  objc_storeStrong((id *)&self->_trainingControlVariableName, 0);
  objc_storeStrong((id *)&self->_trainingOutputName, 0);
  objc_storeStrong((id *)&self->_lossValueName, 0);
  objc_storeStrong((id *)&self->_trueLabelName, 0);
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_trainingNetworkPath, 0);
}

@end
