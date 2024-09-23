@implementation TUIElementImagePlain

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class(_TUIElementImagePlainBuilder, a2);
}

+ (Class)builderClass
{
  return (Class)objc_opt_class(_TUIElementImagePlainBuilder, a2);
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIPlainImageConsuming;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  TUIImageModel *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char *v37;
  double v38;
  void *v39;
  id v40;
  unint64_t v41;
  BOOL v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  v47 = a5;
  var0 = a4.var0;
  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "stringForAttribute:node:", 213, a4.var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "baseURLForNode:", a4.var0));
  objc_msgSend(v47, "sizeForAttribute:node:", 192, var0);
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "stringForAttribute:node:", 167, var0));
  v19 = +[TUIBox imageRenderingModeFromString:](TUIBox, "imageRenderingModeFromString:", v18);

  objc_msgSend(v47, "insetsForAttribute:node:", 3, var0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifierWithNode:", var0));

  if (!v12)
  {
    v33 = 0;
    v32 = 0;
    goto LABEL_19;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
  v30 = v29;
  if (v29)
  {
    if ((objc_msgSend(v29, "isFileURL") & 1) != 0
      || (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "scheme")), v31, !v31))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v12, v13));

      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v33));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByDeletingPathExtension"));

        v37 = (char *)objc_msgSend(v36, "rangeOfString:options:", CFSTR("@"), 4);
        v38 = 1.0;
        if (v37 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "substringWithRange:", v37 + 1, 1));
          v46 = v34;
          v40 = objc_msgSend(v39, "integerValue");

          v41 = (unint64_t)(double)(uint64_t)v40;
          v42 = v40 == 0;
          v34 = v46;
          if (v42)
            v41 = 1;
          v38 = (double)v41;
        }

        if (v34)
        {
          v43 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", v34, v38));
          if (v43)
          {
            v44 = (void *)v43;
            v32 = -[TUIImageModel initWithIdentifier:image:size:renderMode:alignmentRectInsets:]([TUIImageModel alloc], "initWithIdentifier:image:size:renderMode:alignmentRectInsets:", v28, v43, v19, v15, v17, v21, v23, v25, v27);

LABEL_18:
            goto LABEL_19;
          }
        }
      }
      else
      {
        v34 = 0;
      }
      v32 = 0;
      goto LABEL_18;
    }
  }
  v32 = -[TUIImageModel initWithIdentifier:urlString:baseURL:size:renderMode:alignmentRectInsets:]([TUIImageModel alloc], "initWithIdentifier:urlString:baseURL:size:renderMode:alignmentRectInsets:", v28, v12, v13, v19, v15, v17, v21, v23, v25, v27);
  v33 = v30;
LABEL_19:
  objc_msgSend(v11, "setImageModel:", v32, v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "stringForAttribute:node:", 176, var0));
  objc_msgSend(v11, "setRole:", v45);

}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "role"));

  objc_msgSend(v6, "addImageModel:forRole:", v9, v8);
}

@end
