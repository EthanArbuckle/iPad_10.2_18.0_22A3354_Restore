@implementation PLPhotoAnalysisPersonSuggestion

- (PLPhotoAnalysisPersonSuggestion)initWithSuggestionDictionary:(id)a3
{
  id v4;
  PLPhotoAnalysisPersonSuggestion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *keyFaceLocalIdentifier;
  uint64_t v14;
  NSString *personLocalIdentifier;
  double v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLPhotoAnalysisPersonSuggestion;
  v5 = -[PLPhotoAnalysisPersonSuggestion init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceCSN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personFaceCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confirmed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("similarityScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && v7 && v8 && v10 && v9)
    {
      v5->_keyFaceClusterSequenceNumber = objc_msgSend(v6, "integerValue");
      v12 = objc_msgSend(v7, "copy");
      keyFaceLocalIdentifier = v5->_keyFaceLocalIdentifier;
      v5->_keyFaceLocalIdentifier = (NSString *)v12;

      v14 = objc_msgSend(v8, "copy");
      personLocalIdentifier = v5->_personLocalIdentifier;
      v5->_personLocalIdentifier = (NSString *)v14;

      v5->_personFaceCount = objc_msgSend(v9, "integerValue");
      v5->_confirmed = objc_msgSend(v10, "BOOLValue");
      if (v11)
        objc_msgSend(v11, "doubleValue");
      else
        v16 = 0.0;
      v5->_similarityScore = v16;
    }
    else
    {

      v5 = 0;
    }

  }
  return v5;
}

- (id)suggestionDictionaryRepresentation
{
  void *v3;
  NSString *keyFaceLocalIdentifier;
  NSString *personLocalIdentifier;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("faceCSN");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_keyFaceClusterSequenceNumber);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  keyFaceLocalIdentifier = self->_keyFaceLocalIdentifier;
  personLocalIdentifier = self->_personLocalIdentifier;
  v11[0] = v3;
  v11[1] = keyFaceLocalIdentifier;
  v10[1] = CFSTR("faceIdentifier");
  v10[2] = CFSTR("personIdentifier");
  v11[2] = personLocalIdentifier;
  v10[3] = CFSTR("personFaceCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_personFaceCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("confirmed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_confirmed);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PLPhotoAnalysisPersonSuggestion;
  -[PLPhotoAnalysisPersonSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoAnalysisPersonSuggestion suggestionDictionaryRepresentation](self, "suggestionDictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)keyFaceClusterSequenceNumber
{
  return self->_keyFaceClusterSequenceNumber;
}

- (NSString)keyFaceLocalIdentifier
{
  return self->_keyFaceLocalIdentifier;
}

- (NSString)personLocalIdentifier
{
  return self->_personLocalIdentifier;
}

- (int64_t)personFaceCount
{
  return self->_personFaceCount;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (double)similarityScore
{
  return self->_similarityScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_keyFaceLocalIdentifier, 0);
}

@end
