@implementation TICandidateSorter

- (TICandidateSorter)init
{
  TICandidateSorter *v2;
  void *v3;
  void *v4;
  const __CFAllocator *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CFIndex v10;
  __CFDictionary *Mutable;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const void *v17;
  void *v18;
  void *v19;
  const void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)TICandidateSorter;
  v2 = -[TICandidateSorter init](&v27, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathForResource:ofType:inDirectory:", CFSTR("CharacterInfo.dictionary"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v4, 1);
    v6 = IDXCreateIndexObject();
    IDXSetRequestFields();
    -[TICandidateSorter setIndex:](v2, "setIndex:", v6);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForResource:ofType:inDirectory:", CFSTR("RadicalInfo-jp.plist"), 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v8;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v8);
    v10 = objc_msgSend(v9, "count");
    Mutable = CFDictionaryCreateMutable(v5, v10, MEMORY[0x24BDBD6A0], 0);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(const void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndex:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (const void *)objc_msgSend(v19, "unsignedIntegerValue");

          CFDictionarySetValue(Mutable, v17, v20);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v14);
    }

    -[TICandidateSorter setRadicalToSortPosition:](v2, "setRadicalToSortPosition:", Mutable);
  }
  return v2;
}

- (void)dealloc
{
  __IDXIndex *index;
  __CFDictionary *radicalToSortPosition;
  objc_super v5;

  index = self->_index;
  if (index)
    CFRelease(index);
  radicalToSortPosition = self->_radicalToSortPosition;
  if (radicalToSortPosition)
    CFRelease(radicalToSortPosition);
  v5.receiver = self;
  v5.super_class = (Class)TICandidateSorter;
  -[TICandidateSorter dealloc](&v5, sel_dealloc);
}

- (BOOL)getInfoForCharacter:(id)a3 strokeCount:(unint64_t *)a4 radicals:(id *)a5 yomis:(id *)a6
{
  id v10;
  uint64_t matched;
  void *v12;
  void *v13;
  unint64_t v15;
  unint64_t v16;

  v10 = a3;
  -[TICandidateSorter index](self, "index");
  IDXSetSearchString();

  matched = IDXGetMatchDataPtr();
  if (matched >= 1)
  {
    IDXGetFieldDataPtrs();
    if (a4)
      *a4 = MEMORY[0];
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", 0, v15 >> 1);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", 0, v16 >> 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(","));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(","));
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return matched > 0;
}

- (BOOL)hasCandidatesSortedByRadicalFromCandidates:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  BOOL v14;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "label");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_firstGrapheme");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          v16 = 0;
          v17 = 0;
          v11 = -[TICandidateSorter getInfoForCharacter:strokeCount:radicals:yomis:](self, "getInfoForCharacter:strokeCount:radicals:yomis:", v10, &v17, &v16, 0);
          v12 = v16;
          v13 = v12;
          if (v11 && objc_msgSend(v12, "length"))
          {

            v14 = 1;
            goto LABEL_14;
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)candidatesSortedByDefaultFromCandidates:(id)a3 omittingEmoji:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[TICandidateSorter liveConversionEnabled](self, "liveConversionEnabled"))
    objc_msgSend(v6, "_sortedArrayByFrequency:extensionCandidateIndex:maxEmojisPerCandidate:ignoreTransliterateCandidate:", 2, 6, 1, 1);
  else
    objc_msgSend(v6, "_sortedArrayByFrequency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(v7, "_arrayByFilteringEmojiCandidates:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;
  v10 = objc_alloc(MEMORY[0x24BEB4E10]);
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTitle:candidates:", 0, v11);
  v15[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)candidatesSortedByRadicalFromCandidates:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __CFDictionary *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v35;
  void *context;
  void *v37;
  id v39;
  __CFDictionary *theDict;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  _QWORD v46[4];
  id v47;
  __CFDictionary *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  void *v55;
  id v56;
  void *value;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x234902648]();
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], 0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isTransliterationCandidate") & 1) == 0)
        {
          objc_msgSend(v10, "label");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_firstGrapheme");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length"))
          {
            objc_msgSend(v4, "setObject:forKey:", v12, v11);
            v56 = 0;
            value = 0;
            v13 = -[TICandidateSorter getInfoForCharacter:strokeCount:radicals:yomis:](self, "getInfoForCharacter:strokeCount:radicals:yomis:", v12, &value, &v56, 0);
            v14 = v56;
            if (v13)
            {
              CFDictionarySetValue(theDict, v12, value);
              v15 = objc_msgSend(v14, "length");
              v53[0] = MEMORY[0x24BDAC760];
              v53[1] = 3221225472;
              v53[2] = __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke;
              v53[3] = &unk_250122BF8;
              v54 = v37;
              v55 = v10;
              objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 2, v53);

            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v7);
  }
  v35 = v5;

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v16 = v37;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v50 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j), v35, context);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke_2;
        v46[3] = &unk_250122C20;
        v47 = v4;
        v48 = theDict;
        objc_msgSend(v21, "sortUsingComparator:", v46);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    }
    while (v18);
  }

  v22 = -[TICandidateSorter radicalToSortPosition](self, "radicalToSortPosition");
  objc_msgSend(v16, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke_3;
  v45[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v45[4] = v22;
  objc_msgSend(v23, "sortedArrayUsingComparator:", v45);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k);
        v31 = objc_alloc(MEMORY[0x24BEB4E10]);
        objc_msgSend(v16, "objectForKey:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v31, "initWithTitle:candidates:", v30, v32);

        objc_msgSend(v39, "addObject:", v33);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v62, 16);
    }
    while (v27);
  }

  CFRelease(theDict);
  objc_autoreleasePoolPop(context);

  return v39;
}

