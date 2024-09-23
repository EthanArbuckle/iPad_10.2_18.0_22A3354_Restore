@implementation REBayesianMLModel

+ (unint64_t)featureBitWidth
{
  return 56;
}

- (BOOL)_loadModelFromURL:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  char v7;
  std::string __p;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", a3, 4, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    v7 = BayesianModel::LoadModel((uint64_t)&self->_model, &__p, 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (REBayesianMLModel)initWithFeatureSet:(id)a3 priorMean:(float)a4 modelVarianceEpsilon:(float)a5
{
  id v8;
  double v9;
  double v10;
  REBayesianMLModel *v11;
  uint64_t v12;
  int v13;
  float v14;
  float v15;
  unint64_t v16;
  float v17;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)REBayesianMLModel;
  *(float *)&v9 = a4;
  *(float *)&v10 = a5;
  v11 = -[REMLModel initWithFeatureSet:priorMean:modelVarianceEpsilon:](&v19, sel_initWithFeatureSet_priorMean_modelVarianceEpsilon_, v8, v9, v10);
  if (v11)
  {
    v12 = objc_msgSend(v8, "count");
    v13 = v12;
    v11->_numberOfFeatures = v12;
    -[REMLModel priorMean](v11, "priorMean");
    v15 = v14;
    v16 = -[REBayesianMLModel _maxFeatureCoordinates](v11, "_maxFeatureCoordinates");
    -[REMLModel varianceEpsilon](v11, "varianceEpsilon");
    BayesianModel::InitializeFeatures(&v11->_model, 12585182, v13, v15, v16, v17);
  }

  return v11;
}

- (unint64_t)_maxFeatureCoordinates
{
  return 75 * self->_numberOfFeatures;
}

- (id).cxx_construct
{
  BayesianModel::BayesianModel(&self->_model);
  return self;
}

- (void)_trainWithFeatures:(id)a3 positiveEvent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BYTE *v9;
  _BYTE *v10;
  float v11;
  float v12;
  unint64_t v13;
  float v14;
  void *__p;
  _BYTE *v16;

  v6 = a3;
  v7 = a4;
  std::vector<unsigned long long>::vector(&__p, self->_numberOfFeatures);
  -[REBayesianMLModel _loadFeatureVector:fromFeatureMap:](self, "_loadFeatureVector:fromFeatureMap:", &__p, v6);
  if (!BayesianModel::Train(&self->_model, (uint64_t *)&__p, objc_msgSend(v7, "BOOLValue")))
  {
    RELogForDomain(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[REBayesianMLModel _trainWithFeatures:positiveEvent:].cold.1(v8);

    v10 = __p;
    v9 = v16;
    -[REMLModel priorMean](self, "priorMean");
    v12 = v11;
    v13 = -[REBayesianMLModel _maxFeatureCoordinates](self, "_maxFeatureCoordinates");
    -[REMLModel varianceEpsilon](self, "varianceEpsilon");
    BayesianModel::InitializeFeatures(&self->_model, 12585182, (unint64_t)(v9 - v10) >> 3, v12, v13, v14);
  }
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }

}

