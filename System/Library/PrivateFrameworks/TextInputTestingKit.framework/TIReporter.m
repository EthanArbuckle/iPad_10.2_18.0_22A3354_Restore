@implementation TIReporter

- (TIReporter)initWithBuildVersion:(id)a3
{
  id v5;
  TIReporter *v6;
  NSMutableArray *v7;
  NSMutableArray *resultLoggers;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIReporter;
  v6 = -[TIReporter init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    resultLoggers = v6->_resultLoggers;
    v6->_resultLoggers = v7;

    objc_storeStrong((id *)&v6->_buildVersion, a3);
  }

  return v6;
}

- (NSString)language
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[TIReporter options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageForOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)localeIdentifierForLanguage
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[TIReporter language](self, "language");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("-"));
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "substringToIndex:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("zh")))
  {
    v5 = objc_msgSend(v2, "rangeOfString:", CFSTR("_"));
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("_"), CFSTR("-"), 0, v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v7;
    }
  }
  return (NSString *)v2;
}

- (NSString)textCorpus
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[TIReporter options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textCorpusForOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)beginLogTrial
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FILE *v12;
  id v13;
  TISerializingResultLogger *v14;

  -[TIReporter options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("USE_PARTFILE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[TIReporter options](self, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("PARTFILE_FLUSH_THRESHOLD"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_class();
    v9 = -[NSMutableArray count](self->_resultLoggers, "count");
    -[TIReporter options](self, "options");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLForTrial:withOptions:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[TISerializingResultLogger initWithOutputURL:flushThreshold:]([TISerializingResultLogger alloc], "initWithOutputURL:flushThreshold:", v11, v7);
  }
  else
  {
    v14 = objc_alloc_init(TIInMemoryResultLogger);
  }
  -[NSMutableArray addObject:](self->_resultLoggers, "addObject:", v14);
  v12 = (FILE *)*MEMORY[0x24BDAC8D8];
  -[TISerializingResultLogger description](v14, "description");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(v12, "The following result logger will be used for this trial %s\n", (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 4));

}

- (void)logResult:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[TIReporter options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("REPORT_AGGD_STATISTICS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
    -[TIReporter collectAggdStatisticsForResult:](self, "collectAggdStatisticsForResult:", v9);
  -[TIReporter resultLoggers](self, "resultLoggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addResult:", v9);
}

- (void)collectAggdStatisticsForResult:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x24BDD1618];
  objc_msgSend((id)__aggdReportMock, "toDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v5, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAggdStatistics:", v9);

  objc_msgSend((id)__aggdReportMock, "clear");
}

