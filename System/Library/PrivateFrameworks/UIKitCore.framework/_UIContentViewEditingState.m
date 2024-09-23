@implementation _UIContentViewEditingState

- (_UIContentViewEditingState)initWithText:(id)a3
{
  return -[_UIContentViewEditingState initWithText:proposedReplacementText:proposedReplacementRange:](self, "initWithText:proposedReplacementText:proposedReplacementRange:", a3, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (_UIContentViewEditingState)initWithText:(id)a3 proposedReplacementText:(id)a4 proposedReplacementRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  _UIContentViewEditingState *v12;
  uint64_t v13;
  NSString *text;
  uint64_t v15;
  NSString *proposedReplacementText;
  void *v18;
  objc_super v19;

  length = a5.length;
  location = a5.location;
  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentViewEditingConfiguration.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("text"));

  }
  v19.receiver = self;
  v19.super_class = (Class)_UIContentViewEditingState;
  v12 = -[_UIContentViewEditingState init](&v19, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    proposedReplacementText = v12->_proposedReplacementText;
    v12->_proposedReplacementText = (NSString *)v15;

    v12->_proposedReplacementRange.location = location;
    v12->_proposedReplacementRange.length = length;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSString copy](self->_text, "copy");
    v6 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v5;

    *(_NSRange *)(v4 + 24) = self->_proposedReplacementRange;
    v7 = -[NSString copy](self->_proposedReplacementText, "copy");
    v8 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v7;

  }
  return (id)v4;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)proposedReplacementText
{
  return self->_proposedReplacementText;
}

- (_NSRange)proposedReplacementRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_proposedReplacementRange.length;
  location = self->_proposedReplacementRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedReplacementText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