- (id)_predictWithFeatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  float v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *__p;
  void *v32;
  uint64_t v33;
  void *v34;
  _BYTE *v35;
  uint64_t v36;
  void *v37;
  _BYTE *v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  void *v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  _BYTE *v50;

  v4 = a3;
  std::vector<unsigned long long>::vector(&v49, self->_numberOfFeatures);
  -[REBayesianMLModel _loadFeatureVector:fromFeatureMap:](self, "_loadFeatureVector:fromFeatureMap:", &v49, v4);
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  BayesianModel::Predict((uint64_t)&self->_model, (uint64_t *)&v49, (uint64_t)&v46, 0.5);
  -[REMLModel metricsRecorder](self, "metricsRecorder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMLModel metricsInteraction](self, "metricsInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  RESubmitBayesianModelPredicted((uint64_t)&v46, v5, v6);

  v7 = v46;
  if (-[REMLModel allowsExploreExploit](self, "allowsExploreExploit"))
  {
    if (RETrainingSimulationIsCurrentlyActive())
      -[REMLModel simulationExploreExploitModulator](self, "simulationExploreExploitModulator");
    else
      -[REMLModel exploreExploitModulator](self, "exploreExploitModulator");
    v9 = scaled_box_muller(*(double *)&v7, *((double *)&v7 + 1), v8);
    normal_erf(v9 / sqrt(*((double *)&v7 + 1) + (double)self->_numberOfFeatures));
    v10 = v11;
  }
  else
  {
    v10 = *(double *)&v47;
  }
  RELogForDomain(4);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v13)
  {
    v18 = MEMORY[0x24BDAC760];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3321888768;
    v42[2] = __42__REBayesianMLModel__predictWithFeatures___block_invoke;
    v42[3] = &unk_24CF91590;
    v42[4] = self;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v43, v49, (uint64_t)v50, (v50 - (_BYTE *)v49) >> 3);
    v40[0] = v18;
    v40[1] = 3221225472;
    v40[2] = __42__REBayesianMLModel__predictWithFeatures___block_invoke_2;
    v40[3] = &unk_24CF915C8;
    v40[4] = self;
    v41 = (id)MEMORY[0x2199B2434](v42);
    v19 = v41;
    objc_msgSend(v4, "enumerateInt64FeaturesUsingIndexedBlock:emptyFeatureBlock:", v19, v40);

    if (v43)
    {
      v44 = v43;
      operator delete(v43);
    }
  }
  *(float *)&v14 = v10;
  *(float *)&v15 = *(double *)&v7;
  *(float *)&v16 = *((double *)&v7 + 1);
  LODWORD(v17) = 0;
  +[REMLPrediction predictionWithProbability:mean:variance:pessimistic:](REMLPrediction, "predictionWithProbability:mean:variance:pessimistic:", v14, v15, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (REMLExplanationsEnabled())
  {
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    BayesianModel::AccessGaussiansAndBias(&self->_model.m_rwlock, (uint64_t *)&v49, (uint64_t)&v37, (uint64_t)&v34);
    v21 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3321888768;
    v26[2] = __42__REBayesianMLModel__predictWithFeatures___block_invoke_2;
    v26[3] = &unk_24CF915F0;
    v26[4] = self;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v28, v37, (uint64_t)v38, (v38 - (_BYTE *)v37) >> 3);
    __p = 0;
    v32 = 0;
    v33 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, v34, (uint64_t)v35, (v35 - (_BYTE *)v34) >> 3);
    v27 = v20;
    v24[0] = v21;
    v24[1] = 3221225472;
    v24[2] = __42__REBayesianMLModel__predictWithFeatures___block_invoke_7;
    v24[3] = &unk_24CF91628;
    v25 = (id)MEMORY[0x2199B2434](v26);
    v22 = v25;
    objc_msgSend(v4, "enumerateInt64FeaturesUsingIndexedBlock:emptyFeatureBlock:", v24, v22);

    if (__p)
    {
      v32 = __p;
      operator delete(__p);
    }
    if (v28)
    {
      v29 = v28;
      operator delete(v28);
    }
    if (v34)
    {
      v35 = v34;
      operator delete(v34);
    }
    if (v37)
    {
      v38 = v37;
      operator delete(v37);
    }
  }
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }

  return v20;
}

void __42__REBayesianMLModel__predictWithFeatures___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 552) > a3)
  {
    RELogForDomain(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a3);
      objc_msgSend(v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 134218498;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2048;
      v16 = a4;
      _os_log_debug_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEBUG, "\t0x%016llX\t%@ → %016llX", (uint8_t *)&v11, 0x20u);

    }
  }

}

void __42__REBayesianMLModel__predictWithFeatures___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 552) > a3)
  {
    +[REFeatureValue nullValueForFeature:](REFeatureValue, "nullValueForFeature:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "int64Value");

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

{
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v5 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 552) > a3)
  {
    v6 = *(double *)(*(_QWORD *)(a1 + 48) + 8 * a3);
    *(float *)&v6 = v6;
    v7 = *(double *)(*(_QWORD *)(a1 + 72) + 8 * a3);
    *(float *)&v7 = v7;
    v9 = v5;
    +[REMLExplanation explanationForFeature:mean:variance:](REMLExplanation, "explanationForFeature:mean:variance:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addExplanation:", v8);

    v5 = v9;
  }

}

uint64_t __42__REBayesianMLModel__predictWithFeatures___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_loadFeatureVector:(void *)a3 fromFeatureMap:(id)a4
{
  _QWORD v4[6];
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__REBayesianMLModel__loadFeatureVector_fromFeatureMap___block_invoke;
  v5[3] = &unk_24CF91650;
  v5[4] = self;
  v5[5] = a3;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__REBayesianMLModel__loadFeatureVector_fromFeatureMap___block_invoke_2;
  v4[3] = &unk_24CF91678;
  v4[4] = self;
  v4[5] = a3;
  objc_msgSend(a4, "enumerateInt64FeaturesUsingIndexedBlock:emptyFeatureBlock:", v5, v4);
}

void __55__REBayesianMLModel__loadFeatureVector_fromFeatureMap___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  __CFString *v14;
  id v15;

  v15 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 552) <= a3)
    goto LABEL_9;
  if (HIBYTE(a4))
  {
    v14 = CFSTR("Value %llu cannot be stored into feature for this model");
LABEL_8:
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], v14, v7, v8, v9, v10, v11, v12, a4);
    goto LABEL_9;
  }
  if (a3 >= 0x100)
  {
    v14 = CFSTR("Feature id %lu cannot be stored into feature for this model");
    a4 = a3;
    goto LABEL_8;
  }
  v13 = *(_QWORD **)(a1 + 40);
  if (a3 >= (uint64_t)(v13[1] - *v13) >> 3)
    std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
  *(_QWORD *)(*v13 + 8 * a3) = a4 | (a3 << 56);
LABEL_9:

}

