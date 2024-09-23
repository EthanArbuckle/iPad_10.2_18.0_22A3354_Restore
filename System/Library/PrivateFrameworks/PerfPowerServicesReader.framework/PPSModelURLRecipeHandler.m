@implementation PPSModelURLRecipeHandler

+ (id)eventRecipes
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)metricRecipes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("ANE::modelCompilation::modelURL");
  objc_msgSend(a1, "modelURLRecipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("ANE::modelLoad::modelURL");
  objc_msgSend(a1, "modelURLRecipe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("ANE::modelUnload::modelURL");
  objc_msgSend(a1, "modelURLRecipe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("ANE::modelInference::modelURL");
  objc_msgSend(a1, "modelURLRecipe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = CFSTR("ANE::newInstanceModelLoad::modelURL");
  objc_msgSend(a1, "modelURLRecipe");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  v11[5] = CFSTR("ANE::newInstanceModelUnload::modelURL");
  objc_msgSend(a1, "modelURLRecipe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)timeSeriesRecipes
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)modelURLRecipe
{
  return &__block_literal_global;
}

id __42__PPSModelURLRecipeHandler_modelURLRecipe__block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v5;
  void *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PPSModelURLDecoder decodeValue:withMetric:](PPSModelURLDecoder, "decodeValue:withMetric:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    *a4 = 0;
    return v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    v9 = objc_opt_class();

    objc_msgSend(v8, "stringWithFormat:", CFSTR("Recipe supports NSString, value sent %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PPSRecipeEngine"), 4, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
}

@end
