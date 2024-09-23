@implementation TSDTextInputTokenizer

- (TSDTextInputTokenizer)initWithTextInput:(id)a3
{
  TSDTextInputTokenizer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDTextInputTokenizer;
  v3 = -[UITextInputStringTokenizer initWithTextInput:](&v5, sel_initWithTextInput_);
  if (v3)
  {
    objc_opt_class();
    v3->_textInputResponder = (TSDTextInputResponder *)TSUDynamicCast();
  }
  return v3;
}

- (TSDTextInput)editor
{
  return -[TSDTextInputResponder editor](self->_textInputResponder, "editor");
}

- (BOOL)isPosition:(id)a3 atBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  void *v8;
  void *v9;
  uint64_t v10;

  objc_opt_class();
  v8 = (void *)TSUDynamicCast();
  if (!v8)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputTokenizer isPosition:atBoundary:inDirection:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2208, CFSTR("bad text position"));
  }
  return -[TSDTextInput isCharIndex:withEolAffinity:atBoundary:inDirection:](-[TSDTextInputResponder editor](self->_textInputResponder, "editor"), "isCharIndex:withEolAffinity:atBoundary:inDirection:", objc_msgSend(v8, "charIndex"), objc_msgSend(v8, "endOfLineAffinity"), a4, a5);
}

- (id)p_positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  uint64_t v9;
  void *v10;
  id result;
  id v12;
  unint64_t v13;
  float v14;
  uint64_t v15;
  int v16;
  double v17;
  TSDTextInputResponder *textInputResponder;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  double v24;
  objc_super v25;
  double v26;

  objc_opt_class();
  v9 = TSUDynamicCast();
  if (!v9)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputTokenizer p_positionFromPosition:toBoundary:inDirection:]");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2227, CFSTR("invalid nil value for '%s'"), "tsdPosition");
    -[TSDTextInputTokenizer editor](self, "editor");
    return 0;
  }
  v10 = (void *)v9;
  result = -[TSDTextInputTokenizer editor](self, "editor");
  if (!result)
    return result;
  if ((unint64_t)a4 > 4 || ((1 << a4) & 0x1A) == 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)TSDTextInputTokenizer;
    return -[UITextInputStringTokenizer positionFromPosition:toBoundary:inDirection:](&v25, sel_positionFromPosition_toBoundary_inDirection_, a3, a4, a5);
  }
  v12 = result;
  v13 = objc_msgSend(v10, "charIndex");
  if (v13 > objc_msgSend(v12, "editRange"))
    objc_msgSend(v10, "endOfLineAffinity");
  objc_msgSend(v10, "preferredPosition");
  v26 = v14;
  v15 = objc_msgSend(v12, "charIndexByMovingPosition:toBoundary:inDirection:preferPosition:", v10, a4, a5, &v26);
  v16 = objc_msgSend(v10, "isPreferredStart");
  HIDWORD(v17) = HIDWORD(v26);
  *(float *)&v17 = v26;
  textInputResponder = self->_textInputResponder;
  if (v16)
    -[TSDTextInputResponder setPreferredStartPosition:](textInputResponder, "setPreferredStartPosition:", v17);
  else
    -[TSDTextInputResponder setPreferredEndPosition:](textInputResponder, "setPreferredEndPosition:", v17);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4 != 4)
      goto LABEL_21;
    if ((unint64_t)(a5 - 4) < 2)
    {
      v21 = objc_msgSend(v10, "endOfLineAffinity");
      goto LABEL_23;
    }
    if (a5 == 2 || !a5)
      v21 = 1;
    else
LABEL_21:
      v21 = 0;
LABEL_23:
    v22 = v26;
    v23 = objc_msgSend(v10, "isPreferredStart");
    *(float *)&v24 = v22;
    return +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v15, v21, v23, v24);
  }
  if (-[TSDTextInputTokenizer isPosition:atBoundary:inDirection:](self, "isPosition:atBoundary:inDirection:", a3, a4, a5))
  {
    return a3;
  }
  else
  {
    return 0;
  }
}

- (id)p_moveToStartOfWordFromPosition:(id)a3
{
  BOOL v5;
  id result;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = -[TSDTextInputTokenizer isPosition:withinTextUnit:inDirection:](self, "isPosition:withinTextUnit:inDirection:", a3, 1, 1);
  result = -[TSDTextInputTokenizer p_positionFromPosition:toBoundary:inDirection:](self, "p_positionFromPosition:toBoundary:inDirection:", a3, 1, 1);
  v7 = result;
  if (!v5)
  {
    if (!result)
    {
      v7 = a3;
      do
      {
        objc_opt_class();
        v8 = (void *)TSUDynamicCast();
        if (!v8)
        {
          v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputTokenizer p_moveToStartOfWordFromPosition:]");
          objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2302, CFSTR("Bad text position."));
        }
        if (!objc_msgSend(v8, "charIndex"))
          break;
        v7 = -[TSDTextInputTokenizer p_positionFromPosition:toBoundary:inDirection:](self, "p_positionFromPosition:toBoundary:inDirection:", v7, 3, 1);
      }
      while (-[TSDTextInputTokenizer isPosition:atBoundary:inDirection:](self, "isPosition:atBoundary:inDirection:", v7, 3, 1));
    }
    return -[TSDTextInputTokenizer p_positionFromPosition:toBoundary:inDirection:](self, "p_positionFromPosition:toBoundary:inDirection:", v7, 1, 1);
  }
  return result;
}

