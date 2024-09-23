@implementation PFVideoAdjustments(PUReviewAdditions)

+ (id)videoAdjustmentsFromAssetAdjustmentsIfRecognized:()PUReviewAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;

  v3 = a3;
  if (!v3)
    goto LABEL_5;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "adjustmentFormatIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "adjustmentFormatVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isRecognizedSlowMotionFormatWithIdentifier:version:", v5, v6);

  if ((_DWORD)v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v3;
    }
    else
    {
      objc_msgSend(v3, "propertyListDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75308]), "initWithPropertyListDictionary:", v9);

    }
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

@end
