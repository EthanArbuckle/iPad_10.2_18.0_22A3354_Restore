@implementation SSRDESRecordWriter

+ (void)createDESRecordWithSuperVector:(id)a3 withMetaInfo:(id)a4
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  __int128 *p_buf;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t v21[4];
  const char *v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x24BE284B8];
  v8 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]";
    _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s SAT Supervector created", (uint8_t *)&buf, 0xCu);
  }
  if (v5)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__1474;
    v26 = __Block_byref_object_dispose__1475;
    v27 = (id)objc_msgSend(v5, "copy");
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__1474;
    v19 = __Block_byref_object_dispose__1475;
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE2D158]), "initWithBundleIdentifier:", CFSTR("com.apple.fides.phs"));
    if (objc_msgSend((id)v16[5], "isPermitted")
      && (objc_msgSend((id)v16[5], "shouldMakeRecordWithFrequency:", 100) & 1) != 0)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __66__SSRDESRecordWriter_createDESRecordWithSuperVector_withMetaInfo___block_invoke;
      v11[3] = &unk_24CC84BB0;
      v12 = v6;
      v13 = &v15;
      p_buf = &buf;
      v9 = (void *)MEMORY[0x212BE197C](v11);
      +[SSRDESRecordWriter fetchMedicalDataWithCompletion:](SSRDESRecordWriter, "fetchMedicalDataWithCompletion:", v9);

    }
    else
    {
      v10 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315138;
        v22 = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]";
        _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Skipping PHS DES record creation", v21, 0xCu);
      }
    }
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&buf, 8);
  }

}

+ (void)fetchMedicalDataWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3CF0]), "initWithHealthStore:", v4);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SSRDESRecordWriter_fetchMedicalDataWithCompletion___block_invoke;
  v7[3] = &unk_24CC84BD8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "fetchMedicalIDDataWithCompletion:", v7);

}

void __53__SSRDESRecordWriter_fetchMedicalDataWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "gregorianBirthday");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 && v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:", 28, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "components:fromDateComponents:toDateComponents:options:", 4, v7, v12, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v15, "year"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(" "));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: received nil dob: %@ / name: %@"), v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "+[SSRDESRecordWriter fetchMedicalDataWithCompletion:]_block_invoke";
        v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
      }
      v20 = (void *)MEMORY[0x24BDD1540];
      v22 = CFSTR("reason");
      v23 = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 114, v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

void __66__SSRDESRecordWriter_createDESRecordWithSuperVector_withMetaInfo___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[3];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]_block_invoke";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s ERR: failed to create PHS DES recored with error: %@", buf, 0x16u);
    }
  }
  else
  {
    v12[0] = CFSTR("Age");
    v12[1] = CFSTR("Name");
    v13[0] = v7;
    v13[1] = v8;
    v12[2] = CFSTR("MetaInfo");
    v13[2] = a1[4];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "saveRecordWithData:recordInfo:completion:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), v11, &__block_literal_global_1484);

  }
}

void __66__SSRDESRecordWriter_createDESRecordWithSuperVector_withMetaInfo___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = *MEMORY[0x24BE284B8];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]_block_invoke";
      v11 = 2114;
      v12 = v5;
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s Failed to create PHS DES record: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "+[SSRDESRecordWriter createDESRecordWithSuperVector:withMetaInfo:]_block_invoke";
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Created PHS DES record with identifier: %{public}@", (uint8_t *)&v9, 0x16u);

  }
}

@end
