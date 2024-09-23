@implementation _UITextInputSessionEfficacyAccumulatorEntry

+ (id)generateAccumulatorEntryFromAction:(id)a3
{
  id v3;
  _UITextInputSessionEfficacyAccumulatorEntry *v4;
  void *v5;
  void *v6;
  _UITextInputSessionEfficacyAccumulatorEntry *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _UITextInputSessionEfficacyAccumulatorEntry *v12;
  void *v13;
  void *v14;
  _UITextInputSessionEfficacyAccumulatorEntry *v15;

  v3 = a3;
  v4 = objc_alloc_init(_UITextInputSessionEfficacyAccumulatorEntry);
  -[_UITextInputSessionEfficacyAccumulatorEntry setNetCharacters:](v4, "setNetCharacters:", 0);
  -[_UITextInputSessionEfficacyAccumulatorEntry setUserRemovedCharacters:](v4, "setUserRemovedCharacters:", 0);
  -[_UITextInputSessionEfficacyAccumulatorEntry setNetEmojiCharacters:](v4, "setNetEmojiCharacters:", 0);
  -[_UITextInputSessionEfficacyAccumulatorEntry setUserRemovedEmojiCharacters:](v4, "setUserRemovedEmojiCharacters:", 0);
  -[_UITextInputSessionEfficacyAccumulatorEntry setInputActions:](v4, "setInputActions:", objc_msgSend(v3, "inputActionCount"));
  objc_msgSend(v3, "asInsertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[_UITextInputSessionEfficacyAccumulatorEntry setNetCharacters:](v4, "setNetCharacters:", objc_msgSend(v5, "insertedTextLength") - objc_msgSend(v5, "insertedEmojiCount"));
    -[_UITextInputSessionEfficacyAccumulatorEntry setUserRemovedCharacters:](v4, "setUserRemovedCharacters:", 0);
    -[_UITextInputSessionEfficacyAccumulatorEntry setNetEmojiCharacters:](v4, "setNetEmojiCharacters:", objc_msgSend(v6, "insertedEmojiCount"));
    -[_UITextInputSessionEfficacyAccumulatorEntry setUserRemovedEmojiCharacters:](v4, "setUserRemovedEmojiCharacters:", 0);
    v7 = v4;
  }
  else
  {
    objc_msgSend(v3, "asDeletion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "removedTextLength");
      v11 = v10 - objc_msgSend(v9, "removedEmojiCount");
      -[_UITextInputSessionEfficacyAccumulatorEntry setNetCharacters:](v4, "setNetCharacters:", -v11);
      -[_UITextInputSessionEfficacyAccumulatorEntry setUserRemovedCharacters:](v4, "setUserRemovedCharacters:", v11);
      -[_UITextInputSessionEfficacyAccumulatorEntry setNetEmojiCharacters:](v4, "setNetEmojiCharacters:", -objc_msgSend(v9, "removedEmojiCount"));
      -[_UITextInputSessionEfficacyAccumulatorEntry setUserRemovedEmojiCharacters:](v4, "setUserRemovedEmojiCharacters:", objc_msgSend(v9, "removedEmojiCount"));
      v12 = v4;
    }
    else
    {
      objc_msgSend(v3, "asReplaceText");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        -[_UITextInputSessionEfficacyAccumulatorEntry setNetCharacters:](v4, "setNetCharacters:", objc_msgSend(v13, "insertedTextLength")- (objc_msgSend(v13, "insertedEmojiCount")+ objc_msgSend(v13, "removedTextLength"))+ objc_msgSend(v13, "removedEmojiCount"));
        -[_UITextInputSessionEfficacyAccumulatorEntry setUserRemovedCharacters:](v4, "setUserRemovedCharacters:", 0);
        -[_UITextInputSessionEfficacyAccumulatorEntry setNetEmojiCharacters:](v4, "setNetEmojiCharacters:", objc_msgSend(v14, "insertedEmojiCount") - objc_msgSend(v14, "removedEmojiCount"));
        -[_UITextInputSessionEfficacyAccumulatorEntry setUserRemovedEmojiCharacters:](v4, "setUserRemovedEmojiCharacters:", 0);
      }
      v15 = v4;

    }
  }

  return v4;
}

- (void)setUserRemovedEmojiCharacters:(int64_t)a3
{
  self->_userRemovedEmojiCharacters = a3;
}

- (void)setUserRemovedCharacters:(int64_t)a3
{
  self->_userRemovedCharacters = a3;
}

- (void)setNetEmojiCharacters:(int64_t)a3
{
  self->_netEmojiCharacters = a3;
}

- (void)setNetCharacters:(int64_t)a3
{
  self->_netCharacters = a3;
}

- (void)setInputActions:(int64_t)a3
{
  self->_inputActions = a3;
}

- (BOOL)isAllZeroes
{
  return !self->_netCharacters
      && !self->_userRemovedCharacters
      && !self->_netEmojiCharacters
      && !self->_userRemovedEmojiCharacters
      && self->_inputActions == 0;
}

- (void)increaseWithEntry:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  self->_netCharacters += objc_msgSend(v4, "netCharacters");
  self->_userRemovedCharacters += objc_msgSend(v4, "userRemovedCharacters");
  self->_netEmojiCharacters += objc_msgSend(v4, "netEmojiCharacters");
  self->_userRemovedEmojiCharacters += objc_msgSend(v4, "userRemovedEmojiCharacters");
  v5 = objc_msgSend(v4, "inputActions");

  self->_inputActions += v5;
}

- (int64_t)netCharacters
{
  return self->_netCharacters;
}

- (int64_t)userRemovedCharacters
{
  return self->_userRemovedCharacters;
}

- (int64_t)netEmojiCharacters
{
  return self->_netEmojiCharacters;
}

- (int64_t)userRemovedEmojiCharacters
{
  return self->_userRemovedEmojiCharacters;
}

- (int64_t)inputActions
{
  return self->_inputActions;
}

@end
