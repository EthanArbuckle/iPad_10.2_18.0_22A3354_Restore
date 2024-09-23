@implementation RTVisitDecoder

- (RTVisitDecoder)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHyperParameter_);
}

- (RTVisitDecoder)initWithHyperParameter:(id)a3
{
  id v5;
  RTVisitDecoder *v6;
  RTVisitDecoder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTVisitDecoder;
  v6 = -[RTVisitDecoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_hyperParameter, a3);

  return v7;
}

- (void)reset
{
  NSArray *beam;

  beam = self->_beam;
  self->_beam = 0;

}

- (void)updateSuccessor:(id)a3 newNode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "outputType");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10 || (objc_msgSend(v10, "logProbability"), v13 = v12, objc_msgSend(v7, "logProbability"), v13 < v14))
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v9);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", v16, 2u);
      }

      v9 = 0;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: successor", buf, 2u);
    }
  }

}

- (id)createSuccessor:(id)a3 probabilities:(const float *)a4 firstTimeStepDate:(id)a5 currentDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  long double v18;
  float v19;
  long double v20;
  void *v21;
  int v22;
  double v23;
  long double v24;
  RTVisitDecoded *v25;
  double v26;
  RTVisitDecoded *v27;
  long double v28;
  RTVisitDecoded *v29;
  double v30;
  long double v31;
  double v32;
  RTVisitDecoded *v33;
  double v34;
  long double v35;
  RTVisitDecoded *v36;
  void *v37;
  double v38;
  RTVisitDecoded *v39;
  double v40;
  RTVisitDecoded *v41;
  void *v42;
  double v43;
  long double v44;
  double v45;
  double v46;
  RTVisitDecoded *v47;
  id v48;
  void *v49;
  void *v50;
  double v51;
  const char *v52;
  id v54;
  id v55;
  NSObject *obj;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[16];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: beam";
LABEL_36:
    _os_log_error_impl(&dword_1D1A22000, obj, OS_LOG_TYPE_ERROR, v52, buf, 2u);
    goto LABEL_37;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: probabilities";
    goto LABEL_36;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    obj = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v52 = "Invalid parameter not satisfying: firstTimeStepDate";
    goto LABEL_36;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v10;
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v14)
  {
    v15 = v14;
    v54 = v10;
    v55 = v12;
    v57 = *(_QWORD *)v59;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v59 != v57)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v18 = *a4;
        v19 = a4[3];
        v20 = (float)(a4[1] + a4[2]);
        objc_msgSend(v17, "entryDate", v54);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isBeforeDate:", v11);

        if (v22)
          v23 = v18;
        else
          v23 = -0.0;
        if (objc_msgSend(v17, "noVisit"))
        {
          -[RTVisitHyperParameter minNoVisitProbability](self->_hyperParameter, "minNoVisitProbability");
          if (v24 <= v18)
          {
            v25 = [RTVisitDecoded alloc];
            objc_msgSend(v17, "logProbability");
            v27 = -[RTVisitDecoded initWithEntryDate:exitDate:logProbability:](v25, "initWithEntryDate:exitDate:logProbability:", 0, 0, (double)(log(v18) + v26));
            -[RTVisitDecoder updateSuccessor:newNode:](self, "updateSuccessor:newNode:", v13, v27);

          }
          -[RTVisitHyperParameter minEntryProbability](self->_hyperParameter, "minEntryProbability");
          if (v28 <= v20)
          {
            v29 = [RTVisitDecoded alloc];
            objc_msgSend(v17, "logProbability");
            v31 = log(v20) + v30;
            -[RTVisitHyperParameter decoderEntryCost](self->_hyperParameter, "decoderEntryCost");
            v33 = -[RTVisitDecoded initWithEntryDate:exitDate:logProbability:](v29, "initWithEntryDate:exitDate:logProbability:", v12, 0, (double)(v31 - v32));
            goto LABEL_26;
          }
        }
        else
        {
          v34 = v23 + v19;
          if (objc_msgSend(v17, "partialVisit"))
          {
            -[RTVisitHyperParameter minEntryProbability](self->_hyperParameter, "minEntryProbability");
            if (v35 <= v20)
            {
              v36 = [RTVisitDecoded alloc];
              objc_msgSend(v17, "entryDate");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "logProbability");
              v39 = -[RTVisitDecoded initWithEntryDate:exitDate:logProbability:](v36, "initWithEntryDate:exitDate:logProbability:", v37, 0, (double)(log(v20) + v38));

              -[RTVisitDecoder updateSuccessor:newNode:](self, "updateSuccessor:newNode:", v13, v39);
            }
            -[RTVisitHyperParameter minExitProbability](self->_hyperParameter, "minExitProbability");
            if (v34 >= v40)
            {
              v41 = [RTVisitDecoded alloc];
              objc_msgSend(v17, "entryDate");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "logProbability");
              v44 = log(v34) + v43;
              -[RTVisitHyperParameter decoderExitCost](self->_hyperParameter, "decoderExitCost");
              v33 = -[RTVisitDecoded initWithEntryDate:exitDate:logProbability:](v41, "initWithEntryDate:exitDate:logProbability:", v42, v12, (double)(v44 - v45));
              goto LABEL_25;
            }
          }
          else if (objc_msgSend(v17, "completeVisit"))
          {
            -[RTVisitHyperParameter minExitProbability](self->_hyperParameter, "minExitProbability");
            if (v34 >= v46)
            {
              v47 = [RTVisitDecoded alloc];
              objc_msgSend(v17, "entryDate");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "exitDate");
              v48 = v11;
              v49 = v13;
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "logProbability");
              v33 = -[RTVisitDecoded initWithEntryDate:exitDate:logProbability:](v47, "initWithEntryDate:exitDate:logProbability:", v42, v50, (double)(log(v23 + v19) + v51));

              v13 = v49;
              v11 = v48;
              v12 = v55;
