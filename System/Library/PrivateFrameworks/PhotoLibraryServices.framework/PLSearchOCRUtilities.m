@implementation PLSearchOCRUtilities

+ (id)ocrTextLinesFromDocumentObservation:(id)a3
{
  return (id)objc_msgSend(a1, "_ocrTextLinesFromDocumentObservation:allowLowConfidence:", a3, 0);
}

+ (id)spotlightTextLinesFromDocumentObservation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  int v22;
  void *v23;
  double v24;
  id v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (spotlightTextLinesFromDocumentObservation__onceToken != -1)
      dispatch_once(&spotlightTextLinesFromDocumentObservation__onceToken, &__block_literal_global_82536);
    v29 = (id)objc_opt_new();
    +[PLSearchOCRUtilities ocrTextLinesFromDocumentObservation:](PLSearchOCRUtilities, "ocrTextLinesFromDocumentObservation:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v4;
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(a1, "_textFoundLine");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayByAddingObject:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v5;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v30)
    {
      v28 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v10 = objc_alloc(MEMORY[0x1E0CA6B08]);
          objc_msgSend(v9, "textBounds");
          v15 = (void *)objc_msgSend(v10, "initWithTextBounds:isTitle:", objc_msgSend(v9, "isTitle"), v11, v12, v13, v14);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          objc_msgSend(v9, "candidates");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v32 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
                v22 = spotlightTextLinesFromDocumentObservation__disableOCRDonationWorkaround;
                objc_msgSend(v21, "line");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v22)
                  objc_msgSend(v21, "confidence");
                else
                  v24 = 1.0;
                objc_msgSend(v15, "addCandidate:confidence:", v23, v24);

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v18);
          }

          objc_msgSend(v29, "addObject:", v15);
        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v30);
    }

    v4 = v26;
  }
  else
  {
    v29 = (id)MEMORY[0x1E0C9AA60];
  }

  return v29;
}

+ (id)jsonOCRTextLinesFromDocumentObservation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id obj;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[4];
  _QWORD v47[4];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;
  NSRect v51;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v31 = (id)objc_opt_new();
    v28 = v4;
    +[PLSearchOCRUtilities _ocrTextLinesFromDocumentObservation:allowLowConfidence:](PLSearchOCRUtilities, "_ocrTextLinesFromDocumentObservation:allowLowConfidence:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(a1, "_textFoundLine");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayByAddingObject:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v5;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v32)
    {
      v30 = *(_QWORD *)v41;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v41 != v30)
            objc_enumerationMutation(obj);
          v34 = v8;
          v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
          v10 = (void *)objc_opt_new();
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v33 = v9;
          objc_msgSend(v9, "candidates");
          v35 = (id)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v37 != v13)
                  objc_enumerationMutation(v35);
                v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                objc_msgSend(v15, "confidence");
                v17 = v16 > 0.3;
                v46[0] = CFSTR("line");
                objc_msgSend(v15, "line");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v47[0] = v18;
                v46[1] = CFSTR("words");
                objc_msgSend(v15, "words");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v47[1] = v19;
                v46[2] = CFSTR("confidence");
                v20 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v15, "confidence");
                objc_msgSend(v20, "numberWithDouble:");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v47[2] = v21;
                v46[3] = CFSTR("isAboveThreshold");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v47[3] = v22;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 4);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v10, "addObject:", v23);
              }
              v12 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
            }
            while (v12);
          }

          v44[0] = CFSTR("isTitle");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v33, "isTitle"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = v24;
          v44[1] = CFSTR("textBounds");
          objc_msgSend(v33, "textBounds");
          NSStringFromRect(v51);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v44[2] = CFSTR("lineCandidates");
          v45[1] = v25;
          v45[2] = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "addObject:", v26);
          v8 = v34 + 1;
        }
        while (v34 + 1 != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v32);
    }

    v4 = v28;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)_textFoundLine
{
  void *v3;
  void *v4;
  void *v5;
  PLSearchOCRTextLineCandidate *v6;
  PLSearchOCRTextLine *v7;
  void *v8;
  PLSearchOCRTextLine *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
  PLServicesLocalizedFrameworkString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_wordsFromString:usingTokenizer:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLSearchOCRTextLineCandidate initWithLine:words:confidence:]([PLSearchOCRTextLineCandidate alloc], "initWithLine:words:confidence:", v4, v5, 1.0);
  v7 = [PLSearchOCRTextLine alloc];
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLSearchOCRTextLine initWithTextBounds:isTitle:candidates:](v7, "initWithTextBounds:isTitle:candidates:", 1, v8, 0.0, 0.0, 1.0, 1.0);

  return v9;
}

