@implementation NSReadAttributedStringFromURLOrDataAsync

id ___NSReadAttributedStringFromURLOrDataAsync_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id result;

  _NSReadAttributedStringFromURLOrDataAsync_connectionQueue = (uint64_t)dispatch_queue_create("_NSReadAttributedStringFromURLOrDataAsync", MEMORY[0x1E0C80D50]);
  v2 = objc_msgSend(MEMORY[0x1E0CB3498], "_allowedTokensClasses");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0951E8);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_readFromData_orFileURL_options_extensionTokens_withReply_, 2, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_readFromData_orFileURL_options_extensionTokens_withReply_, 3, 0);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", *(_QWORD *)(a1 + 32), sel_readFromData_orFileURL_options_extensionTokens_withReply_, 1, 1);
  result = v3;
  _NSReadAttributedStringFromURLOrDataAsync_connectionInterface = (uint64_t)result;
  return result;
}

uint64_t ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelWithError:", a2);
}

uint64_t ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_3(uint64_t a1)
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
  void *v16;
  const char *v17;
  NSString *v18;
  const char *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleURL");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", NSBaseURLDocumentOption);
  if (objc_msgSend(v3, "isFileURL"))
    v4 = v3;
  else
    v4 = 0;
  if (v4)
  {
    v31[0] = v2;
    v31[1] = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (void **)v31;
    v7 = 2;
  }
  else
  {
    v30 = v2;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v30;
    v7 = 1;
  }
  v8 = objc_msgSend(v5, "arrayWithObjects:count:", v6, v7);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("_WKReadAccessFileURLsOption"));
  v28 = 0u;
  v29 = 0u;
  v10 = *(void **)(a1 + 40);
  if (v10)
    objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_msgSend(*(id *)(a1 + 48), "path");
  v26 = v28;
  v27 = v29;
  v13 = _extensionTokenForPath(&v26, v12);
  if (v13)
    objc_msgSend(v11, "addObject:", v13);
  v14 = (void *)objc_msgSend(v2, "path");
  v26 = v28;
  v27 = v29;
  v15 = _extensionTokenForPath(&v26, v14);
  if (v15)
    objc_msgSend(v11, "addObject:", v15);
  v16 = (void *)objc_msgSend(v4, "path");
  v26 = v28;
  v27 = v29;
  v17 = _extensionTokenForPath(&v26, v16);
  if (v17)
    objc_msgSend(v11, "addObject:", v17);
  v18 = NSTemporaryDirectory();
  v26 = v28;
  v27 = v29;
  v19 = _extensionTokenForPath(&v26, v18);
  if (v19)
    objc_msgSend(v11, "addObject:", v19);
  v20 = (id)objc_msgSend(v11, "copy");
  v22 = *(_QWORD *)(a1 + 48);
  v21 = *(void **)(a1 + 56);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_4;
  v25[3] = &unk_1E26044C0;
  v23 = *(_QWORD *)(a1 + 64);
  v25[4] = *(_QWORD *)(a1 + 72);
  return objc_msgSend(v21, "readFromData:orFileURL:options:extensionTokens:withReply:", v23, v22, v9, v20, v25);
}

uint64_t ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "deliverAttributedString:documentAttributes:error:", a2, a3, a4);
}

@end
