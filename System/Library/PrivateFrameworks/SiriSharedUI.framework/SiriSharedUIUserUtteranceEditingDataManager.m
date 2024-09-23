@implementation SiriSharedUIUserUtteranceEditingDataManager

- (SiriSharedUIUserUtteranceEditingDataManager)initWithUserUtterance:(id)a3 backingAceObjectRefId:(id)a4
{
  id v7;
  id v8;
  SiriSharedUIUserUtteranceEditingDataManager *v9;
  SiriSharedUIUserUtteranceEditingDataManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUIUserUtteranceEditingDataManager;
  v9 = -[SiriSharedUIUserUtteranceEditingDataManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userUtterance, a3);
    objc_storeStrong((id *)&v10->_refId, a4);
    -[SiriSharedUIUserUtteranceEditingDataManager _createAlternativeDisplayStringsAndMap](v10, "_createAlternativeDisplayStringsAndMap");
  }

  return v10;
}

- (void)_createAlternativeDisplayStringsAndMap
{
  NSMutableDictionary *v3;
  NSMutableDictionary *userSelectionResultsMap;
  uint64_t v5;
  void *v6;
  void *v7;
  SiriSharedUIUserUtteranceEditingDataManager *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  SiriSharedUIUserUtteranceEditingDataManager *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSMutableDictionary *v40;
  void *v41;
  NSArray *alternativeDisplayStrings;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id obj;
  NSArray *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;
  void *v74;
  uint64_t v75;
  _QWORD v76[4];

  v76[1] = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  userSelectionResultsMap = self->_userSelectionResultsMap;
  self->_userSelectionResultsMap = v3;

  v75 = *MEMORY[0x1E0DC1140];
  v5 = v75;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = v5;
  v8 = self;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUserUtterance allRecognitionStringsAndScores](self->_userUtterance, "allRecognitionStringsAndScores");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keysSortedByValueUsingComparator:", &__block_literal_global_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v11;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v62;
    v54 = *MEMORY[0x1E0CFE7A8];
    v47 = *MEMORY[0x1E0CFE7A0];
    v46 = *MEMORY[0x1E0CFE7B0];
    v44 = *MEMORY[0x1E0D89050];
    v45 = *MEMORY[0x1E0D89058];
    *(_QWORD *)&v13 = 136315650;
    v43 = v13;
    v48 = *(_QWORD *)v62;
    v49 = v10;
    do
    {
      v16 = 0;
      v51 = v14;
      do
      {
        if (*(_QWORD *)v62 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v16);
        v18 = *MEMORY[0x1E0CFE6A0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v66 = "-[SiriSharedUIUserUtteranceEditingDataManager _createAlternativeDisplayStringsAndMap]";
          v67 = 2112;
          v68 = v17;
          _os_log_impl(&dword_1DE0BF000, v18, OS_LOG_TYPE_DEFAULT, "%s #compact: filtering alternative:%@", buf, 0x16u);
        }
        v19 = objc_msgSend(MEMORY[0x1E0DA7A58], "string:isSameAsUserUtterance:", v17, v8->_userUtterance, v43);
        objc_msgSend(v10, "objectForKey:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v54);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if ((v19 & 1) == 0 && v21)
        {
          objc_msgSend(v20, "objectForKey:", v47);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v46);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v17, v50);
          v24 = v8;
          -[AFUserUtterance rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:](v8->_userUtterance, "rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:", objc_msgSend(v22, "integerValue"), 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v58;
            do
            {
              for (i = 0; i != v27; ++i)
              {
                if (*(_QWORD *)v58 != v28)
                  objc_enumerationMutation(v25);
                v30 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "rangeValue");
                objc_msgSend(v23, "setAttributes:range:", v7, v30, v31);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
            }
            while (v27);
          }
          -[NSArray addObject:](v53, "addObject:", v23);
          v32 = (void *)*MEMORY[0x1E0CFE6A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          {
            v33 = (void *)MEMORY[0x1E0CB37E8];
            v34 = v32;
            objc_msgSend(v33, "numberWithUnsignedInteger:", -[NSArray count](v53, "count") - 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v43;
            v66 = "-[SiriSharedUIUserUtteranceEditingDataManager _createAlternativeDisplayStringsAndMap]";
            v67 = 2112;
            v68 = v23;
            v69 = 2112;
            v70 = v35;
            _os_log_impl(&dword_1DE0BF000, v34, OS_LOG_TYPE_DEFAULT, "%s #compact: added utteranceToDisplay: %@ atIndex:%@", buf, 0x20u);

          }
          v36 = objc_alloc_init(MEMORY[0x1E0CFEA90]);
          objc_msgSend(v36, "setOriginalRank:", v22);
          objc_msgSend(v36, "setOriginalScore:", v56);
          v37 = objc_msgSend(v55, "integerValue");
          v38 = v45;
          if (v37 == 2)
          {
            v24->_clientAlternativePresented = 1;
            v38 = v44;
          }
          objc_msgSend(v36, "setUtteranceSource:", v38);
          -[AFUserUtterance bestTextInterpretation](v24->_userUtterance, "bestTextInterpretation");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setPreviousUtterance:", v39);

          v40 = v24->_userSelectionResultsMap;
          objc_msgSend(v23, "string");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setValue:forKey:](v40, "setValue:forKey:", v36, v41);

          v8 = v24;
          v15 = v48;
          v10 = v49;
          v14 = v51;
        }

        ++v16;
      }
      while (v16 != v14);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v14);
  }

  alternativeDisplayStrings = v8->_alternativeDisplayStrings;
  v8->_alternativeDisplayStrings = v53;

}

uint64_t __85__SiriSharedUIUserUtteranceEditingDataManager__createAlternativeDisplayStringsAndMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4 = *MEMORY[0x1E0CFE7A8];
  v5 = a3;
  objc_msgSend(a2, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "integerValue");
  if (v7 < v9)
    return -1;
  else
    return v7 > v9;
}

- (id)selectionResultsForAlternateTextAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSArray count](self->_alternativeDisplayStrings, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_alternativeDisplayStrings, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_userSelectionResultsMap, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIUserUtteranceEditingDataManager _updateSelectionResults:interactionId:](self, "_updateSelectionResults:interactionId:", v7, self->_refId);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_clientAlternativePresented);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOnDeviceUtterancesPresent:", v8);

  }
  return v7;
}

- (id)selectionResultsForEditedText:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CFEA90]);
  -[SiriSharedUIUserUtteranceEditingDataManager _updateSelectionResults:interactionId:](self, "_updateSelectionResults:interactionId:", v4, self->_refId);
  objc_msgSend(v4, "setUtteranceSource:", *MEMORY[0x1E0D89060]);
  return v4;
}

- (void)_updateSelectionResults:(id)a3 interactionId:(id)a4
{
  objc_msgSend(a3, "setInteractionId:", a4);
}

- (id)attributedStringAtIndex:(int64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_alternativeDisplayStrings, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_alternativeDisplayStrings, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)numberOfAlternativeUtterances
{
  return -[NSArray count](self->_alternativeDisplayStrings, "count");
}

- (BOOL)isEditedTextSameAsUtterance:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0DA7A58], "string:isSameAsUserUtterance:", a3, self->_userUtterance);
}

- (AFUserUtterance)userUtterance
{
  return self->_userUtterance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_userSelectionResultsMap, 0);
  objc_storeStrong((id *)&self->_alternativeDisplayStrings, 0);
  objc_storeStrong((id *)&self->_refId, 0);
}

@end
