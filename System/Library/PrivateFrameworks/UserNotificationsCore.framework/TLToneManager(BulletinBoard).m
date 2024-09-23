@implementation TLToneManager(BulletinBoard)

- (BOOL)unc_isToneEnabledForSectionInfo:()BulletinBoard
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  int v16;
  _BOOL8 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BEB8CA0];
  objc_msgSend(v4, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "unc_toneLibraryAlertTypeForSectionID:", v6);

  if (v7)
  {
    objc_msgSend(v4, "subsections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "subsectionID", (_QWORD)v19);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(a1, "unc_isToneEnabledForAlertType:topic:", v7, v14);

            if ((v15 & 1) != 0)
            {
              v16 = 1;
              goto LABEL_14;
            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v11)
            continue;
          break;
        }
      }
      v16 = 0;
LABEL_14:

    }
    else
    {
      v16 = objc_msgSend(a1, "unc_isToneEnabledForAlertType:topic:", v7, 0);
    }

    v17 = v16 != 0;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (uint64_t)unc_isToneEnabledForAlertType:()BulletinBoard topic:
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "currentToneIdentifierForAlertType:topic:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEB8DD0]) ^ 1;

  return v2;
}

- (id)unc_toneIdentifierForAlertConfiguration:()BulletinBoard
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "toneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v4, "type");
    objc_msgSend(v4, "topic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "currentToneIdentifierForAlertType:topic:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (uint64_t)unc_isToneEnabledForAlertConfiguration:()BulletinBoard
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "unc_toneIdentifierForAlertConfiguration:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEB8DD0]) ^ 1;

  return v2;
}

@end
