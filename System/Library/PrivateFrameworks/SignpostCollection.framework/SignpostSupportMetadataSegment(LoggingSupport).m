@implementation SignpostSupportMetadataSegment(LoggingSupport)

+ (id)placeholderArrayWithOSLogEventProxy:()LoggingSupport
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  void *v35;

  v3 = a3;
  objc_msgSend(v3, "decomposedMessage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "decomposedMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "state");

    if (v6)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v3;
      objc_msgSend(v3, "decomposedMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "placeholderCount"))
      {
        v8 = 0;
        v9 = 1;
        v34 = v7;
        while (1)
        {
          objc_msgSend(v7, "literalPrefixAtIndex:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "copy");

          objc_msgSend(v7, "placeholderAtIndex:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "typeNamespace");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "copy");

          objc_msgSend(v12, "type");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "copy");

          objc_msgSend(v12, "tokens");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = objc_alloc(MEMORY[0x24BDBCE30]);
            objc_msgSend(v12, "tokens");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(v18, "initWithArray:copyItems:", v19, 1);

          }
          else
          {
            v20 = 0;
          }
          objc_msgSend(v7, "argumentAtIndex:", v8);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            objc_msgSend(v21, "objectRepresentation");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v23, "copy");

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v22, "privacy"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = 0;
            v25 = 0;
          }
          v26 = objc_msgSend(objc_alloc(MEMORY[0x24BE90688]), "initWithArgumentObject:typeNamespace:type:tokens:stringPrefix:privacy:", v24, v14, v16, v20, v11, v25);
          if (!v26)
            break;
          v27 = (void *)v26;
          objc_msgSend(v35, "addObject:", v26);

          v8 = v9;
          v7 = v34;
          if (objc_msgSend(v34, "placeholderCount") <= (unint64_t)v9++)
            goto LABEL_14;
        }

        v4 = 0;
        v3 = v33;
        v7 = v34;
        v30 = v35;
      }
      else
      {
LABEL_14:
        objc_msgSend(v7, "literalPrefixAtIndex:", objc_msgSend(v7, "placeholderCount"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v29, "copy");

        v30 = v35;
        if (v24)
        {
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE90688]), "initWithArgumentObject:typeNamespace:type:tokens:stringPrefix:privacy:", 0, 0, 0, 0, v24, 0);
          objc_msgSend(v35, "addObject:", v31);

        }
        v4 = v35;
        v3 = v33;
      }

    }
  }

  return v4;
}

@end
