@implementation WebScriptObject(SUScriptAdditions)

- (id)copyArrayValueWithValidator:()SUScriptAdditions context:
{
  id v7;
  uint64_t v8;
  uint64_t v9;

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_msgSend(a1, "webScriptValueAtIndex:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 1;
    while (!a3 || (a3(v8, a4) & 1) != 0)
    {
      objc_msgSend(v7, "addObject:", v8);
      v8 = objc_msgSend(a1, "webScriptValueAtIndex:", v9);
      objc_opt_class();
      v9 = (v9 + 1);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v7;
    }

    return 0;
  }
  return v7;
}

- (id)copyArrayOrDictionaryWithContext:()SUScriptAdditions
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(a1, "copyJSONDataWithContext:");
  if (!v1)
    return 0;
  v2 = (void *)v1;
  v12 = 0;
  v3 = (id)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v1, 0, &v12);
  if (!v3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v7 &= 2u;
    if (v7)
    {
      v8 = objc_opt_class();
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v12;
      LODWORD(v11) = 22;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v13, v11);
        free(v10);
        SSFileLog();
      }
    }
  }

  return v3;
}

- (uint64_t)copyDate
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "JSValue"), "toObjectOfClass:", objc_opt_class()), "copy");
}

- (uint64_t)copyJSONDataWithContext:()SUScriptAdditions
{
  uint64_t v4;
  uint64_t v5;
  OpaqueJSValue *v6;
  OpaqueJSString *v7;
  OpaqueJSString *v8;
  const OpaqueJSValue *v9;
  JSStringRef v10;
  OpaqueJSString *v11;
  id v12;
  const JSChar *CharactersPtr;

  v4 = objc_msgSend(a1, "JSObject");
  v5 = 0;
  if (a3)
  {
    v6 = (OpaqueJSValue *)v4;
    if (v4)
    {
      v7 = JSStringCreateWithCFString(CFSTR("JSON.stringify(this);"));
      if (v7)
      {
        v8 = v7;
        v9 = JSEvaluateScript(a3, v7, v6, 0, 0, 0);
        if (v9 && (v10 = JSValueToStringCopy(a3, v9, 0)) != 0)
        {
          v11 = v10;
          v12 = objc_alloc(MEMORY[0x24BDBCE50]);
          CharactersPtr = JSStringGetCharactersPtr(v11);
          v5 = objc_msgSend(v12, "initWithBytes:length:", CharactersPtr, 2 * JSStringGetLength(v11));
          JSStringRelease(v11);
        }
        else
        {
          v5 = 0;
        }
        JSStringRelease(v8);
      }
      else
      {
        return 0;
      }
    }
  }
  return v5;
}

- (id)copyValuesForKeys:()SUScriptAdditions
{
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v15;

  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = &a9;
  if (a3)
  {
    do
    {
      v12 = objc_msgSend(a1, "safeValueForKey:", a3);
      if (v12)
        objc_msgSend(v11, "setObject:forKey:", v12, a3);
      v13 = v15++;
      a3 = *v13;
    }
    while (*v13);
  }
  return v11;
}

- (uint64_t)safeValueForKey:()SUScriptAdditions
{
  return objc_msgSend(a1, "valueForKey:");
}

@end
