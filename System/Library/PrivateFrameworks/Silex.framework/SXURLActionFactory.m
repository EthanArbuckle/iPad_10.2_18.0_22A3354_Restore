@implementation SXURLActionFactory

- (id)actionForURL:(id)a3
{
  return -[SXURLActionFactory actionForURL:analytics:](self, "actionForURL:analytics:", a3, 0);
}

- (id)actionForURL:(id)a3 analytics:(id)a4
{
  id v5;
  id v6;
  SXEmailAction *v7;
  SXPhoneNumberAction *v8;
  void *v9;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  SXWebCalAction *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  SXComponentBookmark *v23;
  void *v24;
  SXComponentBookmark *v25;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    v7 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "hasTelephonyScheme") & 1) == 0
    && (objc_msgSend(v5, "isFaceTimeURL") & 1) == 0
    && !objc_msgSend(v5, "isFaceTimeAudioURL"))
  {
    objc_msgSend(v5, "scheme");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("mailto"));

    if (v12)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v5, 0);
      objc_msgSend(v9, "queryValueForName:", CFSTR("to"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "queryValueForName:", CFSTR("subject"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SXEmailAction initWithRecipient:subject:]([SXEmailAction alloc], "initWithRecipient:subject:", v13, v14);

      goto LABEL_7;
    }
    objc_msgSend(v5, "scheme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("webcal"));

    if (v16)
    {
      objc_msgSend(v5, "host");
      v7 = (SXEmailAction *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_9;
      v17 = -[SXWebCalAction initWithURL:]([SXWebCalAction alloc], "initWithURL:", v5);
LABEL_23:
      v7 = (SXEmailAction *)v17;
      goto LABEL_9;
    }
    objc_msgSend(v5, "scheme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("action")) & 1) != 0)
    {
      objc_msgSend(v5, "host");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("close"));

      if (v20)
      {
        v17 = objc_alloc_init(SXCloseAction);
        goto LABEL_23;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "scheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 || (objc_msgSend(v5, "host"), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v5, "fragment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = [SXComponentBookmark alloc];
        objc_msgSend(v5, "fragment");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[SXComponentBookmark initWithComponentIdentifier:](v23, "initWithComponentIdentifier:", v24);

        v7 = -[SXBookmarkAction initWithBookmark:]([SXBookmarkAction alloc], "initWithBookmark:", v25);
        goto LABEL_9;
      }
    }
    v17 = -[SXLinkAction initWithURL:analytics:]([SXLinkAction alloc], "initWithURL:analytics:", v5, v6);
    goto LABEL_23;
  }
  objc_msgSend(v5, "host");
  v7 = (SXEmailAction *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [SXPhoneNumberAction alloc];
    objc_msgSend(v5, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SXPhoneNumberAction initWithPhoneNumber:](v8, "initWithPhoneNumber:", v9);
LABEL_7:

  }
LABEL_9:

  return v7;
}

@end
