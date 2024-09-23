@implementation NSURLRequest(print)

- (id)psso_DisplayRequest
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  objc_msgSend(a1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  v3 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(a1, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "HTTPMethod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@ %@\n"), v8, v9, CFSTR("HTTP/1.1"));
  v29 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)v25[5];
  objc_msgSend(v6, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("%@ %@\n"), CFSTR("Host:"), v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v25[5];
  v25[5] = v12;

  objc_msgSend(a1, "allHTTPHeaderFields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __42__NSURLRequest_print__psso_DisplayRequest__block_invoke;
  v23[3] = &unk_251500A00;
  v23[4] = &v24;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v23);

  v15 = (void *)v25[5];
  v16 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(a1, "HTTPBody");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithData:encoding:", v17, 4);
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("\n%@\n"), v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v25[5];
  v25[5] = v19;

  v21 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v21;
}

@end
