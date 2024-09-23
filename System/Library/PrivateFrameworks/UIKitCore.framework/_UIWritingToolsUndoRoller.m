@implementation _UIWritingToolsUndoRoller

- (_UIWritingToolsUndoRoller)initWithEvaluatedText:(id)a3 offset:(unint64_t)a4
{
  id v7;
  _UIWritingToolsUndoRoller *v8;
  _UIWritingToolsUndoRoller *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIWritingToolsUndoRoller;
  v8 = -[_UIWritingToolsUndoRoller init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_evaluatedText, a3);
    v9->_offset = a4;
  }

  return v9;
}

- (void)replaceRange:(_NSRange)a3 withText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  NSMutableAttributedString *v8;
  NSMutableAttributedString *rolledReplacement;
  unint64_t offset;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  if (!self->_hasFouled)
  {
    if (!self->_rolledReplacement)
    {
      v13 = v7;
      v8 = (NSMutableAttributedString *)-[NSAttributedString mutableCopy](self->_evaluatedText, "mutableCopy");
      rolledReplacement = self->_rolledReplacement;
      self->_rolledReplacement = v8;

      v7 = v13;
    }
    offset = self->_offset;
    if (location >= offset
      && (v11 = location + length - offset,
          v14 = v7,
          v12 = -[NSMutableAttributedString length](self->_rolledReplacement, "length"),
          v7 = v14,
          v11 <= v12))
    {
      if (!self->_hasFouled)
      {
        -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self->_rolledReplacement, "replaceCharactersInRange:withAttributedString:", location - self->_offset, length, v14);
        v7 = v14;
      }
    }
    else
    {
      self->_hasFouled = 1;
    }
  }

}

- (NSAttributedString)rolledReplacement
{
  NSMutableAttributedString *rolledReplacement;

  if (self->_hasFouled)
    return (NSAttributedString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
  rolledReplacement = self->_rolledReplacement;
  if (!rolledReplacement)
    return (NSAttributedString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
  else
    return (NSAttributedString *)(id)-[NSMutableAttributedString copy](rolledReplacement, "copy");
}

- (NSAttributedString)evaluatedText
{
  return self->_evaluatedText;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (BOOL)hasFouled
{
  return self->_hasFouled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluatedText, 0);
  objc_storeStrong((id *)&self->_rolledReplacement, 0);
}

@end
