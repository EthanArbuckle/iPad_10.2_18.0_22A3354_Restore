@implementation PersonalizedItemClientRankingFunction

+ (id)clientRankingFunctionForGEOClientRankingModel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithModel:", v4);

  return v5;
}

- (PersonalizedItemClientRankingFunction)initWithModel:(id)a3
{
  id v5;
  PersonalizedItemClientRankingFunction *v6;
  PersonalizedItemClientRankingFunction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonalizedItemClientRankingFunction;
  v6 = -[PersonalizedItemClientRankingFunction init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (double)clientRankingScoreForPersonalizedItemSignalPack:(id)a3 withServerScore:(id)a4 hasContributionsFromDiscreteFeaturesResult:(BOOL *)a5
{
  id v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v8 = a3;
  objc_msgSend(a4, "normalizedScore");
  if (a5)
    *a5 = 0;
  v10 = v9;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemClientRankingFunction model](self, "model", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "features"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "featureIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "function"));
        -[PersonalizedItemClientRankingFunction weightedScoreForModelFeatureIdentifier:function:personalizedItemSignalPack:](self, "weightedScoreForModelFeatureIdentifier:function:personalizedItemSignalPack:", v18, v19, v8);
        v21 = v20;

        if (a5)
        {
          if (v21 != 0.0)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "function"));
            v23 = objc_msgSend(v22, "functionType");

            if (v23 == (id)2)
              *a5 = 1;
          }
        }
        v10 = v10 + v21;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  v24 = exp(-v10);
  return 1.0 / (v24 + 1.0);
}

- (double)weightedScoreForModelFeatureIdentifier:(id)a3 function:(id)a4 personalizedItemSignalPack:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  unsigned int v12;
  unsigned int v13;
  id v14;
  double v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  id v23;
  long double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  id v35;
  double v36;
  double v37;
  double v38;
  float v39;
  id v40;
  id v41;
  float v42;
  float v43;
  double v44;
  float v45;
  double v46;
  float v47;
  float v48;
  float v49;
  float v50;
  id v52;
  id v53;
  id v54;
  id obj;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v8 = a3;
  v9 = a4;
  v56 = a5;
  v10 = objc_msgSend(v8, "featureIdentifierType");
  if (v10 == (id)3)
  {
    v53 = v9;
    v54 = v8;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v52 = v8;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "unitExponentPairs"));
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (!v16)
    {
      v18 = 0;
      goto LABEL_27;
    }
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v58;
    while (1)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unit"));
        v23 = objc_msgSend(v22, "featureType");

        if (v23 == (id)2)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unit"));
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "feature"));
        }
        else
        {
          v24 = 0.0;
          if (v23 != (id)1)
            goto LABEL_18;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unit"));
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "source"));
        }
        v27 = (void *)v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unit"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "function"));
        -[PersonalizedItemClientRankingFunction weightedScoreForModelFeatureIdentifier:function:personalizedItemSignalPack:](self, "weightedScoreForModelFeatureIdentifier:function:personalizedItemSignalPack:", v27, v29, v56);
        v24 = v30;

LABEL_18:
        v31 = pow(v24, (double)objc_msgSend(v21, "exponent"));
        v32 = v31;
        if (v18)
        {
          objc_msgSend(v18, "doubleValue");
          v34 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v32 * v33));

          v18 = (void *)v34;
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v31));
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (!v17)
      {
LABEL_27:

        objc_msgSend(v18, "doubleValue");
        v38 = v37;
        objc_msgSend(v52, "featureWeight");
        v11 = v38 * v39;

        v9 = v53;
        v8 = v54;
        goto LABEL_39;
      }
    }
  }
  v11 = 0.0;
  if (v10 == (id)2)
  {
    v35 = objc_msgSend(v8, "featureType");
    if (!objc_msgSend(v56, "hasValueForFeatureType:", v35))
      goto LABEL_39;
    objc_msgSend(v56, "valueForFeatureType:", v35);
    v15 = v36;
LABEL_29:
    v40 = objc_msgSend(v9, "functionType");
    if (v40 != (id)2)
    {
      if (v40 != (id)1)
        goto LABEL_39;
      v41 = v9;
      objc_msgSend(v41, "maxRelativeValue");
      v11 = 0.0;
      if (v42 != 0.0)
      {
        objc_msgSend(v41, "meanValue");
        v44 = v15 - v43;
        objc_msgSend(v41, "maxRelativeValue");
        v46 = v44 / v45;
        objc_msgSend(v41, "weight");
        v11 = fmin(fmax(v46, -1.0), 1.0) * v47;
      }
LABEL_38:

      goto LABEL_39;
    }
    v41 = v9;
    objc_msgSend(v41, "valueThresholdLow");
    if (v15 <= v48)
    {
      objc_msgSend(v41, "weightLow");
    }
    else
    {
      objc_msgSend(v41, "valueThresholdHigh");
      if (v15 < v49)
        goto LABEL_38;
      objc_msgSend(v41, "weightHigh");
    }
    v11 = v50;
    goto LABEL_38;
  }
  if (v10 != (id)1)
    goto LABEL_39;
  v12 = objc_msgSend(v8, "suggestionType");
  v13 = objc_msgSend(v8, "serverEntryType");
  v14 = objc_msgSend(v8, "sourceType");
  if (v14 == (id)1)
  {
    v15 = 1.0;
    if (v13 != objc_msgSend(v56, "itemServerEntryTypeSource"))
      goto LABEL_39;
    goto LABEL_29;
  }
  if (!v14)
  {
    v15 = 1.0;
    if (v12 == objc_msgSend(v56, "itemSuggestionTypeSource"))
      goto LABEL_29;
  }
