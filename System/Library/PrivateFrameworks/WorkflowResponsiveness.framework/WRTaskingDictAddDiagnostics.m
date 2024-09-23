@implementation WRTaskingDictAddDiagnostics

void ___WRTaskingDictAddDiagnostics_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("is_new")) & 1) == 0
    && (!objc_msgSend(v7, "isEqualToString:", CFSTR("name"))
     || (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 40), v7);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v5, v6);

  }
}

@end