void __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "length");
  v4 = v6;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);
    }
    objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));

    v4 = v6;
  }

}

uint64_t __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  const void *Value;
  const void *v15;
  int v16;
  unsigned int v17;
  uint64_t v18;

  v5 = a3;
  objc_msgSend(a2, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", v9))
  {
    v10 = objc_msgSend(v6, "length");
    v11 = objc_msgSend(v7, "length");
    v12 = v10 >= v11;
    v13 = v10 > v11;
  }
  else
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v8);
    v15 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v9);
    v12 = Value >= v15;
    v13 = Value > v15;
  }
  v16 = !v12;
  v17 = v13;
  if (v16)
    v18 = -1;
  else
    v18 = v17;

  return v18;
}

uint64_t __61__TICandidateSorter_candidatesSortedByRadicalFromCandidates___block_invoke_3(uint64_t a1, const void *a2, void *a3)
{
  const __CFDictionary *v5;
  id v6;
  const void *Value;
  const void *v8;

  v5 = *(const __CFDictionary **)(a1 + 32);
  v6 = a3;
  Value = CFDictionaryGetValue(v5, a2);
  v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), v6);

  if (Value < v8)
    return -1;
  else
    return Value > v8;
}

- (BOOL)hasCandidatesSortedByYomiFromCandidates:(id)a3 inputString:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  id v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  BOOL v28;
  TICandidateSorter *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "_containsJapaneseOnly"))
        {
          objc_msgSend(v13, "_firstGrapheme");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "length"))
          {
            v42 = 0;
            v43 = 0;
            v15 = -[TICandidateSorter getInfoForCharacter:strokeCount:radicals:yomis:](self, "getInfoForCharacter:strokeCount:radicals:yomis:", v14, &v43, 0, &v42);
            v16 = v42;
            if (v15)
            {
              v40 = 0u;
              v41 = 0u;
              v38 = 0u;
              v39 = 0u;
              v34 = v16;
              v17 = v16;
              v36 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
              if (v36)
              {
                v37 = *(_QWORD *)v39;
                v32 = v11;
                v33 = v8;
                v30 = self;
                v31 = v10;
                v35 = v17;
                while (2)
                {
                  for (j = 0; j != v36; ++j)
                  {
                    if (*(_QWORD *)v39 != v37)
                      objc_enumerationMutation(v17);
                    v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                    if (objc_msgSend(v19, "length", v30))
                    {
                      v20 = objc_msgSend(v19, "rangeOfComposedCharacterSequenceAtIndex:", 0);
                      objc_msgSend(v19, "substringWithRange:", v20, v21);
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "stringByConvertingKatakanaToHiragana");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();

                      v24 = objc_msgSend(v7, "length");
                      v25 = 0;
                      while (v24 != v25)
                      {
                        objc_msgSend(v7, "substringToIndex:", ++v25);
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        v27 = objc_msgSend(v23, "isEqualToString:", v26);

                        if (v27)
                        {

                          v10 = v31;
                          v11 = v32;
                          v17 = v35;
                          goto LABEL_19;
                        }
                      }

                      v28 = 1;
                      v8 = v33;
                      goto LABEL_29;
                    }
LABEL_19:
                    ;
                  }
                  v8 = v33;
                  self = v30;
                  v36 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
                  if (v36)
                    continue;
                  break;
                }
              }

              v16 = v34;
            }

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      v28 = 0;
    }
    while (v10);
  }
  else
  {
    v28 = 0;
  }
LABEL_29:

  return v28;
}

