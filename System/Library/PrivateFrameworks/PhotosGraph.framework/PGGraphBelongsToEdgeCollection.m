@implementation PGGraphBelongsToEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (void)enumerateImportancesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PGGraphBelongsToEdgeCollection_enumerateImportancesUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MAEdgeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("importance"), v6);

}

uint64_t __65__PGGraphBelongsToEdgeCollection_enumerateImportancesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
