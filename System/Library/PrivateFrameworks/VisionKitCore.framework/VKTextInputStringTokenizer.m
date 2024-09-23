@implementation VKTextInputStringTokenizer

- (VKTextInputStringTokenizer)initWithTextInput:(id)a3 recognitionResult:(id)a4
{
  id v7;
  VKTextInputStringTokenizer *v8;
  VKTextInputStringTokenizer *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VKTextInputStringTokenizer;
  v8 = -[UITextInputStringTokenizer initWithTextInput:](&v11, sel_initWithTextInput_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_recognitionResult, a4);

  return v9;
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v8 = a3;
  v9 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)VKTextInputStringTokenizer;
  -[UITextInputStringTokenizer rangeEnclosingPosition:withGranularity:inDirection:](&v15, sel_rangeEnclosingPosition_withGranularity_inDirection_, v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[VKTextInputStringTokenizer recognitionResult](self, "recognitionResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "adjustTextRangeToSelectableRange:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v13 = v13;

      v11 = v13;
    }
  }
  else
  {
    v13 = 0;
  }

  return v11;
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)VKTextInputStringTokenizer;
  -[UITextInputStringTokenizer positionFromPosition:toBoundary:inDirection:](&v13, sel_positionFromPosition_toBoundary_inDirection_, v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  VKDynamicCast(v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKTextInputStringTokenizer;
  return -[UITextInputStringTokenizer isPosition:atBoundary:inDirection:](&v6, sel_isPosition_atBoundary_inDirection_, a3, a4, a5);
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKTextInputStringTokenizer;
  return -[UITextInputStringTokenizer isPosition:withinTextUnit:inDirection:](&v6, sel_isPosition_withinTextUnit_inDirection_, a3, a4, a5);
}

- (VKCTextRecognitionResult)recognitionResult
{
  return self->_recognitionResult;
}

- (void)setRecognitionResult:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionResult, 0);
}

@end