LABEL_25:

LABEL_26:
              -[RTVisitDecoder updateSuccessor:newNode:](self, "updateSuccessor:newNode:", v13, v33);

              continue;
            }
          }
        }
      }
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      if (!v15)
      {
        v10 = v54;
        break;
      }
    }
  }
LABEL_37:

  return v13;
}

- (id)decodeWithProbabilities:(const float *)a3 batchSize:(unint64_t)a4 firstTimeStepDate:(id)a5
{
  id v7;
  __int128 v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *beam;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSArray *v17;
  NSObject *p_super;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  char v29;
  NSArray *v30;
  NSObject *v31;
  const char *v32;
  __int128 v34;
  void *v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  NSArray *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v9 = v7;
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_30:

LABEL_31:
      v14 = 0;
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: probabilities";
LABEL_35:
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
    goto LABEL_30;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: firstTimeStepDate";
    goto LABEL_35;
  }
  if (!self->_beam)
  {
    v10 = (void *)objc_opt_new();
    v45[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    beam = self->_beam;
    self->_beam = v11;

  }
  if (!a4)
    goto LABEL_31;
  v13 = 0;
  v14 = 0;
  *(_QWORD *)&v8 = 138412290;
  v34 = v8;
  v35 = v9;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v9, (double)(-[RTVisitHyperParameter visitInferenceResolution](self->_hyperParameter, "visitInferenceResolution", v34)* v13* -[RTVisitHyperParameter timeStepInterval](self->_hyperParameter, "timeStepInterval")));
    v15 = objc_claimAutoreleasedReturnValue();
    -[RTVisitDecoder createSuccessor:probabilities:firstTimeStepDate:currentDate:](self, "createSuccessor:probabilities:firstTimeStepDate:currentDate:", self->_beam, a3, v9, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v15;
    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "allValues");
      v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
      p_super = &self->_beam->super;
      self->_beam = v17;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v30 = self->_beam;
        *(_DWORD *)buf = v34;
        v44 = v30;
        _os_log_error_impl(&dword_1D1A22000, p_super, OS_LOG_TYPE_ERROR, "no successor for beam=%@", buf, 0xCu);
      }
    }

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v19 = self->_beam;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v20)
    {
      v21 = v20;
      v14 = 0;
      v22 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v39 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (v14)
          {
            objc_msgSend(v14, "logProbability");
            v26 = v25;
            objc_msgSend(v24, "logProbability");
            if (v26 < v27)
            {
              v28 = v24;

              v14 = v28;
            }
          }
          else
          {
            v14 = v24;
          }
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v21);
    }
    else
    {
      v14 = 0;
    }

    v29 = objc_msgSend(v14, "completeVisit");
    if ((v29 & 1) != 0)
      break;
    a3 += 4;
    ++v13;
    v9 = v35;
    if (v13 == a4)
      goto LABEL_32;
  }
  v9 = v35;
LABEL_32:

  return v14;
}

- (RTVisitHyperParameter)hyperParameter
{
  return self->_hyperParameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameter, 0);
  objc_storeStrong((id *)&self->_beam, 0);
}

@end
