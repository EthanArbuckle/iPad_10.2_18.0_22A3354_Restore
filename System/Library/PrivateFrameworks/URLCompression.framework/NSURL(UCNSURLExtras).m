@implementation NSURL(UCNSURLExtras)

- (id)transformPayloadWithBlock:()UCNSURLExtras
{
  uint64_t (**v4)(id, id);
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, id))a3;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v6 = (id)objc_msgSend(v5, "queryItems");
  if (objc_msgSend(v6, "count"))
  {
    v7 = (id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (id)objc_msgSend(v7, "name");
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("p"));

    v10 = 0;
    if (v9)
    {
      v11 = (id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v12 = (id)objc_msgSend(v11, "value");

      v13 = (id)v4[2](v4, v12);
      v14 = (void *)MEMORY[0x24BDD1838];
      v15 = (id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v16 = (id)objc_msgSend(v15, "name");
      v17 = (id)objc_msgSend(v14, "queryItemWithName:value:", v16, v13);

      v20[0] = v17;
      v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
      objc_msgSend(v5, "setQueryItems:", v18);

      v10 = (id)objc_msgSend(v5, "URL");
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)truncatePayloadToV2Length
{
  return objc_msgSend(a1, "transformPayloadWithBlock:", &__block_literal_global);
}

- (uint64_t)padPayloadToV1Length
{
  return objc_msgSend(a1, "transformPayloadWithBlock:", &__block_literal_global_4);
}

@end
