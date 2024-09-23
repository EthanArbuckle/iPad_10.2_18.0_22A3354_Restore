@implementation TTSRegex

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  if (objc_msgSend_compiledPCRERegex(self, a2, v2, v3, v4))
  {
    v10 = objc_msgSend_compiledPCRERegex(self, v6, v7, v8, v9);
    pcre2_code_free_8(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)TTSRegex;
  -[TTSRegex dealloc](&v11, sel_dealloc);
}

- (TTSRegex)initWithPerlPattern:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int hasSuffix;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  TTSRegex *v29;

  v4 = a3;
  hasSuffix = objc_msgSend_hasSuffix_(v4, v5, (uint64_t)CFSTR("/i"), v6, v7);
  v16 = objc_msgSend_hasSuffix_(v4, v9, (uint64_t)CFSTR("/i"), v10, v11);
  if (hasSuffix)
  {
    v17 = objc_msgSend_length(v4, v12, v13, v14, v15);
    objc_msgSend_substringToIndex_(v4, v18, v17 - 1, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v21;
  }
  if (v16)
    v22 = 2;
  else
    v22 = 1;
  v23 = objc_msgSend_length(v4, v12, v13, v14, v15);
  objc_msgSend_substringWithRange_(v4, v24, 1, v23 - 2, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (TTSRegex *)objc_msgSend_initWithPattern_options_(self, v27, (uint64_t)v26, v22, v28);
  return v29;
}

- (TTSRegex)initWithPattern:(id)a3
{
  uint64_t v3;

  return (TTSRegex *)objc_msgSend_initWithPattern_options_(self, a2, (uint64_t)a3, 1, v3);
}

- (TTSRegex)initWithPattern:(id)a3 options:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = objc_retainAutorelease(a3);
  v10 = objc_msgSend_cStringUsingEncoding_(v6, v7, 4, v8, v9);
  return (TTSRegex *)MEMORY[0x1E0DE7D20](self, sel_initWithCStringPattern_options_, v10, a4, v11);
}

- (TTSRegex)initWithCStringPattern:(const char *)a3
{
  return (TTSRegex *)((uint64_t (*)(TTSRegex *, char *, const char *, uint64_t))MEMORY[0x1E0DE7D20])(self, sel_initWithCStringPattern_options_, a3, 1);
}

- (TTSRegex)initWithCStringPattern:(const char *)a3 options:(unint64_t)a4
{
  TTSRegex *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  TTSRegex *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  int v18;
  objc_super v19;
  _BYTE v20[512];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)TTSRegex;
  v5 = -[TTSRegex init](&v19, sel_init);
  if (!v5)
    goto LABEL_4;
  v18 = 0;
  v17 = 0;
  v6 = pcre2_compile_8((uint64_t)a3);
  if (v6)
  {
    objc_msgSend_setCompiledPCRERegex_(v5, v7, v6, v8, v9);
LABEL_4:
    v10 = v5;
    goto LABEL_8;
  }
  pcre2_get_error_message_8(v18, (uint64_t)v20, 512);
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v11, (uint64_t)v20, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  AXTTSLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1A3AB0CF8(&v17, (uint64_t)v14, v15);

  v10 = 0;
LABEL_8:

  return v10;
}

- (void)enumerateMatchesInCString:(const char *)a3 length:(unint64_t)a4 usingBlock:(id)a5
{
  objc_msgSend_enumerateMatchesInCString_startOffset_length_usingBlock_(self, a2, (uint64_t)a3, 0, a4, a5);
}

