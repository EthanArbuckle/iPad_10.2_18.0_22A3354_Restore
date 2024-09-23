@implementation PRUISExternallyHostedPosterEntryPointWrapper

- (id)_initWithEntryPoint:(id)a3 requestUUID:(id)a4
{
  id v6;
  id v7;
  PRUISExternallyHostedPosterEntryPointWrapper *v8;
  uint64_t v9;
  PRUISModalEntryPoint *entryPoint;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRUISExternallyHostedPosterEntryPointWrapper;
  v8 = -[PRUISExternallyHostedPosterEntryPointWrapper init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    entryPoint = v8->_entryPoint;
    v8->_entryPoint = (PRUISModalEntryPoint *)v9;

    objc_storeStrong((id *)&v8->_requestUUID, a4);
  }

  return v8;
}

+ (id)wrapperWithEntryPoint:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "_initWithEntryPoint:requestUUID:", v4, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  PRUISModalEntryPoint *entryPoint;
  uint64_t v8;
  id v9;
  id v10;
  NSUUID *requestUUID;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  entryPoint = self->_entryPoint;
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __56__PRUISExternallyHostedPosterEntryPointWrapper_isEqual___block_invoke;
  v20[3] = &unk_251534B78;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", entryPoint, v20);
  requestUUID = self->_requestUUID;
  v15 = v8;
  v16 = 3221225472;
  v17 = __56__PRUISExternallyHostedPosterEntryPointWrapper_isEqual___block_invoke_2;
  v18 = &unk_251534BA0;
  v19 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", requestUUID, &v15);
  LOBYTE(requestUUID) = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);

  return (char)requestUUID;
}

uint64_t __56__PRUISExternallyHostedPosterEntryPointWrapper_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "entryPoint");
}

uint64_t __56__PRUISExternallyHostedPosterEntryPointWrapper_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestUUID");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_entryPoint);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_requestUUID);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (NSString)description
{
  return (NSString *)-[PRUISExternallyHostedPosterEntryPointWrapper descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[PRUISModalEntryPoint copyWithZone:](self->_entryPoint, "copyWithZone:", a3);
  v7 = (void *)-[NSUUID copyWithZone:](self->_requestUUID, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "_initWithEntryPoint:requestUUID:", v6, v7);

  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISExternallyHostedPosterEntryPointWrapper)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PRUISExternallyHostedPosterEntryPointWrapper *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("typeString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRUISExternallyHostedPosterEntryPointWrapper _entryPointClassForTypeString:]((uint64_t)self, v5);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("entryPoint"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("requestUUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self = (PRUISExternallyHostedPosterEntryPointWrapper *)-[PRUISExternallyHostedPosterEntryPointWrapper _initWithEntryPoint:requestUUID:](self, "_initWithEntryPoint:requestUUID:", v7, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_entryPointClassForTypeString:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[7];
  _QWORD v7[8];

  v7[7] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v6[0] = CFSTR("FocusPosterSelection");
  v2 = a2;
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("PosterSelection");
  v7[1] = objc_opt_class();
  v6[2] = CFSTR("Gallery");
  v7[2] = objc_opt_class();
  v6[3] = CFSTR("Editing");
  v7[3] = objc_opt_class();
  v6[4] = CFSTR("HomeScreenSwitcher");
  v7[4] = objc_opt_class();
  v6[5] = CFSTR("EditHomeScreen");
  v7[5] = objc_opt_class();
  v6[6] = CFSTR("AmbientEditingSwitcher");
  v7[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  PRUISModalEntryPoint *entryPoint;
  id v5;
  id v6;

  entryPoint = self->_entryPoint;
  v5 = a3;
  -[PRUISExternallyHostedPosterEntryPointWrapper _entryPointTypeStringForEntryPoint:](self, entryPoint);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("typeString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entryPoint, CFSTR("entryPoint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestUUID, CFSTR("requestUUID"));

}

- (id)_entryPointTypeStringForEntryPoint:(void *)a1
{
  id v3;
  void *v5;

  v3 = a2;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__entryPointTypeStringForEntryPoint_, a1, CFSTR("PRUISExternallyHostedPosterEntryPointWrapper.m"), 104, CFSTR("%@ should implement -_BSXPCSecureCodingEntryPointTypeString!"), v3);

    }
    objc_msgSend(v3, "_BSXPCSecureCodingEntryPointTypeString");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PRUISExternallyHostedPosterEntryPointWrapper succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PRUISExternallyHostedPosterEntryPointWrapper descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PRUISExternallyHostedPosterEntryPointWrapper *v12;

  v4 = a3;
  -[PRUISExternallyHostedPosterEntryPointWrapper succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", v4);

  objc_msgSend(v5, "activeMultilinePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__PRUISExternallyHostedPosterEntryPointWrapper_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_251534BE0;
  v7 = v5;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v6, v10);

  v8 = v7;
  return v8;
}

id __86__PRUISExternallyHostedPosterEntryPointWrapper_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("entryPoint"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("requestUUID"));
}

- (PRUISModalEntryPoint)entryPoint
{
  return self->_entryPoint;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end
