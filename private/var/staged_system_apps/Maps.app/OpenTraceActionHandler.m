@implementation OpenTraceActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = objc_opt_class(OpenTraceAction);
  if ((objc_opt_isKindOfClass(v12, v6) & 1) != 0)
  {
    v7 = v12;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filePath"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chrome"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filePath"));
      objc_msgSend(v9, "debugController:choseTraceAtPath:startNav:", 0, v10, objc_msgSend(v7, "startNav"));
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Alert"), CFSTR("Unable to migrate trace file!"), 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0));
      objc_msgSend(v9, "addAction:", v11);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chrome"));
      objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, 0);
    }

  }
}

@end
