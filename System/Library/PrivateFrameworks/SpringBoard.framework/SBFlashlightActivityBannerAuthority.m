@implementation SBFlashlightActivityBannerAuthority

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  return 0;
}

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  return 0;
}

- (int64_t)shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int64_t v13;

  v7 = a3;
  objc_msgSend(a4, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBFlashlightPreviewPresentableViewController requesterIdentifier](SBFlashlightPreviewPresentableViewController, "requesterIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requesterIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v9) & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v7, "requesterIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v9);

  if (!v12)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v8);
  v13 = 1;
LABEL_8:

  return v13;
}

@end
