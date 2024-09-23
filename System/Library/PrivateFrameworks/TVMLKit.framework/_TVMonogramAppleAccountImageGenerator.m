@implementation _TVMonogramAppleAccountImageGenerator

+ (BOOL)isAppleAccountsURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("x-apple-identity-image"));

  return v4;
}

- (id)loadImageForURL:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  uint64_t *v28;
  double v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = a7;
  v15 = a8;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  v35 = 0;
  if (objc_msgSend((id)objc_opt_class(), "isAppleAccountsURL:", v13))
  {
    v16 = (void *)MEMORY[0x24BDD1478];
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __126___TVMonogramAppleAccountImageGenerator_loadImageForURL_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v25 = &unk_24EB88180;
    v28 = &v30;
    v29 = fmin(width, height);
    v26 = v13;
    v27 = v15;
    objc_msgSend(v16, "blockOperationWithBlock:", &v22);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v31[5];
    v31[5] = v17;

    -[_TVMonogramImageGenerator imageGeneratorQueue](self, "imageGeneratorQueue", v22, v23, v24, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addOperation:", v31[5]);

  }
  v20 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v20;
}

- (void)cancelLoad:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "cancel");

}

@end
