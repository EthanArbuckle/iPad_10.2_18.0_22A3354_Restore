@implementation GetDroppedServiceArray

uint64_t __GetDroppedServiceArray_block_invoke()
{
  uint64_t result;
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = kPCSServiceFDE;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 1);
  result = objc_claimAutoreleasedReturnValue();
  GetDroppedServiceArray_array = result;
  return result;
}

@end
