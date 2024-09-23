@implementation ICDateContentMapping

- (ICDateContentMapping)initWithDefinition:(id)a3
{
  id v4;
  ICDateContentMapping *v5;
  uint64_t v6;
  NSDateFormatter *dateFormatter;
  void *v8;
  ICDateContentMapping *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDateContentMapping;
  v5 = -[ICContentMapping initWithDefinition:](&v11, sel_initWithDefinition_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = (NSDateFormatter *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("DateFormat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v5->_dateFormatter, "setDateFormat:", v8);

    v9 = v5;
  }

  return v5;
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__ICDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E7AF0CF8;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[ICContentMapping getContentCollection:withInput:parameters:](self, "getContentCollection:withInput:parameters:", v10, a4, a5);

}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

void __69__ICDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "numberOfItems"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__ICDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v5[3] = &unk_1E7AF0798;
    v4 = *(id *)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "getObjectRepresentation:forClass:", v5, objc_opt_class());

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __69__ICDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = a4;
  v8 = a2;
  objc_msgSend(v6, "dateFormatter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v9, v7);
}

@end
