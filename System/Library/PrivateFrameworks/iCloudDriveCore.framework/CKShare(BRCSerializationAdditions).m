@implementation CKShare(BRCSerializationAdditions)

- (uint64_t)_brc_isOwner
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "recordID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "zoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ownerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDB8E88]);

  return v4;
}

- (uint64_t)deserializeSharingOptions:()BRCSerializationAdditions error:
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a1, "publicPermission");
  if (v5 == 3)
  {
    v6 = 8;
  }
  else if (v5 == 2)
  {
    if (objc_msgSend(a1, "_brc_isOwner"))
      v6 = 24;
    else
      v6 = 8;
  }
  else if (objc_msgSend(a1, "_brc_isOwner"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(a1, "participants", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      v6 = 64;
LABEL_10:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        if (objc_msgSend(v12, "type") != 1 && objc_msgSend(v12, "permission") > 1)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v9)
            goto LABEL_10;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:
      v6 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "currentUserParticipant");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "permission") > 1;

    v6 = (unint64_t)v14 << 6;
  }
  objc_msgSend(a1, "currentUserParticipant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "permission") == 3)
  {

    if (!a3)
      return 1;
    goto LABEL_26;
  }
  v16 = objc_msgSend(a1, "publicPermission");

  if (v16 != 3)
    v6 |= 0x20uLL;
  if (a3)
LABEL_26:
    *a3 = v6;
  return 1;
}

@end
