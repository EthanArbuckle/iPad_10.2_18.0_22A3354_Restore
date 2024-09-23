@implementation _LTDisambiguationLinkConfiguration(Daemon)

+ (id)_linkConfigurationWithSourceRange:()Daemon targetRange:unvalidatedAdjacencyList:expectedNumberOfEdges:
{
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = a7;
  if (objc_msgSend(v13, "count") == a8)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF63D0]), "initWithSourceRange:targetRange:unvalidatedAdjacencyList:", a3, a4, a5, a6, v13);
  }
  else
  {
    v15 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      v18 = 134218240;
      v19 = objc_msgSend(v13, "count");
      v20 = 2048;
      v21 = a8;
      _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "Only %zu out of %zu edges were valid, won't create a link for this selectionSpan", (uint8_t *)&v18, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

+ (id)linkConfigurationWithEMTSelectionSpan:()Daemon sourceText:targetText:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "alternatives");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x24BDBD1A8];
    if (v11)
      v13 = (void *)v11;
    v14 = v13;

    objc_msgSend(v14, "_ltCompactMap:", &__block_literal_global_6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "source");
    v18 = objc_msgSend(v9, "lt_codeUnitsRangeFromCodePointsRange:", v16, v17);
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[_LTDisambiguationLinkConfiguration(Daemon) linkConfigurationWithEMTSelectionSpan:sourceText:targetText:].cold.1(v20, v8);
      v21 = 0;
    }
    else
    {
      v22 = v18;
      v23 = v19;
      v34 = v15;
      v24 = objc_msgSend(v8, "projection");
      v26 = objc_msgSend(v10, "lt_codeUnitsRangeFromCodePointsRange:", v24, v25);
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = _LTOSLogDisambiguation();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          +[_LTDisambiguationLinkConfiguration(Daemon) linkConfigurationWithEMTSelectionSpan:sourceText:targetText:].cold.2(v28, v8);
        v21 = 0;
      }
      else
      {
        v29 = v26;
        v30 = v27;
        v31 = objc_msgSend(v14, "count");
        v32 = v29;
        v15 = v34;
        objc_msgSend(a1, "_linkConfigurationWithSourceRange:targetRange:unvalidatedAdjacencyList:expectedNumberOfEdges:", v22, v23, v32, v30, v34, v31);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)linkConfigurationWithFTSelectionSpan:()Daemon descriptions:sourceText:targetText:
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSUInteger v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSUInteger v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  NSUInteger v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  uint8_t buf[8];
  _QWORD v48[4];
  id v49;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "alternatives");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = (void *)MEMORY[0x24BDBD1A8];
  if (v14)
    v16 = (void *)v14;
  v17 = v16;

  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __118___LTDisambiguationLinkConfiguration_Daemon__linkConfigurationWithFTSelectionSpan_descriptions_sourceText_targetText___block_invoke;
  v48[3] = &unk_251A11BE8;
  v49 = v11;
  v18 = v11;
  objc_msgSend(v17, "_ltCompactMap:", v48);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "source_range");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v44 = a1;
    v46 = v13;
    v22 = (int)objc_msgSend(v20, "start");
    v23 = (void *)(int)objc_msgSend(v21, "length");
    v24 = objc_msgSend(v12, "lt_codeUnitsRangeFromCodePointsRange:", v22, v23);
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v45 = v17;
      v26 = v19;
      v27 = v18;
      v28 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        +[_LTDisambiguationLinkConfiguration(Daemon) linkConfigurationWithFTSelectionSpan:descriptions:sourceText:targetText:].cold.1(v28, v22, v23);
      v29 = 0;
      v18 = v27;
      v19 = v26;
      v17 = v45;
      goto LABEL_22;
    }
    v31 = v24;
    v32 = v25;
    objc_msgSend(v10, "projection_ranges");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v40 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v40, OS_LOG_TYPE_INFO, "Can't get target range on selectionSpan; won't create link",
          buf,
          2u);
      }
      v29 = 0;
      v13 = v46;
      goto LABEL_21;
    }
    v43 = v18;
    v35 = (int)objc_msgSend(v34, "start");
    v36 = (void *)(int)objc_msgSend(v34, "length");
    v42 = v35;
    v37 = objc_msgSend(v46, "lt_codeUnitsRangeFromCodePointsRange:", v35, v36);
    if (v37 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v39 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v13 = v46;
        +[_LTDisambiguationLinkConfiguration(Daemon) linkConfigurationWithFTSelectionSpan:descriptions:sourceText:targetText:].cold.2(v39, v42, v36);
        v29 = 0;
        goto LABEL_20;
      }
      v29 = 0;
    }
    else
    {
      objc_msgSend(v44, "_linkConfigurationWithSourceRange:targetRange:unvalidatedAdjacencyList:expectedNumberOfEdges:", v31, v32, v37, v38, v19, objc_msgSend(v17, "count"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v46;
LABEL_20:
    v18 = v43;
LABEL_21:

    goto LABEL_22;
  }
  v30 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v30, OS_LOG_TYPE_INFO, "No source range set on selectionSpan; won't create link",
      buf,
      2u);
  }
  v29 = 0;
LABEL_22:

  return v29;
}

+ (void)linkConfigurationWithEMTSelectionSpan:()Daemon sourceText:targetText:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];
  NSRange v6;

  v3 = OUTLINED_FUNCTION_8(a1);
  v6.location = objc_msgSend(a2, "source");
  NSStringFromRange(v6);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_2491B9000, v3, v4, "Code points source range: %{public}@ cannot be converted to NSString code units source range, source text length: %zu", v5);

  OUTLINED_FUNCTION_1_3();
}

+ (void)linkConfigurationWithEMTSelectionSpan:()Daemon sourceText:targetText:.cold.2(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];
  NSRange v6;

  v3 = OUTLINED_FUNCTION_8(a1);
  v6.location = objc_msgSend(a2, "projection");
  NSStringFromRange(v6);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_2491B9000, v3, v4, "Code points target range: %{public}@ cannot be converted to NSString code units target range, target text length: %zu", v5);

  OUTLINED_FUNCTION_1_3();
}

+ (void)linkConfigurationWithFTSelectionSpan:()Daemon descriptions:sourceText:targetText:.cold.1(void *a1, NSUInteger a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[24];
  NSRange v8;

  v5 = OUTLINED_FUNCTION_8(a1);
  v8.location = a2;
  v8.length = (NSUInteger)a3;
  NSStringFromRange(v8);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_2491B9000, v5, v6, "Code points source range: %{public}@ cannot be converted to NSString code units source range, source text length: %zu", v7);

  OUTLINED_FUNCTION_1_3();
}

+ (void)linkConfigurationWithFTSelectionSpan:()Daemon descriptions:sourceText:targetText:.cold.2(void *a1, NSUInteger a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[24];
  NSRange v8;

  v5 = OUTLINED_FUNCTION_8(a1);
  v8.location = a2;
  v8.length = (NSUInteger)a3;
  NSStringFromRange(v8);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_2491B9000, v5, v6, "Code points target range: %{public}@ cannot be converted to NSString code units target range, target text length: %zu", v7);

  OUTLINED_FUNCTION_1_3();
}

@end
