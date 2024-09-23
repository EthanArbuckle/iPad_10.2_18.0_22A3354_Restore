@implementation ICEpochDateContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__ICEpochDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E7AF7100;
  v11 = v8;
  v9 = v8;
  -[ICContentMapping getContentCollection:withInput:parameters:](self, "getContentCollection:withInput:parameters:", v10, a4, a5);

}

void __74__ICEpochDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  if (objc_msgSend(v3, "numberOfItems"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __74__ICEpochDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v4[3] = &unk_1E7AEDDA0;
    v5 = *(id *)(a1 + 32);
    objc_msgSend(v3, "getObjectRepresentation:forClass:", v4, objc_opt_class());

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __74__ICEpochDateContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(a2, "timeIntervalSince1970");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%.0f"), v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v9, v7);

}

@end
