@implementation VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)initWithModelFileURL:(id)a3 labelsFileURL:(id)a4 inputBlobName:(id)a5 outputBlobName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *v15;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *v16;
  uint64_t v17;
  NSString *inputBlobName;
  uint64_t v19;
  NSString *outputBlobName;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor;
  v15 = -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modelFileURL, a3);
    objc_storeStrong((id *)&v16->_labelsFileURL, a4);
    v17 = objc_msgSend(v13, "copy");
    inputBlobName = v16->_inputBlobName;
    v16->_inputBlobName = (NSString *)v17;

    v19 = objc_msgSend(v14, "copy");
    outputBlobName = v16->_outputBlobName;
    v16->_outputBlobName = (NSString *)v19;

  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *v4;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;

  v4 = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)a3;
  if (v4 == self)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor modelFileURL](self, "modelFileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor modelFileURL](v5, "modelFileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (!v8)
        goto LABEL_9;
      -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor labelsFileURL](self, "labelsFileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor labelsFileURL](v5, "labelsFileURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
      -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor inputBlobName](self, "inputBlobName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor inputBlobName](v5, "inputBlobName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v14)
      {
        -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor outputBlobName](self, "outputBlobName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor outputBlobName](v5, "outputBlobName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

      }
      else
      {
LABEL_9:
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *modelFileURL;
  id v5;

  modelFileURL = self->_modelFileURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modelFileURL, CFSTR("modelFileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labelsFileURL, CFSTR("labelsFileURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inputBlobName, CFSTR("inputBlobName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_outputBlobName, CFSTR("outputBlobName"));

}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *v11;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("modelFileURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("labelsFileURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("inputBlobName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("outputBlobName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor initWithModelFileURL:labelsFileURL:inputBlobName:outputBlobName:](self, "initWithModelFileURL:labelsFileURL:inputBlobName:outputBlobName:", v6, v7, v9, v10);
  return v11;
}

- (NSURL)modelFileURL
{
  return self->_modelFileURL;
}

- (NSURL)labelsFileURL
{
  return self->_labelsFileURL;
}

- (NSString)inputBlobName
{
  return self->_inputBlobName;
}

- (NSString)outputBlobName
{
  return self->_outputBlobName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBlobName, 0);
  objc_storeStrong((id *)&self->_inputBlobName, 0);
  objc_storeStrong((id *)&self->_labelsFileURL, 0);
  objc_storeStrong((id *)&self->_modelFileURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
