@implementation NSData(VTAddition)

- (id)MD5HashString
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 md[16];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  CC_MD5((const void *)objc_msgSend(v1, "bytes"), objc_msgSend(v1, "length"), md);
  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[3]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v7);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v8);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v9);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[7]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v10);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v11);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[9]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v12);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[10]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v13);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[11]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v14);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[12]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v15);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[13]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v16);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[14]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v17);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X"), md[15]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v18);

  return v2;
}

@end
