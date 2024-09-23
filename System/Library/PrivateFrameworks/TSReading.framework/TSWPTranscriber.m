@implementation TSWPTranscriber

- (TSWPTranscriber)initWithIdentifier:(id)a3 displayName:(id)a4 romanizationLocaleID:(id)a5 transformIdentifier:(id)a6
{
  TSWPTranscriber *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSWPTranscriber;
  v10 = -[TSWPTranscriber init](&v12, sel_init);
  if (v10)
  {
    v10->_identifier = (NSString *)objc_msgSend(a3, "copy");
    v10->_displayName = (NSString *)objc_msgSend(a4, "copy");
    v10->_transformIdentifier = (NSString *)objc_msgSend(a6, "copy");
    v10->_romanizationLocale = (NSLocale *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", a5);
  }
  return v10;
}

+ (id)transcriberWithIdentifier:(id)a3 displayName:(id)a4 romanizationLocaleID:(id)a5 transformIdentifier:(id)a6
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:displayName:romanizationLocaleID:transformIdentifier:", a3, a4, a5, a6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPTranscriber;
  -[TSWPTranscriber dealloc](&v3, sel_dealloc);
}

- (id)transcribeText:(id)a3
{
  return -[TSWPTranscriber transcribeText:withLocale:](self, "transcribeText:withLocale:", a3, self->_romanizationLocale);
}

- (id)transcribeText:(id)a3 withLocale:(id)a4
{
  void *v7;
  uint64_t v8;
  _QWORD v10[8];
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  CFRange v16;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v16.length = objc_msgSend(a3, "length");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__TSWPTranscriber_transcribeText_withLocale___block_invoke;
  v10[3] = &unk_24D82D4E0;
  v11 = 1;
  v10[4] = v7;
  v10[5] = a3;
  v10[6] = self;
  v10[7] = &v12;
  v16.location = 0;
  TSWPEnumerateWordsInStringWithBlock((CFStringRef)a3, v16, (CFLocaleRef)a4, (uint64_t)v10);
  if (objc_msgSend(a3, "length"))
  {
    v8 = v13[3];
    if (v8 < objc_msgSend(a3, "length") - 1)
      objc_msgSend(v7, "appendString:", objc_msgSend(a3, "substringFromIndex:", v13[3]));
  }
  _Block_object_dispose(&v12, 8);
  return v7;
}

CFTypeRef __45__TSWPTranscriber_transcribeText_withLocale___block_invoke(uint64_t a1, CFStringTokenizerRef tokenizer)
{
  CFTypeRef result;
  void *v5;
  CFRange CurrentTokenRange;
  uint64_t v7;
  CFRange v8;

  result = CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, 0x10000uLL);
  if (result)
  {
    v5 = (void *)result;
    if (*(_BYTE *)(a1 + 64))
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (CurrentTokenRange.location > *(_QWORD *)(v7 + 24))
      {
        objc_msgSend(*(id *)(a1 + 32), "appendString:", objc_msgSend(*(id *)(a1 + 40), "substringWithRange:"));
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      *(_QWORD *)(v7 + 24) = CurrentTokenRange.location + CurrentTokenRange.length;
    }
    v8.length = objc_msgSend(v5, "length", objc_msgSend(*(id *)(a1 + 32), "length"));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

    return (CFTypeRef)CFStringTransform(*(CFMutableStringRef *)(a1 + 32), &v8, *(CFStringRef *)(*(_QWORD *)(a1 + 48) + 24), 0);
  }
  return result;
}

- (NSLocale)romanizationLocale
{
  return self->_romanizationLocale;
}

@end
