@implementation ATXFaceGalleryConfiguration(PRSAdditions)

- (id)initWithPosterBoardRepresentation:()PRSAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&off_1EE789950;
  v5 = objc_msgSendSuper2(&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_map:", &__block_literal_global_3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSections:", v7);

    objc_msgSend(v4, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocale:", v8);

    objc_msgSend(v5, "setSource:", objc_msgSend(v4, "source") != 0);
  }

  return v5;
}

- (PRSPosterGalleryLayout)posterBoardRepresentation
{
  return -[PRSPosterGalleryLayout initWithProactiveRepresentation:]([PRSPosterGalleryLayout alloc], "initWithProactiveRepresentation:", a1);
}

@end
