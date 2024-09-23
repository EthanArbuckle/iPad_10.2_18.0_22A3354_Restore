@implementation UINotificationFeedbackGeneratorGetAllTypes

void ___UINotificationFeedbackGeneratorGetAllTypes_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t i;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t j;
  void *v8;
  void *v9;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
  v1 = (void *)qword_1ECD7A568;
  qword_1ECD7A568 = v0;

  for (i = 0; i != 3; ++i)
  {
    v3 = (void *)qword_1ECD7A568;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  v5 = objc_msgSend((id)qword_1ECD7A568, "mutableCopy");
  v6 = (void *)qword_1ECD7A570;
  qword_1ECD7A570 = v5;

  for (j = 1000; j != 1027; ++j)
  {
    v8 = (void *)qword_1ECD7A570;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", j);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

@end
