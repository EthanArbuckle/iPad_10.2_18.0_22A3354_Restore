@implementation PPTopicTransform

- (PPTopicTransform)initWithPath:(id)a3 mappingId:(id)a4
{
  id v6;
  id v7;
  PPTopicTransform *v8;
  uint64_t v9;
  id v10;
  NSData *data;
  NSData *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  unsigned int topicCount;
  unsigned int qidCount;
  unsigned int payloadLen;
  unsigned int nonzeroCount;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const float *v26;
  void *v27;
  id v28;
  void *v29;
  unsigned __int8 v30;
  PPTopicTransform *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  double v41;
  double v42;
  float v43;
  void *v44;
  double v45;
  double v46;
  float v47;
  void *v48;
  double v49;
  double v50;
  float v51;
  void *v52;
  double v53;
  double v54;
  float v55;
  void *v56;
  double v57;
  double v58;
  float v59;
  id v61;
  objc_super v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PPTopicTransform;
  v8 = -[PPTopicTransform init](&v62, sel_init);
  if (!v8)
  {
LABEL_52:
    v31 = v8;
    goto LABEL_53;
  }
  v61 = 0;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v6, 1, &v61);
  v10 = v61;
  data = v8->_data;
  v8->_data = (NSData *)v9;

  v12 = v8->_data;
  if (!v12)
  {
    pp_topics_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v64 = v6;
      v65 = 2112;
      v66 = v10;
      v14 = "Could not load topic transform %@: %@";
      v15 = v13;
      v16 = 22;
LABEL_16:
      _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (-[NSData length](v12, "length") <= 0xF)
  {
    pp_topics_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v6;
      v14 = "Topic transform truncated: %@";
LABEL_15:
      v15 = v13;
      v16 = 12;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v8->_header = *(header_s *)-[NSData bytes](v8->_data, "bytes");
  qidCount = v8->_header.qidCount;
  topicCount = v8->_header.topicCount;
  nonzeroCount = v8->_header.nonzeroCount;
  payloadLen = v8->_header.payloadLen;
  if (-[NSData length](v8->_data, "length") == 4 * topicCount
                                              + (unint64_t)(4 * qidCount)
                                              + 8 * nonzeroCount
                                              + payloadLen * topicCount
                                              + 16)
  {
    v21 = -[NSData bytes](v8->_data, "bytes");
    v22 = v8->_header.qidCount;
    v23 = v21 + 16 + 4 * v8->_header.topicCount;
    v8->_bias = (const float *)(v21 + 16);
    v8->_qids = (const unsigned int *)v23;
    v24 = v23 + 4 * v22;
    v25 = v8->_header.nonzeroCount;
    v26 = (const float *)(v24 + 4 * v25);
    v8->_matrixIndices = (const unsigned int *)v24;
    v8->_matrixElts = v26;
    v8->_payloads = (const char *)&v26[v25];
    if (v7)
    {
      +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "hyperparametersForMappingId:", v7);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("FeatureSmoothingType"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v30 = objc_msgSend(v29, "intValue");
      else
        v30 = 0;

      v8->_featureSmoothingType = v30;
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("FeatureScalingType"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v33 = objc_msgSend(v32, "intValue");
      else
        v33 = 0;

      v8->_featureScalingType = v33;
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("FeatureNormalizationType"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v35 = objc_msgSend(v34, "intValue");
      else
        v35 = 0;

      v8->_featureNormalizationType = v35;
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("OutputScalingType"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v37 = objc_msgSend(v36, "intValue");
      else
        v37 = 0;

      v8->_outputScalingType = v37;
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ActivationType"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v39 = objc_msgSend(v38, "intValue");
      else
        v39 = 0;

      v8->_activationType = v39;
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("FeatureSmoothingFactor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0.0;
      if (v40)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v40, "doubleValue");
          v41 = v42;
        }
      }

      v43 = v41;
      v8->_featureSmoothingFactor = v43;
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("FeatureScalingFactor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 1.0;
      if (v44)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v44, "doubleValue");
          v45 = v46;
        }
      }

      v47 = v45;
      v8->_featureScalingFactor = v47;
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("OutputScalingFactor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 1.0;
      if (v48)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v48, "doubleValue");
          v49 = v50;
        }
      }

      v51 = v49;
      v8->_outputScalingFactor = v51;
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ScoreAttenuationFactor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0.0;
      if (v52)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v52, "doubleValue");
          v53 = v54;
        }
      }

      v55 = v53;
      v8->_attenuationFactor = v55;
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("ScoreThreshold"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0.0;
      if (v56)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v56, "doubleValue");
          v57 = v58;
        }
      }

      v59 = v57;
      v8->_threshold = v59;

    }
    goto LABEL_52;
  }
  pp_topics_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v6;
    v14 = "Topic transform truncated: %@";
    goto LABEL_15;
  }
