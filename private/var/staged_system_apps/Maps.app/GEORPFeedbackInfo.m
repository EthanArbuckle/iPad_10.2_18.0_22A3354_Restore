@implementation GEORPFeedbackInfo

- (void)enumerateValidComponentOfType:(int)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];

  v6 = (void (**)(id, void *, _BYTE *))a4;
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackInfo feedbackComponents](self, "feedbackComponents", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
      if (objc_msgSend(v12, "type") == a3 && !objc_msgSend(v12, "status"))
      {
        if (objc_msgSend(v12, "valuesCount"))
        {
          v6[2](v6, v12, &v17);
          if (v17)
            break;
        }
      }
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateValidComponentValuesOfType:(int)a3 usingBlock:(id)a4
{
  uint64_t v4;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = *(_QWORD *)&a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10047F634;
  v7[3] = &unk_1011B7F38;
  v8 = a4;
  v6 = v8;
  -[GEORPFeedbackInfo enumerateValidComponentOfType:usingBlock:](self, "enumerateValidComponentOfType:usingBlock:", v4, v7);

}

@end
