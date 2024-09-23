@implementation WFProcessedContacts

void __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke(uint64_t a1, void (**a2)(_QWORD))
{
  void *v3;
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = a2;
    objc_msgSend(v3, "allowContactsAccessWithCompletionHandler:");
  }
  else
  {
    v4 = a2;
    v5 = (void (**)(_QWORD))objc_opt_new();
    a2[2](v4);

  }
}

void __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD *);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void (*v17)(uint64_t, _QWORD *);
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "type"))
  {
    if (objc_msgSend(v6, "type") == 1)
    {
      objc_msgSend(v6, "phoneNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_3;
      v22[3] = &unk_1E7AEFC10;
      v23 = v8;
      v24 = v7;
      v10 = *(void (**)(uint64_t, _QWORD *))(v9 + 16);
      v11 = v8;
      v10(v9, v22);

      v12 = v24;
LABEL_8:

      goto LABEL_9;
    }
    if (objc_msgSend(v6, "type") == 2)
    {
      objc_msgSend(v6, "emailAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_4;
      v19[3] = &unk_1E7AEFC10;
      v20 = v15;
      v21 = v7;
      v17 = *(void (**)(uint64_t, _QWORD *))(v16 + 16);
      v11 = v15;
      v17(v16, v19);

      v12 = v21;
      goto LABEL_8;
    }
    if (objc_msgSend(v6, "type") != 3)
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
      goto LABEL_9;
    }
    objc_msgSend(v6, "customHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA60]), "initWithValue:type:", 0, 0);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v14, 0, v13, 0, 0, 0);
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v18, 0);

  }
  else
  {
    objc_msgSend(v6, "contact");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "INPersonRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v14, 0);
  }

LABEL_9:
}

uint64_t __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v13
      && (objc_msgSend(v13, "firstContactWithPhoneNumber:", *(_QWORD *)(a1 + 32)),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = v6;
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "INPersonRepresentation");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0CBDA60]);
      objc_msgSend(*(id *)(a1 + 32), "normalizedPhoneNumber");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v10, "initWithValue:type:", v11, 2);

      v8 = *(_QWORD *)(a1 + 40);
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v7, 0, 0, 0, 0, 0);
    }
    v12 = (void *)v9;
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, v9, 0);

  }
}

void __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v13
      && (objc_msgSend(v13, "firstContactWithEmailAddress:", *(_QWORD *)(a1 + 32)),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = v6;
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "INPersonRepresentation");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0CBDA60]);
      objc_msgSend(*(id *)(a1 + 32), "address");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v10, "initWithValue:type:", v11, 1);

      v8 = *(_QWORD *)(a1 + 40);
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA58]), "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:", v7, 0, 0, 0, 0, 0);
    }
    v12 = (void *)v9;
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, v9, 0);

  }
}

@end
