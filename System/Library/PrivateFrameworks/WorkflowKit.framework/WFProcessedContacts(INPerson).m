@implementation WFProcessedContacts(INPerson)

- (void)getRecipientsWithPermissionRequestor:()INPerson completionHandler:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD aBlock[4];
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "entries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "if_firstObjectWithIntValue:forKey:", 4, CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "messageGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v7 + 2))(v7, 0, v10, 0);

  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke;
    aBlock[3] = &unk_1E7AEFBE8;
    v20 = v6;
    v12 = _Block_copy(aBlock);
    objc_msgSend(a1, "entries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_2;
    v17[3] = &unk_1E7AEFC38;
    v18 = v12;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __88__WFProcessedContacts_INPerson__getRecipientsWithPermissionRequestor_completionHandler___block_invoke_5;
    v15[3] = &unk_1E7AF6C78;
    v16 = v7;
    v14 = v12;
    objc_msgSend(v13, "if_mapAsynchronously:completionHandler:", v17, v15);

  }
}

@end