LABEL_39:

  return v11;
}

- (void)describeInLog:(id)a3 withType:(unsigned __int8)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSString *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *j;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  float v35;
  double v36;
  float v37;
  double v38;
  float v39;
  NSString *v40;
  float v41;
  double v42;
  float v43;
  double v44;
  float v45;
  double v46;
  float v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  unsigned __int8 v51;
  void *v52;
  id obj;
  uint64_t v54;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];

  v6 = a3;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemClientRankingFunction model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "features"));

  obj = v8;
  v55 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v62;
    v51 = a4;
    v50 = v6;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v54)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "featureIdentifier"));
        v12 = objc_msgSend(v11, "featureIdentifierType");

        if (v12 != (id)3)
        {
          if (v12 == (id)2)
          {
            v56 = i;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "featureIdentifier"));
            v16 = sub_100B37DF4(v13);
            v15 = objc_claimAutoreleasedReturnValue(v16);
          }
          else
          {
            if (v12 != (id)1)
            {
              v17 = 0;
              goto LABEL_28;
            }
            v56 = i;
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "featureIdentifier"));
            v14 = sub_100B37CE8(v13);
            v15 = objc_claimAutoreleasedReturnValue(v14);
          }
          v17 = (id)v15;
          goto LABEL_26;
        }
        v56 = i;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "featureIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "unitExponentPairs"));

        v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        if (!v17)
          goto LABEL_26;
        v52 = v10;
        v19 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(_QWORD *)v58 != v19)
              objc_enumerationMutation(v13);
            v21 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
            v22 = objc_msgSend(v21, "exponent");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unit"));
            v24 = objc_msgSend(v23, "featureType");

            if (v24 == (id)2)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unit"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "feature"));
              v29 = sub_100B37DF4(v26);
              v28 = objc_claimAutoreleasedReturnValue(v29);
              goto LABEL_21;
            }
            if (v24 == (id)1)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "unit"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "source"));
              v27 = sub_100B37CE8(v26);
              v28 = objc_claimAutoreleasedReturnValue(v27);
LABEL_21:
              v30 = (void *)v28;

              goto LABEL_23;
            }
            v30 = 0;
LABEL_23:
            v31 = objc_msgSend(CFSTR("Composite:"), "stringByAppendingFormat:", CFSTR("[Exp:%u,Desc:%@],"), v22, v30);

          }
          v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        }
        while (v17);
        a4 = v51;
        v6 = v50;
        v10 = v52;
LABEL_26:

        i = v56;
LABEL_28:
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "function"));
        v33 = objc_msgSend(v32, "functionType");

        if (v33 == (id)2)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "function"));
          objc_msgSend(v34, "valueThresholdLow");
          v42 = v41;
          objc_msgSend(v34, "weightLow");
          v44 = v43;
          objc_msgSend(v34, "valueThresholdHigh");
          v46 = v45;
          objc_msgSend(v34, "weightHigh");
          v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Discrete: ThresholdLow=%f, WeightLow=%f, ThresholdHigh=%f, WeightHigh=%f"), *(_QWORD *)&v42, *(_QWORD *)&v44, *(_QWORD *)&v46, v47);
LABEL_32:
          v48 = (void *)objc_claimAutoreleasedReturnValue(v40);

        }
        else
        {
          if (v33 == (id)1)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "function"));
            objc_msgSend(v34, "weight");
            v36 = v35;
            objc_msgSend(v34, "meanValue");
            v38 = v37;
            objc_msgSend(v34, "maxRelativeValue");
            v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Weight=%f, Mean=%f, MaxRelative=%f"), *(_QWORD *)&v36, *(_QWORD *)&v38, v39, v49);
            goto LABEL_32;
          }
          v48 = 0;
        }
        if (os_log_type_enabled(v6, (os_log_type_t)a4))
        {
          *(_DWORD *)buf = 138412546;
          v66 = v17;
          v67 = 2112;
          v68 = v48;
          _os_log_impl((void *)&_mh_execute_header, v6, (os_log_type_t)a4, "Client ranking model feature: %@ -> %@", buf, 0x16u);
        }

      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v55);
  }

}

- (GEOClientRankingModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
