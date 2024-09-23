@implementation CRTextResults

- (NSArray)lineFeatures
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CRTextResults textFeatures](self, "textFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "linesFromTextFeatures:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (id)linesFromTextFeatures:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == 1)
        {
          v17 = 0u;
          v18 = 0u;
          v15 = 0u;
          v16 = 0u;
          objc_msgSend(v9, "subFeatures", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v16;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v16 != v12)
                  objc_enumerationMutation(v10);
                objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v11);
          }

        }
        else
        {
          objc_msgSend(v4, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  return v4;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (CRTextDetectorResults)detectorResults
{
  return self->_detectorResults;
}

- (void)setDetectorResults:(id)a3
{
  objc_storeStrong((id *)&self->_detectorResults, a3);
}

- (CRTextRecognizerResults)recognizerResults
{
  return self->_recognizerResults;
}

- (void)setRecognizerResults:(id)a3
{
  objc_storeStrong((id *)&self->_recognizerResults, a3);
}

- (NSArray)textFeatures
{
  return self->_textFeatures;
}

- (void)setTextFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_textFeatures, a3);
}

- (CRTextFeature)titleTextFeature
{
  return self->_titleTextFeature;
}

- (void)setTitleTextFeature:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextFeature, a3);
}

- (int64_t)filteredOutFeatureCount
{
  return self->_filteredOutFeatureCount;
}

- (void)setFilteredOutFeatureCount:(int64_t)a3
{
  self->_filteredOutFeatureCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextFeature, 0);
  objc_storeStrong((id *)&self->_textFeatures, 0);
  objc_storeStrong((id *)&self->_recognizerResults, 0);
  objc_storeStrong((id *)&self->_detectorResults, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
