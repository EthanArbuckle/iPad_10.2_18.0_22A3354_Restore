@implementation REStaticMLModel

- (float)_relevanceForFeatureMap:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  void *v9;
  const char *v10;
  float v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  const char *v16;
  float v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  const char *v23;
  float v24;
  float v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  float v38;

  v3 = a3;
  +[REFeature forcedFeature](REFeature, "forcedFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "valueForFeature:", v4);
  v7 = REDoubleValueForTaggedPointer(v5, v6);

  if (v7 <= 0.0)
  {
    +[REFeature dateFeature](REFeature, "dateFeature");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v3, "hasValueForFeature:", v12);

    if (v13)
    {
      +[REFeature dateFeature](REFeature, "dateFeature");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v3, "valueForFeature:", v14);
      v17 = REDoubleValueForTaggedPointer(v15, v16) * 0.0;

      v18 = 1;
    }
    else
    {
      v18 = 0;
      v17 = 1.0;
    }
    +[REFeature locationFeature](REFeature, "locationFeature");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v3, "hasValueForFeature:", v19);

    if (v20)
    {
      +[REFeature locationFeature](REFeature, "locationFeature");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v3, "valueForFeature:", v21);
      v24 = REDoubleValueForTaggedPointer(v22, v23);

      v25 = sqrt(v24 * 2.79999995 + 0.159999982 - (float)(v24 * v24)) + -1.39999998 + 1.0;
      v17 = v17 + (float)(v25 * 0.0);
      ++v18;
    }
    +[REFeature geofenceFeature](REFeature, "geofenceFeature");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v3, "hasValueForFeature:", v26);

    if (v27)
    {
      +[REFeature geofenceFeature](REFeature, "geofenceFeature");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v3, "valueForFeature:", v28);
      v17 = REDoubleValueForTaggedPointer(v29, v30) * 0.0 * v17;

      ++v18;
    }
    +[REFeature conditionalFeature](REFeature, "conditionalFeature");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v3, "hasValueForFeature:", v31);

    if (v32)
    {
      +[REFeature conditionalFeature](REFeature, "conditionalFeature");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v3, "valueForFeature:", v33);
      v17 = REDoubleValueForTaggedPointer(v34, v35) * v17;

      ++v18;
    }
    +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v3, "hasValueForFeature:", v36);

    v38 = sqrtf(v17);
    if (v18 == v37 << 63 >> 63)
      v11 = 0.0;
    else
      v11 = v38;
  }
  else
  {
    +[REFeature forcedFeature](REFeature, "forcedFeature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v3, "valueForFeature:", v8);
    v11 = REDoubleValueForTaggedPointer(v9, v10);

  }
  return v11;
}

- (float)_usageForFeatureSet:(id)a3
{
  id v3;
  void *v4;
  int v5;
  float v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  const char *v14;

  v3 = a3;
  +[REFeature appUsageFeature](REFeature, "appUsageFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasValueForFeature:", v4);

  v6 = 0.0;
  if (v5)
  {
    +[REFeature appUsageFeature](REFeature, "appUsageFeature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "valueForFeature:", v7);
    v6 = REDoubleValueForTaggedPointer(v8, v9) * 0.00999999978 + 0.0;

  }
  +[REFeature siriDomainFeature](REFeature, "siriDomainFeature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "hasValueForFeature:", v10);

  if (v11)
  {
    +[REFeature siriDomainFeature](REFeature, "siriDomainFeature");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v3, "valueForFeature:", v12);
    v6 = v6 + REDoubleValueForTaggedPointer(v13, v14) * 0.00999999978;

  }
  return v6;
}

- (id)_predictWithFeatures:(id)a3
{
  id v4;
  float v5;
  float v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v4 = a3;
  -[REStaticMLModel _relevanceForFeatureMap:](self, "_relevanceForFeatureMap:", v4);
  v6 = v5;
  if (!RERelevanceEqualToRelevance(v5, 0.0))
  {
    -[REStaticMLModel _usageForFeatureSet:](self, "_usageForFeatureSet:", v4);
    v6 = v6 + v9;
  }
  v10 = v6;
  if (v6 < 0.0)
    v10 = 0.0;
  v11 = 1.0;
  v12 = fmin(v10, 1.0);
  *(float *)&v12 = v12;
  LODWORD(v11) = 0;
  LODWORD(v7) = 0;
  LODWORD(v8) = 0;
  +[REMLPrediction predictionWithProbability:mean:variance:pessimistic:](REMLPrediction, "predictionWithProbability:mean:variance:pessimistic:", v12, v11, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (unint64_t)featureBitWidth
{
  return 64;
}

@end
