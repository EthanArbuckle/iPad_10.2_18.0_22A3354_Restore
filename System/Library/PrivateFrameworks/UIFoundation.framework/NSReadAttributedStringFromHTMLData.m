@implementation NSReadAttributedStringFromHTMLData

id ___NSReadAttributedStringFromHTMLData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id result;

  _NSReadAttributedStringFromHTMLData_connectionQueue = (uint64_t)dispatch_queue_create("_NSReadAttributedStringFromHTMLData", MEMORY[0x1E0C80D50]);
  v2 = objc_msgSend(MEMORY[0x1E0CB3498], "_allowedTokensClasses");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0951E8);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_renderHTML_options_extensionTokens_withReply_, 1, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_renderHTML_options_extensionTokens_withReply_, 2, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_renderHTML_options_extensionTokens_withReply_, 0, 1);
  result = v3;
  _NSReadAttributedStringFromHTMLData_connectionInterface = (uint64_t)result;
  return result;
}

uint64_t ___NSReadAttributedStringFromHTMLData_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void ___NSReadAttributedStringFromHTMLData_block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t ___NSReadAttributedStringFromHTMLData_block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  NSString *v16;
  const char *v17;
  id v18;
  __int128 v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[5];
  __int128 v24;
  __int128 v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleURL");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", NSBaseURLDocumentOption);
  if (objc_msgSend(v3, "isFileURL"))
    v4 = v3;
  else
    v4 = 0;
  if (v4)
  {
    v32[0] = v2;
    v32[1] = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (void **)v32;
    v7 = 2;
  }
  else
  {
    v31 = v2;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v31;
    v7 = 1;
  }
  v8 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("_WKReadAccessFileURLsOption"));
  v29 = 0u;
  v30 = 0u;
  v10 = *(void **)(a1 + 40);
  if (v10)
    objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_msgSend(v2, "path");
  v27 = v29;
  v28 = v30;
  v13 = _extensionTokenForPath(&v27, v12);
  if (v13)
    objc_msgSend(v11, "addObject:", v13);
  v14 = (void *)objc_msgSend(v4, "path");
  v27 = v29;
  v28 = v30;
  v15 = _extensionTokenForPath(&v27, v14);
  if (v15)
    objc_msgSend(v11, "addObject:", v15);
  v16 = NSTemporaryDirectory();
  v27 = v29;
  v28 = v30;
  v17 = _extensionTokenForPath(&v27, v16);
  if (v17)
    objc_msgSend(v11, "addObject:", v17);
  v18 = (id)objc_msgSend(v11, "copy");
  v23[1] = 3221225472;
  v19 = *(_OWORD *)(a1 + 64);
  v25 = *(_OWORD *)(a1 + 80);
  v20 = *(void **)(a1 + 48);
  v21 = *(_QWORD *)(a1 + 56);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[2] = ___NSReadAttributedStringFromHTMLData_block_invoke_5;
  v23[3] = &unk_1E26045D0;
  v23[4] = *(_QWORD *)(a1 + 32);
  v26 = *(_BYTE *)(a1 + 96);
  v24 = v19;
  return objc_msgSend(v20, "renderHTML:options:extensionTokens:withReply:", v21, v9, v18, v23);
}

void ___NSReadAttributedStringFromHTMLData_block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v6 = a2;
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("DocumentType")))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("DocumentType"));
    if (v6)
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    else
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = v9;
    if (v8)
      v11 = (const __CFString *)v8;
    else
      v11 = CFSTR("NSHTML");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("DocumentType"));
    v6 = (id)objc_msgSend(v10, "copy");
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a3, "mutableCopy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(v6, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(a4, "copy");
  if (!*(_BYTE *)(a1 + 72))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
}

@end
