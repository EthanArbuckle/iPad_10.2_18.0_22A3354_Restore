@implementation VisionCoreE5RTInferenceFunctionDescriptor

- (VisionCoreE5RTInferenceFunctionDescriptor)initWithFunction:(id)a3 inputDescriptors:(id)a4 inputImageDescriptors:(id)a5 outputDescriptors:(id)a6 confidencesOutputDescriptors:(id)a7 networkVersion:(id)a8
{
  VisionCoreE5RTFunction *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  VisionCoreProcessingDescriptorSpecifier *v24;
  void *v25;
  VisionCoreE5RTInferenceFunctionDescriptor *v26;
  VisionCoreE5RTFunction *function;
  VisionCoreE5RTFunction *v28;
  VisionCoreProcessingDescriptorSpecifier *specifier;
  objc_super v32;

  v13 = (VisionCoreE5RTFunction *)a3;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  -[VisionCoreE5RTFunction programLibrary](v13, "programLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v19, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreE5RTFunction name](v13, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@:%@"), v21, v22);

  v24 = -[VisionCoreProcessingDescriptorSpecifier initWithIdentifier:version:]([VisionCoreProcessingDescriptorSpecifier alloc], "initWithIdentifier:version:", v23, v14);
  objc_msgSend(v19, "URL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)VisionCoreE5RTInferenceFunctionDescriptor;
  v26 = -[VisionCoreInferenceNetworkDescriptor initWithURL:specifier:networkHeadVersions:inputs:outputs:inputImages:confidencesOutput:](&v32, sel_initWithURL_specifier_networkHeadVersions_inputs_outputs_inputImages_confidencesOutput_, v25, v24, 0, v18, v16, v17, v15);

  function = v26->_function;
  v26->_function = v13;
  v28 = v13;

  specifier = v26->_specifier;
  v26->_specifier = v24;

  return v26;
}

- (VisionCoreE5RTFunction)function
{
  return self->_function;
}

- (void)setFunction:(id)a3
{
  objc_storeStrong((id *)&self->_function, a3);
}

- (VisionCoreProcessingDescriptorSpecifier)specifier
{
  return self->_specifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_function, 0);
}

+ (id)descriptorForProgramLibraryName:(id)a3 functionName:(id)a4 inputImageName:(id)a5 outputNames:(id)a6 confidencesOutputName:(id)a7 labelsFileName:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(a1, "URLForResourceNamed:error:", a3, a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[VisionCoreE5RTProgramLibrary programLibraryForURL:error:](VisionCoreE5RTProgramLibrary, "programLibraryForURL:error:", v20, a9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(a1, "descriptorForProgramLibrary:functionName:inputImageName:outputNames:confidencesOutputName:labelsFileName:error:", v21, v15, v16, v17, v18, v19, a9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)descriptorForProgramLibrary:(id)a3 functionName:(id)a4 inputImageName:(id)a5 outputNames:(id)a6 confidencesOutputName:(id)a7 labelsFileName:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(v15, "functionNamed:error:", a4, a9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(a1, "networkVersionForProgramLibrary:function:", v15, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "descriptorOfClass:forInput:error:", objc_opt_class(), v16, a9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22
      || (objc_msgSend(v20, "descriptorsForOutputs:error:", v17, a9), (v23 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v40 = (void *)v23;
    if (v18)
    {
      objc_msgSend(v20, "descriptorForOutput:error:", v18, a9);
      v24 = objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v27 = 0;
        goto LABEL_17;
      }
      v25 = (void *)v24;
      if (v19)
      {
        v38 = (void *)v24;
        objc_msgSend(a1, "URLForResourceNamed:error:", v19, a9);
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          v27 = 0;
          v32 = v38;
          goto LABEL_15;
        }
        v34 = (void *)v26;
        objc_msgSend(v38, "confidencesDescriptorWithLabelsFileURL:error:", v26, a9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = v27;
        if (!v27)
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      v39 = v25;
      v36 = v19;
      v37 = v21;
      v35 = v17;
      if ((objc_msgSend(v40, "containsObject:") & 1) == 0)
      {
        objc_msgSend(v40, "arrayByAddingObject:", v39);
        v28 = objc_claimAutoreleasedReturnValue();

        v40 = (void *)v28;
      }
    }
    else
    {
      v35 = v17;
      v36 = v19;
      v37 = v21;
      v39 = 0;
    }
    v29 = objc_alloc((Class)a1);
    v42[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v37;
    v27 = (void *)objc_msgSend(v29, "initWithFunction:inputDescriptors:inputImageDescriptors:outputDescriptors:confidencesOutputDescriptors:networkVersion:", v20, v30, v31, v40, v39, v37);

    v32 = v39;
    v17 = v35;
    v19 = v36;
LABEL_15:

    goto LABEL_17;
  }
  v27 = 0;
LABEL_19:

  return v27;
}

+ (id)networkVersionForProgramLibrary:(id)a3 function:(id)a4
{
  id v4;
  VisionCoreResourceVersion *v5;
  void *v6;
  void *v7;
  VisionCoreResourceVersion *v8;
  VisionCoreResourceVersion *v9;

  v4 = a4;
  v5 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 1, 0, 0);
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("UserVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[VisionCoreResourceVersion versionForStringRepresentation:](VisionCoreResourceVersion, "versionForStringRepresentation:", v7);
      v8 = (VisionCoreResourceVersion *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
    v9 = v8;

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

@end
