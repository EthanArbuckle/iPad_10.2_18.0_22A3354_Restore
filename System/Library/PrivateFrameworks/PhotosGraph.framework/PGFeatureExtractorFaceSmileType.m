@implementation PGFeatureExtractorFaceSmileType

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("FaceSmileType");
  return CFSTR("FaceSmileType");
}

- (id)featureNames
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("FaceSmileTypeNotSet");
  v3[1] = CFSTR("FaceSmileTypeNoSmile");
  v3[2] = CFSTR("FaceSmileTypeSmile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 3;
}

- (id)defaultFloatVectorWithError:(id *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", &unk_1E84E9628);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D42A40]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[PGFeatureExtractorFaceSmileType _floatVectorForFaceSmileType:](self, "_floatVectorForFaceSmileType:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "smileType", (_QWORD)v15));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendRow:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_floatVectorForFaceSmileType:(unsigned __int16)a3
{
  if (a3 <= 2u)
    self = (PGFeatureExtractorFaceSmileType *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A20]), "initWithArray:", qword_1E8428AC0[a3]);
  return self;
}

@end
