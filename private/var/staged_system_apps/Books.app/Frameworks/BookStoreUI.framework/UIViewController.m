@implementation UIViewController

- (void)presentFeedsInCards:(id)a3 focusedIndexValue:(id)a4 titleValue:(id)a5 animatedValue:(id)a6 optionsValue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  UIViewController *v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v12, "isArray"))
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "toArray"));
  else
    v17 = 0;
  if (objc_msgSend(v13, "isNumber"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "toNumber"));
    v19 = (unint64_t)objc_msgSend(v18, "unsignedIntegerValue");

  }
  else
  {
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (objc_msgSend(v15, "isBoolean"))
    v20 = objc_msgSend(v15, "toBool");
  else
    v20 = &dword_0 + 1;
  if (objc_msgSend(v16, "isObject"))
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "toDictionary"));
  else
    v21 = 0;
  if ((unint64_t)objc_msgSend(v17, "count") > v19)
  {
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = sub_212F0;
    v23[4] = sub_21300;
    v24 = self;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_21308;
    v22[3] = &unk_2E4B70;
    v22[4] = v23;
    -[UIViewController _presentFeedsInCards:focusedIndex:animated:options:completion:](v24, "_presentFeedsInCards:focusedIndex:animated:options:completion:", v17, v19, v20, v21, v22);
    _Block_object_dispose(v23, 8);

  }
}

- (void)presentFeedsInCards:(id)a3 focusedIndexValue:(id)a4 animatedValue:(id)a5 optionsValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  UIViewController *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "isArray"))
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "toArray"));
  else
    v14 = 0;
  if (objc_msgSend(v11, "isNumber"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toNumber"));
    v16 = (unint64_t)objc_msgSend(v15, "unsignedIntegerValue");

  }
  else
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (objc_msgSend(v12, "isBoolean"))
    v17 = objc_msgSend(v12, "toBool");
  else
    v17 = &dword_0 + 1;
  if (objc_msgSend(v13, "isObject"))
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "toDictionary"));
  else
    v18 = 0;
  if ((unint64_t)objc_msgSend(v14, "count") > v16)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_212F0;
    v20[4] = sub_21300;
    v21 = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_214F0;
    v19[3] = &unk_2E4B70;
    v19[4] = v20;
    -[UIViewController _presentFeedsInCards:focusedIndex:animated:options:completion:](v21, "_presentFeedsInCards:focusedIndex:animated:options:completion:", v14, v16, v17, v18, v19);
    _Block_object_dispose(v20, 8);

  }
}

- (void)_presentFeedsInCards:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  void (**v24)(_QWORD);
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31[2];
  BOOL v32;
  id location;
  _QWORD v34[4];
  id v35;
  id v36;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[JSAMetricsController shared](JSAMetricsController, "shared"));
  v16 = objc_msgSend(v15, "newSuspensionAssertion");

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_2173C;
  v34[3] = &unk_2E4B98;
  v17 = v16;
  v35 = v17;
  v18 = v14;
  v36 = v18;
  v19 = objc_retainBlock(v34);
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_21784;
  v27[3] = &unk_2E4BC0;
  objc_copyWeak(v31, &location);
  v27[4] = self;
  v20 = v12;
  v28 = v20;
  v21 = v13;
  v29 = v21;
  v31[1] = (id)a4;
  v32 = a5;
  v22 = v19;
  v30 = v22;
  v23 = objc_retainBlock(v27);
  v24 = objc_retainBlock(v23);
  if (v24)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v24[2](v24);
    }
    else
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_21828;
      v25[3] = &unk_2E3F88;
      v26 = v24;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v25);

    }
  }

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

}

- (void)appendFeedsInCards:(id)a3 optionsValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  UIViewController *v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isArray"))
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toArray"));
  else
    v8 = 0;
  if (objc_msgSend(v7, "isObject"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toDictionary"));
  else
    v9 = 0;
  if (objc_msgSend(v8, "count"))
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_212F0;
    v11[4] = sub_21300;
    v12 = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_2197C;
    v10[3] = &unk_2E4B70;
    v10[4] = v11;
    -[UIViewController _appendFeedsInCards:completion:options:](v12, "_appendFeedsInCards:completion:options:", v8, v10, v9);
    _Block_object_dispose(v11, 8);

  }
}

- (void)appendFeedsInCards:(id)a3 options:(id)a4
{
  -[UIViewController _appendFeedsInCards:completion:options:](self, "_appendFeedsInCards:completion:options:", a3, 0, a4);
}

- (void)_appendFeedsInCards:(id)a3 completion:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void (**v15)(_QWORD);
  _QWORD v16[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_21B3C;
  v18[3] = &unk_2E4BE8;
  objc_copyWeak(&v22, &location);
  v11 = v10;
  v19 = v11;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v14 = objc_retainBlock(v18);
  v15 = objc_retainBlock(v14);
  if (v15)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v15[2](v15);
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_21BFC;
      v16[3] = &unk_2E3F88;
      v17 = v15;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);

    }
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (BOOL)bsui_prefersExtraCompactNavBarMargin
{
  id AssociatedObject;
  void *v4;
  unsigned __int8 v5;

  AssociatedObject = objc_getAssociatedObject(self, off_31D790);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v4 = &__kCFBooleanFalse;
    objc_setAssociatedObject(self, off_31D790, &__kCFBooleanFalse, (char *)&dword_0 + 1);
  }
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)bsui_setPrefersExtraCompactNavBarMargin:(BOOL)a3
{
  const void *v4;
  id v5;

  v4 = off_31D790;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, v4, v5, (char *)&dword_0 + 1);

}

- (BSUIJetActionHandling)jetActionHandlerInContext
{
  UIViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)UIViewController.jetActionHandlerInContext.getter();

  return (BSUIJetActionHandling *)v3;
}

@end