LABEL_17:

  v31 = 0;
LABEL_53:

  return v31;
}

- (unint64_t)outputTopicCount
{
  return self->_header.topicCount;
}

- (BOOL)containsMappedTopic:(id)a3
{
  return indexForPayload((NSString *)a3, (const unsigned __int8 *)self->_payloads, self->_header.topicCount, self->_header.payloadLen) != -1;
}

- (id)payloadForTopic:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unsigned int v10;
  _DWORD v11[2];
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_header.topicCount <= a3)
  {
    pp_topics_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = self->_header.topicCount - 1;
      v11[0] = 67109376;
      v11[1] = a3;
      v12 = 1024;
      v13 = v10;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "Topic index %u too big (max: %u)", (uint8_t *)v11, 0xEu);
    }

    v7 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &self->_payloads[self->_header.payloadLen * a3], self->_header.payloadLen, 1);
    v6 = (void *)MEMORY[0x1C3BD6630]();
    _PASTrimTrailingWhitespace();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v6);

  }
  return v7;
}

- (void)addWeightedTopicScoreToBuffer:(float *)a3 countNonZeroComponentsInBuffer:(unsigned __int16 *)a4 qid:(unsigned int)a5 score:(float)a6
{
  uint64_t qidCount;
  const unsigned int *qids;
  unint64_t v8;
  const unsigned int *v9;
  unint64_t v10;
  unsigned int *v11;
  const unsigned int *v12;
  unsigned int v13;
  _QWORD v14[6];
  float v15;

  qidCount = self->_header.qidCount;
  if (!(_DWORD)qidCount)
    goto LABEL_10;
  qids = self->_qids;
  v8 = self->_header.qidCount;
  v9 = qids;
  do
  {
    v10 = v8 >> 1;
    v11 = (unsigned int *)&v9[v8 >> 1];
    v13 = *v11;
    v12 = v11 + 1;
    v8 += ~(v8 >> 1);
    if (v13 >= a5)
      v8 = v10;
    else
      v9 = v12;
  }
  while (v8);
  if (v9 != &qids[qidCount] && *v9 == a5)
  {
    *(_QWORD *)&a5 = (unint64_t)((char *)v9 - (char *)qids) >> 2;
LABEL_10:
    if (a5 != -1)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __91__PPTopicTransform_addWeightedTopicScoreToBuffer_countNonZeroComponentsInBuffer_qid_score___block_invoke;
      v14[3] = &__block_descriptor_52_e11_v16__0I8f12l;
      v14[4] = a4;
      v14[5] = a3;
      v15 = a6;
      -[PPTopicTransform _enumerateSparseColumnAtIndex:block:]((uint64_t)self, a5, v14);
    }
  }
}

- (void)addWeightedTopicScoreToBuffer:(float *)a3 qid:(unsigned int)a4 score:(float)a5
{
  uint64_t qidCount;
  const unsigned int *qids;
  unint64_t v7;
  const unsigned int *v8;
  unint64_t v9;
  unsigned int *v10;
  const unsigned int *v11;
  unsigned int v12;
  _QWORD v13[5];
  float v14;

  qidCount = self->_header.qidCount;
  if (!(_DWORD)qidCount)
    goto LABEL_10;
  qids = self->_qids;
  v7 = self->_header.qidCount;
  v8 = qids;
  do
  {
    v9 = v7 >> 1;
    v10 = (unsigned int *)&v8[v7 >> 1];
    v12 = *v10;
    v11 = v10 + 1;
    v7 += ~(v7 >> 1);
    if (v12 >= a4)
      v7 = v9;
    else
      v8 = v11;
  }
  while (v7);
  if (v8 != &qids[qidCount] && *v8 == a4)
  {
    *(_QWORD *)&a4 = (unint64_t)((char *)v8 - (char *)qids) >> 2;
LABEL_10:
    if (a4 != -1)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __60__PPTopicTransform_addWeightedTopicScoreToBuffer_qid_score___block_invoke;
      v13[3] = &__block_descriptor_44_e11_v16__0I8f12l;
      v13[4] = a3;
      v14 = a5;
      -[PPTopicTransform _enumerateSparseColumnAtIndex:block:]((uint64_t)self, a4, v13);
    }
  }
}

