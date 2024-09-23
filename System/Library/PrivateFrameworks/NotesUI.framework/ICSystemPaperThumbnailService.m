@implementation ICSystemPaperThumbnailService

+ (ICSystemPaperThumbnailService)sharedService
{
  ICSystemPaperThumbnailService *v2;
  void *v3;
  ICSystemPaperThumbnailService *v4;

  v2 = [ICSystemPaperThumbnailService alloc];
  +[ICSystemPaperThumbnailServiceInternal sharedService](ICSystemPaperThumbnailServiceInternal, "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICSystemPaperThumbnailService initWithSystemPaperThumbnailService:](v2, "initWithSystemPaperThumbnailService:", v3);

  return v4;
}

- (ICSystemPaperThumbnailService)initWithSystemPaperThumbnailService:(id)a3
{
  id v5;
  ICSystemPaperThumbnailService *v6;
  ICSystemPaperThumbnailService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSystemPaperThumbnailService;
  v6 = -[ICSystemPaperThumbnailService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_systemPaperThumbnailService, a3);

  return v7;
}

- (void)setTraitCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICSystemPaperThumbnailService systemPaperThumbnailService](self, "systemPaperThumbnailService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTraitCollection:", v4);

}

- (UITraitCollection)traitCollection
{
  void *v2;
  void *v3;

  -[ICSystemPaperThumbnailService systemPaperThumbnailService](self, "systemPaperThumbnailService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v3;
}

- (void)updateIfNeededForNote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICSystemPaperThumbnailService systemPaperThumbnailService](self, "systemPaperThumbnailService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateIfNeededForNote:completion:", v7, v6);

}

- (void)updateIfNeededWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICSystemPaperThumbnailService systemPaperThumbnailService](self, "systemPaperThumbnailService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateIfNeededWithCompletion:", v4);

}

- (void)invalidateForNote:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICSystemPaperThumbnailService systemPaperThumbnailService](self, "systemPaperThumbnailService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateForNote:", v4);

}

- (void)invalidate
{
  id v2;

  -[ICSystemPaperThumbnailService systemPaperThumbnailService](self, "systemPaperThumbnailService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)observe
{
  id v2;

  -[ICSystemPaperThumbnailService systemPaperThumbnailService](self, "systemPaperThumbnailService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "observe");

}

- (void)cancel
{
  id v2;

  -[ICSystemPaperThumbnailService systemPaperThumbnailService](self, "systemPaperThumbnailService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (ICSystemPaperThumbnailServiceInternal)systemPaperThumbnailService
{
  return self->_systemPaperThumbnailService;
}

- (void)setSystemPaperThumbnailService:(id)a3
{
  objc_storeStrong((id *)&self->_systemPaperThumbnailService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemPaperThumbnailService, 0);
}

@end
