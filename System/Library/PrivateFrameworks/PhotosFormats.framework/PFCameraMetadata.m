@implementation PFCameraMetadata

- (PFCameraMetadata)initWithJunkImageClassificationObservations:(id)a3 imageAestheticsObservation:(id)a4 saliencyObservation:(id)a5 scenePrintObservation:(id)a6 detectedObjectsInfoHumanFaces:(id)a7 detectedObjectsInfoHumanBodies:(id)a8 detectedObjectsInfoCatBodies:(id)a9 detectedObjectsInfoDogBodies:(id)a10 detectedObjectsSalientObjects:(id)a11 smartCamInfo:(id)a12 stitchConfidence:(unint64_t)a13 horizonLinePresent:(BOOL)a14 horizonLineAngleInDegrees:(float)a15 captureFolderPath:(id)a16 semanticDevelopmentGatingObservations:(id)a17 faceObservations:(id)a18 torsoprints:(id)a19 foodAndDrinkObservations:(id)a20 semanticEnhanceScene:(int64_t)a21 contactIDsInProximity:(id)a22 sharedLibraryMode:(int64_t)a23
{
  id v29;
  id v30;
  id v31;
  id v32;
  PFCameraMetadata *v33;
  PFCameraMetadata *v34;
  id v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v50 = a3;
  v37 = a4;
  v49 = a4;
  v48 = a5;
  v47 = a6;
  v46 = a7;
  v45 = a8;
  v44 = a9;
  v43 = a10;
  v42 = a11;
  v29 = a12;
  v30 = a16;
  v31 = a17;
  v41 = a18;
  v40 = a19;
  v32 = a20;
  v39 = a22;
  v51.receiver = self;
  v51.super_class = (Class)PFCameraMetadata;
  v33 = -[PFCameraMetadata init](&v51, sel_init);
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_junkImageClassificationObservations, a3);
    objc_storeStrong((id *)&v34->_imageAestheticsObservation, v37);
    objc_storeStrong((id *)&v34->_detectedHumanFaces, a7);
    objc_storeStrong((id *)&v34->_detectedHumanBodies, a8);
    objc_storeStrong((id *)&v34->_detectedCatBodies, a9);
    objc_storeStrong((id *)&v34->_detectedDogBodies, a10);
    objc_storeStrong((id *)&v34->_detectedSalientObjects, a11);
    objc_storeStrong((id *)&v34->_saliencyObservation, a5);
    objc_storeStrong((id *)&v34->_scenePrintObservation, a6);
    objc_storeStrong((id *)&v34->_captureFolderPath, a16);
    objc_storeStrong((id *)&v34->_semanticDevelopmentGatingObservations, a17);
    objc_storeStrong((id *)&v34->_faceObservations, a18);
    objc_storeStrong((id *)&v34->_torsoprints, a19);
    objc_storeStrong((id *)&v34->_foodAndDrinkObservations, a20);
    objc_storeStrong((id *)&v34->_smartCamInfo, a12);
    objc_storeStrong((id *)&v34->_contactIDsInProximity, a22);
    v34->_stitchConfidence = a13;
    v34->_horizonLinePresent = a14;
    v34->_horizonLineAngleInDegrees = a15;
    v34->_semanticEnhanceScene = a21;
    v34->_sharedLibraryMode = a23;
  }

  return v34;
}

- (PFCameraMetadata)initWithSpatialOverCapturePrivateClientMetadata:(id)a3
{
  id v4;
  PFCameraMetadata *v5;
  unint64_t v6;
  int v7;
  float v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PFCameraMetadata;
  v5 = -[PFCameraMetadata init](&v10, sel_init);
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v4, "spatialOverCaptureImageStitchingConfidenceScore");
    else
      v6 = 0;
    v5->_stitchConfidence = v6;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v5->_horizonLinePresent = 0;
      v8 = 0.0;
      goto LABEL_9;
    }
    v7 = objc_msgSend(v4, "spatialOverCaptureImageHorizonLinePresent");
    v5->_horizonLinePresent = v7;
    if (v7)
    {
      objc_msgSend(v4, "spatialOverCaptureImageHorizonLineAngleInDegrees");
LABEL_9:
      v5->_horizonLineAngleInDegrees = v8;
    }
  }

  return v5;
}