- (id)QIDWeightsWithMappedTopicIdentifier:(id)a3
{
  NSString *v4;
  int v5;
  void *v6;
  id v7;
  _QWORD *v8;
  unsigned int nonzeroCount;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;
  unsigned int v14;
  const unsigned int *matrixIndices;
  const unsigned int *v16;
  char *v17;
  unint64_t v18;
  char *v19;
  char *v20;
  unsigned int v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  unsigned int v27;
  unsigned int topicCount;
  _QWORD v29[2];
  void (*v30)(uint64_t, uint64_t);
  void *v31;
  PPTopicTransform *v32;
  id v33;
  uint8_t buf[4];
  _DWORD v35[7];

  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  v5 = indexForPayload(v4, (const unsigned __int8 *)self->_payloads, self->_header.topicCount, self->_header.payloadLen);
  if (v5 == -1)
  {
    pp_topics_log_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v35 = v4;
      _os_log_error_impl(&dword_1C392E000, v24, OS_LOG_TYPE_ERROR, "Mapped topic ID (%@) not found in this mapping.", buf, 0xCu);
    }
    v25 = 0;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v30 = __56__PPTopicTransform_QIDWeightsWithMappedTopicIdentifier___block_invoke;
    v31 = &unk_1E7E18058;
    v32 = self;
    v7 = v6;
    v33 = v7;
    v8 = v29;
    nonzeroCount = self->_header.nonzeroCount;
    if (nonzeroCount && (v10 = self->_header.topicCount) != 0)
    {
      v11 = 0;
      v12 = self->_matrixIndices[nonzeroCount - 1] / v10;
      do
      {
        v13 = self->_header.nonzeroCount;
        if ((_DWORD)v13)
        {
          v14 = v5 + self->_header.topicCount * v11;
          matrixIndices = self->_matrixIndices;
          v16 = &matrixIndices[v13];
          v17 = (char *)matrixIndices;
          do
          {
            v18 = v13 >> 1;
            v19 = &v17[4 * (v13 >> 1)];
            v21 = *(_DWORD *)v19;
            v20 = v19 + 4;
            v13 += ~(v13 >> 1);
            if (v21 >= v14)
              v13 = v18;
            else
              v17 = v20;
          }
          while (v13);
          if (v17 != (char *)v16 && *(_DWORD *)v17 == v14)
            ((void (*)(_QWORD *, uint64_t, float))v30)(v8, v11, *(float *)((char *)self->_matrixElts + v17 - (char *)matrixIndices));
        }
        v11 = (v11 + 1);
      }
      while (v11 <= v12);
    }
    else
    {
      pp_topics_log_handle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        topicCount = self->_header.topicCount;
        v27 = self->_header.nonzeroCount;
        *(_DWORD *)buf = 67109376;
        v35[0] = v27;
        LOWORD(v35[1]) = 1024;
        *(_DWORD *)((char *)&v35[1] + 2) = topicCount;
        _os_log_error_impl(&dword_1C392E000, v22, OS_LOG_TYPE_ERROR, "Sparse matrix shape error: %u nonzero elements for %u topics.", buf, 0xEu);
      }

    }
    v23 = v33;
    v24 = v7;

    v25 = v24;
  }

  return v25;
}

- (void)addBias:(float *)a3
{
  uint64_t topicCount;
  const float *bias;
  float v5;

  topicCount = self->_header.topicCount;
  if ((_DWORD)topicCount)
  {
    bias = self->_bias;
    do
    {
      v5 = *bias++;
      *a3 = v5 + *a3;
      ++a3;
      --topicCount;
    }
    while (topicCount);
  }
}

