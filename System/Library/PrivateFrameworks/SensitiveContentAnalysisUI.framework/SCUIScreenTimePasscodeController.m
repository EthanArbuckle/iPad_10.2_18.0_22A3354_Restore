@implementation SCUIScreenTimePasscodeController

+ (id)_isScreenTimePasscodeSet:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(MEMORY[0x24BE85718], "settingEnabled", a3));
}

+ (void)_checkScreenTimePasscodeFromViewController:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v8 = (void *)getSTCommunicationClientClass_softClass;
  v19 = getSTCommunicationClientClass_softClass;
  if (!getSTCommunicationClientClass_softClass)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __getSTCommunicationClientClass_block_invoke;
    v15[3] = &unk_2516EC730;
    v15[4] = &v16;
    __getSTCommunicationClientClass_block_invoke((uint64_t)v15);
    v8 = (void *)v17[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v16, 8);
  v10 = objc_alloc_init(v9);
  if (v10)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __97__SCUIScreenTimePasscodeController__checkScreenTimePasscodeFromViewController_completionHandler___block_invoke;
    v12[3] = &unk_2516EC708;
    v13 = v7;
    v14 = a1;
    objc_msgSend(v10, "authenticateForCommunicationConfigurationOverrideWithCompletionHandler:", v12);
    v11 = v13;
  }
  else
  {
    objc_msgSend(a1, "screenTimeUnavailable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }

}

void __97__SCUIScreenTimePasscodeController__checkScreenTimePasscodeFromViewController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", CFSTR("STErrorDomain")) & 1) != 0)
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 51)
      {
        v9 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "cancellationError");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v11 = (void *)v10;
        (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v10);

        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  if (v12 && (objc_msgSend(v12, "authenticated") & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "wrongPasscodeError");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_11:

}

+ (NSError)wrongPasscodeError
{
  return (NSError *)sub_245CBF244((uint64_t)a1, (uint64_t)a2, &qword_257518AF0, (void **)&qword_257518AF8);
}

+ (NSError)cancellationError
{
  return (NSError *)sub_245CBF244((uint64_t)a1, (uint64_t)a2, &qword_257518B00, (void **)&qword_257518B08);
}

+ (NSError)screenTimeUnavailable
{
  return (NSError *)sub_245CBF244((uint64_t)a1, (uint64_t)a2, &qword_257518B10, (void **)qword_257518B18);
}

+ (void)askUserForScreenTimePasscodeFrom:(UIViewController *)a3 interventionType:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  UIViewController *v16;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575187E8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = a1;
  v13 = sub_245CC7020();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_257518818;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_257518828;
  v15[5] = v14;
  v16 = a3;
  sub_245CC04A8((uint64_t)v10, (uint64_t)&unk_257518838, (uint64_t)v15);
  swift_release();
}

+ (BOOL)willScreenTimePasscodeBeRequiredFor:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return sub_245CBF768(a3) & 1;
}

@end
