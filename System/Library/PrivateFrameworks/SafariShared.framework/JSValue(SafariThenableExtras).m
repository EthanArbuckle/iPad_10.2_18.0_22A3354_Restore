@implementation JSValue(SafariThenableExtras)

- (BOOL)safari_isThenable
{
  void *v2;
  const OpaqueJSContext *v3;
  const OpaqueJSValue *v4;
  const OpaqueJSContext *v5;
  const char *v6;

  objc_msgSend(a1, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const OpaqueJSContext *)objc_msgSend(v2, "JSGlobalContextRef");

  v4 = (const OpaqueJSValue *)objc_msgSend(a1, "JSValueRef");
  if (!JSValueIsObject(v3, v4))
    return 0;
  v5 = JSValueToObject(v3, v4, 0);
  return SafariShared::JSUtilities::functionObjectByName(v3, v5, (OpaqueJSValue *)"then", v6) != 0;
}

- (void)safari_awaitThenableResolutionWithCompletionHandler:()SafariThenableExtras
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__JSValue_SafariThenableExtras__safari_awaitThenableResolutionWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E4B29E68;
  v6 = v4;
  v17 = v6;
  v7 = (void *)MEMORY[0x1A8599ED0](v16);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __85__JSValue_SafariThenableExtras__safari_awaitThenableResolutionWithCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E4B29E68;
  v8 = v6;
  v15 = v8;
  v9 = (void *)MEMORY[0x1A8599ED0](v14);
  v10 = (void *)MEMORY[0x1A8599ED0](v7);
  v18[0] = v10;
  v11 = (void *)MEMORY[0x1A8599ED0](v9);
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(a1, "invokeMethod:withArguments:", CFSTR("then"), v12);

}

@end
