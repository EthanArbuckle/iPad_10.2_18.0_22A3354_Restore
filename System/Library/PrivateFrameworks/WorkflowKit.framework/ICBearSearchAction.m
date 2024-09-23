@implementation ICBearSearchAction

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  objc_super v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v15, "objectForKey:", CFSTR("BearTag"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("BearTerm"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "mutableCopy");

  if (objc_msgSend(v18, "length"))
  {
    v20 = CFSTR("search");
  }
  else
  {
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("BearTag"));
    if (v17)
      objc_msgSend(v19, "setObject:forKey:", v17, CFSTR("BearName"));
    v20 = CFSTR("open-tag");
  }
  objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("BearAction"));
  v21.receiver = self;
  v21.super_class = (Class)ICBearSearchAction;
  -[ICSchemeAction performActionWithInput:parameters:userInterface:successHandler:errorHandler:](&v21, sel_performActionWithInput_parameters_userInterface_successHandler_errorHandler_, v16, v19, v14, v13, v12);

}

@end
