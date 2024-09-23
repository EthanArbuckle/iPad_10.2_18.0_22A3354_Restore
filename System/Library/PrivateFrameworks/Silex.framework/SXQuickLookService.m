@implementation SXQuickLookService

- (SXQuickLookService)init
{
  SXQuickLookService *v2;
  QLThumbnailGenerator *v3;
  QLThumbnailGenerator *generator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXQuickLookService;
  v2 = -[SXQuickLookService init](&v6, sel_init);
  if (v2)
  {
    v3 = (QLThumbnailGenerator *)objc_alloc_init(MEMORY[0x24BDE5EF8]);
    generator = v2->_generator;
    v2->_generator = v3;

  }
  return v2;
}

- (void)fetchThumbnailForFile:(id)a3 size:(CGSize)a4 onCompletion:(id)a5 onError:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  height = a4.height;
  width = a4.width;
  v11 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x24BDE5EF0];
  v14 = a3;
  v15 = [v13 alloc];
  objc_msgSend(v14, "fileURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = (void *)objc_msgSend(v15, "initWithFileAtURL:size:scale:representationTypes:", v16, -1, width, height, v18);

  -[SXQuickLookService generator](self, "generator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __70__SXQuickLookService_fetchThumbnailForFile_size_onCompletion_onError___block_invoke;
  v23[3] = &unk_24D68D2C8;
  v24 = v11;
  v25 = v12;
  v21 = v12;
  v22 = v11;
  objc_msgSend(v20, "generateBestRepresentationForRequest:completionHandler:", v19, v23);

}

void __70__SXQuickLookService_fetchThumbnailForFile_size_onCompletion_onError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(a2, "UIImage");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (QLThumbnailGenerator)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
}

@end
