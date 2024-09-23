@implementation IKAppDocument(TVMLKit)

- (double)tv_adjustedWindowSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToProtocol:", &unk_2557AEF90) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(a1, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_5:
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "keyWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
    goto LABEL_6;
  }
  objc_msgSend(v3, "tv_adjustedWindowSizeForDocument:", a1);
LABEL_6:
  v5 = v4;

  return v5;
}

- (uint64_t)tv_handleEvent:()TVMLKit targetResponder:viewElement:extraInfo:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "conformsToProtocol:", &unk_2557AEF90))
  {
    objc_msgSend(a1, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = objc_msgSend(v14, "tv_handleEventForDocument:eventName:targetResponder:viewElement:extraInfo:", a1, v10, v11, v12, a6);
  else
    v15 = 0;

  return v15;
}

- (id)tv_featuresManager
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_2557AEF90))
  {
    objc_msgSend(a1, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "tv_featuresManagerForDocument:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_isPresentedModal
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tv_isPresentedModalForDocument:", a1);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)tv_interactionPreviewControllerForViewController:()TVMLKit presentingView:presentingElement:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_2557AEF90))
  {
    objc_msgSend(a1, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "tv_interactionPreviewControllerForViewController:presentingView:presentingElement:", v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
