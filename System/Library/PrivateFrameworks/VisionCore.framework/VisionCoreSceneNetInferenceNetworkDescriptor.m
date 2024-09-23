@implementation VisionCoreSceneNetInferenceNetworkDescriptor

- (NSString)analyzerName
{
  void *v2;
  void *v3;
  void *v4;

  -[VisionCoreInferenceNetworkDescriptor URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (id)descriptorForModel:(unint64_t)a3 requireObjDetNet:(BOOL)a4 requireSliderNet:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  VisionCoreResourceVersion *v20;
  VisionCoreResourceVersion *v21;
  VisionCoreResourceVersion *v22;
  VisionCoreResourceVersion *v23;
  VisionCoreResourceVersion *v24;
  VisionCoreResourceVersion *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  id v65;
  id v66;
  void *v67;
  id obj;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;

  v7 = a5;
  v8 = a4;
  v74 = 0;
  v72 = 0;
  v73 = 0;
  v11 = objc_msgSend(a1, "_getAnalyzerName:ANESpecificAnalyzerName:specifier:forModel:objDetNet:sliderNet:error:", &v74, &v73, &v72, a3, a4, a5, a6);
  v12 = v74;
  v13 = v73;
  v14 = v72;
  v15 = 0;
  if (v11)
  {
    objc_msgSend(a1, "URLForEspressoModelNamed:error:", v12, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_5:
      v15 = 0;
LABEL_32:

      goto LABEL_33;
    }
    if (v13)
    {
      objc_msgSend(a1, "URLForEspressoModelNamed:error:", v13, a6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_5;
    }
    else
    {
      v17 = 0;
    }
    if (a3 != 1)
    {
      if (!a6)
      {
        v15 = 0;
LABEL_31:

        goto LABEL_32;
      }
      obj = v17;
      v69 = v14;
      v61 = objc_alloc(MEMORY[0x24BDD17C8]);
      NSStringFromVisionCoreSceneNetInferenceNetworkModel(a3);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend(v61, "initWithFormat:", CFSTR("%@ is not supported"), v62);

      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForFailedOperationWithLocalizedDescription:", v63);
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

      v17 = obj;
      v14 = v69;
      goto LABEL_31;
    }
    obj = v17;
    v69 = v14;
    v67 = v16;
    v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v8 || v7)
    {
      v20 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 0, 0);
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("VisionCoreSceneNetInferenceNetworkHeadIdentifierObjDetNet"));

      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("slidernet/HighKeyCI"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("slidernet/ContrastCI"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("slidernet/WhiteBalanceTempTintCI"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("slidernet/ColorCastCI"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("slidernet/ExposureAndBlackPointCI"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("slidernet/HighlightsCI"));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("slidernet/VibrancyCI"));
      v21 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 0, 0);
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("VisionCoreSceneNetInferenceNetworkHeadIdentifierSliderNet"));

    }
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E6410, CFSTR("objectness/map"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("classification/labels"));
    v22 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 0, 0);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("VisionCoreSceneNetInferenceNetworkHeadIdentifierSaliencyO"));

    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("inner/sceneprint"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("aesthetics/scores"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E63F8, CFSTR("aesthetics/attributes"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24E1E6410, CFSTR("saliency/map"));
    v23 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 0, 0);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("VisionCoreSceneNetInferenceNetworkHeadIdentifierSceneClassification"));

    v24 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 0, 0);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, CFSTR("VisionCoreSceneNetInferenceNetworkHeadIdentifierAesthetics"));

    v25 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 0, 0);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("VisionCoreSceneNetInferenceNetworkHeadIdentifierSaliencyA"));

    v70 = 0;
    v71 = 0;
    v66 = v18;
    LODWORD(v25) = +[VisionCoreEspressoUtils getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:](VisionCoreEspressoUtils, "getInputImageTensorDescriptor:outputTensorDescriptors:forNetworkModelFileURL:inputBlobName:pixelFormatType:outputBlobNamesWithTypes:confidencesBlobNamesWithLabelsFiles:error:", &v71, &v70, v67, CFSTR("data"), 1111970369, v18, 0, a6);
    v26 = v71;
    v27 = v70;
    v15 = 0;
    if (!(_DWORD)v25)
    {
LABEL_29:

      v63 = v66;
      v16 = v67;
      goto LABEL_30;
    }
    v28 = v27;
    v29 = objc_alloc((Class)a1);
    v65 = v28;
    objc_msgSend(v28, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "initWithURL:specifier:networkHeadVersions:inputImage:outputs:confidencesOutput:", v67, v69, v19, v26, v30, 0);

    if (v31)
    {
      *(_QWORD *)(v31 + 64) = 1;
      objc_storeStrong((id *)(v31 + 72), obj);
      *(_BYTE *)(v31 + 200) = v8 || v7;
      v32 = *(void **)(v31 + 192);
      *(_QWORD *)(v31 + 192) = CFSTR("objectness/map");

      if (v7)
      {
        v33 = *(void **)(v31 + 240);
        *(_QWORD *)(v31 + 240) = CFSTR("slidernet/");

      }
      v34 = *(void **)(v31 + 88);
      *(_QWORD *)(v31 + 88) = CFSTR("scenenet_labels_basic-v8d.csv");

      v35 = *(void **)(v31 + 96);
      *(_QWORD *)(v31 + 96) = CFSTR("scenenet_relationships-v8d.txt");

      v36 = *(void **)(v31 + 112);
      *(_QWORD *)(v31 + 112) = CFSTR("classification/labels");

      v37 = *(void **)(v31 + 120);
      *(_QWORD *)(v31 + 120) = CFSTR("scenenet_op-v8d.plist");

      v38 = *(void **)(v31 + 208);
      *(_QWORD *)(v31 + 208) = CFSTR("GXdCvXzGnLp59suJyVSan_labels.txt");

      v39 = *(void **)(v31 + 216);
      *(_QWORD *)(v31 + 216) = CFSTR("detection/concat");

      v40 = *(void **)(v31 + 80);
      *(_QWORD *)(v31 + 80) = CFSTR("data");

      v41 = *(void **)(v31 + 104);
      *(_QWORD *)(v31 + 104) = CFSTR("inner/sceneprint");

      v42 = *(void **)(v31 + 152);
      *(_QWORD *)(v31 + 152) = CFSTR("scenenet_sc2.4_sa1.4_ae1.4_r9_opt_int8_pca256.pcadata");

      v43 = *(void **)(v31 + 160);
      *(_QWORD *)(v31 + 160) = CFSTR("scenenet_aesthetic_labels_basic-v8e.txt");

      v44 = *(void **)(v31 + 168);
      *(_QWORD *)(v31 + 168) = CFSTR("aesthetics/scores");

      v45 = *(void **)(v31 + 176);
      *(_QWORD *)(v31 + 176) = CFSTR("aesthetics/attributes");

      v46 = *(void **)(v31 + 184);
      *(_QWORD *)(v31 + 184) = CFSTR("saliency/map");

      v47 = objc_msgSend((id)v31, "_newCustomClassifierDescriptorWithModelName:labelsFileName:inputBlobName:outputBlobName:error:", CFSTR("junk_leaf.r14.j9.espresso"), CFSTR("junk_leaf.labels_basic-v3b.txt"), CFSTR("stem/SpatialSqueeze_COPY254"), CFSTR("leaf/probabilities"), a6);
      v48 = *(void **)(v31 + 264);
      *(_QWORD *)(v31 + 264) = v47;

      if (*(_QWORD *)(v31 + 264))
      {
        v49 = objc_msgSend((id)v31, "_newCustomClassifierDescriptorWithModelName:labelsFileName:inputBlobName:outputBlobName:error:", CFSTR("junk_hierarchical.r14.j9.espresso"), CFSTR("junk_hierarchical.labels_higher_order-v3b.txt"), CFSTR("stem/SpatialSqueeze_COPY254"), CFSTR("hierarchical/probabilities"), a6);
        v50 = *(void **)(v31 + 272);
        *(_QWORD *)(v31 + 272) = v49;

        if (*(_QWORD *)(v31 + 272))
        {
          v51 = objc_msgSend((id)v31, "_newCustomClassifierDescriptorWithModelName:labelsFileName:inputBlobName:outputBlobName:error:", CFSTR("vienna.r14.n4.1.espresso"), CFSTR("labels_vienna-v1e.txt"), CFSTR("stem/SpatialSqueeze_COPY254"), CFSTR("leaf/probabilities"), a6);
          v52 = *(void **)(v31 + 280);
          *(_QWORD *)(v31 + 280) = v51;

          if (*(_QWORD *)(v31 + 280))
          {
            v53 = objc_msgSend((id)v31, "_newCustomClassifierDescriptorWithModelName:labelsFileName:inputBlobName:outputBlobName:error:", CFSTR("landmarks_gating.r14.l3.espresso"), CFSTR("landmarks_gating_labels.txt"), CFSTR("stem/SpatialSqueeze_COPY254"), CFSTR("labels/probabilities"), a6);
            v54 = *(void **)(v31 + 288);
            *(_QWORD *)(v31 + 288) = v53;

            if (*(_QWORD *)(v31 + 288))
            {
              v55 = objc_msgSend((id)v31, "_newCustomClassifierDescriptorWithModelName:labelsFileName:inputBlobName:outputBlobName:error:", CFSTR("sg.r14.s4.espresso"), CFSTR("sg_labels.txt"), CFSTR("stem/SpatialSqueeze_NEW254"), CFSTR("hierarchical/probabilities"), a6);
              v56 = *(void **)(v31 + 296);
              *(_QWORD *)(v31 + 296) = v55;

              if (*(_QWORD *)(v31 + 296))
              {
                v57 = objc_msgSend((id)v31, "_newCustomClassifierDescriptorWithModelName:labelsFileName:inputBlobName:outputBlobName:error:", CFSTR("events_gating.r14.e4.espresso"), CFSTR("events_gating_labels_basic-v1c.txt"), CFSTR("stem/SpatialSqueeze_COPY254"), CFSTR("leaf/probabilities"), a6);
                v58 = *(void **)(v31 + 304);
                *(_QWORD *)(v31 + 304) = v57;

                if (*(_QWORD *)(v31 + 304))
                {
                  v59 = objc_msgSend((id)v31, "_newCustomClassifierDescriptorWithModelName:labelsFileName:inputBlobName:outputBlobName:error:", CFSTR("d76p746ctq_50001_split.espresso"), CFSTR("d76p746ctq_50001.txt"), CFSTR("stem/gap/Mean"), CFSTR("leaf/probabilities"), a6);
                  v60 = *(void **)(v31 + 312);
                  *(_QWORD *)(v31 + 312) = v59;

                  if (*(_QWORD *)(v31 + 312))
                  {
                    v15 = (id)v31;
LABEL_28:

                    v27 = v65;
                    goto LABEL_29;
                  }
                }
              }
            }
          }
        }
      }
    }
    else if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", CFSTR("could not create descriptor"));
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    v15 = 0;
    goto LABEL_28;
  }
