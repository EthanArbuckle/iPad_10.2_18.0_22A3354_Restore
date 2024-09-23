@implementation _VUIMonogramResourceOrSymbolImageGenerator

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  id v25;
  id *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _VUIMonogramResourceOrSymbolImageGenerator *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42[3];
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48[2];
  id location[2];

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a7;
  v16 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v14;
  else
    v17 = 0;
  v18 = v17;
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "imageURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "vuicore_isResourceURL"))
    {
      v36 = self;
      objc_msgSend(v15, "recordForResource:withInitiator:", 3, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "willSendRequest:redirectResponse:", v22, 0);

      objc_msgSend(v20, "vuicore_resourceName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = a6 == 1;
      v25 = objc_alloc_init(MEMORY[0x1E0CB34C8]);
      objc_initWeak(location, v25);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __134___VUIMonogramResourceOrSymbolImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
      v43[3] = &unk_1E9FA1888;
      v26 = v48;
      objc_copyWeak(v48, location);
      v27 = v23;
      v44 = v27;
      v48[1] = (id)v24;
      v45 = v19;
      v28 = v21;
      v46 = v28;
      v47 = v16;
      objc_msgSend(v25, "addExecutionBlock:", v43);
      -[_VUIMonogramImageGenerator imageGeneratorQueue](v36, "imageGeneratorQueue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addOperation:", v25);

      v30 = v44;
    }
    else
    {
      if (!objc_msgSend(v20, "vuicore_isSymbolURL"))
      {
        v25 = 0;
        goto LABEL_12;
      }
      objc_msgSend(v15, "recordForResource:withInitiator:", 3, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v20);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "willSendRequest:redirectResponse:", v32, 0);

      objc_msgSend(v20, "vuicore_symbolName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x1E0CB34C8]);
      objc_initWeak(location, v25);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __134___VUIMonogramResourceOrSymbolImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
      v37[3] = &unk_1E9FA18B0;
      v26 = v42;
      objc_copyWeak(v42, location);
      v42[1] = *(id *)&width;
      v42[2] = *(id *)&height;
      v38 = v19;
      v27 = v33;
      v39 = v27;
      v28 = v31;
      v40 = v28;
      v41 = v16;
      objc_msgSend(v25, "addExecutionBlock:", v37);
      -[_VUIMonogramImageGenerator imageGeneratorQueue](self, "imageGeneratorQueue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addOperation:", v25);

      v30 = v38;
    }

    objc_destroyWeak(v26);
    objc_destroyWeak(location);

LABEL_12:
    goto LABEL_13;
  }
  v25 = 0;
LABEL_13:

  return v25;
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
