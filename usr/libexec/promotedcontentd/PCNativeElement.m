@implementation PCNativeElement

- (id)initWithElement:(id)a3 elementIndex:(unint64_t)a4 error:(id *)a5
{
  id v8;
  PCNativeElement *v9;
  PCNativeElement *v10;
  unsigned int v11;
  unint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;

  v8 = a3;
  v9 = -[PCNativeElement init](self, "init");
  v10 = v9;
  if (!v8 || !v9)
    goto LABEL_8;
  v11 = objc_msgSend(v8, "hasElementID");
  v12 = a4;
  if (v11)
    v12 = (int)objc_msgSend(v8, "elementID", a4);
  -[PCNativeElement setElementID:](v10, "setElementID:", v12);
  if ((uint64_t)-[PCNativeElement elementID](v10, "elementID") <= 255
    && ((unint64_t)-[PCNativeElement elementID](v10, "elementID") & 0x8000000000000000) == 0)
  {
    v13 = objc_alloc((Class)PCNativeAsset);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asset"));
    v15 = objc_msgSend(v13, "initWithAsset:", v14);
    -[PCNativeElement setAsset:](v10, "setAsset:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "caption"));
    -[PCNativeElement setCaption:](v10, "setCaption:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessCaption"));
    -[PCNativeElement setAccessibleCaption:](v10, "setAccessibleCaption:", v17);

    v18 = objc_alloc((Class)PCNativeButton);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ctaButton"));
    v20 = objc_msgSend(v18, "initWithButton:", v19);
    -[PCNativeElement setButton:](v10, "setButton:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionURL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v21));
    -[PCNativeElement setActionURL:](v10, "setActionURL:", v22);

    v23 = objc_alloc((Class)PCNativeStyle);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "style"));
    v25 = objc_msgSend(v23, "initWithStyle:", v24);
    -[PCNativeElement setStyle:](v10, "setStyle:", v25);

LABEL_8:
    a5 = v10;
    goto LABEL_13;
  }
  if (a5)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Element %ld ID out of range: %ld"), a4, -[PCNativeElement elementID](v10, "elementID")));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4511, v26));

    v27 = APLogForCategory(21);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_msgSend(*a5, "code");
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a5, "localizedDescription"));
      *(_DWORD *)buf = 134218242;
      v33 = v29;
      v34 = 2114;
      v35 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error %ld: %{public}@", buf, 0x16u);

    }
    a5 = 0;
  }
LABEL_13:

  return a5;
}

@end
