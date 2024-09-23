@implementation TUIStruct

- (TUIStruct)initWithValue:(const void *)a3 basedOn:(id)a4
{
  id v7;
  TUIStruct *v8;
  TUIStruct *v9;
  Struct *p_value;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIStruct;
  v8 = -[TUIStruct init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    p_value = &v8->_value;
    if (&v9->_value != a3)
      sub_26314(p_value, (uint64_t *)a3);
    objc_storeStrong((id *)&v9->_basedOn, a4);
  }

  return v9;
}

- (const)value
{
  return &self->_value;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int8 v6;
  id v7;
  TUIStruct *basedOn;
  TUIStruct *v9;
  TUIStruct *v10;
  void *v11;

  v4 = a3;
  v5 = objc_opt_class(v4);
  if (v5 == objc_opt_class(TUIStruct))
  {
    v7 = v4;
    if (TUI::Evaluation::Variables::Capture::operator==((uint64_t)self->_value._capture.__ptr_, *(_QWORD *)objc_msgSend(v7, "value")))
    {
      basedOn = self->_basedOn;
      v9 = (TUIStruct *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "basedOn"));
      if (basedOn == v9)
      {
        v6 = 1;
      }
      else
      {
        v10 = self->_basedOn;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "basedOn"));
        v6 = -[TUIStruct isEqual:](v10, "isEqual:", v11);

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (TUIStruct)basedOn
{
  return self->_basedOn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basedOn, 0);
  sub_148E8((uint64_t)&self->_value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
