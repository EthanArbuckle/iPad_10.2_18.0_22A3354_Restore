@implementation PGGraphAddressEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (NSDate)universalStartDate
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  if (!-[MAElementCollection count](self, "count"))
    return (NSDate *)0;
  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x7FEFFFFFFFFFFFFFLL;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PGGraphAddressEdgeCollection_universalStartDate__block_invoke;
  v5[3] = &unk_1E84345A0;
  v5[4] = &v6;
  -[MAEdgeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("utcs"), v5);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);
  return (NSDate *)v3;
}

- (unint64_t)numberOfAssets
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__PGGraphAddressEdgeCollection_numberOfAssets__block_invoke;
  v4[3] = &unk_1E84345C8;
  v4[4] = &v5;
  -[MAEdgeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("noa"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSSet)universalDateIntervals
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PGGraphAddressEdgeCollection_universalDateIntervals__block_invoke;
  v6[3] = &unk_1E84345F0;
  v4 = v3;
  v7 = v4;
  -[MAElementCollection enumerateIdentifiersAsCollectionsWithBlock:](self, "enumerateIdentifiersAsCollectionsWithBlock:", v6);

  return (NSSet *)v4;
}

void __54__PGGraphAddressEdgeCollection_universalDateIntervals__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "anyEdge");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "universalStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "universalEndDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v4, v5);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
}

uint64_t __46__PGGraphAddressEdgeCollection_numberOfAssets__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

uint64_t __50__PGGraphAddressEdgeCollection_universalStartDate__block_invoke(uint64_t result, double a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(double *)(v2 + 24) < a2)
    a2 = *(double *)(v2 + 24);
  *(double *)(v2 + 24) = a2;
  return result;
}

@end
