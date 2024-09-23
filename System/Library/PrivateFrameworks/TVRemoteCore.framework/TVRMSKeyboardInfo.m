@implementation TVRMSKeyboardInfo

- (TVRMSKeyboardInfo)initWithItemsArray:(id)a3
{
  id v4;
  TVRMSKeyboardInfo *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *text;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TVRMSKeyboardInfo;
  v5 = -[TVRMSKeyboardInfo init](&v31, sel_init);
  if (v5)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v26 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (!v7)
      goto LABEL_38;
    v8 = v7;
    v9 = *(_QWORD *)v28;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("kKeybMsgKey_String")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
          v13 = objc_claimAutoreleasedReturnValue();
          text = v5->_text;
          v5->_text = (NSString *)v13;
LABEL_13:

          goto LABEL_14;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("kKeybMsgKey_Title")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
          v15 = objc_claimAutoreleasedReturnValue();
          text = v5->_title;
          v5->_title = (NSString *)v15;
          goto LABEL_13;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("kKeybMsgKey_SubText")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
          v16 = objc_claimAutoreleasedReturnValue();
          text = v5->_subtitle;
          v5->_subtitle = (NSString *)v16;
          goto LABEL_13;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("kKeybMsgKey_SecureText")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_secureText = objc_msgSend(v17, "BOOLValue");

          goto LABEL_14;
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("kKeybMsgKey_KeyboardType")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "integerValue");

          switch(v19)
          {
            case 7:
              v5->_keyboardType = 3;
              goto LABEL_14;
            case 4:
              v20 = 2;
              goto LABEL_30;
            case 3:
              v20 = 1;
LABEL_30:
              v5->_keyboardType = v20;
              goto LABEL_14;
          }
          v5->_keyboardType = 0;
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("kKeybMsgKey_TextInputType")))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "integerValue");

          v5->_keyboardInputType = v22 == 1;
        }
        else
        {
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("kKeybMsgKey_MinCharacters")))
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_minimumCharacters = objc_msgSend(v23, "integerValue");
          }
          else
          {
            if (!objc_msgSend(v12, "isEqualToString:", CFSTR("kKeybMsgKey_MaxCharacters")))
              goto LABEL_14;
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v5->_maximumCharacters = objc_msgSend(v23, "integerValue");
          }

        }
LABEL_14:

        ++v10;
      }
      while (v8 != v10);
      v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      v8 = v24;
      if (!v24)
      {
LABEL_38:

        v4 = v26;
        break;
      }
    }
  }

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (BOOL)secureText
{
  return self->_secureText;
}

- (void)setSecureText:(BOOL)a3
{
  self->_secureText = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)keyboardInputType
{
  return self->_keyboardInputType;
}

- (void)setKeyboardInputType:(int64_t)a3
{
  self->_keyboardInputType = a3;
}

- (int64_t)minimumCharacters
{
  return self->_minimumCharacters;
}

- (void)setMinimumCharacters:(int64_t)a3
{
  self->_minimumCharacters = a3;
}

- (int64_t)maximumCharacters
{
  return self->_maximumCharacters;
}

- (void)setMaximumCharacters:(int64_t)a3
{
  self->_maximumCharacters = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