- (id)resultsForTrial:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[TIReporter resultLoggers](self, "resultLoggers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldConcatenateTokensAtBoundaryError
{
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  _QWORD v7[4];
  id v8;

  -[TIReporter localeIdentifierForLanguage](self, "localeIdentifierForLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__TIReporter_shouldConcatenateTokensAtBoundaryError__block_invoke;
  v7[3] = &unk_24FD48B08;
  v8 = v2;
  v3 = v2;
  objc_msgSend(&unk_24FD5FC90, "indexesOfObjectsPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") == 0;

  return v5;
}

- (id)alignedTypingSequenceForResult:(id)a3 keystrokeSegmentationMode:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t n;
  unint64_t v59;
  uint64_t **v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t *v65;
  void *v66;
  void *v67;
  uint64_t *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  id v84;
  id v85;
  TIReporter *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  uint64_t *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD v123[4];
  id v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "intended");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TICharSequenceForTokenSequence(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "corrected");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TICharSequenceForTokenSequence(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDBCEA0];
  -[TIReporter language](self, "language");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localeWithLocaleIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v123[0] = MEMORY[0x24BDAC760];
  v123[1] = 3221225472;
  v123[2] = __71__TIReporter_alignedTypingSequenceForResult_keystrokeSegmentationMode___block_invoke;
  v123[3] = &unk_24FD48B30;
  v14 = v13;
  v124 = v14;
  v15 = (void *)MEMORY[0x2348A8EA4](v123);
  TIOptimalSequenceAlignment(v8, v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intended");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "corrected");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  TITokenAlignmentForKeyAlignment(v16, v8, v10, v17, v88);
  v93 = v6;
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v14;
  v92 = v8;
  v89 = v16;
  v90 = v15;
  if (a4 == 2)
  {
    v86 = self;
    v87 = v10;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    objc_msgSend(v6, "inserted");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v120;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v120 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(v27, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i));
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
      }
      while (v30);
    }

    TICharSequenceForTokenSequence(v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    TIOptimalSequenceAlignment(v8, v33, v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = &v81;
    v84 = v33;
    v85 = v34;
    v102 = &v81 - 2 * objc_msgSend(v17, "count") - 2;
    TITargetKeyRangesForSourceTokens(v34, v8, v84, v17, v84, (uint64_t)v102);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    objc_msgSend(v6, "touched");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v116;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v116 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(v35, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j));
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
      }
      while (v38);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    objc_msgSend(v6, "predicted");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v112;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v112 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(v41, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * k));
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
      }
      while (v44);
    }
    v95 = v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    objc_msgSend(v6, "inlineCompletions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v108;
      do
      {
        for (m = 0; m != v50; ++m)
        {
          if (*(_QWORD *)v108 != v51)
            objc_enumerationMutation(v48);
          objc_msgSend(v47, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * m));
        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v107, v126, 16);
      }
      while (v50);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    objc_msgSend(v93, "documentStates");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v104;
      do
      {
        for (n = 0; n != v56; ++n)
        {
          if (*(_QWORD *)v104 != v57)
            objc_enumerationMutation(v54);
          objc_msgSend(v53, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * n));
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v103, v125, 16);
      }
      while (v56);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v101 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v100 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v99 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v98 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v97 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v95;
    if (objc_msgSend(v95, "count"))
    {
      v59 = 0;
      v60 = (uint64_t **)(v102 + 1);
      do
      {
        v61 = (uint64_t)*(v60 - 1);
        if (v61 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v62 = MEMORY[0x24BDBD1A8];
          objc_msgSend(v101, "addObject:", MEMORY[0x24BDBD1A8]);
          objc_msgSend(v100, "addObject:", v62);
          objc_msgSend(v99, "addObject:", v62);
          objc_msgSend(v97, "addObject:", v62);
          objc_msgSend(v98, "addObject:", v62);
        }
        else
        {
          v102 = *v60;
          objc_msgSend(v27, "subarrayWithRange:", v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "addObject:", v63);

          objc_msgSend(v35, "subarrayWithRange:", v61, v102);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "addObject:", v64);

          v96 = v59;
          v65 = v102;
          objc_msgSend(v41, "subarrayWithRange:", v61, v102);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "addObject:", v66);

          objc_msgSend(v47, "subarrayWithRange:", v61, v65);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "addObject:", v67);

          v68 = v65;
          v17 = v95;
          v59 = v96;
          objc_msgSend(v53, "subarrayWithRange:", v61, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "addObject:", v69);

        }
        ++v59;
        v60 += 2;
      }
      while (v59 < objc_msgSend(v17, "count"));
    }
    v102 = (uint64_t *)objc_msgSend(v101, "copy");
    v96 = objc_msgSend(v100, "copy");
    v95 = (id)objc_msgSend(v99, "copy");
    v70 = v98;
    v82 = objc_msgSend(v98, "copy");
    v71 = v97;
    v26 = (void *)objc_msgSend(v97, "copy");

    v72 = v84;
    v18 = v102;

    v23 = (void *)v82;
    v24 = v95;
    v25 = (void *)v96;
    self = v86;
    v10 = v87;
  }
  else if (a4 == 1)
  {
    objc_msgSend(v6, "inserted");
    v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "touched");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicted");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inlineCompletions");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentStates");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v21;
    v24 = (id)v20;
    v25 = (void *)v19;
    v26 = (void *)v22;
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDBD1A8];
    v23 = (void *)MEMORY[0x24BDBD1A8];
    v24 = (id)MEMORY[0x24BDBD1A8];
    v25 = (void *)MEMORY[0x24BDBD1A8];
    v18 = (_QWORD *)MEMORY[0x24BDBD1A8];
  }
  v73 = v18;
  v74 = v25;
  v75 = v24;
  v76 = v23;
  TIAlignedTypingSequenceForAlignedTokenSequence(v94, v18, v25, v24, v23, v26);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77 && -[TIReporter shouldConcatenateTokensAtBoundaryError](self, "shouldConcatenateTokensAtBoundaryError"))
  {
    TIConcatenateAlignedTypingAtBoundaryErrors(v77);
    v78 = v17;
    v79 = objc_claimAutoreleasedReturnValue();

    v77 = (void *)v79;
    v17 = v78;
  }

  return v77;
}

- (id)alignedTypingSequenceForTransliteratedResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  TIAlignedTyping *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intended");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      v8 = objc_alloc_init(TIAlignedTyping);
      objc_msgSend(v3, "intendedTransliteration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTokens setSource:](v8, "setSource:", v10);

      objc_msgSend(v3, "intended");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTokens setSourceTransliteration:](v8, "setSourceTransliteration:", v12);

      objc_msgSend(v3, "touched");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTyping setTouched:](v8, "setTouched:", v14);

      objc_msgSend(v3, "inserted");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTyping setInserted:](v8, "setInserted:", v16);

      objc_msgSend(v3, "corrected");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTokens setTarget:](v8, "setTarget:", v18);

      objc_msgSend(v3, "predicted");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndex:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTyping setPredicted:](v8, "setPredicted:", v20);

      objc_msgSend(v3, "inlineCompletions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndex:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAlignedTyping setInlineCompletions:](v8, "setInlineCompletions:", v22);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pathsForWords");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v3, "pathsForWords");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[TIAlignedTyping setPath:](v8, "setPath:", v27);
      }
      objc_msgSend(v4, "addObject:", v8);

      ++v7;
      objc_msgSend(v3, "intended");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

    }
    while (v7 < v29);
  }

  return v4;
}

