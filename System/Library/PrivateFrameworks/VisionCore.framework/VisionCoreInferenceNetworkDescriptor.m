@implementation VisionCoreInferenceNetworkDescriptor

- (NSURL)URL
{
  return self->_url;
}

+ (id)URLForEspressoModelNamed:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("espresso"));

    if (v9)
    {
      objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("net"));
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    objc_msgSend(a1, "URLForResourceNamed:error:", v7, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", CFSTR("model name must be provided"));
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (VisionCoreImageTensorDescriptor)onlyInputImage
{
  void *v2;
  void *v3;

  -[VisionCoreInferenceNetworkDescriptor allInputImages](self, "allInputImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (VisionCoreImageTensorDescriptor *)v3;
}

- (NSArray)allInputImages
{
  return -[NSDictionary allValues](self->_inputImages, "allValues");
}

- (VisionCoreInferenceNetworkDescriptor)initWithURL:(id)a3 specifier:(id)a4 networkHeadVersions:(id)a5 inputs:(id)a6 outputs:(id)a7 inputImages:(id)a8 confidencesOutput:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  VisionCoreInferenceNetworkDescriptor *v22;
  VisionCoreInferenceNetworkDescriptor *v23;
  VisionCoreInferenceNetworkDescriptor *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSDictionary *inputs;
  void *v30;
  uint64_t v31;
  NSDictionary *outputs;
  void *v33;
  uint64_t v34;
  NSDictionary *inputImages;
  uint64_t v36;
  VisionCoreTensorDescriptor *confidencesOutput;
  id v39;
  objc_super v40;

  v39 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v40.receiver = self;
  v40.super_class = (Class)VisionCoreInferenceNetworkDescriptor;
  v22 = -[VisionCoreProcessingDescriptor initWithSpecifier:](&v40, sel_initWithSpecifier_, v16);
  v23 = v22;
  v24 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_url, a3);
    v25 = objc_msgSend(v17, "count");
    if (v25)
      v26 = (void *)objc_msgSend(v17, "copy");
    else
      v26 = 0;
    objc_storeStrong((id *)&v23->_networkHeadVersions, v26);
    if (v25)

    _dictionaryOfTensorDescriptors(v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    inputs = v24->_inputs;
    v24->_inputs = (NSDictionary *)v28;

    _dictionaryOfTensorDescriptors(v19);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    outputs = v24->_outputs;
    v24->_outputs = (NSDictionary *)v31;

    _dictionaryOfTensorDescriptors(v20);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    inputImages = v24->_inputImages;
    v24->_inputImages = (NSDictionary *)v34;

    v36 = objc_msgSend(v21, "copy");
    confidencesOutput = v24->_confidencesOutput;
    v24->_confidencesOutput = (VisionCoreTensorDescriptor *)v36;

  }
  return v24;
}

- (VisionCoreInferenceNetworkDescriptor)initWithURL:(id)a3 specifier:(id)a4 networkHeadVersions:(id)a5 inputImage:(id)a6 outputs:(id)a7 confidencesOutput:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  VisionCoreInferenceNetworkDescriptor *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v23[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[VisionCoreInferenceNetworkDescriptor initWithURL:specifier:networkHeadVersions:inputs:outputs:inputImages:confidencesOutput:](self, "initWithURL:specifier:networkHeadVersions:inputs:outputs:inputImages:confidencesOutput:", v14, v15, v16, v20, v18, v20, v19);

  return v21;
}

- (NSArray)allInputs
{
  return -[NSDictionary allValues](self->_inputs, "allValues");
}

- (NSArray)allInputNames
{
  return -[NSDictionary allKeys](self->_inputs, "allKeys");
}

- (NSArray)allOutputs
{
  return -[NSDictionary allValues](self->_outputs, "allValues");
}

- (NSArray)allOutputNames
{
  return -[NSDictionary allKeys](self->_outputs, "allKeys");
}

