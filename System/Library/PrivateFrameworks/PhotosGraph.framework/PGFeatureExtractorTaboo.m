@implementation PGFeatureExtractorTaboo

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("Taboo");
  return CFSTR("Taboo");
}

- (id)featureNames
{
  _QWORD v3[10];

  v3[9] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Blood");
  v3[1] = CFSTR("Demonstration");
  v3[2] = CFSTR("FireDevastation");
  v3[3] = CFSTR("FloodDevastation");
  v3[4] = CFSTR("Funeral");
  v3[5] = CFSTR("Hospital");
  v3[6] = CFSTR("ReligiousSetting");
  v3[7] = CFSTR("VehicleCrash");
  v3[8] = CFSTR("War");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 9;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sceneClassifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42A48], "zerosOfCount:", -[PGFeatureExtractorTaboo featureLength](self, "featureLength"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "extendedSceneIdentifier", (_QWORD)v15)
            - 2147482870;
        if (v12 <= 9 && ((0x2FFu >> v12) & 1) != 0)
        {
          LODWORD(v13) = 1.0;
          objc_msgSend(v6, "setFloat:atIndex:", qword_1CA8ECAA0[v12], v13);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

@end