- (id)p_moveToEndOfWordFromPosition:(id)a3
{
  id v3;
  id v5;

  v3 = a3;
  if (!-[TSDTextInputTokenizer isPosition:withinTextUnit:inDirection:](self, "isPosition:withinTextUnit:inDirection:", a3, 1, 0))
  {
    v5 = -[TSDTextInputTokenizer p_positionFromPosition:toBoundary:inDirection:](self, "p_positionFromPosition:toBoundary:inDirection:", v3, 1, 0);
    if (v5)
      v3 = v5;
  }
  return -[TSDTextInputTokenizer p_positionFromPosition:toBoundary:inDirection:](self, "p_positionFromPosition:toBoundary:inDirection:", v3, 1, 0);
}

- (id)positionFromPosition:(id)a3 toBoundary:(int64_t)a4 inDirection:(int64_t)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  TSDTextInputTokenizer *v12;
  id v13;
  int64_t v14;
  int64_t v15;

  objc_opt_class();
  v9 = (void *)TSUDynamicCast();
  if (!v9)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputTokenizer positionFromPosition:toBoundary:inDirection:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2343, CFSTR("invalid nil value for '%s'"), "tsdPosition");
  }
  if (!-[TSDTextInput textIsVerticalAtCharIndex:](-[TSDTextInputTokenizer editor](self, "editor"), "textIsVerticalAtCharIndex:", objc_msgSend(v9, "charIndex"))|| (unint64_t)(a4 - 6) > 0xFFFFFFFFFFFFFFFDLL)
  {
    goto LABEL_8;
  }
  if (a4 != 3)
  {
    if (a4 == 1)
    {
      v12 = self;
      v13 = a3;
      v14 = 3;
      v15 = a5 == 0;
      return -[TSDTextInputTokenizer p_positionFromPosition:toBoundary:inDirection:](v12, "p_positionFromPosition:toBoundary:inDirection:", v13, v14, v15);
    }
LABEL_8:
    v12 = self;
    v13 = a3;
    v14 = a4;
    v15 = a5;
    return -[TSDTextInputTokenizer p_positionFromPosition:toBoundary:inDirection:](v12, "p_positionFromPosition:toBoundary:inDirection:", v13, v14, v15);
  }
  if (a5)
    return -[TSDTextInputTokenizer p_moveToStartOfWordFromPosition:](self, "p_moveToStartOfWordFromPosition:", a3);
  else
    return -[TSDTextInputTokenizer p_moveToEndOfWordFromPosition:](self, "p_moveToEndOfWordFromPosition:", a3);
}

- (BOOL)isPosition:(id)a3 withinTextUnit:(int64_t)a4 inDirection:(int64_t)a5
{
  void *v9;
  objc_super v11;

  objc_opt_class();
  v9 = (void *)TSUDynamicCast();
  if (a4 == 1 && v9)
    return -[TSDTextInput isCharIndex:withinTextUnit:inDirection:](-[TSDTextInputResponder editor](self->_textInputResponder, "editor"), "isCharIndex:withinTextUnit:inDirection:", objc_msgSend(v9, "charIndex"), 1, a5);
  v11.receiver = self;
  v11.super_class = (Class)TSDTextInputTokenizer;
  return -[UITextInputStringTokenizer isPosition:withinTextUnit:inDirection:](&v11, sel_isPosition_withinTextUnit_inDirection_, a3, a4, a5);
}

- (id)rangeEnclosingPosition:(id)a3 withGranularity:(int64_t)a4 inDirection:(int64_t)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  if (a4 == 1 && (unint64_t)a5 <= 1)
  {
    objc_opt_class();
    v7 = (void *)TSUDynamicCast();
    if (!v7)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTextInputTokenizer rangeEnclosingPosition:withGranularity:inDirection:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2421, CFSTR("bad text position"));
    }
    v10 = -[TSDTextInput rangeOfWordEnclosingCharIndex:backward:](-[TSDTextInputTokenizer editor](self, "editor"), "rangeOfWordEnclosingCharIndex:backward:", objc_msgSend(v7, "charIndex"), a5 == 1);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return +[TSDTextRange textRangeWithRange:](TSDTextRange, "textRangeWithRange:", v10, v11);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TSDTextInputTokenizer;
    return -[UITextInputStringTokenizer rangeEnclosingPosition:withGranularity:inDirection:](&v13, sel_rangeEnclosingPosition_withGranularity_inDirection_, a3);
  }
}

@end