- (id)reportForTrial:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[TIReporter resultLoggers](self, "resultLoggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIReporter reportForAutocorrectionResults:](self, "reportForAutocorrectionResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("TrialIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v10);

  return v8;
}

- (id)reportForAutocorrectionResults:(id)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  TIReporter *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t j;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t k;
  unsigned int v97;
  void *v98;
  void *v99;
  uint64_t v100;
  unint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t m;
  void *v114;
  void *v115;
  unint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t n;
  void *v138;
  uint64_t v139;
  const __CFString *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  float v157;
  float v158;
  float v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  float v164;
  float v165;
  float v166;
  float v167;
  void *v168;
  id v169;
  uint64_t v170;
  const __CFString *v171;
  uint64_t v172;
  const __CFString *v173;
  uint64_t v174;
  const __CFString *v175;
  uint64_t v176;
  uint64_t v177;
  double v178;
  double v179;
  double v180;
  void *v181;
  void *v182;
  double v183;
  void *v184;
  void *v185;
  double v186;
  void *v187;
  void *v188;
  void *v189;
  double v190;
  void *v191;
  void *v192;
  id v193;
  void *v195;
  uint64_t v196;
  char v197;
  int v198;
  int v199;
  int v200;
  void *v201;
  uint64_t v202;
  id v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  uint64_t v211;
  void *v212;
  uint64_t v213;
  void *v214;
  id v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  void *v220;
  void *v221;
  __CFString *v222;
  void *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *context;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  id v231;
  uint64_t v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  uint64_t v241;
  void *v242;
  uint64_t v243;
  void *v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  void *v249;
  id v250;
  id v251;
  id v252;
  id obj;
  id obja;
  void *v255;
  void *v256;
  uint64_t v257;
  void *v258;
  void *v259;
  uint64_t v260;
  void *v261;
  uint64_t v262;
  void *v263;
  void *v264;
  uint64_t v265;
  void *v266;
  uint64_t v267;
  void *v268;
  void *v269;
  id v270;
  id v271;
  id v272;
  id v273;
  id v274;
  _QWORD v275[4];
  id v276;
  id v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  _QWORD v310[24];
  _QWORD v311[24];
  _QWORD v312[22];
  _QWORD v313[22];
  _BYTE v314[128];
  _BYTE v315[128];
  _BYTE v316[128];
  _BYTE v317[128];
  _BYTE v318[128];
  _BYTE v319[128];
  _BYTE v320[128];
  _BYTE v321[128];
  uint64_t v322;

  v322 = *MEMORY[0x24BDAC8D0];
  v203 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v255 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIReporter options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("MAX_PREDICTIONS_REPORTED"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = CFSTR("0");
  v200 = -[__CFString intValue](v5, "intValue");

  -[TIReporter options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("MAX_INLINE_COMPLETIONS_REPORTED"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = CFSTR("0");
  v199 = -[__CFString intValue](v8, "intValue");

  -[TIReporter options](self, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("REPORT_AGGD_STATISTICS"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    v11 = CFSTR("0");
  v198 = -[__CFString BOOLValue](v11, "BOOLValue");

  -[TIReporter options](self, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("LOG_DOCUMENT_CONTEXT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    v14 = (void *)MEMORY[0x24BDBD1C0];
  v197 = objc_msgSend(v14, "BOOLValue");

  -[TIReporter options](self, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("PREFERS_TRANSLITERATION"));
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
    v17 = CFSTR("0");
  self->_isTransliterating = -[__CFString BOOLValue](v17, "BOOLValue");

  -[TIReporter options](self, "options");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("KEYSTROKE_SEGMENTATION_MODE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = self;
    -[TIReporter options](self, "options");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", CFSTR("KEYSTROKE_SEGMENTATION_MODE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "lowercaseString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByTrimmingCharactersInSet:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v26, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v196 = 0;
    }
    else
    {
      if ((objc_msgSend(v26, "isEqualToString:", CFSTR("typinglog")) & 1) != 0)
      {
        v27 = 1;
      }
      else
      {
        v28 = objc_msgSend(v26, "isEqualToString:", CFSTR("alignment"));
        v27 = 1;
        if (v28)
          v27 = 2;
      }
      v196 = v27;
    }
    self = v21;

  }
  else
  {
    v196 = 1;
  }
  v29 = objc_msgSend(v203, "count");
  v30 = v29;
  if (!v29)
  {
    fputc(10, (FILE *)*MEMORY[0x24BDAC8D8]);
    v217 = 0;
    v218 = 0;
    v216 = 0;
    v31 = 0;
    v160 = 0;
    v161 = 0;
    v162 = 0;
    v246 = 0;
    v241 = 0;
    v163 = 0;
    v164 = 1.0;
    v165 = 0.0;
    v157 = 1.0;
    v159 = 0.0;
    v166 = 0.0;
    v167 = 0.0;
    goto LABEL_154;
  }
  v232 = 0;
  v260 = 0;
  v265 = 0;
  v241 = 0;
  v246 = 0;
  v229 = 0;
  v230 = 0;
  v31 = 0;
  v216 = 0;
  v217 = 0;
  v218 = 0;
  v32 = 0;
  v202 = v29;
  do
  {
    context = (void *)MEMORY[0x2348A8D30]();
    v228 = v32 + 1;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Processing result %lu/%lu\r", v32 + 1, v30);
    objc_msgSend(v203, "objectAtIndexedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "intendedTransliteration");
    v235 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "numberOfTouches");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = objc_msgSend(v34, "integerValue");

    -[TIReporter localeIdentifierForLanguage](self, "localeIdentifierForLanguage");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ko_KR")) & 1) != 0)
    {
      objc_msgSend(v33, "intended");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", &stru_24FD49B78);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      +[TITesterUtils decomposeHangulSequence:](TITesterUtils, "decomposeHangulSequence:", v37);
      v38 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v33, "intended");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsJoinedByString:", &stru_24FD49B78);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v38 = v37;
    }

    v231 = v38;
    v225 = objc_msgSend(v38, "length");
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    v306 = 0u;
    v307 = 0u;
    v308 = 0u;
    v309 = 0u;
    v233 = v33;
    objc_msgSend(v33, "inserted");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v306, v321, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v307;
      do
      {
        v43 = 0;
        v44 = v239;
        do
        {
          if (*(_QWORD *)v307 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v306 + 1) + 8 * v43), "componentsJoinedByString:", &stru_24FD49B78);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringByAppendingString:", v45);
          v46 = objc_claimAutoreleasedReturnValue();

          ++v43;
          v44 = (void *)v46;
        }
        while (v41 != v43);
        v239 = (void *)v46;
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v306, v321, 16);
      }
      while (v41);
    }

    objc_msgSend(v239, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\b"), CFSTR("\b"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\B"), CFSTR("\b"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = objc_msgSend(v48, "length");

    objc_msgSend(v233, "intended");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v302 = 0u;
    v303 = 0u;
    v304 = 0u;
    v305 = 0u;
    obj = v49;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v302, v320, 16);
    if (!v50)
    {
      v262 = 0;
      v267 = 0;
      v52 = 0x24BDD1000uLL;
      goto LABEL_47;
    }
    v51 = v50;
    v262 = 0;
    v267 = 0;
    v270 = *(id *)v303;
    v52 = 0x24BDD1000uLL;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(id *)v303 != v270)
          objc_enumerationMutation(obj);
        v54 = *(void **)(*((_QWORD *)&v302 + 1) + 8 * i);
        objc_msgSend(*(id *)(v52 + 1192), "whitespaceAndNewlineCharacterSet");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringByTrimmingCharactersInSet:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v56, "length"))
        {
          objc_msgSend(*(id *)(v52 + 1192), "punctuationCharacterSet");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringByTrimmingCharactersInSet:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "length");

          if (v59)
          {
            ++v260;
            ++v262;
            goto LABEL_43;
          }
        }
        else
        {

        }
        v265 += objc_msgSend(v54, "length");
        v267 += objc_msgSend(v54, "length");
LABEL_43:
        v52 = 0x24BDD1000;
      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v302, v320, 16);
    }
    while (v51);
