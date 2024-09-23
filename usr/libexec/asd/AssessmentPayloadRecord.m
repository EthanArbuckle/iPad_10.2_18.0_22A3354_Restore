@implementation AssessmentPayloadRecord

- (AssessmentPayloadRecord)initWithObject:(id)a3
{
  id v4;
  AssessmentPayloadRecord *v5;
  AssessmentPayloadRecord *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  NSString *workflowID;
  uint64_t v31;
  NSDate *createdAt;
  uint64_t v33;
  NSString *assessment;
  uint64_t v35;
  NSString *trainingData;
  uint64_t v37;
  NSString *trainingSignalID;
  uint64_t v39;
  NSString *assessmentGUID;
  uint64_t v41;
  NSString *assessmentGUIDSeeds;
  uint64_t v43;
  NSString *trainingGUID;
  uint64_t v45;
  NSString *trainingGUIDSeeds;
  uint64_t v47;
  NSNumber *digestIndex;
  uint64_t v49;
  NSDictionary *bindings;
  uint64_t v51;
  NSArray *bindingsToCompare;
  uint64_t v53;
  NSNumber *refreshTTL;
  uint64_t v55;
  NSString *encryptedTSID;
  uint64_t v57;
  NSString *encryptedAGUID;
  uint64_t v59;
  NSString *otdDestinationHost;
  uint64_t v61;
  NSString *profileID;
  void *v63;
  id v64;
  id v65;
  id v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  objc_super v70;

  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)AssessmentPayloadRecord;
  v5 = -[AssessmentPayloadRecord init](&v70, "init");
  if (!v5)
    goto LABEL_26;
  v6 = (AssessmentPayloadRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workflowID"));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createdAt"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assessment"));
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trainingData"));
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trainingSignalID"));
          if (v13)
          {
            v14 = (void *)v13;
            v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assessmentGUID"));
            if (v15)
            {
              v16 = (void *)v15;
              v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assessmentGUIDSeeds"));
              if (v17)
              {
                v18 = (void *)v17;
                v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trainingData"));
                if (v19)
                {
                  v20 = (void *)v19;
                  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trainingGUIDSeeds"));
                  if (v21)
                  {
                    v69 = (void *)v21;
                    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "digestIndex"));
                    if (v22)
                    {
                      v68 = (void *)v22;
                      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bindings"));
                      if (v23)
                      {
                        v66 = v23;
                        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bindingsToCompare"));
                        if (v24)
                        {
                          v65 = v24;
                          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encryptedTSID"));
                          if (v25)
                          {
                            v64 = v25;
                            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encryptedAGUID"));
                            if (v26)
                            {
                              v63 = v26;
                              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profileID"));
                              v67 = v27 != 0;

                              v26 = v63;
                            }
                            else
                            {
                              v67 = 0;
                            }

                            v25 = v64;
                          }
                          else
                          {
                            v67 = 0;
                          }

                          v24 = v65;
                        }
                        else
                        {
                          v67 = 0;
                        }

                        v23 = v66;
                      }
                      else
                      {
                        v67 = 0;
                      }

                      if (v67)
                      {
                        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workflowID"));
                        workflowID = v5->_workflowID;
                        v5->_workflowID = (NSString *)v29;

                        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createdAt"));
                        createdAt = v5->_createdAt;
                        v5->_createdAt = (NSDate *)v31;

                        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assessment"));
                        assessment = v5->_assessment;
                        v5->_assessment = (NSString *)v33;

                        v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trainingData"));
                        trainingData = v5->_trainingData;
                        v5->_trainingData = (NSString *)v35;

                        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trainingSignalID"));
                        trainingSignalID = v5->_trainingSignalID;
                        v5->_trainingSignalID = (NSString *)v37;

                        v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assessmentGUID"));
                        assessmentGUID = v5->_assessmentGUID;
                        v5->_assessmentGUID = (NSString *)v39;

                        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assessmentGUIDSeeds"));
                        assessmentGUIDSeeds = v5->_assessmentGUIDSeeds;
                        v5->_assessmentGUIDSeeds = (NSString *)v41;

                        v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trainingGUID"));
                        trainingGUID = v5->_trainingGUID;
                        v5->_trainingGUID = (NSString *)v43;

                        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trainingGUIDSeeds"));
                        trainingGUIDSeeds = v5->_trainingGUIDSeeds;
                        v5->_trainingGUIDSeeds = (NSString *)v45;

                        v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "digestIndex"));
                        digestIndex = v5->_digestIndex;
                        v5->_digestIndex = (NSNumber *)v47;

                        v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bindings"));
                        bindings = v5->_bindings;
                        v5->_bindings = (NSDictionary *)v49;

                        v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bindingsToCompare"));
                        bindingsToCompare = v5->_bindingsToCompare;
                        v5->_bindingsToCompare = (NSArray *)v51;

                        v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "refreshTTL"));
                        refreshTTL = v5->_refreshTTL;
                        v5->_refreshTTL = (NSNumber *)v53;

                        v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encryptedTSID"));
                        encryptedTSID = v5->_encryptedTSID;
                        v5->_encryptedTSID = (NSString *)v55;

                        v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encryptedAGUID"));
                        encryptedAGUID = v5->_encryptedAGUID;
                        v5->_encryptedAGUID = (NSString *)v57;

                        v5->_shouldSendOTD = objc_msgSend(v4, "shouldSendOTD");
                        v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "otdDestinationHost"));
                        otdDestinationHost = v5->_otdDestinationHost;
                        v5->_otdDestinationHost = (NSString *)v59;

                        v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profileID"));
                        profileID = v5->_profileID;
                        v5->_profileID = (NSString *)v61;

                        v6 = v5;
                        goto LABEL_27;
                      }
                      goto LABEL_26;
                    }

                  }
                }

              }
            }

          }
        }

      }
    }

