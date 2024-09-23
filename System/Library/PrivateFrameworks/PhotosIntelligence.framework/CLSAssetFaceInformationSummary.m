@implementation CLSAssetFaceInformationSummary

- (CLSAssetFaceInformationSummary)initWithNumberOfFaces:(unint64_t)a3 numberOfFacesIncludingPets:(unint64_t)a4 numberOfFacesOfVerifiedPersons:(unint64_t)a5 numberOfFacesOfHiddenPersons:(unint64_t)a6 numberOfGoodFaces:(unint64_t)a7 numberOfGoodFacesIncludingPets:(unint64_t)a8 numberOfGoodFacesOfVerifiedPersons:(unint64_t)a9 averageFaceQuality:(double)a10 averageFaceQualityIncludingPets:(double)a11 averageFaceQualityOfVerifiedPersons:(double)a12 userFeedbackScore:(double)a13 faceInformationByPersonLocalIdentifier:(id)a14 faceInformationByConsolidatedPersonLocalIdentifier:(id)a15
{
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  id v26;
  id v27;
  CLSAssetFaceInformationSummary *v28;
  CLSAssetFaceInformationSummary *v29;
  uint64_t v30;
  NSDictionary *faceInformationByPersonLocalIdentifier;
  uint64_t v32;
  NSDictionary *faceInformationByConsolidatedPersonLocalIdentifier;
  objc_super v35;

  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v26 = a14;
  v27 = a15;
  v35.receiver = self;
  v35.super_class = (Class)CLSAssetFaceInformationSummary;
  v28 = -[CLSAssetFaceInformationSummary init](&v35, sel_init);
  v29 = v28;
  if (v28)
  {
    v28->_numberOfFaces = v24;
    v28->_numberOfFacesIncludingPets = v23;
    v28->_numberOfFacesOfVerifiedPersons = v22;
    v28->_numberOfFacesOfHiddenPersons = v21;
    v28->_numberOfGoodFaces = v20;
    v28->_numberOfGoodFacesIncludingPets = v19;
    v28->_numberOfGoodFacesOfVerifiedPersons = a9;
    v28->_averageFaceQuality = a10;
    v28->_averageFaceQualityIncludingPets = a11;
    v28->_averageFaceQualityOfVerifiedPersons = a12;
    v28->_userFeedbackScore = a13;
    v30 = objc_msgSend(v26, "copy");
    faceInformationByPersonLocalIdentifier = v29->_faceInformationByPersonLocalIdentifier;
    v29->_faceInformationByPersonLocalIdentifier = (NSDictionary *)v30;

    v32 = objc_msgSend(v27, "copy");
    faceInformationByConsolidatedPersonLocalIdentifier = v29->_faceInformationByConsolidatedPersonLocalIdentifier;
    v29->_faceInformationByConsolidatedPersonLocalIdentifier = (NSDictionary *)v32;

  }
  return v29;
}

