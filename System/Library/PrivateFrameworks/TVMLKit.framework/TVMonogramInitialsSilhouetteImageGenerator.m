@implementation TVMonogramInitialsSilhouetteImageGenerator

void __76___TVMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGContext *CurrentContext;
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(double *)(a1 + 48);
  if (v4 <= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFill");
    UIRectFill(*(CGRect *)(a1 + 72));
  }
  else
  {
    v5 = *(double *)(a1 + 72);
    v6 = *(double *)(a1 + 80);
    v7 = *(double *)(a1 + 88);
    v8 = *(double *)(a1 + 96);
    if (fabs(*(double *)(a1 + 56) * 0.5) == v4)
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", v5, v6, v7, v8);
    else
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addClip");
    objc_msgSend(*(id *)(a1 + 32), "set");
    objc_msgSend(v9, "fill");

  }
  objc_msgSend(*(id *)(a1 + 40), "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "firstName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_initialsForFirstName:lastName:", v14, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = objc_msgSend(v12, "length");
  v17 = *(void **)(a1 + 40);
  if (v16)
  {
    objc_msgSend(v17, "textColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.941176471, 0.941176471, 0.956862745, 1.0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v20;

    v24 = objc_alloc(MEMORY[0x24BDD1458]);
    v25 = *MEMORY[0x24BDF6600];
    v41[0] = *MEMORY[0x24BDF65F8];
    v41[1] = v25;
    v42[0] = v10;
    v42[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithString:attributes:", v12, v26);

    objc_msgSend(v27, "size");
    UIRectCenteredXInRect();
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v34 = *(double *)(a1 + 96);
    objc_msgSend(v10, "capHeight");
    v36 = (v34 - v35) * -0.5;
    v37 = *(double *)(a1 + 96);
    objc_msgSend(v10, "pointSize");
    v39 = v37 - v38 + v36;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
    objc_msgSend(v27, "drawInRect:", v29, v39, v31, v33);

    goto LABEL_17;
  }
  if (objc_msgSend(v17, "shouldFallBackToSilhouette"))
  {
    v21 = (void *)MEMORY[0x24BDF6AC8];
    +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageNamed:inBundle:", CFSTR("monogram-silhouette"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "drawInRect:blendMode:alpha:", 22, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), 1.0);
LABEL_17:

  }
}

void __135___TVMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  TVImage *v3;
  id v4;
  TVImage *v5;
  id v6;
  TVImage *v7;
  __int128 v8;
  _QWORD block[4];
  TVImage *v10;
  __int128 v11;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isCancelled") & 1) == 0)
  {
    +[_TVMonogramInitialsSilhouetteImageGenerator monogramImageWithDescription:](_TVMonogramInitialsSilhouetteImageGenerator, "monogramImageWithDescription:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = [TVImage alloc];
    v4 = objc_retainAutorelease(v2);
    v5 = -[TVImage initWithCGImageRef:preserveAlpha:](v3, "initWithCGImageRef:preserveAlpha:", objc_msgSend(v4, "CGImage"), 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __135___TVMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
    block[3] = &unk_24EB881F8;
    v8 = *(_OWORD *)(a1 + 40);
    v6 = (id)v8;
    v11 = v8;
    v10 = v5;
    v7 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __135___TVMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isCancelled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

@end