LABEL_33:

  return v15;
}

- (id)_newCustomClassifierDescriptorWithModelName:(id)a3 labelsFileName:(id)a4 inputBlobName:(id)a5 outputBlobName:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a3;
  objc_msgSend((id)objc_opt_class(), "URLForEspressoModelNamed:error:", v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", v11, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor initWithModelFileURL:labelsFileURL:inputBlobName:outputBlobName:]([VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor alloc], "initWithModelFileURL:labelsFileURL:inputBlobName:outputBlobName:", v15, v16, v12, v13);
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)_getAnalyzerName:(id *)a3 ANESpecificAnalyzerName:(id *)a4 specifier:(id *)a5 forModel:(unint64_t)a6 objDetNet:(BOOL)a7 sliderNet:(BOOL)a8 error:(id *)a9
{
  id *v10;
  VisionCoreProcessingDescriptorSpecifier *v11;
  VisionCoreResourceVersion *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  VisionCoreProcessingDescriptorSpecifier *v16;

  if (a6 == 1)
  {
    v10 = a5;
    if (a4)
      *a4 = 0;
    if (a7 || a8)
    {
      if (a3)
        *a3 = CFSTR("sn3_all_heads_combined_299_no_softmax.espresso");
      if (a5)
      {
        v11 = [VisionCoreProcessingDescriptorSpecifier alloc];
        v12 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 0, 0);
        v13 = CFSTR("VisionCoreInferenceNetworkIdentifierSceneNetObjDetNetSliderNet");
LABEL_15:
        v16 = -[VisionCoreProcessingDescriptorSpecifier initWithIdentifier:version:](v11, "initWithIdentifier:version:", v13, v12);
        goto LABEL_16;
      }
    }
    else
    {
      if (a3)
        *a3 = CFSTR("sn3_4heads_combined_299_no_softmax.espresso");
      if (a5)
      {
        v11 = [VisionCoreProcessingDescriptorSpecifier alloc];
        v12 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 3, 0, 0);
        v13 = CFSTR("VisionCoreInferenceNetworkIdentifierSceneNet");
        goto LABEL_15;
      }
    }
  }
  else
  {
    v10 = a9;
    if (a9)
    {
      v14 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (VisionCoreResourceVersion *)objc_msgSend(v14, "initWithFormat:", CFSTR("unsupported model %@"), v15);

      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v12);
      v16 = (VisionCoreProcessingDescriptorSpecifier *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      *v10 = v16;

    }
  }
  return a6 == 1;
}

