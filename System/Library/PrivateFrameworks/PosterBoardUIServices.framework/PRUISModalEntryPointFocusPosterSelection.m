@implementation PRUISModalEntryPointFocusPosterSelection

- (PRUISModalEntryPointFocusPosterSelection)initWithActivityUUID:(id)a3 activityIdentifier:(id)a4
{
  id v7;
  id v8;
  PRUISModalEntryPointFocusPosterSelection *v9;
  PRUISModalEntryPointFocusPosterSelection *v10;
  uint64_t v11;
  NSString *activityIdentifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PRUISModalEntryPointFocusPosterSelection;
  v9 = -[PRUISModalEntryPointFocusPosterSelection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityUUID, a3);
    v11 = objc_msgSend(v8, "copy");
    activityIdentifier = v10->_activityIdentifier;
    v10->_activityIdentifier = (NSString *)v11;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSUUID *activityUUID;
  uint64_t v8;
  id v9;
  id v10;
  NSString *activityIdentifier;
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
  activityUUID = self->_activityUUID;
  v8 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __52__PRUISModalEntryPointFocusPosterSelection_isEqual___block_invoke;
  v20[3] = &unk_251534BA0;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", activityUUID, v20);
  activityIdentifier = self->_activityIdentifier;
  v15 = v8;
  v16 = 3221225472;
  v17 = __52__PRUISModalEntryPointFocusPosterSelection_isEqual___block_invoke_2;
  v18 = &unk_251535C28;
  v19 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", activityIdentifier, &v15);
  LOBYTE(activityIdentifier) = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);

  return (char)activityIdentifier;
}

uint64_t __52__PRUISModalEntryPointFocusPosterSelection_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityUUID");
}

uint64_t __52__PRUISModalEntryPointFocusPosterSelection_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityIdentifier");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_activityUUID);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_activityIdentifier);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithActivityUUID:activityIdentifier:", self->_activityUUID, self->_activityIdentifier);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRUISModalEntryPointFocusPosterSelection)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PRUISModalEntryPointFocusPosterSelection *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("activityIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[PRUISModalEntryPointFocusPosterSelection initWithActivityUUID:activityIdentifier:](self, "initWithActivityUUID:activityIdentifier:", v5, v6);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSUUID *activityUUID;
  id v5;

  activityUUID = self->_activityUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activityUUID, CFSTR("activityUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activityIdentifier, CFSTR("activityIdentifier"));

}

- (id)_BSXPCSecureCodingEntryPointTypeString
{
  return CFSTR("FocusPosterSelection");
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
}

@end
