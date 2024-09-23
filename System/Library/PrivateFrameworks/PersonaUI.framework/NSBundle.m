@implementation NSBundle

void __41__NSBundle_PersonaUI__pr_personaUIBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pr_personaUIBundle_personaUIBundle;
  pr_personaUIBundle_personaUIBundle = v0;

}

@end
