@implementation SBChainableModifierTitledEventResponse

+ (id)responseWithTitle:(id)a3
{
  id v3;
  SBChainableModifierTitledEventResponse *v4;
  uint64_t v5;
  NSString *title;

  v3 = a3;
  v4 = objc_alloc_init(SBChainableModifierTitledEventResponse);
  v5 = objc_msgSend(v3, "copy");

  title = v4->_title;
  v4->_title = (NSString *)v5;

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBChainableModifierTitledEventResponse;
  -[SBChainableModifierEventResponse descriptionBuilderWithMultilinePrefix:](&v6, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", self->_title, CFSTR("title"));
  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