- (void)applyFeatureSmoothing:(float *)a3 vectorLength:(int)a4
{
  uint64_t v5;

  if (self->_featureSmoothingType == 1 && self->_featureSmoothingFactor != 0.0 && a4 != 0)
  {
    v5 = a4;
    do
    {
      *a3 = self->_featureSmoothingFactor + *a3;
      ++a3;
      --v5;
    }
    while (v5);
  }
}

- (void)applyFeatureScaling:(float *)a3 vectorLength:(int)a4
{
  -[PPTopicTransform _applyScaling:vectorLength:scalingType:scalingFactor:]((uint64_t)self, a3, a4, self->_featureScalingType, self->_featureScalingFactor);
}

- (void)applyOutputScaling:(float *)a3 vectorLength:(int)a4
{
  -[PPTopicTransform _applyScaling:vectorLength:scalingType:scalingFactor:]((uint64_t)self, a3, a4, self->_outputScalingType, self->_outputScalingFactor);
}

- (void)applyFeatureNormalization:(float *)a3 vectorLength:(int)a4
{
  int featureNormalizationType;
  float v7;

  featureNormalizationType = self->_featureNormalizationType;
  switch(featureNormalizationType)
  {
    case 3:
      v7 = fabsf(a3[cblas_icamax(a4, a3, 1)]);
      break;
    case 2:
      v7 = cblas_snrm2(a4, a3, 1);
      break;
    case 1:
      v7 = cblas_sasum(a4, a3, 1);
      break;
    default:
      return;
  }
  cblas_sscal(a4, 1.0 / v7, a3, 1);
}

- (void)applyOutputActivation:(float *)a3
{
  float *v3;
  uint64_t topicCount;
  float v6;
  float v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  float *v15;
  float v16;
  float v17;
  int __N;
  int v19;

  v3 = a3;
  switch(self->_activationType)
  {
    case 1u:
      topicCount = self->_header.topicCount;
      if ((_DWORD)topicCount)
      {
        do
        {
          v6 = expf(-*v3);
          v7 = 1.0 / (v6 + 1.0) + -0.5 + 1.0 / (v6 + 1.0) + -0.5;
          *v3++ = v7;
          --topicCount;
        }
        while (topicCount);
      }
      return;
    case 2u:
      v8 = self->_header.topicCount;
      if ((_DWORD)v8)
      {
        do
        {
          v9 = 1.0 / (expf(-*v3) + 1.0);
          *v3++ = v9;
          --v8;
        }
        while (v8);
      }
      return;
    case 3u:
      v19 = self->_header.topicCount;
      vvexpf(a3, a3, &v19);
      goto LABEL_9;
    case 4u:
LABEL_9:
      v10 = self->_header.topicCount;
      if (!(_DWORD)v10)
        goto LABEL_18;
      v11 = v3;
      v12 = v10;
      do
      {
        v13 = expf(-*v11);
        *v11++ = expf(-v13);
        --v12;
      }
      while (v12);
LABEL_14:
      v14 = v10;
      v15 = v3;
      do
      {
        v16 = expf(-*v15);
        *v15++ = 1.0 - expf(-v16);
        --v14;
      }
      while (v14);
LABEL_18:
      __N = v10;
      vvexpf(v3, v3, &__N);
      v17 = cblas_sasum(__N, v3, 1);
      cblas_sscal(__N, 1.0 / v17, v3, 1);
      return;
    case 5u:
      LODWORD(v10) = self->_header.topicCount;
      if ((_DWORD)v10)
        goto LABEL_14;
      goto LABEL_18;
    case 6u:
      LODWORD(v10) = self->_header.topicCount;
      goto LABEL_18;
    default:
      return;
  }
}

- (void)applyOutputAttenuation:(float *)a3 nonzeroCounts:(unsigned __int16 *)a4
{
  uint64_t v7;
  unsigned int v8;
  void *v9;
  long double v10;

  if (self->_attenuationFactor != 0.0 && -[PPTopicTransform outputTopicCount](self, "outputTopicCount"))
  {
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = (void *)MEMORY[0x1C3BD6630]();
      if (a4[v7])
      {
        v10 = pow((double)a4[v7], 1.0 / self->_attenuationFactor);
        *(float *)&v10 = v10 / (v10 + 1.0) * a3[v7];
        a3[v7] = *(float *)&v10;
      }
      objc_autoreleasePoolPop(v9);
      v7 = v8;
    }
    while (-[PPTopicTransform outputTopicCount](self, "outputTopicCount") > v8++);
  }
}

