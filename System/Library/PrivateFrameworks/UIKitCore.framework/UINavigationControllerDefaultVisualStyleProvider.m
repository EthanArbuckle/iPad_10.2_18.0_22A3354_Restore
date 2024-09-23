@implementation UINavigationControllerDefaultVisualStyleProvider

void __79___UINavigationControllerDefaultVisualStyleProvider_idiomToVisualStyleClassMap__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E1A96600;
  v4[0] = objc_opt_class();
  v3[1] = &unk_1E1A96618;
  v4[1] = objc_opt_class();
  v3[2] = &unk_1E1A96630;
  v4[2] = objc_opt_class();
  v3[3] = &unk_1E1A96648;
  v4[3] = objc_opt_class();
  v3[4] = &unk_1E1A96660;
  v4[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)qword_1ECD7CAD0;
  qword_1ECD7CAD0 = v1;

}

@end
