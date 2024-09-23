@implementation VUITraitBaseClass

+ (id)uiTraitsFrom:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v4, "setObject:atIndexedSubscript:", +[VUITraitBaseClass uiTraitFrom:](VUITraitBaseClass, "uiTraitFrom:", objc_msgSend(v3, "objectAtIndexedSubscript:", v5)), v5);
      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }

  return v4;
}

+ (Class)uiTraitFrom:(Class)a3
{
  if ((Class)objc_opt_class() != a3 && (Class)objc_opt_class() != a3)
    objc_opt_class();
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end
