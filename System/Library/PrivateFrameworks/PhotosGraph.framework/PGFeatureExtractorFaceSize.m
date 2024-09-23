@implementation PGFeatureExtractorFaceSize

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("FaceSize");
  return CFSTR("FaceSize");
}

- (id)featureNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("FaceSize");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 1;
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", &unk_1E84E95F8);
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D42A40]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v17 = 0;
        objc_msgSend(v13, "size");
        *(float *)&v14 = v14;
        v17 = LODWORD(v14);
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithFloats:count:", &v17, -[PGFeatureExtractorFaceSize featureLength](self, "featureLength"));
        objc_msgSend(v7, "appendRow:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

@end
