@implementation EPFormulaCollectionCleaner

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  EPFormulaCleaner *v9;
  id WeakRetained;
  EPFormulaCleaner *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v15 = v6;
  objc_msgSend(v15, "lock");
  objc_msgSend(v15, "formulas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [EPFormulaCleaner alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
  v11 = -[EDProcessor initWithWorkbook:](v9, "initWithWorkbook:", WeakRetained);

  v12 = objc_msgSend(v8, "count");
  if (v12)
  {
    v13 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EPFormulaCleaner cleanFormula:sheet:](v11, "cleanFormula:sheet:", v14, v7);

      ++v13;
    }
    while (v12 != v13);
  }
  objc_msgSend(v15, "unlock");

}

@end
