@implementation UIImageJPEGRepresentation

void ___UIImageJPEGRepresentation_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = fmax(fmin(*(double *)(a1 + 32), 1.0), 0.0);
  v7 = a2;
  objc_msgSend(v3, "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CBC780]);

  if (*(_BYTE *)(a1 + 40))
    v6 = MEMORY[0x1E0C9AAB0];
  else
    v6 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CBC7C0]);

}

@end
