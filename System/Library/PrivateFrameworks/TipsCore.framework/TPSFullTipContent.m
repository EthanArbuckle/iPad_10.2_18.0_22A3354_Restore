@implementation TPSFullTipContent

- (TPSFullTipContent)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6;
  TPSFullTipContent *v7;
  void *v8;
  uint64_t v9;
  NSArray *footnoteContent;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSFullTipContent;
  v7 = -[TPSActionableContent initWithDictionary:metadata:](&v12, sel_initWithDictionary_metadata_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "TPSSafeDictionaryForKey:", CFSTR("footnote"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "TPSSafeArrayForKey:", CFSTR("content"));
    v9 = objc_claimAutoreleasedReturnValue();
    footnoteContent = v7->_footnoteContent;
    v7->_footnoteContent = (NSArray *)v9;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteContent, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSFullTipContent;
  v4 = a3;
  -[TPSActionableContent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[TPSFullTipContent footnoteContent](self, "footnoteContent", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("footnote"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSFullTipContent;
  v4 = -[TPSActionableContent copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[TPSFullTipContent footnoteContent](self, "footnoteContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFootnoteContent:", v5);

  return v4;
}

- (NSArray)footnoteContent
{
  return self->_footnoteContent;
}

- (void)setFootnoteContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (TPSFullTipContent)initWithCoder:(id)a3
{
  id v4;
  TPSFullTipContent *v5;
  void *v6;
  uint64_t v7;
  NSArray *footnoteContent;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSFullTipContent;
  v5 = -[TPSActionableContent initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    +[TPSConstellationContentUtilities contentClasses](TPSConstellationContentUtilities, "contentClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("footnote"));
    v7 = objc_claimAutoreleasedReturnValue();
    footnoteContent = v5->_footnoteContent;
    v5->_footnoteContent = (NSArray *)v7;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSFullTipContent;
  -[TPSContent description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSFullTipContent footnoteContent](self, "footnoteContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSFullTipContent footnoteContent](self, "footnoteContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("footnote"), v7);

  }
  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSFullTipContent;
  -[TPSActionableContent debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  -[TPSFullTipContent footnoteContent](self, "footnoteContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSFullTipContent footnoteContent](self, "footnoteContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("footnote"), v7);

  }
  return v5;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__TPSFullTipContent_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __32__TPSFullTipContent_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __32__TPSFullTipContent_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__TPSFullTipContent_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (TPSFullTipContentFootnoteKey_block_invoke_na_once_token_0 != -1)
    dispatch_once(&TPSFullTipContentFootnoteKey_block_invoke_na_once_token_0, block);
  return (id)TPSFullTipContentFootnoteKey_block_invoke_na_once_object_0;
}

void __32__TPSFullTipContent_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__TPSFullTipContent_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __32__TPSFullTipContent_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)TPSFullTipContentFootnoteKey_block_invoke_na_once_object_0;
  TPSFullTipContentFootnoteKey_block_invoke_na_once_object_0 = v1;

}

id __32__TPSFullTipContent_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___TPSFullTipContent;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:", &__block_literal_global_24);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __32__TPSFullTipContent_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "footnoteContent");
}

@end
