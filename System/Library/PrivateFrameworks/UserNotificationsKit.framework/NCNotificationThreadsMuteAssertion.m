@implementation NCNotificationThreadsMuteAssertion

+ (id)threadsMuteAssertionWithMutedThreadIDs:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[NCNotificationThreadsMuteAssertion _initWithMutedThreadIDs:]([NCNotificationThreadsMuteAssertion alloc], "_initWithMutedThreadIDs:", v3);

  return v4;
}

- (id)_initWithMutedThreadIDs:(id)a3
{
  id v5;
  NCNotificationThreadsMuteAssertion *v6;
  NCNotificationThreadsMuteAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationThreadsMuteAssertion;
  v6 = -[NCNotificationThreadsMuteAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mutedThreadIDs, a3);

  return v7;
}

- (unint64_t)activeMuteAssertionLevelForThreadIdentifier:(id)a3
{
  if (a3)
    return -[NSSet containsObject:](self->_mutedThreadIDs, "containsObject:");
  else
    return 0;
}

- (unint64_t)hash
{
  NSSet *mutedThreadIDs;
  unint64_t v3;
  _QWORD v5[6];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 31;
  mutedThreadIDs = self->_mutedThreadIDs;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__NCNotificationThreadsMuteAssertion_hash__block_invoke;
  v5[3] = &unk_24D270198;
  v5[4] = &v7;
  v5[5] = v6;
  -[NSSet enumerateObjectsUsingBlock:](mutedThreadIDs, "enumerateObjectsUsingBlock:", v5);
  v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __42__NCNotificationThreadsMuteAssertion_hash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result + v4 * v3;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)-[NCNotificationThreadsMuteAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void **v5;
  void **v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (v5 = (void **)v4) != 0)
  {
    v6 = v5;
    v7 = NCIsEqualToSet(self->_mutedThreadIDs, v5[1]);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[NCNotificationThreadsMuteAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  NCNotificationThreadsMuteAssertion *v12;

  v4 = (void *)MEMORY[0x24BE0BE08];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__NCNotificationThreadsMuteAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_24D270158;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __76__NCNotificationThreadsMuteAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("mutedThreadIDs"));
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[NCNotificationThreadsMuteAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutedThreadIDs, 0);
}

@end
