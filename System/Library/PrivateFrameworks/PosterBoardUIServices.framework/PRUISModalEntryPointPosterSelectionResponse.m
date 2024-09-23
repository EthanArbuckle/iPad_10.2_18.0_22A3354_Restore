@implementation PRUISModalEntryPointPosterSelectionResponse

- (PRUISModalEntryPointPosterSelectionResponse)initWithResult:(int64_t)a3 configurationUUID:(id)a4
{
  id v7;
  PRUISModalEntryPointPosterSelectionResponse *v8;
  PRUISModalEntryPointPosterSelectionResponse *v9;
  PRUISModalEntryPointPosterSelectionResponse *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRUISModalEntryPointPosterSelectionResponse;
  v8 = -[PRUISModalEntryPointResponse initWithResult:](&v12, sel_initWithResult_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configurationUUID, a4);
    v10 = v9;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResult:configurationUUID:", -[PRUISModalEntryPointResponse result](self, "result"), self->_configurationUUID);
}

- (PRUISModalEntryPointPosterSelectionResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  PRUISModalEntryPointPosterSelectionResponse *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("result"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PRUISModalEntryPointPosterSelectionResponse initWithResult:configurationUUID:](self, "initWithResult:configurationUUID:", v5, v6);
  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[PRUISModalEntryPointResponse result](self, "result"), CFSTR("result"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_configurationUUID, CFSTR("configurationUUID"));

}

- (NSUUID)configurationUUID
{
  return self->_configurationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationUUID, 0);
}

@end
