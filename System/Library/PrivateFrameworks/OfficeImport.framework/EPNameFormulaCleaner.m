@implementation EPNameFormulaCleaner

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
  EPFormulaCleaner *v5;
  id WeakRetained;
  EPFormulaCleaner *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = [EPFormulaCleaner alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
  v7 = -[EDProcessor initWithWorkbook:](v5, "initWithWorkbook:", WeakRetained);

  objc_msgSend(v9, "formula");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EPFormulaCleaner cleanFormula:name:](v7, "cleanFormula:name:", v8, v9);

}

@end
