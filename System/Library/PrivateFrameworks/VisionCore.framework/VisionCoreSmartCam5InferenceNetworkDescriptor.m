@implementation VisionCoreSmartCam5InferenceNetworkDescriptor

+ (id)descriptorAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__VisionCoreSmartCam5InferenceNetworkDescriptor_descriptorAndReturnError___block_invoke;
  v9[3] = &__block_descriptor_40_e9__16__0__8l;
  v9[4] = a1;
  v4 = (void *)MEMORY[0x2207A662C](v9, a2);
  +[VisionCoreFrameworkManager sharedManager](VisionCoreFrameworkManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inferenceNetworkDescriptorsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForIdentifier:creationBlock:error:", CFSTR("SmartCam5"), v4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __74__VisionCoreSmartCam5InferenceNetworkDescriptor_descriptorAndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  VisionCoreProcessingDescriptorSpecifier *v9;
  VisionCoreResourceVersion *v10;
  VisionCoreProcessingDescriptorSpecifier *v11;
  id v12;
  void *v13;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "URLForEspressoModelNamed:error:", CFSTR("MRC5heads_76f6w2kjaz_61501_ay5mhf87cq_97501_hbnrcg6e5e_89040_8g7zthf4q3_12751_rucb99jtq8_75751_8d9qwisndd_85501_concat_quant.espresso"), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v15 = 0;
    v16 = 0;
    v5 = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:](VisionCoreEspressoUtils, "getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:", &v16, &v15, v4, CFSTR("data"), 1111970369, &unk_24E1E6568, &unk_24E1E6590, a2);
    v6 = v16;
    v7 = v15;
    v8 = 0;
    if (v5)
    {
      v9 = [VisionCoreProcessingDescriptorSpecifier alloc];
      v10 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 5, 0, 0);
      v11 = -[VisionCoreProcessingDescriptorSpecifier initWithIdentifier:version:](v9, "initWithIdentifier:version:", CFSTR("VisionCoreInferenceNetworkIdentifierSmartCam"), v10);

      v12 = objc_alloc(*(Class *)(a1 + 32));
      objc_msgSend(v7, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v12, "initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:", v4, v11, 0, v6, v13, 0);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (VisionCoreLabeledConfidencesDescriptor)sceneLabelConfidencesOutput
{
  void *v3;
  void *v4;

  -[VisionCoreSmartCam5InferenceNetworkDescriptor sceneLabelsOutputBlobName](self, "sceneLabelsOutputBlobName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreInferenceNetworkDescriptor outputNamed:error:](self, "outputNamed:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (VisionCoreLabeledConfidencesDescriptor *)v4;
}

- (VisionCoreTensorDescriptor)segmentationLabelConfidencesOutput
{
  void *v3;
  void *v4;

  -[VisionCoreSmartCam5InferenceNetworkDescriptor sceneSegmentationOutputBlobName](self, "sceneSegmentationOutputBlobName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreInferenceNetworkDescriptor outputNamed:error:](self, "outputNamed:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (VisionCoreTensorDescriptor *)v4;
}

- (id)sceneLabelsOutputBlobName
{
  return CFSTR("leaf_semdev_text_water");
}

- (id)sceneSegmentationOutputBlobName
{
  return CFSTR("segmentation/MRC_softmax");
}

- (id)sceneLabelsFileURL
{
  void *v2;
  void *v3;

  -[VisionCoreSmartCam5InferenceNetworkDescriptor sceneLabelConfidencesOutput](self, "sceneLabelConfidencesOutput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelsFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)segmentationLabelsFileURL
{
  VisionCoreSmartCam5InferenceNetworkDescriptor *v2;
  NSURL *lazySegmentationLabelsFileURL;
  uint64_t v4;
  NSURL *v5;
  NSURL *v6;

  v2 = self;
  objc_sync_enter(v2);
  lazySegmentationLabelsFileURL = v2->_lazySegmentationLabelsFileURL;
  if (!lazySegmentationLabelsFileURL)
  {
    objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", CFSTR("smartcam_assembly-segmentation-labels.txt"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_lazySegmentationLabelsFileURL;
    v2->_lazySegmentationLabelsFileURL = (NSURL *)v4;

    lazySegmentationLabelsFileURL = v2->_lazySegmentationLabelsFileURL;
  }
  v6 = lazySegmentationLabelsFileURL;
  objc_sync_exit(v2);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazySegmentationLabelsFileURL, 0);
}

@end
