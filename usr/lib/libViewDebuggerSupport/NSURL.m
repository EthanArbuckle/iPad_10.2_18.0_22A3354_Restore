@implementation NSURL

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  objc_class *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v6 = (objc_class *)objc_opt_class(self);
  if (v6 && (v7 = v6, object_isClass(v6)))
  {
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v9)
    {
      v13 = v9;
      goto LABEL_7;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = (objc_class *)objc_opt_class(NSURL);
  v12 = NSStringFromClass(v11);
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);
LABEL_7:
  v14 = v13;

  v18[0] = CFSTR("propertyFormat");
  v18[1] = CFSTR("propertyRuntimeType");
  v19[0] = CFSTR("public.plain-text");
  v19[1] = v14;
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2)));
  *a3 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self, "absoluteString"));

  return v16;
}

@end
