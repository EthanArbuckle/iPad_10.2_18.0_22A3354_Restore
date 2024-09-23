@implementation SBAmbientChoiceRow

- (void)setPossibleChoicesFromDictionary:(id)a3 order:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v12 = v7;
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v6, "allKeys", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__SBAmbientChoiceRow_setPossibleChoicesFromDictionary_order___block_invoke;
  v13[3] = &unk_1E8EAC530;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "bs_compactMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAmbientChoiceRow setPossibleValues:](self, "setPossibleValues:", v9);
  -[SBAmbientChoiceRow setPossibleTitles:](self, "setPossibleTitles:", v11);

}

uint64_t __61__SBAmbientChoiceRow_setPossibleChoicesFromDictionary_order___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

@end
