@implementation NSIndexPath

+ (NSIndexPath)indexPathWithDebugHierarchyValue:(id)a3
{
  void *v4;
  id v5;
  _QWORD *v6;
  void *i;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(".")));
  v5 = objc_msgSend(v4, "count");
  v6 = malloc_type_malloc(8 * (_QWORD)v5, 0x100004000313F17uLL);
  if (v5)
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", i));
      v6[(_QWORD)i] = objc_msgSend(v8, "integerValue");

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "indexPathWithIndexes:length:", v6, v5));
  free(v6);

  return (NSIndexPath *)v9;
}

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
  unint64_t v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v6 = (objc_class *)objc_opt_class(self);
  if (!v6 || (v7 = v6, !object_isClass(v6)))
  {
    v10 = 0;
    goto LABEL_4;
  }
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!v9)
  {
LABEL_4:
    v11 = (objc_class *)objc_opt_class(NSIndexPath);
    v12 = NSStringFromClass(v11);
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_7;
  }
  v13 = v9;
LABEL_7:
  v14 = v13;

  v20[0] = CFSTR("propertyFormat");
  v20[1] = CFSTR("propertyRuntimeType");
  v21[0] = CFSTR("public.plain-text");
  v21[1] = v14;
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2)));
  *a3 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 0)));
  if (-[NSIndexPath length](self, "length") < 2)
  {
    v18 = v16;
  }
  else
  {
    v17 = 1;
    do
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%lu"), v16, -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v17)));

      ++v17;
      v16 = v18;
    }
    while (-[NSIndexPath length](self, "length") > v17);
  }

  return v18;
}

@end
