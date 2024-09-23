@implementation WFSiriDialogRequest

- (WFSiriDialogRequest)initWithDialogRequest:(id)a3
{
  id v5;
  WFSiriDialogRequest *v6;
  WFSiriDialogRequest *v7;
  WFSiriDialogRequest *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriDialogRequest;
  v6 = -[WFSiriActionRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dialogRequest, a3);
    v8 = v7;
  }

  return v7;
}

- (WFSiriDialogRequest)initWithCoder:(id)a3
{
  id v4;
  WFSiriDialogRequest *v5;
  uint64_t v6;
  WFDialogRequest *dialogRequest;
  WFSiriDialogRequest *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriDialogRequest;
  v5 = -[WFSiriActionRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dialogRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    dialogRequest = v5->_dialogRequest;
    v5->_dialogRequest = (WFDialogRequest *)v6;

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
  v6.super_class = (Class)WFSiriDialogRequest;
  v4 = a3;
  -[WFSiriActionRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFSiriDialogRequest dialogRequest](self, "dialogRequest", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dialogRequest"));

}

- (WFDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogRequest, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
