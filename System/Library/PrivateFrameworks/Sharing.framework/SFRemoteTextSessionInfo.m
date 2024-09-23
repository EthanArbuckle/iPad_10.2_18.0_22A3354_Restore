@implementation SFRemoteTextSessionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRemoteTextSessionInfo)initWithCoder:(id)a3
{
  id v4;
  SFRemoteTextSessionInfo *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  SFRemoteTextSessionInfo *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFRemoteTextSessionInfo;
  v5 = -[SFRemoteTextSessionInfo init](&v16, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("keyboardType")))
      v5->_keyboardType = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("keyboardType"));

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("returnKeyType")))
      v5->_returnKeyType = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("returnKeyType"));

    v10 = v9;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v11 = v10;
    if (objc_msgSend(v11, "containsValueForKey:", CFSTR("secureTextEntry")))
      v5->_secureTextEntry = objc_msgSend(v11, "decodeBoolForKey:", CFSTR("secureTextEntry"));

    v12 = v11;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *identifier;
  int64_t keyboardType;
  NSString *prompt;
  int64_t returnKeyType;
  NSDictionary *rtiPayload;
  NSString *text;
  NSString *title;
  id v12;

  v4 = a3;
  identifier = self->_identifier;
  v12 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("identifier"));
    v4 = v12;
  }
  keyboardType = self->_keyboardType;
  if (keyboardType)
  {
    objc_msgSend(v12, "encodeInteger:forKey:", keyboardType, CFSTR("keyboardType"));
    v4 = v12;
  }
  prompt = self->_prompt;
  if (prompt)
  {
    objc_msgSend(v12, "encodeObject:forKey:", prompt, CFSTR("prompt"));
    v4 = v12;
  }
  returnKeyType = self->_returnKeyType;
  if (returnKeyType)
  {
    objc_msgSend(v12, "encodeInteger:forKey:", returnKeyType, CFSTR("returnKeyType"));
    v4 = v12;
  }
  rtiPayload = self->_rtiPayload;
  if (rtiPayload)
  {
    objc_msgSend(v12, "encodeObject:forKey:", rtiPayload, CFSTR("rtiPayload"));
    v4 = v12;
  }
  if (self->_secureTextEntry)
  {
    objc_msgSend(v12, "encodeBool:forKey:", 1, CFSTR("secureTextEntry"));
    v4 = v12;
  }
  text = self->_text;
  if (text)
  {
    objc_msgSend(v12, "encodeObject:forKey:", text, CFSTR("text"));
    v4 = v12;
  }
  title = self->_title;
  if (title)
  {
    objc_msgSend(v12, "encodeObject:forKey:", title, CFSTR("title"));
    v4 = v12;
  }

}

- (SFRemoteTextSessionInfo)initWithDictionary:(id)a3
{
  id v4;
  SFRemoteTextSessionInfo *v5;
  void *v6;
  int Int64Ranged;
  void *v8;
  int v9;
  void *v10;
  uint64_t Int64;
  void *v12;
  void *v13;
  SFRemoteTextSessionInfo *v14;
  objc_super v16;
  int v17;

  v4 = a3;
  v17 = 0;
  v16.receiver = self;
  v16.super_class = (Class)SFRemoteTextSessionInfo;
  v5 = -[SFRemoteTextSessionInfo init](&v16, sel_init);
  if (v5)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      objc_storeStrong((id *)&v5->_identifier, v6);
    Int64Ranged = CFDictionaryGetInt64Ranged();
    if (!v17)
      v5->_keyboardType = Int64Ranged;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_storeStrong((id *)&v5->_prompt, v8);
    v9 = CFDictionaryGetInt64Ranged();
    if (!v17)
      v5->_returnKeyType = v9;
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_storeStrong((id *)&v5->_rtiPayload, v10);
    Int64 = CFDictionaryGetInt64();
    if (!v17)
      v5->_secureTextEntry = Int64 != 0;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_storeStrong((id *)&v5->_text, v12);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_storeStrong((id *)&v5->_title, v13);
    v14 = v5;

  }
  return v5;
}

- (SFRemoteTextSessionInfo)initWithRTIPayload:(id)a3
{
  id v4;
  SFRemoteTextSessionInfo *v5;
  Class v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  SFRemoteTextSessionInfo *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFRemoteTextSessionInfo;
  v5 = -[SFRemoteTextSessionInfo init](&v23, sel_init);
  if (v5
    && (v6 = (Class)getRTIInputSystemDataPayloadClass_0[0](),
        objc_msgSend(v4, "data"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[objc_class payloadWithData:version:](v6, "payloadWithData:version:", v7, objc_msgSend(v4, "version")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    objc_msgSend(v8, "documentTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textInputTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "documentTraits");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textInputTraits");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "keyboardType");
      if ((unint64_t)(v13 - 1) > 0xA)
        v14 = 0;
      else
        v14 = qword_1A2AF8C28[v13 - 1];
      v5->_keyboardType = v14;

      objc_msgSend(v8, "documentTraits");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textInputTraits");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "returnKeyType");
      if ((unint64_t)(v17 - 1) >= 0xB)
        v18 = 0;
      else
        v18 = v17;
      v5->_returnKeyType = v18;

      objc_msgSend(v8, "documentTraits");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textInputTraits");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_secureTextEntry = objc_msgSend(v20, "secureTextEntry");

    }
    v21 = v5;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *identifier;
  void *v6;
  NSString *prompt;
  void *v8;
  NSDictionary *rtiPayload;
  void *v10;
  NSString *text;
  NSString *title;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", identifier, &unk_1E4890BE0);
  if (self->_keyboardType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, &unk_1E4890BF8);

  }
  prompt = self->_prompt;
  if (prompt)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", prompt, &unk_1E4890C10);
  if (self->_returnKeyType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, &unk_1E4890C28);

  }
  rtiPayload = self->_rtiPayload;
  if (rtiPayload)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", rtiPayload, &unk_1E4890C40);
  if (self->_secureTextEntry)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, &unk_1E4890C58);

  }
  text = self->_text;
  if (text)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", text, &unk_1E4890C70);
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", title, &unk_1E4890C88);
  return v4;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SFRemoteTextSessionInfo (%@)"), self->_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", kb=%ld"), self->_keyboardType);
  objc_msgSend(v3, "appendFormat:", CFSTR(", ret=%ld"), self->_returnKeyType);
  if (self->_secureTextEntry)
    objc_msgSend(v3, "appendFormat:", CFSTR(", secure"));
  if (self->_prompt)
    objc_msgSend(v3, "appendFormat:", CFSTR(", prompt='%@'"), self->_prompt);
  if (self->_rtiPayload)
    objc_msgSend(v3, "appendFormat:", CFSTR(", rtiPayload"));
  if (self->_text)
    objc_msgSend(v3, "appendFormat:", CFSTR(", text='%@'"), self->_text);
  if (self->_title)
    objc_msgSend(v3, "appendFormat:", CFSTR(", title='%@'"), self->_title);
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (NSDictionary)rtiPayload
{
  return self->_rtiPayload;
}

- (void)setRtiPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntry = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_rtiPayload, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
