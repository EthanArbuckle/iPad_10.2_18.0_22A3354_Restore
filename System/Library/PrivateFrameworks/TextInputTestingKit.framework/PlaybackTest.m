@implementation PlaybackTest

- (id)intended
{
  return self->_intended;
}

- (id)expected
{
  return self->_expected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expected, 0);
  objc_storeStrong((id *)&self->_intended, 0);
}

+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4 corpusId:(id)a5
{
  id v7;
  id v8;
  PlaybackTest *v9;
  PlaybackTest *v10;
  uint64_t v11;
  NSString *input;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(PlaybackTest);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intended, a3);
    objc_storeStrong((id *)&v10->_expected, a4);
    objc_msgSend(v7, "componentsJoinedByString:", &stru_24FD49B78);
    v11 = objc_claimAutoreleasedReturnValue();
    input = v10->super._input;
    v10->super._input = (NSString *)v11;

  }
  return v10;
}

+ (id)testsWithIntendedOutput:(id)a3 expectedOutput:(id)a4
{
  return (id)objc_msgSend(a1, "testsWithIntendedOutput:expectedOutput:corpusId:", a3, a4, 0);
}

+ (id)loadFromPlaybackFile:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  id obj;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[TTKTestCaseReader loadFromPath:](TTKTestCaseReader, "loadFromPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v24 = v3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v5)
    {
      v6 = v5;
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v8, "records");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v29 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                objc_msgSend(v16, "inputText");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObject:", v17);

                objc_msgSend(v16, "primaryIntendedText");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v18);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v13);
          }

          v19 = (void *)objc_msgSend(v9, "copy");
          v20 = (void *)objc_msgSend(v10, "copy");
          +[PlaybackTest testsWithIntendedOutput:expectedOutput:](PlaybackTest, "testsWithIntendedOutput:expectedOutput:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "addObject:", v21);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v6);
    }

    v4 = v23;
    v3 = v24;
  }
  else
  {
    NSLog(CFSTR("Input path for playback not found: %@"), v3);
    v27 = 0;
  }

  return v27;
}

+ (id)sentenceToTransliteratedPlaybackTest:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5
{
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  BOOL v47;
  void *v48;
  void *v49;
  uint64_t v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;

  v5 = a5;
  v6 = a3;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("|"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(" "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "removeObjectsInArray:", &unk_24FD5FD38);
  objc_msgSend(v15, "removeObjectsInArray:", &unk_24FD5FD50);
  if (v5)
  {
    objc_msgSend(v12, "arrayInterspersingSpaceStringsBetweenObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v15, "arrayInterspersingSpaceStringsBetweenObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mutableCopy");

    v15 = (void *)v19;
    v12 = (void *)v17;
  }
  v20 = objc_msgSend(v15, "count");
  if (v20 == objc_msgSend(v12, "count"))
  {
    v62 = v9;
    v57 = v8;
    v58 = v7;
    v59 = v6;
    objc_msgSend(v12, "objectAtIndex:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", 0);
    v22 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "count") >= 2 && objc_msgSend(v21, "length") == 1)
    {
      if (objc_msgSend(v21, "caseInsensitiveCompare:", v22))
      {
        objc_msgSend(v12, "objectAtIndex:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "caseInsensitiveCompare:", v24);

        if (v25)
        {
          objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndex:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "appendString:", v27);

          objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v22);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndex:", 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "appendString:", v29);

          objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 0, v26);
          objc_msgSend(v12, "removeObjectAtIndex:", 1);
          objc_msgSend(v15, "replaceObjectAtIndex:withObject:", 0, v28);
          objc_msgSend(v15, "removeObjectAtIndex:", 1);

        }
      }
    }
    v60 = (void *)v22;
    v61 = v21;
    if (objc_msgSend(v12, "count"))
    {
      v30 = 0;
      v31 = 0x24BDD1000uLL;
      do
      {
        objc_msgSend(v12, "objectAtIndex:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "length") - 1;
        v35 = objc_msgSend(v33, "length");
        if (v34 >= 1)
        {
          v36 = v35;
          objc_msgSend(*(id *)(v31 + 1192), "punctuationCharacterSet");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "characterIsMember:", objc_msgSend(v32, "characterAtIndex:", v34)))
          {
            v38 = v36 - 1;
            objc_msgSend(*(id *)(v31 + 1192), "punctuationCharacterSet");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", v38));

            if (!v40)
            {
              v31 = 0x24BDD1000;
              goto LABEL_17;
            }
            objc_msgSend(v32, "substringToIndex:", v34);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "substringFromIndex:", v34);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "substringToIndex:", v38);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "substringFromIndex:", v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v30, v41);
            objc_msgSend(v12, "insertObject:atIndex:", v37, v30);
            objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v30, v43);
            objc_msgSend(v15, "insertObject:atIndex:", v42, v30++);

            v31 = 0x24BDD1000;
          }

        }
LABEL_17:

        ++v30;
      }
      while (v30 < objc_msgSend(v12, "count"));
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        v46 = 0;
        v47 = 0;
        do
        {
          objc_msgSend(v12, "objectAtIndex:", v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndex:", v46);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v48, "caseInsensitiveCompare:", v49);
          v51 = v50 != 0;
          if (v50)
          {
            if (v47)
            {
              objc_msgSend(v44, "lastObject");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "appendString:", v48);

              objc_msgSend(v45, "lastObject");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "appendString:", v49);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v48);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "addObject:", v54);

              objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v49);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "addObject:", v53);
            }

          }
          else
          {
            objc_msgSend(v44, "addObject:", v48);
            objc_msgSend(v45, "addObject:", v49);
          }

          ++v46;
          v47 = v51;
        }
        while (v46 < objc_msgSend(v12, "count"));
      }

      v15 = v45;
      v12 = v44;
    }
    else
    {
      v45 = v15;
      v44 = v12;
    }
    v7 = v58;
    v6 = v59;
    v8 = v57;
    +[PlaybackTest testsWithIntendedOutput:expectedOutput:](PlaybackTest, "testsWithIntendedOutput:expectedOutput:", v45, v44);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v62;
  }
  else
  {
    NSLog(CFSTR("transliteration and native text differ - unable to align: %@"), v6);
    v55 = 0;
  }

  return v55;
}

+ (id)loadFromSentence:(id)a3 withCatenation:(BOOL)a4
{
  void *v4;
  void *v5;

  +[PlaybackTest sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:](PlaybackTest, "sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)loadFromTextInputFile:(id)a3 withCatenation:(BOOL)a4 addWordSpacing:(BOOL)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  BOOL v15;
  id v16;

  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 4, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __68__PlaybackTest_loadFromTextInputFile_withCatenation_addWordSpacing___block_invoke;
    v12[3] = &unk_24FD48EA8;
    v14 = a4;
    v15 = a5;
    v10 = v9;
    v13 = v10;
    objc_msgSend(v7, "enumerateLinesUsingBlock:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __68__PlaybackTest_loadFromTextInputFile_withCatenation_addWordSpacing___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a2;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v9, "length");
  v7 = v9;
  if (v6)
  {
    +[PlaybackTest sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:](PlaybackTest, "sentenceToTransliteratedPlaybackTest:withCatenation:addWordSpacing:", v9, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

    v7 = v9;
  }

}

@end
