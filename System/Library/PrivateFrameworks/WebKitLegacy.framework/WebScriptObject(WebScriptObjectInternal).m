@implementation WebScriptObject(WebScriptObjectInternal)

- (char)_init
{
  char *v1;
  _BYTE *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)WebScriptObject_0;
  v1 = (char *)objc_msgSendSuper2(&v4, sel_init);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0DCDDA0]);
    *(_QWORD *)&v1[*MEMORY[0x1E0DCDDC0]] = v2;
    v2[*MEMORY[0x1E0DCDDC8]] = 1;
    return v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("+%@: _init is an internal initializer"), objc_opt_class());
    return 0;
  }
}

- (uint64_t)_initializeScriptDOMNodeImp
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  WebCore::ScriptController *v6;
  WebCore::DOMWrapperWorld *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  _DWORD *v12;
  uint64_t v13;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    v3 = a1[2];
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 528);
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 8);
      if (v5)
      {
        v6 = *(WebCore::ScriptController **)(v5 + 304);
        v7 = (WebCore::DOMWrapperWorld *)WebCore::mainThreadNormalWorld((WebCore *)result);
        v8 = WebCore::ScriptController::jsWindowProxy(v6, v7);
        v9 = WebCore::toJS(*(_QWORD *)(v8 + 16), *(_QWORD *)(v8 + 16), v3);
        v10 = WebCore::ScriptController::bindingRootObject(*(WebCore::ScriptController **)(v5 + 304));
        if (v10)
          *(_DWORD *)(v10 + 8) += 2;
        v12 = (_DWORD *)v10;
        v13 = v10;
        objc_msgSend(a1, "_setImp:originRootObject:rootObject:", v9, &v13, &v12);
        v11 = v12;
        v12 = 0;
        if (v11)
        {
          if (v11[2] == 1)
          {
            (*(void (**)(_DWORD *))(*(_QWORD *)v11 + 8))(v11);
            result = v13;
            v13 = 0;
            if (!result)
              return result;
            goto LABEL_12;
          }
          --v11[2];
        }
        result = v13;
        v13 = 0;
        if (!result)
          return result;
LABEL_12:
        if (*(_DWORD *)(result + 8) == 1)
          return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
        else
          --*(_DWORD *)(result + 8);
      }
    }
  }
  return result;
}

@end
