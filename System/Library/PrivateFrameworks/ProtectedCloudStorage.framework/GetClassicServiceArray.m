@implementation GetClassicServiceArray

uint64_t __GetClassicServiceArray_block_invoke()
{
  uint64_t result;
  _QWORD v1[8];

  v1[7] = *MEMORY[0x1E0C80C00];
  v1[0] = kPCSServiceMaster;
  v1[1] = kPCSServiceBladerunner;
  v1[2] = kPCSServiceHyperion;
  v1[3] = kPCSServiceLiverpool;
  v1[4] = kPCSServiceEscrow;
  v1[5] = kPCSServiceFDE;
  v1[6] = kPCSServicePianoMover;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 7);
  result = objc_claimAutoreleasedReturnValue();
  GetClassicServiceArray_array = result;
  return result;
}

@end