- (NSData)JSONDebugDescription
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:forKey:", self->_junkImageClassificationObservations, CFSTR("junkImageClassificationObservations"));
  objc_msgSend(v3, "addObject:forKey:", self->_imageAestheticsObservation, CFSTR("imageAestheticsObservation"));
  objc_msgSend(v3, "addObject:forKey:", self->_detectedHumanFaces, CFSTR("humanFaces"));
  objc_msgSend(v3, "addObject:forKey:", self->_detectedHumanBodies, CFSTR("humanBodies"));
  objc_msgSend(v3, "addObject:forKey:", self->_detectedCatBodies, CFSTR("catBodies"));
  objc_msgSend(v3, "addObject:forKey:", self->_detectedDogBodies, CFSTR("dogBodies"));
  objc_msgSend(v3, "addObject:forKey:", self->_detectedSalientObjects, CFSTR("salientObjects"));
  objc_msgSend(v3, "addObject:forKey:", self->_saliencyObservation, CFSTR("saliencyObservation"));
  objc_msgSend(v3, "addObject:forKey:", self->_scenePrintObservation, CFSTR("scenePrintObservation"));
  objc_msgSend(v3, "addObject:forKey:", self->_captureFolderPath, CFSTR("captureFolderPath"));
  objc_msgSend(v3, "addObject:forKey:", self->_semanticDevelopmentGatingObservations, CFSTR("semanticDevelopmentGatingObservations"));
  objc_msgSend(v3, "addObject:forKey:", self->_faceObservations, CFSTR("faceObservations"));
  objc_msgSend(v3, "addObject:forKey:", self->_torsoprints, CFSTR("torsoprints"));
  objc_msgSend(v3, "addObject:forKey:", self->_foodAndDrinkObservations, CFSTR("foodAndDrinkObservations"));
  objc_msgSend(v3, "addObject:forKey:", self->_smartCamInfo, CFSTR("smartCamInfo"));
  objc_msgSend(v3, "addObject:forKey:", self->_contactIDsInProximity, CFSTR("contactIDsInProximity"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_stitchConfidence);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:forKey:", v4, CFSTR("stitchConfidence"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_horizonLinePresent);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:forKey:", v5, CFSTR("horizonLinePresent"));

  *(float *)&v6 = self->_horizonLineAngleInDegrees;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:forKey:", v7, CFSTR("horizonLineAngleInDegrees"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_semanticEnhanceScene);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:forKey:", v8, CFSTR("semanticEnhanceScene"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sharedLibraryMode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:forKey:", v9, CFSTR("sharedLibraryMode"));

  objc_msgSend(v3, "JSONDebugData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t semanticEnhanceScene;
  void *v6;
  double semanticEnhanceSceneConfidence;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  semanticEnhanceScene = self->_semanticEnhanceScene;
  v9 = a3;
  objc_msgSend(v4, "numberWithInteger:", semanticEnhanceScene);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("semanticEnhanceScene"));

  semanticEnhanceSceneConfidence = self->_semanticEnhanceSceneConfidence;
  *(float *)&semanticEnhanceSceneConfidence = semanticEnhanceSceneConfidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", semanticEnhanceSceneConfidence);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("semanticEnhanceSceneConfidence"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_foodAndDrinkObservations, CFSTR("foodBoxes"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_faceObservations, CFSTR("faceBoxes"));

}

