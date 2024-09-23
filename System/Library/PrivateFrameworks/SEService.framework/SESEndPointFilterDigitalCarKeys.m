@implementation SESEndPointFilterDigitalCarKeys

id __SESEndPointFilterDigitalCarKeys_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "endPointType") == 1)
  {
    objc_msgSend(v2, "revocationAttestation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v2, "publicKeyIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __SESEndPointFilterDigitalCarKeys_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "hexStringAsData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

@end
