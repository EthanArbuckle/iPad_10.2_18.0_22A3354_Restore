@implementation DOMHTMLInputElement(UITextInputAdditions)

- (id)textInputTraits
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)&off_1EE08B000;
  v2 = objc_msgSendSuper2(&v17, sel_textInputTraits);
  v3 = (void *)objc_msgSend(a1, "form");
  v4 = (void *)objc_msgSend(a1, "type");
  if (!v3)
    goto LABEL_13;
  if (objc_msgSend(v3, "action"))
  {
    if ((objc_msgSend(v4, "isEqual:", CFSTR("search")) & 1) == 0
      && objc_msgSend((id)objc_msgSend(a1, "name"), "rangeOfString:options:", CFSTR("search"), 1) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend((id)objc_msgSend(a1, "idName"), "rangeOfString:options:", CFSTR("search"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend((id)objc_msgSend(a1, "title"), "rangeOfString:options:", CFSTR("search"), 1) == 0x7FFFFFFFFFFFFFFFLL)
        v5 = 1;
      else
        v5 = 6;
    }
    else
    {
      v5 = 6;
    }
    objc_msgSend(v2, "setReturnKeyType:", v5);
  }
  if (objc_msgSend(v3, "action"))
    v6 = objc_msgSend((id)objc_msgSend(v3, "action"), "rangeOfString:options:", CFSTR("login"), 1) != 0x7FFFFFFFFFFFFFFFLL;
  else
LABEL_13:
    v6 = 0;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("email")) & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("url"));
  v8 = objc_msgSend(a1, "isSecure");
  LODWORD(v9) = objc_msgSend(a1, "_autocapitalizeType") - 1;
  if (v9 >= 4)
    v9 = 2;
  else
    v9 = v9;
  v10 = v8 | v6 | v7;
  if (v10)
    v11 = 0;
  else
    v11 = v9;
  objc_msgSend(v2, "setAutocapitalizationType:", v11);
  v12 = (objc_msgSend(a1, "autocorrect") & ~v10) == 0;
  v13 = 1;
  if (v12)
    v14 = 1;
  else
    v14 = 2;
  objc_msgSend(v2, "setAutocorrectionType:", v14);
  objc_msgSend(v2, "setTextSuggestionDelegate:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_formDelegate"));
  objc_msgSend(v2, "setTextContentType:", objc_msgSend(a1, "getAttribute:", CFSTR("autocomplete")));
  v15 = (void *)objc_msgSend(a1, "getAttribute:", CFSTR("inputmode"));
  if ((objc_msgSend(v15, "hasPrefix:", CFSTR("latin")) & 1) == 0)
  {
    if ((objc_msgSend(v15, "hasPrefix:", CFSTR("full-width-latin")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v15, "hasPrefix:", CFSTR("kana")) & 1) != 0)
    {
      v13 = 3;
    }
    else if (objc_msgSend(v15, "hasPrefix:", CFSTR("katakana")))
    {
      v13 = 4;
    }
    else
    {
      v13 = 0;
    }
  }
  objc_msgSend(v2, "setTextScriptType:", v13);
  return v2;
}

- (uint64_t)text
{
  WebThreadLock();
  return objc_msgSend(a1, "value");
}

- (uint64_t)isSecure
{
  WebThreadLock();
  return objc_msgSend((id)objc_msgSend(a1, "type"), "isEqual:", CFSTR("password"));
}

- (uint64_t)isTextControl
{
  WebThreadLock();
  return objc_msgSend(a1, "_isTextField");
}

- (uint64_t)keyboardType
{
  void *v2;
  void *v3;
  void *v4;

  WebThreadLock();
  v2 = (void *)objc_msgSend(a1, "type");
  v3 = (void *)objc_msgSend(a1, "getAttribute:", CFSTR("pattern"));
  if (v3)
  {
    v4 = v3;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("\\d*")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("[0-9]*")) & 1) != 0)
    {
      return 4;
    }
  }
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("email")) & 1) != 0)
    return 7;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("number")) & 1) != 0)
    return 2;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("tel")) & 1) != 0)
    return 5;
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("url")))
    return 3;
  return 0;
}

- (uint64_t)setSelectionWithPoint:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend(a1, "setSelectionWithPoint:inset:", a2, a3, (double)(int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "innerLineHeight:", a1)* 0.5);
}

- (uint64_t)isEditing
{
  WebThreadLock();
  return objc_msgSend(a1, "isFocused");
}

@end
