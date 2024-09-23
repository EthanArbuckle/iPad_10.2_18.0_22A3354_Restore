@implementation _LTWordTimingInfo(Daemon)

- (id)initWithFTWordTimingInfo:()Daemon
{
  id v4;
  id v5;
  void *v6;
  float v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&off_257888710;
  v5 = objc_msgSendSuper2(&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "word");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWord:", v6);

    objc_msgSend(v5, "setSampleIndex:", objc_msgSend(v4, "sample_idx"));
    objc_msgSend(v5, "setOffset:", objc_msgSend(v4, "offset"));
    objc_msgSend(v5, "setLength:", objc_msgSend(v4, "length"));
    objc_msgSend(v4, "timestamp");
    objc_msgSend(v5, "setStartTime:", v7);
    v8 = v5;
  }

  return v5;
}

+ (id)wordTimingInfoFromArray:()Daemon text:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = (void *)MEMORY[0x24BDBCEB8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58___LTWordTimingInfo_Daemon__wordTimingInfoFromArray_text___block_invoke;
  v12[3] = &unk_251A14168;
  v13 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  objc_msgSend((id)objc_opt_class(), "smoothedWordTimingWithTextRangeInfoFrom:wordTimingInfo:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)wordTimingInfoFromSiriTTSService:()Daemon text:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = (void *)MEMORY[0x24BDBCEB8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67___LTWordTimingInfo_Daemon__wordTimingInfoFromSiriTTSService_text___block_invoke;
  v12[3] = &unk_251A14190;
  v13 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  objc_msgSend((id)objc_opt_class(), "smoothedWordTimingWithTextRangeInfoFrom:wordTimingInfo:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)smoothedWordTimingWithTextRangeInfoFrom:()Daemon wordTimingInfo:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  NSUInteger length;
  NSUInteger location;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSUInteger v50;
  NSRange v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  NSUInteger v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  __int128 v78;
  id obj;
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  _BYTE v98[128];
  uint64_t v99;
  NSRange v100;
  NSRange v101;
  NSRange v102;
  NSRange v103;
  NSRange v104;
  NSRange v105;
  NSRange v106;
  NSRange v107;
  NSRange v108;

  v99 = *MEMORY[0x24BDAC8D0];
  v82 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v80 = (id)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v88 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        v12 = _LTOSLogTTS();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v93 = (uint64_t)v11;
          _os_log_debug_impl(&dword_2491B9000, v12, OS_LOG_TYPE_DEBUG, "Smoothing _LTWordTimingInfo: %@", buf, 0xCu);
        }
        v13 = objc_alloc_init(MEMORY[0x24BDF64E0]);
        objc_msgSend(v11, "word");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWord:", v14);

        objc_msgSend(v13, "setSampleIndex:", objc_msgSend(v11, "sampleIndex"));
        objc_msgSend(v11, "startTime");
        objc_msgSend(v13, "setStartTime:");
        v15 = objc_msgSend(v11, "offset");
        v16 = objc_msgSend(v11, "length");
        if (NSClassFromString(CFSTR("SiriTTSNSRangeUtil")))
        {
          v17 = -[objc_class mapUtf8RangeToUtf16:inText:](NSClassFromString(CFSTR("SiriTTSNSRangeUtil")), "mapUtf8RangeToUtf16:inText:", v15, v16, v82);
          objc_msgSend(v13, "setTextRange:", v17, v18);
        }
        objc_msgSend(v13, "textRange");
        objc_msgSend(v13, "setLength:", v19);
        objc_msgSend(v13, "setOffset:", objc_msgSend(v13, "textRange"));
        if (objc_msgSend(v13, "textRange") != v15 || v20 != v16)
        {
          v21 = _LTOSLogTTS();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = v21;
            v100.location = v15;
            v100.length = v16;
            NSStringFromRange(v100);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v101.location = objc_msgSend(v13, "textRange");
            NSStringFromRange(v101);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "word");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "length");
            *(_DWORD *)buf = 138412802;
            v93 = (uint64_t)v23;
            v94 = 2112;
            v95 = (uint64_t)v24;
            v96 = 2048;
            v97 = v26;
            _os_log_impl(&dword_2491B9000, v22, OS_LOG_TYPE_INFO, "Corrected FTWordTimingInfo UTF8(%@) range to UTF16(%@), word length: %zu", buf, 0x20u);

          }
        }
        if (v8 && (objc_msgSend(v8, "startTime"), v28 = v27, objc_msgSend(v13, "startTime"), v28 == v29))
        {
          v30 = _LTOSLogTTS();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2491B9000, v30, OS_LOG_TYPE_INFO, "Merging _LTWordTimingInfo to previous one because same start timestamp", buf, 2u);
          }
          objc_msgSend(v8, "word");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "word");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringByAppendingString:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setWord:", v33);

          objc_msgSend(v8, "textRange");
          v35 = v34;
          objc_msgSend(v13, "word");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "length") + v35;

          objc_msgSend(v8, "setTextRange:", objc_msgSend(v8, "textRange"), v37);
          objc_msgSend(v8, "setLength:", v37);
        }
        else
        {
          objc_msgSend(v80, "addObject:", v13);
          v38 = v13;

          v8 = v38;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v81 = v80;
  v39 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
  if (!v39)
  {
    length = 0;
    goto LABEL_47;
  }
  v41 = v39;
  length = 0;
  location = 0;
  v44 = 0;
  v45 = *(_QWORD *)v84;
  *(_QWORD *)&v40 = 134218240;
  v78 = v40;
  do
  {
    v46 = 0;
    do
    {
      v47 = v44;
      if (*(_QWORD *)v84 != v45)
        objc_enumerationMutation(v81);
      v48 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v46);
      v49 = _LTOSLogTTS();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v93 = (uint64_t)v48;
        _os_log_debug_impl(&dword_2491B9000, v49, OS_LOG_TYPE_DEBUG, "Smoothed _LTWordTimingInfo:\n%@", buf, 0xCu);
      }
      v107.location = objc_msgSend(v48, "textRange", v78);
      v107.length = v50;
      v102.location = location;
      v102.length = length;
      v51 = NSUnionRange(v102, v107);
      location = v51.location;
      length = v51.length;
      objc_msgSend(v48, "word");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "length");
      objc_msgSend(v48, "textRange");
      v55 = v54;

      if (v53 != v55 && (v56 = _LTOSLogTTS(), os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)))
      {
        v65 = v56;
        objc_msgSend(v48, "word");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "length");
        objc_msgSend(v48, "textRange");
        *(_DWORD *)buf = v78;
        v93 = v67;
        v94 = 2048;
        v95 = v68;
        _os_log_error_impl(&dword_2491B9000, v65, OS_LOG_TYPE_ERROR, "_LTWordTimingInfo word length(%zu) and text range length(%zu) don't match", buf, 0x16u);

        if (!v47)
          goto LABEL_37;
      }
      else if (!v47)
      {
        goto LABEL_37;
      }
      v57 = objc_msgSend(v47, "textRange");
      v59 = v58;
      v108.location = objc_msgSend(v48, "textRange");
      v108.length = v60;
      v103.location = v57;
      v103.length = v59;
      if (NSIntersectionRange(v103, v108).length)
      {
        v61 = _LTOSLogTTS();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          v72 = v61;
          v105.location = objc_msgSend(v48, "textRange");
          NSStringFromRange(v105);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v106.location = objc_msgSend(v47, "textRange");
          NSStringFromRange(v106);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v93 = (uint64_t)v73;
          v94 = 2112;
          v95 = (uint64_t)v74;
          _os_log_error_impl(&dword_2491B9000, v72, OS_LOG_TYPE_ERROR, "_LTWordTimingInfo text range(%@) overlaps with previous one(%@)", buf, 0x16u);

        }
      }
