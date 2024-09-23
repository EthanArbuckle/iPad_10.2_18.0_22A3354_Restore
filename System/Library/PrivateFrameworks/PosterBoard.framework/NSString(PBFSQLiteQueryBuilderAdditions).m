@implementation NSString(PBFSQLiteQueryBuilderAdditions)

- (id)pbf_valueForSQLiteQuery
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("%_'\\"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rangeOfCharacterFromSet:", v2);
  v4 = v3;

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 2, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("'"), CFSTR("\\'"), 2, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%"), CFSTR("\\%"), 2, 0, objc_msgSend(v5, "length"));
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("_"), CFSTR("\\_"), 2, 0, objc_msgSend(v5, "length"));

    v1 = v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