- (PFCameraMetadata)initWithCoder:(id)a3
{
  id v4;
  PFCameraMetadata *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *foodAndDrinkObservations;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *faceObservations;

  v4 = a3;
  v5 = -[PFCameraMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("semanticEnhanceScene"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_semanticEnhanceScene = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("semanticEnhanceSceneConfidence"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v5->_semanticEnhanceSceneConfidence = v8;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, getVNRecognizedObjectObservationClass(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("foodBoxes"));
    v12 = objc_claimAutoreleasedReturnValue();
    foodAndDrinkObservations = v5->_foodAndDrinkObservations;
    v5->_foodAndDrinkObservations = (NSArray *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, getVNFaceObservationClass(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("faceBoxes"));
    v17 = objc_claimAutoreleasedReturnValue();
    faceObservations = v5->_faceObservations;
    v5->_faceObservations = (NSArray *)v17;

  }
  return v5;
}

- (NSArray)junkImageClassificationObservations
{
  return self->_junkImageClassificationObservations;
}

- (VNImageAestheticsObservation)imageAestheticsObservation
{
  return self->_imageAestheticsObservation;
}

- (VNSaliencyImageObservation)saliencyObservation
{
  return self->_saliencyObservation;
}

- (VNSceneObservation)scenePrintObservation
{
  return self->_scenePrintObservation;
}

- (NSDictionary)smartCamInfo
{
  return self->_smartCamInfo;
}

- (NSArray)detectedHumanFaces
{
  return self->_detectedHumanFaces;
}

- (NSArray)detectedHumanBodies
{
  return self->_detectedHumanBodies;
}

- (NSArray)detectedCatBodies
{
  return self->_detectedCatBodies;
}

- (NSArray)detectedDogBodies
{
  return self->_detectedDogBodies;
}

- (NSArray)detectedSalientObjects
{
  return self->_detectedSalientObjects;
}

- (unint64_t)stitchConfidence
{
  return self->_stitchConfidence;
}

- (BOOL)horizonLinePresent
{
  return self->_horizonLinePresent;
}

- (float)horizonLineAngleInDegrees
{
  return self->_horizonLineAngleInDegrees;
}

- (NSArray)semanticDevelopmentGatingObservations
{
  return self->_semanticDevelopmentGatingObservations;
}

- (NSArray)faceObservations
{
  return self->_faceObservations;
}

- (NSArray)torsoprints
{
  return self->_torsoprints;
}

- (NSArray)foodAndDrinkObservations
{
  return self->_foodAndDrinkObservations;
}

- (int64_t)semanticEnhanceScene
{
  return self->_semanticEnhanceScene;
}

- (void)setSemanticEnhanceScene:(int64_t)a3
{
  self->_semanticEnhanceScene = a3;
}

- (double)semanticEnhanceSceneConfidence
{
  return self->_semanticEnhanceSceneConfidence;
}

- (void)setSemanticEnhanceSceneConfidence:(double)a3
{
  self->_semanticEnhanceSceneConfidence = a3;
}

- (NSString)captureFolderPath
{
  return self->_captureFolderPath;
}

- (NSArray)contactIDsInProximity
{
  return self->_contactIDsInProximity;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIDsInProximity, 0);
  objc_storeStrong((id *)&self->_captureFolderPath, 0);
  objc_storeStrong((id *)&self->_foodAndDrinkObservations, 0);
  objc_storeStrong((id *)&self->_torsoprints, 0);
  objc_storeStrong((id *)&self->_faceObservations, 0);
  objc_storeStrong((id *)&self->_semanticDevelopmentGatingObservations, 0);
  objc_storeStrong((id *)&self->_detectedSalientObjects, 0);
  objc_storeStrong((id *)&self->_detectedDogBodies, 0);
  objc_storeStrong((id *)&self->_detectedCatBodies, 0);
  objc_storeStrong((id *)&self->_detectedHumanBodies, 0);
  objc_storeStrong((id *)&self->_detectedHumanFaces, 0);
  objc_storeStrong((id *)&self->_smartCamInfo, 0);
  objc_storeStrong((id *)&self->_scenePrintObservation, 0);
  objc_storeStrong((id *)&self->_saliencyObservation, 0);
  objc_storeStrong((id *)&self->_imageAestheticsObservation, 0);
  objc_storeStrong((id *)&self->_junkImageClassificationObservations, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