- (void)enumerateMatchesInCString:(const char *)a3 startOffset:(unint64_t)a4 length:(unint64_t)a5 usingBlock:(id)a6
{
  void (**v9)(id, uint64_t);
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t matched;
  uint64_t v22;
  _QWORD *ovector_pointer_8;
  const char *v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  const char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t startchar_8;
  void *v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;

  v9 = (void (**)(id, uint64_t))a6;
  v14 = objc_msgSend_compiledPCRERegex(self, v10, v11, v12, v13);
  v15 = pcre2_match_data_create_from_pattern_8(v14, 0);
  v20 = objc_msgSend_compiledPCRERegex(self, v16, v17, v18, v19);
  matched = pcre2_match_8(v20);
  if ((_DWORD)matched == -1)
  {
    pcre2_match_data_free_8((uint64_t)v15);
    goto LABEL_33;
  }
  v22 = matched;
  ovector_pointer_8 = (_QWORD *)pcre2_get_ovector_pointer_8((uint64_t)v15);
  objc_msgSend__matchFromOvector_matches_string_length_(self, v24, (uint64_t)ovector_pointer_8, v22, (uint64_t)a3, a5);
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
    v9[2](v9, v25);
  v38 = (void *)v25;
  HIDWORD(v40) = 0;
  pcre2_pattern_info_8(v14, 0, (uint64_t *)((char *)&v40 + 4));
  v26 = HIDWORD(v40);
  LODWORD(v40) = 0;
  pcre2_pattern_info_8(v14, 0x14u, &v40);
  v39 = v40 - 3;
  while (1)
  {
    while (1)
    {
      v27 = ovector_pointer_8[1];
      if (*ovector_pointer_8 != v27)
        break;
      if (v27 == a5)
        goto LABEL_32;
      v29 = pcre2_match_8(v14);
      if ((_DWORD)v29 != -1)
        goto LABEL_15;
      v30 = v27 + 1;
      ovector_pointer_8[1] = v27 + 1;
      if (v39 <= 2 && v27 < a5 - 1 && a3[v27] == 13 && a3[v30] == 10)
      {
        ovector_pointer_8[1] = v27 + 2;
      }
      else if ((v26 & 0x80000) != 0 && v30 < a5)
      {
        do
        {
          if ((a3[v30] & 0xC0) != 0x80)
            break;
          ovector_pointer_8[1] = ++v30;
        }
        while (a5 != v30);
      }
    }
    startchar_8 = pcre2_get_startchar_8((uint64_t)v15);
    if (v27 <= startchar_8)
    {
      if (startchar_8 >= a5)
        goto LABEL_32;
      v33 = startchar_8 + 1;
      if ((v26 & 0x80000) != 0 && v33 < a5)
      {
        do
        {
          if ((a3[v33] & 0xC0) != 0x80)
            break;
          ++v33;
        }
        while (a5 != v33);
      }
    }
    v29 = pcre2_match_8(v14);
    if ((_DWORD)v29 == -1)
      goto LABEL_32;
LABEL_15:
    if ((v29 & 0x80000000) != 0)
      break;
    objc_msgSend__matchFromOvector_matches_string_length_(self, v28, (uint64_t)ovector_pointer_8, v29, (uint64_t)a3, a5, v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, (uint64_t)v32);

  }
  AXTTSLogCommon();
  v34 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
    sub_1A3AB0D80(v29, v34, v35, v36, v37);

LABEL_32:
  pcre2_match_data_free_8((uint64_t)v15);

LABEL_33:
}

- (void)enumerateMatchesInCString:(const char *)a3 ranges:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v11)
  {
    v16 = v11;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v8);
        v19 = objc_msgSend_rangeValue(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v18), v12, v13, v14, v15);
        objc_msgSend_enumerateMatchesInCString_startOffset_length_usingBlock_(self, v20, (uint64_t)a3, v19, (uint64_t)&v20[v19], v9);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v12, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v16);
  }

}

- (id)matchesInCString:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v4;
  void *v8;
  id v9;
  const char *v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, a4, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1A396CAC0;
  v12[3] = &unk_1E4AA0208;
  v9 = v8;
  v13 = v9;
  objc_msgSend_enumerateMatchesInCString_length_usingBlock_(self, v10, (uint64_t)a3, a4, (uint64_t)v12);

  return v9;
}

- (id)_matchFromOvector:(unint64_t *)a3 matches:(int)a4 string:(const char *)a5 length:(unint64_t)a6
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  TTSRegexMatch *v12;
  unint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  TTSRegexCaptureGroup *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v13 = a3 + 1;
    v14 = a4;
    do
    {
      v15 = *(v13 - 1);
      if (v15 == -1 && v12 == 0)
      {
        v12 = 0;
      }
      else
      {
        v17 = *v13 - v15;
        if (v15 == -1)
          v18 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v18 = *(v13 - 1);
        if (v12)
        {
          v19 = objc_alloc_init(TTSRegexCaptureGroup);
          objc_msgSend_setUtf8Range_(v19, v20, v18, v17, v21);
          objc_msgSend_addObject_(v11, v22, (uint64_t)v19, v23, v24);

        }
        else
        {
          v12 = objc_alloc_init(TTSRegexMatch);
          objc_msgSend_setUtf8Range_(v12, v25, v18, v17, v26);
        }
      }
      v13 += 2;
      --v14;
    }
    while (v14);
  }
  objc_msgSend_setCaptureGroups_(v12, v8, (uint64_t)v11, v9, v10);

  return v12;
}

- (pcre2_real_code_8)compiledPCRERegex
{
  return self->_compiledPCRERegex;
}

- (void)setCompiledPCRERegex:(pcre2_real_code_8 *)a3
{
  self->_compiledPCRERegex = a3;
}

@end
