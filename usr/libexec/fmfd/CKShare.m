@implementation CKShare

- (void)setFmf_otherParticipants:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKShare fmf_otherParticipants](self, "fmf_otherParticipants"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fm_filter:", &stru_100099410));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100017D9C;
  v28[3] = &unk_100099438;
  v28[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_filter:", v28));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        -[CKShare addParticipant:](self, "addParticipant:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11));
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v9);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100017DBC;
  v22[3] = &unk_100099438;
  v12 = v4;
  v23 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fm_filter:", v22));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[CKShare removeParticipant:](self, "removeParticipant:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17));
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
    }
    while (v15);
  }

}

- (NSArray)fmf_otherParticipants
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKShare participants](self, "participants"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fm_filter:", &stru_100099458));

  return (NSArray *)v3;
}

@end