- (id)candidatesSortedByYomiFromCandidates:(id)a3 inputString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *k;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *context;
  id v58;
  uint64_t v59;
  void *v60;
  TICandidateSorter *v61;
  void *v62;
  __CFDictionary *theDict;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  id obj;
  id obja;
  void *v70;
  uint64_t v71;
  id v72;
  void *key;
  void *keya;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  id v88;
  __CFDictionary *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  void *value;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v58 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v72 = (id)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x234902648]();
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], 0);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  v62 = v9;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v97;
    v60 = v7;
    v61 = self;
    v59 = *(_QWORD *)v97;
    do
    {
      v13 = 0;
      v64 = v11;
      do
      {
        if (*(_QWORD *)v97 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)v13);
        if ((objc_msgSend(v14, "isTransliterationCandidate") & 1) == 0)
        {
          objc_msgSend(v14, "label");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "_containsJapaneseOnly"))
          {
            objc_msgSend(v15, "_firstGrapheme");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "length"))
            {
              v70 = v15;
              objc_msgSend(v7, "setObject:forKey:", v16, v15);
              v94 = 0;
              value = 0;
              key = v16;
              v17 = -[TICandidateSorter getInfoForCharacter:strokeCount:radicals:yomis:](self, "getInfoForCharacter:strokeCount:radicals:yomis:", v16, &value, 0, &v94);
              v18 = v94;
              if (v17)
              {
                obj = v13;
                CFDictionarySetValue(theDict, key, value);
                v92 = 0u;
                v93 = 0u;
                v90 = 0u;
                v91 = 0u;
                v66 = v18;
                v19 = v18;
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
                if (v20)
                {
                  v21 = v20;
                  v22 = *(_QWORD *)v91;
                  do
                  {
                    for (i = 0; i != v21; ++i)
                    {
                      if (*(_QWORD *)v91 != v22)
                        objc_enumerationMutation(v19);
                      v24 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
                      if (objc_msgSend(v24, "length"))
                      {
                        v25 = objc_msgSend(v24, "rangeOfComposedCharacterSequenceAtIndex:", 0);
                        objc_msgSend(v24, "substringWithRange:", v25, v26);
                        v27 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v27, "stringByConvertingKatakanaToHiragana");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v8, "objectForKey:", v28);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v29)
                        {
                          objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v8, "setObject:forKey:", v29, v28);
                        }
                        v30 = (void *)objc_msgSend(v14, "copy");
                        objc_msgSend(v30, "setAlternativeText:", v24);
                        objc_msgSend(v29, "addObject:", v30);

                      }
                    }
                    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
                  }
                  while (v21);
                }

                self = v61;
                v9 = v62;
                v12 = v59;
                v7 = v60;
                v11 = v64;
                v18 = v66;
                v13 = obj;
              }

              v15 = v70;
              v16 = key;
            }

          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v13 != (id)v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    }
    while (v11);
  }

  v87[0] = MEMORY[0x24BDAC760];
  v87[1] = 3221225472;
  v87[2] = __70__TICandidateSorter_candidatesSortedByYomiFromCandidates_inputString___block_invoke;
  v87[3] = &unk_250122C20;
  v67 = v7;
  v88 = v67;
  v89 = theDict;
  v31 = MEMORY[0x2349027B0](v87);
  v32 = objc_msgSend(v58, "length");
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    do
    {
      objc_msgSend(v58, "substringToIndex:", ++v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v35);

    }
    while (v33 != v34);
  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v36 = v8;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v84 != v39)
          objc_enumerationMutation(v36);
        objc_msgSend(v36, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * j));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "sortUsingComparator:", v31);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v83, v102, 16);
    }
    while (v38);
  }

  objc_msgSend(v36, "allKeys");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)v31;
  objc_msgSend(v42, "sortedArrayUsingComparator:", v31);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obja = v43;
  keya = (void *)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
  if (keya)
  {
    v71 = *(_QWORD *)v80;
    do
    {
      for (k = 0; k != keya; k = (char *)k + 1)
      {
        if (*(_QWORD *)v80 != v71)
          objc_enumerationMutation(obja);
        v45 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v36, "objectForKey:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
        if (v47)
        {
          v48 = v47;
          v49 = 0;
          v50 = *(_QWORD *)v76;
          do
          {
            for (m = 0; m != v48; ++m)
            {
              if (*(_QWORD *)v76 != v50)
                objc_enumerationMutation(v46);
              v52 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * m);
              objc_msgSend(v52, "label");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v53, "_graphemeCount") == 1)
              {
                v54 = v53;

                v49 = v54;
              }
              else if (v49 && objc_msgSend(v53, "hasPrefix:", v49))
              {
                objc_msgSend(v52, "setAlternativeText:", 0);
              }

            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v100, 16);
          }
          while (v48);
        }
        else
        {
          v49 = 0;
        }
        v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E10]), "initWithTitle:candidates:", v45, v46);
        objc_msgSend(v72, "addObject:", v55);

      }
      keya = (void *)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
    }
    while (keya);
  }

  CFRelease(theDict);
  objc_autoreleasePoolPop(context);

  return v72;
}

