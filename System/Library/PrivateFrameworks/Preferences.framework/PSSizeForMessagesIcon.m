@implementation PSSizeForMessagesIcon

double __PSSizeForMessagesIcon_block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double result;
  id v6;

  PSBlankIconImage();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "size");
  v2 = v1;

  objc_msgSend(MEMORY[0x1E0D3A808], "iosMessagesAppIconSpecification");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxSize");
  *(double *)&PSSizeForMessagesIcon_result_0 = v2 * (v3 / v4);
  PSSizeForMessagesIcon_result_1 = *(_QWORD *)&v2;

  return result;
}

@end