- (BOOL)shouldInitializeAdditionalModelHeads
{
  return self->_shouldInitializeAdditionalModelHeads;
}

- (NSString)sceneRepresentationBlobName
{
  return self->_sceneRepresentationBlobName;
}

- (NSString)sceneClassificationLabelsBlobName
{
  return self->_sceneClassificationLabelsBlobName;
}

- (NSString)saliencyOHeatMapBlobName
{
  return self->_saliencyOHeatMapBlobName;
}

- (NSString)saliencyAHeatMapBlobName
{
  return self->_saliencyAHeatMapBlobName;
}

- (NSString)objectDetectorScoresOutputBlobName
{
  return self->_objectDetectorScoresOutputBlobName;
}

- (NSString)objectDetectorCoordinatesOutputBlobName
{
  return self->_objectDetectorCoordinatesOutputBlobName;
}

- (NSString)inputImageBlobName
{
  return self->_inputImageBlobName;
}

- (NSString)fingerprintsOutputBlobName
{
  return self->_fingerprintsOutputBlobName;
}

- (NSString)entityNetLabelsBlobName
{
  return self->_entityNetLabelsBlobName;
}

- (NSString)aestheticsScoresBlobName
{
  return self->_aestheticsScoresBlobName;
}

- (NSString)aestheticsAttributesBlobName
{
  return self->_aestheticsAttributesBlobName;
}

- (NSURL)sceneLabelsFileURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", self->_sceneLabelsFileName, 0);
}

- (NSURL)sceneLabelRelationshipsFileURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", self->_sceneLabelRelationshipsFileName, 0);
}

- (NSURL)objectDetectorLabelsFileURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", self->_objectDetectorLabelsFileName, 0);
}

- (NSURL)fingerprintsHasherFileURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", self->_fingerprintsHasherFileName, 0);
}