LABEL_47:

    if (v235)
      -[TIReporter alignedTypingSequenceForTransliteratedResult:](self, "alignedTypingSequenceForTransliteratedResult:", v233);
    else
      -[TIReporter alignedTypingSequenceForResult:keystrokeSegmentationMode:](self, "alignedTypingSequenceForResult:keystrokeSegmentationMode:", v233, v196);
    v61 = v231;
    v60 = v232;
    v62 = (id)objc_claimAutoreleasedReturnValue();

    if (!v62)
      goto LABEL_134;
    v300 = 0u;
    v301 = 0u;
    v298 = 0u;
    v299 = 0u;
    v215 = v62;
    v250 = v62;
    v63 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v298, v319, 16);
    if (!v63)
    {
      v243 = 0;
      v247 = 0;
      goto LABEL_68;
    }
    v64 = v63;
    v243 = 0;
    v247 = 0;
    v65 = *(_QWORD *)v299;
    v257 = *(_QWORD *)v299;
    while (2)
    {
      v66 = 0;
      v271 = (id)v64;
      while (2)
      {
        if (*(_QWORD *)v299 != v65)
          objc_enumerationMutation(v250);
        v67 = *(void **)(*((_QWORD *)&v298 + 1) + 8 * v66);
        objc_msgSend(v67, "source");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "target");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v68, "length") && objc_msgSend(v69, "isEqualToString:", v68))
        {
          objc_msgSend(*(id *)(v52 + 1192), "whitespaceAndNewlineCharacterSet");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "stringByTrimmingCharactersInSet:", v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v71, "length"))
          {
            objc_msgSend(*(id *)(v52 + 1192), "punctuationCharacterSet");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "stringByTrimmingCharactersInSet:", v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = objc_msgSend(v73, "length");

            v52 = 0x24BDD1000;
            if (v74)
            {
              ++v241;
              ++v243;
              goto LABEL_63;
            }
          }
          else
          {

          }
          v246 += objc_msgSend(v68, "length");
          v247 += objc_msgSend(v68, "length");
LABEL_63:
          v65 = v257;
          v64 = (uint64_t)v271;
        }

        if (v64 != ++v66)
          continue;
        break;
      }
      v64 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v298, v319, 16);
      if (v64)
        continue;
      break;
    }
