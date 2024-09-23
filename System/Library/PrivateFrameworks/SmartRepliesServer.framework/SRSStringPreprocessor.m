@implementation SRSStringPreprocessor

+ (id)transformMessage:(id)a3 withMethods:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v7 = (void *)getSGStringPreprocessingTransformerClass_softClass;
  v18 = getSGStringPreprocessingTransformerClass_softClass;
  if (!getSGStringPreprocessingTransformerClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getSGStringPreprocessingTransformerClass_block_invoke;
    v14[3] = &unk_2518CD260;
    v14[4] = &v15;
    __getSGStringPreprocessingTransformerClass_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v8, "withMethods:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transformBatch:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
