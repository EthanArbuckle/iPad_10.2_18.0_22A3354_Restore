@implementation AXElement

void __54__AXElement_AXElementTextEditing__cacPerformTextPaste__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "uiElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "performAXAction:withValue:", 2065, v4);
}

void __45__AXElement_CACElement__englishFunctionWords__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F2CF5C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)englishFunctionWords___wordSet;
  englishFunctionWords___wordSet = v0;

}

@end
