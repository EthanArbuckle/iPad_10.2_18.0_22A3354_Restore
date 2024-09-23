@implementation TIKeyboardFeatureSpecialization

void __68__TIKeyboardFeatureSpecialization_fr_accentKeyStringForInputPrefix___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BDBCF20]);
  objc_msgSend(CFSTR("aujourd c d entr j l m n prud s t y"), "componentsSeparatedByString:", CFSTR(" "));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithArray:", v3);
  v2 = (void *)-[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::apostrophePrefixes;
  -[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::apostrophePrefixes = v1;

}

void __70__TIKeyboardFeatureSpecialization_fr_accentKeyStringForKeyboardState___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::nonLetterSet;
  -[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::nonLetterSet = v0;

}

uint64_t __56__TIKeyboardFeatureSpecialization_fr_createInputManager__block_invoke(int a1, KB *this)
{
  int v2;
  uint64_t result;

  v2 = (int)this;
  LODWORD(result) = KB::character_is_word_medial_punctuation(this);
  if (v2 == 45)
    return 1;
  else
    return result;
}

void __66__TIKeyboardFeatureSpecialization_fr_terminatorsDeletingAutospace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BEB4D00]), "initWithCharactersInString:", CFSTR(",.)]}"));
  v1 = (void *)-[TIKeyboardFeatureSpecialization_fr terminatorsDeletingAutospace]::result;
  -[TIKeyboardFeatureSpecialization_fr terminatorsDeletingAutospace]::result = v0;

}

@end
