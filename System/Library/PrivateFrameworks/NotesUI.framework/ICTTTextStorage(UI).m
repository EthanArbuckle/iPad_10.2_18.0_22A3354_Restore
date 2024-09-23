@implementation ICTTTextStorage(UI)

- (void)replaceCharactersInRange:()UI withAttributedString:.cold.1(NSRange a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  NSStringFromRange(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "length");
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v4, v5, "replaceCharactersInRange:withAttributedString: input range %@ out of bound. self.length is %lu", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)replaceCharactersInRange:()UI withString:.cold.1(NSRange a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  NSStringFromRange(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "length");
  OUTLINED_FUNCTION_5(&dword_1AC7A1000, v4, v5, "replaceCharactersInRange:withString: input range %@ out of bound. self.length is %lu", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_4();
}

@end