+ (id)_ocrTextLinesFromDocumentObservation:(id)a3 allowLowConfidence:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  PLSearchOCRTextLine *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PLSearchOCRTextLine *v20;
  NSObject *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  PLSearchOCRTextLine *v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
    v24 = (id)objc_opt_new();
    v23 = v6;
    objc_msgSend(v6, "blocksWithTypes:inRegion:", 8, 0.0, 0.0, 1.0, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(a1, "_ocrTextLineCandidatesFromTextBlockObservation:tokenizer:allowLowConfidence:", v13, v7, v4);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "count"))
          {
            v15 = [PLSearchOCRTextLine alloc];
            objc_msgSend(v13, "boundingBox");
            v20 = -[PLSearchOCRTextLine initWithTextBounds:isTitle:candidates:](v15, "initWithTextBounds:isTitle:candidates:", objc_msgSend(v13, "isTitle"), v14, v16, v17, v18, v19);
            objc_msgSend(v24, "addObject:", v20);
            PLSearchBackendModelTranslationGetLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v20;
              _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "Added OCRTextLine: %@", buf, 0xCu);
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v10);
    }

    v6 = v23;
  }
  else
  {
    v24 = (id)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

+ (id)_ocrTextLineCandidatesFromTextBlockObservation:(id)a3 tokenizer:(id)a4 allowLowConfidence:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  float v14;
  PLSearchOCRTextLineCandidate *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  PLSearchOCRTextLineCandidate *v20;
  float v21;
  PLSearchOCRTextLineCandidate *v22;
  NSObject *v23;
  id v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  PLSearchOCRTextLineCandidate *v34;
  _BYTE v35[128];
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = a4;
  if (v7)
  {
    v28 = (id)objc_opt_new();
    v25 = v7;
    objc_msgSend(v7, "topCandidates:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v13, "confidence");
          if (v14 > 0.3 || v5)
          {
            objc_msgSend(v13, "string");
            v16 = (PLSearchOCRTextLineCandidate *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_wordsFromString:usingTokenizer:", v16, v27);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (!v17)
            {
              PLSearchBackendModelTranslationGetLog();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v34 = v16;
                _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to get NL tokenized words for OCR line %@", buf, 0xCu);
              }

              v18 = (void *)MEMORY[0x1E0C9AA60];
            }
            v20 = [PLSearchOCRTextLineCandidate alloc];
            objc_msgSend(v13, "confidence");
            v22 = -[PLSearchOCRTextLineCandidate initWithLine:words:confidence:](v20, "initWithLine:words:confidence:", v16, v18, v21);
            objc_msgSend(v28, "addObject:", v22);
            PLSearchBackendModelTranslationGetLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v22;
              _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Added OCRTextLineCandidate: %@", buf, 0xCu);
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v10);
    }

    v7 = v25;
  }
  else
  {
    v28 = (id)MEMORY[0x1E0C9AA60];
  }

  return v28;
}

+ (id)_wordsFromString:(id)a3 usingTokenizer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "setString:", v6);

  objc_msgSend(v5, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__PLSearchOCRUtilities__wordsFromString_usingTokenizer___block_invoke;
  v15[3] = &unk_1E3673448;
  v16 = v5;
  v10 = v7;
  v17 = v10;
  v11 = v5;
  objc_msgSend(v11, "enumerateTokensInRange:usingBlock:", 0, v9, v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __56__PLSearchOCRUtilities__wordsFromString_usingTokenizer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringWithRange:", a2, a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 40);
  objc_msgSend(v8, "localizedLowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

void __66__PLSearchOCRUtilities_spotlightTextLinesFromDocumentObservation___block_invoke()
{
  void *v0;
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  spotlightTextLinesFromDocumentObservation__disableOCRDonationWorkaround = objc_msgSend(v0, "BOOLForKey:", CFSTR("disableOCRDonationWorkaround"));

  if (spotlightTextLinesFromDocumentObservation__disableOCRDonationWorkaround)
  {
    PLSearchBackendModelTranslationGetLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_199541000, v1, OS_LOG_TYPE_DEFAULT, "disableOCRDonationWorkaround user default set", v2, 2u);
    }

  }
}

@end
