@implementation DOMHTMLTextAreaElement(UITextInputAdditions)

- (id)textInputTraits
{
  id v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&off_1EE09D190;
  v2 = objc_msgSendSuper2(&v8, sel_textInputTraits);
  v3 = objc_msgSend(a1, "isSecure");
  LODWORD(v4) = objc_msgSend(a1, "_autocapitalizeType") - 1;
  if (v4 >= 4)
    v4 = 2;
  else
    v4 = v4;
  if (v3)
    v5 = 0;
  else
    v5 = v4;
  objc_msgSend(v2, "setAutocapitalizationType:", v5);
  if ((objc_msgSend(a1, "autocorrect") & ~v3) != 0)
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(v2, "setAutocorrectionType:", v6);
  objc_msgSend(v2, "setTextSuggestionDelegate:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_formDelegate"));
  return v2;
}

- (uint64_t)isSingleLineDocument
{
  return 0;
}

- (uint64_t)isTextControl
{
  return 1;
}

- (uint64_t)setSelectionWithPoint:()UITextInputAdditions
{
  WebThreadLock();
  return objc_msgSend(a1, "setSelectionWithPoint:inset:", a2, a3, (double)(int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "innerLineHeight:", a1)* 0.5);
}

@end
