@implementation _UIAnimatedTextLayoutInfo

- (_UIAnimatedTextLayoutInfo)initWithAnimatedTextSpacer:(id)a3 animatingTextRange:(id)a4
{
  id v7;
  id v8;
  _UIAnimatedTextLayoutInfo *v9;
  _UIAnimatedTextLayoutInfo *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *previousAdjustments;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIAnimatedTextLayoutInfo;
  v9 = -[_UIAnimatedTextLayoutInfo init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_animatedTextSpacer, a3);
    objc_storeStrong((id *)&v10->_animatingTextRange, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    previousAdjustments = v10->_previousAdjustments;
    v10->_previousAdjustments = v11;

  }
  return v10;
}

- (double)verticalAdjustmentForTextParagraph:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_previousAdjustments, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  -[_UIAnimatedTextSpacer verticalOffsetForSucceedingLayout](self->_animatedTextSpacer, "verticalOffsetForSucceedingLayout");
  v9 = v8 - v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_previousAdjustments, "setObject:forKeyedSubscript:", v10, v4);

  return v9;
}

- (_UIAnimatedTextSpacer)animatedTextSpacer
{
  return self->_animatedTextSpacer;
}

- (NSTextRange)animatingTextRange
{
  return self->_animatingTextRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatingTextRange, 0);
  objc_storeStrong((id *)&self->_animatedTextSpacer, 0);
  objc_storeStrong((id *)&self->_previousAdjustments, 0);
}

@end
