@implementation LWCR

- (LWCR)init
{
  LWCR *v2;
  LWCR *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LWCR;
  v2 = -[LWCR init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = 0;

    *((_QWORD *)v3 + 2) = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (*((_QWORD *)self + 2))
    CEReleaseManagedContext();
  v3.receiver = self;
  v3.super_class = (Class)LWCR;
  -[LWCR dealloc](&v3, sel_dealloc);
}

- (int64_t)version
{
  return *((_QWORD *)self + 4);
}

- (int64_t)constraintCategory
{
  return *((_QWORD *)self + 6);
}

- (BOOL)hasRequirements
{
  return der_vm_context_is_valid();
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)(id)objc_msgSend(*((id *)self + 3), "copy");
}

- (id)externalRepresentation
{
  return *((id *)self + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 112) = 0;
  *((_BYTE *)self + 89) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

+ (id)withData:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  _QWORD *v8;
  LWCR *v9;
  LWCR *v10;
  CEQueryContext *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  CEQueryContext *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = 0;
  v22 = 1;
  v7 = CEManagedContextFromCFDataWithOptions();
  v8 = (_QWORD *)MEMORY[0x24BED3CF0];
  if (v7 == *MEMORY[0x24BED3CF0])
  {
    v10 = objc_alloc_init(LWCR);
    objc_storeStrong((id *)v10 + 1, a3);
    v11 = v23;
    *((_QWORD *)v10 + 2) = v23;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    TLE::LWCR::loadFromCE((TLE::LWCR *)((char *)v10 + 32), v11, (uint64_t)&v19);
    if ((_DWORD)v19)
    {
      if (a4)
      {
        v12 = (void *)MEMORY[0x24BDD1540];
        v24[0] = *MEMORY[0x24BDD1398];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v13;
        v24[1] = *MEMORY[0x24BDD0BA0];
        v14 = objc_alloc(MEMORY[0x24BDD17C8]);
        v15 = (void *)objc_msgSend(v14, "initWithBytes:length:encoding:", v20, v21, 4);
        v25[1] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("LWCRError"), 1, v16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (CEQueryContextToCFDictionary() == *v8)
      {
        v18 = (void *)*((_QWORD *)v10 + 3);
        *((_QWORD *)v10 + 3) = 0;

        v9 = v10;
        goto LABEL_8;
      }
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("LWCRError"), 2, 0);
        v9 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    v9 = 0;
LABEL_8:

    goto LABEL_10;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("LWCRError"), 2, 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_10:

  return v9;
}

+ (id)withVersion:(int64_t)a3 withConstraintCategory:(int64_t)a4 withRequirements:(id)a5 withError:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = (void *)MEMORY[0x24BDBCED8];
  v19[0] = CFSTR("vers");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v19[1] = CFSTR("comp");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3 == 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  v19[2] = CFSTR("ccat");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("reqs"));
  if (CESerializeCFDictionaryWithOptions() == *MEMORY[0x24BED3CF0])
  {
    objc_msgSend(a1, "withData:withError:", 0, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("LWCRError"), 2, 0);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
