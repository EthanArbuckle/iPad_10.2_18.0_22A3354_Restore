@implementation SUICLayerNullActions

void ___SUICLayerNullActions_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[10];
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = CFSTR("position");
  v3[1] = CFSTR("bounds");
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = CFSTR("transform");
  v3[3] = CFSTR("contents");
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = CFSTR("anchorPoint");
  v3[5] = CFSTR("opacity");
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = CFSTR("strokeStart");
  v3[7] = CFSTR("strokeEnd");
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = CFSTR("strokeColor");
  v3[9] = CFSTR("fillColor");
  v4[8] = v0;
  v4[9] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 10);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_SUICLayerNullActions_actions;
  _SUICLayerNullActions_actions = v1;

}

@end