- (id)confidencesOutputOfClass:(Class)a3 error:(id *)a4
{
  void *v6;
  id v7;

  -[VisionCoreInferenceNetworkDescriptor confidencesOutput](self, "confidencesOutput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[VisionCoreValidationUtilities validateObject:isKindOfClass:basedOnClass:error:](VisionCoreValidationUtilities, "validateObject:isKindOfClass:basedOnClass:error:", v6, a3, objc_opt_class(), a4))
  {
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (VisionCoreTensorDescriptor)featureprintOutput
{
  return 0;
}

- (id)versionOfNetworkHead:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  -[NSDictionary objectForKey:](self->_networkHeadVersions, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network does not have head with identifier \"%@\"), v6);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)inputNamed:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  -[NSDictionary objectForKey:](self->_inputs, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network does not have input \"%@\"), v6);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)inputOfClass:(Class)a3 named:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;

  -[VisionCoreInferenceNetworkDescriptor inputNamed:error:](self, "inputNamed:error:", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && +[VisionCoreValidationUtilities validateObject:isKindOfClass:basedOnClass:error:](VisionCoreValidationUtilities, "validateObject:isKindOfClass:basedOnClass:error:", v7, a3, objc_opt_class(), a5))
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)outputNamed:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  -[NSDictionary objectForKey:](self->_outputs, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Network does not have output \"%@\"), v6);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)outputOfClass:(Class)a3 named:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;

  -[VisionCoreInferenceNetworkDescriptor outputNamed:error:](self, "outputNamed:error:", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && +[VisionCoreValidationUtilities validateObject:isKindOfClass:basedOnClass:error:](VisionCoreValidationUtilities, "validateObject:isKindOfClass:basedOnClass:error:", v7, a3, objc_opt_class(), a5))
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VisionCoreInferenceNetworkDescriptor;
  v3 = -[VisionCoreProcessingDescriptor hash](&v7, sel_hash);
  -[VisionCoreInferenceNetworkDescriptor URL](self, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreInferenceNetworkDescriptor *v4;
  VisionCoreInferenceNetworkDescriptor *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  NSDictionary *networkHeadVersions;
  NSDictionary *inputs;
  NSDictionary *inputImages;
  NSDictionary *outputs;
  void *v16;
  void *v17;
  char v18;

  v4 = (VisionCoreInferenceNetworkDescriptor *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VisionCoreProcessingDescriptor version](self, "version");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreProcessingDescriptor version](v5, "version");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToResourceVersion:", v7);

      if ((v8 & 1) == 0)
        goto LABEL_17;
      -[VisionCoreInferenceNetworkDescriptor URL](self, "URL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreInferenceNetworkDescriptor URL](v5, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if ((v11 & 1) == 0)
        goto LABEL_17;
      networkHeadVersions = self->_networkHeadVersions;
      if (networkHeadVersions != v5->_networkHeadVersions
        && !-[NSDictionary isEqual:](networkHeadVersions, "isEqual:"))
      {
        goto LABEL_17;
      }
      if (((inputs = self->_inputs, inputs == v5->_inputs) || -[NSDictionary isEqual:](inputs, "isEqual:"))&& ((inputImages = self->_inputImages, inputImages == v5->_inputImages)|| -[NSDictionary isEqual:](inputImages, "isEqual:"))&& ((outputs = self->_outputs, outputs == v5->_outputs)|| -[NSDictionary isEqual:](outputs, "isEqual:")))
      {
        -[VisionCoreInferenceNetworkDescriptor confidencesOutput](self, "confidencesOutput");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VisionCoreInferenceNetworkDescriptor confidencesOutput](v5, "confidencesOutput");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 == v17)
          v18 = 1;
        else
          v18 = objc_msgSend(v16, "isEqual:", v17);

      }
      else
      {
LABEL_17:
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *networkHeadVersions;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v16.receiver = self;
  v16.super_class = (Class)VisionCoreInferenceNetworkDescriptor;
  -[VisionCoreProcessingDescriptor description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreInferenceNetworkDescriptor URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@"), v4, v6);

  networkHeadVersions = self->_networkHeadVersions;
  if (networkHeadVersions)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __51__VisionCoreInferenceNetworkDescriptor_description__block_invoke;
    v14[3] = &unk_24E1DB7D8;
    v15 = v7;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](networkHeadVersions, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
  -[VisionCoreInferenceNetworkDescriptor allInputs](self, "allInputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n       "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\n   --> %@"), v10);

  }
  -[VisionCoreInferenceNetworkDescriptor allOutputs](self, "allOutputs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n       "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\n   <-- %@"), v12);

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *networkHeadVersions;
  id v11;

  v11 = a3;
  -[VisionCoreProcessingDescriptor specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("specifier"));

  -[VisionCoreInferenceNetworkDescriptor URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("URL"));

  -[VisionCoreInferenceNetworkDescriptor allInputs](self, "allInputs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("inputs"));

  -[VisionCoreInferenceNetworkDescriptor allOutputs](self, "allOutputs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("outputs"));

  -[VisionCoreInferenceNetworkDescriptor allInputImages](self, "allInputImages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("inputImages"));

  -[VisionCoreInferenceNetworkDescriptor confidencesOutput](self, "confidencesOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("confidencesOutput"));

  networkHeadVersions = self->_networkHeadVersions;
  if (networkHeadVersions)
    objc_msgSend(v11, "encodeObject:forKey:", networkHeadVersions, CFSTR("networkHeadVersions"));

}

- (VisionCoreInferenceNetworkDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  VisionCoreInferenceNetworkDescriptor *v19;
  void *v21;
  id v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("specifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_opt_class();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("confidencesOutput"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), v7, 0);
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("inputs"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("outputs"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v22 = v10;
          v11 = objc_alloc(MEMORY[0x24BDBCF20]);
          v12 = objc_opt_class();
          v21 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), 0);
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("inputImages"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            if (objc_msgSend(v4, "containsValueForKey:", CFSTR("networkHeadVersions")))
            {
              v14 = objc_alloc(MEMORY[0x24BDBCF20]);
              v15 = objc_opt_class();
              v16 = objc_opt_class();
              v17 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, objc_opt_class(), 0);
              objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("networkHeadVersions"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v18 = 0;
            }
            self = -[VisionCoreInferenceNetworkDescriptor initWithURL:specifier:networkHeadVersions:inputs:outputs:inputImages:confidencesOutput:](self, "initWithURL:specifier:networkHeadVersions:inputs:outputs:inputImages:confidencesOutput:", v6, v5, v18, v9, v22, v13, v23);

            v19 = self;
          }
          else
          {
            v19 = 0;
          }

          v10 = v22;
        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSDictionary)outputs
{
  return self->_outputs;
}

- (VisionCoreTensorDescriptor)confidencesOutput
{
  return self->_confidencesOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidencesOutput, 0);
  objc_storeStrong((id *)&self->_inputImages, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_networkHeadVersions, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

uint64_t __51__VisionCoreInferenceNetworkDescriptor_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n   (%@ %@)"), a2, a3);
}

+ (id)availableIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  id v13;

  +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((id)objc_opt_class() != a1)
  {
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __60__VisionCoreInferenceNetworkDescriptor_availableIdentifiers__block_invoke;
    v11 = &unk_24E1DB788;
    v12 = v3;
    v13 = a1;
    objc_msgSend(v4, "indexesOfObjectsPassingTest:", &v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v5, v8, v9, v10, v11);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }

  return v4;
}

+ (id)availableVersionsForIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VisionCoreResourceVersion newerFirstComparator](VisionCoreResourceVersion, "newerFirstComparator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingComparator:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnknownProcessingDescriptorIdentifier:", v5);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)descriptorsForIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[VisionCoreResourceVersion newerFirstComparator](VisionCoreResourceVersion, "newerFirstComparator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__VisionCoreInferenceNetworkDescriptor_descriptorsForIdentifier_error___block_invoke;
    v13[3] = &unk_24E1DB7B0;
    v14 = v8;
    v9 = v8;
    objc_msgSend(v7, "sortedArrayWithOptions:usingComparator:", 16, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnknownProcessingDescriptorIdentifier:", v5);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "version");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToResourceVersion:", v7);

          if ((v16 & 1) != 0)
          {
            v18 = v14;

            goto LABEL_16;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

    if (a5)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("no inference network for %@ %@"), v6, v7);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  if (!a5)
  {
LABEL_15:
    v18 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnknownProcessingDescriptorIdentifier:", v6);
  v18 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_registeredNetworkDescriptors
{
  objc_opt_self();
  if (+[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::onceToken != -1)
    dispatch_once(&+[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::onceToken, &__block_literal_global_321);
  return (id)+[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::ourDescriptors;
}

void __69__VisionCoreInferenceNetworkDescriptor__registeredNetworkDescriptors__block_invoke()
{
  objc_class *v0;
  void *v1;
  objc_class *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("VisionCoreInferenceNetworkIdentifierSceneNet");
  v0 = (objc_class *)objc_opt_class();
  _obtainDescriptors(v0, (objc_selector *)sel_sceneNetV3AndReturnError_, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v12[1] = CFSTR("VisionCoreInferenceNetworkIdentifierSceneNetObjDetNetSliderNet");
  v2 = (objc_class *)objc_opt_class();
  _obtainDescriptors(v2, (objc_selector *)sel_sceneNetObjDetNetSliderNetV3AndReturnError_, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = CFSTR("VisionCoreInferenceNetworkIdentifierSmartCam");
  v4 = (objc_class *)objc_opt_class();
  _obtainDescriptors(v4, (objc_selector *)sel_descriptorAndReturnError_, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("VisionCoreInferenceNetworkIdentifierFaceprint");
  v6 = (objc_class *)objc_opt_class();
  _obtainDescriptors(v6, (objc_selector *)sel_FPrev3_1FArev1_3_MD2AndReturnError_, sel_FPrev4_0FArev1_4_MD2AndReturnError_, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = CFSTR("VisionCoreInferenceNetworkIdentifierCamGaze");
  v8 = (objc_class *)objc_opt_class();
  _obtainDescriptors(v8, (objc_selector *)sel_camGazeV2AndReturnError_, sel_camGazeV1AndReturnError_, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)+[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::ourDescriptors;
  +[VisionCoreInferenceNetworkDescriptor _registeredNetworkDescriptors]::ourDescriptors = v10;

}

uint64_t __71__VisionCoreInferenceNetworkDescriptor_descriptorsForIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(uint64_t (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  return v9;
}

uint64_t __60__VisionCoreInferenceNetworkDescriptor_availableIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 0;
LABEL_11:

  return v6;
}

@end
