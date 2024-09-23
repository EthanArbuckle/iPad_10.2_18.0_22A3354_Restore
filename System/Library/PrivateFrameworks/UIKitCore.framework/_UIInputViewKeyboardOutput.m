@implementation _UIInputViewKeyboardOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  +[_UIInputViewKeyboardOutput outputWithKeyboardOutput:](_UIInputViewKeyboardOutput, "outputWithKeyboardOutput:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPositionOffset:", -[_UIInputViewKeyboardOutput positionOffset](self, "positionOffset"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  uint64_t v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[_UIInputViewKeyboardOutput deletionCount](self, "deletionCount");
    if (v6 == objc_msgSend(v5, "deletionCount"))
    {
      -[_UIInputViewKeyboardOutput insertionText](self, "insertionText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertionText");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[_UIInputViewKeyboardOutput insertionText](self, "insertionText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "insertionText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if (!v12)
          goto LABEL_5;
      }
      v14 = -[_UIInputViewKeyboardOutput positionOffset](self, "positionOffset");
      v13 = v14 == objc_msgSend(v5, "positionOffset");
      goto LABEL_9;
    }
LABEL_5:
    v13 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v13 = 0;
LABEL_10:

  return v13;
}

+ (id)outputWithKeyboardOutput:(id)a3
{
  id v3;
  _UIInputViewKeyboardOutput *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(_UIInputViewKeyboardOutput);
  -[_UIInputViewKeyboardOutput setDeletionCount:](v4, "setDeletionCount:", objc_msgSend(v3, "deletionCount"));
  objc_msgSend(v3, "insertionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "copy");
  -[_UIInputViewKeyboardOutput setInsertionText:](v4, "setInsertionText:", v6);

  return v4;
}

- (BOOL)didBeginOutput
{
  return self->_didBeginOutput;
}

- (void)setDidBeginOutput:(BOOL)a3
{
  self->_didBeginOutput = a3;
}

@end
