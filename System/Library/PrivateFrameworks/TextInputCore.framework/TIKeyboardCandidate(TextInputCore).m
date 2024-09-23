@implementation TIKeyboardCandidate(TextInputCore)

- (void)core_updateWithSupplementalItemPrefix:()TextInputCore
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = objc_msgSend(a1, "supplementalItemPrefix");
  objc_msgSend(a1, "setSupplementalItemPrefix:", a3);
  if (v5)
  {
    objc_msgSend(a1, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "substringFromIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setInput:", v7);

  }
  if ((_DWORD)a3)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "input");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%C%@"), a3, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setInput:", v9);

  }
}

@end
