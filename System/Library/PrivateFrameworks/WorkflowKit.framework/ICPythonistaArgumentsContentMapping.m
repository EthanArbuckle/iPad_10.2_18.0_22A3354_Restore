@implementation ICPythonistaArgumentsContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__ICPythonistaArgumentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E7AF7100;
  v11 = v8;
  v9 = v8;
  -[ICContentMapping getContentCollection:withInput:parameters:](self, "getContentCollection:withInput:parameters:", v10, a4, a5);

}

void __84__ICPythonistaArgumentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __84__ICPythonistaArgumentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v3[3] = &unk_1E7AF6C78;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(a2, "getStringRepresentations:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __84__ICPythonistaArgumentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "removeCharactersInString:", CFSTR("?&="));
    v6 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "stringByAddingPercentEncodingWithAllowedCharacters:", v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("&argv=%@"), v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
