@implementation RBSAppNapGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "targetIsSystem"))
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v7 = *MEMORY[0x24BE80D88];
      v8 = *MEMORY[0x24BDD0FD8];
      v21[0] = CFSTR("Attribute is not applicable to system target");
      v9 = *MEMORY[0x24BE80D80];
      v20[0] = v8;
      v20[1] = v9;
      objc_msgSend(a1, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v10;
      v11 = (void *)MEMORY[0x24BDBCE70];
      v12 = v21;
      v13 = v20;
LABEL_6:
      objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 2, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a4)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BE80D88];
    v14 = *MEMORY[0x24BDD0FD8];
    v19[0] = CFSTR("AppNap attributes not supported on non-macOS platforms");
    v15 = *MEMORY[0x24BE80D80];
    v18[0] = v14;
    v18[1] = v15;
    objc_msgSend(a1, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = v19;
    v13 = v18;
    goto LABEL_6;
  }
  return 0;
}

@end
