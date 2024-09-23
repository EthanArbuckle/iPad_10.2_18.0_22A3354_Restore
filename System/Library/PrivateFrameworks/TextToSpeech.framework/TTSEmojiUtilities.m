@implementation TTSEmojiUtilities

+ (_NSRange)emojiRangeFromString:(id)a3 withSearchRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3010000000;
  v22 = &unk_1A3B14873;
  v23 = xmmword_1A3ABF300;
  objc_msgSend_substringWithRange_(v6, v7, location, length, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_length(v9, v10, v11, v12, v13);
  CEMEnumerateEmojiTokensInStringWithBlock();
  v14 = v20[4];
  v15 = v20[5];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v16 = v14 + location;

  _Block_object_dispose(&v19, 8);
  v17 = v16;
  v18 = v15;
  result.length = v18;
  result.location = v17;
  return result;
}

+ (void)_initializeEmojiStructures:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a3;
  v8 = v3;
  if (qword_1ED1B5620 != -1)
  {
    dispatch_once(&qword_1ED1B5620, &unk_1E4A9F2E8);
    if (v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (!v3)
  {
LABEL_3:
    objc_msgSend_currentLanguageCode(TTSSpeechManager, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AXCRemapLanguageCodeToFallbackIfNeccessary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:
  v10 = qword_1ED1B5628;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A39671F8;
  block[3] = &unk_1E4A9FAD0;
  v13 = v8;
  v11 = v8;
  dispatch_sync(v10, block);

}

+ (id)stringByRemovingEmojiCharacters:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const void *v19;
  _QWORD block[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];

  v4 = a3;
  objc_msgSend__initializeEmojiStructures_(a1, v5, 0, v6, v7);
  v12 = (void *)objc_msgSend_mutableCopy(v4, v8, v9, v10, v11);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A39673F0;
  block[3] = &unk_1E4A9FC10;
  block[4] = &v22;
  dispatch_sync((dispatch_queue_t)qword_1ED1B5628, block);
  v13 = (void *)MEMORY[0x1A8597054]();
  objc_msgSend_length(v4, v14, v15, v16, v17);
  v18 = v12;
  CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
  v19 = (const void *)v23[3];
  if (v19)
  {
    CFRelease(v19);
    v23[3] = 0;
  }

  objc_autoreleasePoolPop(v13);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

  return v18;
}

+ (void)enumerateEmojiCharactersInString:(id)a3 languageCode:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  id v19;
  _QWORD block[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v13 = a5;
  if (v8)
  {
    objc_msgSend__initializeEmojiStructures_(a1, v10, (uint64_t)v9, v11, v12);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A39675E0;
    block[3] = &unk_1E4A9FC10;
    block[4] = &v21;
    dispatch_sync((dispatch_queue_t)qword_1ED1B5628, block);
    objc_msgSend_length(v8, v14, v15, v16, v17);
    v19 = v13;
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
    v18 = (const void *)v22[3];
    if (v18)
    {
      CFRelease(v18);
      v22[3] = 0;
    }

    _Block_object_dispose(&v21, 8);
  }

}

+ (id)stringByReplacingEmojiCharactersWithEmojiDescriptions:(id)a3 stringForPauses:(id)a4 language:(id)a5 rangeReplacements:(id)a6 appendEmojiSuffix:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  BOOL v33;
  _QWORD v34[4];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18 = a6;
  if (v11)
  {
    v19 = (void *)objc_msgSend_mutableCopy(v11, v14, v15, v16, v17);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v20 = (void *)objc_opt_class();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1A396784C;
    v26[3] = &unk_1E4A9FFC0;
    v33 = a7;
    v27 = v13;
    v28 = v12;
    v29 = v11;
    v21 = v19;
    v30 = v21;
    v32 = v34;
    v31 = v18;
    objc_msgSend_enumerateEmojiCharactersInString_languageCode_withBlock_(v20, v22, (uint64_t)v29, (uint64_t)v27, (uint64_t)v26);
    v23 = v31;
    v24 = v21;

    _Block_object_dispose(v34, 8);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end
