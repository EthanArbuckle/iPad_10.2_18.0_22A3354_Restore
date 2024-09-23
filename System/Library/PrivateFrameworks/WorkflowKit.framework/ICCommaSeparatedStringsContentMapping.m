@implementation ICCommaSeparatedStringsContentMapping

- (BOOL)supportsMultipleItems
{
  return 1;
}

- (id)contentItemClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", objc_opt_class());
}

- (BOOL)skipURLEncoding
{
  return 1;
}

- (id)escapedCharacters
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[ICContentMapping definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("EscapedCharacters"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR(",");
  v5 = v3;

  return v5;
}

- (id)allowedCharacterSet
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeCharactersInString:", CFSTR("?&="));
  -[ICCommaSeparatedStringsContentMapping escapedCharacters](self, "escapedCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeCharactersInString:", v5);

  return v4;
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__ICCommaSeparatedStringsContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v9[3] = &unk_1E7AF8790;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a4, "getStringRepresentations:", v9);

}

void __86__ICCommaSeparatedStringsContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__ICCommaSeparatedStringsContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
  v8[3] = &unk_1E7AEEE10;
  v4 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "if_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v7, v5);

}

id __86__ICCommaSeparatedStringsContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