void __55__REBayesianMLModel__loadFeatureVector_fromFeatureMap___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;

  v5 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 552) > a3)
  {
    v9 = v5;
    +[REFeatureValue nullValueForFeature:](REFeatureValue, "nullValueForFeature:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "int64Value");

    v8 = *(_QWORD **)(a1 + 40);
    if (a3 >= (uint64_t)(v8[1] - *v8) >> 3)
      std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
    *(_QWORD *)(*v8 + 8 * a3) = v7 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a3 << 56);
    v5 = v9;
  }

}

- (BOOL)_saveModelToURL:(id)a3 includeDebugData:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v11;
  std::ios_base v12;
  uint64_t v13;
  int v14;
  _BYTE __sb[120];
  uint64_t v16;
  uint64_t v17;

  v5 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  MEMORY[0x2199B1CE4](__sb);
  objc_msgSend(v7, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "UTF8String");
  std::filebuf::open();

  v9 = v16;
  if (v16)
  {
    v11 = MEMORY[0x24BEDB828] + 24;
    v12.__vftable = (std::ios_base_vtbl *)(MEMORY[0x24BEDB828] + 64);
    std::ios_base::init(&v12, __sb);
    v13 = 0;
    v14 = -1;
    BayesianModel::SaveModel((uint64_t)&self->_model, &v11, v5);
    std::ostream::flush();
    std::ostream::~ostream();
  }
  std::filebuf::close();
  MEMORY[0x2199B1CF0](__sb);

  return v9 != 0;
}

- (BOOL)_saveModelToURL:(id)a3 error:(id *)a4
{
  return -[REBayesianMLModel _saveModelToURL:includeDebugData:error:](self, "_saveModelToURL:includeDebugData:error:", a3, 0, a4);
}

- (BOOL)_saveDebugModelToURL:(id)a3 error:(id *)a4
{
  return -[REBayesianMLModel _saveModelToURL:includeDebugData:error:](self, "_saveModelToURL:includeDebugData:error:", a3, 1, a4);
}

- (void)_clearModel
{
  BayesianModel *p_model;
  int numberOfFeatures;
  float v5;
  double v6;
  unint64_t v7;
  float v8;

  p_model = &self->_model;
  numberOfFeatures = self->_numberOfFeatures;
  -[REMLModel priorMean](self, "priorMean");
  v6 = v5;
  v7 = -[REBayesianMLModel _maxFeatureCoordinates](self, "_maxFeatureCoordinates");
  -[REMLModel varianceEpsilon](self, "varianceEpsilon");
  BayesianModel::InitializeFeatures(p_model, 12585182, numberOfFeatures, v6, v7, v8);
}

- (int64_t)_getNumberOfCoordinates
{
  return BayesianModel::getNumberOfCoordinates(&self->_model);
}

- (float)_getAveragePrediction
{
  return BayesianModel::getAveragePrediction(&self->_model);
}

- (float)_getNormalizedEntropy
{
  double v2;

  BayesianModel::getAverageNormalizedEntropy(&self->_model);
  return v2;
}

- (unint64_t)_getTotalExampleCount
{
  return self->_model.m_nTotalExamples;
}

- (unint64_t)_getTotalPositiveCount
{
  return self->_model.m_nTotalTrue;
}

+ (unint64_t)maxFeatureCount
{
  return 254;
}

- (void)logCoreAnalyticsMetrics
{
  void *v3;
  id v4;

  -[REMLModel metricsRecorder](self, "metricsRecorder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REMLModel metricsInteraction](self, "metricsInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RESubmitBayesianModelTrained(&self->_model, v4, v3);

}

- (REExportedTable)content
{
  REExportedTable *v2;
  void *v3;
  uint64_t **v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t **v9;
  uint64_t **v10;
  uint64_t v11;
  uint64_t ***v12;

  v9 = 0;
  v10 = 0;
  v11 = 0;
  BayesianModel::CaptureDebugTable((uint64_t)&self->_model, (uint64_t *)&v9);
  v2 = objc_alloc_init(REExportedTable);
  if (v10 != v9)
  {
    REStringArrayFromVector(v9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[REExportedTable setHeader:](v2, "setHeader:", v3);

    v4 = v9;
    if (0xAAAAAAAAAAAAAAABLL * (v10 - v9) >= 2)
    {
      v5 = 1;
      v6 = 3;
      do
      {
        REStringArrayFromVector(&v4[v6]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[REExportedTable addRow:](v2, "addRow:", v7);

        ++v5;
        v4 = v9;
        v6 += 3;
      }
      while (v5 < 0xAAAAAAAAAAAAAAABLL * (v10 - v9));
    }
  }
  v12 = &v9;
  std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  return v2;
}

- (void).cxx_destruct
{
  BayesianModel::~BayesianModel(&self->_model);
}

- (void)_trainWithFeatures:(os_log_t)log positiveEvent:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2132F7000, log, OS_LOG_TYPE_ERROR, "TRAINING FAILED - Resetting to empty model", v1, 2u);
}

@end
