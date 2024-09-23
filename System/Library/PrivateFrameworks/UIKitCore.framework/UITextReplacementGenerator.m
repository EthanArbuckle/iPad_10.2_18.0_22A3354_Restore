@implementation UITextReplacementGenerator

- (BOOL)shouldAllowString:(id)a3 intoReplacements:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length")
    && (-[UITextReplacementGenerator stringToReplace](self, "stringToReplace"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v6, "isEqualToString:", v8),
        v8,
        (v9 & 1) == 0))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__UITextReplacementGenerator_shouldAllowString_intoReplacements___block_invoke;
    v12[3] = &unk_1E16C3618;
    v13 = v6;
    v10 = objc_msgSend(v7, "indexOfObjectPassingTest:", v12) == 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __65__UITextReplacementGenerator_shouldAllowString_intoReplacements___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "menuTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (id)replacementWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UITextReplacementGenerator replacementRange](self, "replacementRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextReplacement replacementWithRange:original:replacement:menuTitle:](UITextReplacement, "replacementWithRange:original:replacement:menuTitle:", v5, v6, v4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addPlaceholderForEmptyReplacements:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("No Replacements Found"), CFSTR("No Replacements Found"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextReplacement replacementWithRange:original:replacement:menuTitle:](UITextReplacement, "replacementWithRange:original:replacement:menuTitle:", 0, 0, 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v4);
  }

}

- (id)replacements
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextReplacement.m"), 122, CFSTR("%@ subclasses must override %s"), v6, "-[UITextReplacementGenerator replacements]");

  return 0;
}

- (BOOL)isStringToReplaceMisspelled
{
  return 0;
}

- (UITextRange)replacementRange
{
  return self->_replacementRange;
}

- (void)setReplacementRange:(id)a3
{
  objc_storeStrong((id *)&self->_replacementRange, a3);
}

- (NSString)stringToReplace
{
  return self->_stringToReplace;
}

- (void)setStringToReplace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringToReplace, 0);
  objc_storeStrong((id *)&self->_replacementRange, 0);
}

@end