LABEL_68:

    -[TIReporter localeIdentifierForLanguage](self, "localeIdentifierForLanguage");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v75, "isEqualToString:", CFSTR("ko_KR")) & 1) != 0)
    {
      objc_msgSend(v233, "intended");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", &stru_24FD49B78);
      v77 = (id)objc_claimAutoreleasedReturnValue();
      +[TITesterUtils decomposeHangulSequence:](TITesterUtils, "decomposeHangulSequence:", v77);
      v78 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v233, "intended");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "componentsJoinedByString:", &stru_24FD49B78);
      v77 = (id)objc_claimAutoreleasedReturnValue();
      v78 = v77;
    }

    v213 = objc_msgSend(v78, "length");
    objc_msgSend(v78, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (v235)
    {
      v80 = v79;
      v81 = v233;
      objc_msgSend(v233, "intendedTransliteration");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "componentsJoinedByString:", &stru_24FD49B78);
      v222 = v80;
      v223 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v222 = &stru_24FD49B78;
      v223 = v79;
      v81 = v233;
    }
    objc_msgSend(v81, "input");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "componentsJoinedByString:", &stru_24FD49B78);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v84, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
    v221 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    v294 = 0u;
    v295 = 0u;
    v296 = 0u;
    v297 = 0u;
    objc_msgSend(v81, "touched");
    v272 = (id)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v294, v318, 16);
    if (v85)
    {
      v86 = v85;
      v87 = 0;
      v88 = *(_QWORD *)v295;
      do
      {
        for (j = 0; j != v86; ++j)
        {
          if (*(_QWORD *)v295 != v88)
            objc_enumerationMutation(v272);
          v90 = *(void **)(*((_QWORD *)&v294 + 1) + 8 * j);
          objc_msgSend(v90, "componentsJoinedByString:", &stru_24FD49B78);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v258, "appendString:", v91);

          v292 = 0u;
          v293 = 0u;
          v290 = 0u;
          v291 = 0u;
          v92 = v90;
          v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v290, v317, 16);
          if (v93)
          {
            v94 = v93;
            v95 = *(_QWORD *)v291;
            do
            {
              for (k = 0; k != v94; ++k)
              {
                if (*(_QWORD *)v291 != v95)
                  objc_enumerationMutation(v92);
                v97 = objc_msgSend(*(id *)(*((_QWORD *)&v290 + 1) + 8 * k), "isEqualToString:", CFSTR("<Delete>"));
                v87 += v97;
                v31 += v97;
              }
              v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v290, v317, 16);
            }
            while (v94);
          }

        }
        v86 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v294, v318, 16);
      }
      while (v86);
    }
    else
    {
      v87 = 0;
    }

    objc_msgSend(v258, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v273 = (id)objc_claimAutoreleasedReturnValue();
    v98 = v233;
    objc_msgSend(v233, "touchEvents");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v99, "count");

    if (v100)
    {
      v101 = 0;
      do
      {
        objc_msgSend(v98, "touchEvents");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "objectAtIndexedSubscript:", v101);
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v101);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "pathsForWords");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "objectForKey:", v104);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        v236 = v103;
        if (v106)
        {
          objc_msgSend(v98, "pathsForWords");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "objectForKeyedSubscript:", v104);
          v108 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v108, "toJsonDictionary");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v273, "appendFormat:", CFSTR("<CP; %@ >"), v109);

        }
        else
        {
          v288 = 0u;
          v289 = 0u;
          v286 = 0u;
          v287 = 0u;
          v108 = v103;
          v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v286, v316, 16);
          if (v110)
          {
            v111 = v110;
            v112 = *(_QWORD *)v287;
            do
            {
              for (m = 0; m != v111; ++m)
              {
                if (*(_QWORD *)v287 != v112)
                  objc_enumerationMutation(v108);
                objc_msgSend(*(id *)(*((_QWORD *)&v286 + 1) + 8 * m), "shortDescription");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v273, "appendString:", v114);

              }
              v111 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v286, v316, 16);
            }
            while (v111);
            v98 = v233;
          }
        }

        ++v101;
        objc_msgSend(v98, "touchEvents");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend(v115, "count");

      }
      while (v116 > v101);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v282 = 0u;
    v283 = 0u;
    v284 = 0u;
    v285 = 0u;
    objc_msgSend(v98, "inserted");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v282, v315, 16);
    if (v119)
    {
      v120 = v119;
      v121 = *(_QWORD *)v283;
      do
      {
        v122 = 0;
        v123 = v117;
        do
        {
          if (*(_QWORD *)v283 != v121)
            objc_enumerationMutation(v118);
          objc_msgSend(*(id *)(*((_QWORD *)&v282 + 1) + 8 * v122), "componentsJoinedByString:", &stru_24FD49B78);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "stringByAppendingString:", v124);
          v117 = (void *)objc_claimAutoreleasedReturnValue();

          ++v122;
          v123 = v117;
        }
        while (v120 != v122);
        v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v282, v315, 16);
      }
      while (v120);
    }

    objc_msgSend(v117, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\b"), CFSTR("\b"));
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\B"), CFSTR("\b"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v126, "length");

    objc_msgSend(v117, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
    v237 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v233, "corrected");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "componentsJoinedByString:", &stru_24FD49B78);
    v129 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v129, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
    v219 = (void *)objc_claimAutoreleasedReturnValue();

    TIPlistFormattedAlignedTypingSequence(v250, v200 > 0, v197, v199 > 0);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v278 = 0u;
    v279 = 0u;
    v280 = 0u;
    v281 = 0u;
    v251 = v130;
    v131 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v278, v314, 16);
    v211 = v127;
    if (v131)
    {
      v132 = v131;
      v133 = 0;
      v134 = 0;
      v135 = 0;
      v136 = *(_QWORD *)v279;
      do
      {
        for (n = 0; n != v132; ++n)
        {
          if (*(_QWORD *)v279 != v136)
            objc_enumerationMutation(v251);
          objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * n), "objectForKeyedSubscript:", CFSTR("autocorrectionType"));
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v133 += TIAutoCorrectionTypeCorrectedIsNotIntended(v138);
          v134 += TIAutoCorrectionTypeCorrectedIsNotIntendedAndInserted(v138);
          v135 += TIAutoCorrectionTypeCorrectedIsNotInserted(v138);
          objc_msgSend(v255, "addObject:", v138);

        }
        v132 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v278, v314, 16);
      }
      while (v132);
    }
    else
    {
      v133 = 0;
      v134 = 0;
      v135 = 0;
    }

    v206 = (void *)MEMORY[0x24BDBCED8];
    v312[0] = CFSTR("Seed");
    objc_msgSend(v233, "seed");
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v313[0] = v210;
    v312[1] = CFSTR("CorpusId");
    objc_msgSend(v233, "corpusId");
    v139 = objc_claimAutoreleasedReturnValue();
    v209 = (void *)v139;
    if (v139)
      v140 = (const __CFString *)v139;
    else
      v140 = &stru_24FD49B78;
    v313[1] = v140;
    v312[2] = CFSTR("Metadata");
    objc_msgSend(v233, "sourceMetadata");
    v141 = objc_claimAutoreleasedReturnValue();
    v208 = (void *)v141;
    v142 = MEMORY[0x24BDBD1B8];
    if (v141)
      v142 = v141;
    v313[2] = v142;
    v313[3] = v223;
    v312[3] = CFSTR("Intended");
    v312[4] = CFSTR("Input");
    v313[4] = v221;
    v313[5] = v220;
    v312[5] = CFSTR("Touched");
    v312[6] = CFSTR("TouchPoints");
    v313[6] = v273;
    v313[7] = v237;
    v312[7] = CFSTR("Inserted");
    v312[8] = CFSTR("Corrected");
    v313[8] = v219;
    v313[9] = v222;
    v312[9] = CFSTR("IntendedTransliteration");
    v312[10] = CFSTR("WordCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v262);
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v313[10] = v207;
    v312[11] = CFSTR("WordErrorCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v262 - v243);
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    v313[11] = v263;
    v312[12] = CFSTR("SeparatorCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v267);
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v313[12] = v244;
    v312[13] = CFSTR("SeparatorErrorCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v267 - v247);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    v313[13] = v268;
    v312[14] = CFSTR("KeystrokeCount");
    objc_msgSend(v233, "numberOfTouches");
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    v313[14] = v248;
    v312[15] = CFSTR("CharacterCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v213);
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v313[15] = v214;
    v312[16] = CFSTR("DeleteCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v87);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    v313[16] = v205;
    v312[17] = CFSTR("InsertedCharacterCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    v313[17] = v212;
    v313[18] = v251;
    v312[18] = CFSTR("Alignment");
    v312[19] = CFSTR("incorrectCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v133);
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v313[19] = v204;
    v312[20] = CFSTR("badAutocorrectionCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v134);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v313[20] = v143;
    v312[21] = CFSTR("autocorrectionCount");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v135);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v313[21] = v144;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v313, v312, 22);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v206, "dictionaryWithDictionary:", v145);
    v146 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v233, "debugData");
    v147 = (void *)objc_claimAutoreleasedReturnValue();

    if (v147)
    {
      objc_msgSend(v233, "debugData");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "setObject:forKey:", v148, CFSTR("DebugData"));

    }
    if (v198)
    {
      objc_msgSend(v233, "aggdStatistics");
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      if (v149)
      {
        objc_msgSend(v233, "aggdStatistics");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "setObject:forKey:", v150, CFSTR("AggdStatistics"));

      }
    }
    objc_msgSend(v233, "typologyLogURL");
    v151 = (void *)objc_claimAutoreleasedReturnValue();

    if (v151)
    {
      objc_msgSend(v233, "typologyLogURL");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "path");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "setObject:forKey:", v153, CFSTR("typologyLogPath"));

    }
    objc_msgSend(v233, "typologyTraceLogURL");
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    if (v154)
    {
      objc_msgSend(v233, "typologyTraceLogURL");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "path");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "setObject:forKey:", v156, CFSTR("typologyTraceLogPath"));

    }
    v216 += v133;
    v217 += v134;
    v218 += v135;
    objc_msgSend(v201, "addObject:", v146);

    v61 = v231;
    v60 = v232;
    v62 = v215;