LABEL_26:
    v6 = 0;
  }
LABEL_27:

  return v6;
}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSString)assessment
{
  return self->_assessment;
}

- (NSString)trainingData
{
  return self->_trainingData;
}

- (NSString)trainingSignalID
{
  return self->_trainingSignalID;
}

- (NSString)assessmentGUID
{
  return self->_assessmentGUID;
}

- (NSString)assessmentGUIDSeeds
{
  return self->_assessmentGUIDSeeds;
}

- (NSString)trainingGUID
{
  return self->_trainingGUID;
}

- (NSString)trainingGUIDSeeds
{
  return self->_trainingGUIDSeeds;
}

- (NSNumber)digestIndex
{
  return self->_digestIndex;
}

- (NSDictionary)bindings
{
  return self->_bindings;
}

- (NSArray)bindingsToCompare
{
  return self->_bindingsToCompare;
}

- (NSNumber)refreshTTL
{
  return self->_refreshTTL;
}

- (NSString)encryptedTSID
{
  return self->_encryptedTSID;
}

- (NSString)encryptedAGUID
{
  return self->_encryptedAGUID;
}

- (BOOL)shouldSendOTD
{
  return self->_shouldSendOTD;
}

- (NSString)otdDestinationHost
{
  return self->_otdDestinationHost;
}

- (NSString)profileID
{
  return self->_profileID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileID, 0);
  objc_storeStrong((id *)&self->_otdDestinationHost, 0);
  objc_storeStrong((id *)&self->_encryptedAGUID, 0);
  objc_storeStrong((id *)&self->_encryptedTSID, 0);
  objc_storeStrong((id *)&self->_refreshTTL, 0);
  objc_storeStrong((id *)&self->_bindingsToCompare, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
  objc_storeStrong((id *)&self->_digestIndex, 0);
  objc_storeStrong((id *)&self->_trainingGUIDSeeds, 0);
  objc_storeStrong((id *)&self->_trainingGUID, 0);
  objc_storeStrong((id *)&self->_assessmentGUIDSeeds, 0);
  objc_storeStrong((id *)&self->_assessmentGUID, 0);
  objc_storeStrong((id *)&self->_trainingSignalID, 0);
  objc_storeStrong((id *)&self->_trainingData, 0);
  objc_storeStrong((id *)&self->_assessment, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_workflowID, 0);
}

@end
