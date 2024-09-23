@implementation SBExpanseBannerAuthority

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  return 0;
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  _BOOL4 v23;
  int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  int v28;
  int v29;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "requesterIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.ConversationKit"));
  if (!v8)
  {
    v23 = 1;
LABEL_9:
    v24 = v8 ^ 1;

    goto LABEL_13;
  }
  objc_msgSend(v5, "requestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.conversationController"));

  if (v10)
  {
    objc_msgSend(v5, "requestIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple.conversationController.HUD"));

    if (v12)
    {
      objc_msgSend(v5, "viewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;
      v17 = v16;
      objc_msgSend(v5, "viewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "parentViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v23 = v17 == v22 && v15 == v21;

      goto LABEL_9;
    }
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  v23 = 1;
LABEL_13:
  objc_msgSend(v6, "requesterIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.ConversationKit"));
  if (v26)
  {
    objc_msgSend(v6, "requestIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "hasPrefix:", CFSTR("com.apple.conversationController"));

    if (!v28)
    {
      v29 = 0;
      v26 = 0;
      goto LABEL_19;
    }
    objc_msgSend(v6, "requestIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v25, "hasPrefix:", CFSTR("com.apple.conversationController.HUD"));
  }
  else
  {
    v29 = 0;
  }

LABEL_19:
  return (uint64_t)((unint64_t)(v24 & v29 | ~(v23 | v26)) << 63) >> 63;
}

@end
