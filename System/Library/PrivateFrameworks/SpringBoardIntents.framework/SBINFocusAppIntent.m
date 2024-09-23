@implementation SBINFocusAppIntent

- (SBINFocusAppIntent)initWithModeIdentifier:(id)a3 systemContext:(id)a4
{
  id v7;
  SBINFocusAppIntent *v8;
  SBINFocusAppIntent *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBINFocusAppIntent;
  v8 = -[SBINAppIntent initWithIdentifier:systemContext:](&v11, sel_initWithIdentifier_systemContext_, CFSTR("Focus"), a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_modeIdentifier, a3);

  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBINFocusAppIntent *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__SBINFocusAppIntent_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_25190EC20;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

uint64_t __51__SBINFocusAppIntent_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_super v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)SBINFocusAppIntent;
  objc_msgSendSuper2(&v4, sel_appendDescriptionToFormatter_, v2);
  return objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("modeIdentifier"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBINFocusAppIntent;
  if (-[SBINAppIntent isEqual:](&v9, sel_isEqual_, v4)
    && (objc_opt_self(),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    v7 = BSEqualStrings();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBINFocusAppIntent;
  v3 = -[SBINAppIntent hash](&v5, sel_hash);
  return -[NSString hash](self->_modeIdentifier, "hash") ^ v3;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

@end