- (NSURL)entityNetLabelsFileURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", self->_entityNetLabelsFileName, 0);
}

- (NSURL)aestheticsLabelsFileURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", self->_aestheticsLabelsFileName, 0);
}

- (id)ANESpecificURL
{
  NSURL *aneSpecificModelURL;
  objc_super v4;

  aneSpecificModelURL = self->_aneSpecificModelURL;
  if (aneSpecificModelURL)
    return aneSpecificModelURL;
  v4.receiver = self;
  v4.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor;
  -[VisionCoreEspressoNetworkDescriptor ANESpecificURL](&v4, sel_ANESpecificURL);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VisionCoreTensorDescriptor)sceneprintOutput
{
  void *v3;
  void *v4;

  -[VisionCoreSceneNetInferenceNetworkDescriptor sceneRepresentationBlobName](self, "sceneRepresentationBlobName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreInferenceNetworkDescriptor outputNamed:error:](self, "outputNamed:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (VisionCoreTensorDescriptor *)v4;
}

- (VisionCoreTensorDescriptor)sceneLabelConfidencesOutput
{
  void *v3;
  void *v4;

  -[VisionCoreSceneNetInferenceNetworkDescriptor sceneClassificationLabelsBlobName](self, "sceneClassificationLabelsBlobName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionCoreInferenceNetworkDescriptor outputNamed:error:](self, "outputNamed:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (VisionCoreTensorDescriptor *)v4;
}

- (NSURL)sceneOperatingPointsFileURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", self->_sceneOperatingPointsFileName, 0);
}

- (NSURL)entityNetOperatingPointsFileURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", self->_entityNetOperatingPointsFileName, 0);
}

