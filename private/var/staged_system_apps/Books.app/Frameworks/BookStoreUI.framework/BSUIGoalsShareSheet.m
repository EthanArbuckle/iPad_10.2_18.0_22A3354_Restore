@implementation BSUIGoalsShareSheet

+ (void)presentShareSheetFromViewController:(id)a3 sourceView:(id)a4 sourceBarButtonItem:(id)a5 image:(id)a6 kind:(unint64_t)a7 year:(unint64_t)a8 title:(id)a9 sharingUrls:(id)a10 completion:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _BSUIGoalsSharableTextProvider *v23;
  _BSUIGoalsSharableImageProvider *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void **v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  _QWORD v46[2];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a6;
  v23 = -[_BSUIGoalsSharableTextProvider initWithSharableImage:kind:year:title:sharingUrls:]([_BSUIGoalsSharableTextProvider alloc], "initWithSharableImage:kind:year:title:sharingUrls:", v22, a7, a8, v21, v20);

  v24 = -[_BSUIGoalsSharableImageProvider initWithSharableImage:]([_BSUIGoalsSharableImageProvider alloc], "initWithSharableImage:", v22);
  v25 = objc_alloc((Class)UIActivityViewController);
  v46[0] = v23;
  v46[1] = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2));
  v27 = objc_msgSend(v25, "initWithActivityItems:applicationActivities:", v26, 0);

  if ((objc_opt_respondsToSelector(v27, "popoverPresentationController", v28) & 1) != 0)
  {
    if (v17)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "popoverPresentationController"));
      objc_msgSend(v29, "setSourceView:", v17);
    }
    else
    {
      if (!v18)
        goto LABEL_7;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "popoverPresentationController"));
      objc_msgSend(v29, "setBarButtonItem:", v18);
    }

  }
LABEL_7:
  v45[0] = UIActivityTypeAssignToContact;
  v45[1] = UIActivityTypeAddToReadingList;
  v45[2] = UIActivityTypeOpenInIBooks;
  v45[3] = UIActivityTypeMarkupAsPDF;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 4));
  objc_msgSend(v27, "setExcludedActivityTypes:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "window"));

  if ((objc_msgSend(v32, "isKeyWindow") & 1) == 0)
    objc_msgSend(v32, "makeKeyWindow");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tintColor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  objc_msgSend(v32, "setTintColor:", v34);

  v38 = _NSConcreteStackBlock;
  v39 = 3221225472;
  v40 = sub_9EA8;
  v41 = &unk_2E4140;
  v42 = v32;
  v43 = v33;
  v44 = v19;
  v35 = v19;
  v36 = v33;
  v37 = v32;
  objc_msgSend(v27, "setCompletionWithItemsHandler:", &v38);
  objc_msgSend(v16, "presentViewController:animated:completion:", v27, 1, 0, v38, v39, v40, v41);

}

@end