uint64_t __70__TICandidateSorter_candidatesSortedByYomiFromCandidates_inputString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const void *Value;
  const void *v20;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "label");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "label");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
  }
  v10 = v9;
  objc_msgSend(v8, "substringToIndex:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (__CFString *)objc_msgSend(v11, "mutableCopy");

  v13 = (const __CFString *)*MEMORY[0x24BDBD610];
  CFStringTransform(v12, 0, (CFStringRef)*MEMORY[0x24BDBD610], 1u);
  objc_msgSend(v10, "substringToIndex:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (__CFString *)objc_msgSend(v14, "mutableCopy");

  CFStringTransform(v15, 0, v13, 1u);
  v16 = -[__CFString compare:](v12, "compare:", v15);
  if (!v16)
  {
    v16 = objc_msgSend(v8, "localizedStandardCompare:", v10);
    if (!v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        objc_msgSend(v8, "_firstGrapheme");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(v10, "_firstGrapheme");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v17);
      v20 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v18);

      if (Value >= v20)
      {
        if (Value > v20)
          v16 = 1;
        else
          v16 = objc_msgSend(v8, "localizedStandardCompare:", v10);
      }
      else
      {
        v16 = -1;
      }
    }
  }

  return v16;
}

- (id)candidatesSortedByEmojiFromCandidates:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", &__block_literal_global_6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BEB4E10]);
  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:candidates:", 0, v8);
  v12[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __59__TICandidateSorter_candidatesSortedByEmojiFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isEmojiCandidate") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isStickerCandidate");

  return v3;
}

- (BOOL)hasCandidatesSortedByFacemarkCategoryFromCandidates:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)hasCandidatesSortedByEmojiCategoryFromCandidates:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isEmojiCandidate", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)hasCandidatesFromCandidates:(id)a3 inputString:(id)a4 sortedBy:(unint64_t)a5 omittingEmoji:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  BOOL v12;
  BOOL v13;
  uint64_t v15;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  switch(a5)
  {
    case 1uLL:
      v12 = -[TICandidateSorter hasCandidatesSortedByRadicalFromCandidates:](self, "hasCandidatesSortedByRadicalFromCandidates:", v10);
      goto LABEL_6;
    case 2uLL:
      v12 = -[TICandidateSorter hasCandidatesSortedByYomiFromCandidates:inputString:](self, "hasCandidatesSortedByYomiFromCandidates:inputString:", v10, v11);
      goto LABEL_6;
    case 3uLL:
      v12 = -[TICandidateSorter hasCandidatesSortedByFacemarkCategoryFromCandidates:](self, "hasCandidatesSortedByFacemarkCategoryFromCandidates:", v10);
      goto LABEL_6;
    case 4uLL:
      v12 = -[TICandidateSorter hasCandidatesSortedByEmojiCategoryFromCandidates:](self, "hasCandidatesSortedByEmojiCategoryFromCandidates:", v10);
LABEL_6:
      v13 = v12;
      break;
    default:
      if (v6)
      {
        objc_msgSend(v10, "_arrayByFilteringEmojiCandidates:", 0);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v15;
      }
      v13 = objc_msgSend(v10, "count") != 0;
      break;
  }

  return v13;
}

- (id)candidatesFromCandidates:(id)a3 inputString:(id)a4 sortedBy:(unint64_t)a5 omittingEmoji:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  switch(a5)
  {
    case 1uLL:
      -[TICandidateSorter candidatesSortedByRadicalFromCandidates:](self, "candidatesSortedByRadicalFromCandidates:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      -[TICandidateSorter candidatesSortedByYomiFromCandidates:inputString:](self, "candidatesSortedByYomiFromCandidates:inputString:", v10, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BEB4D28], "candidatesSortedByFacemarkCategoryFromCandidates:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      break;
    case 4uLL:
      -[TICandidateSorter candidatesSortedByEmojiFromCandidates:](self, "candidatesSortedByEmojiFromCandidates:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[TICandidateSorter candidatesSortedByDefaultFromCandidates:omittingEmoji:](self, "candidatesSortedByDefaultFromCandidates:omittingEmoji:", v10, v6);
      v12 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v13 = (void *)v12;

  return v13;
}

- (__IDXIndex)index
{
  return self->_index;
}

- (void)setIndex:(__IDXIndex *)a3
{
  self->_index = a3;
}

- (__CFDictionary)radicalToSortPosition
{
  return self->_radicalToSortPosition;
}

- (void)setRadicalToSortPosition:(__CFDictionary *)a3
{
  self->_radicalToSortPosition = a3;
}

- (BOOL)liveConversionEnabled
{
  return self->_liveConversionEnabled;
}

- (void)setLiveConversionEnabled:(BOOL)a3
{
  self->_liveConversionEnabled = a3;
}

@end
