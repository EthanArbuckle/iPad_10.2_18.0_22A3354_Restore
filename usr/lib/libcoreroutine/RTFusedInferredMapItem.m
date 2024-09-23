@implementation RTFusedInferredMapItem

- (RTFusedInferredMapItem)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapItem_confidence_source_);
}

- (RTFusedInferredMapItem)initWithMapItem:(id)a3 confidence:(double)a4 source:(unint64_t)a5
{
  id v9;
  NSObject *v11;
  RTFusedInferredMapItem *v12;
  RTFusedInferredMapItem *v14;
  RTFusedInferredMapItem *v15;
  objc_super v16;
  uint8_t buf[16];

  v9 = a3;
  if (a4 < 0.0 || a4 > 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: kRTFusedInferredMapItemConfidenceMin <= confidence && confidence <= kRTFusedInferredMapItemConfidenceMax", buf, 2u);
    }

    goto LABEL_10;
  }
  if ((a5 & 0xFFFFFFFFFFF00020) != 0)
  {
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTFusedInferredMapItem;
  v14 = -[RTFusedInferredMapItem init](&v16, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_mapItem, a3);
    v15->_confidence = a4;
    v15->_source = a5;
  }
  self = v15;
  v12 = self;
LABEL_11:

  return v12;
}

- (RTFusedInferredMapItem)initWithInferredMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  RTFusedInferredMapItem *v8;
  NSObject *v9;
  uint8_t v11[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "confidence");
    self = -[RTFusedInferredMapItem initWithMapItem:confidence:source:](self, "initWithMapItem:confidence:source:", v6, objc_msgSend(v5, "source"), v7);

    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", v11, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)convertToInferredMapItem
{
  void *v2;

  if (self->_mapItem)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183A8]), "initWithMapItem:confidence:source:", self->_mapItem, self->_source, self->_confidence);
  else
    v2 = 0;
  return v2;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[RTFusedInferredMapItem mapItem](self, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[RTMapItem hash](self->_mapItem, "hash");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash") ^ v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_source);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hash");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "hash");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_source);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "hash");
  }

  return v6 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  RTFusedInferredMapItem *v4;
  RTFusedInferredMapItem *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  BOOL v18;

  v4 = (RTFusedInferredMapItem *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTFusedInferredMapItem mapItem](self, "mapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTFusedInferredMapItem mapItem](v5, "mapItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      -[RTFusedInferredMapItem mapItem](self, "mapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        -[RTFusedInferredMapItem mapItem](v5, "mapItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          v8 = 1;
      }

      -[RTFusedInferredMapItem confidence](self, "confidence");
      v12 = v11;
      -[RTFusedInferredMapItem confidence](v5, "confidence");
      v14 = v13;
      v15 = -[RTFusedInferredMapItem source](self, "source");
      v16 = -[RTFusedInferredMapItem source](v5, "source");
      if (v12 == v14)
        v17 = v8;
      else
        v17 = 0;
      if (v15 == v16)
        v18 = v17;
      else
        v18 = 0;

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
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTFusedInferredMapItem mapItem](self, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTFusedInferredMapItem confidence](self, "confidence");
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0D183E8], "sourceToString:", -[RTFusedInferredMapItem source](self, "source"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("mapItem, %@, confidence, %.3f, source, %@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sortFusedInferredMapItems:(id)a3 confidenceEqualityEpsilon:(double)a4 referenceLocation:(id)a5 distanceCalculator:(id)a6 ascending:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  uint8_t buf[16];
  _QWORD v29[6];

  v7 = a7;
  v29[4] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: fusedInferredMapItems";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_15;
  }
  if ((RTCommonValidConfidence() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: RTCommonValidConfidence(confidenceEqualityEpsilon)";
    goto LABEL_14;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: referenceLocation";
    goto LABEL_14;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Invalid parameter not satisfying: distanceCalculator";
      goto LABEL_14;
    }
LABEL_15:
    v21 = 0;
    goto LABEL_16;
  }
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke;
  v27[3] = &__block_descriptor_40_e31_q24__0__NSNumber_8__NSNumber_16l;
  *(double *)&v27[4] = a4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("confidence"), v7, v27);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("mapItem"), v7, &__block_literal_global_37);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("mapItem"), v7, &__block_literal_global_24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3928];
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke_4;
  v24[3] = &unk_1E929C148;
  v25 = v13;
  v26 = v12;
  objc_msgSend(v18, "sortDescriptorWithKey:ascending:comparator:", CFSTR("mapItem"), v7, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v29[1] = v16;
  v29[2] = v17;
  v29[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingDescriptors:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v21;
}

uint64_t __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "doubleValue");
  v8 = v7;
  objc_msgSend(v6, "doubleValue");
  if (vabdd_f64(v8, v9) >= *(double *)(a1 + 32))
  {
    objc_msgSend(v5, "doubleValue");
    v12 = v11;
    objc_msgSend(v6, "doubleValue");
    if (v12 > v13)
      v10 = 1;
    else
      v10 = -1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
    return a3 == 0;
  else
    return -1;
}

uint64_t __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "extendedAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wifiFingerprintLabelType");

  objc_msgSend(v4, "extendedAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "wifiFingerprintLabelType");
  v9 = 1;
  v10 = -1;
  if (v6 == 1)
    v11 = 1;
  else
    v11 = -1;
  if (v8 != 2)
    v10 = v11;
  if (v6 != 2)
    v9 = v10;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

uint64_t __125__RTFusedInferredMapItem_sortFusedInferredMapItems_confidenceEqualityEpsilon_referenceLocation_distanceCalculator_ascending___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distanceFromLocation:toLocation:error:", v7, *(_QWORD *)(a1 + 40), 0);
  v9 = v8;

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "distanceFromLocation:toLocation:error:", v11, *(_QWORD *)(a1 + 40), 0);
  v13 = v12;

  v14 = -1;
  if (v9 < v13)
    v14 = 1;
  if (v9 == v13)
    return 0;
  else
    return v14;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
