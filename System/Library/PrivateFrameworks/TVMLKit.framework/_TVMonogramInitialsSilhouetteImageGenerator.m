@implementation _TVMonogramInitialsSilhouetteImageGenerator

+ (BOOL)_isRomanName:(id)a3
{
  if (a3)
    return CNStringContainsNonLatinCharacters() ^ 1;
  else
    return 1;
}

+ (id)_initialsForFirstName:(id)a3 lastName:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (!(v5 | v6)
    || !objc_msgSend((id)objc_opt_class(), "_isRomanName:", v5)
    || !objc_msgSend((id)objc_opt_class(), "_isRomanName:", v6))
  {
    goto LABEL_16;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = objc_msgSend((id)v5, "length");
  if (v8)
  {
    objc_msgSend((id)v5, "substringWithRange:", 0, 1);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_24EB8B108;
  }
  v10 = objc_msgSend((id)v6, "length");
  if (v10)
  {
    objc_msgSend((id)v6, "substringWithRange:", 0, 1);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_24EB8B108;
  }
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)

  if (v8)
  if (!objc_msgSend(v12, "length"))
  {

LABEL_16:
    v12 = 0;
  }
  objc_msgSend(v12, "uppercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)monogramImageWithDescription:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  id v30;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "cornerRadius");
  v10 = v9;
  objc_msgSend(v4, "fillColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  +[TVGraphicsImageRenderer preferredFormat](TVGraphicsImageRenderer, "preferredFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPreferredRange:", 2);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __76___TVMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke;
  v20[3] = &unk_24EB881D0;
  v23 = v10;
  v24 = v6;
  v25 = v8;
  v26 = 0;
  v27 = 0;
  v28 = v6;
  v29 = v8;
  v21 = v14;
  v22 = v4;
  v30 = a1;
  v16 = v4;
  v17 = v14;
  +[TVGraphicsImageRenderer imageWithSize:format:actions:](TVGraphicsImageRenderer, "imageWithSize:format:actions:", v15, v20, v6, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)imageKeyForObject:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  char **__ptr32 *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  char **__ptr32 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (objc_msgSend(v5, "preferedMonogramType") == 2)
  {
    objc_msgSend(v5, "firstName");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastName");
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontName");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v36 = (void *)v10;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v13;

    v40 = 0.0;
    v38 = 0.0;
    v39 = 0.0;
    v37 = 0;
    objc_msgSend(v18, "getRed:green:blue:alpha:", &v40, &v39, &v38, &v37);
    v19 = (void *)MEMORY[0x24BDD17C8];
    if (objc_msgSend(v8, "length"))
      v20 = v8;
    else
      v20 = (void *)v6;
    v21 = (void *)v6;
    v22 = (__CFString *)v7;
    if (objc_msgSend(v8, "length"))
      v7 = &stru_24EB8B108;
    objc_msgSend(v9, "pointSize");
    v24 = v23;
    objc_msgSend(v5, "cornerRadius");
    v25 = &off_222E76000;
    LODWORD(v25) = vcvtad_u64_f64(v40 * 255.0);
    LODWORD(v26) = vcvtad_u64_f64(v39 * 255.0);
    LODWORD(v27) = vcvtad_u64_f64(v38 * 255.0);
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@_%@_%@_%.0f_%.0f_%02X%02X%02X%.1f"), v20, v7, v36, v24, v28, v25, v26, v27, v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
    goto LABEL_25;
  }
  if (objc_msgSend(v5, "preferedMonogramType") == 1 || !objc_msgSend(v5, "preferedMonogramType"))
  {
    objc_msgSend(v5, "fillColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v17;

    v40 = 0.0;
    v38 = 0.0;
    v39 = 0.0;
    v37 = 0;
    objc_msgSend(v21, "getRed:green:blue:alpha:", &v40, &v39, &v38, &v37);
    v29 = (void *)MEMORY[0x24BDD17C8];
    if (objc_msgSend(v5, "shouldFallBackToSilhouette"))
      v30 = CFSTR("yes-man");
    else
      v30 = CFSTR("no-man");
    objc_msgSend(v5, "cornerRadius");
    v31 = &off_222E76000;
    LODWORD(v31) = vcvtad_u64_f64(v40 * 255.0);
    LODWORD(v32) = vcvtad_u64_f64(v39 * 255.0);
    LODWORD(v33) = vcvtad_u64_f64(v38 * 255.0);
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Silhouette_%@_%.0f_%02X%02X%02X%.1f"), v30, v34, v31, v32, v33, v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v14 = 0;
LABEL_25:

  return v14;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v11 = a3;
  v12 = a7;
  v13 = a8;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__8;
  v33 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v11;
  else
    v14 = 0;
  v15 = v14;
  v16 = v15;
  if (v15)
  {
    v17 = (void *)MEMORY[0x24BDD1478];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __135___TVMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v24[3] = &unk_24EB88220;
    v27 = &v28;
    v25 = v15;
    v26 = v13;
    objc_msgSend(v17, "blockOperationWithBlock:", v24);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v29[5];
    v29[5] = v18;

    -[_TVMonogramImageGenerator imageGeneratorQueue](self, "imageGeneratorQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addOperation:", v29[5]);

    v21 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVMLKitErrorDomain"), 11, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, 0, 0, v21);
  }

  v22 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v22;
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
