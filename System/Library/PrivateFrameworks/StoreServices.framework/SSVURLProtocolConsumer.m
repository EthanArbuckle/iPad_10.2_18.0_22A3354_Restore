@implementation SSVURLProtocolConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = 0;
    goto LABEL_13;
  }
  objc_msgSend(a4, "MIMEType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = v8 != 0;
  if (v8 && objc_msgSend(v8, "rangeOfString:options:", CFSTR("application/json"), 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_6;
  }
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (!v10)
  {
LABEL_6:
    if (!v12)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;

      v11 = v13;
    }
  }
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v11);
  v14 = v12;

LABEL_13:
  return v14;
}

@end