- (CLSAssetFaceInformationSummary)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CLSAssetFaceInformationSummary *v35;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfFaces"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfFacesIncludingPets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfFacesOfVerifiedPersons"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfFacesOfHiddenPersons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfGoodFaces"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfGoodFacesIncludingPets"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberOfGoodFacesOfVerifiedPersons"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageFaceQuality"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageFaceQualityIncludingPets"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageFaceQualityOfVerifiedPersons"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userFeedbackScore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  v29 = (void *)objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceInformationByPersonLocalIdentifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_faceInformationByPersonLocalIdentifierFromDictionaryRepresentation:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceInformationByConsolidatedPersonLocalIdentifier"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "_faceInformationByPersonLocalIdentifierFromDictionaryRepresentation:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = -[CLSAssetFaceInformationSummary initWithNumberOfFaces:numberOfFacesIncludingPets:numberOfFacesOfVerifiedPersons:numberOfFacesOfHiddenPersons:numberOfGoodFaces:numberOfGoodFacesIncludingPets:numberOfGoodFacesOfVerifiedPersons:averageFaceQuality:averageFaceQualityIncludingPets:averageFaceQualityOfVerifiedPersons:userFeedbackScore:faceInformationByPersonLocalIdentifier:faceInformationByConsolidatedPersonLocalIdentifier:](self, "initWithNumberOfFaces:numberOfFacesIncludingPets:numberOfFacesOfVerifiedPersons:numberOfFacesOfHiddenPersons:numberOfGoodFaces:numberOfGoodFacesIncludingPets:numberOfGoodFacesOfVerifiedPersons:averageFaceQuality:averageFaceQualityIncludingPets:averageFaceQualityOfVerifiedPersons:userFeedbackScore:faceInformationByPersonLocalIdentifier:faceInformationByConsolidatedPersonLocalIdentifier:", v38, v37, v8, v10, v12, v14, v19, v22, v25, v28, v16, v31, v34);
  return v35;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[13];
  _QWORD v19[15];

  v19[13] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("numberOfFaces");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_numberOfFaces);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("numberOfFacesIncludingPets");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_numberOfFacesIncludingPets);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("numberOfFacesOfVerifiedPersons");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_numberOfFacesOfVerifiedPersons);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = CFSTR("numberOfFacesOfHiddenPersons");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_numberOfFacesOfHiddenPersons);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  v18[4] = CFSTR("numberOfGoodFaces");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_numberOfGoodFaces);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v3;
  v18[5] = CFSTR("numberOfGoodFacesIncludingPets");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_numberOfGoodFacesIncludingPets);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v4;
  v18[6] = CFSTR("numberOfGoodFacesOfVerifiedPersons");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_numberOfGoodFacesOfVerifiedPersons);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v5;
  v18[7] = CFSTR("averageFaceQuality");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_averageFaceQuality);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v6;
  v18[8] = CFSTR("averageFaceQualityIncludingPets");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_averageFaceQualityIncludingPets);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v7;
  v18[9] = CFSTR("averageFaceQualityOfVerifiedPersons");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_averageFaceQualityOfVerifiedPersons);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v8;
  v18[10] = CFSTR("userFeedbackScore");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_userFeedbackScore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v9;
  v18[11] = CFSTR("faceInformationByPersonLocalIdentifier");
  -[CLSAssetFaceInformationSummary _dictionaryRepresentationForFaceInformationByPersonLocalIdentifier:](self, "_dictionaryRepresentationForFaceInformationByPersonLocalIdentifier:", self->_faceInformationByPersonLocalIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v10;
  v18[12] = CFSTR("faceInformationByConsolidatedPersonLocalIdentifier");
  -[CLSAssetFaceInformationSummary _dictionaryRepresentationForFaceInformationByPersonLocalIdentifier:](self, "_dictionaryRepresentationForFaceInformationByPersonLocalIdentifier:", self->_faceInformationByConsolidatedPersonLocalIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_dictionaryRepresentationForFaceInformationByPersonLocalIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __101__CLSAssetFaceInformationSummary__dictionaryRepresentationForFaceInformationByPersonLocalIdentifier___block_invoke;
  v8[3] = &unk_251480538;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (unsigned)numberOfFaces
{
  return self->_numberOfFaces;
}

- (unsigned)numberOfFacesIncludingPets
{
  return self->_numberOfFacesIncludingPets;
}

- (unsigned)numberOfFacesOfVerifiedPersons
{
  return self->_numberOfFacesOfVerifiedPersons;
}

- (unsigned)numberOfFacesOfHiddenPersons
{
  return self->_numberOfFacesOfHiddenPersons;
}

- (unsigned)numberOfGoodFaces
{
  return self->_numberOfGoodFaces;
}

- (unsigned)numberOfGoodFacesIncludingPets
{
  return self->_numberOfGoodFacesIncludingPets;
}

- (unsigned)numberOfGoodFacesOfVerifiedPersons
{
  return self->_numberOfGoodFacesOfVerifiedPersons;
}

- (double)averageFaceQuality
{
  return self->_averageFaceQuality;
}

- (double)averageFaceQualityIncludingPets
{
  return self->_averageFaceQualityIncludingPets;
}

- (double)averageFaceQualityOfVerifiedPersons
{
  return self->_averageFaceQualityOfVerifiedPersons;
}

- (double)userFeedbackScore
{
  return self->_userFeedbackScore;
}

- (NSDictionary)faceInformationByPersonLocalIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)faceInformationByConsolidatedPersonLocalIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceInformationByConsolidatedPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_faceInformationByPersonLocalIdentifier, 0);
}

void __101__CLSAssetFaceInformationSummary__dictionaryRepresentationForFaceInformationByPersonLocalIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "dictionaryRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

+ (id)_faceInformationByPersonLocalIdentifierFromDictionaryRepresentation:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __102__CLSAssetFaceInformationSummary__faceInformationByPersonLocalIdentifierFromDictionaryRepresentation___block_invoke;
  v8[3] = &unk_251480510;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __102__CLSAssetFaceInformationSummary__faceInformationByPersonLocalIdentifierFromDictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CLSFaceInformation *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[CLSFaceInformation initWithDictionaryRepresentation:]([CLSFaceInformation alloc], "initWithDictionaryRepresentation:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

@end
