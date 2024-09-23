@implementation PKPass(PKPassUIAdditions)

- (id)icon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1A1AE621C]();
  v3 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(a1, "iconImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithPKImage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", PKPassIconImage(), 0, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_autoreleasePoolPop(v2);
  return v5;
}

- (id)mailAttachmentIcon
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x1A1AE621C]();
  objc_msgSend(a1, "rawIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKPassMailAttachmentIconImage();

  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v4, 0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  return v5;
}

- (id)cardImageWithDimensions:()PKPassUIAdditions
{
  PKPassView *v5;
  void *v6;

  v5 = -[PKPassView initWithPass:content:suppressedContent:]([PKPassView alloc], "initWithPass:content:suppressedContent:", a1, 5, 4087);
  -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v5, "snapshotOfFrontFaceWithRequestedSize:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
