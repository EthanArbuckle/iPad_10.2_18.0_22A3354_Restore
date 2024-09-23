@implementation _DASActivityDependency

+ (id)dependencyFromDescriptor:(id)a3 withUID:(unsigned int)a4
{
  id v5;
  const char *string;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  id v11;

  v5 = a3;
  string = xpc_dictionary_get_string(v5, "DependencyIdentifier");
  if (string)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
    if (!v7)
      goto LABEL_6;
    v8 = xpc_dictionary_get_string(v5, "DependencyType");
    if (!v8)
      goto LABEL_6;
    v9 = v8;
    if (!strncmp(v8, "DependencyTypeResult", 0x14uLL))
    {
      v11 = objc_msgSend(objc_alloc((Class)a1), "initResultDependencyWithIdentifier:batchSize:", v7, xpc_dictionary_get_int64(v5, "ResultDependencyBatchSize"));
    }
    else
    {
      if (strncmp(v9, "DependencyTypeCompletion", 0x18uLL))
      {
LABEL_6:
        v10 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v11 = objc_msgSend(objc_alloc((Class)a1), "initActivityCompletionDependencyWithIdentifier:", v7);
    }
    v10 = v11;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

@end
