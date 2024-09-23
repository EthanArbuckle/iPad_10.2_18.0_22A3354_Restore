@implementation PHQuestion(PhotosUICore_Music)

- (uint64_t)memoryMusicQualityFeedbackType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "additionalInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("feedbackDescription"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PXMemoryMusicQualityFeedbackTypeForString(v2);

  return v3;
}

+ (id)fetchMemoryMusicQualityQuestionForMemory:()PhotosUICore_Music audioAsset:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v5, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("type == %d AND entityIdentifier == %@"), 15, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CD1720], "fetchQuestionsWithOptions:validQuestionsOnly:", v8, 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v23 = v5;
    v15 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "additionalInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("songIdentifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          v20 = v6 == 0;
        else
          v20 = 1;
        if (!v20 && (objc_msgSend(v19, "isEqualToString:", v6) & 1) != 0)
        {
          v21 = v17;

          goto LABEL_15;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
        continue;
      break;
    }
    v21 = 0;
LABEL_15:
    v5 = v23;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
