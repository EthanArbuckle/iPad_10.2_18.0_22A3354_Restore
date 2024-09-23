@implementation TIHistogram

- (TIHistogram)init
{
  TIHistogram *v2;
  uint64_t v3;
  NSMutableDictionary *counts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIHistogram;
  v2 = -[TIHistogram init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    counts = v2->_counts;
    v2->_counts = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)addNumber:(id)a3
{
  NSMutableDictionary *counts;
  id v5;
  void *v6;
  id v7;

  counts = self->_counts;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](counts, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "integerValue") + 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKey:](self->_counts, "setObject:forKey:", v7, v5);
  ++self->_totalCount;

}

- (int64_t)countForNumber:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKey:](self->_counts, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (id)sortedNumbers
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allKeys](self->_counts, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_2641);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enumerateNumbersUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TIHistogram sortedNumbers](self, "sortedNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__TIHistogram_enumerateNumbersUsingBlock___block_invoke;
  v7[3] = &unk_24FD48D38;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

- (void)enumerateCumulativeDistributionFunctionUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  int v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__TIHistogram_enumerateCumulativeDistributionFunctionUsingBlock___block_invoke;
  v6[3] = &unk_24FD48D60;
  v8 = v9;
  v5 = v4;
  v6[4] = self;
  v7 = v5;
  -[TIHistogram enumerateNumbersUsingBlock:](self, "enumerateNumbersUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

- (id)descriptionOfCumulativeDistributionFunction
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__TIHistogram_descriptionOfCumulativeDistributionFunction__block_invoke;
  v6[3] = &unk_24FD48D88;
  v4 = v3;
  v7 = v4;
  -[TIHistogram enumerateCumulativeDistributionFunctionUsingBlock:](self, "enumerateCumulativeDistributionFunctionUsingBlock:", v6);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counts, 0);
}

uint64_t __58__TIHistogram_descriptionOfCumulativeDistributionFunction__block_invoke(uint64_t a1, void *a2, float a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%ld : %f\n"), objc_msgSend(a2, "integerValue"), a3);
}

uint64_t __65__TIHistogram_enumerateCumulativeDistributionFunctionUsingBlock___block_invoke(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  *(float *)(*(_QWORD *)(a1[6] + 8) + 24) = *(float *)(*(_QWORD *)(a1[6] + 8) + 24) + (float)a3;
  return (*(uint64_t (**)(_QWORD, float))(a1[5] + 16))(a1[5], *(float *)(*(_QWORD *)(a1[6] + 8) + 24) / (float)*(uint64_t *)(a1[4] + 16));
}

void __42__TIHistogram_enumerateNumbersUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  (*(void (**)(uint64_t, id, uint64_t))(v2 + 16))(v2, v4, objc_msgSend(v3, "countForNumber:", v4));

}

uint64_t __28__TIHistogram_sortedNumbers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "integerValue");
  if (v6 <= objc_msgSend(v5, "integerValue"))
  {
    v8 = objc_msgSend(v4, "integerValue");
    if (v8 >= objc_msgSend(v5, "integerValue"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

@end
