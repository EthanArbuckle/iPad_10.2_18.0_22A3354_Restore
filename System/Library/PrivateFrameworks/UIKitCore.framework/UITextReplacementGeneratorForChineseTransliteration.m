@implementation UITextReplacementGeneratorForChineseTransliteration

- (id)replacements
{
  void *v3;
  __CFString *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[__CFString length](v4, "length") >> 2 > 0x800)
  {
LABEL_8:

    return v3;
  }
  -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_containsIdeographicCharacters");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37A0];
    -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithString:", v8);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (CFStringTransform(v4, 0, CFSTR("Simplified-Traditional"), 0))
    {
      -[UITextReplacementGenerator stringToReplace](self, "stringToReplace");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[__CFString isEqualToString:](v4, "isEqualToString:", v9);

      if (!v10
        || CFStringTransform(v4, 0, CFSTR("Traditional-Simplified"), 0)
        && (-[UITextReplacementGenerator stringToReplace](self, "stringToReplace"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = -[__CFString isEqualToString:](v4, "isEqualToString:", v11),
            v11,
            (v12 & 1) == 0))
      {
        -[UITextReplacementGenerator replacementWithText:](self, "replacementWithText:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
    }
    goto LABEL_8;
  }
  return v3;
}

@end
