@implementation SBUINumericPasscodeEntryFieldBase

- (SBUINumericPasscodeEntryFieldBase)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  SBUINumericPasscodeEntryFieldBase *v3;
  NSMutableCharacterSet *v4;
  NSMutableCharacterSet *numericTrimmingSet;
  NSMutableCharacterSet *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBUINumericPasscodeEntryFieldBase;
  v3 = -[SBUIPasscodeEntryField initWithDefaultSizeAndLightStyle:](&v9, sel_initWithDefaultSizeAndLightStyle_, a3);
  if (v3)
  {
    v4 = (NSMutableCharacterSet *)objc_alloc_init(MEMORY[0x1E0CB3780]);
    numericTrimmingSet = v3->_numericTrimmingSet;
    v3->_numericTrimmingSet = v4;

    v6 = v3->_numericTrimmingSet;
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableCharacterSet formUnionWithCharacterSet:](v6, "formUnionWithCharacterSet:", v7);

    v3->_allowsNewlineAcceptance = 0;
    v3->_maxNumbersAllowed = -1;
    v3->_autoAcceptWhenMaxNumbersMet = 1;
  }
  return v3;
}

- (void)setAllowsNewlineAcceptance:(BOOL)a3
{
  NSMutableCharacterSet *numericTrimmingSet;
  id v4;

  if (self->_allowsNewlineAcceptance != a3)
  {
    self->_allowsNewlineAcceptance = a3;
    numericTrimmingSet = self->_numericTrimmingSet;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableCharacterSet formUnionWithCharacterSet:](numericTrimmingSet, "formUnionWithCharacterSet:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableCharacterSet formIntersectionWithCharacterSet:](numericTrimmingSet, "formIntersectionWithCharacterSet:");
    }

  }
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  if (objc_msgSend((id)objc_opt_class(), "_shouldResetAutoAcceptWhenMaxNumbersMetInResignFirstResponder"))
    -[SBUINumericPasscodeEntryFieldBase setAutoAcceptWhenMaxNumbersMet:](self, "setAutoAcceptWhenMaxNumbersMet:", 1);
  v4.receiver = self;
  v4.super_class = (Class)SBUINumericPasscodeEntryFieldBase;
  return -[SBUIPasscodeEntryField resignFirstResponder](&v4, sel_resignFirstResponder);
}

- (BOOL)shouldInsertPasscodeText:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUINumericPasscodeEntryFieldBase;
  if (-[SBUIPasscodeEntryField shouldInsertPasscodeText:](&v7, sel_shouldInsertPasscodeText_, v4))
    v5 = objc_msgSend(v4, "isSingleCharacterAndMemberOfSet:", self->_numericTrimmingSet);
  else
    v5 = 0;

  return v5;
}

- (void)_deleteLastCharacter
{
  void *v3;
  void *v4;
  id v5;

  -[SBUIPasscodeEntryField _textField](self, "_textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "_stringByTrimmingLastCharacter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);

    -[SBUIPasscodeEntryField notePasscodeFieldTextDidChange](self, "notePasscodeFieldTextDidChange");
  }

}

- (void)_appendString:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  unint64_t maxNumbersAllowed;
  id v9;

  v9 = a3;
  -[SBUIPasscodeEntryField stringValue](self, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!-[SBUINumericPasscodeEntryFieldBase _hasMaxDigitsSpecified](self, "_hasMaxDigitsSpecified"))
  {
    if (!v5
      || !objc_msgSend(v9, "isNewline")
      || !-[SBUINumericPasscodeEntryFieldBase allowsNewlineAcceptance](self, "allowsNewlineAcceptance"))
    {
      -[SBUINumericPasscodeEntryFieldBase _reallyAppendString:](self, "_reallyAppendString:", v9);
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "length") + v5 <= self->_maxNumbersAllowed)
    -[SBUINumericPasscodeEntryFieldBase _reallyAppendString:](self, "_reallyAppendString:", v9);
  if (self->_autoAcceptWhenMaxNumbersMet)
  {
    -[SBUIPasscodeEntryField stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");
    maxNumbersAllowed = self->_maxNumbersAllowed;

    if (v7 >= maxNumbersAllowed)
LABEL_10:
      -[SBUIPasscodeEntryField notePasscodeFieldDidAcceptEntry](self, "notePasscodeFieldDidAcceptEntry");
  }
LABEL_12:

}

+ (BOOL)_shouldResetAutoAcceptWhenMaxNumbersMetInResignFirstResponder
{
  return 1;
}

- (void)_reallyAppendString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[SBUIPasscodeEntryField _textField](self, "_textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "stringByAppendingString:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v8;
  }
  objc_msgSend(v4, "setText:", v7);
  -[SBUIPasscodeEntryField notePasscodeFieldTextDidChange](self, "notePasscodeFieldTextDidChange");

}

- (BOOL)_hasMaxDigitsSpecified
{
  return self->_maxNumbersAllowed != -1;
}

- (BOOL)allowsNewlineAcceptance
{
  return self->_allowsNewlineAcceptance;
}

- (unint64_t)maxNumbersAllowed
{
  return self->_maxNumbersAllowed;
}

- (void)setMaxNumbersAllowed:(unint64_t)a3
{
  self->_maxNumbersAllowed = a3;
}

- (BOOL)autoAcceptWhenMaxNumbersMet
{
  return self->_autoAcceptWhenMaxNumbersMet;
}

- (void)setAutoAcceptWhenMaxNumbersMet:(BOOL)a3
{
  self->_autoAcceptWhenMaxNumbersMet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericTrimmingSet, 0);
}

@end