- (NSURL)pca256FileURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "URLForResourceNamed:error:", self->_pca256FileName, 0);
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor;
  v3 = -[VisionCoreInferenceNetworkDescriptor hash](&v5, sel_hash);
  return -[VisionCoreSceneNetInferenceNetworkDescriptor model](self, "model") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreSceneNetInferenceNetworkDescriptor *v4;
  VisionCoreSceneNetInferenceNetworkDescriptor *v5;
  NSString *inputImageBlobName;
  NSString *sceneLabelsFileName;
  NSString *sceneLabelRelationshipsFileName;
  NSString *sceneRepresentationBlobName;
  NSString *sceneClassificationLabelsBlobName;
  NSString *sceneOperatingPointsFileName;
  NSString *pca256FileName;
  NSString *aestheticsLabelsFileName;
  NSString *aestheticsScoresBlobName;
  NSString *aestheticsAttributesBlobName;
  NSString *saliencyAHeatMapBlobName;
  NSString *saliencyOHeatMapBlobName;
  NSString *objectDetectorLabelsFileName;
  NSString *objectDetectorOutputBlobBaseName;
  NSString *objectDetectorScoresOutputBlobName;
  NSString *objectDetectorCoordinatesOutputBlobName;
  NSString *sliderNetBlobNamePrefix;
  NSString *fingerprintsHasherFileName;
  NSString *fingerprintsOutputBlobName;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *junkLeafCustomClassifierDescriptor;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *junkHierarchicalCustomClassifierDescriptor;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *potentialLandmarksCustomClassifierDescriptor;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *cityNatureCustomClassifierDescriptor;
  char v32;
  objc_super v34;

  v4 = (VisionCoreSceneNetInferenceNetworkDescriptor *)a3;
  if (v4 == self)
  {
    v32 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v34.receiver = self,
          v34.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor,
          -[VisionCoreInferenceNetworkDescriptor isEqual:](&v34, sel_isEqual_, v4)))
    {
      v5 = v4;
      if (self->_model != v5->_model)
        goto LABEL_60;
      inputImageBlobName = self->_inputImageBlobName;
      if (inputImageBlobName != v5->_inputImageBlobName
        && !-[NSString isEqual:](inputImageBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneLabelsFileName = self->_sceneLabelsFileName;
      if (sceneLabelsFileName != v5->_sceneLabelsFileName
        && !-[NSString isEqual:](sceneLabelsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneLabelRelationshipsFileName = self->_sceneLabelRelationshipsFileName;
      if (sceneLabelRelationshipsFileName != v5->_sceneLabelRelationshipsFileName
        && !-[NSString isEqual:](sceneLabelRelationshipsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneRepresentationBlobName = self->_sceneRepresentationBlobName;
      if (sceneRepresentationBlobName != v5->_sceneRepresentationBlobName
        && !-[NSString isEqual:](sceneRepresentationBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneClassificationLabelsBlobName = self->_sceneClassificationLabelsBlobName;
      if (sceneClassificationLabelsBlobName != v5->_sceneClassificationLabelsBlobName
        && !-[NSString isEqual:](sceneClassificationLabelsBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sceneOperatingPointsFileName = self->_sceneOperatingPointsFileName;
      if (sceneOperatingPointsFileName != v5->_sceneOperatingPointsFileName
        && !-[NSString isEqual:](sceneOperatingPointsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      pca256FileName = self->_pca256FileName;
      if (pca256FileName != v5->_pca256FileName && !-[NSString isEqual:](pca256FileName, "isEqual:"))
        goto LABEL_60;
      aestheticsLabelsFileName = self->_aestheticsLabelsFileName;
      if (aestheticsLabelsFileName != v5->_aestheticsLabelsFileName
        && !-[NSString isEqual:](aestheticsLabelsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      aestheticsScoresBlobName = self->_aestheticsScoresBlobName;
      if (aestheticsScoresBlobName != v5->_aestheticsScoresBlobName
        && !-[NSString isEqual:](aestheticsScoresBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      aestheticsAttributesBlobName = self->_aestheticsAttributesBlobName;
      if (aestheticsAttributesBlobName != v5->_aestheticsAttributesBlobName
        && !-[NSString isEqual:](aestheticsAttributesBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      saliencyAHeatMapBlobName = self->_saliencyAHeatMapBlobName;
      if (saliencyAHeatMapBlobName != v5->_saliencyAHeatMapBlobName
        && !-[NSString isEqual:](saliencyAHeatMapBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      saliencyOHeatMapBlobName = self->_saliencyOHeatMapBlobName;
      if (saliencyOHeatMapBlobName != v5->_saliencyOHeatMapBlobName
        && !-[NSString isEqual:](saliencyOHeatMapBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      if (self->_shouldInitializeAdditionalModelHeads != v5->_shouldInitializeAdditionalModelHeads)
        goto LABEL_60;
      objectDetectorLabelsFileName = self->_objectDetectorLabelsFileName;
      if (objectDetectorLabelsFileName != v5->_objectDetectorLabelsFileName
        && !-[NSString isEqual:](objectDetectorLabelsFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      objectDetectorOutputBlobBaseName = self->_objectDetectorOutputBlobBaseName;
      if (objectDetectorOutputBlobBaseName != v5->_objectDetectorOutputBlobBaseName
        && !-[NSString isEqual:](objectDetectorOutputBlobBaseName, "isEqual:"))
      {
        goto LABEL_60;
      }
      objectDetectorScoresOutputBlobName = self->_objectDetectorScoresOutputBlobName;
      if (objectDetectorScoresOutputBlobName != v5->_objectDetectorScoresOutputBlobName
        && !-[NSString isEqual:](objectDetectorScoresOutputBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      objectDetectorCoordinatesOutputBlobName = self->_objectDetectorCoordinatesOutputBlobName;
      if (objectDetectorCoordinatesOutputBlobName != v5->_objectDetectorCoordinatesOutputBlobName
        && !-[NSString isEqual:](objectDetectorCoordinatesOutputBlobName, "isEqual:"))
      {
        goto LABEL_60;
      }
      sliderNetBlobNamePrefix = self->_sliderNetBlobNamePrefix;
      if (sliderNetBlobNamePrefix != v5->_sliderNetBlobNamePrefix
        && !-[NSString isEqual:](sliderNetBlobNamePrefix, "isEqual:"))
      {
        goto LABEL_60;
      }
      fingerprintsHasherFileName = self->_fingerprintsHasherFileName;
      if (fingerprintsHasherFileName != v5->_fingerprintsHasherFileName
        && !-[NSString isEqual:](fingerprintsHasherFileName, "isEqual:"))
      {
        goto LABEL_60;
      }
      if (((fingerprintsOutputBlobName = self->_fingerprintsOutputBlobName,
             fingerprintsOutputBlobName == v5->_fingerprintsOutputBlobName)
         || -[NSString isEqual:](fingerprintsOutputBlobName, "isEqual:"))
        && ((junkLeafCustomClassifierDescriptor = self->_junkLeafCustomClassifierDescriptor,
             junkLeafCustomClassifierDescriptor == v5->_junkLeafCustomClassifierDescriptor)
         || -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](junkLeafCustomClassifierDescriptor, "isEqual:"))&& ((junkHierarchicalCustomClassifierDescriptor = self->_junkHierarchicalCustomClassifierDescriptor, junkHierarchicalCustomClassifierDescriptor == v5->_junkHierarchicalCustomClassifierDescriptor)|| -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](junkHierarchicalCustomClassifierDescriptor, "isEqual:"))&& ((VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor = self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor, VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor == v5->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor)|| -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor, "isEqual:"))&& ((potentialLandmarksCustomClassifierDescriptor = self->_potentialLandmarksCustomClassifierDescriptor, potentialLandmarksCustomClassifierDescriptor == v5->_potentialLandmarksCustomClassifierDescriptor)|| -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](potentialLandmarksCustomClassifierDescriptor, "isEqual:"))&& ((VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor = self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor, VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor == v5->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor)
         || -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor, "isEqual:"))&& ((VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor = self->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor, VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor == v5->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor)|| -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor, "isEqual:")))
      {
        cityNatureCustomClassifierDescriptor = self->_cityNatureCustomClassifierDescriptor;
        if (cityNatureCustomClassifierDescriptor == v5->_cityNatureCustomClassifierDescriptor)
          v32 = 1;
        else
          v32 = -[VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor isEqual:](cityNatureCustomClassifierDescriptor, "isEqual:");
      }
      else
      {
LABEL_60:
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }
  }

  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor;
  v4 = a3;
  -[VisionCoreInferenceNetworkDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_model, CFSTR("model"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputImageBlobName, CFSTR("inputImageBlobName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneLabelsFileName, CFSTR("sceneLabelsFileName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneLabelRelationshipsFileName, CFSTR("sceneLabelRelationshipsFileName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneRepresentationBlobName, CFSTR("sceneRepresentationBlobName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneClassificationLabelsBlobName, CFSTR("sceneClassificationLabelsBlobName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sceneOperatingPointsFileName, CFSTR("sceneOperatingPointsFileName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pca256FileName, CFSTR("pca256FileName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_aestheticsLabelsFileName, CFSTR("aestheticsLabelsFileName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_aestheticsScoresBlobName, CFSTR("aestheticsScoresBlobName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_aestheticsAttributesBlobName, CFSTR("aestheticsAttributesBlobName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_saliencyAHeatMapBlobName, CFSTR("saliencyAHeatMapBlobName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_saliencyOHeatMapBlobName, CFSTR("saliencyOHeatMapBlobName"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldInitializeAdditionalModelHeads, CFSTR("shouldInitializeAdditionalModelHeads"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectDetectorLabelsFileName, CFSTR("objectDetectorLabelsFileName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectDetectorOutputBlobBaseName, CFSTR("objectDetectorOutputBlobBaseName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectDetectorScoresOutputBlobName, CFSTR("objectDetectorScoresOutputBlobName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectDetectorCoordinatesOutputBlobName, CFSTR("objectDetectorCoordinatesOutputBlobName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sliderNetBlobNamePrefix, CFSTR("sliderNetBlobNamePrefix"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fingerprintsHasherFileName, CFSTR("fingerprintsHasherFileName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fingerprintsOutputBlobName, CFSTR("fingerprintsOutputBlobName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_junkLeafCustomClassifierDescriptor, CFSTR("junkLeaf"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_junkHierarchicalCustomClassifierDescriptor, CFSTR("junkHierarchical"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor, CFSTR("VNVYvzEtX1JlUdu8xx5qhDI"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_potentialLandmarksCustomClassifierDescriptor, CFSTR("potentialLandmark"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor, CFSTR("VN5kJNH3eYuyaLxNpZr5Z7zi"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor, CFSTR("VNdGg5skzXHSAENO6T3enHE"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cityNatureCustomClassifierDescriptor, CFSTR("cityNature"));

}

- (VisionCoreSceneNetInferenceNetworkDescriptor)initWithCoder:(id)a3
{
  id v4;
  VisionCoreSceneNetInferenceNetworkDescriptor *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *inputImageBlobName;
  uint64_t v9;
  NSString *sceneLabelsFileName;
  uint64_t v11;
  NSString *sceneLabelRelationshipsFileName;
  uint64_t v13;
  NSString *sceneRepresentationBlobName;
  uint64_t v15;
  NSString *sceneClassificationLabelsBlobName;
  uint64_t v17;
  NSString *sceneOperatingPointsFileName;
  uint64_t v19;
  NSString *pca256FileName;
  uint64_t v21;
  NSString *aestheticsLabelsFileName;
  uint64_t v23;
  NSString *aestheticsScoresBlobName;
  uint64_t v25;
  NSString *aestheticsAttributesBlobName;
  uint64_t v27;
  NSString *saliencyAHeatMapBlobName;
  uint64_t v29;
  NSString *saliencyOHeatMapBlobName;
  uint64_t v31;
  NSString *objectDetectorLabelsFileName;
  uint64_t v33;
  NSString *objectDetectorOutputBlobBaseName;
  uint64_t v35;
  NSString *objectDetectorScoresOutputBlobName;
  uint64_t v37;
  NSString *objectDetectorCoordinatesOutputBlobName;
  uint64_t v39;
  NSString *sliderNetBlobNamePrefix;
  uint64_t v41;
  NSString *fingerprintsHasherFileName;
  uint64_t v43;
  NSString *fingerprintsOutputBlobName;
  uint64_t v45;
  uint64_t v46;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *junkLeafCustomClassifierDescriptor;
  uint64_t v48;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *junkHierarchicalCustomClassifierDescriptor;
  uint64_t v50;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor;
  uint64_t v52;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *potentialLandmarksCustomClassifierDescriptor;
  uint64_t v54;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor;
  uint64_t v56;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor;
  uint64_t v58;
  VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *cityNatureCustomClassifierDescriptor;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)VisionCoreSceneNetInferenceNetworkDescriptor;
  v5 = -[VisionCoreInferenceNetworkDescriptor initWithCoder:](&v61, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_model = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("model"));
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("inputImageBlobName"));
    v7 = objc_claimAutoreleasedReturnValue();
    inputImageBlobName = v5->_inputImageBlobName;
    v5->_inputImageBlobName = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sceneLabelsFileName"));
    v9 = objc_claimAutoreleasedReturnValue();
    sceneLabelsFileName = v5->_sceneLabelsFileName;
    v5->_sceneLabelsFileName = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sceneLabelRelationshipsFileName"));
    v11 = objc_claimAutoreleasedReturnValue();
    sceneLabelRelationshipsFileName = v5->_sceneLabelRelationshipsFileName;
    v5->_sceneLabelRelationshipsFileName = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sceneRepresentationBlobName"));
    v13 = objc_claimAutoreleasedReturnValue();
    sceneRepresentationBlobName = v5->_sceneRepresentationBlobName;
    v5->_sceneRepresentationBlobName = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sceneClassificationLabelsBlobName"));
    v15 = objc_claimAutoreleasedReturnValue();
    sceneClassificationLabelsBlobName = v5->_sceneClassificationLabelsBlobName;
    v5->_sceneClassificationLabelsBlobName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sceneOperatingPointsFileName"));
    v17 = objc_claimAutoreleasedReturnValue();
    sceneOperatingPointsFileName = v5->_sceneOperatingPointsFileName;
    v5->_sceneOperatingPointsFileName = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("pca256FileName"));
    v19 = objc_claimAutoreleasedReturnValue();
    pca256FileName = v5->_pca256FileName;
    v5->_pca256FileName = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("aestheticsLabelsFileName"));
    v21 = objc_claimAutoreleasedReturnValue();
    aestheticsLabelsFileName = v5->_aestheticsLabelsFileName;
    v5->_aestheticsLabelsFileName = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("aestheticsScoresBlobName"));
    v23 = objc_claimAutoreleasedReturnValue();
    aestheticsScoresBlobName = v5->_aestheticsScoresBlobName;
    v5->_aestheticsScoresBlobName = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("aestheticsAttributesBlobName"));
    v25 = objc_claimAutoreleasedReturnValue();
    aestheticsAttributesBlobName = v5->_aestheticsAttributesBlobName;
    v5->_aestheticsAttributesBlobName = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("saliencyAHeatMapBlobName"));
    v27 = objc_claimAutoreleasedReturnValue();
    saliencyAHeatMapBlobName = v5->_saliencyAHeatMapBlobName;
    v5->_saliencyAHeatMapBlobName = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("saliencyOHeatMapBlobName"));
    v29 = objc_claimAutoreleasedReturnValue();
    saliencyOHeatMapBlobName = v5->_saliencyOHeatMapBlobName;
    v5->_saliencyOHeatMapBlobName = (NSString *)v29;

    v5->_shouldInitializeAdditionalModelHeads = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldInitializeAdditionalModelHeads"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("objectDetectorLabelsFileName"));
    v31 = objc_claimAutoreleasedReturnValue();
    objectDetectorLabelsFileName = v5->_objectDetectorLabelsFileName;
    v5->_objectDetectorLabelsFileName = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("objectDetectorOutputBlobBaseName"));
    v33 = objc_claimAutoreleasedReturnValue();
    objectDetectorOutputBlobBaseName = v5->_objectDetectorOutputBlobBaseName;
    v5->_objectDetectorOutputBlobBaseName = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("objectDetectorScoresOutputBlobName"));
    v35 = objc_claimAutoreleasedReturnValue();
    objectDetectorScoresOutputBlobName = v5->_objectDetectorScoresOutputBlobName;
    v5->_objectDetectorScoresOutputBlobName = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("objectDetectorCoordinatesOutputBlobName"));
    v37 = objc_claimAutoreleasedReturnValue();
    objectDetectorCoordinatesOutputBlobName = v5->_objectDetectorCoordinatesOutputBlobName;
    v5->_objectDetectorCoordinatesOutputBlobName = (NSString *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sliderNetBlobNamePrefix"));
    v39 = objc_claimAutoreleasedReturnValue();
    sliderNetBlobNamePrefix = v5->_sliderNetBlobNamePrefix;
    v5->_sliderNetBlobNamePrefix = (NSString *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("fingerprintsHasherFileName"));
    v41 = objc_claimAutoreleasedReturnValue();
    fingerprintsHasherFileName = v5->_fingerprintsHasherFileName;
    v5->_fingerprintsHasherFileName = (NSString *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("fingerprintsOutputBlobName"));
    v43 = objc_claimAutoreleasedReturnValue();
    fingerprintsOutputBlobName = v5->_fingerprintsOutputBlobName;
    v5->_fingerprintsOutputBlobName = (NSString *)v43;

    v45 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, CFSTR("junkLeaf"));
    v46 = objc_claimAutoreleasedReturnValue();
    junkLeafCustomClassifierDescriptor = v5->_junkLeafCustomClassifierDescriptor;
    v5->_junkLeafCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, CFSTR("junkHierarchical"));
    v48 = objc_claimAutoreleasedReturnValue();
    junkHierarchicalCustomClassifierDescriptor = v5->_junkHierarchicalCustomClassifierDescriptor;
    v5->_junkHierarchicalCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, CFSTR("VNVYvzEtX1JlUdu8xx5qhDI"));
    v50 = objc_claimAutoreleasedReturnValue();
    VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor = v5->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor;
    v5->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, CFSTR("potentialLandmark"));
    v52 = objc_claimAutoreleasedReturnValue();
    potentialLandmarksCustomClassifierDescriptor = v5->_potentialLandmarksCustomClassifierDescriptor;
    v5->_potentialLandmarksCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, CFSTR("VN5kJNH3eYuyaLxNpZr5Z7zi"));
    v54 = objc_claimAutoreleasedReturnValue();
    VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor = v5->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor;
    v5->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, CFSTR("VNdGg5skzXHSAENO6T3enHE"));
    v56 = objc_claimAutoreleasedReturnValue();
    VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor = v5->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor;
    v5->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v45, CFSTR("cityNature"));
    v58 = objc_claimAutoreleasedReturnValue();
    cityNatureCustomClassifierDescriptor = v5->_cityNatureCustomClassifierDescriptor;
    v5->_cityNatureCustomClassifierDescriptor = (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor *)v58;

  }
  return v5;
}

- (unint64_t)model
{
  return self->_model;
}

- (NSString)sliderNetBlobNamePrefix
{
  return self->_sliderNetBlobNamePrefix;
}

- (NSString)objectDetectorOutputBlobBaseName
{
  return self->_objectDetectorOutputBlobBaseName;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)junkLeafCustomClassifierDescriptor
{
  return self->_junkLeafCustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)junkHierarchicalCustomClassifierDescriptor
{
  return self->_junkHierarchicalCustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor
{
  return self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)potentialLandmarksCustomClassifierDescriptor
{
  return self->_potentialLandmarksCustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor
{
  return self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor
{
  return self->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor;
}

- (VisionCoreSceneNetInferenceNetworkCustomClassifierDescriptor)cityNatureCustomClassifierDescriptor
{
  return self->_cityNatureCustomClassifierDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNatureCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_potentialLandmarksCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_junkHierarchicalCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_junkLeafCustomClassifierDescriptor, 0);
  objc_storeStrong((id *)&self->_fingerprintsOutputBlobName, 0);
  objc_storeStrong((id *)&self->_fingerprintsHasherFileName, 0);
  objc_storeStrong((id *)&self->_sliderNetBlobNamePrefix, 0);
  objc_storeStrong((id *)&self->_objectDetectorCoordinatesOutputBlobName, 0);
  objc_storeStrong((id *)&self->_objectDetectorScoresOutputBlobName, 0);
  objc_storeStrong((id *)&self->_objectDetectorOutputBlobBaseName, 0);
  objc_storeStrong((id *)&self->_objectDetectorLabelsFileName, 0);
  objc_storeStrong((id *)&self->_saliencyOHeatMapBlobName, 0);
  objc_storeStrong((id *)&self->_saliencyAHeatMapBlobName, 0);
  objc_storeStrong((id *)&self->_aestheticsAttributesBlobName, 0);
  objc_storeStrong((id *)&self->_aestheticsScoresBlobName, 0);
  objc_storeStrong((id *)&self->_aestheticsLabelsFileName, 0);
  objc_storeStrong((id *)&self->_pca256FileName, 0);
  objc_storeStrong((id *)&self->_entityNetOperatingPointsFileName, 0);
  objc_storeStrong((id *)&self->_entityNetLabelsBlobName, 0);
  objc_storeStrong((id *)&self->_entityNetLabelsFileName, 0);
  objc_storeStrong((id *)&self->_sceneOperatingPointsFileName, 0);
  objc_storeStrong((id *)&self->_sceneClassificationLabelsBlobName, 0);
  objc_storeStrong((id *)&self->_sceneRepresentationBlobName, 0);
  objc_storeStrong((id *)&self->_sceneLabelRelationshipsFileName, 0);
  objc_storeStrong((id *)&self->_sceneLabelsFileName, 0);
  objc_storeStrong((id *)&self->_inputImageBlobName, 0);
  objc_storeStrong((id *)&self->_aneSpecificModelURL, 0);
}

+ (id)sceneNetV3AndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__VisionCoreSceneNetInferenceNetworkDescriptor_sceneNetV3AndReturnError___block_invoke;
  v9[3] = &__block_descriptor_40_e9__16__0__8l;
  v9[4] = a1;
  v4 = (void *)MEMORY[0x2207A662C](v9, a2);
  +[VisionCoreFrameworkManager sharedManager](VisionCoreFrameworkManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inferenceNetworkDescriptorsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForIdentifier:creationBlock:error:", CFSTR("SceneNetV3"), v4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sceneNetObjDetNetSliderNetV3AndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __91__VisionCoreSceneNetInferenceNetworkDescriptor_sceneNetObjDetNetSliderNetV3AndReturnError___block_invoke;
  v9[3] = &__block_descriptor_40_e9__16__0__8l;
  v9[4] = a1;
  v4 = (void *)MEMORY[0x2207A662C](v9, a2);
  +[VisionCoreFrameworkManager sharedManager](VisionCoreFrameworkManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inferenceNetworkDescriptorsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForIdentifier:creationBlock:error:", CFSTR("SceneNetObjDetNetSliderNetV3"), v4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __91__VisionCoreSceneNetInferenceNetworkDescriptor_sceneNetObjDetNetSliderNetV3AndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "descriptorForModel:requireObjDetNet:requireSliderNet:error:", 1, 1, 1, a2);
}

uint64_t __73__VisionCoreSceneNetInferenceNetworkDescriptor_sceneNetV3AndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "descriptorForModel:requireObjDetNet:requireSliderNet:error:", 1, 0, 0, a2);
}

@end