LABEL_37:
      v62 = objc_msgSend(v48, "textRange");
      objc_msgSend(v48, "textRange");
      if (v63 + v62 > (unint64_t)objc_msgSend(v82, "length"))
      {
        v64 = _LTOSLogTTS();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v69 = v64;
          v104.location = objc_msgSend(v48, "textRange");
          NSStringFromRange(v104);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v82, "length");
          *(_DWORD *)buf = 138412546;
          v93 = (uint64_t)v70;
          v94 = 2048;
          v95 = v71;
          _os_log_error_impl(&dword_2491B9000, v69, OS_LOG_TYPE_ERROR, "_LTWordTimingInfo text range(%@) is out of range from total text(text.length: %zu)", buf, 0x16u);

        }
      }
      v44 = v48;

      ++v46;
    }
    while (v41 != v46);
    v75 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    v41 = v75;
  }
  while (v75);

LABEL_47:
  if (length != objc_msgSend(v82, "length"))
  {
    v76 = _LTOSLogTTS();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      +[_LTWordTimingInfo(Daemon) smoothedWordTimingWithTextRangeInfoFrom:wordTimingInfo:].cold.1(v76, v82, length);
  }

  return v81;
}

+ (void)smoothedWordTimingWithTextRangeInfoFrom:()Daemon wordTimingInfo:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = 134218240;
  v7 = a3;
  v8 = 2048;
  v9 = objc_msgSend(a2, "length");
  _os_log_error_impl(&dword_2491B9000, v5, OS_LOG_TYPE_ERROR, "Union of _LTWordTimingInfo ranges length(%zu) does not match text length(%zu)", (uint8_t *)&v6, 0x16u);

}

@end
