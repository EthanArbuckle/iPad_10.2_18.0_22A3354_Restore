@implementation NSMutableURLRequest(ICAdditions)

- (void)ic_appendHTTPCookies:()ICAdditions
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a3;
  objc_msgSend(a1, "ic_valueForHTTPHeaderField:", CFSTR("Cookie"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__NSMutableURLRequest_ICAdditions__ic_appendHTTPCookies___block_invoke;
  v8[3] = &unk_1E4390060;
  v9 = v5;
  v6 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", v6, CFSTR("Cookie"));

}

- (void)ic_appendHTTPCookieWithName:()ICAdditions value:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11[0] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "ic_appendHTTPCookies:", v9);
}

@end