LABEL_134:
    v232 = v226 + v60;
    v229 += v225;
    v230 += v224;

    objc_autoreleasePoolPop(context);
    v32 = v228;
    v30 = v202;
  }
  while (v228 != v202);
  fputc(10, (FILE *)*MEMORY[0x24BDAC8D8]);
  v157 = 1.0;
  v30 = v265;
  if (v229 > v265)
  {
    v157 = 0.0;
    if (v229 > v230)
      v157 = (float)(v229 - v230) / (float)(v229 - v265);
  }
  v158 = (float)v260;
  if (v260 < 1)
    v159 = 0.0;
  else
    v159 = (float)v241 / v158;
  if (v265 >= 1)
    v164 = (float)v246 / (float)v265;
  else
    v164 = 1.0;
  if (v229 < 1)
  {
    v166 = 0.0;
    v165 = 0.0;
    if (v260 >= 1)
      goto LABEL_149;
  }
  else
  {
    v166 = (float)v31 / (float)v229;
    if (v260 <= 0)
    {
      v165 = 0.0;
      goto LABEL_150;
    }
LABEL_149:
    v165 = (float)v216 / v158;
  }
LABEL_150:
  if (v218 >= 1)
    v167 = (float)v217 / (float)v218;
  else
    v167 = 0.0;
  v163 = v260;
  v160 = v230;
  v161 = v229;
  v162 = v232;
