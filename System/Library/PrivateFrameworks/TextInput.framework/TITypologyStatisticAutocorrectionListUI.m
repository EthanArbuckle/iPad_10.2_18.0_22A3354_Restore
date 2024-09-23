@implementation TITypologyStatisticAutocorrectionListUI

- (id)structuredReport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("ListUI Inputs While Hidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticAutocorrectionListUI inputsWhileHidden](self, "inputsWhileHidden"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("ListUI Inputs While Displayed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticAutocorrectionListUI inputsWhileDisplayed](self, "inputsWhileDisplayed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("ListUI Hidden To Displayed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticAutocorrectionListUI hiddenToDisplayed](self, "hiddenToDisplayed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("ListUI Displayed To Hidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[TITypologyStatisticAutocorrectionListUI displayedToHidden](self, "displayedToHidden"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addInputCount
{
  int *v2;

  if (self->_listUIDisplayed)
    v2 = &OBJC_IVAR___TITypologyStatisticAutocorrectionListUI__inputsWhileDisplayed;
  else
    v2 = &OBJC_IVAR___TITypologyStatisticAutocorrectionListUI__inputsWhileHidden;
  ++*(Class *)((char *)&self->super.super.isa + *v2);
}

- (void)setListUIDisplayed:(BOOL)a3
{
  int *v3;

  if (self->_didSetListUIDisplayed)
  {
    if (!self->_listUIDisplayed && a3)
    {
      v3 = &OBJC_IVAR___TITypologyStatisticAutocorrectionListUI__hiddenToDisplayed;
LABEL_8:
      ++*(Class *)((char *)&self->super.super.isa + *v3);
      goto LABEL_9;
    }
    if (self->_listUIDisplayed && !a3)
    {
      v3 = &OBJC_IVAR___TITypologyStatisticAutocorrectionListUI__displayedToHidden;
      goto LABEL_8;
    }
  }
LABEL_9:
  self->_didSetListUIDisplayed = 1;
  self->_listUIDisplayed = a3;
}

- (void)visitRecordSync:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TITypologyStatisticAutocorrectionListUI setListUIDisplayed:](self, "setListUIDisplayed:", objc_msgSend(v5, "autocorrectionListUIDisplayed"));

  }
}

- (void)visitRecordAutocorrections:(id)a3
{
  -[TITypologyStatisticAutocorrectionListUI setListUIDisplayed:](self, "setListUIDisplayed:", objc_msgSend(a3, "listUIDisplayed"));
}

- (int64_t)inputsWhileHidden
{
  return self->_inputsWhileHidden;
}

- (int64_t)inputsWhileDisplayed
{
  return self->_inputsWhileDisplayed;
}

- (int64_t)hiddenToDisplayed
{
  return self->_hiddenToDisplayed;
}

- (int64_t)displayedToHidden
{
  return self->_displayedToHidden;
}

@end
