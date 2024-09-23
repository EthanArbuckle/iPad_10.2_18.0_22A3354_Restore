@implementation VINSFWModelHandler

- (VINSFWModelHandler)initWithPreferredMetalDevice:(id)a3
{
  id v4;
  VINSFWModelHandler *v5;
  id v6;
  void *v7;
  uint64_t *v8;
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  SCMLHandler *scmlHandler;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VINSFWModelHandler;
  v5 = -[VINSFWModelHandler init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D8C990]);
    if (v4)
    {
      v17 = *MEMORY[0x1E0D8C9E8];
      v18[0] = v4;
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = v18;
      v9 = &v17;
    }
    else
    {
      v15 = *MEMORY[0x1E0D8C9E0];
      v16 = MEMORY[0x1E0C9AAB0];
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = &v16;
      v9 = &v15;
    }
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "initWithOptions:error:", v10, 0);
    scmlHandler = v5->_scmlHandler;
    v5->_scmlHandler = (SCMLHandler *)v11;

  }
  return v5;
}

- (id)generateClassificationScoresForPixelBuffer:(__CVBuffer *)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SCMLHandler analyzePixelBuffer:error:](self->_scmlHandler, "analyzePixelBuffer:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scoresForLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

+ (BOOL)isSensitiveLabelScore:(id)a3 confidenceScore:(double)a4 classificationMode:(unint64_t)a5
{
  return objc_msgSend(MEMORY[0x1E0D8C990], "isImageSensitiveForLabel:confidenceScore:classificationMode:", a3, a5, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scmlHandler, 0);
}

@end
