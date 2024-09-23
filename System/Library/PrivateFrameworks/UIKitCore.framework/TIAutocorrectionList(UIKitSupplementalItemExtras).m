@implementation TIAutocorrectionList(UIKitSupplementalItemExtras)

- (id)ui_allSupplementalCandidates
{
  char v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v2 = objc_opt_respondsToSelector();
  v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if ((v2 & 1) != 0)
  {
    objc_msgSend(a1, "predictionsIfSupplemental");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(a1, "autocorrectionIfSupplemental"), (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count") + 1);
    objc_msgSend(v7, "addObject:", v6);
    if (v4)
      v8 = v4;
    else
      v8 = v3;
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

@end
