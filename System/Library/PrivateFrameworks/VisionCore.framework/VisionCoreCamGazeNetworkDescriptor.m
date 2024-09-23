@implementation VisionCoreCamGazeNetworkDescriptor

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VisionCoreCamGazeNetworkDescriptor;
  v4 = a3;
  -[VisionCoreInferenceNetworkDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_gazeProbabilitiesOutput, CFSTR("gazeProbabilitiesOutput"), v5.receiver, v5.super_class);

}

- (VisionCoreCamGazeNetworkDescriptor)initWithCoder:(id)a3
{
  id v4;
  VisionCoreCamGazeNetworkDescriptor *v5;
  uint64_t v6;
  VisionCoreTensorDescriptor *gazeProbabilitiesOutput;
  VisionCoreTensorDescriptor *v8;
  uint64_t v9;
  id v10;
  VisionCoreCamGazeClassifier *gazeClassifier;
  VisionCoreCamGazeNetworkDescriptor *v12;
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VisionCoreCamGazeNetworkDescriptor;
  v5 = -[VisionCoreInferenceNetworkDescriptor initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gazeProbabilitiesOutput"));
  v6 = objc_claimAutoreleasedReturnValue();
  gazeProbabilitiesOutput = v5->_gazeProbabilitiesOutput;
  v5->_gazeProbabilitiesOutput = (VisionCoreTensorDescriptor *)v6;

  v8 = v5->_gazeProbabilitiesOutput;
  if (!v8)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v14 = 0;
  +[_VisionCoreCamGazeClassifier classifierForGazeProbabilitiesOutputDescriptor:error:]((uint64_t)_VisionCoreCamGazeClassifier, v8, &v14);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v14;
  gazeClassifier = v5->_gazeClassifier;
  v5->_gazeClassifier = (VisionCoreCamGazeClassifier *)v9;

  if (!v5->_gazeClassifier)
  {
    objc_msgSend(v4, "failWithError:", v10);

    goto LABEL_7;
  }

LABEL_5:
  v12 = v5;
LABEL_8:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreCamGazeNetworkDescriptor *v4;
  VisionCoreCamGazeNetworkDescriptor *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (VisionCoreCamGazeNetworkDescriptor *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)VisionCoreCamGazeNetworkDescriptor,
          -[VisionCoreInferenceNetworkDescriptor isEqual:](&v10, sel_isEqual_, v4)))
    {
      v5 = v4;
      -[VisionCoreCamGazeNetworkDescriptor gazeProbabilitiesOutput](self, "gazeProbabilitiesOutput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreCamGazeNetworkDescriptor gazeProbabilitiesOutput](v5, "gazeProbabilitiesOutput");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (VisionCoreTensorDescriptor)gazeProbabilitiesOutput
{
  return self->_gazeProbabilitiesOutput;
}

- (VisionCoreCamGazeClassifier)gazeClassifier
{
  return self->_gazeClassifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gazeClassifier, 0);
  objc_storeStrong((id *)&self->_gazeProbabilitiesOutput, 0);
}

+ (id)camGazeV1AndReturnError:(id *)a3
{
  VisionCoreResourceVersion *v5;
  void *v6;

  v5 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 1, 0, 0);
  +[VisionCoreCamGazeNetworkDescriptor _descriptorWithModelFileName:version:inputImageBlobName:pixelFormatType:probabilitiesOutputName:error:]((uint64_t)a1, CFSTR("camgaze_classification_3class_light-nxbrsq87z6_23998_BGR_opt.espresso"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)camGazeV2AndReturnError:(id *)a3
{
  VisionCoreResourceVersion *v5;
  void *v6;

  v5 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 2, 0, 0);
  +[VisionCoreCamGazeNetworkDescriptor _descriptorWithModelFileName:version:inputImageBlobName:pixelFormatType:probabilitiesOutputName:error:]((uint64_t)a1, CFSTR("camgazeflow-f334k5e5zi_91568-quant-fp16.espresso"), v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_descriptorWithModelFileName:(void *)a3 version:(_QWORD *)a4 inputImageBlobName:pixelFormatType:probabilitiesOutputName:error:
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  VisionCoreProcessingDescriptorSpecifier *v16;
  VisionCoreCamGazeNetworkDescriptor *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = CFSTR("image");
  v8 = CFSTR("camgaze_probs");
  v9 = a2;
  objc_opt_self();
  +[VisionCoreEspressoUtils URLForModelNamed:error:](VisionCoreEspressoUtils, "URLForModelNamed:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v27 = CFSTR("camgaze_probs");
    v28[0] = &unk_24E1E6098;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = 0;
    v12 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:](VisionCoreEspressoUtils, "getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:", &v26, &v25, v10, CFSTR("image"), 1111970369, v11, 0, a4);
    v13 = v26;
    v14 = v25;
    v15 = 0;
    if (v12)
    {
      v16 = -[VisionCoreProcessingDescriptorSpecifier initWithIdentifier:version:]([VisionCoreProcessingDescriptorSpecifier alloc], "initWithIdentifier:version:", CFSTR("VisionCoreInferenceNetworkIdentifierCamGaze"), v6);
      v17 = [VisionCoreCamGazeNetworkDescriptor alloc];
      objc_msgSend(v14, "allValues");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[VisionCoreInferenceNetworkDescriptor initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:](v17, "initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:", v10, v16, 0, v13, v18, 0);

      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("camgaze_probs"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(v19 + 64);
      *(_QWORD *)(v19 + 64) = v20;

      +[_VisionCoreCamGazeClassifier classifierForGazeProbabilitiesOutputDescriptor:error:]((uint64_t)_VisionCoreCamGazeClassifier, *(void **)(v19 + 64), a4);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(v19 + 72);
      *(_QWORD *)(v19 + 72) = v22;

      if (*(_QWORD *)(v19 + 72))
        v15 = (id)v19;
      else
        v15 = 0;

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
