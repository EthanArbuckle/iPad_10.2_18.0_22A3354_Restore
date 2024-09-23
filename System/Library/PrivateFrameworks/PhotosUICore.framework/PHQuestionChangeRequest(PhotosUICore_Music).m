@implementation PHQuestionChangeRequest(PhotosUICore_Music)

+ (id)memoryMusicQualityQuestionCreationRequestForMemory:()PhotosUICore_Music audioAsset:feedbackType:
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v7 = (void *)MEMORY[0x1E0CD1728];
  v8 = a4;
  objc_msgSend(a3, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend((id)objc_opt_class(), "_questionStateFromFeedbackType:", a5);
  objc_msgSend((id)objc_opt_class(), "_questionAdditionalInfoFromAudioAsset:feedbackType:", v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v15) = 0;
  objc_msgSend(v7, "creationRequestForQuestionWithEntityIdentifier:type:state:entityType:displayType:score:additionalInfo:creationDate:questionVersion:", v9, 15, v10, 2, 5, v11, 0.0, v12, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)changeMemoryMusicQualityFeedbackRequestForQuestion:()PhotosUICore_Music feedbackType:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v5 = (void *)MEMORY[0x1E0CD1728];
  v6 = a3;
  objc_msgSend(v5, "changeRequestForQuestion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v6, "additionalInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a4 - 1) > 4)
    v11 = CFSTR("None");
  else
    v11 = off_1E5122688[(unsigned __int16)(a4 - 1)];
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("feedbackDescription"));
  objc_msgSend(v7, "setAdditionalInfo:", v10);

  return v7;
}

+ (uint64_t)_questionStateFromFeedbackType:()PhotosUICore_Music
{
  if ((a3 - 1) > 4)
    return 0;
  else
    return word_1A7C096D0[(unsigned __int16)(a3 - 1)];
}

+ (id)_questionAdditionalInfoFromAudioAsset:()PhotosUICore_Music feedbackType:
{
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("songIdentifier");
  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v13[1] = CFSTR("songType");
  v7 = objc_msgSend(v5, "catalog");

  if (v7 > 4)
    v8 = CFSTR("Mock");
  else
    v8 = off_1E5133A28[v7];
  v9 = v8;
  v14[1] = v9;
  v13[2] = CFSTR("feedbackDescription");
  if ((a4 - 1) > 4)
    v10 = CFSTR("None");
  else
    v10 = off_1E5122688[(unsigned __int16)(a4 - 1)];
  v14[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
