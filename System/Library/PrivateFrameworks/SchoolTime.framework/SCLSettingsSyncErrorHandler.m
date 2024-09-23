@implementation SCLSettingsSyncErrorHandler

- (id)behaviorForError:(id)a3 history:(id)a4
{
  id v6;
  unint64_t v7;
  SCLSettingsSyncErrorBehavior *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t *v18;
  uint64_t v19;
  SCLSettingsSyncErrorBehavior *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[SCLSettingsSyncErrorHandler recoveryTypeForError:](self, "recoveryTypeForError:", a3);
  if (v7 == 2)
  {
    v8 = [SCLSettingsSyncErrorBehavior alloc];
    v9 = 2;
    v10 = 0;
  }
  else
  {
    v11 = v7;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v12);
          v15 += objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "isEqual:", &unk_24E2A6C48, (_QWORD)v22);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);

      if (v15 > 6)
        v18 = (uint64_t *)MEMORY[0x24BDAC600];
      else
        v18 = (uint64_t *)qword_24E29B488[v15];
    }
    else
    {

      v18 = (uint64_t *)MEMORY[0x24BDAC610];
    }
    v19 = *v18;
    v8 = [SCLSettingsSyncErrorBehavior alloc];
    v9 = v11;
    v10 = v19;
  }
  v20 = -[SCLSettingsSyncErrorBehavior initWithRecoveryType:retryInterval:](v8, "initWithRecoveryType:retryInterval:", v9, v10, (_QWORD)v22);

  return v20;
}

- (unint64_t)recoveryTypeForError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("com.apple.schooltime"));

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");

    if (((v6 - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0)
      return 1;
    else
      return 2;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "isEqual:", *MEMORY[0x24BE4F9D0]);
    return 1;
  }
}

@end
