@implementation PXSharedAlbumNavigationAttributes

+ (id)attributesForURLComponents:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id *v17;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v20 = a3;
  objc_msgSend(v20, "queryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v21 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("invitationalbumuuid")))
        {
          objc_msgSend(v10, "value");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v7;
          v7 = (void *)v12;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("revealassetuuid")))
        {
          objc_msgSend(v10, "value");
          v14 = objc_claimAutoreleasedReturnValue();
          v13 = v6;
          v6 = (void *)v14;
        }
        else
        {
          if (!objc_msgSend(v11, "isEqualToString:", CFSTR("commentguid")))
            goto LABEL_13;
          objc_msgSend(v10, "value");
          v15 = objc_claimAutoreleasedReturnValue();
          v13 = v21;
          v21 = (void *)v15;
        }

LABEL_13:
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (!v5)
        goto LABEL_17;
    }
  }
  v6 = 0;
  v21 = 0;
  v7 = 0;
LABEL_17:

  if (v7 || v6 || v21)
  {
    v16 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v16 + 1, v7);
    objc_storeStrong(v16 + 2, v6);
    objc_storeStrong(v16 + 3, v21);
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  return v17;
}

- (NSString)invitationAlbumUUID
{
  return self->_invitationAlbumUUID;
}

- (NSString)revealAssetUUID
{
  return self->_revealAssetUUID;
}

- (NSString)commentGUID
{
  return self->_commentGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentGUID, 0);
  objc_storeStrong((id *)&self->_revealAssetUUID, 0);
  objc_storeStrong((id *)&self->_invitationAlbumUUID, 0);
}

@end
