@implementation TIIndicScriptComposer_ta

- (BOOL)composesConsonants
{
  return 0;
}

- (id)stringByComposingInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  __CFString *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("ஷ"))
    && (-[TIIndicScriptComposer context](self, "context"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasSuffix:", CFSTR("க்")),
        v5,
        (v6 & 1) != 0))
  {
    v7 = CFSTR("‌ஷ");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TIIndicScriptComposer_ta;
    -[TIIndicScriptComposer stringByComposingInput:](&v9, sel_stringByComposingInput_, v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end
