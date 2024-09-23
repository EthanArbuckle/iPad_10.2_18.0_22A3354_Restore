@implementation WFSiriDialogResponse

- (WFSiriDialogResponse)initWithDialogResponse:(id)a3
{
  id v5;
  WFSiriDialogResponse *v6;
  WFSiriDialogResponse *v7;
  WFSiriDialogResponse *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriDialogResponse;
  v6 = -[WFSiriActionResponse initWithError:](&v10, sel_initWithError_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dialogResponse, a3);
    v8 = v7;
  }

  return v7;
}

- (WFSiriDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFSiriDialogResponse *v5;
  uint64_t v6;
  WFDialogResponse *dialogResponse;
  WFSiriDialogResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriDialogResponse;
  v5 = -[WFSiriActionResponse initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dialogResponse"));
    v6 = objc_claimAutoreleasedReturnValue();
    dialogResponse = v5->_dialogResponse;
    v5->_dialogResponse = (WFDialogResponse *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFSiriDialogResponse;
  v4 = a3;
  -[WFSiriActionResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSiriDialogResponse dialogResponse](self, "dialogResponse", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dialogResponse"));

}

- (WFDialogResponse)dialogResponse
{
  return self->_dialogResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogResponse, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
