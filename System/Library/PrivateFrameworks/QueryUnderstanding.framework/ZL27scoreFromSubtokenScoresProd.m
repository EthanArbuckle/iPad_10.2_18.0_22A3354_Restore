@implementation ZL27scoreFromSubtokenScoresProd

float _ZL27scoreFromSubtokenScoresProd_block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  id v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20 = a2;
  if (a6 < 1)
  {
    v11 = 1.0;
  }
  else
  {
    v10 = a6 + a5;
    v11 = 1.0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3, v20, &unk_2515EDE60);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v13;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[3] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v18 = v17;

      v11 = v11 * v18;
      a5 = (a5 + 1);
    }
    while ((int)a5 < v10);
  }

  return v11;
}

@end
