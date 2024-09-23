@implementation TVPMediaItemPromoInfo

- (TVPMediaItemPromoInfo)initWithTitleImageURL:(id)a3 originalTitleImageWidth:(double)a4 originalTitleImageHeight:(double)a5 title:(id)a6 genre:(id)a7 ratingDisplayName:(id)a8 ratingSystem:(id)a9 movieRuntime:(id)a10 canonicalId:(id)a11 isAddedToUpNext:(BOOL)a12 addToUpNextLabelString:(id)a13 addedToUpNextLabelString:(id)a14
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  TVPMediaItemPromoInfo *v28;
  TVPMediaItemPromoInfo *v29;
  id obj;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v35 = a3;
  obj = a6;
  v23 = a6;
  v38 = a7;
  v32 = a8;
  v37 = a8;
  v33 = a9;
  v36 = a9;
  v34 = a10;
  v24 = a10;
  v25 = a11;
  v26 = a13;
  v27 = a14;
  v39.receiver = self;
  v39.super_class = (Class)TVPMediaItemPromoInfo;
  v28 = -[TVPMediaItemPromoInfo init](&v39, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_titleImageURLString, a3);
    v29->_originalTitleImageWidth = a4;
    v29->_originalTitleImageHeight = a5;
    objc_storeStrong((id *)&v29->_title, obj);
    objc_storeStrong((id *)&v29->_genre, a7);
    objc_storeStrong((id *)&v29->_ratingDisplayName, v32);
    objc_storeStrong((id *)&v29->_ratingSystem, v33);
    objc_storeStrong((id *)&v29->_movieRuntime, v34);
    objc_storeStrong((id *)&v29->_canonicalId, a11);
    v29->_isAddedToUpNext = a12;
    objc_storeStrong((id *)&v29->_addToUpNextLabelString, a13);
    objc_storeStrong((id *)&v29->_addedToUpNextLabelString, a14);
    *(_OWORD *)&v29->_promoViewWidth = xmmword_228AB2CC0;
    -[TVPMediaItemPromoInfo _loadImage](v29, "_loadImage");
  }

  return v29;
}

- (void)getTitleImageUsingCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[TVPMediaItemPromoInfo titleImage](self, "titleImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVPMediaItemPromoInfo titleImage](self, "titleImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
  else
  {
    -[TVPMediaItemPromoInfo setImageCompletionHandler:](self, "setImageCompletionHandler:", v6);
  }

}

- (void)_loadImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, int);
  void *v17;
  id v18;
  id location;

  -[TVPMediaItemPromoInfo _calculateImageSize](self, "_calculateImageSize");
  v4 = v3;
  v6 = v5;
  -[TVPMediaItemPromoInfo setExpectedImageSize:](self, "setExpectedImageSize:");
  v7 = objc_alloc(MEMORY[0x24BEB4040]);
  -[TVPMediaItemPromoInfo titleImageURLString](self, "titleImageURLString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v8, 0, CFSTR("png"), v4, v6, 0.0);

  objc_msgSend(MEMORY[0x24BEB4058], "imageURLWithDescription:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BEB4038]);
  objc_msgSend(MEMORY[0x24BEB4048], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithObject:imageLoader:groupType:", v10, v12, 0);

  if (v13)
  {
    objc_initWeak(&location, self);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __35__TVPMediaItemPromoInfo__loadImage__block_invoke;
    v17 = &unk_24F15BAB0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v13, "setCompletionHandler:", &v14);
    -[TVPMediaItemPromoInfo setImageProxy:](self, "setImageProxy:", v13, v14, v15, v16, v17);
    objc_msgSend(v13, "load");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __35__TVPMediaItemPromoInfo__loadImage__block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a2;
  objc_msgSend(v6, "uiImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && a4)
  {
    objc_msgSend(v6, "uiImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__TVPMediaItemPromoInfo__loadImage__block_invoke_2;
    v10[3] = &unk_24F15BA88;
    objc_copyWeak(&v12, (id *)(a1 + 32));
    v11 = v8;
    v9 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

    objc_destroyWeak(&v12);
  }

}

void __35__TVPMediaItemPromoInfo__loadImage__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setTitleImage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "imageCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(WeakRetained, "imageCompletionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 32));

  }
}

- (CGSize)_calculateImageSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[TVPMediaItemPromoInfo originalTitleImageWidth](self, "originalTitleImageWidth");
  v4 = v3;
  -[TVPMediaItemPromoInfo originalTitleImageHeight](self, "originalTitleImageHeight");
  v6 = v4 / v5;
  -[TVPMediaItemPromoInfo promoViewWidth](self, "promoViewWidth");
  v8 = v7 / v6;
  -[TVPMediaItemPromoInfo maxImageHeight](self, "maxImageHeight");
  if (v8 >= v9)
  {
    -[TVPMediaItemPromoInfo maxImageHeight](self, "maxImageHeight");
    v11 = v6 * v12;
    -[TVPMediaItemPromoInfo maxImageHeight](self, "maxImageHeight");
    v8 = v13;
  }
  else
  {
    -[TVPMediaItemPromoInfo promoViewWidth](self, "promoViewWidth");
    v11 = v10;
  }
  v14 = v11;
  v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSString)titleImageURLString
{
  return self->_titleImageURLString;
}

- (double)originalTitleImageWidth
{
  return self->_originalTitleImageWidth;
}

- (void)setOriginalTitleImageWidth:(double)a3
{
  self->_originalTitleImageWidth = a3;
}

- (double)originalTitleImageHeight
{
  return self->_originalTitleImageHeight;
}

- (void)setOriginalTitleImageHeight:(double)a3
{
  self->_originalTitleImageHeight = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)ratingDisplayName
{
  return self->_ratingDisplayName;
}

- (NSString)ratingSystem
{
  return self->_ratingSystem;
}

- (NSString)movieRuntime
{
  return self->_movieRuntime;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (BOOL)isAddedToUpNext
{
  return self->_isAddedToUpNext;
}

- (void)setIsAddedToUpNext:(BOOL)a3
{
  self->_isAddedToUpNext = a3;
}

- (NSString)addToUpNextLabelString
{
  return self->_addToUpNextLabelString;
}

- (NSString)addedToUpNextLabelString
{
  return self->_addedToUpNextLabelString;
}

- (CGSize)expectedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_expectedImageSize.width;
  height = self->_expectedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setExpectedImageSize:(CGSize)a3
{
  self->_expectedImageSize = a3;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (void)setImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_imageProxy, a3);
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_titleImage, a3);
}

- (double)promoViewWidth
{
  return self->_promoViewWidth;
}

- (void)setPromoViewWidth:(double)a3
{
  self->_promoViewWidth = a3;
}

- (double)maxImageHeight
{
  return self->_maxImageHeight;
}

- (void)setMaxImageHeight:(double)a3
{
  self->_maxImageHeight = a3;
}

- (id)imageCompletionHandler
{
  return self->_imageCompletionHandler;
}

- (void)setImageCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageCompletionHandler, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_addedToUpNextLabelString, 0);
  objc_storeStrong((id *)&self->_addToUpNextLabelString, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
  objc_storeStrong((id *)&self->_movieRuntime, 0);
  objc_storeStrong((id *)&self->_ratingSystem, 0);
  objc_storeStrong((id *)&self->_ratingDisplayName, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleImageURLString, 0);
}

@end
