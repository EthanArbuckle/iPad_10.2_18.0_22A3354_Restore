@implementation RBSConstraintsAttribute(RBProcessState)

- (uint64_t)allowedWithAttribute:()RBProcessState error:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(a1, "constraints") & 4) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a4)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v8 = *MEMORY[0x24BE80D88];
      v11 = *MEMORY[0x24BDD0FD8];
      v12[0] = CFSTR("Constraints not met - assertion has a duration");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 4, v9);
      *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = 1;
  }

  return a4;
}

- (uint64_t)hasMandatoryAttributes:()RBProcessState error:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString **v18;
  uint64_t *v19;
  void *v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(a1, "constraints") & 3) == 0)
    goto LABEL_16;
  v22 = a4;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v7);
        v10 |= objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "preventsSuspension");
        objc_opt_class();
        v11 |= objc_opt_isKindOfClass();
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
  }

  if ((objc_msgSend(a1, "constraints") & 1) != 0 && (v10 & 1) == 0)
  {
    v14 = v22;
    if (v22)
    {
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BE80D88];
      v29 = *MEMORY[0x24BDD0FD8];
      v30 = CFSTR("Constraints not met - assertion does not prevent suspension");
      v17 = (void *)MEMORY[0x24BDBCE70];
      v18 = &v30;
      v19 = &v29;
LABEL_19:
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 4, v20);
      *(_QWORD *)v14 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (((objc_msgSend(a1, "constraints") & 2) == 0) | v11 & 1)
  {
LABEL_16:
    v14 = 1;
    goto LABEL_20;
  }
  v14 = v22;
  if (v22)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BE80D88];
    v27 = *MEMORY[0x24BDD0FD8];
    v28 = CFSTR("Constraints not met - assertion is not launching");
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = &v28;
    v19 = &v27;
    goto LABEL_19;
  }
LABEL_20:

  return v14;
}

@end
