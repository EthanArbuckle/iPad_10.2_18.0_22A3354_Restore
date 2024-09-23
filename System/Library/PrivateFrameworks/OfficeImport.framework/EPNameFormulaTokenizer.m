@implementation EPNameFormulaTokenizer

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
  void *v9;
  EDWorkbook **p_mWorkbook;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v15 = v6;
  objc_msgSend(v15, "formulaString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "length"))
  {
    p_mWorkbook = &self->super.mWorkbook;
    WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
    +[EXFormula edTokensForFormulaString:sheet:workbook:](EXFormula, "edTokensForFormulaString:sheet:workbook:", v9, v7, WeakRetained);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_loadWeakRetained((id *)p_mWorkbook);
    objc_msgSend(v15, "setFormula:workbook:", v12, v13);

    v14 = objc_loadWeakRetained((id *)p_mWorkbook);
    objc_msgSend(v15, "setFormulaString:workbook:", 0, v14);

  }
}

@end