- (float)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)_applyScaling:(unsigned int)__N vectorLength:(int)a4 scalingType:(float)a5 scalingFactor:
{
  float *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  v11 = __N;
  if (a1)
  {
    v7 = a2;
    switch(a4)
    {
      case 1:
        if (a5 != 1.0)
          cblas_sscal(__N, a5, a2, 1);
        break;
      case 2:
        vvlogf(a2, a2, &v11);
        v8 = v11;
        if (v11)
        {
          do
          {
            *v7 = *v7 + 1.0;
            ++v7;
            --v8;
          }
          while (v8);
        }
        break;
      case 3:
        vvlog1pf(a2, a2, &v11);
        break;
      case 4:
        v9 = cblas_icamax(__N, a2, 1);
        cblas_sscal(__N, (float)(1.0 - a5) / fabsf(v7[v9]), v7, 1);
        if (__N)
        {
          v10 = __N;
          do
          {
            *v7 = *v7 + a5;
            ++v7;
            --v10;
          }
          while (v10);
        }
        break;
      default:
        return;
    }
  }
}

void __56__PPTopicTransform_QIDWeightsWithMappedTopicIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v4 + 16) > a2)
    v2 = *(unsigned int *)(*(_QWORD *)(v4 + 40) + 4 * a2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

float __60__PPTopicTransform_addWeightedTopicScoreToBuffer_qid_score___block_invoke(uint64_t a1, unsigned int a2, float a3)
{
  uint64_t v3;
  float result;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(float *)(v3 + 4 * a2) + (float)(*(float *)(a1 + 40) * a3);
  *(float *)(v3 + 4 * a2) = result;
  return result;
}

- (void)_enumerateSparseColumnAtIndex:(void *)a3 block:
{
  unint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  char *v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  unsigned int *v13;
  char *v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  unsigned int v18;
  char *v19;
  unsigned int v20;
  void (**v21)(id, _QWORD, float);

  v21 = a3;
  if (a1)
  {
    v5 = *(unsigned int *)(a1 + 24);
    if ((_DWORD)v5)
    {
      v6 = *(_DWORD *)(a1 + 20);
      v7 = v6 * a2;
      v8 = v7 + v6;
      v9 = *(char **)(a1 + 48);
      v10 = (unint64_t)&v9[4 * v5];
      v11 = v9;
      do
      {
        v12 = v5 >> 1;
        v13 = (unsigned int *)&v11[4 * (v5 >> 1)];
        v15 = *v13;
        v14 = (char *)(v13 + 1);
        v5 += ~(v5 >> 1);
        if (v15 >= v7)
          v5 = v12;
        else
          v11 = v14;
      }
      while (v5);
      if ((unint64_t)v11 < v10)
      {
        v16 = 0;
        v17 = (char *)(*(_QWORD *)(a1 + 56) + v11 - v9);
        v18 = 1;
        v19 = v11;
        do
        {
          v20 = *(_DWORD *)v19;
          if (v20 >= v8)
            break;
          v21[2](v21, v20 - v7, *(float *)&v17[4 * v16]);
          v16 = v18;
          v19 = &v11[4 * v18++];
        }
        while ((unint64_t)v19 < v10);
      }
    }
  }

}

float __91__PPTopicTransform_addWeightedTopicScoreToBuffer_countNonZeroComponentsInBuffer_qid_score___block_invoke(uint64_t a1, unsigned int a2, float a3)
{
  uint64_t v3;
  float result;

  v3 = *(_QWORD *)(a1 + 40);
  ++*(_WORD *)(*(_QWORD *)(a1 + 32) + 2 * a2);
  result = *(float *)(v3 + 4 * a2) + (float)(*(float *)(a1 + 48) * a3);
  *(float *)(v3 + 4 * a2) = result;
  return result;
}

@end
