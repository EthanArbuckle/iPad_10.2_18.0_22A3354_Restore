@implementation GEORPFeedbackResponse

- (void)enumerateFeedbackInfosUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];

  v4 = (void (**)(id, _QWORD, char *))a3;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPFeedbackResponse feedbackResult](self, "feedbackResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "queryResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "feedbackInfos"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), &v17);
      if (v17)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

@end
