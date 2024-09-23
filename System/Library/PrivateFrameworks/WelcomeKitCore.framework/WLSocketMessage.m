@implementation WLSocketMessage

- (WLSocketMessage)initWithType:(unint64_t)a3
{
  WLSocketMessage *v4;
  WLSocketMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLSocketMessage;
  v4 = -[WLSocketMessage init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[WLSocketMessage setType:](v4, "setType:", a3);
  return v5;
}

+ (id)messageWithData:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  WLSocketVersionMessage *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  WLSocketCommandMessage *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void **v25;
  uint64_t *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0x24BDBC000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
      *a4 = 0;
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    v13 = objc_retainAutorelease(v5);
    v14 = (void *)objc_msgSend(v12, "initWithBytesNoCopy:length:encoding:freeWhenDone:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 4, 0);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "length"))
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected legacy command but got wrong format"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD1540];
        v19 = *MEMORY[0x24BEC2878];
        v50 = *MEMORY[0x24BDD0FC8];
        v51 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 1, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_50;
    }
    v16 = -[WLSocketCommandMessage initWithCommandString:]([WLSocketCommandMessage alloc], "initWithCommandString:", v8);
    goto LABEL_51;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!a4 || *a4)
      goto LABEL_50;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected number type for the key 'type' but got wrong type instead"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BEC2878];
    v64 = *MEMORY[0x24BDD0FC8];
    v65[0] = v21;
    v24 = (void *)MEMORY[0x24BDBCE70];
    v25 = (void **)v65;
    v26 = &v64;
    goto LABEL_49;
  }
  v9 = objc_msgSend(v8, "unsignedLongLongValue");
  if (v9 == 2)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = -[WLSocketVersionMessage initWithVersion:]([WLSocketVersionMessage alloc], "initWithVersion:", objc_msgSend(v10, "unsignedLongLongValue"));
        goto LABEL_23;
      }
      if (a4 && !*a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected string type for the key 'version' but got wrong type instead"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x24BDD1540];
        v45 = *MEMORY[0x24BEC2878];
        v56 = *MEMORY[0x24BDD0FC8];
        v57 = v43;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, 1, v46);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v7 = 0x24BDBC000uLL;
      }
    }
    else if (a4 && !*a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected string type for the key 'version' but got wrong nil instead"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BEC2878];
      v58 = *MEMORY[0x24BDD0FC8];
      v59 = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 1, v38);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v7 = 0x24BDBC000;
    }
  }
  else
  {
    if (v9 != 1)
    {
      if (a4 && !*a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected a valid value for the key 'type' but got unsupported value instead"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x24BDD1540];
        v29 = *MEMORY[0x24BEC2878];
        v54 = *MEMORY[0x24BDD0FC8];
        v55 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 1, v30);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      _WLLog();
      goto LABEL_45;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("command"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = -[WLSocketCommandMessage initWithCommandString:]([WLSocketCommandMessage alloc], "initWithCommandString:", v10);
LABEL_23:
        v16 = (WLSocketCommandMessage *)v11;
        goto LABEL_44;
      }
      if (a4 && !*a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected string type for the key 'command' but got wrong type instead"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x24BDD1540];
        v41 = *MEMORY[0x24BEC2878];
        v60 = *MEMORY[0x24BDD0FC8];
        v61 = v39;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 1, v42);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        v7 = 0x24BDBC000;
      }
    }
    else if (a4 && !*a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected string type for the key 'command' but got wrong nil instead"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BEC2878];
      v62 = *MEMORY[0x24BDD0FC8];
      v63 = v31;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 1, v34);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v7 = 0x24BDBC000;
    }
  }
  _WLLog();
  v16 = 0;
LABEL_44:

  if (!v16)
  {
LABEL_45:
    if (!a4 || *a4)
      goto LABEL_50;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("expected a message but got nil instead"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD1540];
    v47 = v7;
    v23 = *MEMORY[0x24BEC2878];
    v52 = *MEMORY[0x24BDD0FC8];
    v53 = v21;
    v24 = *(void **)(v47 + 3696);
    v25 = &v53;
    v26 = &v52;
LABEL_49:
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 1, v48);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_50:
    _WLLog();
    v16 = 0;
  }
LABEL_51:

  return v16;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