LABEL_154:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v275[0] = MEMORY[0x24BDAC760];
  v275[1] = 3221225472;
  v275[2] = __45__TIReporter_reportForAutocorrectionResults___block_invoke;
  v275[3] = &unk_24FD48B58;
  v276 = v255;
  v274 = v276;
  v169 = v168;
  v277 = v169;
  v238 = v169;
  objc_msgSend(v276, "enumerateObjectsUsingBlock:", v275);
  v310[0] = CFSTR("Language");
  -[TIReporter language](self, "language");
  v170 = objc_claimAutoreleasedReturnValue();
  v269 = (void *)v170;
  if (v170)
    v171 = (const __CFString *)v170;
  else
    v171 = &stru_24FD49B78;
  v311[0] = v171;
  v310[1] = CFSTR("TextCorpus");
  -[TIReporter textCorpus](self, "textCorpus");
  v172 = objc_claimAutoreleasedReturnValue();
  v266 = (void *)v172;
  if (v172)
    v173 = (const __CFString *)v172;
  else
    v173 = &stru_24FD49B78;
  v311[1] = v173;
  v310[2] = CFSTR("BuildVersion");
  -[TIReporter buildVersion](self, "buildVersion");
  v174 = objc_claimAutoreleasedReturnValue();
  v264 = (void *)v174;
  if (v174)
    v175 = (const __CFString *)v174;
  else
    v175 = &stru_24FD49B78;
  v311[2] = v175;
  v310[3] = CFSTR("Options");
  -[TIReporter options](self, "options");
  v176 = objc_claimAutoreleasedReturnValue();
  v261 = (void *)v176;
  v177 = MEMORY[0x24BDBD1B8];
  if (v176)
    v177 = v176;
  v311[3] = v177;
  v310[4] = CFSTR("KeystrokeCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v162);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v311[4] = v259;
  v310[5] = CFSTR("CharacterCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v161);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v311[5] = v256;
  v310[6] = CFSTR("DeleteCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v31);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v311[6] = obja;
  v310[7] = CFSTR("DeleteRatio");
  *(float *)&v178 = v166;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v178);
  v252 = (id)objc_claimAutoreleasedReturnValue();
  v311[7] = v252;
  v310[8] = CFSTR("InsertedCharacterCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v160);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v311[8] = v249;
  v311[9] = v201;
  v310[9] = CFSTR("Results");
  v310[10] = CFSTR("KeystrokeSavingsRatio");
  *(float *)&v179 = v157;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v179);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v311[10] = v245;
  v310[11] = CFSTR("WordCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v163);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  v311[11] = v240;
  v310[12] = CFSTR("WordErrorCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v163 - v241);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v311[12] = v242;
  v310[13] = CFSTR("WordAccuracy");
  *(float *)&v180 = v159;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v180);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v311[13] = v234;
  v310[14] = CFSTR("SeparatorCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v30);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v311[14] = v181;
  v310[15] = CFSTR("SeparatorErrorCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v30 - v246);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v311[15] = v182;
  v310[16] = CFSTR("SeparatorAccuracy");
  *(float *)&v183 = v164;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v311[16] = v184;
  v311[17] = CFSTR("1.14");
  v310[17] = CFSTR("ActVersion");
  v310[18] = CFSTR("TotalRevisionCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v216);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v311[18] = v185;
  v310[19] = CFSTR("TotalRevisionRate");
  *(float *)&v186 = v165;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v186);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v311[19] = v187;
  v310[20] = CFSTR("TotalBadAutocorrectionCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v217);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v311[20] = v188;
  v311[21] = v169;
  v310[21] = CFSTR("AutocorrectionTypeCounts");
  v310[22] = CFSTR("TotalAutocorrectionCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v218);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v311[22] = v189;
  v310[23] = CFSTR("AutoCorrectionRevisionRate");
  *(float *)&v190 = v167;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v311[23] = v191;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v311, v310, 24);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "addEntriesFromDictionary:", v192);

  v193 = v195;
  return v193;
}

- (NSMutableArray)resultLoggers
{
  return self->_resultLoggers;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_logSerializationQueue, 0);
  objc_storeStrong((id *)&self->_resultLoggers, 0);
}

void __45__TIReporter_reportForAutocorrectionResults___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "countForObject:", v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v4);

}

BOOL __71__TIReporter_alignedTypingSequenceForResult_keystrokeSegmentationMode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "compare:options:range:locale:", v5, 129, 0, objc_msgSend(v6, "length"), *(_QWORD *)(a1 + 32));

  return v7 == 0;
}

uint64_t __52__TIReporter_shouldConcatenateTokensAtBoundaryError__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
}

+ (id)languageForOptions:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("KEYBOARD_LANGUAGE"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_24FD49B78;
  v5 = v3;

  return v5;
}

+ (id)textCorpusForOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("TEXT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("CANDIDATE_SENTENCES"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("CANDIDATE_PHRASES"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(v3, "valueForKey:", CFSTR("TESTCASE"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastPathComponent");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "rangeOfString:options:", CFSTR("."), 4);
  if (v7 && v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "substringToIndex:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }

  return v6;
}

+ (id)fileURLForTrial:(unint64_t)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "languageForOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "textCorpusForOptions:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("OUTPATH"));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v9 = CFSTR("./");
  if (v8)
    v9 = v8;
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("test-typer-%@-%@-trial%03lu.json"), v6, v7, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingPathComponent:](v10, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
